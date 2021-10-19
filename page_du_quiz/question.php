<?php include '../bdconfig.php'; ?>
<?php $number = (int) $_GET['n'];?>
<?php session_start(); ?>
<?php
$req = $con->query("SELECT * FROM parametre");
$res = $req->fetch(PDO::FETCH_ASSOC);
$temps = $res['temps'];
if(!isset($_SESSION['tab']))
{
    $_SESSION['tab'] = randtableau($res['nbquestions']);
}
$tab = $_SESSION['tab'];
?>

<!DOCTYPE html>
<html lang="fr" >

<head>
  <meta charset="UTF-8">
  <title>Quiz</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/minireset.css/0.0.2/minireset.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Muli:600'>
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  <div class="container">

 
  <div class="title-container">
  <form method="post" action ="../action.php" id="form">
  <?php 
                             $requete = $con->query("SELECT * FROM quiz WHERE id = $tab[$number]");
                            while($ligne = $requete->fetch(PDO::FETCH_ASSOC)){ ?>
  <h1><strong><?= $ligne['question']; ?></strong></h1><br><br>
    
  	<!-- <div class="choix"> -->
        <center>
  <div class="option">
    <input required type="radio" name="userreponse" id="option1"  onclick="javascript: submit()" value="<?= $ligne['option1']; ?>">
    <label for="option1">
      <span></span>
      <p><?= $ligne['option1']; ?></p>
    </label>
  </div><br>
  <div class="option">
    <input required type="radio" name="userreponse" id="option2" onclick="javascript: submit()" value="<?= $ligne['option2']; ?>">
    <label for="option2">
      <span></span>
      <p><?= $ligne['option2']; ?></p>
    </label>
  </div><br>
  <div class="option">
    <input required type="radio" name="userreponse" id="option3" onclick="javascript: submit()" value="<?= $ligne['option3']; ?>">
    <label for="option3">
      <span></span>
      <p><?= $ligne['option3']; ?></p>
    </label>
  </div><br>
  <div class="option">
    <input required type="radio" name="userreponse" id="option4" onclick="javascript: submit()" value="<?= $ligne['option4']; ?>">
    <label for="option4">
      <span></span>
      <p><?= $ligne['option4']; ?></p>
    </label>
  </div>
  <br>
  <h1 id="display">
    </h1>
</center>

  <input type = "hidden" name ="number" value = "<?= $number ?>" />
  <?php } ?>
  </form>
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

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>


    
       
<script>       
var dis = document.getElementById("display");
var finishTime;
var timerLength = <?= $res['temps'] ?> 
var timeoutID;
var redirect = "http://localhost/TER/projetquiz/resultats/final.php"

<?php if  (!isset($_SESSION['score'])) {//|| ($_SESSION['timer'] == $_SESSION['score']) ) {?>
        localStorage.setItem('myTime', ((new Date()).getTime() + timerLength * 1000));
        if (timeoutID != undefined) window.clearTimeout(timeoutID);
        Update();
<?php }//$_SESSION['timer']=-1; } ?>

if(localStorage.getItem('myTime')){
    Update();
}

function output(sec)
 {
   return  parseInt(sec / 60) + " : " + sec % 60;
 }
  

function Update() {
    finishTime = localStorage.getItem('myTime');
    var timeLeft = (finishTime - new Date());
    // dis.innerHTML = "Time Left: " + Math.max(timeLeft/1000,0);
    // if(timeLeft<=0){ document.getElementById("form").submit();}
    if(timeLeft<=0){window.location.href = redirect;}
    else
    // {dis.innerHTML = "Temps restant: " + Math.floor(timeLeft/1000);}//en secondes
    {dis.innerHTML = output(Math.floor(timeLeft/1000));}//en horloge
    timeoutID = window.setTimeout(Update, 100);
    // console.log(Math.floor(timeLeft/1000));
}
</script>

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
