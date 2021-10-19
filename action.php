<?php include 'bdconfig.php'; ?>
<?php session_start(); ?>
<!-- vérfier si le score existe -->
<?php 
    if(!isset($_SESSION['score']))
    {
        $_SESSION['score'] = 0;
    }
    
    if($_POST)
    {
        if($_POST['number']==1)
        {
            $_SESSION['score'] = 0;
        }

       $number = $_POST['number'];
       $userreponse = $_POST['userreponse'];
       $next = $number+1;
       
    
        // Le choix correcte
        $s = $_SESSION['tab'];
        $requete = $con->query("SELECT * FROM quiz WHERE id = $s[$number]");
        //resultat
        $ligne = $requete->fetch(PDO::FETCH_ASSOC);
        
        if($ligne['reponse']==$userreponse)
        {
            $_SESSION['score']++;
        }
        // else{
        //     header("Location: final.php");
        //     exit();
        // }

        $_SESSION['timer'] = $_SESSION['score'];

        //  $result = $con->query("SELECT * FROM quiz");
        //  $total = $result->rowCount();
        $total = count($_SESSION['tab']);

        // pour savoir quand le quiz se finit
        if($number == $total)
        {
            header("Location: resultats/final.php");
            exit();
        }else
        {
            header("Location: page_du_quiz/question.php?n=".$next);
        }
    }
 ?>
