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

	

	$app = new Slim();

	$app->config('debug', true);

	
/*======================================================================================*/
/*										Rotas das Ações									*/
/*======================================================================================*/
	$app->get('/', function() {
		User::verifyLogin();
		$acoes = Acao::listAll("listacoes", "");
		
		$page = new PageAcoes([
			"acoes"=> $acoes
		]);
			
		$page->setTpl("acoes", array(
			"acoes"=> $acoes
		));
		
	});

	$app->get('/acoes-estoque', function() {
		User::verifyLogin();
		$param = "";
		if (isset($_GET["search"])) 
		{
			$dtbuy 		= NULL;
			$dtsell 	= NULL;
			$company 	= NULL;
			$i = 0;
			foreach ($_GET as $key => $value) {
				if ($i === 0 && $value != NULL) {
					$company = $value;
				} 
				if ($i === 1 && $value != NULL) {
					$dtbuy = Acao::convertDateDataBase($value);
				} 
				if ($i === 2 && $value != NULL) {
					$dtsell = Acao::convertDateDataBase($value);
				} 
				$i++;
			}
			$param = $company."_".$dtbuy."_".$dtsell;
		}
		
		$acoes = Acao::listAllEstoque($param, "10");
		// echo '<pre>';
		// print_r($acoes);
		// echo '</pre>';exit;
		$acoes = Acao::convertDateToView($acoes);
		
		//$acoes 	= Acao::convertToInt($acoes);
		// $p = $acoes[0]["pgs"];
		// var_dump($acoes);exit;
		// $pgs 	= Acao::countRegister($acoes[0]["pgs"], "" , $dtBuySell );

		$page = new PageAcoes([
			"acoes"=> $acoes
		]);
		$page->setTpl("acoes-estoque", array(
			"acoes"=> $acoes
		));
		
	});
	
	$app->get('/acoes', function() {
		User::verifyLogin();
		
		$page = new PageAcoes();

		$acoes = Acao::listAll("listacoes", "10");
		
		$acoes = Acao::convertDateToView($acoes);

		$page->setTpl("acoes", array(
			"acoes"=> $acoes
		));
		
	});
	
	$app->get('/acoes/create', function() {
		User::verifyLogin();
		
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
				"voltar"=>$voltar
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

		$_POST = Acao::convertDateToDataBase($_POST);

		$_POST["iduser"] = $_SESSION["User"]["iduser"];
		
   		$_POST["tptransaction"] = "C";


		$acao->setData($_POST);

		$acao->save();
		$tipo = "compra";
		
		header("Location: /acoes/create?$tipo=$tipo");
		exit;
	});
	
	$app->get("/acoes/:idinvestiment/delete", function ($idinvestiment){
		User::verifyLogin();
		$acao = new Acao();
		$acao->getByBuy($idinvestiment);
		$array = (array) $acao;

		foreach ($array as $key => $value) {
			$company = $value["sgcompany"];
		}
		$acao->delete();
		header("Location: /acoes?sgcompany=".$company."&dtbuy=&dtsell=&search=Search");
		exit;
	});

	$app->get("/acoes/:idinvestiment", function($idinvestiment) {
		User::verifyLogin();
		$acoes = new Acao();
		$acoes->getByBuy($idinvestiment);
		
		$acoes = Acao::convertDateToView($acoes);

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
		$page = new PageAcoes();
		
		if (isset($_GET["search"])) {
			$dtBuySell = ""."_"."";
			if ((isset($_GET["dtbuy"]) && $_GET["dtbuy"] != '') || (isset($_GET["dtsell"]) && $_GET["dtsell"] != '')) {
				$_GET = Acao::convertDateToDataBase($_GET);
				$dtBuySell = $_GET["dtbuy"]."_".$_GET["dtsell"];
			}

			if ((!isset($_GET["sgcompany"]) || ($_GET["sgcompany"] == '' || $_GET["sgcompany"] == NULL) && (isset($_GET["dtbuy"]) || $_GET["dtbuy"] != '') && (isset($_GET["dtsell"]) || $_GET["dtsell"] != ''))) {
				echo 'Com datas sem company Index1.';
				$acoes = Acao::listAll($dtBuySell, "10");
				$acoes = Acao::convertDateToView($acoes);
				
				$acoes 	= Acao::convertToInt($acoes);
				
				$pgs 	= Acao::countRegister($acoes[0]["pgs"], "" , $dtBuySell );

				$page->setTpl("/notas", array(
					"acoes"=>$acoes,
					"pgs"=>$pgs
				));
				
			} else if (isset($_GET["sgcompany"]) && ($_GET["sgcompany"] != '' && $_GET["sgcompany"] != NULL) && (!isset($_GET["dtbuy"]) || $_GET["dtbuy"] == '') && (!isset($_GET["dtsell"]) || $_GET["dtsell"] == '') )
			{
				/*======================================================================*/
				/*								Sem datas com company					*/
				/*======================================================================*/
				echo 'Sem datas Com company Index2.';
				foreach ($_GET as $key => $value) {
					$company[$key] = $value;
				}
				$company["company"] = "sgcompany";
				$company["limit"] = "10";
				$company["listacoes"] = "";
				$company["notas"] = "";
				//print_r($company);exit;
				//$company = "sgcompany"."_".$_GET["sgcompany"];
				$acoes = Acao::listAll($company);
				
				echo '<pre>';						
				print_r($acoes);
				echo '</pre>';
				exit;
				$acoes 	= Acao::convertDateToView($acoes);
				$acoes 	= Acao::convertToInt($acoes);
				
				$pgs 	= Acao::countRegister($acoes[0]["pgs"], $_GET["sgcompany"], "");
				print_r($pgs);
				$page->setTpl("/notas", array(
					"acoes"=>$acoes,
					"pgs"=>$pgs
				));
			} else if ((!isset($_GET["dtbuy"]) || $_GET["dtbuy"] == '') || (!isset($_GET["dtsell"]) || $_GET["dtsell"] == '') && $_GET["sgcompany"] == '') 
			{
				echo 'Sem datas sem company Index3.';
				$acoes = Acao::listAll("notas", "10");

				$acoes 	= Acao::convertDateToView($acoes);
				$acoes 	= Acao::convertToInt($acoes);
			
				$pgs 	= Acao::countRegister($acoes[0]["pgs"], "", "" );
				$page->setTpl("notas", array(
					"acoes"=> $acoes,
					"pgs"=> $pgs
				));	
			} else if (isset($_GET["sgcompany"]) && ($_GET["sgcompany"] != '' && $_GET["sgcompany"] != NULL) && (isset($_GET["dtbuy"]) || $_GET["dtbuy"] != '') && (isset($_GET["dtsell"]) || $_GET["dtsell"] != '') )
			{
				/*======================================================================*/
				/*								Sem datas com company					*/
				/*======================================================================*/
				echo 'Com datas Com company Index41.';
				$company = "sgcompany"."_".$_GET["sgcompany"]."_".$dtBuySell;
				$acoes = Acao::listAll($company, "10");
				
				$acoes 	= Acao::convertDateToView($acoes);
				$acoes 	= Acao::convertToInt($acoes);
				
				$pgs 	= Acao::countRegister($acoes[0]["pgs"], $_GET["sgcompany"], $dtBuySell);
				// print_r($_GET);
				// print_r($pgs);
				// echo '<pre>';						
				// print_r($acoes);
				// echo '</pre>';
				//exit;
				$page->setTpl("/notas", array(
					"acoes"=>$acoes,
					"pgs"=>$pgs
				));
			} else {
				echo 'Com datas com company Index5.';
				$acoes = Acao::listAll("notas", "10");
				
				$acoes = Acao::convertDateToView($acoes);
				$acoes 	= Acao::convertToInt($acoes);
				$pgs 	= Acao::countRegister($acoes[0]["pgs"], $_GET["sgcompany"], $dtBuySell );
				// print_r($pgs);
				// echo '<pre>';						
				// print_r($acoes);
				// echo '</pre>';
				exit;
				$page->setTpl("notas", array(
					"acoes"=> $acoes,
					"pgs"=> $pgs
				));	
			}
			
			
		} else // Fim do Search
		{
			echo 'Sem datas com company Index6.';
			$acoes = Acao::listAll("notas", "10");

			$acoes 	= Acao::convertDateToView($acoes);
			$acoes 	= Acao::convertToInt($acoes);
			$pgs 	= Acao::countRegister($acoes[0]["pgs"], "", "" );
			echo 'Sem search';
			// echo '<pre>';
			// print_r($pgs);
			// echo '</pre>';
			exit;
			
			$page->setTpl("notas", array(
				"acoes"=> $acoes,
				"pgs"=> $pgs
			));
		}
		
	});

	$app->get("/notas/:idinvestiment", function($idinvestiment) {
		User::verifyLogin();
		$acoes = new Acao();
		$acoes->getByBuy($idinvestiment);
		
		$page = new PageAcoes();
		
		$page ->setTpl("acoes-update", array(
			"acoes"=>$acoes->getValues()
		));
	});
	
	$app->post("/notas/:idinvestiment", function ($idinvestiment){
		User::verifyLogin();
		$acoes = new Acao();
		if ($_POST["tax"]) {
			$tax = explode(" ",$_POST["tax"]);
			$_POST["tax"] = $tax[0];
		}
		$_POST = Acao::convertDateToDataBase($_POST);
		
		$_POST["iduser"] = $_SESSION["User"]["iduser"];
		
		$acoes->getByBuy($idinvestiment);
		$acoes->setData($_POST);
		
		$acoes->update();
		header("Location: /notas?sgcompany=".$_POST["sgcompany"]."&dtbuy=&dtsell=&search=Search");
		exit;
	});
	
