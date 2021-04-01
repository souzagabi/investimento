<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    
    class Acao extends Model {

        public static function listAll(){
            $sql = new Sql();
            return $sql->select("SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) WHERE e.qtdeestoque > 0 ORDER BY e.sgecompany");
        }

        public function getByPerson($idperson) {
        
            $sql = new Sql();
            
            var_dump($idperson);
            $results = $sql->select("SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) WHERE p.idperson = :idperson AND e.qtdeestoque > 0", array(
            ":idperson"=>$idperson
            ));
            if ($results[0]["tax"] > 0) {
                $results[0]["tax"] = $results[0]["tax"]." %";
            }
            if ($results[0]["dtbuy"]) {
                $results[0]["dtbuy"] = $this->convertDate($results[0]["dtbuy"]);
            }
            if ($results[0]["dtsell"]) {
                $results[0]["dtsell"] = $this->convertDate($results[0]["dtsell"]);
            }
            $data = $results[0];
            
            $this->setData($data);
        
        }
        public function getByBuy($idinvestiment) {
        
            $sql = new Sql();
            
            $results = $sql->select("SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) WHERE i.idinvestiment = :idinvestiment", array(
                ":idinvestiment"=>$idinvestiment
            ));
            
            if ($results[0]["tax"] > 0) {
                $results[0]["tax"] = $results[0]["tax"]." %";
            }
            if ($results[0]["dtbuy"]) {
                $results[0]["dtbuy"] = $this->convertDate($results[0]["dtbuy"]);
            }
            if ($results[0]["dtsell"]) {
                $results[0]["dtsell"] = $this->convertDate($results[0]["dtsell"]);
            }
            $data = $results[0];
            
            $this->setData($data);
        
        }
        public function convertDateView($date){
            return $data = date("d-m-Y", strToTime($date));
        }
        public function convertDateDataBase($date){
            return $data = date("Y-m-d", strToTime($date));
        }
        
        public function save(){
            $sql = new Sql();

            $results = $sql->select("CALL sp_acoes_save(:iduser, :descompany, :sgcompany, :descnpj, :dtbuy, :dtsell, :qtdebuy, :qtdesell, :prcbuy, :prcsell, :tlbuy, :tlsell, :tax, :lucre, :tipe)", array(
                ":iduser"      => $this->getiduser(),    
                ":descompany"  => $this->getdescompany(),    
                ":sgcompany"   => $this->getsgcompany(),    
                ":descnpj"     => $this->getdescnpj(),    
                ":dtbuy"       => $this->getdtbuy(),
                ":dtsell"      => $this->getdtsell(),
                ":qtdebuy"     => $this->getqtdebuy(),
                ":qtdesell"    => $this->getqtdesell(),
                ":prcbuy"      => $this->getprcbuy(),
                ":prcsell"     => $this->getprcsell(),
                ":tlbuy"       => $this->gettlbuy(),
                ":tlsell"      => $this->gettlsell(),
                ":tax"         => $this->gettax(),
                ":lucre"       => $this->getlucre(),
                ":tipe"        => $this->gettipe()
            ));
            
            $this->setData($results);
        }
        
        public function update(){
            $sql = new Sql();
            
            $results = $sql->select("CALL sp_acoesupdate_save(:idinvestiment,:idperson, :iduser, :descompany, :sgcompany, :descnpj, :dtbuy, :dtsell, :qtdebuy, :qtdesell, :prcbuy, :prcsell, :tlbuy, :tlsell, :tax, :lucre, :tipe)", array(
                ":idinvestiment"    => $this->getidinvestiment(),
                ":idperson"         => $this->getidperson(),
                ":iduser "          => $this->getiduser(),   
                ":descompany"       => $this->getdescompany(),    
                ":sgcompany"        => $this->getsgcompany(),    
                ":descnpj"          => $this->getdescnpj(),    
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
                ":tipe"             => $this->gettipe()
            ));
           
            $this->setData($results);

        }

        public function delete(){
            $sql = new Sql();
            $sql->query("CALL sp_users_delete(:iduser)", array(
                ":iduser"=>$this->getiduser()
            ));
        }
        public static function getForgot($email){
            $sql = new Sql();
            $results = $sql->select("
                SELECT * FROM tb_persons a
                INNER JOIN tb_users b USING(idperson)
                WHERE a.desemail = :email",
                 array(
                     ":email"=>$email
            ));
            if(count($results) === 0){
                throw new \Exception("Não foi pssível recuperar a senha.");
            } else {
                $data = $results[0];
                $results2 = $sql->select("CALL sp_userspasswordsrecoveries_create(:iduser, :desid)", array(
                    ":iduser"=>$data["iduser"],
                    ":desid"=>$_SERVER["REMOTE_ADDR"]
                ));
                if (count($results2) === 0) {
                    throw new \Exception("Não foi pssível recuperar a senha.");
                } else {
                    $dataRecovery = $results2[0];
                    $ivlen = openssl_cipher_iv_length("aes-256-ctr");
                    $iv = openssl_random_pseudo_bytes($ivlen);
                    $code = base64_encode(openssl_encrypt($dataRecovery["idrecovery"], "aes-256-ctr", USER::SECRET, 0, $iv));
                    $link = "http://www.gbsuporte.com.br:99/admin/forgot/reset?code=$code";
                    $mailer = new Mailer($data["desemail"], $data["desperson"], "Redefinir senha do aplicativo", "forgot", 
                        array(
                            "name"=>$data["desperson"],
                            "link"=>$link
                    ));

                    $mailer->send();

                    return $data;
                }
            }
        }

        public static function validForgotDecrypt($code){
            $ivlen = openssl_cipher_iv_length("aes-256-ctr");
            $iv = openssl_random_pseudo_bytes($ivlen);
            $idrecovery = openssl_decrypt(base64_decode($code), "aes-256-ctr", USER::SECRET, 0, $iv);
            $sql = new Sql();
            $results = $sql->select("
                SELECT *
                FROM tb_userspasswordsrecoveries a
                INNER JOIN tb_users b USING(iduser)
                INNER JOIN tb_persons c USING(idperson)
                WHERE
                    a.idrecovery = :idrecovery
                    AND
                    AND
                    a.dtrecovery IS NULL
                    AND
                    DATE_ADD(a.dtregister, INTERVAL 1 HOUR) >= NOW();
            ", array(
                ":idrecovery"=>$idrecovery
            ));

            if (count($results) === 0) {
                throw new \Exception("Não foi possível recuperar a senha.");
            } else {
                return $results[0];
            }
        }

        public static function setForgotUsed($idrecovery){
            $sql = new Sql();
            $sql->query("UPDATE tb_userspasswordsrecoveries SET dtrecovery = NOW() WHERE idrecovery = :idrecovery", array(
                ":idrecovery"=>$idrecovery
            ));
        }

        public function setPassword($password){
            $aql = new Sql();
            $sql->query("UPDATE tb_users SET despassword = :password WHERE iduser = :udsuser", array(
                
            ));
        }
    }
    

?>