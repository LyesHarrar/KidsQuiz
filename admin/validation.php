<?php session_start(); ?>
<?php include "../bdconfig.php";
if (isset($_SESSION['admin'])) { // pour vérifier que l'administrateur est toujours connecté
?>

<!DOCTYPE html>
<html lang="fr">
	<head>
        <title>Validation</title>
        <link rel="stylesheet" href="https://bootswatch.com/4/cosmo/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/style1.css">
	</head>

	<body>
		<header>
			<div class="container">
			<h1>Valider les questions en attente !</h1><br>
            <a href="http://localhost/TER/projetquiz/" class="btn btn-primary">Accueil</a>
				<a href="add.php" class="btn btn-success">Ajouter une question</a>
				<a href="allquestions.php" class="btn btn-info">Toutes les questions</a>
				<a href="validation.php" class="btn btn-warning">Valider une question</a>
				<a href="parametre.php" class="btn btn-danger">Paramètres du Quiz</a>
				<a href="exit.php" class="start">Déconnexion</a>
				
			</div>
		</header>

		
	<table class="data-table">
        <br><center>
        <a href = "delete.php" class="btn btn-danger btn-lg btn-block" style="width: 20%;">Vider le tableau</a>
        <br></center>
		<thead>
			<tr>
                
				<th>Question</th>
				<th>Option1</th>
				<th>Option2</th>
				<th>Option3</th>
                <th>Réponse correcte</th>
                <th>Valider</th>
                <th>Thème</th>
                <th>-</th>
			</tr>
		</thead>
		<tbody>
        <?php 
            
            $query = "SELECT * FROM nquiz"; // requète sql nous retournant le tableau classé de la questions la plus récente à la plus ancienne
		
			$requete = $con->query($query);
			
			if ($requete->rowCount() > 0) {
		
            
			 while ($row = $requete->fetch(PDO::FETCH_ASSOC)) {
                $question = $row['nquestion'];
                $option1 = $row['noption1'];
                $option2 = $row['noption2'];
                $option3 = $row['noption3'];
                $answer = $row['nreponse'];
                echo '<tr>'.'<form method="POST" action="">';
                echo '<td>'.'<input type=\'hidden\' name="question" value= "'.$question.'">'.htmlspecialchars($question).'</td>';
                echo '<td>'.'<input type=\'hidden\' name=\'option1\' value="'.$option1.'">'.htmlspecialchars($option1).'</td>';
                echo '<td>'.'<input type=\'hidden\' name=\'option2\' value="'.$option2.'">'.htmlspecialchars($option2).'</td>';
                echo '<td>'.'<input type=\'hidden\' name=\'option3\' value="'.$option3.'">'.htmlspecialchars($option3).'</td>';
                echo '<td>'.'<input type=\'hidden\' name=\'reponse\' value="'.$answer.'">'.htmlspecialchars($answer).'</td>';
               
                echo '<td>'.'<input type=\'submit\' class=\'btn btn-outline-primary\' name=\'valider\' value=\'Valider\'></td>';
                echo '<td>'.'<select name=\'theme\'required><option value=\'culture générale\' class=\'custom-select\'>culture générale</option><option value=\'géographie\'>géographie</option><option value=\'mathématiques\'>mathématiques</option><option value=\'réflexion\'>réflexion</option><option value=\'sport\'>sport</option><option value=\'dessins animés\'>dessins animés</option><option value=\'histoire\'>histoire</option><option value=\'français\'>français</option></select>'.'<td>';
              
                echo "</form></tr>"; 
             }
         }
        ?>
        <?php
        if($_POST)
        {
            $que = ($_POST['question']);
            $rep = ($_POST['reponse']);
            $c1 = ($_POST['option1']);
            $c2 = ($_POST['option2']);
            $c3 = ($_POST['option3']);
            $theme = ($_POST['theme']);

            $requete = $con->query("SELECT * FROM quiz");
            $nbrlignes = $requete->rowCount();
            $id = $nbrlignes + 1;
        
            $sql = "INSERT INTO quiz (id, question, option1, option2, option3, option4, reponse, theme) VALUES (:id, :que, :c1, :c2, :rep, :c3, :rep, :theme)";
            $stmt = $con->prepare($sql);
            $stmt->bindParam('id',$id);
            $stmt->bindParam('que',$que);
            $stmt->bindParam('c1',$c1);
            $stmt->bindParam('c2',$c2);
            $stmt->bindParam('c3',$c3);
            $stmt->bindParam('rep',$rep);
            $stmt->bindParam('theme',$theme);
            $stmt->execute();

           
        
            if ($stmt->rowCount() > 0 ) {
                echo "<script>alert('Question validée');
                window.location.href = 'validation.php'; </script>" ;}
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


