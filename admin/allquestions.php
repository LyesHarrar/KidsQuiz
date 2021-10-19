<?php session_start(); ?>
<?php include "../bdconfig.php";
if (isset($_SESSION['admin'])) { // pour vérifier que l'administrateur est toujours connecté
?>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Toutes les questions</title>
		<link rel="stylesheet" href="https://bootswatch.com/4/cosmo/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/style1.css">
	</head>

	<body>
		<header>
			<div class="container">
			<h1><strong>Toutes les questions du quiz</strong></h1><br>
			<a href="http://localhost/TER/projetquiz/" class="btn btn-primary">Accueil</a>
				<a href="add.php" class="btn btn-success">Ajouter une question</a>
				<a href="allquestions.php" class="btn btn-info">Toutes les questions</a>
				<a href="validation.php" class="btn btn-warning">Valider une question</a>
				<a href="parametre.php" class="btn btn-danger">Paramètres du Quiz</a>
				<a href="exit.php" class="start">Déconnexion</a>
				
			</div>
		</header>
<br>
		
	<center>
	<h3>
	Ici vous pouvez  
  <small class="text-muted">consulter, modifier, ou remplacer</small>
  les questions de votre choix
</h3>
</center>
	<table class="data-table">
		<thead>
			<tr>
				<th>Q.NO</th>
				<th>Question</th>
				<th>Option1</th>
				<th>Option2</th>
				<th>Option3</th>
				<th>Option4</th>
				<th>Réponse correcte</th>
				<th>Thème</th>
				<th>Modifier</th>
			</tr>
		</thead>
		<tbody>
        
        <?php 
            
            $query = "SELECT * FROM quiz ORDER BY id DESC"; // requète sql nous retournant le tableau classé de la questions la plus récente à la plus ancienne
			
			$requete = $con->query($query);
			echo "<br>";
			if ($requete->rowCount() > 0) {
		

			 while ($row = $requete->fetch(PDO::FETCH_ASSOC)) {
                $qno = $row['id'];
                $question = htmlspecialchars($row['question']);
                $option1 = htmlspecialchars($row['option1']);
                $option2 = htmlspecialchars($row['option2']);
                $option3 = htmlspecialchars($row['option3']);
                $option4 = htmlspecialchars($row['option4']);
				$answer = htmlspecialchars($row['reponse']);
				$theme = htmlspecialchars($row['theme']);
                echo "<tr>";
                echo "<td>$qno</td>";
                echo "<td>$question</td>";
                echo "<td>$option1</td>";
                echo "<td>$option2</td>";
                echo "<td>$option3</td>";
                echo "<td>$option4</td>";
				echo "<td>$answer</td>";
				echo "<td>$theme</td>";
                echo "<td> <a class=\'btn btn-link\' href='editquestion.php?qno=$qno'> Modifier </a></td>";
              
                echo "</tr>";
             }
         }
        ?>
	
		</tbody>
		
	</table>
</body>
</html>

<?php } 
else {
	header("location: admin.php"); 
}
?>


