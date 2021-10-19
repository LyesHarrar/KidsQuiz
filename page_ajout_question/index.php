<?php include '../bdconfig.php'; ?>
<!DOCTYPE html>
<html lang="fr" >

<head>
  <meta charset="UTF-8">
  <title>Ajouter une question</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


      <link rel="stylesheet" href="css/style.css">


</head>

<body>
    <div class="menu-container" id="toggle">
        <a href="#" class="menu"><i class="fa fa-bars" aria-hidden="true"></i></a>
        </div>

        <form method="POST" action="">

        <div class="boutton">
        <button type="submit" value="submit" name="submit" class="icon-btn add-btn" >
            <div class="add-icon"></div>
            <div class="btn-txt"><strong>Ajouter au quiz</strong></div>
          </button>
            </div>

  <div class="Wrapper">
  <h1 class="Title">Ajoutez une question</h1>


  <div class="Input">
    <input type="text" name="question" id="question" class="Input-text" placeholder="La question ?" required>
    <label for="question" class="Input-label"><strong>La Question</strong></label>
  </div><br><br><br><br>
  <div class="Input">
      <input type="text" name="reponse"  id="reponse" class="Input-text" placeholder="Bonne réponse" required>
      <label for="reponse" class="Input-label"><strong>Réponse correcte</strong></label>
    </div><br><br><br><br><br><br><br>
    <div class="Input">
        <input type="text" name="choix1" id="choix1" class="Input-text" placeholder="Mauvaise réponse 1" required>
        <label for="choix1" class="Input-label"><strong>Choix 1</strong></label>
      </div><br><br><br><br>
      <div class="Input">
          <input type="text" name="choix2" id="choix2" class="Input-text" placeholder="Mauvaise réponse 2" required>
          <label for="choix2" class="Input-label"><strong>Choix 2</strong></label>
        </div><br><br><br><br>
        <div class="Input">
            <input type="text" name="choix3" id="choix3" class="Input-text" placeholder="Mauvaise réponse 3" required>
            <label for="choix3" class="Input-label"><strong>Choix 3</strong></label>
          </div><br><br>
</div>
        </form>



<div class="overlay" id="overlay">
    <nav class="overlay-menu">
      <ul>
      <li ><a href="http://localhost/TER/projetquiz/">Accueil</a></li>
      <li><a href="http://localhost/TER/projetquiz/page_du_quiz/question.php?n=1">Quiz</a></li>
      <li><a href="<?php $_SERVER['PHP_SELF'] ?>">Ajouter une question</a></li>
      <li><a href="../admin/admin.php">Administrateur</a></li>
      <li><a href="../classement/index.php">Classement</a></li>
      </ul>
    </nav>
  </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>

    <script  src="js/index.js"></script>




</body>

</html>
<?php
if(isset($_POST['submit']))
{
  $question = $_POST['question'];
  $reponse = $_POST['reponse'];
  $choix1 = $_POST['choix1'];
  $choix2 = $_POST['choix2'];
  $choix3 = $_POST['choix3'];
  $sql = "INSERT INTO `nquiz` (`nquestion`, `noption1`, `noption2`, `noption3`, `nreponse`) VALUES (:question, :choix1, :choix2, :choix3, :reponse)";
  $stmt = $con->prepare($sql);
  $stmt->bindParam('question',$question);
  $stmt->bindParam('choix1',$choix1);
  $stmt->bindParam('choix2',$choix2);
  $stmt->bindParam('choix3',$choix3);
  $stmt->bindParam('reponse',$reponse);
  $stmt->execute();

  if ($stmt->rowCount() > 0 ){
  header('Location: bravo/index.html');}
}
?>
