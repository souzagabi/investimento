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
	$app->get('/ampli', function() {
		
		$page = new Page();
			
		$page->setTpl("ampliar-imagem");
		
	});
	$app->get('/', function() {
		User::verifyLogin();
		$acoes = Acao::listAll("listacoes");
		$page = new PageAcoes([
			"acoes"=> $acoes
		]);
			
		$page->setTpl("acoes", array(
			"acoes"=> $acoes
		));
		
	});

	$app->get('/acoes', function() {
		User::verifyLogin();
		$page = new PageAcoes();
		
		if (isset($_GET["search"])) {
			if ($_GET["dtbuy"] != NULL || $_GET["dtsell"] != NULL) {
				
				$_GET["dtbuy"] = Acao::convertDateDataBase($_GET["dtbuy"]);
				$_GET["dtsell"] = Acao::convertDateDataBase($_GET["dtsell"]);
				
				$dtBuySell = $_GET["dtbuy"]."_".$_GET["dtsell"];
				
				$acoes = Acao::listAll($dtBuySell);

				for ($i=0; $i < count($acoes); $i++) { 
					if ($acoes[$i]["dtbuy"]) {
						$acoes[$i]["dtbuy"] = Acao::convertDateView($acoes[$i]["dtbuy"]);
					}
					if ($acoes[$i]["dtsell"]) {
						$acoes[$i]["dtsell"] = Acao::convertDateView($acoes[$i]["dtsell"]);
					}
				}
				
				$page->setTpl("/notas", array(
					"acoes"=>$acoes
				));
				
			}
			if ($_GET["sgcompany"] != '' && $_GET["sgcompany"] != NULL )
			{
				$company = "sgcompany"."_".$_GET["sgcompany"];
				$acoes = Acao::listAll($company);
				$page->setTpl("/notas", array(
					"acoes"=>$acoes
				));
			}
			
		} else {
			$acoes = Acao::listAll("listacoes");
			
			$page->setTpl("acoes", array(
				"acoes"=> $acoes
			));
		}
		
	});
	
	$app->get('/acoes/create', function() {
		User::verifyLogin();
		
		$voltar = ["voltar"=>"teste"];
		if (isset($_GET["acoes"])) {
			$voltar = ["voltar"=>"acoes"];
		}
		if (isset($_GET["notas"])) {
			$voltar = ["voltar"=>"notasC"];
		}
		$page = new PageAcoes();

		if (isset($_GET["compra"])) {
			$page->setTpl("acoes-createC", array(
				"voltar"=>$voltar
			));
		}
		if (isset($_GET["venda"])) {
			$page->setTpl("acoes-createV", array(
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
		if (isset($_POST["dtbuy"])) {
			$_POST["dtbuy"] = Acao::convertDateDataBase($_POST["dtbuy"]);
		}
		if (isset($_POST["dtsell"])) {
			$_POST["dtsell"] = Acao::convertDateDataBase($_POST["dtsell"]);
		}
		$_POST["iduser"] = $_SESSION["User"]["iduser"];
		
		if (isset($_POST["compra"])) {
			$_POST["tptransaction"] = "C";
		}
		if (isset($_POST["venda"])) {
			$_POST["tptransaction"] = "V";
		}


		$acao->setData($_POST);

		if (isset($_POST["compra"])) {
			$acao->save_buy();
		}
		if (isset($_POST["venda"])) {
			$acao->save_sell();
		}

		header("Location: /acoes");
			exit;
	});
	
	$app->get("/acoes/:idinvestiment/delete", function ($idinvestiment){
		User::verifyLogin();
		$acao = new Acao();
		$acao->getByBuy($idinvestiment);
		$acao->delete();
		header("Location: /notasC");
		exit;
	});

	$app->get("/acoes/:idinvestiment", function($idinvestiment) {
		User::verifyLogin();
		$acoes = new Acao();
		$acoes->getByBuy($idinvestiment);
		
		$page = new PageAcoes();
		
		$page ->setTpl("acoes-update", array(
			"acoes"=>$acoes->getValues()
		));
	});
	
	$app->post("/acoes/:idinvestiment", function ($idinvestiment){
		User::verifyLogin();
		$acoes = new Acao();
		if ($_POST["tax"]) {
			$tax = explode(" ",$_POST["tax"]);
			$_POST["tax"] = $tax[0];
		}
		if ($_POST["dtbuy"]) {
			$_POST["dtbuy"] = Acao::convertDateDataBase($_POST["dtbuy"]);
		}
		if ($_POST["dtsell"]) {
			$_POST["dtsell"] = Acao::convertDateDataBase($_POST["dtsell"]);
		}
		$_POST["iduser"] = $_SESSION["User"]["iduser"];
		
		$acoes->getByBuy($idinvestiment);
		$acoes->setData($_POST);

		$acoes->update();
		header("Location: /acoes");
		exit;
	});

/*======================================================================================*/
/*										Rotas das Notas									*/
/*======================================================================================*/
	
	$app->get('/notasC', function() {
		User::verifyLogin();
		$acoes = Acao::listAll("notascompra");
		$page = new PageAcoes();
		
		for ($i=0; $i < count($acoes); $i++) { 
			if ($acoes[$i]["dtbuy"]) {
				$acoes[$i]["dtbuy"] = Acao::convertDateView($acoes[$i]["dtbuy"]);
			}
			if ($acoes[$i]["dtsell"]) {
				$acoes[$i]["dtsell"] = Acao::convertDateView($acoes[$i]["dtsell"]);
			}
		}
		
		$page->setTpl("notas", array(
			"acoes"=> $acoes
		));
		
	});

	$app->get('/notasV', function() {
		User::verifyLogin();
		$acoes = Acao::listAll("notasvenda");
		$page = new PageAcoes();
		for ($i=0; $i < count($acoes); $i++) { 
			if ($acoes[$i]["dtbuy"]) {
				$acoes[$i]["dtbuy"] = Acao::convertDateView($acoes[$i]["dtbuy"]);
			}
			if ($acoes[$i]["dtsell"]) {
				$acoes[$i]["dtsell"] = Acao::convertDateView($acoes[$i]["dtsell"]);
			}
		}
		$page->setTpl("notas", array(
			"acoes"=> $acoes
		));
		
	});

	$app->get("/notas/:idinvestiment", function($idinvestiment) {
		User::verifyLogin();
		$acoes = new Acao();
		
		$acoes->getByBuy((int)$idinvestiment);
		
       
		$page = new PageAcoes();
		
		$page ->setTpl("acoes-update", array(
			"acoes"=>$acoes->getValues()
		));
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