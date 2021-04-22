<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    
    class Acao extends Model {

        public static function listAll($listacoes)
        {
            $sql = new Sql();
            
            if($listacoes === "listacoes"){
                return $sql->select("SELECT * 
                FROM tb_persons p 
                INNER JOIN tb_estoques e USING(idperson) 
                WHERE e.qtdeestoque > 0 ORDER BY e.sgecompany;
                SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) ORDER BY i.idinvestiment;");
            }
            if($listacoes === "notascompra" || $listacoes === "notasvenda"){
                return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell)", array(
                    ":sgcompany" => '',    
                    ":dtbuy"     => '',
                    ":dtsell"    => ''
                ));
            }

            if (isset($listacoes)) {
                $data = explode("_", $listacoes);
                
                if (count($data) === 3) {
                    
                    return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => $data[0],    
                        ":dtbuy"     => $data[1],
                        ":dtsell"    => $data[2]
                    ));
                }
                if ($data[0] === "sgcompany") {
                    return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => $data[1],    
                        ":dtbuy"     => '',
                        ":dtsell"    => ''
                    ));
                
                } else {
                    return $sql->select("CALL sp_acoes_select(:sgcompany, :dtbuy, :dtsell)", array(
                        ":sgcompany" => '',    
                        ":dtbuy"=>$data[0],
                        ":dtsell"=>$data[1]
                    ));
                }
            }
        }

        public static function listAllEstoque($listestoque)
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

        public function getByPerson($idperson) 
        {
            $sql = new Sql();
            
            $results = $sql->select("SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) WHERE p.idperson = :idperson AND e.qtdeestoque > 0", array(
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
            $id = explode("_", $idinvestiment);
            
            if ($id[1] == 'C') 
            {
                $results = $sql->select("SELECT *, sum(e.qtdeestoque - i.qtdebuy + i.qtdesell) AS qtdetotal FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) WHERE i.idinvestiment = :idinvestiment", array(
                    ":idinvestiment"=>(int)$id[0]
                ));
            } else 
            {
                $results = $sql->select("SELECT p.idperson, p.desperson, p.descpfcnpj , i.idinvestiment, i.sgcompany, i.dtbuy, i.dtsell, i.qtdebuy, i.prcbuy, i.iprcaverage, i.qtdesell, i.prcsell, 
                                i.tlsell, i.tptransaction, i.tipe, i.lucre, i.tax, e.idestoque,
                                (SELECT sum(tlbuy) FROM tb_investiments WHERE idperson = p.idperson) AS tlbuy , 
                                sum(e.qtdeestoque + i.qtdesell - i.qtdebuy) AS qtdetotal
                                FROM tb_persons p 
                                INNER JOIN tb_investiments i USING(idperson) 
                                INNER JOIN tb_estoques e USING(idperson) 
                                WHERE i.idinvestiment = :idinvestiment", array(
                    ":idinvestiment"=>(int)$id[0]
                ));
            }
            
            if ($results[0]["tax"] > 0) {
                $results[0]["tax"] = $results[0]["tax"]." %";
            }
            if ($results[0]["dtbuy"]) {
                $results[0]["dtbuy"] = $this->convertDateView($results[0]["dtbuy"]);
            }
            if ($results[0]["dtsell"]) {
                $results[0]["dtsell"] = $this->convertDateView($results[0]["dtsell"]);
            }
            $data = $results[0];
            
            $this->setData($data);
        
        }

        public function convertDate($object = array())
        {
            for ($i=0; $i < count($object); $i++) { 
                if (isset($object[$i]["dtbuy"])) {
                    $object[$i]["dtbuy"] = Acao::convertDateView($object[$i]["dtbuy"]);
                }
                if (isset($object[$i]["dtsell"])) {
                    $object[$i]["dtsell"] = Acao::convertDateView($object[$i]["dtsell"]);
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
        
        public function save_buy()
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

        public function save_sell()
        {
            $sql = new Sql();
            
            $results = $sql->select("CALL sp_acoes_save_sell(:iduser, :desperson, :sgcompany, :dtsell, :qtdesell, :prcsell, :tlsell, :tptransaction, :tipe, :prcaverage)", array(
                ":iduser"           => $this->getiduser(),    
                ":desperson"        => $this->getdesperson(),    
                ":sgcompany"        => $this->getsgcompany(),    
                ":dtsell"           => $this->getdtsell(),
                ":qtdesell"         => $this->getqtdesell(),
                ":prcsell"          => $this->getprcsell(),
                ":tlsell"           => $this->gettlsell(),
                ":tptransaction"    => $this->gettptransaction(),
                ":tipe"             => $this->gettipe(),
                ":prcaverage"       => $this->getprcaverage()
            ));
            
            $this->setData($results);
        }
        
        public function update()
        {
            $sql = new Sql();
            if ($this->tptransaction() == 'C') {
                $qtdeTotal = ["qtdetotal"=>$this->getqtdetotal() + $this->getqtdebuy() - $this->getqtdesell()];
            } else {
                $qtdeTotal = ["qtdetotal"=>$this->getqtdetotal() - $this->getqtdesell() + $this->getqtdebuy()];
            }
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
    }
    
?>