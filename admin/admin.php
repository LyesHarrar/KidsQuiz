<?php
session_start();
include "../bdconfig.php";
if (isset($_SESSION['admin'])) { // vérifie si l'adiministrateur est déja connecté
	header("location: adminhome.php");
}
if (isset($_POST['password']))  {
	$password = $_POST['password'];
	$adminpass = '$2y$10$U.xUlUTobVB1QqgyZ8ZzIeeONPQ/T9n/GyGEU9Rv6k12LWwPsKM8W';//hachage du mdp pour plus de sécurité
	if (password_verify($password , $adminpass)) {
		$_SESSION['admin'] = "active";
		header("Location: adminhome.php");
	}
	else 
	{
		echo  "<script> alert('Mauvais mot de passe');</script>";
	}
}


?>



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

			</div>
		</header>

		<main>
		<div class="container">
				<h2>Entrez le mot de passe</h2>
				<form method="POST" action="">
				<input type="password"  name="password" required="" >
				<input type="submit"  class="btn btn-primary" name="submit" value="Envoyer"> 

			</div>


		</main>
		

		<footer>
			<div class="container">
				Administration du quiz
			</div>
		</footer>

	</body>
</html>