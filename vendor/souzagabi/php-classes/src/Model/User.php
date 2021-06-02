<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    use \Acao\Mailer;
    
    class User extends Model {
        const SESSION = "User";
        const SECRET = "HcodePhp7_secret";

        public static function login($login, $password)
        {
            $sql = new Sql();

            $results = $sql->select("SELECT * FROM tb_persons p INNER JOIN tb_users u ON u.idperson = p.idperson WHERE u.deslogin = :LOGIN", array(
                ":LOGIN"=>$login
            ));
            
            if (count($results) === 0) {
                $msg = "ERROR: Usuário ou senha inválida";
                header("Location: /admin/login?msg=$msg");
			    exit;
            }
            $data = $results[0];
            
            if (password_verify($password, $data["despassword"]) === true) {
                $user = new User;
                $user->setData($data);
                $_SESSION[User::SESSION] = $user->getValues();
                return $user;
            } else{
                $msg = "ERROR: Usuário ou senha inválida";
                header("Location: /admin/login?msg=$msg");
			    exit;
            }
        }

        public static function verifyLogin($inadmin = true)
        {
            if (!isset($_SESSION[User::SESSION]) || !$_SESSION[User::SESSION] || !(int)$_SESSION[User::SESSION]["iduser"] > 0 ) {
                $msg = "ERROR: É necessário fazer login.";
                header("Location: /admin/login?msg=$msg");
                exit;
            }
        }

        public static function logout()
        {
            $_SESSION[User::SESSION] = NULL;
        }

        public static function listAll()
        {
            $sql = new Sql();
            return $sql->select("SELECT * FROM tb_users a INNER JOIN tb_persons b USING(idperson) ORDER BY b.idperson");
        }

        public function get($iduser) 
        {
            $sql = new Sql();
            
            $results = $sql->select("SELECT * FROM tb_users a INNER JOIN tb_persons b USING(idperson) WHERE a.iduser = :iduser;", array(
            ":iduser"=>$iduser
            ));
            
            $data = $results[0];
            
            $this->setData($data);
        }

        public function save()
        {
            $sql = new Sql();
            
            $results = $sql->select("CALL sp_users_save(:desperson, :sgcompany, :descpfcnpj, :deslogin, :despassword, :inadmin)", array(
                ":desperson"    =>  $this->getdesperson(),
                ":sgcompany"    =>  $this->getsgcompany(),
                ":descpfcnpj"   =>  $this->getdescpfcnpj(),
                ":deslogin"     =>  $this->getdeslogin(),
                ":despassword"  =>  $this->getdespassword(),
                ":inadmin"      =>  $this->getinadmin()
            ));
            $this->setData($results);
        }
        
        public function update()
        {
            $sql = new Sql();
                       
            $results = $sql->select("CALL sp_users_update_save(:iduser, :idperson, :desperson, :sgcompany, :descpfcnpj, :deslogin, :despassword, :inadmin)", array(
                ":iduser"       =>  $this->getiduser(),
                ":idperson"     =>  $this->getidperson(),
                ":desperson"    =>  $this->getdesperson(),
                ":descpfcnpj"   =>  $this->getdescpfcnpj(),
                ":sgcompany"    =>  $this->getsgcompany(),
                ":deslogin"     =>  $this->getdeslogin(),
                ":despassword"  =>  $this->getdespassword(),
                ":inadmin"      =>  $this->getinadmin()
            ));
            $this->setData($results);
        }

        public function delete()
        {
            $sql = new Sql();
            
            $sql->query("CALL sp_users_delete(:iduser)", array(
                ":iduser"=>$this->getiduser()
            ));
        }
        public static function getForgot($email)
        {
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
                    $mailer = new Mailer($data["desemail"], $data["desperson"], "Redefinir senha da Hcode store", "forgot", 
                        array(
                            "name"=>$data["desperson"],
                            "link"=>$link
                    ));

                    $mailer->send();

                    return $data;
                }
            }
        }

        public static function validForgotDecrypt($code)
        {
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

        public static function setForgotUsed($idrecovery)
        {
            $sql = new Sql();
            $sql->query("UPDATE tb_userspasswordsrecoveries SET dtrecovery = NOW() WHERE idrecovery = :idrecovery", array(
                ":idrecovery"=>$idrecovery
            ));
        }

        public function setPassword($password)
        {
            $aql = new Sql();
            $sql->query("UPDATE tb_users SET despassword = :password WHERE iduser = :udsuser", array(
                ":password" =>$password,
                ":udsuser"  =>$udsuser
            ));
        }
    }
    

?>