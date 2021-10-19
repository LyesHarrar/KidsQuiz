<?php include 'bdconfig.php'; ?>
<?php session_start(); 
$req = $con->query("SELECT nbquestions FROM parametre");
$res = $req->fetch();

if(isset($_SESSION['score']) || isset($_SESSION['timer']))// Si un score existe déja ou qu'on a déja eclanché un timer et que l'utilisateur a par exemple cliquer sur "précédent" alors le timer est désactivé.
{
    session_destroy();
}
$_SESSION['tab'] = randtableau($res[0]);//le tableau qui contient les id aléatoires des questions du quiz est crée
// print_r($_SESSION['tab']);
?>
<!DOCTYPE html>
<html lang="fr" >

<head>
  <meta charset="UTF-8">
  <title>Quiz</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  <div class="container">
  <div class="menu-container" id="toggle">
  <a href="#" class="menu" ><i class="fa fa-bars" aria-hidden="true"></i></a>
  </div>
  <div class="title-container"><h1><span>Bienvenue au</span><br />QUIZ</h1>
    <div class="circle"></div>
</div>

<svg version="1.1" id="svg-left" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 600 400" style="enable-background:new 0 0 600 400;" xml:space="preserve">
<g>
	<path class="blob" d="M220.262,366.814c41.228-14.367,64.978-58.826,96.198-136.802
		c43.518-108.692,53.929-137.426,67.672-149.92s154.708-58.065,177.821-65.59C576.392,9.802,591.841,5.391,596.66-2H-2v334.452
		c16.689,8.319,35.468,14.508,56.726,18.745C98.453,359.914,179.034,381.181,220.262,366.814z"/>
</g>
</svg>
<svg version="1.1" id="svg-right" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 600 400" style="enable-background:new 0 0 600 400;" xml:space="preserve">
<g>
	<path  class="blob2" d="M361.076,143.985c9.307,26.708,38.108,42.094,88.622,62.319
		c70.412,28.192,89.027,34.936,97.12,43.839c8.093,8.903,37.615,100.223,42.49,115.196c3.045,9.354,5.902,19.361,10.691,22.483V0
		H383.337c-5.389,10.811-9.398,22.976-12.143,36.748C365.547,65.075,351.769,117.277,361.076,143.985z"/>
</g>
</svg>

</div>
  <div class="overlay" id="overlay">
  <nav class="overlay-menu">
    <ul>
      <li ><a href="<?php $_SERVER['PHP_SELF'] ?>">Accueil</a></li>
      <li><a href="page_du_quiz/question.php?n=1">Quiz</a></li>
      <li><a href="page_ajout_question">Ajouter une question</a></li>
      <li><a href="admin/admin.php">Administrateur</a></li>
      <li><a href="classement/index.php">Classement</a></li>
    </ul>
  </nav>
</div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>




</body>

</html>
<?php
    //pour déclarer, remplir un tableau et faire en sorte que le premier index soit 1 et non 0 pour pouvoir l'utiliser plus facilement aprés avec les id de notre table quiz qui eux commencent aussi par id=1
    // le tableau se remplit avec des entiers aléatoires en évitant redondance des valeurs sinon on aurait deux questions identiques dans le même  quiz

    function randtableau($taille)
     {
         global $con;
         $array = array();
         $result = $con->query("SELECT * FROM quiz");
         $total = $result->rowCount();

         while (count($array) != $taille)
         {
             $tmp = rand(1,$total);

             if (!(in_array($tmp,$array))) 
             {
                 array_push($array,$tmp);
             }
         }

         $array = array_combine(range(1, count($array)), array_values($array));
         return $array;
     }
?>
