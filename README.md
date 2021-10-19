# KidsQuiz

Site web effectué en 2017 dans le cadre d'un stage à l'université d'Angers consistant à réaliser une Application web ludique pour jeunes enfants qui représente un jeu de QUIZ permettant notamment a l'administrateur de gérer, modifier, créer, ajouter à partir des questions proposés par les joueurs et supprimer des questions.

![landingpage kidsquiz](bienvenue.png)

## Cahier des charges et rapport complet

[Fonctionnement du site web détaillé avec images et explications](https://raw.githubusercontent.com/LyesHarrar/KidsQuiz/master/rapport.pdf)

## Outils et languages pour la réalisation du projet

la platforme à été réalisée en __HTML/CSS__ en __PHP/mySQL__ pour la gestion de la base de donnée et le fonctionnement du quiz, et du __JS__ pour le timer et autres fonctionnalités secondaires.

## Comment installer

- cloner le repo
- Lancer le site en serveur local (localhost) en utilisant *Apache* ou *Xampp* par exemple.
- pour se connecter il suffit d'importer le fichier sql a phpmyadmin aprés avoir créer una base de donnée sous le nom "__bdquiz__" (*nécessaire*)
  puis il suffit d'acceder au fichier "__bdconfig.php__" et entrez le mot de passe et le nom d'utilisateur de votre serveur local.
- vous pouvez créer une page aide.php et y mettre votre adresse mail pour etre connecté par un futur admin du site en cas de bug ou d'erreur
- mot de passe administrateur : __quizangers__
- rapport complet dans le fichier __rapport.pdf__
