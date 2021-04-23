/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ orlean_immo /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE orlean_immo;

DROP TABLE IF EXISTS besoin;
CREATE TABLE `besoin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `achat-location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS bien;
CREATE TABLE `bien` (
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
  `image_id` int DEFAULT NULL,
  `dpe_c_id` int DEFAULT NULL,
  `justificatifs_id` int DEFAULT NULL,
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
  `dpe_e_id` int DEFAULT NULL,
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
  `coup_de_coeur` varchar(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bien_categorie` (`categorie_id`),
  KEY `fk_bien_type` (`type_id`),
  KEY `fk_bien_etat` (`etat_id`),
  KEY `fk_bien_chauffage` (`chauffage_id`),
  KEY `fk_bien_cuisine` (`cuisine_id`),
  KEY `fk_bien_revetement_sol` (`revetement_id`),
  KEY `fk_bien_image` (`image_id`),
  KEY `fk_bien_justificatifs` (`justificatifs_id`),
  KEY `fk_bien_besoin` (`besoin_id`),
  KEY `fk_bien_dpe_c` (`dpe_c_id`),
  KEY `fk_bien_dpe_e` (`dpe_e_id`),
  CONSTRAINT `fk_bien_besoin` FOREIGN KEY (`besoin_id`) REFERENCES `besoin` (`id`),
  CONSTRAINT `fk_bien_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  CONSTRAINT `fk_bien_chauffage` FOREIGN KEY (`chauffage_id`) REFERENCES `chauffage` (`id`),
  CONSTRAINT `fk_bien_cuisine` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`id`),
  CONSTRAINT `fk_bien_dpe_c` FOREIGN KEY (`dpe_c_id`) REFERENCES `dpe_c` (`id`),
  CONSTRAINT `fk_bien_dpe_e` FOREIGN KEY (`dpe_e_id`) REFERENCES `dpe_e` (`id`),
  CONSTRAINT `fk_bien_etat` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  CONSTRAINT `fk_bien_image` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `fk_bien_justificatifs` FOREIGN KEY (`justificatifs_id`) REFERENCES `justificatifs` (`id`),
  CONSTRAINT `fk_bien_revetement_sol` FOREIGN KEY (`revetement_id`) REFERENCES `revetement_sol` (`id`),
  CONSTRAINT `fk_bien_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS categorie;
CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS chauffage;
CREATE TABLE `chauffage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chauffage` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cuisine;
CREATE TABLE `cuisine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuisine` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS dpe_c;
CREATE TABLE `dpe_c` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dpe` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS dpe_e;
CREATE TABLE `dpe_e` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dpe` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS etat;
CREATE TABLE `etat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS type;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;









/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
