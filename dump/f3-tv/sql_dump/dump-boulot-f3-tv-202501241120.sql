-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: f3-tv
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) DEFAULT NULL,
  `couleur` varchar(7) DEFAULT '#FFFFFF',
  `coefficient` float DEFAULT 1,
  `commentaire` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'AB100L100V2','#8080FF',1,NULL),(2,'AB180L225V1','#FFFF00',1.35,NULL),(3,'AS180L170V3','#90EE90',1,NULL),(4,'AB250M140V1','#ADD8E6',1,NULL),(5,'AB250M150V2','#ADD8E6',1,NULL),(6,'AS250M150V3','#FFA500',1,NULL),(7,'AS250M150V9','#FFA500',1,NULL),(8,'AS250L250V2','#008080',1,NULL),(9,'AS280M140V2','#808080',0.61,NULL),(10,'AS280L240-28V9','#0000FF',1.22,NULL),(11,'AS280L240-28V10','#FF0000',1.22,NULL),(12,'GF35','#90EE90',0.57,NULL),(13,'AS2502M150V8','#FFA500',1,NULL),(14,'GF15V41 Boost','#90EE90',0.5,'A titre indicatif ne prend pas en compte les coeff'),(15,'GFV50 Positif','#90EE90',0.5,'A titre indicatif ne prend pas en compte les coeff');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_defauts`
--

DROP TABLE IF EXISTS `catalogue_defauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogue_defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mot_cle` varchar(50) NOT NULL,
  `fk_type_article` int(11) DEFAULT NULL,
  `fk_categorie_defaut` int(11) NOT NULL,
  `fk_gravite` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_defauts_categories_defauts_FK` (`fk_categorie_defaut`),
  KEY `catalogue_defauts_gravite_defaut_FK` (`fk_gravite`),
  KEY `catalogue_defauts_types_articles_FK` (`fk_type_article`),
  CONSTRAINT `catalogue_defauts_categories_defauts_FK` FOREIGN KEY (`fk_categorie_defaut`) REFERENCES `categories_defauts` (`id`),
  CONSTRAINT `catalogue_defauts_gravite_defaut_FK` FOREIGN KEY (`fk_gravite`) REFERENCES `gravite_defaut` (`id`),
  CONSTRAINT `catalogue_defauts_types_articles_FK` FOREIGN KEY (`fk_type_article`) REFERENCES `types_articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_defauts`
--

