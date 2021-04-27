<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    
    class Acao extends Model {

        public static function listAll($listacoes,$limit)
        {
            $sql = new Sql();
            $start = '';
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            if ($limit > 1) {
                $start = ($pg - 1) * $limit + 1;
            }
         
            if($listacoes === "listacoes"){
                return $sql->select("CALL sp_acoes_list()");
            }
            if($listacoes === "notas"){
                return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                    ":sgcompany" => '',    
                    ":dtbuy"     => '',
                    ":dtsell"    => '',
                    ":start"     => $start,
                    ":limit"     => $limit
                ));
            }
            if (isset($listacoes)) {
                $data = explode("_", $listacoes);
                //var_dump($data);exit;
                
                if (count($data) === 3) {
                    return $sql->select("CALL sp_acoes_select_teste(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => $data[0],    
                        ":dtbuy"     => $data[1],
                        ":dtsell"    => $data[2]
                    ));
                }
                if ($data[0] === "sgcompany") {
                    return $sql->select("CALL sp_acoes_select_teste(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => $data[1],    
                        ":dtbuy"     => '',
                        ":dtsell"    => ''
                    ));
                
                } else {
                    return $sql->select("CALL sp_acoes_select_teste(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => '',    
                        ":dtbuy"    =>$data[0],
                        ":dtsell"   =>$data[1]
                    ));
                }
            }
        }

        public static function listAllEstoque($listestoque, $limit)
        {
            $sql = new Sql();
            
            if (isset($listestoque)) {
                $data = explode("_", $listestoque);
                
                if (count($data) === 3) {
                    
                    return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => $data[0],    
                        ":dtbuy"     => $data[1],
                        ":dtsell"    => $data[2]
                    ));
                }
                if ($data[0] === "sgcompany") {
                    return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => $data[1],    
                        ":dtbuy"     => '',
                        ":dtsell"    => ''
                    ));
                
                } else {
                    return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => '',    
                        ":dtbuy"=>$data[0],
                        ":dtsell"=>$data[1]
                    ));
                }
            }
        }

        //não está sendo usada
        public function getByPerson($idperson) 
        {
            $sql = new Sql();
            
            $results = $sql->select("CALL sp_acoes_person(:idperson)", array(
            ":idperson"=>$idperson
            ));
            var_dump($results);exit;
            if (isset($results[0]["tax"])) {
                $results[0]["tax"] = $results[0]["tax"]." %";
            }
            if (isset($results[0]["dtbuy"])) {
                $results[0]["dtbuy"] = $this->convertDateView($results[0]["dtbuy"]);
            }
            if (isset($results[0]["dtsell"])) {
                $results[0]["dtsell"] = $this->convertDateView($results[0]["dtsell"]);
            }
            $data = $results[0];
            
            $this->setData($data);
        }

        public function getByBuy($idinvestiment) 
        {
            $sql = new Sql();
            //$id = explode("_", $idinvestiment);
                        
            $results = $sql->select("CALL sp_acoes_select_buy(:idinvestiment)", array(
                ":idinvestiment"=>(int)$idinvestiment
            ));
            
            if (isset($results[0]["tax"]) && $results[0]["tax"] > 0) {
                $results[0]["tax"] = $results[0]["tax"]." %";
            }
            $results[0]["unit"] = "unit";
                 
            $results[0] = Acao::convertDateToView($results[0]);
            $data = $results[0];
            
            $this->setData($data);
        }

        public function save()
        {
            $sql = new Sql();
          
            $results = $sql->select("CALL sp_acoes_save_buy(:iduser, :desperson, :sgcompany, :descnpj, :dtbuy, :qtdebuy, :prcbuy, :tlbuy, :tptransaction, :tipe, :prcaverage)", array(
                ":iduser"           => $this->getiduser(),    
                ":desperson"        => $this->getdesperson(),    
                ":sgcompany"        => $this->getsgcompany(),    
                ":descnpj"          => $this->getdescnpj(),    
                ":dtbuy"            => $this->getdtbuy(),
                ":qtdebuy"          => $this->getqtdebuy(),
                ":prcbuy"           => $this->getprcbuy(),
                ":tlbuy"            => $this->gettlbuy(),
                ":tptransaction"    => $this->gettptransaction(),
                ":tipe"             => $this->gettipe(),
                ":prcaverage"       => $this->getprcaverage()
            ));
            
            $this->setData($results);
        }
        
        public function update()
        {
            $sql = new Sql();
            $qtdeTotal = ["qtdetotal"=>$this->getqtdetotal() + $this->getqtdebuy() - $this->getqtdesell()];
           
            $this->setData($qtdeTotal);

            $results = $sql->select("CALL sp_acoes_update_save(:idinvestiment,:idperson, :iduser, :desperson, :sgcompany, :descpfcnpj, :dtbuy, :dtsell, :qtdebuy, :qtdesell, :prcbuy, :prcsell, :tlbuy, :tlsell, :tax, :lucre, :tipe, :idestoque, :sgecompany, :qtdeestoque, :tptransaction, :iprcaverage)", array(
                    ":idinvestiment"    => $this->getidinvestiment(),
                    ":idperson"         => $this->getidperson(),
                    ":iduser"           => $this->getiduser(),   
                    ":desperson"        => $this->getdesperson(),    
                    ":sgcompany"        => $this->getsgcompany(),    
                    ":descpfcnpj"       => $this->getdescpfcnpj(),    
                    ":dtbuy"            => $this->getdtbuy(),
                    ":dtsell"           => $this->getdtsell(),
                    ":qtdebuy"          => $this->getqtdebuy(),
                    ":qtdesell"         => $this->getqtdesell(),
                    ":prcbuy"           => $this->getprcbuy(),
                    ":prcsell"          => $this->getprcsell(),
                    ":tlbuy"            => $this->gettlbuy(),
                    ":tlsell"           => $this->gettlsell(),
                    ":tax"              => $this->gettax(),
                    ":lucre"            => $this->getlucre(),
                    ":tipe"             => $this->gettipe(),
                    ":idestoque"        => $this->getidestoque(),
                    ":sgecompany"       => $this->getsgecompany(),
                    ":qtdeestoque"      => $this->getqtdetotal(),
                    ":tptransaction"    => $this->gettptransaction(),
                    ":iprcaverage"      => $this->getiprcaverage()
            ));
           
            $this->setData($results);
        }

        public function delete()
        {
            $sql = new Sql();
            
            $sql->query("CALL sp_acoes_delete(:idinvestiment, :idestoque, :qtdetotal)", array(
                ":idinvestiment"    =>$this->getidinvestiment(),
                ":idestoque"        =>$this->getidestoque(),
                ":qtdetotal"        =>$this->getqtdetotal()
            ));
        }
        
        public function convertDateToView($object = array())
        {
            if (isset($object["unit"])) {
                
                for ($i=0; $i < count($object); $i++) { 
                    if (isset($object["dtbuy"]) && $object["dtbuy"] != '') {
                        $object["dtbuy"] =  Acao::convertDateView($object["dtbuy"]);
                    }
                    if (isset($object["dtsell"]) && $object["dtsell"] != '') {
                        $object["dtsell"] =     Acao::convertDateView($object["dtsell"]);
                    }
                }
                
            } else
            {
                for ($i=0; $i < count($object); $i++) { 
                    if (isset($object[$i]["dtbuy"]) && $object[$i]["dtbuy"] != '') {
                        $object[$i]["dtbuy"] =  Acao::convertDateView($object[$i]["dtbuy"]);
                    }
                    if (isset($object[$i]["dtsell"]) && $object[$i]["dtsell"] != '') {
                        $object[$i]["dtsell"] =     Acao::convertDateView($object[$i]["dtsell"]);
                    }
                }
            }
            
            return $object;
        }
        
        public function convertDateToDataBase($object = array())
        {
            for ($i=0; $i < count($object); $i++) { 
                if (isset($object["dtbuy"]) && $object["dtbuy"] !='') {
                    $object["dtbuy"] =  Acao::convertDateDataBase($object["dtbuy"]);
                }
                if (isset($object["dtsell"]) && $object["dtsell"] !='') {
                    $object["dtsell"] =     Acao::convertDateDataBase($object["dtsell"]);
                }
            }
            return $object;
           
        }

        public function convertDateView($date)
        {
            return $data = date("d-m-Y", strToTime($date));
        }

        public function convertDateDataBase($date)
        {
            return $data = date("Y-m-d", strToTime($date));
        }
        
        public function convertToInt($object = array()){
            for ($i=0; $i < count($object); $i++) { 
				$object[$i]["pgs"] = ceil($object[$i]["pgs"]);
            }
            return $object;
        }
    }
?>
