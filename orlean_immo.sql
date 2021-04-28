/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ orlean_immo /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE orlean_immo;

DROP TABLE IF EXISTS biens;
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
  `description` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS justificatifs;
CREATE TABLE `justificatifs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `justificatifs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS slogan;
CREATE TABLE `slogan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slogan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS types;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO justificatifs(id,justificatifs) VALUES(1,'les attestations de revenu pour les trois derniers mois (fiches de paie, de pension, d\'ASSEDIC, ou contrat d\'embauche)'),(2,'les quittances de loyer de sa précédente location'),(3,'la déclaration d\'impôt sur le revenu'),(4,'si besoin, les fiches de revenu de la personne qui se porte caution');

INSERT INTO slogan(id,slogan) VALUES(1,'Une expérience de 16 ans dans l\'immobilier sur Orléans'),(2,'Un suivi personnalisé et un interlocuteur unique'),(3,'Des visites possibles 6 jours sur 7'),(4,'Basées dans plusieurs villes, toutes nos agences travaillent ensemble');
INSERT INTO types(id,type,libelle) VALUES(1,'nd','Non renseigné'),(2,'besoin','Achat'),(3,'besoin','Location'),(4,'categorie','Appartement'),(5,'categorie','Maison'),(6,'categorie','Studio'),(7,'categorie','Loft'),(8,'categorie','Chambre'),(9,'type','T1'),(10,'type','T2'),(11,'type','T3'),(12,'type','T4'),(13,'type','T5 et plus'),(14,'etat','Ancien'),(15,'etat','Bon état'),(16,'etat','Déco récente'),(17,'etat','Neuf'),(18,'etat','Rénové'),(19,'chauffage','Individuel'),(20,'chauffage','Commun'),(21,'chauffage','Mixte'),(22,'chauffage','Individuel gaz'),(23,'chauffage','Individuel fuel'),(24,'chauffage','Individuel électrique'),(25,'chauffage','Commun gaz'),(26,'chauffage','Commun fuel'),(27,'chauffage','Commun électrique'),(28,'cuisine','Cuisine aménagée'),(29,'cuisine','Cuisine comune'),(30,'cuisine','Cuisine mixte'),(31,'cuisine','Cuisine fermé'),(32,'cuisine','Cuisine fermé équipé'),(33,'cuisine','Cuisine ouverte'),(34,'cuisine','Cuisine ouverte équipé'),(35,'cuisine','Kitchenette'),(36,'cuisine','Kitchenette équipé'),(37,'cuisine','Cuisine Américaine'),(38,'revetement','Moquette'),(39,'revetement','Carrelage'),(40,'revetement','Linoléum'),(41,'revetement','Parquet'),(42,'revetement','Parquet flottant');







/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
