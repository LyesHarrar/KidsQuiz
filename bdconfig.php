<?php
/* connexion à notre base de donnée "bdquiz" */
$utilisateur = "root"; // nom d'utilisateur 
$mdp = "";            // mot de passe
$serveur = "localhost";
try {
    $con = new PDO("mysql:host=$serveur;dbname=bdquiz", $utilisateur, $mdp,  array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
    // mettre le mode d'erreur de PDO à exception
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "base de donnée connectée";
}
catch (PDOException $e)
{
    echo "erreur de connection : ". $e->getMessage();
}


/**
 * Created by PhpStorm.
 * User: X240
 * Date: 24/04/2019
 * Time: 22:42
 */
?>
