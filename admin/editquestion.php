<?php session_start(); ?>
<?php include "../bdconfig.php";
if (isset($_SESSION['admin'])) {
	?>



<?php 
if (isset($_GET['qno'])) { //pour empecher un utilisateur d'accéder a cette page 
	
	if (is_numeric($_GET['qno'])) {
		$query = $con->prepare( 'SELECT * FROM quiz WHERE id = :qno' );//pour régler le problème des injection sql par rapport a la variable GET
		$query->bindValue( 'qno', $_GET['qno'], PDO::PARAM_INT );
		$query->execute();
	
		if ($query->rowCount() > 0) {
			while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
				 $qno = $row['id'];
                 $question = $row['question'];
                 $ans1 = $row['option1'];
                 $ans2 = $row['option2'];
                 $ans3 = $row['option3'];
                 $ans4 = $row['option4'];
                 $correct_answer = $row['reponse'];
			}
		}
		else {
			echo "<script> alert('Erreur');
			window.location.href = 'allquestions.php'; </script>" ;
		}
	}
	else {
		header("location: allquestions.php");
	}
}

?>
<?php 
if(isset($_POST['submit'])) {
	$question = $_POST['question'];
	$choix1 = $_POST['choix1'];
	$choix2 = $_POST['choix2'];
	$choix3 = $_POST['choix3'];
	$choix4 = $_POST['choix4'];
	$answer = $_POST['reponse'];
	$theme = $_POST['answer'];
    


	$resultat = $con->prepare('UPDATE quiz SET question = :question, reponse = :answer, option1 = :choix1 , option2 = :choix2 , option3 = :choix3, option4 = :choix4 , theme = :theme WHERE id = :qno');
	$resultat->bindParam('question', $question);
	$resultat->bindParam('answer', $answer);
	$resultat->bindParam('choix1', $choix1);
	$resultat->bindParam('choix2', $choix2);
	$resultat->bindParam('choix3', $choix3);
	$resultat->bindParam('choix4', $choix4);
	$resultat->bindParam('theme', $theme);
	$resultat->bindParam('qno', $qno);
	$resultat->execute();
	if ($resultat->rowCount() > 0 ) {
		echo "<script>alert('Question modifiée avec succès');
		window.location.href= 'allquestions.php'; </script> " ;
	}
	else {
		echo "<script>alert('Erreur, Réessayez encore !'); </script> " ;
	}
}

?>


<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Modification</title>
		<link rel="stylesheet" href="https://bootswatch.com/4/cosmo/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>

	<body>
		<header>
			<div class="container">
				<h1>Modification d'une question</h1>
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
				<h2>Effectuez les modifications...</h2>
				<form method="post" action="">

					<p>
						<label>Question</label>
						<input type="text" name="question" required="" value="<?php echo htmlentities($question); ?>">
					</p>
					<p>
						<label>reponse</label>
						<input type="text" name="reponse" required="" value="<?php echo htmlentities($correct_answer); ?>">
					</p>
					<p>
						<label>Choix #1</label>
						<input type="text" name="choix1" required="" value="<?php echo htmlentities($ans1); ?>">
					</p>
					<p>
						<label>Choix #2</label>
						<input type="text" name="choix2" required="" value="<?php echo htmlentities($ans2); ?>">
					</p>
					<p>
						<label>Choix #3</label>
						<input type="text" name="choix3" required="" value="<?php echo htmlentities($ans3); ?>">
					</p>
					<p>
						<label>Choix #4</label>
						<input type="text" name="choix4" required="" value="<?php echo htmlentities($ans4); ?>">
					</p>
					<p>
						<label>Thème de la question :</label>
						<select class="custom-select" name="answer" style ="width: 15%;" required>
                        <option value="culture générale">culture générale</option>
                        <option value="géographie">géographie</option>
                        <option value="mathématiques">mathématiques</option>
						<option value="réflexion">réflexion</option>
						<option value="sport">sport</option>
						<option value="dessin animés">dessins animés</option>
						<option value="histoire">histoire</option>
						<option value="français">français</option>
                    </select>
					</p>
					<p>
						
						<input type="submit" name="submit" value="Modifier">
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