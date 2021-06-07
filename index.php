<?php 
	session_start();
	require_once("vendor/autoload.php");

	use \Slim\Slim;
	use \Acao\Page;
	use \Acao\PageAdmin;
	use \Acao\PageUser;
	use \Acao\PageAcoes;
	use \Acao\PagePerson;
	use \Acao\Model\User;
	use \Acao\Model\Acao;
	use \Acao\Model\Person;
	use \Acao\Model\Metodo;

	

	$app = new Slim();

	$app->config('debug', true);

	
/*======================================================================================*/
/*										Rotas das Ações									*/
/*======================================================================================*/
	$app->get('/', function() {
		User::verifyLogin();
		header("Location: /acoes?pg=1&limit=10");
		exit;
		
	});

	$app->get('/acoes-estoque', function() {
		User::verifyLogin();
		//$param = "";
		$company["sgcompany"]	= NULL;
		$company["dtbuy"] 		= NULL;
		$company["dtsell"] 		= NULL;
		$company["listestoque"]	= NULL;

		if ((isset($_GET["dtbuy"]) && $_GET["dtbuy"] != '') || (isset($_GET["dtsell"]) && $_GET["dtsell"] != '')) {
			$_GET = Metodo::convertDateToDataBase($_GET);
		}
		foreach ($_GET as $key => $value) {
			$company[$key] = $value;
		}
		
		$company["listestoque"]	= "listestoque";
		$action	= Metodo::selectRegister($company);
		
		$page = new PageAcoes([
			"acoes"=> $action[0]
		]);
		$page->setTpl("acoes-estoque", array(
			"acoes"=> $action[0],
			"pgs"=> $action[1],
		));
		
	});
	
	$app->get('/acoes', function() {
		User::verifyLogin();
		$company["sgcompany"]	= NULL;
		$company["dtbuy"] 		= NULL;
		$company["dtsell"] 		= NULL;
		$company["listacoes"]	= NULL;
		$company["search"]		= NULL;

		$msg = ["state"=>'VAZIO', "msg"=> 'VAZIO'];
		
		if ((isset($_GET["msg"]) && $_GET["msg"] != '')) {
			$mess = explode(':', $_GET["msg"]);
			$msg = ["state"=>$mess[0], "msg"=> $mess[1]];
		} 

		if ((isset($_GET["dtbuy"]) && $_GET["dtbuy"] != '') || (isset($_GET["dtsell"]) && $_GET["dtsell"] != '')) {
			$_GET = Metodo::convertDateToDataBase($_GET);
		}
		foreach ($_GET as $key => $value) {
			$company[$key] = $value;
		}
		
		$company["listacoes"] 	= "listacoes";
		
		$action 	= Metodo::selectRegister($company);
	
		$page = new PageAcoes();
		$page->setTpl("acoes", array(
			"acoes"	=> $action[0],
			"pgs"	=> $action[1],
			"msg"	=> $msg
		));
		
	});
	
	$app->get('/acoes/create', function() {
		User::verifyLogin();
		
		$msg = ["state"=>'VAZIO', "msg"=> 'VAZIO'];
		
		if ((isset($_GET["msg"]) && $_GET["msg"] != '')) {
			$mess = explode(':', $_GET["msg"]);
			$msg = ["state"=>$mess[0], "msg"=> $mess[1]];
		} 

		$voltar = ["voltar"=>"acoes"];
		if (isset($_GET["acoes"])) {
			$voltar = ["voltar"=>"acoes"];
		}
		if (isset($_GET["notas"])) {
			$voltar = ["voltar"=>"notas"];
		}
		$page = new PageAcoes();

		if (isset($_GET["compra"])) {
			$page->setTpl("acoes-create", array(
				"voltar"=>$voltar,
				"msg"=>$msg
			));
		}
		
		
	});

	$app->post("/acoes/create", function (){
		User::verifyLogin();
		
		$acao = new Acao();
		if (isset($_POST["tax"])) {
			$tax = explode(" ",$_POST["tax"]);
			$_POST["tax"] = $tax[0];
		}

		$_POST = Metodo::convertDateToDataBase($_POST);

		$_POST["iduser"] = $_SESSION["User"]["iduser"];
		
   		$_POST["btptransaction"] = "C";


		$acao->setData($_POST);

		$msg = $acao->save();
		//var_dump($acao);exit;
		$tipo = "compra";
		
		header("Location: /acoes/create?$tipo=$tipo&msg=$msg");
		exit;
	});
	
	$app->get("/acoes/:idinvestiment/delete", function ($idinvestiment){
		User::verifyLogin();
		$acao = new Acao();
		$msg = ["state"=>'VAZIO', "msg"=> 'VAZIO'];
		
		if ((isset($_GET["msg"]) && $_GET["msg"] != '')) {
			$mess = explode(':', $_GET["msg"]);
			$msg = ["state"=>$mess[0], "msg"=> $mess[1]];
		} 

		$acao->getByBuy($idinvestiment);
		$array = (array) $acao;

		foreach ($array as $key => $value) {
			$company = $value["sgcompany"];
		}
		$msg = $acao->delete();
		header("Location: /acoes?sgcompany=".$company."&dtbuy=&dtsell=&search=Search¨msg=$msg");
		exit;
	});

	$app->get("/acoes/:idinvestiment", function($idinvestiment) {
		User::verifyLogin();
		$acoes = new Acao();
		$acoes->getByBuy($idinvestiment);
		
		$acoes = Metodo::convertDateToView($acoes);

		$page = new PageAcoes();
		
		$page ->setTpl("acoes-update", array(
			"acoes"=>$acoes->getValues()
		));
	});

