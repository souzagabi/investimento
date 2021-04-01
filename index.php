<?php 
	session_start();
	require_once("vendor/autoload.php");

	use \Slim\Slim;
	use \Acao\Page;
	use \Acao\PageAdmin;
	use \Acao\PageAcoes;
	use \Acao\Model\User;
	use \Acao\Model\Acao;

	

	$app = new Slim();

	$app->config('debug', true);

	$app->get('/', function() {
		User::verifyLogin();
		$page = new PageAdmin();
		$page->setTpl("index");
		
	});
	
	$app->get('/acoes', function() {
		$acoes = Acao::listAll();
		$page = new PageAcoes();
		for ($i=0; $i < count($acoes); $i++) { 
			if ($acoes[$i]["dtbuy"]) {
				$acoes[$i]["dtbuy"] = Acao::convertDateView($acoes[$i]["dtbuy"]);
			}
			if ($acoes[$i]["dtsell"]) {
				$acoes[$i]["dtsell"] = Acao::convertDateView($acoes[$i]["dtsell"]);
			}
		}
		$page->setTpl("acoes", array(
			"acoes"=> $acoes
		));
		
	});
	
	$app->get('/notas', function() {
		$acoes = Acao::listAll();
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

	$app->get('/acoes/create', function() {
		
		User::verifyLogin();
		$page = new PageAcoes();
		$page->setTpl("acoes-create");
	});

	$app->post("/acoes/create", function (){
		User::verifyLogin();

		$acao = new Acao();
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
		$acao->setData($_POST);
		$acao->save();

		header("Location: /acoes");
			exit;
	});
	
	$app->get("/acoes/:idperson", function($idperson) {
		User::verifyLogin();
		$acoes = new Acao();
 
		$acoes->getByPerson((int)$idperson);
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
		$acoes->getByBuy((int)$idinvestiment);
		$acoes->setData($_POST);
		$acoes->update();
		header("Location: /acoes");
		exit;
	});




	$app->get('/admin', function() {

		// User::verifyLogin();
		// $page = new PageAdmin();
		// $page->setTpl("index");
		User::verifyLogin();
		$users = User::listAll();
		$page = new PageAdmin();
		$page->setTpl("users", array(
			"users"=> $users
		));
		// $user = new User();
		
		// $user->get((int)$_SESSION["User"]["iduser"]);
		// $page->setTpl("index", array(
		// 	"acoes"=>$user->getValues()
		// ));
		
 

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
	$app->get('/admin/users', function() {
		
		User::verifyLogin();
		$users = User::listAll();
		$page = new PageAdmin();
		$page->setTpl("users", array(
			"users"=> $users
		));
	});
	$app->get('/admin/users/create', function() {
		
		User::verifyLogin();
		$page = new PageAdmin();
		$page->setTpl("users-create");
	});
	
	$app->get("/admin/users/:iduser/delete", function ($iduser){
		User::verifyLogin();
		$user = new User();
		$user->get((int)$iduser);
		$user->delete();
		header("Location: /admin/users");
		exit;
	});

	$app->get("/admin/users/:iduser", function($iduser) {
		User::verifyLogin();
		$user = new User();
 
		$user->get((int)$iduser);
		
		$page = new PageAdmin();
		
		$page ->setTpl("users-update", array(
			"user"=>$user->getValues()
		));
	});

	$app->post("/admin/users/create", function (){
		User::verifyLogin();

		$user = new User();

		$_POST["inadmin"] = (isset($_POST["inadmin"])) ? 1 : 0;

		$_POST['despassword'] = password_hash($_POST["despassword"], PASSWORD_DEFAULT, [

			"cost"=>12

		]);

		$user->setData($_POST);

		$user->save();

		header("Location: /admin/users");
			exit;
	});
	
	$app->post("/admin/users/:iduser", function ($iduser){
		User::verifyLogin();
		$user = new User();
		$_POST["inadmin"] = (isset($_POST["inadmin"])) ? 1 : 0;
		$user->get((int)$iduser);
		$user->setData($_POST);
		$user->update();
		header("Location: /admin/users");
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
	$app->run();

?>