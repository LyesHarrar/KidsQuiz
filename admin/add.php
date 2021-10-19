<?php session_start(); ?>
<?php include "../bdconfig.php";
if (isset($_SESSION['admin'])) {

if(isset($_POST['submit'])) {
	$question = $_POST['question'];
	$reponse = $_POST['reponse'];
	$option1 = $_POST['choix1'];
	$option2 = $_POST['choix2'];
	$option3 = $_POST['choix3'];
	$option4 = $_POST['reponse'];
	$theme = $_POST['answer'];


	// avoir le nombre de lignes présentes dans la table pour ainsi incrémenter l'id  de la question à ajouter
	$requete = $con->query("SELECT * FROM quiz");
	$nbrlignes = $requete->rowCount();
	$id = $nbrlignes + 1;


    $stmt = $con->prepare("INSERT INTO quiz (id, question, option1, option2, option3, option4, reponse, theme) VALUES (:id, :question, :option1, :option2, :option3, :option4, :reponse, :theme)");
	$stmt->bindParam('id',$id);
    $stmt->bindParam('question',$question);
    $stmt->bindParam('option1',$option1);
    $stmt->bindParam('option2',$option2);
    $stmt->bindParam('option3',$option3);
    $stmt->bindParam('option4',$option4);
    $stmt->bindParam('reponse',$reponse);
    $stmt->bindParam('theme',$theme);
    $stmt->execute();

	if ($stmt->rowCount() > 0 ) {
		echo "<script>alert('Question ajouté');
		window.location.href = 'allquestions.php'; </script>" ;
	}
	else 
	{
		echo "<script>alert('Erreur, veuillez ressayer'); </script> ";
	}
}

?>


<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Ajouter une question</title>
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
				<h2>Ajouter une question...</h2>
				<form method="post" action="">

					<p>
						<label>Question</label>
						<input type="text" name="question" placeholder="La question ?" required="">
					</p>
					<p>
						<label>reponse</label>
						<input type="text" name="reponse" placeholder="Bonne réponse" required="">
					</p>
					<p>
						<label>Choix #1</label>
						<input type="text" name="choix1" placeholder="Mauvaise réponse 1" required="">
					</p>
					<p>
						<label>Choix #2</label>
						<input type="text" name="choix2" placeholder="Mauvaise réponse 2" required="">
					</p>
					<p>
						<label>Choix #3</label>
						<input type="text" name="choix3" placeholder="Mauvaise réponse 3" required="">
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
						
						<input type="submit" class="btn btn-primary" name="submit" value="Ajouter">
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