/*======================================================================================*/
/*										Rotas das Notas									*/
/*======================================================================================*/
	
	$app->get('/notas', function() {
		User::verifyLogin();
		$company["sgcompany"]	= NULL;
		$company["dtbuy"] 		= NULL;
		$company["dtsell"] 		= NULL;
		$company["search"] 		= NULL;
		
		$msg = ["state"=>'VAZIO', "msg"=> 'VAZIO'];
		
		if ((isset($_GET["msg"]) && $_GET["msg"] != '')) {
			$mess = explode(':', $_GET["msg"]);
			$msg = ["state"=>$mess[0], "msg"=> $mess[1]];
		} 

		if ((isset($_GET["dtbuy"]) && $_GET["dtbuy"] != '') || (isset($_GET["dtsell"]) && $_GET["dtsell"] != '')) {
			$_GET = Metodo::convertDateToDataBase($_GET);
		}
		foreach ($_GET as $key => $value) {
			$company[$key] = $value;
		}
		
		$page = new PageAcoes();
		if (isset($_GET["search"])) {
			$company["search"] 		= "Search";
			
			$action 	= Metodo::selectRegister($company);
			
			if (isset($action) && $action != '') {
				$page->setTpl("/notas", array(
					"acoes"=>$action[0],
					"pgs"=>$action[1],
					"msg"=>$msg
				));
			}

		} else // Fim do Search
		{
			$company["notas"]	= "notas";
			$action 	= Metodo::selectRegister($company);

			$page->setTpl("notas", array(
				"acoes"=> $action[0],
				"pgs"=> $action[1],
				"msg"=>$msg
			));
		}
		
	});
	
	$app->get("/notas/:idinvestiment", function($idinvestiment) {
		User::verifyLogin();
		$acoes = new Acao();
		$acoes->getByBuy($idinvestiment);
		// echo '<pre>';
		// print_r($acoes);
		// echo '</pre>';exit;
		$page = new PageAcoes();
		
		$page ->setTpl("acoes-update", array(
			"acoes"=>$acoes->getValues()
		));
	});
	
	$app->post("/notas/:idinvestiment", function ($idinvestiment){
		User::verifyLogin();
		$acoes = new Acao();
			
		$_POST["qtdetotal"] = $_POST["qtdebuy"] - $_POST["qtdesell"];

		$msg = ["state"=>'VAZIO', "msg"=> 'VAZIO'];
		
		if ((isset($_GET["msg"]) && $_GET["msg"] != '')) {
			$mess = explode(':', $_GET["msg"]);
			$msg = ["state"=>$mess[0], "msg"=> $mess[1]];
		}
		
		if (isset($_POST["tax"])) {
			$tax = explode(" ",$_POST["tax"]);
			$_POST["tax"] = $tax[0];
		}
		if (isset($_POST)) {
			$_POST = Metodo::convertDateToDataBase($_POST);
			$_POST["iduser"] = $_SESSION["User"]["iduser"];
		}
		
		$acoes->getByBuy($idinvestiment);
		$acoes->setData($_POST);
		$msg = $acoes->update();
		/***************************Atualizar Tabelas *************************************/
		// $act = new Acao();
		// $action 	= Acao::listAllIds();
		
		// for ($i=0; $i < count($action); $i++) {
		// 	$act = new Acao();
		// 	$act->getByBuy($action[$i]["idinvestiment"]);
			
		// 	echo '<pre>';
		// 	print_r($act);
		// 	echo '</pre>';
		// 	$msg = $act->update();
		// }
		//exit;
		/***************************Atualizar Tabelas *************************************/

		// echo 'index L281';
		// echo '<pre>';
		// print_r($acoes);
		// echo '</pre>';
		// exit;
		
		header("Location: /notas?sgcompany=".$_POST["sgcompany"]."&dtbuy=&dtsell=&search=Search&limit=10&msg=$msg");
		exit;
	});
	