/*======================================================================================*/
/*										Rotas do Person									*/
/*======================================================================================*/

	$app->get('/persons', function() {

		User::verifyLogin();
		$persons = Person::listAll();
		$page = new PagePerson();
		$page->setTpl("index", array(
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
		$users = User::listAll();
		$page = new PageUser();
		$page->setTpl("users", array(
			"users"=> $users
		));
	});

	$app->get('/admin/login', function() {
		
		$page = new PageAdmin([
			"header"=> false,
			"footer"=> false

		]);
		$page->setTpl("login");
		
	});

	$app->post('/admin/login', function() {
		
		User::login($_POST["login"], $_POST["password"]);
		header("Location: /admin");
		exit;
		
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
		$users = User::listAll();
		$page = new PageUser();
		$page->setTpl("users", array(
			"users"=> $users
		));
	});

	$app->get('/users/create', function() {
		
		User::verifyLogin();
		$page = new PageUser();
		$page->setTpl("users-create");
	});
	
	$app->get("/users/:iduser/delete", function ($iduser){
		User::verifyLogin();
		$user = new User();
		$user->get((int)$iduser);

		$user->delete();
		header("Location: /users");
		exit;
	});

	$app->get("/users/:iduser", function($iduser) {
		User::verifyLogin();
		$user = new User();
 
		$user->get((int)$iduser);
		
		$page = new PageUser();
		
		$page ->setTpl("users-update", array(
			"user"=>$user->getValues()
		));
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