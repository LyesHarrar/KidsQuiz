<?php session_start(); ?>
<?php session_destroy(); ?>
<?php include "../bdconfig.php";?>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Classement</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
<center>
  <h1>Table des scores</h1>
<table class="rwd-table">
  <tr>
    <th>Classement</th>
    <th>Pseudo</th>
    <th>Points</th>
 
  </tr>
  <?php 
            
            $query = "SELECT * FROM score ORDER BY point DESC"; //
            $requete = $con->query($query);
            $i=0;
             while ($row = $requete->fetch(PDO::FETCH_ASSOC)) {
               $i++;
                $pseudo = htmlspecialchars($row['pseudo']);
                $point = htmlspecialchars($row['point']);
   echo "<tr>";
   echo "<td>$i</td>";
   echo "<td >$pseudo</td>";
   echo "<td >$point</td>";
  echo  "</tr>"; }?>
 
</table>
<a class="start" href = "http://localhost/TER/projetquiz/">Accueil</a>
</center>

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>




</body>

</html>
