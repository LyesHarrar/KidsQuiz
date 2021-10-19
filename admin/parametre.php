<?php session_start(); ?>
<?php include "../bdconfig.php";
if (isset($_SESSION['admin'])) {

if(isset($_POST['submit'])) {
    $nbquestions = $_POST['nbrquestions'];
    $temps = $_POST['temps'];

    $sql = "UPDATE parametre SET nbquestions = '$nbquestions', temps = '$temps'";

    // Preparer la requète
    $stmt = $con->prepare($sql);

    // executer la requète
    $stmt->execute();

		echo "<script>alert('Réglages mis a jours !');
		window.location.href = 'parametre.php'; </script>" ;
	}


?>


<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Réglages</title>
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
				<h2>Personnaliser le quiz...</h2>
				<br>
				<h5><?php $requete = $con->query("SELECT * FROM quiz");
						$nbrlignes = $requete->rowCount();
						echo "Nombre total de questions : ".htmlspecialchars($nbrlignes); ?> </h5><br>
				<form method="post" action="">

					<p>
						<label>Nombre de questions :</label>
						<input style ="width: 550px;" type="text" name="nbrquestions" placeholder="Nombre inferieur ou égal au nombre de questions présentent dans le tableau..." required="">
					</p>
					<p>
						<label>Temps par question :</label>
						<input style ="width: 340px;" type="text" name="temps" placeholder="Entrez le nombre de secondes pour tout le quiz..." required="">
					</p>
					
						
						<input type="submit" class="btn btn-primary" name="submit" value="Valider">
					</p>
				</form>
			</div>
		</main>

		

	</body>
</html>

<?php } 
else {
	header("location: admin.php");
}
?>