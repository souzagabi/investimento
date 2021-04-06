<?php
    namespace Acao\Model;
    use \Acao\DB\Sql;
    use \Acao\Model;
    use \Acao\Mailer;
    
    class Person extends Model {
        public static function listAll(){
            $sql = new Sql();
            return $sql->select("SELECT * FROM tb_persons ORDER BY idperson");
        }

    }
?>