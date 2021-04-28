-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: orlean_immo
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ orlean_immo /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE orlean_immo;

--
-- Table structure for table `biens`
--

DROP TABLE IF EXISTS `biens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ville` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `code_postal` int DEFAULT NULL,
  `categorie_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `etat_id` int DEFAULT NULL,
  `est_vide` varchar(3) DEFAULT NULL,
  `residence` varchar(3) DEFAULT NULL,
  `surface` int DEFAULT NULL,
  `etage` int DEFAULT NULL,
  `duplex` varchar(3) DEFAULT NULL,
  `ascenseur` varchar(3) DEFAULT NULL,
  `disponibilite` date DEFAULT NULL,
  `caution` int DEFAULT NULL,
  `loyer` int DEFAULT NULL,
  `charge` int DEFAULT NULL,
  `prix` int DEFAULT NULL,
  `sejour` varchar(3) DEFAULT NULL,
  `salon` varchar(3) DEFAULT NULL,
  `double_vitrage` varchar(3) DEFAULT NULL,
  `volets_roulants` varchar(3) DEFAULT NULL,
  `gardien` varchar(3) DEFAULT NULL,
  `calme` varchar(3) DEFAULT NULL,
  `ensoleille` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `chambre` int DEFAULT NULL,
  `chauffage_id` int DEFAULT NULL,
  `cuisine_id` int DEFAULT NULL,
  `revetement_id` int DEFAULT NULL,
  `dpe_c` varchar(20) DEFAULT NULL,
  `besoin_id` int DEFAULT NULL,
  `entree` varchar(3) DEFAULT NULL,
  `terrasse` varchar(3) DEFAULT NULL,
  `cour` varchar(3) DEFAULT NULL,
  `cour_close` varchar(3) DEFAULT NULL,
  `jardin` varchar(3) DEFAULT NULL,
  `jardin_clos` varchar(3) DEFAULT NULL,
  `parking` varchar(3) DEFAULT NULL,
  `garage` varchar(3) DEFAULT NULL,
  `local_velo` varchar(3) DEFAULT NULL,
  `dpe_e` varchar(20) DEFAULT NULL,
  `cave` varchar(3) DEFAULT NULL,
  `grenier` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sous_sol` varchar(3) DEFAULT NULL,
  `logia` varchar(3) DEFAULT NULL,
  `cellier` varchar(3) DEFAULT NULL,
  `balcon` varchar(3) DEFAULT NULL,
  `cheminee` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `piscine` varchar(3) DEFAULT NULL,
  `interphone` varchar(3) DEFAULT NULL,
  `digicode` varchar(3) DEFAULT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `top` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text,
  `visible` varchar(3) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `piece` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bien_dpe_c` (`dpe_c`),
  KEY `fk_bien_dpe_e` (`dpe_e`),
  KEY `fk_biens_types` (`categorie_id`),
  KEY `fk_type_types` (`type_id`),
  KEY `fk_etat_types` (`etat_id`),
  KEY `fk_chauffage_types` (`chauffage_id`),
  KEY `fk_cuisine_types` (`cuisine_id`),
  KEY `fk_revetement_types` (`revetement_id`),
  KEY `fk_besoin_types` (`besoin_id`),
  CONSTRAINT `fk_besoin_types` FOREIGN KEY (`besoin_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_biens_types` FOREIGN KEY (`categorie_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_chauffage_types` FOREIGN KEY (`chauffage_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_cuisine_types` FOREIGN KEY (`cuisine_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_etat_types` FOREIGN KEY (`etat_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_revetement_types` FOREIGN KEY (`revetement_id`) REFERENCES `types` (`id`),
  CONSTRAINT `fk_type_types` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biens`
--

