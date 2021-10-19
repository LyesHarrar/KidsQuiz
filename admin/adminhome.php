<?php 
session_start();
if (isset($_SESSION['admin'])) {
?>




<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Quiz</title>
		<link rel="stylesheet" href="https://bootswatch.com/4/cosmo/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>

	<body>
		<header>
			<div class="container">
				<h1>Quiz</h1>
				<a href="http://localhost/TER/projetquiz/" class="btn btn-primary">Accueil</a>
				<a href="add.php" class="btn btn-success">Ajouter une question</a>
				<a href="allquestions.php" class="btn btn-info">Toutes les questions</a>
				<a href="validation.php" class="btn btn-warning">Valider une question</a>
				<a href="parametre.php" class="btn btn-danger">Paramètres du Quiz</a>
				<a href="exit.php" class="start">Déconnexion</a>

			</div>
		</header>

		<main>
			<div class="container">
				<br>
				<h2>Vous êtes connecté(e) !</h2>
				</div>
				</main>
				<div class="jumbotron">
					<center>
  					<h1>Bienvenue Admin</h1>
  						<p class="lead">À partir d'ici vous pouvez controler, supervier et personnaliser le quiz.</p>
  						<hr class="my-4">
  							<p>Si vous rencontrez un problème ou détectez le moindre bug, cliquez sur le bouton ci dessous.</p>
  							<p class="lead">
   							 <a class="btn btn-primary btn-lg" href="aide.php" role="button">Aide</a>
							  </p>
					</center>
				</div>
				</body>
				</html>

				<?php } 
				else {
				header("location: admin.php");
				}
				?>