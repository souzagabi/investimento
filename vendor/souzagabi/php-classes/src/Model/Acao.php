<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    
    class Acao extends Model {

        public static function listAllAction($list)
        {
            $sql = new Sql();
<<<<<<< HEAD
            $list["start"] = 1;
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            
            $list["limit"] = (isset($list["limit"]) && $list["limit"] != '') ? $list["limit"] : 10;
           
            $list["start"] = ($pg - 1) * $list["limit"] + 1;
           
            foreach ($list as $key => $value) 
            {
=======
            $start = '';
           
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            if ($list["limit"] > 1) {
                $start = ($pg - 1) * $list["limit"] + 1;
                $list["start"] = $start;
            }
            foreach ($list as $key => $value) {
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
                if ($value != '') {
                    $l[$key] = $value;
                }else {
                    $l[$key] = '';
                }
<<<<<<< HEAD
            }
            
            if(isset($list["listacoes"]) && $list["listacoes"] === "listacoes")
            {
                return $sql->select("CALL sp_acoes_list(:start, :limit)", array(
                    ":start"=> $l["start"],
                    ":limit"=> $l["limit"],
                ));
            }
        }
        public static function listAll($list)
        {
            $sql = new Sql();
            $list["start"] = 1;
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            
            $list["limit"] = (isset($list["limit"]) && $list["limit"] != '') ? $list["limit"] : 10;
            $list["start"] = ($pg - 1) * $list["limit"] + 1;
            foreach ($list as $key => $value) 
            {
                if ($value != '') {
                    $l[$key] = $value;
                }else {
                    $l[$key] = '';
                }
            }
          
            return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                ":sgcompany" => $l["sgcompany"],   
                ":dtbuy"     => $l["dtbuy"],
                ":dtsell"    => $l["dtsell"],
                ":start"     => $l["start"],
                ":limit"     => $l["limit"]
            ));
=======
            }
         
            if($list["listacoes"] === "listacoes"){
                
                return $sql->select("CALL sp_acoes_list()");
            }
            
            if($list["notas"] === "notas"){
                print_r($list);
                print_r("notas");
                
                return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                    ":sgcompany"    => $l["sgcompany"],
                    ":dtbuy"        => $l["dtbuy"],
                    ":dtsell"       => $l["dtsell"],
                    ":start"        => $l["start"],
                    ":limit"        => $l["limit"]
                ));
            } else 
            {
                
                print_r($l);
                print_r("list3");
                return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                    ":sgcompany" => $l["sgcompany"],   
                    ":dtbuy"     => $l["dtbuy"],
                    ":dtsell"    => $l["dtsell"],
                    ":start"     => $l["start"],
                    ":limit"     => $l["limit"]
                ));
            }
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
        }

        public static function listAllEstoque($list)
        {
            $sql = new Sql();
            $list["start"] = 1;
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            
            $list["limit"] = (isset($list["limit"]) && $list["limit"] != '') ? $list["limit"] : 10;
            $list["start"] = ($pg - 1) * $list["limit"] + 1;
            foreach ($list as $key => $value) 
            {
                if ($value != '') {
                    $l[$key] = $value;
                }else {
                    $l[$key] = '';
                }
            }
           
            if (isset($list) && $list != '') {
               
                if (count($list) >= 3) {
                    
                    return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                        ":sgcompany"    => $l["sgcompany"],    
                        ":dtbuy"        => $l["dtbuy"],
                        ":dtsell"       => $l["dtsell"],
                        ":start"        => $l["start"],
                        ":limit"        => $l["limit"]
                    ));
                } else if ($data[0] === "sgcompany") {
                    return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                        ":sgcompany"    => $l["sgcompany"],    
                        ":dtbuy"        => $l["dtbuy"],
                        ":dtsell"       => $l["dtsell"],
                        ":start"        => $l["start"],
                        ":limit"        => $l["limit"]
                    ));
                
                } else {
                    return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                        ":sgcompany"    => $l["sgcompany"],    
                        ":dtbuy"        => $l["dtbuy"],
                        ":dtsell"       => $l["dtsell"],
                        ":start"        => $l["start"],
                        ":limit"        => $l["limit"]
                    ));
                }
            } else{ // (isset($listestoque) && $listestoque != '')
                return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                    ":sgcompany"    => $l["sgcompany"],    
                    ":dtbuy"        => $l["dtbuy"],
                    ":dtsell"       => $l["dtsell"],
                    ":start"        => $l["start"],
                    ":limit"        => $l["limit"]
                ));
            }
        }

        //não está sendo usada
        public function getByPerson($idperson) 
        {
            $sql = new Sql();
            
            $results = $sql->select("CALL sp_acoes_person(:idperson)", array(
            ":idperson"=>$idperson
            ));
            
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
        
        public function convertToInt($object = array())
        {
            if (isset($object[0]["pgs"])) {
                for ($i=0; $i < count($object); $i++) { 
                    $object[$i]["pgs"] = ceil($object[$i]["pgs"]);
                }
                return $object;
            }
            return false;
        }

        public function countRegister($qtdeRegister, $company)
        {
            for ($j=0; $j < $qtdeRegister - 1; $j++) { 
                $pgs[$j]    = $j;
            }
            foreach ($company as $key => $value) {
                $pgs["list"][$key] = $value;
<<<<<<< HEAD
            }
            return $pgs;
        }
        public function selectRegister($act = array())
        {
            if (isset($act["listacoes"]) && $act["listacoes"] == "listacoes") {
                $acoes = Acao::listAllAction($act);
            } else if (isset($act["listestoque"]) && $act["listestoque"] == "listestoque") {
                $acoes = Acao::listAllEstoque($act);
                $acoes 	= Acao::convertDateToView($acoes);
            } else {
                $acoes 	= Acao::listAll($act);
                $acoes 	= Acao::convertDateToView($acoes);
                $acoes 	= Acao::convertToInt($acoes);
            }
          
            $pgs = [];
=======
            }
            print_r($pgs);
           /* if (isset($company) || ($company != NULL && $company != '')) {
                $pgs["list"]    = $pgs["list"]+["sgcompany"  => $company];
                $pgs["list"]    = $pgs["list"]+["search"     => "Search"];
                //var_dump($pgs); exit;
            }
            if ($dt != '' && $dt != NULL) 
            {
                $d = explode("_", $dt);
                $pgs["list"]    = $pgs["list"]+["dtbuy"=> $d[0]];
                $pgs["list"]    = $pgs["list"]+["dtsell"=> $d[1]];
            }*/
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
            
            if (isset($acoes[0]["pgs"]) && count($acoes) > 0 && $acoes != '') {
                $pgs 	= Acao::countRegister($acoes[0]["pgs"], $act);
            }
            return [$acoes, $pgs];
        }
    }
?>
