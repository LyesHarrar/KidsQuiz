<?php session_start(); ?>
<?php include "../bdconfig.php"; ?>
<?php 
 if(!isset($_SESSION['score']))//on empèche l'utilisateur d'accéder à cette page sans avoir jouer.
 {
	 header("Location: ../index.php");
	 exit();
 }
$score = $_SESSION['score'];
?>
<!DOCTYPE html>
<html lang="fr">
	<head>
	<meta charset="utf-8" />
	<title>Résultat</title>
	<link rel="stylesheet" href="https://bootswatch.com/4/sketchy/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
   </head>
<body>
	
		<div class="titre">
				<h1><span>Bravooooo !</span></h1>
				<h1 class = "points">Nombre de points obtenus: <?php echo $score; ?> points</h1>
				
				<center>
				<a type="button" style = "width: 50%;" class="btn-primary btn-lg btn-block btn-warning" href = "../index.php">Accueil</a><a type="button" style = "width: 50%;" class="btn btn-primary btn-lg btn-block btn-danger" href = "../page_du_quiz/question.php?n=1">Recommencer le même quiz</a>
                </center>
		</div>
		<?php 
		$sqll = "SELECT MIN(point) FROM score";//séléctionne la score minimal présent dans la table
		$requete = $con->query($sqll);
		$resultat = $requete->fetch(PDO::FETCH_ASSOC);

		$min = $resultat['MIN(point)'];
		//condition pour permettre a l'uitilisateur d'entrer son nom et de figurer sur la table des scores (seulement si son score et plus grand que le min déja présent) !
		if ($score > $min) { ?>
		<br><br>
			<form method="POST" action="">
				<center>
			
				<input type="text" name = "pseudo">
				<input type = "submit" class="btn btn-success" name = "submit" value = "Je m'inscris">
			
				</center>
		    </form>
		
		<?php } ?>
		<?php
		 
         if(isset($_POST['submit']))
         {
			 
			 $nom =  str_replace("'","\'",($_POST['pseudo']));
             $sql = "UPDATE score SET point = '$score', pseudo = '$nom' WHERE point = '$min'";
             // Preparer la requète
             $stmt = $con->prepare($sql);
 
             // executer la requète
             $stmt->execute();
           
             echo"<script> window.location.href = '../classement/index.php'; </script>";
 
 
         } 
         ?>
			

		
</body>
</html>
<?php //session_destroy(); ?>