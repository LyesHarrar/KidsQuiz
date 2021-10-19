-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 07 juin 2019 à 04:16
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdquiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `nquiz`
--

DROP TABLE IF EXISTS `nquiz`;
CREATE TABLE IF NOT EXISTS `nquiz` (
  `nquestion` varchar(200) NOT NULL,
  `noption1` varchar(200) NOT NULL,
  `noption2` varchar(200) NOT NULL,
  `noption3` varchar(200) NOT NULL,
  `nreponse` varchar(200) NOT NULL,
  PRIMARY KEY (`nquestion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

DROP TABLE IF EXISTS `parametre`;
CREATE TABLE IF NOT EXISTS `parametre` (
  `nbquestions` int(11) NOT NULL,
  `temps` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `parametre`
--

INSERT INTO `parametre` (`nbquestions`, `temps`) VALUES
(5, 15);

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int(11) NOT NULL,
  `question` varchar(200) CHARACTER SET utf8 NOT NULL,
  `option1` varchar(200) CHARACTER SET utf8 NOT NULL,
  `option2` varchar(200) CHARACTER SET utf8 NOT NULL,
  `option3` varchar(200) CHARACTER SET utf8 NOT NULL,
  `option4` varchar(200) CHARACTER SET utf8 NOT NULL,
  `reponse` varchar(200) CHARACTER SET utf8 NOT NULL,
  `userreponse` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `theme` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `reponse`, `userreponse`, `theme`) VALUES
(1, 'Par quel insect le miel est-il fabriqué ?', 'Le papillon', 'L\'abeille', 'La fourmi', 'L\'araignée', 'L\'abeille', '', 'culture générale'),
(2, 'Combien de lettres l\'alphabet compte-t-il ?', '25', '26', '27', '28', '26', '', 'culture générale'),
(3, 'Quelle période de la journée se situe avant midi ?', 'Le matin', 'L\'après-midi', 'Le soir', 'La nuit', 'Le matin', '', 'culture générale'),
(4, 'Sur quel continent se situe la France ?', 'L\'Asie', 'L\'afrique', 'L\'Amérique', 'L\'Europe', 'L\'Europe', '', 'géographie'),
(5, 'Quel est le résultat de 45 + 38 ?', '93', '82', '73', '83', '83', '', 'mathématiques'),
(6, 'Le petit-fils de votre mère peut-être votre neveu mais aussi votre ...', 'Petit-fils', 'Frère', 'Fils', 'Cousin', 'Fils', '', 'réflexion'),
(7, 'Combien y a-t-il de dizaines dans 70 ?', '0', '7', '70', '700', '7', '', 'mathématiques'),
(8, 'Combien de jours y a-t-il dans une semaine ?', '5', '6', '7', '8', '7', '', 'culture générale'),
(9, 'Combien de syllabes le mot coquelicot compte-t-il ?', '2', '3', '4', '5', '4', '', 'culture générale'),
(10, 'Ecrivez quatre-vingts en chiffres.', '4-20', '80', '4', '20', '80', '', 'culture générale'),
(11, 'Quelle lettre suit la lettre T dans l\'alphabet ?', 'Q', 'R', 'S', 'U', 'U', '', 'culture générale'),
(12, 'Pour acheter un livre à 8€, vous donnez un billet de 5€. Combien de pièces de 1€ devez-vous ajouter ?', '2', '3', '8', '5', '3', '', 'réflexion'),
(13, 'De quoi la peau d\'un chien est-elle couverte ?', 'D\'écailles', 'De plumes', 'De poils', 'De cheveux', 'De poils', '', 'culture générale'),
(14, 'Quelle est la capitale de la France ?', 'Paris', 'Berlin', 'Rome', 'Madrid', 'Paris', '', 'géographie'),
(15, 'Quel chiffre faut-il ajouter à 21 pour obtenir 30 ?', '10', '9', '21', '8', '9', '', 'réflexion'),
(16, 'Quel mois suit le mois de septembre ?', 'Août', 'Décembre', 'Octobre', 'Novembre', 'Octobre', '', 'culture générale'),
(17, 'Si demain est dimanche, quel jour sommes-nous ?', 'Vendredi', 'Lundi', 'Mardi', 'Samedi', 'Samedi', '', 'réflexion'),
(18, 'Axel est né en 2006, Julien en 2004, Thomas en 1997 et Nicolas en 2000, qui est l\'aîné ?', 'Julien', 'Axel', 'Thomas', 'Nicolas', 'Thomas', '', 'réflexion'),
(19, 'Si jeudi est le 15 mars, quelle sera la date de jeudi prochain ?', '15 mars', '20 mars', '22 mars', '15 avril', '22 mars', '', 'réflexion'),
(20, 'Quelle est la dernière voyelle de l\'alphabet ?', 'O', 'Y', 'A', 'U', 'Y', '', 'culture générale'),
(21, 'Combien de consonnes y a-t-il dans le mot \"pomme\" ?', '1', '2', '3', '4', '3', '', 'français'),
(22, 'Combien de joueurs compte une équipe de football ?', '9', '10', '11', '12', '11', '', 'sport'),
(23, 'Un bateau se déplace à la vitesse de 9 km/h. Quelle distance parcourt-il en 5 heures ?', '14 km', '25 km', '45 km', '38 km', '45 km', '', 'réflexion'),
(24, 'Comment s\'appelle le résultat d\'une multiplication ?', 'Une somme', 'Un produit', 'Une différence', 'Un quotient', 'Un produit', '', 'culture générale'),
(25, 'Quelle est la bonne orthographe de l\'adverbe suivant ?', 'Patiament', 'Patiemment', 'Paciament', 'Paciamment', 'Patiemment', '', 'français'),
(26, 'Sur quoi pratique-t-on le judo ?', 'Un judogi', 'Un salami', 'Un kimono', 'Un tatami', 'Un tatami', '', 'sport'),
(27, 'De quel arbre le gland est-il le fruit ?', 'Le chêne', 'Le hêtre', 'Le châtaignier', 'L\'érable', 'Le chêne', '', 'culture générale'),
(28, 'Quel est le cri du chat ?', 'L\'aboiement', 'Le croassement', 'Le grognement', 'Le miaulement', 'Le miaulement', '', 'culture générale'),
(29, 'Parmi ces trois mots, lequel est un synonyme de \"décontracté\" ?', 'Stressé', 'Relax', 'Anxieux', 'Pensif', 'Relax', '', 'culture générale'),
(30, 'Comment s\'appelle la méchante bonne femme qui veut se faire des manteaux avec les 101 dalmatiens ?', 'Mère Gothel', 'Cruella d\'Enfer', 'Madame Mim', 'Ursula', 'Cruella d\'Enfer', '', 'dessins animés'),
(31, 'Célèbre ours du \"Livre de la Jungle\", comment s\'appelle-t-il ?', 'Bagheera', 'Baloo', 'Kaa', 'Shere Khan', 'Baloo', '', 'dessins animés'),
(32, 'Quel personnage de Disney a son nez qui s\'allonge s\'il ment ?', 'Pinocchio', 'Picsou', 'Porcinet', 'Dingo', 'Pinocchio', '', 'dessins animés'),
(33, 'Quel chef gaulois rallie à lui les peuples de la Gaule pour combattre Jules César et son armée romaine ?', 'Abraracourcix', 'Astérix', 'Vercingétorix', 'Idéfix', 'Vercingétorix', '', 'histoire'),
(34, 'Quel peuple barbare originaire d\'Asie Centrale envahit la Gaule romaine en 451 mais est finalement repoussé ?', 'Les uns', 'Les Huns', 'Les Perses', 'Les Autres', 'Les Huns', '', 'histoire'),
(35, 'Qui est le roi des Francs, de 481 à 511 ?', 'Charlemagne', 'Clovis', 'Childéric', 'Dagobert', 'Clovis', '', 'histoire'),
(36, '11 x 3 = ?', '30', '33', '36', '39', '33', '', 'mathématiques'),
(37, '5 + 22 = ?', '26', '28', '27', '32', '27', '', 'mathématiques'),
(38, '32 - 9 = ?', '27', '25', '23', '21', '23', '', 'mathématiques'),
(39, 'Dans quel pays se situent les fameuses pyramides des pharaons ?', 'En Egypte', 'En Italie', 'En France', 'En Argentine', 'En Egypte', '', 'histoire'),
(40, '56 + 21 = ?', '67', '77', '87', '75', '77', '', 'mathématiques'),
(41, 'Qui est l\'auteur de la fable \"Le Lièvre et la Tortue\" ?', 'Jean de la Source', 'Jean de la Rivière', 'Jean du Lac', 'Jean de La Fontaine', 'Jean de La Fontaine', '', 'culture générale'),
(42, 'Quel animal dort la tête en bas ?', 'La chouette', 'Le hibou', 'La chauve-souris', 'L\'aigle', 'La chauve-souris', '', 'culture générale'),
(43, 'Je porte une robe noire et déchirée. Je me déplace sur un balai. Qui suis-je ?', 'Une fée', 'Une reine', 'Une princesse', 'Une sorcière', 'Une sorcière', '', 'réflexion'),
(44, 'Je porte un pantalon à bretelles, des chaussures immenses et une perruque. Je suis...', 'Le clown', 'Le fou', 'Le clochard', 'Le roi', 'Le clown', '', 'réflexion'),
(45, 'Je suis coiffée d\'une belle couronne et habite un château. Je suis...', 'La reine', 'La sorcière', 'La bergère', 'La cuisinière', 'La reine', '', 'réflexion'),
(46, 'Je recherche une lampe magique qui renferme un génie qui exauce tous les vœux. Qui suis-je ?', 'Mustapha', 'Aladin', 'Sinbad', 'Atchoum', 'Aladin', '', 'dessins animés'),
(47, 'Je suis un petit garçon qui refuse de grandir. Mon nom est...', 'Wendy', 'Le capitaine Crochet', 'Peter Pan', 'Mouche', 'Peter Pan', '', 'dessin animés'),
(48, 'Quel mois commence juste après le 31 octobre ?', 'Septembre', 'Novembre', 'Décembre', 'Janvier', 'Novembre', '', 'culture générale'),
(49, 'Quel insecte tisse des toiles ?', 'Une cigale', 'Une araignée', 'Une blatte', 'Un papillon', 'Une araignée', '', 'culture générale'),
(50, 'Lors de quelle fête les enfants (et les adultes) se déguisent-ils ?', 'Hallowing', 'Helloween', 'Hellowing', 'Halloween', 'Halloween', '', 'culture générale'),
(51, '5 x 5 = ?', '15', '25', '10', '20', '25', '', 'mathématiques'),
(52, 'Dans Blanche Neige, combien de nains y a-t-ils ?', '8', '7', '6', '5', '7', '', 'dessins animés'),
(53, 'La fée clochette fait partie de quel dessin animé ?', 'Cendrillon', 'La belle et la bête', 'Peter Pan', 'Le roi lion', 'Peter Pan', '', 'dessins animés'),
(54, 'Que fait le nez de Pinocchio lorsqu\'il ment ?', 'Il devient tout rouge', 'Il s\'allonge', 'Il devient tout petit', 'Il disparaît', 'Il s\'allonge', '', 'dessins animés'),
(55, 'Que représente winnie dans le dessin animé ?', 'Un ourson', 'Un tigre', 'Un chien', 'Un âne', 'Un ourson', '', 'dessins animés'),
(56, 'Dans les histoires de Tintin, comment s\'appelle le chien ?', 'Baloo', 'Milou', 'Wafou', 'Tigrou', 'Milou', '', 'dessins animés'),
(57, 'Dans le dessin animé de Blanche Neige, elle meurt, mais comment ?', 'En se faisant tuer par un chasseur', 'D\'épuisement à force de frotter le sol pour le nettoyer', 'En se faisant piquer par un serpent', 'En croquant une pomme empoisonnée', 'En croquant une pomme empoisonnée', '', 'dessins animés'),
(58, 'Astérix et Obélix ont un chien. Mais comment s\'appelle t\'il ?', 'Milou', 'Idéfix', 'Pifou', 'Baloo', 'Idéfix', '', 'dessins animés'),
(59, 'Quelle phrase est au futur ?', 'Vous courez dans les bois', 'Ils adorent les cerises', 'Je demeurai dans ce château', 'Nous irons en vacances', 'Nous irons en vacances', '', 'français'),
(60, 'Quelle phrase est au présent ?', 'Tu as volé un gâteau', 'Vous dites des bêtises', 'Je construisis une barrière', 'Elle démarrait sa voiture', 'Vous dites des bêtises', '', 'français'),
(61, 'Quelle phrase est au passé composé ?', 'J\'ai pris un train', 'Tu as bonne mine', 'Vous êtes sérieux', 'Il apprit une poésie', 'J\'ai pris un train', '', 'français'),
(62, 'Quelle phrase est au passé simple ?', 'Je vis en Amérique', 'Vous faites un joli dessin', 'Nous arrêtions les voleurs', 'Tu compris trop tard ton erreur', 'Tu compris trop tard ton erreur', '', 'français'),
(63, 'Quelle phrase est à l\'imparfait ?', 'Je vais à l\'école', 'Nous rions ensemble', 'Ils débutaient ce sport ', 'Elle refait son lit', 'Ils débutaient ce sport ', '', 'français'),
(64, 'Trouve l\'intrus :', 'Nous mangeons trop tôt', 'Vous voulez dormir', 'Tu es allé au cinéma', 'ils apprennent à lire', 'Tu es allé au cinéma', '', 'français'),
(65, 'Trouve l\'intrus :', 'Il finira demain', 'Nous tirons la corde', 'Ils dormiront bien', 'Vous aurez mal', 'Nous tirons la corde', '', 'français'),
(66, 'Trouve l\'intrus :', 'Il est venu à Paris', 'J\'ai fini mon livre', 'Nous avons eu peur', 'Tu as très faim', 'Tu as très faim', '', 'français'),
(67, 'Trouve l\'intrus :', 'Je vais au cinéma', 'Tu donnais une leçon', 'nous roulions à droite', 'vous souhaitiez le retrouver', 'Je vais au cinéma', '', 'français'),
(68, 'Quel est le temps employé dans la phrase suivante ?\r\nApprends tes leçons !', 'Présent', 'Impératif', 'Imparfait', 'Futur', 'Impératif', '', 'français'),
(69, 'Laquelle de ces phrases négatives est incorrecte ?', 'Je n\'aime pas les artichauts', 'Ils ne voudront jamais assister au spectacle', 'Elle n\'a que ses yeux pour pleurer', 'Nous avons pas mal aux dents', 'Nous avons pas mal aux dents', '', 'français'),
(70, 'Lequel de ces pronoms n\'existe pas ?', 'Un pronom relatif', 'Un pronom qualificatif', 'Un pronom possessif', 'Un pronom personnel', 'Un pronom qualificatif', '', 'français'),
(71, 'Lequel n\'est pas un adverbe ?', 'Lendemain', 'Désormais', 'Jamais', 'Aujourd\'hui', 'Lendemain', '', 'français'),
(72, 'Laquelle n\'est pas une conjonction de coordination ?', 'Or', 'Car', 'Mais', 'Est', 'Est', '', 'français'),
(73, 'Lequel ne fait pas son pluriel en -oux- ?', 'chou', 'joujou', 'clou', 'hibou', 'clou', '', 'français'),
(74, 'Où est la préposition ?', 'Vers', 'Ver', 'Verre', 'Vert', 'Vers', '', 'français'),
(75, 'Quel est le participe passé du verbe \"vouloir\" ?', 'Voulant', 'Voulé', 'Voulu', 'Veux', 'Voulu', '', 'français'),
(76, 'Comment appelle-t-on le premier né ?', 'Cadet', 'Junior', 'Benjamin', 'Aîné', 'Aîné', '', 'culture générale'),
(77, 'Quel verbe ne fait pas partie du 2ème groupe ?', 'Courir', 'Grandir', 'Finir', 'Choisir', 'Courir', '', 'français'),
(78, 'Quelle est la 1ère personne du singulier de l\'imparfait de l\'indicatif du verbe offrir ?', 'J\'offris', 'J\'offrai', 'J\'offrirai', 'J\'offrais', 'J\'offrais', '', 'français'),
(79, 'Le participe présent des verbes se termine par :', 'er', 'ant', 'é', 'ça dépend', 'ant', '', 'français'),
(80, 'Trouve l\'intrus :', 'Dormir', 'Lit', 'Rêver', 'Somnoler', 'Lit', '', 'français'),
(81, 'Quel est le résultat de  1 H 40 + 1 H 40 ?', '2 H 50', '3 H 00', '3 H 10', '3 H 20', '3 H 20', '', 'mathématiques'),
(82, '12 ÷ 2 = ?', '7', '6', '5', '4', '6', '', 'mathématiques'),
(83, 'Un triangle équilatéral a :', '2 côtés égaux', '3 côtés strictement différents', '1 angle droit', '3 côtés égaux', '3 côtés égaux', '', 'mathématiques'),
(84, 'Quel est le périmètre d\'un carré de 5 cm de côté ?', '10 cm', '20 cm', '25 cm²', '50 cm', '20 cm', '', 'mathématiques'),
(85, 'Quel est le résultat de 3,15 x 100 ?', '0,315', '31,50', '315,0', '3150', '315,0', '', 'mathématiques'),
(86, 'Combien de billets de 5 euros doit-on me donner contre un billet de 100 euros ?', '50 billets', '10 billets', '100 billets', '20 billets', '20 billets', '', 'mathématiques'),
(87, '20 ÷ 4 = ?', '5', '4', '6', '7', '5', '', 'mathématiques'),
(88, 'Un mètre est égal à :', '100 mm', '100 dm', '100 cm', '100 dam', '100 cm', '', 'mathématiques'),
(89, 'Combien y a-t-il de minutes dans une heure et demi ?', '150 minutes', '120 minutes', '90 minutes', '60 minutes', '90 minutes', '', 'culture générale'),
(90, 'Qu\'est-ce qui est le plus léger ?', '1 kg de plumes', '100 g de plomb', '1 kg de laine', '1 kg de coton', '100 g de plomb', '', 'réflexion'),
(91, 'Combien y a-t-il de fleurs dans 2 douzaines de roses ?', '24', '20', '12', '02', '24', '', 'mathématiques'),
(92, 'Si un ascenceur peut transporter un poids maximum de 250 kg, combien de personnes de 80 kg peut-il contenir au maximum ?', '2', '3', '4', '5', '3', '', 'réflexion'),
(93, 'Combien de kg y a-t-il dans une tonne ?', '100 kg', '1 000 kg', '10 000 kg', '500 kg', '1 000 kg', '', 'réflexion'),
(94, 'Quelle est la distance parcourue en 3 heures par une voiture qui roule à \r\n50 km/heure  ?', '30 km', '100 km', '150 km', '300 km', '150 km', '', 'réflexion'),
(95, 'Combien de côtés a un losange ?', '10 côtés', '8 côtés', '6 côtés', '4 côtés', '4 côtés', '', 'mathématiques'),
(96, 'J\'ai 100 €, j\'en dépense 23 €, combien m\'en reste-t-il ?', '123€', '87€', '77€', '63€', '77€', '', 'mathématiques'),
(97, 'Par combien doit-on multiplier 7 pour obtenir 49 ?', '5', '6', '7', '8', '7', '', 'mathématiques'),
(98, 'Combien faut-il ajouter à 26 pour obtenir 83 ?', '47', '57', '65', '67', '57', '', 'mathématiques'),
(99, 'Comment appelle-t-on deux droites qui se coupent en formant un angle droit ?', 'parallèles', 'courbes', 'demies droites', 'perpendiculaires', 'perpendiculaires', '', 'mathématiques'),
(100, 'Combien y a-t-il d\'heures dans 180 minutes ?', '3 heures', '4 heures', '5 heures', '6 heures', '3 heures', '', 'mathématiques'),
(101, 'Quel est le chiffre impair ?', '102', '118', '124', '131', '131', '', 'mathématiques'),
(102, '15 - 9 = ?', '24', '6', '4', '10', '6', '', 'mathématiques'),
(103, 'Quel est le résultat de  12 x 11 ?', '231', '213', '132', '123', '132', '', 'mathématiques'),
(104, 'Quelle est la vitesse horaire d\'un piéton qui parcourt 10 km en 2 heures ?', '5 km/heure', '10 km/heure', '20 km/heure', '2 km/heure', '5 km/heure', '', 'mathématiques'),
(105, 'Quelle est la suite logique de 18 - 27 - 36 - ... ?', '43', '44', '45', '46', '45', '', 'mathématiques'),
(106, 'Quel est le périmètre d\'un triangle équilatéral qui a un côté de 3 cm ?', '6 cm', '9 cm', '12 cm', 'On ne peut pas le calculer', '9 cm', '', 'mathématiques'),
(107, '23 + 11 = ?', '33', '43', '34', '44', '34', '', 'mathématiques'),
(108, 'Combien de faces a un parallélépipède ?', '4', '6', '8', '12', '6', '', 'mathématiques'),
(109, 'Quelle est la suite logique de 2 - 4 - 7 - 11 - 16 ... ?', '19', '22', '27', '32', '22', '', 'mathématiques'),
(110, 'Anne a 10 ans, Pierre a 5 ans de plus et Paul 3 ans de moins qu\'Anne, quel est l\'âge de Paul ?', '18 ans', '12 ans', '7 ans', '2 ans', '12 ans', '', 'réflexion'),
(111, 'La distance Paris-Marseille est d\'environ 750 km, le TGV roule en moyenne à 250 km/heure, quel sera le temps approximatif que mettra le TGV pour parcourir cette distance ?', '6 heures', '5 heures', '4 heures', '3 heures', '3 heures', '', 'mathématiques'),
(112, 'Avec 120 Euros, combien puis-je acheter de livres à 15 Euros l\'unité ?', '12', '10', '8', '6', '8', '', 'mathématiques'),
(113, 'Alix loue une voiture 40 € plus 0,10 € par km, elle parcourt 200 km, combien doit-elle payer ?', '810', '240', '120', '60', '60', '', 'mathématiques'),
(114, 'Le quotient est le résultat de quelle opération ?', 'La multiplication', 'L\'addition', 'La soustraction', 'La division', 'La division', '', 'mathématiques'),
(115, 'Sur quel continent trouve-t-on le SÉNÉGAL ?', 'L\'Europe', 'L\'Asie', 'L\'Afrique', 'L\'Océanie', 'L\'Afrique', '', 'géographie'),
(116, 'Dans quelle chaîne de montagne trouve-t-on le l\'Everest, le plus haut sommet du monde ?', 'La cordillère des Andes', 'Les Alpes', 'Les Carpates', 'L\'Himalaya', 'L\'Himalaya', '', 'géographie'),
(117, 'Quelle est la ville située le plus au nord de la FRANCE ?', 'Lille', 'Paris', 'Nantes', 'Perpignan', 'Lille', '', 'géographie'),
(118, 'Quelle est la capitale de la CHINE ?', 'Hong Kong', 'Pékin', 'Canton', 'Tokyo', 'Pékin', '', 'géographie'),
(119, 'Quelle mer n\'existe pas ?', 'La mer jaune', 'La mer Noire', 'La mer bleue', 'La mer rouge', 'La mer bleue', '', 'géographie'),
(120, 'Quelle est la ville la plus peuplée ?', 'Lyon', 'Rennes', 'Bastia', 'Strasbourg', 'Lyon', '', 'géographie'),
(121, 'Un de ces pays ne fait pas partie du Maghreb, lequel ?', 'La Tunisie', 'L\'Algérie', 'Le Maroc', 'Le Soudan', 'Le Soudan', '', 'géographie'),
(122, 'Quel pays n\'a pas de frontières communes avec la FRANCE ?', 'L\'Italie', 'Le Portugal', 'La Suisse', 'L\'Espagne', 'Le Portugal', '', 'géographie'),
(123, 'Quelle est la capitale des États-Unis ?', 'Chicago', 'New York', 'Washington', 'Los Angeles', 'Washington', '', 'géographie'),
(124, 'Comment appelle-t-on les habitants des Pays Bas ?', 'Les Basques', 'Les Paysans', 'Les Hollandais', 'Les Gallois', 'Les Hollandais', '', 'géographie'),
(125, 'Quel pays ne fait pas partie de l\'Union Européenne ?', 'La Grèce', 'La Suisse', 'L\'Autriche', 'L\'Irlande', 'La Suisse', '', 'géographie'),
(126, 'Quel pays n\'est pas situé en Afrique ?', 'La Côte d\'Ivoire', 'Le Sénégal', 'L\'Algérie', 'Le Paraguay', 'Le Paraguay', '', 'géographie'),
(127, 'Quel mer ou océan ne borde pas la France ?', 'La mer Adriatique', 'La Manche', 'L\'océan Atlantique', 'la mer Méditerranée', 'La mer Adriatique', '', 'géographie'),
(128, 'Laquelle de ces villes est une ville italienne ?', 'Valence', 'Milan', 'Lisbonne', 'Madrid', 'Milan', '', 'géographie'),
(129, 'Laquelle n\'est pas une île ?', 'La Corse', 'L\'Irlande', 'L\'Île-de-France', 'La Sicile', 'L\'Île-de-France', '', 'géographie'),
(130, 'Quel pays n\'est pas situé sur le continent américain ?', 'L\'Australie', 'Le Canada', 'Le Mexique', 'L\'Argentine', 'L\'Australie', '', 'géographie'),
(131, 'Laquelle de ces villes n\'est pas une capitale ?', 'Washington', 'Tokyo', 'Paris', 'Genève', 'Genève', '', 'géographie'),
(132, 'Lequel n\'est pas un département français ?', 'Ain', 'Picardie', 'Dordogne', 'Morbihan', 'Picardie', '', 'géographie'),
(133, 'Laquelle de ces villes n\'a pas de port ?', 'Toulon', 'Le Havre', 'Dijon', 'Marseille', 'Dijon', '', 'géographie'),
(134, 'Quelle est la ville située le plus au nord ?', 'Lisbonne', 'Rome', 'Amsterdam', 'Paris', 'Amsterdam', '', 'géographie'),
(135, 'Sur quel continent trouve-t-on le Brésil ?', 'Afrique', 'Océanie', 'Europe', 'Amérique', 'Amérique', '', 'géographie'),
(136, 'Quelle est la Capitale du Danemark ?', 'Stockholm', 'Helsinki', 'Copenhague', 'Oslo', 'Copenhague', '', 'géographie'),
(137, 'Dans quel pays se trouve la Corse ?', 'L\'Italie', 'La France', 'L\'Espagne', 'La Grèce', 'La France', '', 'géographie'),
(138, 'Combien y a-t-il approximativement d\'habitants en France ?', '25 millions', '45 millions', '65 millions', '85 millions', '65 millions', '', 'géographie'),
(139, 'Quel pays n\'est bordé d\'aucune mer ou océan ?', 'Le Canada', 'La Suisse', 'Le Portugal', 'La Belgique', 'La Suisse', '', 'géographie'),
(140, 'Quelle ville est située au bord de la Mer Méditerranée ?', 'Brest', 'Lisbonne', 'Marseille', 'Dakar', 'Marseille', '', 'géographie'),
(141, 'Quel pays est appelé \"le Pays du Soleil Levant\" ?', 'L\'Inde', 'Le Japon', 'La Chine', 'Le Viêt-Nam', 'Le Japon', '', 'géographie'),
(142, 'Où trouve-t-on la Statue de la Liberté ?', 'New York', 'Rome', 'Montréal', 'Los Angeles', 'New York', '', 'géographie'),
(143, 'Lequel de ces mots est du genre féminin ?', 'Pétale', 'Vison', 'Geôle', 'Chenet', 'Geôle', '', 'français'),
(144, 'Que signifie le mot \"mousse\" dans cette phrase \"La mousse pousse au pied des arbres\" ?', 'C\'est un dessert', 'C\'est une plante', 'C\'est un jeune matelot', 'C\'est des bulles de savon', 'C\'est une plante', '', 'français'),
(145, 'Un mot de cette liste n\'est pas un synonyme des autres. Lequel est-ce ?', 'Avaler', 'Manger', 'Engouffrer', 'Parler', 'Parler', '', 'français'),
(146, 'Quel préfixe utilise-t-on pour dire le contraire du mot \"content\" ?', 'A', 'Mal', 'In', 'Mé', 'Mé', '', 'français'),
(147, 'Trouvez le bon homonyme pour \"outil pour couper du bois ou du métal\" ?', 'Si', 'Scie', 'Six', 'S\'y', 'Scie', '', 'français'),
(148, 'Quel préfixe emploie-t-on au mot \"tasser\" ?', 'An', 'En', 'Am', 'Em', 'En', '', 'français'),
(149, 'La phrase \"Léa ira à la mer dans deux mois\" est :', 'Au passé', 'Au présent', 'Au futur', 'À l\'imparfait', 'Au futur', '', 'français'),
(150, 'On dit :', 'Une plat&eacute;e de p&acirc;tes', 'Une p&acirc;t&eacute;e de p&acirc;tes', 'Une pl&acirc;tr&eacute;e de p&acirc;tes', 'Un p&acirc;tre de p&acirc;tes', 'Une plat&eacute;e de p&acirc;tes', '', 'culture g&eacute;n&eacute;rale'),
(151, 'Qu\'a perdu la Mère Michel ?', 'Son argent', 'Son canari', 'Son dentier', 'Son chat', 'Son chat', '', 'culture générale'),
(152, 'Termine l\'expression : qui vole un oeuf, vole ...', 'Une banque', 'Un veuf', 'Une poule', 'Un bœuf', 'Un bœuf', '', 'culture générale'),
(153, 'Dans quel domaine MOZART s\'est-il rendu célèbre ?', 'La littérature', 'La musique', 'Le sport', 'La télévision', 'La musique', '', 'culture générale'),
(154, 'Combien y a-t-il de jours dans une année bissextile ?', '364 jours', '365 jours', '366 jours', '367 jours', '366 jours', '', 'culture générale'),
(155, 'Qui est l\'agent 007 ?', 'Superman', 'James Bond', 'Zorro', 'Terminator', 'James Bond', '', 'culture générale'),
(156, 'Quelle est la monnaie des États-Unis ?', 'Dollars', 'Euros', 'Yens', 'Livres', 'Dollars', '', 'culture générale'),
(157, 'Qui a semé des petits cailloux pour retrouver son chemin ?', 'Peter Pan', 'Alice (du Pays des Merveilles)', 'Le Chat Botté', 'Le Petit Poucet', 'Le Petit Poucet', '', 'culture générale'),
(158, 'Quelle école fréquente Harry Potter ?', 'Oxford', 'Poudlard', 'Cambridge', 'West Point', 'Poudlard', '', 'culture générale'),
(159, 'Quelle est l\'invention des Frères Lumières ?', 'L\'électricité', 'L\'automobile', 'Le cinéma', 'Le téléphone', 'Le cinéma', '', 'culture générale'),
(160, 'De quelle nationalité était Jules CÉSAR ?', 'Romain', 'Grec', 'Égyptien', 'Perse', 'Romain', '', 'histoire'),
(161, 'Qui était l\'ennemi de la FRANCE pendant la première guerre mondiale ?', 'L\'Angleterre', 'L\'Allemagne', 'L\'Espagne', 'L\'Amérique', 'L\'Allemagne', '', 'histoire'),
(162, 'Qui était SAINT LOUIS ?', 'LOUIS XVI', 'LOUIS XIV', 'LOUIS XI', 'LOUIS IX', 'LOUIS IX', '', 'histoire'),
(163, 'Qui a été le 1er Président de la 5ème République Française ?', 'Jacques CHIRAC', 'Le Général DE GAULLE', 'François MITTERRAND', 'Georges POMPIDOU', 'Le Général DE GAULLE', '', 'histoire'),
(164, 'En quelle année a eu lieu la Révolution Française ?', '1750', '1789', '1804', '1914', '1789', '', 'histoire'),
(165, 'Qui a-t-on appelé les poilus ?', 'Les soldats de la guerre de 1939 - 1945', 'Les insurgés', 'Les révolutionnaires', 'Les soldats de la guerre de 1914 - 1918', 'Les soldats de la guerre de 1914 - 1918', '', 'culture générale'),
(166, 'Le Roi Richard Cœur de Lion était :', 'Anglais', 'Français', 'Italien', 'Allemand', 'Anglais', '', 'histoire'),
(167, 'Comment appelait-on l\'écriture des égyptiens sous les pharaons ?', 'cyrillique', 'romaine', 'hiéroglyphes', 'hébraïque', 'hiéroglyphes', '', 'histoire'),
(168, 'Quel est le nom de l\'homme qui a marché pour la 1ère fois sur la lune ?', 'Gagarine', 'Tintin', 'Armstrong', 'Lindbergh', 'Armstrong', '', 'histoire'),
(169, 'Quel peuple commandait Attila ?', 'Les Gaulois', 'Les Romains', 'Les Vikings', 'Les Huns', 'Les Huns', '', 'histoire'),
(170, 'Quel roi s\'est fait décapiter ?', 'Louis XVI', 'Louis XIV', 'François 1er', 'Henri IV', 'Louis XVI', '', 'histoire'),
(171, 'Au moyen âge comment appelait-on les guerriers à cheval ?', 'Jockeys', 'Écuyers', 'Chevaliers', 'Palefreniers', 'Chevaliers', '', 'histoire'),
(172, 'Quel pays a été dirigé par STALINE ?', 'L\'Allemagne', 'L\'URSS', 'La Roumanie', 'Cuba', 'L\'URSS', '', 'histoire'),
(173, 'En quelle année s\'est terminée la première guerre mondiale ?', '1914', '1918', '1870', '1945', '1918', '', 'histoire'),
(174, 'Qui est le fils du roi Henri IV ?', 'Henri V', 'Philippe Auguste', 'Louis XIII', 'Saint Louis', 'Louis XIII', '', 'histoire'),
(175, 'Quel est le nom actuel de l\'Empire Ottoman ?', 'L\'Égypte', 'L\'Iran', 'La Turquie', 'La Grèce', 'La Turquie', '', 'histoire'),
(176, 'Où est mort Napoléon 1er ?', 'Sur l\'Île d\'Elbe', 'À Paris', 'À Ajaccio', 'Sur l\'Île de Saint Hélène', 'Sur l\'Île de Saint Hélène', '', 'histoire'),
(177, 'De quel peuple les Druides étaient-ils les prêtres ?', 'Les Romains', 'Les Gaulois', 'Les Grecs', 'Les Vikings', 'Les Gaulois', '', 'histoire'),
(178, 'En quelle année  la Bastille a-t-elle été prise par les parisiens ?', '1748', '1801', '1789', '1515', '1789', '', 'histoire'),
(179, '36 - 8 = ?', '44', '54', '28', '24', '28', '', 'mathématiques'),
(180, 'De quel pays Abraham Lincoln a-t-il été le Président ?', 'La Grande Bretagne', 'La Russie', 'Les États-Unis', 'Le Canada\r\n', 'Les États-Unis', '', 'histoire'),
(181, 'Comment est morte Jeanne d\'Arc ?', 'Décapitée', 'Brûlée', 'Poignardée', 'Pendue', 'Brûlée', '', 'histoire'),
(182, 'Quel est le pays d\'origine du football ?', 'France', 'Brésil', 'Angleterre', 'Allemagne', 'Angleterre', '', 'sport'),
(183, 'Quel sport pratique Roger FEDERER ?', 'Le tennis', 'Le basket-ball', 'Le football', 'Le rugby', 'Le tennis', '', 'sport'),
(184, 'Dans quel club de football joue Paul POGBA ?', 'Paris Saint Germain', 'Manchester United', 'Barcelone', 'Bayern de Munich', 'Manchester United', '', 'sport'),
(185, 'L\'équipe de rugby des ALL BLACK est originaire de quel pays ?', 'Angleterre', 'Afrique du sud', 'Nouvelle Zélande', 'Australie', 'Nouvelle Zélande', '', 'sport'),
(186, 'Pour remporter un set au tennis, il faut gagner au minimum :', '8 jeux', '4 jeux', '7 jeux', '6 jeux', '6 jeux', '', 'sport'),
(187, 'Dans quel sport peut-on remporter la Coupe Davis ?', 'Le football', 'Le tennis', 'Le rugby', 'Le handball', 'Le tennis', '', 'sport'),
(188, 'Florent MANAUDOU est un champion olympique de :', 'Saut en longueur', 'Cyclisme', 'Natation', 'Judo', 'Natation', '', 'sport'),
(189, 'Lequel de ces hommes n\'est pas un footballeur ?', 'Wayne ROONEY', 'Lionel MESSI', 'François GABART', 'Franck RIBERY', 'François GABART', '', 'sport'),
(190, 'Quel coup n\'est pas utilisé en boxe ?', 'L\'uppercut', 'Le crochet', 'Le direct', 'Le putting', 'Le putting', '', 'sport'),
(191, 'Au rugby, quel pays ne participe pas au tournoi des 6 nations ?', 'L\'Italie', 'L\'Irlande', 'La Roumanie', 'Le Pays de Galle', 'La Roumanie', '', 'sport'),
(192, 'Quelle médaille olympique n\'existe pas ?', 'Or', 'Bronze', 'Cuivre', 'Argent', 'Cuivre', '', 'sport'),
(193, 'Quelle est la durée d\'un match de football ?', '90 minutes', '80 minutes', '60 minutes', '70 minutes', '90 minutes', '', 'sport'),
(194, 'Combien y a-t-il de joueurs dans une équipe de basketball ?', '8', '7', '6', '5', '5', '', 'sport'),
(195, 'A l\'engagement quand y a-t-il  \"let\" au tennis ?', 'Quand le joueur ne touche pas la balle', 'Quand la balle touche le filet', 'Quand la balle sort du court', 'Quand la balle touche la ligne', 'Quand la balle touche le filet', '', 'sport'),
(196, 'Combien faut-il de points pour gagner une manche au tennis de table (ping-pong) ?', '25', '11', '18', '13', '11', '', 'sport'),
(197, 'Dans quel sport s\'affronte-t-on sur un ring ?', 'Boxe', 'Judo', 'Lutte', 'Karaté', 'Boxe', '', 'sport'),
(198, 'Quelle est la nationalité du joueur de tennis Novak DJOKOVIC  ?', 'Américaine', 'Russe', 'Serbe', 'Suisse', 'Serbe', '', 'sport'),
(199, 'Qu\'est-ce que la Route du Rhum ?', 'Une course de bateaux', 'Une course de voitures', 'Une course à pied', 'Une course de vélo', 'Une course de bateaux', '', 'sport'),
(200, 'Dans quel sport marque-t-on \"des essais\" ?', 'Le water-polo', 'Le baseball', 'Le rugby', 'Le cricket', 'Le rugby', '', 'sport'),
(201, 'Le leader du Tour de France cycliste porte un maillot de quelle couleur ?', 'Blanc à pois rouges', 'Vert', 'Arc-en-ciel', 'Jaune', 'Jaune', '', 'sport'),
(202, 'Quelle est la spécialité du champion Teddy RINER ?', 'Boxe', 'Karaté', 'Judo', 'Kung Fu', 'Judo', '', 'sport'),
(203, 'Dans quel sport le ballon est oval ?', 'Aucun', 'Le basketball', 'Le handball', 'Le rugby', 'Le rugby', '', 'sport'),
(204, 'Sur quelle surface fait-on du bobsleigh :', 'La terre battue', 'La glace', 'L\'eau', 'L\'herbe', 'La glace', '', 'sport'),
(205, 'Quelle couleur de ceinture n\'existe pas au judo ?', 'Bleue', 'Grise', 'Verte', 'Marron', 'Grise', '', 'sport'),
(206, 'Les jeux olympiques d\'hiver ont lieu tous les  :', '3 ans', '4 ans', '5 ans ', '6 ans', '4 ans', '', 'sport'),
(207, ' 30 x 2 = ?', '50', '60', '70', '80', '60', '', 'mathématiques'),
(208, 'Comment appelle-t-on, au handball, un tir au but suite à une faute ?', 'Un coup franc', 'Un penalty', 'Un jet de 7 mètres', 'Un lancer-franc', 'Un jet de 7 mètres', '', 'dessin animés'),
(209, 'Comment s\'appelle la petite amie de Mickey Mouse ?', 'Minnie', 'Fionna', 'Daisy', 'Cendrillon', 'Minnie', '', 'dessins animés'),
(210, 'Comment s\'appelle le meilleur ami de Bob l\'éponge ?', 'Sandy, l\'écureuil', 'Carlo, le poulpe', 'Patrick, l\'étoile de mer', 'Gary, l\'escargot', 'Patrick, l\'étoile de mer', '', 'dessins animés'),
(211, 'Comment s\'appelle le jeune garçon dont les 2 jouets préférés sont Woody le cow-boy et Buzz l\'éclair ?', 'Jacky', 'Sammy', 'Andy', 'Barry', 'Andy', '', 'dessins animés'),
(212, ' 45 - 18 = ?', '27', '32', '38', '56', '27', '', 'mathématiques'),
(213, 'Comment s\'appelle la soeur d\'Elsa dans la Reine des neiges ?', 'Jenna', 'Mack', 'Merida', 'Anna', 'Anna', '', 'dessins animés'),
(214, 'Comment s\'appelle le père de Simba dans le roi lion ?', 'Scar', 'Mufasa', 'Remi', 'Oliver', 'Mufasa', '', 'dessins animés'),
(215, 'Comment s\'appelle le singe d\'Aladdin ?', 'Abu', 'Fred', 'Jack', 'Eric', 'Abu', '', 'dessins animés'),
(216, 'Qu\'est-ce qu\'aiment manger Timon et Pumba ?', 'De la viande', 'Ils ne mangent rien', 'Des insectes', 'Des plantes', 'Des insectes', '', 'dessins animés'),
(217, 'Comment s\'appelle le père Simpson ?', 'Moe\'s', 'Homer', 'Papinou', 'Fifi', 'Homer', '', 'dessins animés'),
(218, 'Quel est le nom du père de Pinocchio ?', 'Figaro', 'Gettoni', 'Geppetto', 'Getama', 'Geppetto', '', 'dessins animés'),
(219, 'Comment s\'appelle le camion dans Cars ?', 'Gérard', 'Patrick', 'Mack', 'Pédro', 'Mack', '', 'dessins animés'),
(220, 'Comment s\'appelle l\'île de Vaiana ?', 'Mahoutou', 'Motunui', 'Materinerie', 'Mauritane', 'Motunui', '', 'dessins animés'),
(221, 'Combien de temps dure un match de basket ?', '2 heures', '40 minutes', '1/2 heure', '50 minutes', '40 minutes', '', 'sport'),
(222, 'Quel est la capitale de la chine ?', 'Pékin', 'Tokyo', 'Shangai', 'Hong-Kong', 'Shangai', '', 'géographie'),
(223, '5 x 7 = ?', '35', '36', '57', '42', '35', '', 'mathématiques'),
(224, '7 + ? = 23', '16', '14', '11', '26', '16', '', 'mathématiques'),
(225, '20 ÷ 4 = ?', '5', '4', '10', '6', '5', '', 'mathématiques'),
(226, '45 ÷ 9 = ?', '5', '6', '7', '8', '5', '', 'mathématiques'),
(227, '5 + 6 = ?', '3', '5', '11', '7', '11', NULL, 'math&eacute;matiques'),
(228, '40 - 24 = ?', '12', '19', '16', '24', '16', NULL, 'mathématiques'),
(229, 'Quel instrument utilise-t-on pour peser un objet ou une personne ?', 'Compteur', 'Pendule', 'Balance', 'Thermomètre', 'Balance', NULL, 'culture générale'),
(230, 'Combien y a-t-il de continents sur Terre ?', '4', '6', '5', '3', '5', NULL, 'culture générale'),
(231, '4 + 2 - 2 = ?', '2', '0', '6', '4', '4', NULL, 'mathématiques'),
(232, '0 x 10 = ?', '100', '10', '010', '0', '0', NULL, 'mathématiques'),
(233, '50 ÷ 5 = ?', '5', '15', '25', '10', '10', NULL, 'mathématiques'),
(234, '35 ÷ ? = 5', '5', '6', '4', '7', '7', NULL, 'mathématiques'),
(235, 'K&eacute;vin ach&egrave;te un bonbon &agrave; 2&euro; le caissier lui rends 8&euro;, combien avait K&eacute;vin au d&eacute;but ?', '6&euro;', '5&euro;', '12&euro;', '10&euro;', '10&euro;', NULL, 'culture g&eacute;n&eacute;rale'),
(236, 'Quel nom donne-t-on au deuxième élément (nombre) d’une division ?', 'La dividende', 'Le diviseur', 'Le deuxième terme', 'Le quotient', 'Le diviseur', NULL, 'mathématiques'),
(237, 'Si je veux tracer un cercle, je dois parcourir :', '360°', '180°', '90°', '60°', '360°', NULL, 'mathématiques'),
(238, 'Qui mange le plus dans une pizza à quatre parts ?', 'celui qui mange la moitié de la pizza', 'celui qui mange le quart de la pizza', 'celui qui mange trois parts de pizza', 'celui qui mange le tiers de la pizza', 'celui qui mange trois parts de pizza', NULL, 'réflexion'),
(239, '8 x 7 = ?', '54', '52', '56', '49', '56', NULL, 'mathématiques'),
(240, '89 X 1 = ?', '1', '0', '89', '189', '89', NULL, 'mathématiques');

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `pseudo` varchar(20) NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `score`
--

INSERT INTO `score` (`pseudo`, `point`) VALUES
('joueur01', 5),
('joueur02', 4),
('joueur03', 2),
('joueur04', 1),
('test3', 5),
('test4', 5),
('blu', 2),
('lblblutv', 3),
('teeeest', 5),
('teeeest', 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