/*======================================================================================*/
/*										Rotas do Person									*/
/*======================================================================================*/

	$app->get('/persons', function() {

		User::verifyLogin();
		$persons = Person::listAll();
		$page = new PagePerson();
		$page->setTpl("persons", array(
			"persons"=> $persons
		));
	});

	$app->get("/persons/:idperson/delete", function ($idperson){
		User::verifyLogin();
		$person = new Person();
		$person->get((int)$idperson);
		$person->delete();
		header("Location: /persons");
		exit;
	});

	$app->get("/persons/:idperson", function($idperson) {
		User::verifyLogin();
		$persons = new Person();
 
		$persons->get((int)$idperson);
		$page = new PagePerson();
		
		$page ->setTpl("person-update", array(
			"persons"=>$persons->getValues()
		));
	});

	$app->post("/persons/:idperson", function ($idperson){
		User::verifyLogin();
		$persons = new Person();
		
		$persons->get((int)$idperson);
		$persons->setData($_POST);
		
		$persons->update();
		header("Location: /persons");
		exit;
	});

/*======================================================================================*/
/*										Rotas do Admin									*/
/*======================================================================================*/

	$app->get('/admin', function() {

		User::verifyLogin();
		
		if ($_SESSION["User"]["inadmin"] == 1) {

			$users = User::listAll();
			$page = new PageUser();
			$page->setTpl("users", array(
				"users"=> $users
			));
		} else {
			header("Location: /acoes?pg=1&limit=10");
			exit;
		}
		
	});

	$app->get('/admin/login', function() {
		
		$msg = ["state"=>'VAZIO', "msg"=> 'VAZIO'];
		
		if ((isset($_GET["msg"]) && $_GET["msg"] != '')) {
			$mess = explode(':', $_GET["msg"]);
			$msg = ["state"=>$mess[0], "msg"=> $mess[1]];
		}

		$page = new PageAdmin([
			"header"=> false,
			"footer"=> false

		]);
		$page->setTpl("login", array(
			"msg"=>$msg
		));
		
	});

	$app->post('/admin/login', function() {
		
		User::login($_POST["login"], $_POST["password"]);
		
		if ($_SESSION["User"]["inadmin"] == 1) {
			header("Location: /admin");
			exit;
		} else {
			header("Location: /acoes?pg=1&limit=10");
			exit;
		}
	});

	$app->get('/admin/logout', function() {
		
		User::logout();
		header("Location: /admin/login");
		exit;
	});

	$app->get("/admin/forgot", function(){
		$page = new PageAdmin([
			"header"=>false,
			"footer"=>false
		]);
		$page->setTpl("forgot");
	});

	$app->post("/admin/forgot", function(){
		
		$user = User::getForgot($_POST["email"]);
		header("Location: /admin/forgot/sent");
		exit;
	});

	$app->get("/admin/forgot/sent", function(){
		$page = new PageAdmin([
			"header"=>false,
			"footer"=>false
		]);
		$page->setTpl("forgot-sent");
	});

	$app->get("/admin/forgot/reset", function(){
		$user = User::validForgotDecrypt($_GET["code"]);
		$page = new PageAdmin([
			"header"=>false,
			"footer"=>false
		]);
		$page->setTpl("forgot-reset", array(
			"name"=>$user["desperson"],
			"code"=>$_GET["code"]
		));
	});

	$app->post("/admin/forgot/reset", function(){
		$forgot = User::validForgotDecrypt($_GET["code"]);
		User::setForgotUsed($forgot["idrecovery"]);
		$user= new User();
		$user->get((int)$forgot["iduser"]);
		$user->setPassword($_POST["password"]);
	});


