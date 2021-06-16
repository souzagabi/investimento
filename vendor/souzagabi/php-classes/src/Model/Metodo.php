<?php
    namespace Acao\Model;
    use \Acao\Model; 
    use \Acao\Model\Acao;
    use \Acao\Model\Person;

    class Metodo extends Model {

        public function convertDateToView($object = array())
        {
            if (isset($object["unit"])) {
                
                for ($i=0; $i < count($object); $i++) { 
                    if (isset($object["dtbuy"]) && $object["dtbuy"] != '') {
                        $object["dtbuy"] =  Metodo::convertDateView($object["dtbuy"]);
                    }
                    if (isset($object["dtsell"]) && $object["dtsell"] != '') {
                        $object["dtsell"] =     Metodo::convertDateView($object["dtsell"]);
                    }
                }
                
            } else
            {
                for ($i=0; $i < count($object); $i++) { 
                    if (isset($object[$i]["dtbuy"]) && $object[$i]["dtbuy"] != '') {
                        $object[$i]["dtbuy"] =  Metodo::convertDateView($object[$i]["dtbuy"]);
                    }
                    if (isset($object[$i]["dtsell"]) && $object[$i]["dtsell"] != '') {
                        $object[$i]["dtsell"] =     Metodo::convertDateView($object[$i]["dtsell"]);
                    }
                }
            }
            
            return $object;
        }
        
        public function convertDateToDataBase($object = array())
        {
            for ($i=0; $i < count($object); $i++) { 
                if (isset($object["dtbuy"]) && $object["dtbuy"] !='') {
                    $object["dtbuy"] =  Metodo::convertDateDataBase($object["dtbuy"]);
                }
                if (isset($object["dtsell"]) && $object["dtsell"] !='') {
                    $object["dtsell"] =     Metodo::convertDateDataBase($object["dtsell"]);
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
            $pgs = [];
            
            for ($j=0; $j < $qtdeRegister - 1; $j++) { 
                $pgs[$j]    = $j;
            }
         
            $pgs["list"]["limit"] = '';
            $pgs["list"]["dtbuy"] = '';
            $pgs["list"]["dtsell"] = '';
            foreach ($company as $key => $value) {
                $pgs["list"][$key] = $value;
            }
            
            return $pgs;
        }

        public function selectRegister($act = array())
        {
            
            if (isset($act["listacoes"]) && $act["listacoes"] == "listacoes") {
                $classModel = Acao::listAllAction($act);
            } else if (isset($act["listestoque"]) && $act["listestoque"] == "listestoque") {
                $classModel = Acao::listAllEstoque($act);
                $classModel = Metodo::convertDateToView($classModel);
            } else if (isset($act["person"]) && $act["person"] == "person") {
                $classModel = Person::listAll();
            } else {
                $classModel = Acao::listAll($act);
                $classModel = Metodo::convertDateToView($classModel);
                $classModel = Metodo::convertToInt($classModel);
            }
            
            $pgs = [];
            if (isset($classModel[0]["pgs"]) && count($classModel) > 0 && $classModel != '') {
                $pgs 	= Metodo::countRegister($classModel[0]["pgs"], $act);
            }
                      
            return [$classModel, $pgs];
        }
    }
?>