LOCK TABLES `biens` WRITE;
/*!40000 ALTER TABLE `biens` DISABLE KEYS */;
INSERT INTO `biens` VALUES (1,'123 Rue centre bourg','Olivet',45160,6,9,15,'non','oui',22,0,'non','non','2021-05-01',400,420,20,0,'non','non','non','non','non','non','non',1,1,36,1,'G',3,'oui','non','non','non','non','non','non','non','non','D','non','non','non','non','non','non','non','non','non','non','','non','Studio situé dans résidence de standing surface au sol de 22 m²\r\nIl se compose d\'une entrée avec grand placard, meublé d\'un clic-clac, table bar et chaises, un bureau.\r\nKitchenette équipée de plaques de cuisson, réfrigérateur top, lave-linge, micro-ondes, vaisselle fournie.\r\nSalle d\'eau avec meuble sous lavabo, sèche serviettes.\r\n\r\nLumineux : grand Vélux avec volet télécommandé.\r\n\r\nProximité : Ecoles, collèges, Université, commerces, ligne bus 1 et 13','oui','Appartement meublé Appartement - Studio - 22 m2 - Olivet - Quartier Centre Bourg',1,'2021-04-15 00:00:00'),(2,'2 avenue du Zenith','Orléans',45100,6,9,15,'oui','non',18,0,'non','non','2021-05-01',340,350,10,0,'non','non','non','non','non','non','non',1,1,1,1,'F',3,'oui','non','non','non','non','non','non','non','non','D','non','non','non','non','non','non','non','non','non','non','','non','STUDIO ORLEANS SUD\r\n\r\nStudio loué vide ou meublé\r\nIl se compose d\'une entrée. Séjour, lit en mezzanine et kitchenette équipée.\r\nFenêtre Double vitrage.\r\nCour commune close. Parking.\r\n\r\nTrès bien situé, à proximité des transports. ','oui','Appartement Appartement - Studio - 18 m2 - Orléans Sud - Quartier Zenith',1,'2021-04-15 00:00:00'),(3,'56 Rue pavée de saumon','Saint Pryvé Saint Mesmin',45750,6,9,14,'non','non',28,3,'non','non','2021-04-12',280,3732,92,0,'non','non','non','non','non','oui','non',1,26,28,1,'E',3,'oui','non','non','non','non','non','non','non','non','E','non','non','non','non','non','non','non','non','non','non','','non','SAINT PRYVE SAINT MESMIN -\r\n\r\nStudio meublé de 28m² situé dans un petit collectif dans secteur calme. Entièrement meublé et équipé.\r\nSalon de jardin à disposition.\r\nArrêt de bus à proximité.\r\nEntrée, pièce principale lumineuse, coin cuisine aménagée et équipée, salle d\'eau et wc.\r\nA 800m des Moulins du Loiret.\r\nCaution 1mois','oui','Appartement meublé Appartement - Studio - 28 m2 - Saint Pryvé Saint Mesmin',1,'2021-04-15 00:00:00'),(4,'56 Avenue du beau Zenith','Orléans',45100,6,9,14,'oui','non',18,0,'non','non','2021-04-12',280,300,20,0,'oui','oui','non','non','non','non','oui',1,19,35,40,'F',3,'oui','non','non','non','non','non','oui','non','non','Non renseigné','oui','non','non','non','non','non','non','non','non','non','','non','STUDIO ORLEANS SUD / proximité ZENITH\r\n\r\nStudio indépendant comprenant une pièce à vivre, une kitchenette équipée, une salle de douche et WC.\r\nPlace de stationnement dans cour fermée sécurisée, portail électrique avec bip.\r\n\r\nProximité tram et commerces\r\n\r\nPrix : 300 charges comprises','oui','Appartement Appartement - Studio - 18 m2 - Orléans Sud - Quartier Zenith',1,'2021-04-16 00:00:00'),(5,'89 Rue Bernard Tapisse','Orléans',45100,4,11,18,'oui','oui',56,0,'non','non','2021-04-12',680,730,50,0,'oui','oui','non','non','non','oui','non',2,1,1,42,'D',3,'oui','non','non','non','non','non','oui','non','oui','E','oui','non','non','non','non','non','non','non','non','non','','non','ORLEANS SUD / SAINT MARCEAU\r\n\r\nVenez découvrir cet appartement F3 agréable, fonctionnel et lumineux, situé dans une résidence calme offrant 2 places de parking (dont une couverte) et un garage à vélo.\r\n\r\nCet appartement situé coté du Jardin des Plantes, à 5 minutes du tram, 10 min à pied du Centre-Ville comprend une entrée, un séjour avec balcon, une cuisine équipée, un cellier, 2 chambres, une salle de bain et WC.\r\nQuartier calme. ','oui','Appartement Appartement - F3 - 56 m2 - Orléans Sud - Quartier St marceau',3,'2021-04-16 00:00:00'),(6,'14 Rue qui sent bon','Orléans',45100,4,12,14,'oui','oui',63,0,'non','non','2021-05-25',535,635,100,0,'oui','non','non','non','non','non','non',3,1,31,1,'C',3,'oui','non','non','non','non','non','oui','non','non','A','oui','non','non','non','oui','non','non','non','non','non','','non','ORLEANS SUD - ST MARCEAU\r\nAppartement T4 situé dans une résidence fermée et sécurisée, à proximité immédiate des transports, écoles et commerces. Accès rapide au centre ville !\r\nEntrée, séjour lumineux, cuisine avec cellier, 3 chambres avec placards, salle de bain, wc. L\'appartement possède une cave et un parking.\r\n\r\nLoyer : 535\r\nCharges : 100\r\nSoit un loyer charges comprises 635','oui','Appartement Appartement - F4 - 63 m2 - Orléans Sud - Quartier roseraies',4,'2021-04-17 00:00:00'),(7,'5 Rue principale du village','Saint Hilaire Saint Mesmin',45160,5,11,1,'oui','non',75,0,'non','non','2021-04-12',1100,1250,150,0,'oui','oui','oui','non','non','oui','oui',2,1,1,38,'D',3,'oui','non','non','non','oui','non','non','oui','non','D','non','oui','non','non','non','non','oui','non','non','non','','non','SAINT HILAIRE SAINT MESMIN -\r\n\r\nLe Club de L\'immo vous propose de découvrir cette belle maison exposée plein sud située proche du Loiret aux portes de la Sologne, dans un environnement calme, sans vis à vis.\r\n\r\nCette maison à la décoration chaleureuse est agencée d\'une entrée, un séjour avec une cheminée, une cuisine aménagée et équipée, un bureau. 2 chambres, une salle d\'eau avec douche italienne et 2 wc.\r\n\r\nUn jardin de 100m², une terrasse en bois avec barbecue ainsi qu\'un potager autour de la maison complètent ce bien.\r\n\r\nPossibilité de louer pour une courte ou longue durée.\r\n\r\nLoyer : 1250€ charges comprises.\r\nPrix dégressif en fonction de la durée de location.\r\nCaution : 2 mois\r\nVous souhaitez en savoir plus ? Contactez-nous au 02. 38. 83. 99. 4','oui','Maison meublée Maison - F3 - 75 m2 - Saint Hilaire Saint Mesmin',2,'2021-04-17 00:00:00'),(8,'10 Rue derrière le 3eme champs','Boulay les Barres',45140,4,10,15,'non','non',29,0,'non','non','2021-04-12',410,477,67,0,'non','non','non','non','non','non','non',1,1,1,39,'B',3,'oui','non','non','non','non','non','oui','non','non','F','non','non','non','non','non','non','non','non','non','non','','non','APPARTEMENT F2 - BOULAY LES BARRES\r\n\r\nAppartement 2 pièces aménagé avec goût.\r\nd\'une surface de 39 m².\r\n\r\nKitchenette équipée dans la pièce à vivre, une chambre, une salle de bain, wc.\r\nLoué vide ou meublé.\r\n\r\nProche de la Base de Bricy.\r\n\r\nLoyer 410  hors charges + 67  charges (chauffage et eau inclus) soit 477  charges comprises.\r\nCaution 1 mois\r\n\r\nCLUB DE L\'IMMO 02. 38. 83. 99. 40\r\n28 rue du Colombier 45000 ORLEAN','oui','Appartement Appartement - T2 - 32 m2 - Boulay les Barres',2,'2021-04-17 00:00:00'),(9,'5 Rue du PMU','Boulay les Barres',45140,4,10,16,'oui','non',46,0,'non','oui','2021-04-12',484,580,96,0,'oui','non','non','non','non','non','non',1,24,33,39,'E',3,'non','non','non','non','non','non','non','non','non','Non renseigné','oui','non','non','non','non','non','non','non','non','non','','non','BOULAY-LES-BARRES\r\n\r\nAppartement F2 de 48m² idéalement situé proche de la base aérienne Bricy.\r\nCet appartement comprend un salon, une cuisine, une chambre, une salle de bain, wc. Grand jardin commun.\r\nLoué vide ou meublé.\r\nCaution : 1 mois\r\n\r\nLoyer : 484 + 96 de charges. ','oui','Appartement Appartement - T2 - 48 m2 - Boulay les Barres',2,'2021-04-20 00:00:00'),(10,'7 Rue du côté du Kiosque','Charsonville',45130,5,13,15,'oui','non',93,0,'non','non','2021-05-15',500,570,70,0,'oui','oui','oui','non','non','non','non',4,22,31,39,'G',3,'oui','non','non','non','non','non','oui','non','non','G','oui','non','oui','non','oui','oui','non','non','non','non','','non','Situé à 27km Ouest Orléans. Maison refaite rénovée 2012 en peinture. rdc avec entrée, séjour, cuisine ouverte, salle d\'eau et wc. Etage avec 2 chbres, salle d\'eau et wc. Dble vitrage et bonne isolation. Garage individuel et petit jardinet. 560¤ . Le club de l\'Immo 02. 38. 839. 940 frais/190','oui','Maison Maison - T5 - 93 m2 - Charsonville',5,'2021-04-20 00:00:00'),(11,'7 Rue perdue dans la france','Cercottes',45520,5,13,1,'oui','non',120,0,'non','non','2021-04-12',800,900,100,0,'oui','oui','non','non','non','non','non',4,1,1,1,'G',3,'oui','non','non','non','non','non','non','non','non','E','non','non','non','non','non','non','non','non','non','non','','non','Belle maison vide. Parfaite pour une famille qui souhaite vivre dans le calme de la campagne Nord-Ouest','oui','Maison Maison - F5 - 120 m2 - Cercottes',5,'2021-04-24 00:00:00'),(12,'95 Avenue du centre d\'Orléans','Orléans',45000,4,10,16,'oui','oui',54,0,'non','non','2021-04-12',430,450,20,0,'non','oui','non','non','non','non','non',1,22,31,1,'D',3,'oui','non','non','non','non','non','non','non','non','F','non','non','non','non','non','non','non','non','non','non','','non','ORLEANS CENTRE\r\n\r\nAppartement 2 pièces mansardé, surface au sol 55m². Très bien situé, plein centre ville avec parking.\r\n\r\nIl se compose d\'un coin salon, coin séjour, cuisine équipée, une chambre, salle d\'eau avec wc.\r\n\r\nPrix : 430 hors charges + 20 de charges soit un loyer TTC 450\r\n1 mois de caution','oui','Appartement Appartement - T2 - 54 m2 - Orléans',1,'2021-04-24 00:00:00'),(13,'9 Rue du logement que vous y trouverez','Orléans',45000,4,12,1,'oui','non',102,0,'non','non','2021-04-12',850,980,130,0,'oui','oui','oui','non','non','non','non',3,1,1,39,'D',3,'oui','non','non','oui','non','non','oui','non','non','F','non','non','non','non','non','oui','non','non','oui','oui','','non','ORLEANS CENTRE VILLE / Martroi\r\n\r\nTrès bel appartement type 4, de 102m2.\r\nDe standing dans immeuble particulier.\r\n\r\nEntrée sécurisée par interphone. Ascenseur. Plusieurs balcons.\r\nCheminées décoratives.\r\nParquet ancien au sol.\r\n\r\nLoyer : 850 + charges de 130 soit un loyer charges comprises de 980\r\n\r\nCaution 1 mois','oui','Appartement Appartement - T4 - 102 m2 - Orléans - Quartier Martroi',4,'2021-04-24 00:00:00'),(14,'58 Rue bruyante de la gare','Orléans',45000,4,13,17,'oui','oui',134,0,'non','non','2021-04-12',950,1070,120,0,'oui','oui','oui','oui','non','non','non',4,1,33,39,'B',3,'oui','non','non','non','non','non','oui','non','oui','B','non','non','oui','non','non','oui','non','non','non','non','','non','ORLEANS PLACE D\'ARC\r\nF5, de 134m2 hab, en duplex dans une résidence de grand standing.\r\nAppartement refait à neuf.\r\nAu Rch : 1 entrée, 1 grand séjour avec 1 terrasse et 1 balcon, 1 cuisine aménagée, 2 chambres (dont 1 avec grand placard), 1 salle deau, 1 wc indépendant.\r\nA létage : 1 grande mezzanine 2 chambres, 1 salle de bains avec wc, 1 lingerie/dressing\r\nLocal 2 roues.\r\n2 places de parking couvert sécurisées.\r\n\r\nLoyer : 950 + 120 de charges soit un loyer de 1070 charges comprises\r\nCaution 1 mois','oui','Appartement Appartement - F5 - 134 m2 - Orléans - Quartier Gare',5,'2021-04-26 00:00:00'),(15,'5 Rue du bel appartement','Orléans',45000,4,11,14,'oui','non',58,4,'non','non','2021-04-12',0,0,0,154500,'oui','oui','non','non','non','non','non',2,19,31,1,'D',2,'oui','non','non','non','non','non','oui','non','non','Non renseigné','non','non','non','non','non','non','non','non','non','non','','oui','ORLEANS, 5 min de la place du martroi, très bien situé.\r\n5ème et dernier étage.\r\nType 3, de 58 m2 au sol donnant sur les toits.\r\nEntrée dans le séjour/salon, cuisine ouverte aménagée équipée, salle d\'eau et 2 chambres.\r\nCave\r\n\r\nPrix : 154.500? (soit 3 % d\'honoraire à la charge des acquéreurs soit 4500?)','oui','Appartement - F3 - 58 m2',3,'2021-04-26 00:00:00'),(16,'8 Rue vers lawoula','Fleury Les Aubrais',45400,4,11,15,'oui','oui',55,0,'non','non','2021-04-12',0,0,0,97849,'non','non','non','non','non','non','non',2,27,31,41,'E',2,'non','oui','non','non','non','non','non','non','non','Non renseigné','non','non','non','non','non','non','non','non','non','non','','non','FLEURY LES AUBRAIS - 45400\r\n\r\nLe Club de L\'Immo vous propose de découvrir cet appartement de type 3 idéalement situé dans une copropriété calme avec de faibles charges (50€ par mois), à 10 min de la Gare à pied et à proximité de transports (ligne n°6,9,11,12) et du Tram A.\r\n\r\nCet appartement F3 de 58m² propose une entrée sécurisée par interphone et digicode, un séjour, un cellier, 2 chambres, une salle de bain et wc. Une cave et un garage individuel complètent ce bien.\r\n\r\nPrix : 97 850€ HAI (Soit 3% à la charge des acquéreurs soit 2 850?).\r\nPrix hors honoraires : 95 000€','oui','Appartement - F3 - 58 m2',3,'2021-04-26 00:00:00'),(17,'45 Rue d\'ici et là-bas','Fleury Les Aubrais',45400,5,13,15,'oui','non',130,0,'non','non','2021-04-12',0,0,0,226600,'oui','oui','non','non','non','non','non',5,23,33,1,'Non renseigné',2,'oui','non','non','non','oui','non','non','oui','non','Non renseigné','non','non','oui','non','non','non','non','non','non','non','','oui','FLEURY LES AUBRAIS\r\n\r\nA VISITER !\r\nPavillon en retrait de rue, situé dans une rue calme à proximité de la gare.\r\nCe pavillon lumineux est composé au rez-de-chaussée d\'un grand séjour/salon comprenant une grande cuisine aménagée équipée, un cellier attenant et un garage .\r\nUne chambre avec salle d\'eau attenante ainsi que des wc\r\n\r\nVous retrouverez à l\'étage 3 grandes chambres, un bureau / espace détente ainsi qu\'une grande salle de bain.\r\nLe tout sur un terrain clos de 450m².\r\n\r\nPrix : 226.600€ HAI (Soit 6 600€ d\'honoraires à la charge de l\'acquéreur soit 3%).\r\nPrix hors honoraires : 220 000€','oui','Maison - F6 - 130 m2',6,'2021-04-27 00:00:00'),(18,'9 Rue du port d\'Amsterdam','Olivet',45160,4,11,15,'oui','non',63,0,'non','non','2021-04-12',0,0,0,124630,'non','non','non','non','non','non','non',2,1,1,38,'D',2,'oui','non','non','non','non','non','non','non','non','C','non','non','non','non','non','non','non','non','non','non','','non','OLIVET\r\n\r\nAppartement F3 situé dans un secteur calme (Secteur Piscine), proche de tous commerces.\r\n\r\nCette appartement type 3 spacieux de 68,70m² et très bien agencé est situé au 2eme étage avec ascenseur d\'un immeuble résidentiel.\r\n\r\nVous pouvez apprécier de grandes pièces lumineuses avec de très grand dressing dans l\'entrée, ainsi qu\'une cuisine séparée et un séjour. Un coin nuit avec 2 chambres, une salle de bain et wc.\r\n\r\nUne très grande cave et une place de parking numéroté complètent ce bien.\r\n\r\nNombre de lot : 130\r\nCharges copropriété mensuel :115€\r\nTaxe foncière : 1275€\r\n\r\nPrix : 129 780€ HAI (soit 3 780€ d\'honoraires à la charge de l\'acquéreur SOIT 3%).\r\nPrix hors honoraires : 126 000€','oui','Appartement - F3 - 69 m2',3,'2021-04-28 00:00:00'),(19,'2 Ruelle d\'en face','SAINT JEAN DE LA RUELLE',45285,4,11,15,'oui','non',61,0,'non','non','2021-04-12',0,0,0,74160,'non','non','non','non','non','non','non',2,1,1,1,'D',3,'non','non','non','non','non','non','non','non','non','F','non','non','non','non','non','non','non','non','non','non','','non','SAINT JEAN DE LA RUELLE \r\n\r\nLe Club de L\'Immo vous propose de découvrir cet appartement de type 3 vendu loué (620€ cc), situé à proximité de toutes commodités : Centre Commercial d?Auchan, des commerces, du Collège André Malraux, de la ligne de bus n°2 et 4, de la ligne de tram B à quelques mètres et de la Tangentielle.\r\n\r\nD\'une surface de 62m² cet appartement est composé d\'une entrée sécurisée par interphone, d\'un séjour exposé plein sud, de deux chambres, d\'une cuisine américaine aménagée et équipée, d\'une spacieuse salle de bain avec baignoire d\'angle. Fenêtres en double vitrage PVC et portes neuves. Ravalement de façade fait avec isolation. Une cave et un parking complètent ce bien.\r\n\r\nPrix de vente : 74 160 € HAI (dont 3% d\'honoraires à la charge de l\'acquéreur soit 2 160€). Prix hors honoraires : 72 000€','oui','Appartement - F3 - 62 m2',3,'2021-04-28 00:00:00'),(20,'8 Impasse du du bout du chemin','SAINT JEAN DE LA RUELLE',45285,4,13,15,'oui','non',86,0,'non','non','2021-04-12',0,0,0,103000,'non','non','non','non','non','non','non',4,1,1,1,'C',2,'non','non','non','non','non','non','non','non','non','Non renseigné','non','non','non','non','non','non','non','non','non','non','','non','SAINT JEAN DE LA RUELLE\r\n\r\nLe Club de l\'Immo vous propose de découvrir cet appartement de type 5 situé dans une résidence calme et fermée, à proximité du Parc Pierre Loti, du Collège André Malraux et de l\'école primaire François Mitterrand. Proche de toutes commodités, de l\'autoroute A71, bus, tram B, Centre commercial.\r\nCe spacieux appartement F5 de 86m² se compose d\'une entrée sécurisée par interphone, digicode et gardien, d\'un séjour-salon, d\'une cuisine séparé semi aménagée, d\'un couloir, de 3 chambres, d\'un bureau et d\'une salle de douche avec un wc. Vous profiterez également d\'une cave et d\'un parking.\r\n\r\nPrix de vente : 103 000€ HAI (dont 3% d\'honoraires à la charge de l\'acquéreur soit 3 000€.) ','oui','Appartement - F5 - 86 m2',5,'2021-04-28 00:00:00');
/*!40000 ALTER TABLE `biens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justificatifs`
--

DROP TABLE IF EXISTS `justificatifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `justificatifs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `justificatifs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justificatifs`
--

LOCK TABLES `justificatifs` WRITE;
/*!40000 ALTER TABLE `justificatifs` DISABLE KEYS */;
INSERT INTO `justificatifs` VALUES (1,'les attestations de revenu pour les trois derniers mois (fiches de paie, de pension, d\'ASSEDIC, ou contrat d\'embauche)'),(2,'les quittances de loyer de sa précédente location'),(3,'la déclaration d\'impôt sur le revenu'),(4,'si besoin, les fiches de revenu de la personne qui se porte caution');
/*!40000 ALTER TABLE `justificatifs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slogan`
--

DROP TABLE IF EXISTS `slogan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slogan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slogan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slogan`
--

LOCK TABLES `slogan` WRITE;
/*!40000 ALTER TABLE `slogan` DISABLE KEYS */;
INSERT INTO `slogan` VALUES (1,'Une expérience de 16 ans dans l\'immobilier sur Orléans'),(2,'Un suivi personnalisé et un interlocuteur unique'),(3,'Des visites possibles 6 jours sur 7'),(4,'Basées dans plusieurs villes, toutes nos agences travaillent ensemble');
/*!40000 ALTER TABLE `slogan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'nd','Non renseigné'),(2,'besoin','Achat'),(3,'besoin','Location'),(4,'categorie','Appartement'),(5,'categorie','Maison'),(6,'categorie','Studio'),(7,'categorie','Loft'),(8,'categorie','Chambre'),(9,'type','T1'),(10,'type','T2'),(11,'type','T3'),(12,'type','T4'),(13,'type','T5 et plus'),(14,'etat','Ancien'),(15,'etat','Bon état'),(16,'etat','Déco récente'),(17,'etat','Neuf'),(18,'etat','Rénové'),(19,'chauffage','Individuel'),(20,'chauffage','Commun'),(21,'chauffage','Mixte'),(22,'chauffage','Individuel gaz'),(23,'chauffage','Individuel fuel'),(24,'chauffage','Individuel électrique'),(25,'chauffage','Commun gaz'),(26,'chauffage','Commun fuel'),(27,'chauffage','Commun électrique'),(28,'cuisine','Cuisine aménagée'),(29,'cuisine','Cuisine comune'),(30,'cuisine','Cuisine mixte'),(31,'cuisine','Cuisine fermé'),(32,'cuisine','Cuisine fermé équipé'),(33,'cuisine','Cuisine ouverte'),(34,'cuisine','Cuisine ouverte équipé'),(35,'cuisine','Kitchenette'),(36,'cuisine','Kitchenette équipé'),(37,'cuisine','Cuisine Américaine'),(38,'revetement','Moquette'),(39,'revetement','Carrelage'),(40,'revetement','Linoléum'),(41,'revetement','Parquet'),(42,'revetement','Parquet flottant');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28 17:46:35