/*======================================================================================*/
/*										Rotas do Users									*/
/*======================================================================================*/

	$app->get('/users', function() {
		
		User::verifyLogin();
		if ($_SESSION["User"]["inadmin"] == 1) {
			$users = User::listAll();
			$page = new PageUser();
			$page->setTpl("users", array(
				"users"=> $users
			));
		} else {
			header("Location: /acoes?pg=1&limit=10");
			exit;
		}
	});

	$app->get('/users/create', function() {
		
		User::verifyLogin();
		
		if ($_SESSION["User"]["inadmin"] == 1) {
			$page = new PageUser();
			$page->setTpl("users-create");
		} else {
			header("Location: /acoes?pg=1&limit=10");
			exit;
		}
	});
	
	$app->get("/users/:iduser/delete", function ($iduser){
		User::verifyLogin();

			$user = new User();
		if ($_SESSION["User"]["inadmin"] == 1) {
			$user->get((int)$iduser);

			$user->delete();
			header("Location: /users");
			exit;
		} else {
			header("Location: /acoes?pg=1&limit=10");
			exit;
		}
	});

	$app->get("/users/:iduser", function($iduser) {
		User::verifyLogin();
		if ($_SESSION["User"]["inadmin"] == 1) {
			$user = new User();
	
			$user->get((int)$iduser);
			
			$page = new PageUser();
			
			$page ->setTpl("users-update", array(
				"user"=>$user->getValues()
			));
		} else {
			header("Location: /acoes?pg=1&limit=10");
			exit;
		}
	});

	$app->post("/users/create", function (){
		User::verifyLogin();

		$user = new User();

		$_POST["inadmin"] = (isset($_POST["inadmin"])) ? 1 : 0;

		$_POST['despassword'] = password_hash($_POST["despassword"], PASSWORD_DEFAULT, [
			
			"cost"=>12
			
			]);

		$user->setData($_POST);

		$user->save();

		header("Location: /users");
			exit;
	});
	
	$app->post("/users/:iduser", function ($iduser){
		User::verifyLogin();
		$user = new User();
		$_POST["inadmin"] = (isset($_POST["inadmin"])) ? 1 : 0;
		
		$user->get((int)$iduser);
		$user->setData($_POST);
		
		$user->update();
		
		header("Location: /users");
		exit;
		
	});
	
	
	$app->run();

?>
