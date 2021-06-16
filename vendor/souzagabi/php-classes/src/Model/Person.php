<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    use \Acao\Mailer;
    
    class Person extends Model {
        public static function listAll()
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

                       
            return $sql->select("CALL sp_persons_select(:start, :limit)", array(
                ":start"=>$l["start"],
                ":limit"=>$l["limit"]
            ));
        }

        public function get($idperson) 
        {
            $sql = new Sql();
            
            $results = $sql->select("SELECT * FROM tb_persons WHERE idperson = :idperson", array(
            ":idperson"=>$idperson
            ));
            
            $data = $results[0];
            
            $this->setData($data);
        }

        public function update()
        {
            $sql = new Sql();
                                                     
            $results = $sql->select("CALL sp_persons_update_save(:idperson, :desperson, :sgcompany, :descpfcnpj)", array(
                ":idperson"         => $this->getidperson(),
                ":desperson"        => $this->getdesperson(),   
                ":sgcompany"        => $this->getsgcompany(),   
                ":descpfcnpj"       => $this->getdescpfcnpj()
            ));
           
            $this->setData($results);
        }

        public function delete()
        {
            $sql = new Sql();
            
            $sql->query("CALL sp_persons_delete(:idperson)", array(
                ":idperson"=>$this->getidperson()
            ));
        }
    }
?>