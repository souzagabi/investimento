<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    use \Acao\Model\Metodo;
    
    class Acao extends Model {

        public static function listAllIds()
        {
            $sql = new Sql();
            return $sql->select("CALL sp_acoes_list_all_id()");
        }
        public static function listAllAction($list)
        {
            $sql = new Sql();
            $list["start"] = 1;
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            
            $list["limit"] = (isset($list["limit"]) && $list["limit"] != '') ? $list["limit"] : 10;
           
            $list["start"] = ($pg - 1) * $list["limit"];
           
            return $sql->select("CALL sp_acoes_list(:start, :limit)", array(
                ":start"=> $list["start"],
                ":limit"=> $list["limit"],
            ));
        }
        public static function listAll($list)
        {
            $sql = new Sql();
            
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            $list["limit"] = (isset($list["limit"]) && $list["limit"] != '') ? $list["limit"] : 10;
            $list["start"] = ($pg - 1) * $list["limit"];
            
            
            foreach ($list as $key => $value) 
            {
                if (isset($value) && ($value != '' || $value != NULL)) {
                    $l[$key] = $value;
                }else if (!isset($value) || ($value == '' || $value == NULL)){
                    $l[$key] = '';
                }
            }
            if ($l["start"] == 1 || $l["start"] == '' ) {
                $l["start"] = 0;
            }
           
            $results = $sql->select("CALL sp_acoes_select_inv_buy_sell(:psgcompany, :pdtbuy, :pdtsell, :pstart, :plimit)", array(
                ":psgcompany" => $l["sgcompany"],   
                ":pdtbuy"     => $l["dtbuy"],
                ":pdtsell"    => $l["dtsell"],
                ":pstart"     => $l["start"],
                ":plimit"     => $l["limit"]
            ));
          
            return $results;
         
        }

        public static function listAllEstoque($list)
        {
            $sql = new Sql();
            $list["start"] = 0;
            $pg = isset($_GET["pg"]) ? $_GET["pg"] : 1;
            
            $list["limit"] = (isset($list["limit"]) && $list["limit"] != '') ? $list["limit"] : 10;
            $list["start"] = ($pg - 1) * $list["limit"];
               
            return $sql->select("CALL sp_acoes_select_estoque(:sgcompany, :dtbuy, :dtsell, :start, :limit)", array(
                ":sgcompany"    => $list["sgcompany"],    
                ":dtbuy"        => $list["dtbuy"],
                ":dtsell"       => $list["dtsell"],
                ":start"        => $list["start"],
                ":limit"        => $list["limit"]
            ));
            
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
            
            $results = $sql->select("CALL sp_acoes_select_buy(:idinvestiment)", array(
                ":idinvestiment"=>$idinvestiment
            ));
            $results[0]["qtdetotal"] = $results[0]["qtdetotal"] + $results[0]["qtdesell"] - $results[0]["qtdebuy"];         
            
            if (isset($results[0]["tax"]) && $results[0]["tax"] > 0) {
                $results[0]["tax"] = $results[0]["tax"]." %";
            }

            $results[0]["unit"] = "unit";
            
            $results[0] = Metodo::convertDateToView($results[0]);
         
            $this->setData($results[0]);
            
        }

        public function save()
        {
            $sql = new Sql();
                   
            echo '<pre>';
            print_r($this);
            echo '</pre>';exit;
            
            $results = $sql->select("CALL sp_acoes_save(:iduser,:desperson,:sgcompany,:descpfcnpj,:dtbuy,:qtdebuy,:prcbuy,:tlbuy,:btptransaction,:btipe,:bprcaverage,:dtsell,:qtdesell,:prcsell,:tlsell,:sprcaverage,:stptransaction,:stipe,:tax,:lucre)", array(
           // $results = $sql->select("CALL sp_acoes_save_buy(:iduser, :desperson, :sgcompany, :descpfcnpj, :dtbuy, :qtdebuy, :prcbuy, :tlbuy, :btptransaction, :btipe, :bprcaverage)", array(
                ":iduser"           => $this->getiduser(),    
                ":desperson"        => $this->getdesperson(),    
                ":sgcompany"        => $this->getsgcompany(),    
                ":descpfcnpj"       => $this->getdescpfcnpj(),    
                ":dtbuy"            => $this->getdtbuy(),
                ":qtdebuy"          => $this->getqtdebuy(),
                ":prcbuy"           => $this->getprcbuy(),
                ":tlbuy"            => $this->gettlbuy(),
                ":btptransaction"   => $this->getbtptransaction(),
                ":btipe"            => $this->getbtipe(),
                ":bprcaverage"      => $this->getbprcaverage(),
                ":dtsell"           => $this->getdtsell(),
                ":qtdesell"         => $this->getqtdesell(),
                ":prcsell"          => $this->getprcsell(),
                ":tlsell"           => $this->gettlsell(),
                ":sprcaverage"      => $this->getsprcaverage(),
                ":stptransaction"   => $this->getstptransaction(),
                ":stipe"            => $this->getstipe(),
                ":tax"              => $this->gettax(),
                ":lucre"            => $this->getlucre()

            ));
            
            $this->setData($results);
            print_r($results);//exit;
            return $results[0]["MESSAGE"];
        }
        
        public function update()
        {
            $sql = new Sql();
            // $qtdeTotal  = $this->getqtdetotal() + $this->getprcsell();
            // echo '<pre>';
            // print_r($qtdeTotal);
            // echo '</pre>';
            // $this->setData($qtdeTotal);
            
            if ($this->getqtdetotal() == 0) {
                $average    = ["prcaverage"=>'0'];
                $this->setData($average);
            }
                     
            $results = $sql->select("CALL sp_acoes_update_save(:idinvestiment,:idperson,:iduser,:idsgcompany,:desperson,:sgcompany,:descpfcnpj,:dtbuy,:qtdebuy,:prcbuy,:tlbuy,:bprcaverage,:btptransaction,:btipe,:dtsell,:qtdesell,:prcsell,:tlsell,:sprcaverage,:stptransaction,:stipe,:tax,:lucre,:idestoque,:sgecompany,:prcaverage,:qtdeestoque)", array(
                                ":idinvestiment"    => $this->getidinvestiment(),
                                ":idperson"         => $this->getidperson(),   
                                ":iduser"           => $this->getiduser(),
                                ":idsgcompany"      => $this->getidsgcompany(),
                                ":desperson"        => $this->getdesperson(),    
                                ":sgcompany"        => $this->getsgcompany(),    
                                ":descpfcnpj"       => $this->getdescpfcnpj(),    
                                ":dtbuy"            => $this->getdtbuy(),
                                ":qtdebuy"          => $this->getqtdebuy(),
                                ":prcbuy"           => $this->getprcbuy(),
                                ":tlbuy"            => $this->gettlbuy(),
                                ":bprcaverage"      => $this->getbprcaverage(),
                                ":btptransaction"   => $this->getbtptransaction(),
                                ":btipe"            => $this->getbtipe(),
                                ":dtsell"           => $this->getdtsell(),
                                ":qtdesell"         => $this->getqtdesell(),
                                ":prcsell"          => $this->getprcsell(),
                                ":tlsell"           => $this->gettlsell(),
                                ":sprcaverage"      => $this->getsprcaverage(),
                                ":stptransaction"   => $this->getstptransaction(),
                                ":stipe"            => $this->getstipe(),
                                ":tax"              => $this->gettax(),
                                ":lucre"            => $this->getlucre(),
                                ":idestoque"        => $this->getidestoque(),
                                ":sgecompany"       => $this->getsgecompany(),
                                ":prcaverage"       => $this->getprcaverage(),
                                ":qtdeestoque"      => $this->getqtdetotal()
                        
            ));
           
            $this->setData($results[0]);
           
            return $results[0]["MESSAGE"];
        }

        public function delete()
        {
            $sql = new Sql();
            
            $results = $sql->query("CALL sp_acoes_delete(:idinvestiment, :idestoque, :qtdetotal)", array(
                ":idinvestiment"    =>$this->getidinvestiment(),
                ":idestoque"        =>$this->getidestoque(),
                ":qtdetotal"        =>$this->getqtdetotal()
            ));

            $this->setData($results);
            return $results[0]["MESSAGE"];
        }
        
        
    }
?>
