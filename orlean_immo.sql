/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ orlean_immo /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE orlean_immo;

DROP TABLE IF EXISTS amenagement;
CREATE TABLE `amenagement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenagement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS bien;
CREATE TABLE `bien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(100) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` int NOT NULL,
  `categorie_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `etat_id` int DEFAULT NULL,
  `est_vide` tinyint(1) DEFAULT NULL,
  `residence` tinyint(1) DEFAULT NULL,
  `surface` int DEFAULT NULL,
  `etage` int DEFAULT NULL,
  `duplex` tinyint(1) DEFAULT NULL,
  `ascenseur` tinyint(1) DEFAULT NULL,
  `disponibilité` date DEFAULT NULL,
  `caution` int DEFAULT NULL,
  `loyer` int DEFAULT NULL,
  `charge` int DEFAULT NULL,
  `prix` int DEFAULT NULL,
  `entrée` tinyint(1) DEFAULT NULL,
  `sejour` int DEFAULT NULL,
  `salon` int DEFAULT NULL,
  `double_vitrage` tinyint(1) DEFAULT NULL,
  `volets_roulants` tinyint(1) DEFAULT NULL,
  `gardien` tinyint(1) DEFAULT NULL,
  `calme` tinyint(1) DEFAULT NULL,
  `ensoleillé` tinyint(1) DEFAULT NULL,
  `chambre` int DEFAULT NULL,
  `chauffage_id` int DEFAULT NULL,
  `cuisine_id` int DEFAULT NULL,
  `revetement_id` int DEFAULT NULL,
  `amenagement_id` int DEFAULT NULL,
  `stationnement_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `dpe_id` int DEFAULT NULL,
  `justificatifs_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bien_categorie` (`categorie_id`),
  KEY `fk_bien_type` (`type_id`),
  KEY `fk_bien_etat` (`etat_id`),
  KEY `fk_bien_chauffage` (`chauffage_id`),
  KEY `fk_bien_cuisine` (`cuisine_id`),
  KEY `fk_bien_revetement_sol` (`revetement_id`),
  KEY `fk_bien_amenagement` (`amenagement_id`),
  KEY `fk_bien_stationnement` (`stationnement_id`),
  KEY `fk_bien_image` (`image_id`),
  KEY `fk_bien_dpe` (`dpe_id`),
  KEY `fk_bien_justificatifs` (`justificatifs_id`),
  CONSTRAINT `fk_bien_amenagement` FOREIGN KEY (`amenagement_id`) REFERENCES `amenagement` (`id`),
  CONSTRAINT `fk_bien_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  CONSTRAINT `fk_bien_chauffage` FOREIGN KEY (`chauffage_id`) REFERENCES `chauffage` (`id`),
  CONSTRAINT `fk_bien_cuisine` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`id`),
  CONSTRAINT `fk_bien_dpe` FOREIGN KEY (`dpe_id`) REFERENCES `dpe` (`id`),
  CONSTRAINT `fk_bien_etat` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  CONSTRAINT `fk_bien_image` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `fk_bien_justificatifs` FOREIGN KEY (`justificatifs_id`) REFERENCES `justificatifs` (`id`),
  CONSTRAINT `fk_bien_revetement_sol` FOREIGN KEY (`revetement_id`) REFERENCES `revetement_sol` (`id`),
  CONSTRAINT `fk_bien_stationnement` FOREIGN KEY (`stationnement_id`) REFERENCES `stationnement` (`id`),
  CONSTRAINT `fk_bien_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS categorie;
CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS chauffage;
CREATE TABLE `chauffage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chauffage` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cuisine;
CREATE TABLE `cuisine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuisine` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS dpe;
CREATE TABLE `dpe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dpe` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS etat;
CREATE TABLE `etat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS image;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS justificatifs;
CREATE TABLE `justificatifs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `justificatifs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS revetement_sol;
CREATE TABLE `revetement_sol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `revetement_sol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS stationnement;
CREATE TABLE `stationnement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stationnement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS type;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





















/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
