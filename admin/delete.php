<?php
include "../bdconfig.php";
// cette page permets juste de vider la table des nouvelles questions aprés que l'administrateur ait choisis celles qu'ils veut ajouter

 $sqll = "TRUNCATE TABLE nquiz";

            $con->exec($sqll);
            header('Location: validation.php');

?>