LOCK TABLES `catalogue_defauts` WRITE;
/*!40000 ALTER TABLE `catalogue_defauts` DISABLE KEYS */;
INSERT INTO `catalogue_defauts` VALUES (5,'cosse',2,1,1,'Mauvaise soudure cosse'),(6,'connexion',2,1,1,'Câble de sortie trop long'),(7,'connexion',2,1,1,'Câble de sortie trop court'),(8,'connexion',1,1,1,'Cable sortie abîmée'),(9,'connexion',2,1,1,'Cable sortie abîmée'),(10,'bobinage',2,1,1,'Papier long'),(11,'bobinage',2,1,1,'Capote ressorti/absente'),(12,'diode',1,1,1,'Ponte-diode cassée'),(13,'diode',1,1,1,'Erreur de ponte-diode'),(14,'diode',1,1,1,'Cosse mal serti'),(15,'diode',1,1,1,'Câble mal serré'),(16,'equilibrage',1,2,2,'Vibration'),(17,'usinage',1,2,2,'Mauvaise cote'),(18,'usinage',2,2,2,'Mauvaise cote'),(19,'valeurs électriques',6,1,2,'Harmoniques fortes'),(20,'valeurs électriques',2,1,2,'Courant de circulation'),(21,'valeurs électriques',2,1,2,'Ordre des phases'),(22,'bobinage',2,1,2,'Bobine en court-circuit'),(23,'usinage',1,2,2,'Frottement'),(24,'valeurs électriques',6,1,1,'Harmonique élgèrement au dessus de la normale'),(25,'connexion',1,1,1,'gaine de protection sortie ou mal positionner');
/*!40000 ALTER TABLE `catalogue_defauts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_defauts`
--

DROP TABLE IF EXISTS `categories_defauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_defauts`
--

LOCK TABLES `categories_defauts` WRITE;
/*!40000 ALTER TABLE `categories_defauts` DISABLE KEYS */;
INSERT INTO `categories_defauts` VALUES (1,'Electrique'),(2,'Mécanique');
/*!40000 ALTER TABLE `categories_defauts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controles`
--

DROP TABLE IF EXISTS `controles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_planning` int(11) NOT NULL,
  `fk_etat` int(11) NOT NULL,
  `hasDefaut` tinyint(4) NOT NULL DEFAULT 0,
  `commentaire` varchar(255) DEFAULT NULL,
  `date_controle` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `controles_planning_FK` (`fk_planning`),
  KEY `controles_etats_FK` (`fk_etat`),
  KEY `controles_date_controle_IDX` (`date_controle`) USING BTREE,
  CONSTRAINT `controles_etats_FK` FOREIGN KEY (`fk_etat`) REFERENCES `etats` (`id`),
  CONSTRAINT `controles_planning_FK` FOREIGN KEY (`fk_planning`) REFERENCES `planning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controles`
--

LOCK TABLES `controles` WRITE;
/*!40000 ALTER TABLE `controles` DISABLE KEYS */;
INSERT INTO `controles` VALUES (59,63,5,1,NULL,'2024-11-06 14:00:00'),(60,63,7,0,NULL,'2024-11-06 14:00:00'),(61,64,7,0,NULL,'2024-11-06 14:00:00'),(62,65,7,0,NULL,'2024-11-07 14:00:00'),(63,66,7,0,NULL,'2024-11-07 14:00:00'),(64,67,7,0,NULL,'2024-11-07 14:00:00'),(65,68,7,0,NULL,'2024-11-07 14:00:00'),(66,69,7,0,NULL,'2024-11-08 14:00:00'),(67,70,7,0,NULL,'2024-11-08 14:00:00'),(68,71,7,0,NULL,'2024-11-07 14:00:00'),(69,72,7,0,NULL,'2024-11-12 14:00:00'),(70,73,7,0,NULL,'2024-11-12 14:00:00'),(71,74,7,0,NULL,'2024-11-13 14:00:00'),(72,75,7,0,NULL,'2024-11-13 14:00:00'),(73,76,7,0,NULL,'2024-11-13 14:00:00'),(74,77,7,1,NULL,'2024-11-13 14:00:00'),(75,78,7,0,NULL,'2024-11-13 14:00:00'),(76,79,7,0,NULL,'2024-11-14 14:00:00'),(77,80,7,0,NULL,'2024-11-14 14:00:00'),(78,81,7,0,NULL,'2024-11-14 14:00:00'),(79,82,7,0,NULL,'2024-11-21 14:00:00'),(80,83,7,0,NULL,'2024-11-18 14:00:00'),(81,84,7,0,NULL,'2024-11-19 14:00:00'),(82,85,7,0,NULL,'2024-11-19 14:00:00'),(83,86,7,0,NULL,'2024-11-20 14:00:00'),(84,87,7,0,NULL,'2024-11-20 14:00:00'),(85,88,7,0,NULL,'2024-11-21 14:00:00'),(86,89,7,0,NULL,'2024-11-22 14:00:00'),(87,93,8,0,NULL,'2024-11-26 10:36:11'),(88,94,8,0,NULL,'2024-11-27 10:00:00'),(89,95,8,0,NULL,'2024-11-27 10:00:00'),(90,92,8,0,NULL,'2024-11-27 10:00:00'),(91,99,8,0,NULL,'2024-11-27 10:00:00'),(92,90,8,0,NULL,'2024-11-27 10:00:00'),(93,96,8,0,NULL,'2024-11-28 07:51:40'),(94,100,8,0,NULL,'2024-11-29 10:00:00'),(95,101,8,0,NULL,'2024-11-29 10:00:00'),(96,106,8,0,NULL,'2024-11-29 10:00:00'),(97,98,2,0,NULL,'2024-12-02 16:17:14'),(98,102,2,0,NULL,'2024-12-02 16:17:14'),(99,103,2,1,NULL,'2024-12-03 10:20:29'),(100,104,2,1,NULL,'2024-12-03 14:16:34'),(101,104,2,0,NULL,'2024-12-03 14:16:34'),(102,111,2,0,NULL,'2024-12-03 16:00:48'),(103,112,2,0,NULL,'2024-12-04 09:52:23'),(104,91,2,0,NULL,'2024-12-04 11:52:04'),(105,109,2,1,NULL,'2024-12-04 15:18:40'),(106,113,2,0,NULL,'2024-12-05 07:36:09'),(107,108,5,1,'inversion phse 28V','2024-12-11 16:01:17'),(108,108,2,0,NULL,'2024-12-11 16:01:53'),(109,97,2,0,NULL,'2024-12-13 07:51:03'),(110,105,2,1,NULL,'2024-12-13 07:51:28'),(111,114,2,1,NULL,'2024-12-13 07:52:37'),(112,115,2,0,NULL,'2024-12-13 07:53:25'),(113,107,2,0,NULL,'2024-12-13 07:53:49'),(114,119,2,0,NULL,'2024-12-18 12:58:22'),(115,120,2,0,NULL,'2024-12-18 12:58:22'),(116,118,2,0,NULL,'2024-12-18 13:57:13'),(117,121,2,0,NULL,'2024-12-18 14:50:15'),(118,122,2,0,NULL,'2024-12-19 09:56:12'),(119,124,2,0,NULL,'2024-12-19 10:35:57'),(120,125,2,0,NULL,'2024-12-19 14:20:50'),(121,110,2,0,NULL,'2024-12-19 14:20:50'),(125,131,2,0,NULL,'2025-01-08 08:54:20'),(126,130,2,0,NULL,'2025-01-08 08:54:35'),(127,123,2,0,NULL,'2025-01-08 08:56:08'),(128,132,5,1,NULL,'2025-01-08 14:19:55'),(129,132,5,1,NULL,'2025-01-08 14:20:08'),(130,132,5,1,NULL,'2025-01-09 11:23:15'),(131,132,4,0,NULL,'2025-01-09 11:23:34'),(132,156,5,1,NULL,'2025-01-10 10:06:40'),(133,156,4,0,NULL,'2025-01-10 10:06:40'),(134,138,4,1,NULL,'2025-01-13 10:33:17'),(135,139,4,0,NULL,'2025-01-14 07:18:21'),(136,116,4,0,NULL,'2025-01-14 07:18:46'),(137,133,4,0,NULL,'2025-01-14 07:21:12'),(138,140,4,0,NULL,'2025-01-16 14:11:03'),(139,141,4,0,NULL,'2025-01-16 14:11:03'),(140,158,4,0,NULL,'2025-01-16 14:11:03'),(141,159,4,0,NULL,'2025-01-16 14:11:03'),(142,160,4,0,NULL,'2025-01-16 14:11:03'),(143,161,4,0,NULL,'2025-01-16 14:11:03'),(144,117,4,0,NULL,'2025-01-16 14:11:03'),(145,169,4,0,NULL,'2025-01-21 14:31:46'),(146,170,4,0,NULL,'2025-01-21 14:31:46'),(147,134,4,0,NULL,'2025-01-21 14:33:08'),(148,144,4,0,NULL,'2025-01-21 14:33:08'),(150,127,4,0,NULL,'2025-01-21 14:45:13'),(151,128,4,0,NULL,'2025-01-21 14:45:13'),(152,136,4,0,NULL,'2025-01-21 14:45:33'),(153,129,4,0,NULL,'2025-01-22 10:14:47'),(154,130,4,0,NULL,'2025-01-22 12:54:01'),(155,137,4,0,NULL,'2025-01-23 07:08:09'),(156,176,4,0,NULL,'2025-01-23 07:42:29'),(157,177,4,0,NULL,'2025-01-23 08:52:08'),(158,178,4,0,NULL,'2025-01-23 08:52:08'),(159,131,4,0,NULL,'2025-01-23 11:46:15'),(160,132,4,0,NULL,'2025-01-23 15:27:59'),(161,157,4,0,NULL,'2025-01-24 11:18:44');
/*!40000 ALTER TABLE `controles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defauts`
--

DROP TABLE IF EXISTS `defauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_controle` int(11) NOT NULL,
  `fk_type_article` int(11) NOT NULL,
  `fk_catalogue_defaut` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `defauts_controles_FK` (`fk_controle`),
  KEY `defauts_catalogue_defauts_FK` (`fk_catalogue_defaut`),
  KEY `defauts_users_FK` (`fk_user`),
  KEY `defauts_types_articles_FK` (`fk_type_article`),
  CONSTRAINT `defauts_catalogue_defauts_FK` FOREIGN KEY (`fk_catalogue_defaut`) REFERENCES `catalogue_defauts` (`id`),
  CONSTRAINT `defauts_controles_FK` FOREIGN KEY (`fk_controle`) REFERENCES `controles` (`id`),
  CONSTRAINT `defauts_types_articles_FK` FOREIGN KEY (`fk_type_article`) REFERENCES `types_articles` (`id`),
  CONSTRAINT `defauts_users_FK` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defauts`
--

LOCK TABLES `defauts` WRITE;
/*!40000 ALTER TABLE `defauts` DISABLE KEYS */;
INSERT INTO `defauts` VALUES (11,59,2,18,14,NULL,'2024-11-06 14:00:00'),(12,74,2,5,3,NULL,'2024-11-13 19:10:47'),(14,99,6,24,14,NULL,'2024-12-03 10:22:32'),(15,100,6,19,14,NULL,'2024-12-03 14:17:04'),(16,105,6,24,14,NULL,'2024-12-04 15:19:31'),(17,107,6,21,1,NULL,'2024-12-11 16:02:37'),(18,107,6,5,1,NULL,'2024-12-11 16:03:13'),(19,107,6,25,1,NULL,'2024-12-11 16:05:45'),(20,110,6,24,14,NULL,'2024-12-13 07:51:54'),(21,111,6,24,14,NULL,'2024-12-13 07:53:05'),(22,128,6,19,14,NULL,'2025-01-08 14:20:50'),(23,129,6,19,14,NULL,'2025-01-08 14:20:50'),(24,130,6,19,14,NULL,'2025-01-09 11:34:48'),(25,132,6,20,14,NULL,'2025-01-10 10:07:21'),(26,134,6,24,14,NULL,'2025-01-13 10:33:45');
/*!40000 ALTER TABLE `defauts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER update_hasDefaut

AFTER INSERT ON defauts

FOR EACH ROW

BEGIN

    UPDATE controles 

    SET hasDefaut = 1 

    WHERE id = NEW.fk_controle;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `etats`
--

DROP TABLE IF EXISTS `etats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) DEFAULT NULL,
  `couleur` varchar(7) DEFAULT '#FFFFFF',
  `bg_color` varchar(7) DEFAULT NULL,
  `fg_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etats`
--

LOCK TABLES `etats` WRITE;
/*!40000 ALTER TABLE `etats` DISABLE KEYS */;
INSERT INTO `etats` VALUES (1,'En Attente','#FFFF00','#FFFF99','#B3B300'),(2,'En Cours','#808080','#CCCCCC','#5A5A5A'),(3,'Disponible','#00FF00','#99FF99','#00B300'),(4,'CONFORME','#00FF00','#99FF99','#5A5A5A'),(5,'NON CONFORME','#FF0000','#FF9999','#B30000'),(6,'DEFAUT MINEUR','#FFA500','#FFDB99','#B37300'),(7,'Livrée','#0000ff','#9999ff','#0000b3'),(8,'Attente livraison','#EE82EE','#F8CDF8','#A75BA7');
/*!40000 ALTER TABLE `etats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gravite_defaut`
--

DROP TABLE IF EXISTS `gravite_defaut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gravite_defaut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `poids` float DEFAULT 1,
  `couleur` varchar(7) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravite_defaut`
--

LOCK TABLES `gravite_defaut` WRITE;
/*!40000 ALTER TABLE `gravite_defaut` DISABLE KEYS */;
INSERT INTO `gravite_defaut` VALUES (1,'mineur',0.5,'#FFA500','Défaut mineur '),(2,'majeur',1,'#FF0000','Défaut Majeur');
/*!40000 ALTER TABLE `gravite_defaut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planning`
--

DROP TABLE IF EXISTS `planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_article` int(11) NOT NULL,
  `fk_type_article` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `fk_etat` int(11) NOT NULL,
  `semaine` varchar(10) DEFAULT NULL,
  `engagement` varchar(10) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `prete` tinyint(1) NOT NULL DEFAULT 0,
  `livree` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planning_unique` (`fk_article`,`numero`),
  KEY `planning_etats_FK` (`fk_etat`),
  KEY `planning_type_article_FK` (`fk_type_article`),
  KEY `planning_engagement_unique_IDX` (`engagement`) USING BTREE,
  KEY `planning_fk_article_IDX` (`fk_article`) USING BTREE,
  KEY `planning_prete_IDX` (`prete`) USING BTREE,
  CONSTRAINT `planning_articles_FK` FOREIGN KEY (`fk_article`) REFERENCES `articles` (`id`),
  CONSTRAINT `planning_etats_FK` FOREIGN KEY (`fk_etat`) REFERENCES `etats` (`id`),
  CONSTRAINT `planning_modeles_FK` FOREIGN KEY (`fk_article`) REFERENCES `articles` (`id`),
  CONSTRAINT `planning_type_article_FK` FOREIGN KEY (`fk_type_article`) REFERENCES `types_articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning`
--

LOCK TABLES `planning` WRITE;
/*!40000 ALTER TABLE `planning` DISABLE KEYS */;
INSERT INTO `planning` VALUES (63,9,6,951,7,'2024-45','2024-45',NULL,1,1),(64,9,6,952,7,'2024-45','2024-45',NULL,1,1),(65,9,6,953,7,'2024-45','2024-45',NULL,1,1),(66,9,6,954,7,'2024-45','2024-45',NULL,1,1),(67,11,6,566,7,'2024-45','2024-45',NULL,1,1),(68,11,6,567,7,'2024-45','2024-45',NULL,1,1),(69,11,6,568,7,'2024-45','2024-45',NULL,1,1),(70,7,6,43,7,'2024-45','2024-45',NULL,1,1),(71,2,6,1435,7,'2024-45','2024-45',NULL,1,1),(72,11,6,569,7,'2024-46','2024-46',NULL,1,1),(73,9,6,955,7,'2024-46','2024-46',NULL,1,1),(74,9,6,956,7,'2024-46','2024-46',NULL,1,1),(75,11,6,570,7,'2024-46','2024-46',NULL,1,1),(76,11,6,571,7,'2024-46','2024-46',NULL,1,1),(77,10,6,890,7,'2024-46','2024-46',NULL,1,1),(78,6,6,1794,7,'2024-46','2024-46',NULL,1,1),(79,9,6,957,7,'2024-46','2024-46',NULL,1,1),(80,2,6,1436,7,'2024-46','2024-46',NULL,1,1),(81,2,6,1437,7,'2024-46','2024-46',NULL,1,1),(82,2,6,1438,7,'2024-47','2024-47',NULL,1,1),(83,11,6,572,7,'2024-47','2024-47',NULL,1,1),(84,11,6,573,7,'2024-47','2024-47',NULL,1,1),(85,11,6,574,7,'2024-47','2024-47',NULL,1,1),(86,11,6,575,7,'2024-47','2024-47',NULL,1,1),(87,11,6,576,7,'2024-47','2024-47',NULL,1,1),(88,11,6,577,7,'2024-47','2024-47',NULL,1,1),(89,7,6,44,7,'2024-47','2024-47',NULL,1,1),(90,2,6,1439,7,'2024-48','2024-48',NULL,1,1),(91,2,6,1441,7,'2024-48','2024-49',NULL,1,1),(92,11,6,578,7,'2024-48','2024-48',NULL,1,1),(93,9,6,959,7,'2024-49','2024-48',NULL,1,1),(94,9,6,960,7,'2024-49','2024-48',NULL,1,1),(95,9,6,961,7,'2024-49','2024-48',NULL,1,1),(96,9,6,962,7,'2024-49','2024-48',NULL,1,1),(97,10,6,891,7,'2024-49','2024-50',NULL,1,1),(98,2,6,1440,7,'2024-49','2024-49',NULL,1,1),(99,11,6,579,7,'2024-49','2024-48',NULL,1,1),(100,11,6,580,7,'2024-49','2024-48',NULL,1,1),(101,9,6,963,7,'2024-50','2024-48',NULL,1,1),(102,9,6,964,7,'2024-50','2024-49',NULL,1,1),(103,9,6,965,7,'2024-50','2024-49',NULL,1,1),(104,9,6,966,7,'2024-50','2024-49',NULL,1,1),(105,10,6,892,7,'2024-50','2024-50',NULL,1,1),(106,7,6,45,7,'2024-50','2024-48',NULL,1,1),(107,7,6,46,7,'2024-50','2024-50',NULL,1,1),(108,2,6,1442,7,'2024-50','2024-50',NULL,1,1),(109,11,6,581,7,'2024-50','2024-49',NULL,1,1),(110,11,6,582,7,'2024-50','2024-51',NULL,1,1),(111,9,6,967,7,'2024-51','2024-49',NULL,1,1),(112,9,6,968,7,'2024-51','2024-49',NULL,1,1),(113,9,6,969,7,'2024-51','2024-49',NULL,1,1),(114,9,6,970,7,'2024-51','2024-50','Bobinage DEE',1,1),(115,2,6,1443,7,'2024-51','2024-50',NULL,1,1),(116,11,6,583,7,'2024-51','2025-03',NULL,1,1),(117,11,6,584,7,'2024-51','2025-03',NULL,1,1),(118,2,6,1444,7,'2025-01','2024-51',NULL,1,1),(119,9,6,971,7,'2025-02','2024-51',NULL,1,1),(120,9,6,972,7,'2025-02','2024-51',NULL,1,1),(121,9,6,973,7,'2025-02','2024-51',NULL,1,1),(122,9,6,974,7,'2025-02','2024-51',NULL,1,1),(123,10,6,893,7,'2025-02','2025-02',NULL,1,1),(124,2,6,1445,7,'2025-02','2024-51',NULL,1,1),(125,7,6,47,7,'2025-02','2024-51',NULL,1,1),(126,7,6,NULL,1,'2025-02',NULL,NULL,0,NULL),(127,11,6,585,2,'2025-02','2025-04',NULL,1,NULL),(128,11,6,586,2,'2025-02','2025-04',NULL,1,NULL),(129,9,6,988,2,'2025-03','2025-04',NULL,1,NULL),(130,9,6,989,2,'2025-03','2025-04',NULL,1,NULL),(131,9,6,990,1,'2025-03','2025-04',NULL,1,NULL),(132,9,6,991,1,'2025-03','2025-04',NULL,1,NULL),(133,10,6,894,7,'2025-03','2025-03',NULL,1,1),(134,10,6,895,2,'2025-03','2025-04',NULL,1,NULL),(135,2,6,NULL,1,'2025-03',NULL,NULL,0,NULL),(136,11,6,587,2,'2025-03','2025-04',NULL,1,NULL),(137,11,6,588,2,'2025-03','2025-04',NULL,1,NULL),(138,9,6,979,7,'2025-04','2025-03',NULL,1,1),(139,9,6,980,7,'2025-04','2025-03',NULL,1,1),(140,9,6,981,7,'2025-04','2025-03',NULL,1,1),(141,9,6,982,7,'2025-04','2025-03',NULL,1,1),(142,2,6,NULL,1,'2025-04',NULL,NULL,0,NULL),(143,11,6,NULL,1,'2025-04',NULL,NULL,0,NULL),(144,10,6,896,2,'2025-04','2025-04',NULL,1,NULL),(145,11,6,NULL,1,'2025-04',NULL,NULL,0,NULL),(146,10,6,NULL,1,'2025-04',NULL,NULL,0,NULL),(147,4,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(148,4,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(149,4,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(150,4,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(151,2,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(152,11,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(153,11,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(154,10,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(155,10,6,NULL,1,'2025-05',NULL,NULL,0,NULL),(156,6,6,NULL,7,'2025-06','2025-02',NULL,1,1),(157,13,6,4,1,'2025-06','2025-04',NULL,1,NULL),(158,9,6,983,7,'2025-06','2025-03',NULL,1,1),(159,9,6,984,7,'2025-06','2025-03',NULL,1,1),(160,9,6,985,7,'2025-06','2025-03',NULL,1,1),(161,9,6,986,7,'2025-06','2025-03',NULL,1,1),(162,11,6,NULL,1,'2025-06',NULL,NULL,0,NULL),(163,10,6,NULL,1,'2025-06',NULL,NULL,0,NULL),(164,10,6,NULL,1,'2025-06',NULL,NULL,0,NULL),(165,11,6,NULL,1,'2025-06',NULL,NULL,0,NULL),(169,9,6,987,2,'2025-07','2025-04','rajouter car manque planning',1,NULL),(170,9,6,958,2,'2025-07','2025-04','rajouter car manque planning',1,NULL),(175,1,6,NULL,1,'2025-04','2025-04','Ajouter car pas dans le planning',0,NULL),(176,14,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL),(177,14,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL),(178,14,7,NULL,2,'2025-04','2025-05','ajouter pour test',0,NULL),(181,15,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL);
/*!40000 ALTER TABLE `planning` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER trg_update_etat_after_livree
BEFORE UPDATE ON planning
FOR EACH ROW
BEGIN
   
  IF NEW.livree IS NOT NULL AND OLD.livree IS NULL THEN
    SET NEW.fk_etat = 7;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `presence`
--

DROP TABLE IF EXISTS `presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_operateurs` int(11) NOT NULL,
  `nb_heures_normales` float NOT NULL DEFAULT 8.75,
  `nb_heures_supp` float NOT NULL DEFAULT 0,
  `date_jour` datetime NOT NULL DEFAULT current_timestamp(),
  `heures_supp` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presence`
--

LOCK TABLES `presence` WRITE;
/*!40000 ALTER TABLE `presence` DISABLE KEYS */;
INSERT INTO `presence` VALUES (26,14,8.75,0,'2024-11-04 00:00:00',0),(27,14,8.75,0,'2024-11-05 00:00:00',0),(28,14,8.75,0,'2024-11-06 00:00:00',0),(29,14,8.75,0,'2024-11-07 00:00:00',0),(30,5,4.75,0,'2024-11-08 00:00:00',1),(31,14,8.75,0,'2024-11-11 00:00:00',0),(32,14,8.75,0,'2024-11-12 00:00:00',0),(33,14,8.75,0,'2024-11-13 00:00:00',0),(34,14,8.75,0,'2024-11-14 00:00:00',0),(35,5,4.75,0,'2024-11-15 00:00:00',1),(36,14,8.75,0,'2024-11-18 00:00:00',0),(37,14,8.75,0,'2024-11-19 00:00:00',0),(38,14,8.75,0,'2024-11-20 00:00:00',0),(39,14,8.75,0,'2024-11-21 00:00:00',0),(40,5,4.75,0,'2024-11-22 00:00:00',1),(41,14,8.75,0,'2024-11-25 19:53:08',0),(42,11,8.75,0,'2024-11-26 09:22:29',0),(43,12,8.75,0,'2024-11-27 10:00:00',0),(44,12,8.75,0,'2024-11-28 07:18:20',0),(45,6,4.75,0,'2024-11-29 10:00:00',1),(46,12,8.75,0,'2024-12-02 07:46:10',0),(47,13,8.75,0,'2024-12-03 07:46:10',0),(48,13,8.75,0,'2024-12-04 07:46:10',0),(49,13,8.75,0,'2024-12-05 07:46:10',0),(50,1,4.75,0,'2024-12-06 07:46:10',1),(51,13,8.75,0,'2024-12-09 07:08:52',0),(52,13,8.75,0,'2024-12-10 07:08:52',0),(53,12,8.75,0,'2024-12-11 07:08:52',0),(54,12,8.75,0,'2024-12-12 07:08:52',0),(55,6,4.75,0,'2024-12-13 07:49:46',1),(56,13,8.75,0,'2024-12-16 12:55:21',0),(57,13,8.75,0,'2024-12-17 12:55:21',0),(58,14,8.75,0,'2024-12-18 12:55:21',0),(59,14,8.75,0,'2024-12-19 12:55:21',0),(61,13,8.75,0,'2025-01-06 08:58:57',0),(62,12,8.75,0,'2025-01-07 08:58:57',0),(63,14,8.75,0,'2025-01-08 08:58:57',0),(64,14,8.75,0,'2025-01-09 08:59:41',0),(65,3,4.75,0,'2025-01-10 07:04:37',1),(66,14,8.75,0,'2025-01-13 10:31:08',0),(67,13,8.75,0,'2025-01-14 10:31:08',0),(68,13,8.75,0,'2025-01-15 10:31:08',0),(69,13,8.75,0,'2025-01-16 10:31:08',0),(70,1,4.75,0,'2025-01-17 08:00:00',1),(71,14,8.75,0,'2025-01-20 14:23:16',0),(72,14,8.75,0,'2025-01-21 14:23:16',0),(73,14,8.75,0,'2025-01-22 14:23:40',0),(74,14,8.75,0,'2025-01-23 14:23:40',0),(75,4,4.75,0,'2025-01-24 14:23:40',1);
/*!40000 ALTER TABLE `presence` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER ajuster_heures_vendredi_insert

BEFORE INSERT ON presence

FOR EACH ROW

BEGIN

    
    IF DAYOFWEEK(NEW.date_jour) = 6 THEN

        SET NEW.nb_heures_normales = 4.75;

        SET NEW.heures_supp = 1;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER ajuster_heures_vendredi_update

BEFORE UPDATE ON presence

FOR EACH ROW

BEGIN

    
    IF DAYOFWEEK(NEW.date_jour) = 6 THEN

        SET NEW.nb_heures_normales = 4.75;

        SET NEW.heures_supp = 1;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `types_articles`
--

DROP TABLE IF EXISTS `types_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_articles`
--

LOCK TABLES `types_articles` WRITE;
/*!40000 ALTER TABLE `types_articles` DISABLE KEYS */;
INSERT INTO `types_articles` VALUES (1,'Rotor',NULL),(2,'Stator',NULL),(3,'Palier',NULL),(4,'Inducteur',NULL),(5,'Induit',NULL),(6,'Alternateur',NULL),(7,'Compresseur',NULL);
/*!40000 ALTER TABLE `types_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'justin'),(2,'germain'),(3,'faufana'),(4,'abdellah'),(5,'abderraman'),(6,'régis'),(7,'abdou'),(8,'souma'),(9,'phillipe'),(10,'lahoucine'),(11,'camara'),(12,'gervai'),(13,'thibeau'),(14,'david');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vue_defauts`
--

DROP TABLE IF EXISTS `vue_defauts`;
/*!50001 DROP VIEW IF EXISTS `vue_defauts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vue_defauts` AS SELECT 
 1 AS `controle_id`,
 1 AS `date_controle`,
 1 AS `gravite`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vue_engagement`
--

DROP TABLE IF EXISTS `vue_engagement`;
/*!50001 DROP VIEW IF EXISTS `vue_engagement`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vue_engagement` AS SELECT 
 1 AS `article`,
 1 AS `couleur`,
 1 AS `engagement`,
 1 AS `engagement_total`,
 1 AS `prete_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vue_planning`
--

DROP TABLE IF EXISTS `vue_planning`;
/*!50001 DROP VIEW IF EXISTS `vue_planning`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vue_planning` AS SELECT 
 1 AS `id`,
 1 AS `libelle`,
 1 AS `modele_couleur`,
 1 AS `numero`,
 1 AS `status`,
 1 AS `bg_color`,
 1 AS `fg_color`,
 1 AS `semaine`,
 1 AS `livree`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'f3-tv'
--

--
-- Final view structure for view `vue_defauts`
--

/*!50001 DROP VIEW IF EXISTS `vue_defauts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_defauts` AS select `c`.`id` AS `controle_id`,`c`.`date_controle` AS `date_controle`,(select `gd`.`libelle` from ((`defauts` `d` join `catalogue_defauts` `cd` on(`d`.`fk_catalogue_defaut` = `cd`.`id`)) join `gravite_defaut` `gd` on(`cd`.`fk_gravite` = `gd`.`id`)) where `d`.`fk_controle` = `c`.`id` order by `gd`.`poids` desc limit 1) AS `gravite` from `controles` `c` order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vue_engagement`
--

/*!50001 DROP VIEW IF EXISTS `vue_engagement`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_engagement` AS select `m`.`libelle` AS `article`,`m`.`couleur` AS `couleur`,`p`.`engagement` AS `engagement`,count(`p`.`id`) AS `engagement_total`,sum(case when `p`.`prete` = 1 then 1 else 0 end) AS `prete_total` from (`planning` `p` join `articles` `m` on(`p`.`fk_article` = `m`.`id`)) group by `m`.`libelle`,`m`.`couleur`,`p`.`engagement` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vue_planning`
--

/*!50001 DROP VIEW IF EXISTS `vue_planning`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_planning` AS select `p`.`id` AS `id`,`a`.`libelle` AS `libelle`,`a`.`couleur` AS `modele_couleur`,`p`.`numero` AS `numero`,`e`.`libelle` AS `status`,`e`.`bg_color` AS `bg_color`,`e`.`fg_color` AS `fg_color`,`p`.`semaine` AS `semaine`,`p`.`livree` AS `livree` from ((`planning` `p` join `articles` `a` on(`p`.`fk_article` = `a`.`id`)) join `etats` `e` on(`p`.`fk_etat` = `e`.`id`)) order by `p`.`id`,`p`.`semaine` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-24 11:20:07
