-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gestprod_v2
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atelier_absences`
--

DROP TABLE IF EXISTS `atelier_absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atelier_absences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_jour` date NOT NULL,
  `nb_heures_absence` decimal(4,2) NOT NULL DEFAULT 8.75,
  `motif` enum('CP','RTT','Maladie','Formation','Récup','Autre') NOT NULL,
  `commentaire` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atelier_absences`
--

LOCK TABLES `atelier_absences` WRITE;
/*!40000 ALTER TABLE `atelier_absences` DISABLE KEYS */;
/*!40000 ALTER TABLE `atelier_absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atelier_fermetures`
--

DROP TABLE IF EXISTS `atelier_fermetures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atelier_fermetures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `commentaire` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atelier_fermetures`
--

LOCK TABLES `atelier_fermetures` WRITE;
/*!40000 ALTER TABLE `atelier_fermetures` DISABLE KEYS */;
INSERT INTO `atelier_fermetures` VALUES (1,'2025-08-04','2025-08-24','vacances été 2025'),(2,'2025-12-25','2026-01-01','vacances noël 2025'),(3,'2024-12-25','2025-01-05','vaccances noël 2024');
/*!40000 ALTER TABLE `atelier_fermetures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atelier_presence`
--

DROP TABLE IF EXISTS `atelier_presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atelier_presence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_operateurs` int(11) NOT NULL,
  `nb_heures_normales` float NOT NULL DEFAULT 8.75,
  `nb_heures_supp` float NOT NULL DEFAULT 0,
  `date_jour` datetime NOT NULL DEFAULT current_timestamp(),
  `heures_supp` tinyint(4) NOT NULL DEFAULT 0,
  `commentaire` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atelier_presence`
--

LOCK TABLES `atelier_presence` WRITE;
/*!40000 ALTER TABLE `atelier_presence` DISABLE KEYS */;
INSERT INTO `atelier_presence` VALUES (26,14,8.75,0,'2024-11-04 00:00:00',0,NULL),(27,14,8.75,0,'2024-11-05 00:00:00',0,NULL),(28,14,8.75,0,'2024-11-06 00:00:00',0,NULL),(29,14,8.75,0,'2024-11-07 00:00:00',0,NULL),(30,5,4.75,0,'2024-11-08 00:00:00',1,NULL),(31,14,8.75,0,'2024-11-11 00:00:00',0,NULL),(32,14,8.75,0,'2024-11-12 00:00:00',0,NULL),(33,14,8.75,0,'2024-11-13 00:00:00',0,NULL),(34,14,8.75,0,'2024-11-14 00:00:00',0,NULL),(35,5,4.75,0,'2024-11-15 00:00:00',1,NULL),(36,14,8.75,0,'2024-11-18 00:00:00',0,NULL),(37,14,8.75,0,'2024-11-19 00:00:00',0,NULL),(38,14,8.75,0,'2024-11-20 00:00:00',0,NULL),(39,14,8.75,0,'2024-11-21 00:00:00',0,NULL),(40,5,4.75,0,'2024-11-22 00:00:00',1,NULL),(41,14,8.75,0,'2024-11-25 19:53:08',0,NULL),(42,11,8.75,0,'2024-11-26 09:22:29',0,NULL),(43,12,8.75,0,'2024-11-27 10:00:00',0,NULL),(44,12,8.75,0,'2024-11-28 07:18:20',0,NULL),(45,6,4.75,0,'2024-11-29 10:00:00',1,NULL),(46,12,8.75,0,'2024-12-02 07:46:10',0,NULL),(47,13,8.75,0,'2024-12-03 07:46:10',0,NULL),(48,13,8.75,0,'2024-12-04 07:46:10',0,NULL),(49,13,8.75,0,'2024-12-05 07:46:10',0,NULL),(50,1,4.75,0,'2024-12-06 07:46:10',1,NULL),(51,13,8.75,0,'2024-12-09 07:08:52',0,NULL),(52,13,8.75,0,'2024-12-10 07:08:52',0,NULL),(53,12,8.75,0,'2024-12-11 07:08:52',0,NULL),(54,12,8.75,0,'2024-12-12 07:08:52',0,NULL),(55,6,4.75,0,'2024-12-13 07:49:46',1,NULL),(56,13,8.75,0,'2024-12-16 12:55:21',0,NULL),(57,13,8.75,0,'2024-12-17 12:55:21',0,NULL),(58,14,8.75,0,'2024-12-18 12:55:21',0,NULL),(59,14,8.75,0,'2024-12-19 12:55:21',0,NULL),(61,13,8.75,0,'2025-01-06 08:58:57',0,NULL),(62,12,8.75,0,'2025-01-07 08:58:57',0,NULL),(63,14,8.75,0,'2025-01-08 08:58:57',0,NULL),(64,14,8.75,0,'2025-01-09 08:59:41',0,NULL),(65,3,4.75,0,'2025-01-10 07:04:37',1,NULL),(66,14,8.75,0,'2025-01-13 10:31:08',0,NULL),(67,13,8.75,0,'2025-01-14 10:31:08',0,NULL),(68,13,8.75,0,'2025-01-15 10:31:08',0,NULL),(69,13,8.75,0,'2025-01-16 10:31:08',0,NULL),(70,1,4.75,0,'2025-01-17 08:00:00',1,NULL),(71,14,8.75,0,'2025-01-20 14:23:16',0,NULL),(72,14,8.75,0,'2025-01-21 14:23:16',0,NULL),(73,14,8.75,0,'2025-01-22 14:23:40',0,NULL),(74,14,8.75,0,'2025-01-23 14:23:40',0,NULL),(75,4,4.75,0,'2025-01-24 14:23:40',1,NULL),(76,15,8.75,0,'2025-01-27 08:00:46',0,NULL),(77,15,8.75,0,'2025-01-28 08:00:46',0,NULL),(78,14,4.75,0,'2025-01-29 08:00:46',1,NULL),(79,14,8.75,0,'2025-01-30 08:00:46',0,NULL),(80,4,4.75,0,'2025-01-31 08:00:46',1,NULL),(81,14,8.75,0,'2025-02-03 11:55:51',0,NULL),(82,14,8.75,0,'2025-02-04 11:55:51',0,NULL),(83,13,8.75,0,'2025-02-05 11:55:51',0,NULL),(84,14,8.75,0,'2025-02-06 11:55:51',0,NULL),(85,4,4.75,0,'2025-02-07 11:55:51',1,NULL),(86,13,8.75,0,'2025-02-10 11:08:17',0,NULL),(87,14,8.75,0,'2025-02-11 11:08:17',0,NULL),(88,14,8.75,0,'2025-02-12 11:08:17',0,NULL),(89,15,8.75,0,'2025-02-13 11:08:17',0,NULL),(90,4,4.75,0,'2025-02-14 11:08:17',1,NULL),(91,14,8.75,0,'2025-02-17 11:09:53',0,NULL),(92,14,8.75,0,'2025-02-18 11:09:53',0,NULL),(93,15,8.75,0,'2025-02-19 11:09:53',0,NULL),(94,15,8.75,0,'2025-02-20 11:09:53',0,NULL),(95,6,4.75,0,'2025-02-21 11:09:53',1,NULL),(96,14,8.75,0,'2025-02-24 14:42:41',0,NULL),(97,14,8.75,0,'2025-02-25 14:42:41',0,NULL),(98,14,8.75,0,'2025-02-26 14:42:41',0,NULL),(99,15,8.75,0,'2025-02-27 14:42:41',0,NULL),(100,4,4.75,0,'2025-02-28 14:42:41',1,NULL),(101,14,8.75,0,'2025-03-03 09:14:27',0,NULL),(102,14,8.75,0,'2025-03-04 09:14:51',0,NULL),(103,15,8.75,0,'2025-03-05 09:14:51',0,NULL),(104,15,8.75,0,'2025-03-06 09:14:51',0,NULL),(105,4,4.75,0,'2025-03-07 09:14:51',1,NULL),(106,15,8.75,0,'2025-03-10 16:24:59',0,NULL),(107,15,8.75,0,'2025-03-11 16:24:59',0,NULL),(108,15,8.75,0,'2025-03-12 16:24:59',0,NULL),(109,15,8.75,0,'2025-03-13 16:24:59',0,NULL),(110,4,4.75,0,'2025-03-14 16:24:59',1,NULL),(111,15,8.75,0,'2025-03-17 00:00:00',0,NULL),(112,15,8.75,0,'2025-03-18 00:00:00',0,NULL),(113,15,8.75,0,'2025-03-19 00:00:00',0,NULL),(114,15,8.75,0,'2025-03-20 00:00:00',0,NULL),(115,4,4.75,0,'2025-03-21 00:00:00',1,NULL),(116,15,8.75,0,'2025-03-24 00:00:00',0,NULL),(117,15,8.75,0,'2025-03-25 00:00:00',0,NULL),(118,15,8.75,0,'2025-03-26 00:00:00',0,NULL),(119,15,8.75,0,'2025-03-27 00:00:00',0,NULL),(120,4,4.75,0,'2025-03-28 00:00:00',1,NULL),(122,14,8.75,0,'2025-03-31 00:00:00',0,NULL),(123,14,8.75,0,'2025-04-01 00:00:00',0,NULL),(124,12,8.75,0,'2025-04-02 00:00:00',0,NULL),(125,12,8.75,0,'2025-04-03 00:00:00',0,NULL),(126,3,4.75,0,'2025-04-04 00:00:00',1,NULL),(127,12,8.75,0,'2025-04-07 00:00:00',0,NULL),(128,14,8.75,0,'2025-04-08 00:00:00',0,NULL),(129,14,8.75,0,'2025-04-09 00:00:00',0,NULL),(130,14,8.75,0,'2025-04-10 00:00:00',0,NULL),(131,4,4.75,0,'2025-04-11 00:00:00',1,NULL),(132,13,8.75,0,'2025-04-14 00:00:00',0,NULL),(133,13,8.75,0,'2025-04-15 00:00:00',0,NULL),(134,13,8.75,0,'2025-04-16 00:00:00',0,NULL),(135,13,8.75,0,'2025-04-17 00:00:00',0,NULL),(136,3,4.75,0,'2025-04-18 00:00:00',1,NULL),(137,0,8.75,0,'2025-04-21 00:00:00',0,NULL),(138,15,8.75,0,'2025-04-22 00:00:00',0,NULL),(139,15,8.75,0,'2025-04-23 00:00:00',0,NULL),(140,15,8.75,0,'2025-04-24 00:00:00',0,NULL),(141,15,7,0,'2025-04-25 00:00:00',0,NULL),(142,14,8.75,0,'2025-04-28 00:00:00',0,NULL),(143,14,8.75,0,'2025-04-29 00:00:00',0,NULL),(144,14,8.75,0,'2025-04-30 00:00:00',0,NULL),(145,0,8.75,0,'2025-05-01 00:00:00',0,NULL),(146,0,4.75,0,'2025-05-02 00:00:00',1,NULL),(147,14,8.75,0,'2025-05-05 00:00:00',0,NULL),(148,14,8.75,0,'2025-05-06 00:00:00',0,NULL),(149,14,8.75,0,'2025-05-07 00:00:00',0,NULL),(150,0,8.75,0,'2025-05-08 00:00:00',0,NULL),(151,0,4.75,0,'2025-05-09 00:00:00',1,NULL),(152,14,8.75,0,'2025-05-12 00:00:00',0,NULL),(153,14,8.75,0,'2025-05-13 00:00:00',0,NULL),(154,15,8.75,0,'2025-05-14 00:00:00',0,NULL),(155,15,8.75,0,'2025-05-15 00:00:00',0,NULL),(156,5,4.75,0,'2025-05-16 00:00:00',1,NULL),(157,15,8.75,0,'2025-05-19 17:27:05',0,NULL),(158,15,8.75,0,'2025-05-20 17:27:05',0,NULL),(159,15,8.75,0,'2025-05-21 17:27:05',0,NULL),(160,15,8.75,0,'2025-05-22 17:27:05',0,NULL),(161,5,4.75,0,'2025-05-23 17:27:05',1,NULL);
/*!40000 ALTER TABLE `atelier_presence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etats`
--

DROP TABLE IF EXISTS `etats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `prod_articles`
--

DROP TABLE IF EXISTS `prod_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  `couleur` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `coefficient` float NOT NULL DEFAULT 1,
  `commentaire` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_articles`
--

LOCK TABLES `prod_articles` WRITE;
/*!40000 ALTER TABLE `prod_articles` DISABLE KEYS */;
INSERT INTO `prod_articles` VALUES (1,'AB100L100V2','#8080FF',0.8,NULL),(2,'AB180L225V1','#FFFF00',1.35,NULL),(3,'AS180L170V3','#90EE90',1,NULL),(4,'AB250M140V1','#ADD8E6',1,NULL),(5,'AB250M150V2','#ADD8E6',1,NULL),(6,'AS250M150V3','#FFA500',1,NULL),(7,'AS250M150V9','#FFA500',1,NULL),(8,'AS250L250V2','#008080',1,NULL),(9,'AS280M140V2','#808080',0.77,NULL),(10,'AS280L240-28V9','#0000FF',1.22,NULL),(11,'AS280L240-28V10','#FF0000',1.22,NULL),(12,'GF35','#90EE90',0.57,NULL),(13,'AS2502M150V8','#FFA500',1,NULL),(14,'GF15V41 Boost','#90EE90',0.5,NULL),(15,'GFV50 Positif','#90EE90',0.5,NULL),(16,'4101-004GFV50-','#90EE90',0.5,NULL),(17,'4101-003GFV50+','#90EE90',0.5,NULL),(18,'41012-001CFV10','#90EE90',0.57,NULL),(19,'GFV41','#90EE90',0.5,NULL);
/*!40000 ALTER TABLE `prod_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_engagement`
--

DROP TABLE IF EXISTS `prod_engagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_engagement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_planning` int(11) NOT NULL,
  `semaine_engagee` varchar(10) DEFAULT NULL,
  `status` enum('prévisionnel','engagé','reporté','annulé','en cours','fait','retour client') NOT NULL DEFAULT 'prévisionnel',
  `commentaire` text DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `prod_engagement_prod_planning_FK` (`fk_planning`),
  CONSTRAINT `prod_engagement_prod_planning_FK` FOREIGN KEY (`fk_planning`) REFERENCES `prod_planning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_engagement`
--

LOCK TABLES `prod_engagement` WRITE;
/*!40000 ALTER TABLE `prod_engagement` DISABLE KEYS */;
INSERT INTO `prod_engagement` VALUES (1,63,'2024-45','fait','Import : réalisé normalement','2024-11-04 01:00:00'),(2,64,'2024-45','fait','Import : réalisé normalement','2024-11-04 02:00:00'),(3,65,'2024-45','fait','Import : réalisé normalement','2024-11-04 03:00:00'),(4,66,'2024-45','fait','Import : réalisé normalement','2024-11-04 04:00:00'),(5,67,'2024-45','fait','Import : réalisé normalement','2024-11-04 05:00:00'),(6,68,'2024-45','fait','Import : réalisé normalement','2024-11-04 06:00:00'),(7,69,'2024-45','fait','Import : réalisé normalement','2024-11-04 07:00:00'),(8,70,'2024-45','fait','Import : réalisé normalement','2024-11-04 08:00:00'),(9,71,'2024-45','fait','Import : réalisé normalement','2024-11-04 09:00:00'),(10,72,'2024-46','fait','Import : réalisé normalement','2024-11-11 10:00:00'),(11,73,'2024-46','fait','Import : réalisé normalement','2024-11-11 11:00:00'),(12,74,'2024-46','fait','Import : réalisé normalement','2024-11-11 12:00:00'),(13,75,'2024-46','fait','Import : réalisé normalement','2024-11-11 13:00:00'),(14,76,'2024-46','fait','Import : réalisé normalement','2024-11-11 14:00:00'),(15,77,'2024-46','fait','Import : réalisé normalement','2024-11-11 15:00:00'),(16,78,'2024-46','fait','Import : réalisé normalement','2024-11-11 16:00:00'),(17,79,'2024-46','fait','Import : réalisé normalement','2024-11-11 17:00:00'),(18,80,'2024-46','fait','Import : réalisé normalement','2024-11-11 18:00:00'),(19,81,'2024-46','fait','Import : réalisé normalement','2024-11-11 19:00:00'),(20,82,'2024-47','fait','Import : réalisé normalement','2024-11-18 20:00:00'),(21,83,'2024-47','fait','Import : réalisé normalement','2024-11-18 21:00:00'),(22,84,'2024-47','fait','Import : réalisé normalement','2024-11-18 22:00:00'),(23,85,'2024-47','fait','Import : réalisé normalement','2024-11-18 23:00:00'),(24,86,'2024-47','fait','Import : réalisé normalement','2024-11-18 00:00:00'),(25,87,'2024-47','fait','Import : réalisé normalement','2024-11-18 01:00:00'),(26,88,'2024-47','fait','Import : réalisé normalement','2024-11-18 02:00:00'),(27,89,'2024-47','fait','Import : réalisé normalement','2024-11-18 03:00:00'),(28,90,'2024-48','fait','Import : réalisé normalement','2024-11-25 04:00:00'),(29,91,'2024-48','reporté','Import : initialement prévu','2024-11-25 05:00:00'),(30,91,'2024-49','fait','Import : réalisé après report','2024-12-02 06:00:00'),(31,92,'2024-48','fait','Import : réalisé normalement','2024-11-25 07:00:00'),(32,93,'2024-48','fait','Import : réalisé normalement','2024-11-25 08:00:00'),(33,94,'2024-48','fait','Import : réalisé normalement','2024-11-25 09:00:00'),(34,95,'2024-48','fait','Import : réalisé normalement','2024-11-25 10:00:00'),(35,96,'2024-48','fait','Import : réalisé normalement','2024-11-25 11:00:00'),(36,97,'2024-49','reporté','Import : initialement prévu','2024-12-02 12:00:00'),(37,97,'2024-50','fait','Import : réalisé après report','2024-12-09 13:00:00'),(38,98,'2024-49','fait','Import : réalisé normalement','2024-12-02 14:00:00'),(39,99,'2024-48','fait','Import : réalisé normalement','2024-11-25 15:00:00'),(40,100,'2024-48','fait','Import : réalisé normalement','2024-11-25 16:00:00'),(41,101,'2024-48','fait','Import : réalisé normalement','2024-11-25 17:00:00'),(42,102,'2024-49','fait','Import : réalisé normalement','2024-12-02 18:00:00'),(43,103,'2024-49','fait','Import : réalisé normalement','2024-12-02 19:00:00'),(44,104,'2024-49','fait','Import : réalisé normalement','2024-12-02 20:00:00'),(45,105,'2024-50','fait','Import : réalisé normalement','2024-12-09 21:00:00'),(46,106,'2024-48','fait','Import : réalisé normalement','2024-11-25 22:00:00'),(47,107,'2024-50','fait','Import : réalisé normalement','2024-12-09 23:00:00'),(48,108,'2024-50','fait','Import : réalisé normalement','2024-12-09 00:00:00'),(49,109,'2024-49','fait','Import : réalisé normalement','2024-12-02 01:00:00'),(50,110,'2024-50','reporté','Import : initialement prévu','2024-12-09 02:00:00'),(51,110,'2024-51','fait','Import : réalisé après report','2024-12-16 03:00:00'),(52,111,'2024-49','fait','Import : réalisé normalement','2024-12-02 04:00:00'),(53,112,'2024-49','fait','Import : réalisé normalement','2024-12-02 05:00:00'),(54,113,'2024-49','fait','Import : réalisé normalement','2024-12-02 06:00:00'),(55,114,'2024-50','fait','Import : réalisé normalement','2024-12-09 07:00:00'),(56,115,'2024-50','fait','Import : réalisé normalement','2024-12-09 08:00:00'),(57,116,'2024-51','reporté','Import : initialement prévu','2024-12-16 09:00:00'),(58,116,'2025-03','fait','Import : réalisé après report','2025-01-13 10:00:00'),(59,117,'2024-51','reporté','Import : initialement prévu','2024-12-16 11:00:00'),(60,117,'2025-03','fait','Import : réalisé après report','2025-01-13 12:00:00'),(61,118,'2024-51','fait','Import : réalisé normalement','2024-12-16 13:00:00'),(62,119,'2024-51','fait','Import : réalisé normalement','2024-12-16 14:00:00'),(63,120,'2024-51','fait','Import : réalisé normalement','2024-12-16 15:00:00'),(64,121,'2024-51','fait','Import : réalisé normalement','2024-12-16 16:00:00'),(65,122,'2024-51','fait','Import : réalisé normalement','2024-12-16 17:00:00'),(66,123,'2025-02','fait','Import : réalisé normalement','2025-01-06 18:00:00'),(67,124,'2024-51','fait','Import : réalisé normalement','2024-12-16 19:00:00'),(68,125,'2024-51','fait','Import : réalisé normalement','2024-12-16 20:00:00'),(69,126,'2025-02','reporté','Import : initialement prévu','2025-01-06 21:00:00'),(70,126,'2025-05','fait','Import : réalisé après report','2025-01-27 22:00:00'),(71,127,'2025-02','reporté','Import : initialement prévu','2025-01-06 23:00:00'),(72,127,'2025-04','fait','Import : réalisé après report','2025-01-20 00:00:00'),(73,128,'2025-02','reporté','Import : initialement prévu','2025-01-06 01:00:00'),(74,128,'2025-04','fait','Import : réalisé après report','2025-01-20 02:00:00'),(75,129,'2025-03','reporté','Import : initialement prévu','2025-01-13 03:00:00'),(76,129,'2025-04','fait','Import : réalisé après report','2025-01-20 04:00:00'),(77,130,'2025-03','reporté','Import : initialement prévu','2025-01-13 05:00:00'),(78,130,'2025-04','fait','Import : réalisé après report','2025-01-20 06:00:00'),(79,131,'2025-03','reporté','Import : initialement prévu','2025-01-13 07:00:00'),(80,131,'2025-04','fait','Import : réalisé après report','2025-01-20 08:00:00'),(81,132,'2025-03','reporté','Import : initialement prévu','2025-01-13 09:00:00'),(82,132,'2025-04','fait','Import : réalisé après report','2025-01-20 10:00:00'),(83,133,'2025-03','fait','Import : réalisé normalement','2025-01-13 11:00:00'),(84,134,'2025-03','reporté','Import : initialement prévu','2025-01-13 12:00:00'),(85,134,'2025-04','fait','Import : réalisé après report','2025-01-20 13:00:00'),(86,135,'2025-03','reporté','Import : initialement prévu','2025-01-13 14:00:00'),(87,135,'2025-06','fait','Import : réalisé après report','2025-02-03 15:00:00'),(88,136,'2025-03','reporté','Import : initialement prévu','2025-01-13 16:00:00'),(89,136,'2025-04','fait','Import : réalisé après report','2025-01-20 17:00:00'),(90,137,'2025-03','reporté','Import : initialement prévu','2025-01-13 18:00:00'),(91,137,'2025-04','fait','Import : réalisé après report','2025-01-20 19:00:00'),(92,138,'2025-03','fait','Import : réalisé normalement','2025-01-13 20:00:00'),(93,139,'2025-03','fait','Import : réalisé normalement','2025-01-13 21:00:00'),(94,140,'2025-03','fait','Import : réalisé normalement','2025-01-13 22:00:00'),(95,141,'2025-03','fait','Import : réalisé normalement','2025-01-13 23:00:00'),(96,142,'2025-04','reporté','Import : initialement prévu','2025-01-20 00:00:00'),(97,142,'2025-10','fait','Import : réalisé après report','2025-03-03 01:00:00'),(98,143,'2025-04','reporté','Import : initialement prévu','2025-01-20 02:00:00'),(99,143,'2025-05','fait','Import : réalisé après report','2025-01-27 03:00:00'),(100,144,'2025-04','fait','Import : réalisé normalement','2025-01-20 04:00:00'),(101,145,'2025-04','reporté','Import : initialement prévu','2025-01-20 05:00:00'),(102,145,'2025-05','fait','Import : réalisé après report','2025-01-27 06:00:00'),(103,146,'2025-04','reporté','Import : initialement prévu','2025-01-20 07:00:00'),(104,146,'2025-05','fait','Import : réalisé après report','2025-01-27 08:00:00'),(109,151,'2025-05','reporté','Import : initialement prévu','2025-01-27 13:00:00'),(110,151,'2025-10','fait','Import : réalisé après report','2025-03-03 14:00:00'),(111,152,'2025-05','reporté','Import : initialement prévu','2025-01-27 15:00:00'),(112,152,'2025-06','fait','Import : réalisé après report','2025-02-03 16:00:00'),(113,153,'2025-05','reporté','Import : initialement prévu','2025-01-27 17:00:00'),(114,153,'2025-06','fait','Import : réalisé après report','2025-02-03 18:00:00'),(115,154,'2025-05','reporté','Import : initialement prévu','2025-01-27 19:00:00'),(116,154,'2025-06','fait','Import : réalisé après report','2025-02-03 20:00:00'),(117,155,'2025-05','reporté','Import : initialement prévu','2025-01-27 21:00:00'),(118,155,'2025-06','fait','Import : réalisé après report','2025-02-03 22:00:00'),(119,156,'2025-02','prévisionnel','Import : prévu sans numéro','2025-05-08 20:14:46'),(120,157,'2025-04','fait','Import : réalisé normalement','2025-01-20 00:00:00'),(121,158,'2025-03','fait','Import : réalisé normalement','2025-01-13 01:00:00'),(122,159,'2025-03','fait','Import : réalisé normalement','2025-01-13 02:00:00'),(123,160,'2025-03','fait','Import : réalisé normalement','2025-01-13 03:00:00'),(124,161,'2025-03','fait','Import : réalisé normalement','2025-01-13 04:00:00'),(125,162,'2025-06','reporté','Import : initialement prévu','2025-02-03 05:00:00'),(126,162,'2025-07','fait','Import : réalisé après report','2025-02-10 06:00:00'),(127,163,'2025-06','reporté','Import : initialement prévu','2025-02-03 07:00:00'),(128,163,'2025-07','fait','Import : réalisé après report','2025-02-10 08:00:00'),(129,164,'2025-06','reporté','Import : initialement prévu','2025-02-03 09:00:00'),(130,164,'2025-07','fait','Import : réalisé après report','2025-02-10 10:00:00'),(131,165,'2025-06','reporté','Import : initialement prévu','2025-02-03 11:00:00'),(132,165,'2025-07','fait','Import : réalisé après report','2025-02-10 12:00:00'),(133,169,'2025-04','fait','Import : réalisé normalement','2025-01-20 13:00:00'),(134,170,'2025-04','fait','Import : réalisé normalement','2025-01-20 14:00:00'),(135,175,'2025-04','reporté','Import : initialement prévu','2025-01-20 15:00:00'),(136,175,'2025-05','fait','Import : réalisé après report','2025-01-27 16:00:00'),(137,176,'2025-04','fait','Import : réalisé normalement','2025-01-20 17:00:00'),(138,177,'2025-04','fait','Import : réalisé normalement','2025-01-20 18:00:00'),(139,181,'2025-04','fait','Import : réalisé normalement','2025-01-20 19:00:00'),(140,182,'2025-05','fait','Import : réalisé normalement','2025-01-27 20:00:00'),(141,183,'2025-05','fait','Import : réalisé normalement','2025-01-27 21:00:00'),(142,184,'2025-05','fait','Import : réalisé normalement','2025-01-27 22:00:00'),(143,185,'2025-05','fait','Import : réalisé normalement','2025-01-27 23:00:00'),(144,186,'2025-05','fait','Import : réalisé normalement','2025-01-27 00:00:00'),(145,187,'2025-05','fait','Import : réalisé normalement','2025-01-27 01:00:00'),(146,188,'2025-05','fait','Import : réalisé normalement','2025-01-27 02:00:00'),(147,189,'2025-05','fait','Import : réalisé normalement','2025-01-27 03:00:00'),(148,190,'2025-05','fait','Import : réalisé normalement','2025-01-27 04:00:00'),(149,191,'2025-05','fait','Import : réalisé normalement','2025-01-27 05:00:00'),(150,192,'2025-06','fait','Import : réalisé normalement','2025-02-03 06:00:00'),(151,193,'2025-06','fait','Import : réalisé normalement','2025-02-03 07:00:00'),(152,194,'2025-06','fait','Import : réalisé normalement','2025-02-03 08:00:00'),(153,195,'2025-06','fait','Import : réalisé normalement','2025-02-03 09:00:00'),(154,196,'2025-06','fait','Import : réalisé normalement','2025-02-03 10:00:00'),(155,197,'2025-06','fait','Import : réalisé normalement','2025-02-03 11:00:00'),(156,200,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 12:00:00'),(157,201,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 13:00:00'),(158,202,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 14:00:00'),(159,203,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 15:00:00'),(160,204,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 16:00:00'),(161,205,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 17:00:00'),(162,206,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-02-03 18:00:00'),(163,207,'2025-07','fait','Import : réalisé normalement','2025-02-10 19:00:00'),(164,208,'2025-07','fait','Import : réalisé normalement','2025-02-10 20:00:00'),(165,209,'2025-07','fait','Import : réalisé normalement','2025-02-10 21:00:00'),(166,210,'2025-07','fait','Import : réalisé normalement','2025-02-10 22:00:00'),(167,211,'2025-07','fait','Import : réalisé normalement','2025-02-10 23:00:00'),(168,212,'2025-07','fait','Import : réalisé normalement','2025-02-10 00:00:00'),(169,213,'2025-07','fait','Import : réalisé normalement','2025-02-10 01:00:00'),(170,214,'2025-07','fait','Import : réalisé normalement','2025-02-10 02:00:00'),(171,215,'2025-07','reporté','Import : initialement prévu','2025-02-10 03:00:00'),(172,215,'2025-08','fait','Import : réalisé après report','2025-02-17 04:00:00'),(173,216,'2025-08','fait','Import : réalisé normalement','2025-02-17 05:00:00'),(174,217,'2025-08','fait','Import : réalisé normalement','2025-02-17 06:00:00'),(175,218,'2025-08','fait','Import : réalisé normalement','2025-02-17 07:00:00'),(176,219,'2025-08','fait','Import : réalisé normalement','2025-02-17 08:00:00'),(177,220,'2025-08','fait','Import : réalisé normalement','2025-02-17 09:00:00'),(178,221,'2025-08','fait','Import : réalisé normalement','2025-02-17 10:00:00'),(179,222,'2025-08','fait','Import : réalisé normalement','2025-02-17 11:00:00'),(180,223,'2025-08','fait','Import : réalisé normalement','2025-02-17 12:00:00'),(181,224,'2025-08','fait','Import : réalisé normalement','2025-02-17 13:00:00'),(182,225,'2025-08','fait','Import : réalisé normalement','2025-02-17 14:00:00'),(183,226,'2025-08','fait','Import : réalisé normalement','2025-02-17 15:00:00'),(184,227,'2025-08','fait','Import : réalisé normalement','2025-02-17 16:00:00'),(185,228,'2025-08','fait','Import : réalisé normalement','2025-02-17 17:00:00'),(186,229,'2025-09','fait','Import : réalisé normalement','2025-02-24 18:00:00'),(187,230,'2025-09','fait','Import : réalisé normalement','2025-02-24 19:00:00'),(188,231,'2025-09','fait','Import : réalisé normalement','2025-02-24 20:00:00'),(189,232,'2025-09','fait','Import : réalisé normalement','2025-02-24 21:00:00'),(190,233,'2025-09','fait','Import : réalisé normalement','2025-02-24 22:00:00'),(191,234,'2025-09','fait','Import : réalisé normalement','2025-02-24 23:00:00'),(192,235,'2025-09','fait','Import : réalisé normalement','2025-02-24 00:00:00'),(193,236,'2025-09','fait','Import : réalisé normalement','2025-02-24 01:00:00'),(194,237,'2025-09','fait','Import : réalisé normalement','2025-02-24 02:00:00'),(195,238,'2025-09','fait','Import : réalisé normalement','2025-02-24 03:00:00'),(196,239,'2025-09','fait','Import : réalisé normalement','2025-02-24 04:00:00'),(197,241,'2025-09','fait','Import : réalisé normalement','2025-02-24 05:00:00'),(198,242,'2025-09','fait','Import : réalisé normalement','2025-02-24 06:00:00'),(199,243,'2025-09','fait','Import : réalisé normalement','2025-02-24 07:00:00'),(200,244,'2025-09','fait','Import : réalisé normalement','2025-02-24 08:00:00'),(201,245,'2025-09','fait','Import : réalisé normalement','2025-02-24 09:00:00'),(202,246,'2025-09','fait','Import : réalisé normalement','2025-02-24 10:00:00'),(203,247,'2025-10','fait','Import : réalisé normalement','2025-03-03 11:00:00'),(204,248,'2025-10','fait','Import : réalisé normalement','2025-03-03 12:00:00'),(205,249,'2025-10','fait','Import : réalisé normalement','2025-03-03 13:00:00'),(206,250,'2025-10','fait','Import : réalisé normalement','2025-03-03 14:00:00'),(207,251,'2025-10','fait','Import : réalisé normalement','2025-03-03 15:00:00'),(208,252,'2025-10','fait','Import : réalisé normalement','2025-03-03 16:00:00'),(209,253,'2025-10','fait','Import : réalisé normalement','2025-03-03 17:00:00'),(210,254,'2025-10','fait','Import : réalisé normalement','2025-03-03 18:00:00'),(211,256,'2025-10','fait','Import : réalisé normalement','2025-03-03 19:00:00'),(212,257,'2025-10','fait','Import : réalisé normalement','2025-03-03 20:00:00'),(213,258,'2025-10','fait','Import : réalisé normalement','2025-03-03 21:00:00'),(214,259,'2025-11','fait','Import : réalisé normalement','2025-03-10 22:00:00'),(215,260,'2025-11','fait','Import : réalisé normalement','2025-03-10 23:00:00'),(216,261,'2025-11','fait','Import : réalisé normalement','2025-03-10 00:00:00'),(217,262,'2025-11','fait','Import : réalisé normalement','2025-03-10 01:00:00'),(218,263,'2025-11','fait','Import : réalisé normalement','2025-03-10 02:00:00'),(219,264,'2025-11','fait','Import : réalisé normalement','2025-03-10 03:00:00'),(220,265,'2025-11','fait','Import : réalisé normalement','2025-03-10 04:00:00'),(221,266,'2025-11','fait','Import : réalisé normalement','2025-03-10 05:00:00'),(222,267,'2025-11','fait','Import : réalisé normalement','2025-03-10 06:00:00'),(223,268,'2025-11','fait','Import : réalisé normalement','2025-03-10 07:00:00'),(224,269,'2025-11','fait','Import : réalisé normalement','2025-03-10 08:00:00'),(225,270,'2025-11','fait','Import : réalisé normalement','2025-03-10 09:00:00'),(226,271,'2025-12','fait','Import : réalisé normalement','2025-03-17 10:00:00'),(227,272,'2025-12','fait','Import : réalisé normalement','2025-03-17 11:00:00'),(228,273,'2025-12','fait','Import : réalisé normalement','2025-03-17 12:00:00'),(229,274,'2025-12','fait','Import : réalisé normalement','2025-03-17 13:00:00'),(230,275,'2025-12','reporté','Import : initialement prévu','2025-03-17 14:00:00'),(231,275,'2025-13','fait','Import : réalisé après report','2025-03-24 15:00:00'),(232,276,'2025-12','reporté','Import : initialement prévu','2025-03-17 16:00:00'),(233,276,'2025-13','fait','Import : réalisé après report','2025-03-24 17:00:00'),(234,277,'2025-12','fait','Import : réalisé normalement','2025-03-17 18:00:00'),(235,278,'2025-12','fait','Import : réalisé normalement','2025-03-17 19:00:00'),(236,279,'2025-12','fait','Import : réalisé normalement','2025-03-17 20:00:00'),(237,280,'2025-12','fait','Import : réalisé normalement','2025-03-17 21:00:00'),(238,281,'2025-12','fait','Import : réalisé normalement','2025-03-17 22:00:00'),(239,282,'2025-12','fait','Import : réalisé normalement','2025-03-17 23:00:00'),(240,283,'2025-12','fait','Import : réalisé normalement','2025-03-17 00:00:00'),(241,284,'2025-12','fait','Import : réalisé normalement','2025-03-17 01:00:00'),(242,285,'2025-12','fait','Import : réalisé normalement','2025-03-17 02:00:00'),(243,286,'2025-12','fait','Import : réalisé normalement','2025-03-17 03:00:00'),(244,287,'2025-12','fait','Import : réalisé normalement','2025-03-17 04:00:00'),(245,288,'2025-12','fait','Import : réalisé normalement','2025-03-17 05:00:00'),(246,290,'2025-13','reporté','Import : initialement prévu','2025-03-24 06:00:00'),(247,290,'2025-14','fait','Import : réalisé après report','2025-03-31 07:00:00'),(248,291,'2025-13','fait','Import : réalisé normalement','2025-03-24 08:00:00'),(249,292,'2025-13','fait','Import : réalisé normalement','2025-03-24 09:00:00'),(250,293,'2025-13','fait','Import : réalisé normalement','2025-03-24 10:00:00'),(251,294,'2025-13','fait','Import : réalisé normalement','2025-03-24 11:00:00'),(252,295,'2025-13','fait','Import : réalisé normalement','2025-03-24 12:00:00'),(253,296,'2025-13','fait','Import : réalisé normalement','2025-03-24 13:00:00'),(254,297,'2025-13','fait','Import : réalisé normalement','2025-03-24 14:00:00'),(255,298,'2025-13','fait','Import : réalisé normalement','2025-03-24 15:00:00'),(256,299,'2025-13','fait','Import : réalisé normalement','2025-03-24 16:00:00'),(257,300,'2025-13','fait','Import : réalisé normalement','2025-03-24 17:00:00'),(258,301,'2025-14','fait','Import : réalisé normalement','2025-03-31 18:00:00'),(259,302,'2025-14','fait','Import : réalisé normalement','2025-03-31 19:00:00'),(260,303,'2025-14','fait','Import : réalisé normalement','2025-03-31 20:00:00'),(261,304,'2025-14','fait','Import : réalisé normalement','2025-03-31 21:00:00'),(262,305,'2025-14','fait','Import : réalisé normalement','2025-03-31 22:00:00'),(263,307,'2025-14','fait','Import : réalisé normalement','2025-03-31 23:00:00'),(264,309,'2025-14','reporté','Import : initialement prévu','2025-03-31 00:00:00'),(265,309,'2025-15','fait','Import : réalisé après report','2025-04-07 01:00:00'),(266,310,'2025-14','fait','Import : réalisé normalement','2025-03-31 02:00:00'),(267,311,'2025-14','fait','Import : réalisé normalement','2025-03-31 03:00:00'),(268,312,'2025-14','fait','Import : réalisé normalement','2025-03-31 04:00:00'),(269,313,'2025-14','fait','Import : réalisé normalement','2025-03-31 05:00:00'),(270,314,'2025-14','fait','Import : réalisé normalement','2025-03-31 06:00:00'),(271,315,'2025-14','fait','Import : réalisé normalement','2025-03-31 07:00:00'),(272,316,'2025-15','reporté','Import : initialement prévu','2025-04-07 08:00:00'),(273,316,'2025-16','fait','Import : réalisé après report','2025-04-14 09:00:00'),(274,317,'2025-15','reporté','Import : initialement prévu','2025-04-07 10:00:00'),(275,317,'2025-16','fait','Import : réalisé après report','2025-04-14 11:00:00'),(276,318,'2025-15','fait','Import : réalisé normalement','2025-04-07 12:00:00'),(277,319,'2025-15','fait','Import : réalisé normalement','2025-04-07 13:00:00'),(278,320,'2025-15','reporté','Import : initialement prévu','2025-04-07 14:00:00'),(279,320,'2025-16','fait','Import : réalisé après report','2025-04-14 15:00:00'),(280,321,'2025-15','fait','Import : réalisé normalement','2025-04-07 16:00:00'),(281,322,'2025-14','fait','Import : réalisé normalement','2025-03-31 17:00:00'),(282,323,'2025-14','fait','Import : réalisé normalement','2025-03-31 18:00:00'),(283,324,'2025-14','fait','Import : réalisé normalement','2025-03-31 19:00:00'),(284,325,'2025-15','fait','Import : réalisé normalement','2025-04-07 20:00:00'),(285,326,'2025-15','fait','Import : réalisé normalement','2025-04-07 21:00:00'),(286,327,'2025-15','fait','Import : réalisé normalement','2025-04-07 22:00:00'),(287,328,'2025-15','fait','Import : réalisé normalement','2025-04-07 23:00:00'),(288,330,'2025-15','fait','Import : réalisé normalement','2025-04-07 00:00:00'),(289,331,'2025-15','fait','Import : réalisé normalement','2025-04-07 01:00:00'),(290,332,'2025-16','fait','Import : réalisé normalement','2025-04-14 02:00:00'),(291,333,'2025-16','fait','Import : réalisé normalement','2025-04-14 03:00:00'),(292,334,'2025-16','fait','Import : réalisé normalement','2025-04-14 04:00:00'),(293,335,'2025-16','fait','Import : réalisé normalement','2025-04-14 05:00:00'),(294,336,'2025-16','fait','Import : réalisé normalement','2025-04-14 06:00:00'),(295,337,'2025-16','reporté','Import : initialement prévu','2025-04-14 07:00:00'),(296,337,'2025-17','fait','Import : réalisé après report','2025-04-21 08:00:00'),(297,338,'2025-16','fait','Import : réalisé normalement','2025-04-14 09:00:00'),(298,339,'2025-16','fait','Import : réalisé normalement','2025-04-14 10:00:00'),(299,340,'2025-16','fait','Import : réalisé normalement','2025-04-14 11:00:00'),(300,341,'2025-16','fait','Import : réalisé normalement','2025-04-14 12:00:00'),(301,342,'2025-16','fait','Import : réalisé normalement','2025-04-14 13:00:00'),(302,343,'2025-16','fait','Import : réalisé normalement','2025-04-14 14:00:00'),(303,344,'2025-16','fait','Import : réalisé normalement','2025-04-14 15:00:00'),(304,345,'2025-16','fait','Import : réalisé normalement','2025-04-14 16:00:00'),(305,346,'2025-17','reporté','Import : initialement prévu','2025-04-21 17:00:00'),(306,346,'2025-18','fait','Import : réalisé après report','2025-04-28 18:00:00'),(307,347,'2025-17','fait','Import : réalisé normalement','2025-04-21 19:00:00'),(308,348,'2025-17','fait','Import : réalisé normalement','2025-04-21 20:00:00'),(309,349,'2025-17','fait','Import : réalisé normalement','2025-04-21 21:00:00'),(310,350,'2025-17','fait','Import : réalisé normalement','2025-04-21 22:00:00'),(311,351,'2025-17','fait','Import : réalisé normalement','2025-04-21 23:00:00'),(312,352,'2025-17','fait','Import : réalisé normalement','2025-04-21 00:00:00'),(313,353,'2025-17','fait','Import : réalisé normalement','2025-04-21 01:00:00'),(314,354,'2025-17','fait','Import : réalisé normalement','2025-04-21 02:00:00'),(315,355,'2025-17','fait','Import : réalisé normalement','2025-04-21 03:00:00'),(316,356,'2025-17','fait','Import : réalisé normalement','2025-04-21 04:00:00'),(317,357,'2025-17','reporté','Import : initialement prévu','2025-04-21 05:00:00'),(318,357,'2025-18','fait','Import : réalisé après report','2025-04-28 06:00:00'),(319,358,'2025-17','fait','Import : réalisé normalement','2025-04-21 07:00:00'),(320,359,'2025-16','fait','Import : réalisé normalement','2025-04-14 08:00:00'),(321,360,'2025-16','fait','Import : réalisé normalement','2025-04-14 09:00:00'),(322,361,'2025-17','fait','Import : réalisé normalement','2025-04-21 10:00:00'),(323,362,'2025-17','fait','Import : réalisé normalement','2025-04-21 11:00:00'),(324,363,'2025-17','fait','Import : réalisé normalement','2025-04-21 12:00:00'),(325,364,'2025-17','fait','Import : réalisé normalement','2025-04-21 13:00:00'),(326,365,'2025-18','fait','Import : réalisé normalement','2025-04-28 14:00:00'),(327,366,'2025-18','fait','Import : réalisé normalement','2025-04-28 15:00:00'),(328,367,'2025-18','fait','Import : réalisé normalement','2025-04-28 16:00:00'),(329,368,'2025-18','fait','Import : réalisé normalement','2025-04-28 17:00:00'),(330,369,'2025-18','fait','Import : réalisé normalement','2025-04-28 18:00:00'),(331,370,'2025-18','fait','Import : réalisé normalement','2025-04-28 19:00:00'),(332,371,'2025-18','reporté','Import : réalisé normalement','2025-05-13 19:54:49'),(333,372,'2025-18','fait','Import : réalisé normalement','2025-05-13 19:59:25'),(334,373,'2025-18','fait','Import : réalisé normalement','2025-04-28 22:00:00'),(335,374,'2025-18','fait','Import : réalisé normalement','2025-04-28 23:00:00'),(336,375,'2025-18','fait','Import : réalisé normalement','2025-05-13 19:59:25'),(337,376,'2025-18','fait','Import : réalisé normalement','2025-05-13 19:59:25'),(465,458,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(466,459,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(467,460,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(468,461,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(469,462,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(470,463,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(471,464,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(472,465,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(473,466,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(474,467,'2025-19','fait','import manuel david','2025-05-18 17:35:15'),(475,468,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(476,469,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(477,470,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(478,471,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(479,472,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(480,473,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(481,474,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(482,475,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(483,476,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(484,477,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(485,478,'2025-20','fait','import manuel david','2025-05-18 18:28:21'),(486,479,'2025-20','fait','import manuel david','2025-05-18 18:28:21');
/*!40000 ALTER TABLE `prod_engagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_engagement_status`
--

DROP TABLE IF EXISTS `prod_engagement_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_engagement_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_engagement_status`
--

LOCK TABLES `prod_engagement_status` WRITE;
/*!40000 ALTER TABLE `prod_engagement_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_engagement_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_groupe_sous_ensemble`
--

DROP TABLE IF EXISTS `prod_groupe_sous_ensemble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_groupe_sous_ensemble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_article` int(11) NOT NULL,
  `fk_type_sous_ensemble` int(11) NOT NULL,
  `nom_groupe` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_group_sous_ensemble_prod_articles_FK` (`fk_article`),
  KEY `prod_group_sous_ensemble_prod_type_sous_ensemble_FK` (`fk_type_sous_ensemble`),
  CONSTRAINT `prod_group_sous_ensemble_prod_articles_FK` FOREIGN KEY (`fk_article`) REFERENCES `prod_articles` (`id`),
  CONSTRAINT `prod_group_sous_ensemble_prod_type_sous_ensemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `prod_type_sous_ensemble` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_groupe_sous_ensemble`
--

LOCK TABLES `prod_groupe_sous_ensemble` WRITE;
/*!40000 ALTER TABLE `prod_groupe_sous_ensemble` DISABLE KEYS */;
INSERT INTO `prod_groupe_sous_ensemble` VALUES (1,1,6,'AB100'),(2,2,6,'AB180'),(3,3,6,'AS180'),(4,4,6,'AB250'),(5,5,6,'AB250'),(6,6,6,'AS250'),(7,7,6,'AS250'),(8,8,6,'AS250'),(9,9,6,'AS280'),(10,10,6,'AS280'),(11,11,6,'AS280'),(12,12,7,NULL),(13,13,6,'AS250'),(14,14,7,NULL),(15,15,7,NULL),(16,16,7,NULL),(17,17,7,NULL),(18,18,7,NULL),(19,19,7,NULL);
/*!40000 ALTER TABLE `prod_groupe_sous_ensemble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_planning`
--

DROP TABLE IF EXISTS `prod_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_planning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_article` int(11) NOT NULL,
  `fk_type_sous_ensemble` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `fk_etat` int(11) DEFAULT NULL,
  `semaine` varchar(10) DEFAULT NULL,
  `engagement` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
  `commentaire` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
  `prete` tinyint(1) NOT NULL DEFAULT 0,
  `livree` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prod_planning_unique` (`fk_article`,`numero`),
  KEY `prod_planning_prod_type_sous_ensemble_FK` (`fk_type_sous_ensemble`),
  CONSTRAINT `prod_planning_prod_articles_FK` FOREIGN KEY (`fk_article`) REFERENCES `prod_articles` (`id`),
  CONSTRAINT `prod_planning_prod_type_sous_ensemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `prod_type_sous_ensemble` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_planning`
--

LOCK TABLES `prod_planning` WRITE;
/*!40000 ALTER TABLE `prod_planning` DISABLE KEYS */;
INSERT INTO `prod_planning` VALUES (63,9,6,951,7,'2024-45','2024-45',NULL,1,1,NULL),(64,9,6,952,7,'2024-45','2024-45',NULL,1,1,NULL),(65,9,6,953,7,'2024-45','2024-45',NULL,1,1,NULL),(66,9,6,954,7,'2024-45','2024-45',NULL,1,1,NULL),(67,11,6,566,7,'2024-45','2024-45',NULL,1,1,NULL),(68,11,6,567,7,'2024-45','2024-45',NULL,1,1,NULL),(69,11,6,568,7,'2024-45','2024-45',NULL,1,1,NULL),(70,7,6,43,7,'2024-45','2024-45',NULL,1,1,NULL),(71,2,6,1435,7,'2024-45','2024-45',NULL,1,1,NULL),(72,11,6,569,7,'2024-46','2024-46',NULL,1,1,NULL),(73,9,6,955,7,'2024-46','2024-46',NULL,1,1,NULL),(74,9,6,956,7,'2024-46','2024-46',NULL,1,1,NULL),(75,11,6,570,7,'2024-46','2024-46',NULL,1,1,NULL),(76,11,6,571,7,'2024-46','2024-46',NULL,1,1,NULL),(77,10,6,890,7,'2024-46','2024-46',NULL,1,1,NULL),(78,6,6,1794,7,'2024-46','2024-46',NULL,1,1,NULL),(79,9,6,957,7,'2024-46','2024-46',NULL,1,1,NULL),(80,2,6,1436,7,'2024-46','2024-46',NULL,1,1,NULL),(81,2,6,1437,7,'2024-46','2024-46',NULL,1,1,NULL),(82,2,6,1438,7,'2024-47','2024-47',NULL,1,1,NULL),(83,11,6,572,7,'2024-47','2024-47',NULL,1,1,NULL),(84,11,6,573,7,'2024-47','2024-47',NULL,1,1,NULL),(85,11,6,574,7,'2024-47','2024-47',NULL,1,1,NULL),(86,11,6,575,7,'2024-47','2024-47',NULL,1,1,NULL),(87,11,6,576,7,'2024-47','2024-47',NULL,1,1,NULL),(88,11,6,577,7,'2024-47','2024-47',NULL,1,1,NULL),(89,7,6,44,7,'2024-47','2024-47',NULL,1,1,NULL),(90,2,6,1439,7,'2024-48','2024-48',NULL,1,1,NULL),(91,2,6,1441,7,'2024-48','2024-49',NULL,1,1,NULL),(92,11,6,578,7,'2024-48','2024-48',NULL,1,1,NULL),(93,9,6,959,7,'2024-49','2024-48',NULL,1,1,NULL),(94,9,6,960,7,'2024-49','2024-48',NULL,1,1,NULL),(95,9,6,961,7,'2024-49','2024-48',NULL,1,1,NULL),(96,9,6,962,7,'2024-49','2024-48',NULL,1,1,NULL),(97,10,6,891,7,'2024-49','2024-50',NULL,1,1,NULL),(98,2,6,1440,7,'2024-49','2024-49',NULL,1,1,NULL),(99,11,6,579,7,'2024-49','2024-48',NULL,1,1,NULL),(100,11,6,580,7,'2024-49','2024-48',NULL,1,1,NULL),(101,9,6,963,7,'2024-50','2024-48',NULL,1,1,NULL),(102,9,6,964,7,'2024-50','2024-49',NULL,1,1,NULL),(103,9,6,965,7,'2024-50','2024-49',NULL,1,1,NULL),(104,9,6,966,7,'2024-50','2024-49',NULL,1,1,NULL),(105,10,6,892,7,'2024-50','2024-50',NULL,1,1,NULL),(106,7,6,45,7,'2024-50','2024-48',NULL,1,1,NULL),(107,7,6,46,7,'2024-50','2024-50',NULL,1,1,NULL),(108,2,6,1442,7,'2024-50','2024-50',NULL,1,1,NULL),(109,11,6,581,7,'2024-50','2024-49',NULL,1,1,NULL),(110,11,6,582,7,'2024-50','2024-51',NULL,1,1,NULL),(111,9,6,967,7,'2024-51','2024-49',NULL,1,1,NULL),(112,9,6,968,7,'2024-51','2024-49',NULL,1,1,NULL),(113,9,6,969,7,'2024-51','2024-49',NULL,1,1,NULL),(114,9,6,970,7,'2024-51','2024-50','Bobinage DEE',1,1,NULL),(115,2,6,1443,7,'2024-51','2024-50',NULL,1,1,NULL),(116,11,6,583,7,'2024-51','2025-03',NULL,1,1,NULL),(117,11,6,584,7,'2024-51','2025-03',NULL,1,1,NULL),(118,2,6,1444,7,'2025-01','2024-51',NULL,1,1,NULL),(119,9,6,971,7,'2025-02','2024-51',NULL,1,1,NULL),(120,9,6,972,7,'2025-02','2024-51',NULL,1,1,NULL),(121,9,6,973,7,'2025-02','2024-51',NULL,1,1,NULL),(122,9,6,974,7,'2025-02','2024-51',NULL,1,1,NULL),(123,10,6,893,7,'2025-02','2025-02',NULL,1,1,NULL),(124,2,6,1445,7,'2025-02','2024-51',NULL,1,1,NULL),(125,7,6,47,7,'2025-02','2024-51',NULL,1,1,NULL),(126,7,6,48,1,'2025-02','2025-05',NULL,1,NULL,NULL),(127,11,6,585,2,'2025-02','2025-04',NULL,1,NULL,NULL),(128,11,6,586,2,'2025-02','2025-04',NULL,1,NULL,NULL),(129,9,6,988,2,'2025-03','2025-04',NULL,1,NULL,NULL),(130,9,6,989,2,'2025-03','2025-04',NULL,1,NULL,NULL),(131,9,6,990,1,'2025-03','2025-04',NULL,1,NULL,NULL),(132,9,6,991,1,'2025-03','2025-04',NULL,1,NULL,NULL),(133,10,6,894,7,'2025-03','2025-03',NULL,1,1,NULL),(134,10,6,895,2,'2025-03','2025-04',NULL,1,NULL,NULL),(135,2,6,1446,1,'2025-03','2025-06',NULL,1,NULL,NULL),(136,11,6,587,2,'2025-03','2025-04',NULL,1,NULL,NULL),(137,11,6,588,2,'2025-03','2025-04',NULL,1,NULL,NULL),(138,9,6,979,7,'2025-04','2025-03',NULL,1,1,NULL),(139,9,6,980,7,'2025-04','2025-03',NULL,1,1,NULL),(140,9,6,981,7,'2025-04','2025-03',NULL,1,1,NULL),(141,9,6,982,7,'2025-04','2025-03',NULL,1,1,NULL),(142,2,6,1447,1,'2025-04','2025-10',NULL,1,NULL,NULL),(143,11,6,589,1,'2025-04','2025-05',NULL,1,NULL,NULL),(144,10,6,896,2,'2025-04','2025-04',NULL,1,NULL,NULL),(145,11,6,590,1,'2025-04','2025-05',NULL,1,NULL,NULL),(146,10,6,897,1,'2025-04','2025-05',NULL,1,NULL,NULL),(151,2,6,1448,1,'2025-05','2025-10',NULL,1,NULL,NULL),(152,11,6,591,1,'2025-05','2025-06',NULL,1,NULL,NULL),(153,11,6,592,1,'2025-05','2025-06',NULL,1,NULL,NULL),(154,10,6,898,1,'2025-05','2025-06',NULL,1,NULL,NULL),(155,10,6,899,1,'2025-05','2025-06',NULL,1,NULL,NULL),(156,6,6,1793,7,'2025-06','2025-02',NULL,1,1,NULL),(157,13,6,4,1,'2025-06','2025-04',NULL,1,NULL,NULL),(158,9,6,983,7,'2025-06','2025-03',NULL,1,1,NULL),(159,9,6,984,7,'2025-06','2025-03',NULL,1,1,NULL),(160,9,6,985,7,'2025-06','2025-03',NULL,1,1,NULL),(161,9,6,986,7,'2025-06','2025-03',NULL,1,1,NULL),(162,11,6,593,1,'2025-06','2025-07',NULL,1,NULL,NULL),(163,10,6,900,7,'2025-06','2025-07',NULL,1,NULL,NULL),(164,10,6,901,7,'2025-06','2025-07',NULL,1,NULL,NULL),(165,11,6,594,1,'2025-06','2025-07',NULL,1,NULL,NULL),(169,9,6,987,2,'2025-07','2025-04','rajouter car manque planning',1,NULL,NULL),(170,9,6,958,2,'2025-07','2025-04','rajouter car manque planning',1,NULL,NULL),(175,1,6,123,7,'2025-04','2025-05','Ajouter car pas dans le planning',1,NULL,NULL),(176,14,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL,NULL),(177,14,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL,NULL),(181,15,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL,NULL),(182,9,6,992,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(183,9,6,993,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(184,9,6,994,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(185,9,6,995,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(186,9,6,996,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(187,9,6,997,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(188,13,6,5,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(189,13,6,6,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(190,13,6,7,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(191,13,6,8,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL,NULL),(192,9,6,998,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(193,9,6,999,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(194,9,6,1000,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(195,9,6,1001,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(196,9,6,1002,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(197,8,6,362,1,'2025-06','2025-06','Ajpouter pas de planning',1,NULL,NULL),(200,18,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(201,18,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(202,18,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(203,16,7,NULL,2,'2025-06','2025-06','2025-06	2025-06	Ajouter pas de planning',1,NULL,NULL),(204,16,7,NULL,2,'2025-06','2025-06','2025-06	2025-06	Ajouter pas de planning',1,NULL,NULL),(205,16,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(206,16,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL,NULL),(207,9,6,1003,7,'2025-07','2025-07','ajout pas planning',1,NULL,NULL),(208,9,6,1004,7,'2025-07','2025-07','ajout pas planning',1,NULL,NULL),(209,9,6,1005,7,'2025-07','2025-07','ajout pas planning',1,NULL,NULL),(210,9,6,1006,7,'2025-07','2025-07','ajout pas planning',1,NULL,NULL),(211,9,6,1007,7,'2025-07','2025-07','ajout pas planning',1,NULL,NULL),(212,10,6,902,7,'2025-07','2025-07','ajout planning',1,NULL,NULL),(213,10,6,903,7,'2025-07','2025-07','ajout planning',1,NULL,NULL),(214,13,6,9,7,'2025-07','2025-07','ajout planning',1,NULL,NULL),(215,1,6,124,7,'2025-07','2025-08','ajouter planning',1,NULL,NULL),(216,1,6,125,7,'2025-08','2025-08','ajout planing',1,NULL,NULL),(217,1,6,126,7,'2025-08','2025-08','ajout planing',1,NULL,NULL),(218,1,6,127,7,'2025-08','2025-08','ajout planing',1,NULL,NULL),(219,1,6,128,7,'2025-08','2025-08','ajout planing',1,NULL,NULL),(220,5,6,155,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(221,9,6,1008,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(222,11,6,595,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(223,11,6,596,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(224,11,6,597,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(225,11,6,598,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(226,11,6,599,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(227,11,6,600,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(228,11,6,601,7,'2025-08','2025-08','ajout planning',1,NULL,NULL),(229,1,6,129,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(230,8,6,363,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(231,9,6,1009,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(232,10,6,904,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(233,11,6,602,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(234,11,6,603,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(235,11,6,604,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(236,11,6,605,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(237,11,6,606,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(238,11,6,607,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(239,11,6,608,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(241,14,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(242,14,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(243,14,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(244,16,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(245,16,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(246,17,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL,NULL),(247,11,6,609,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(248,11,6,610,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(249,11,6,611,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(250,11,6,612,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(251,10,6,905,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(252,5,6,156,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(253,9,6,1010,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(254,18,7,NULL,8,'2025-10','2025-10','ajout planning',1,NULL,NULL),(256,16,7,NULL,8,'2025-10','2025-10','ajout planning',1,NULL,NULL),(257,17,7,NULL,8,'2025-10','2025-10','ajout planning',1,NULL,NULL),(258,14,7,NULL,1,'2025-10','2025-10','ajout planning',1,NULL,NULL),(259,1,6,130,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(260,1,6,131,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(261,1,6,132,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(262,1,6,133,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(263,10,6,906,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(264,10,6,907,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(265,11,6,613,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(266,11,6,614,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(267,11,6,615,8,'2025-11','2025-11','ajout planning +default',1,NULL,NULL),(268,11,6,616,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(269,11,6,617,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(270,11,6,618,8,'2025-11','2025-11','ajout planning',1,NULL,NULL),(271,1,6,134,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(272,1,6,135,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(273,1,6,136,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(274,1,6,137,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(275,1,6,139,1,'2025-12','2025-13','ajout planning',1,NULL,NULL),(276,10,6,909,1,'2025-12','2025-13','ajout planning',1,NULL,NULL),(277,11,6,619,2,'2025-12','2025-12','ajout planning',1,NULL,NULL),(278,11,6,620,2,'2025-12','2025-12','ajout planning',1,NULL,NULL),(279,11,6,621,2,'2025-12','2025-12','ajout planning',1,NULL,NULL),(280,11,6,622,2,'2025-12','2025-12','ajout planning',1,NULL,NULL),(281,11,6,623,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(282,11,6,624,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(283,14,7,NULL,3,'2025-12','2025-12','ajout planning',1,NULL,NULL),(284,14,7,NULL,3,'2025-12','2025-12','ajout planning',1,NULL,NULL),(285,9,6,1011,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(286,9,6,1012,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(287,9,6,1013,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(288,9,6,1014,1,'2025-12','2025-12','ajout planning',1,NULL,NULL),(290,5,6,157,7,'2025-13','2025-14','ajout planning',1,NULL,NULL),(291,8,6,364,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(292,11,6,626,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(293,11,6,627,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(294,11,6,628,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(295,11,6,629,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(296,11,6,630,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(297,9,6,1015,3,'2025-13','2025-13','ajout planning',1,NULL,NULL),(298,9,6,1016,3,'2025-13','2025-13','ajout planning',1,NULL,NULL),(299,9,6,1017,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(300,9,6,1018,1,'2025-13','2025-13','ajout planning',1,NULL,NULL),(301,1,6,140,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(302,1,6,141,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(303,1,6,142,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(304,1,6,143,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(305,1,6,144,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(307,5,6,158,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(309,8,6,365,8,'2025-14','2025-15','ajout planning',1,NULL,NULL),(310,10,6,910,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(311,11,6,631,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(312,11,6,632,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(313,11,6,633,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(314,11,6,634,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(315,6,6,1795,7,'2025-14','2025-14','ajout planning stator recharger',1,NULL,NULL),(316,8,6,366,1,'2025-15','2025-16','ajout planning',1,NULL,NULL),(317,6,6,1796,1,'2025-15','2025-16','ajout planning',1,NULL,NULL),(318,11,6,635,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(319,11,6,636,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(320,11,6,637,1,'2025-15','2025-16','ajout planning',1,NULL,NULL),(321,5,6,159,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(322,17,7,NULL,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(323,17,7,NULL,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(324,16,7,NULL,7,'2025-14','2025-14','ajout planning',1,NULL,NULL),(325,16,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(326,16,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(327,16,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(328,17,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(330,17,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(331,19,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL,NULL),(332,8,6,367,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(333,11,6,638,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(334,11,6,639,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(335,11,6,640,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(336,7,6,49,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(337,7,6,50,1,'2025-16','2025-17','ajout planning',1,NULL,NULL),(338,9,6,1019,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(339,9,6,1020,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(340,9,6,1021,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(341,9,6,1022,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(342,1,6,145,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(343,1,6,146,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(344,1,6,147,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(345,1,6,148,1,'2025-16','2025-16','ajout planning',1,NULL,NULL),(346,7,6,51,1,'2025-17','2025-18','ajout planning',1,NULL,NULL),(347,9,6,1023,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(348,9,6,1024,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(349,9,6,1025,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(350,9,6,1026,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(351,11,6,641,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(352,11,6,642,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(353,6,6,1797,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(354,8,6,368,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(355,1,6,149,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(356,1,6,150,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(357,1,6,151,1,'2025-17','2025-18','ajout planning',1,NULL,NULL),(358,11,6,643,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(359,18,7,NULL,4,'2025-16','2025-16','ajout planning',1,NULL,NULL),(360,19,7,NULL,4,'2025-16','2025-16','ajout planning',1,NULL,NULL),(361,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(362,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(363,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(364,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL,NULL),(365,1,6,152,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(366,1,6,153,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(367,1,6,154,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(368,6,6,1798,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(369,9,6,1027,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(370,9,6,1028,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(371,9,6,0,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(372,9,6,1030,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(373,11,6,644,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(374,11,6,645,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(375,11,6,646,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(376,1,6,155,1,'2025-18','2025-18','ajout planning',1,NULL,NULL),(458,9,6,1031,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(459,9,6,1032,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(460,9,6,1033,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(461,9,6,1034,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(462,11,6,647,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(463,11,6,648,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(464,11,6,649,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(465,11,6,650,7,'2025-19','2025-19','ajout planning manuel david',1,1,NULL),(466,1,6,156,7,'2025-19','2025-19','ajout planning manuel david',1,NULL,NULL),(467,1,6,157,7,'2025-19','2025-19','ajout planning manuel david',1,NULL,NULL),(468,1,6,158,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(469,1,6,159,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(470,1,6,160,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(471,11,6,651,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(472,11,6,652,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(473,11,6,653,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(474,9,6,1035,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(475,8,6,369,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(476,7,6,52,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(477,2,6,1450,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(478,2,6,1451,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL),(479,2,6,1452,7,'2025-20','2025-20','ajout planning manuel david',1,NULL,NULL);
/*!40000 ALTER TABLE `prod_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_type_sous_ensemble`
--

DROP TABLE IF EXISTS `prod_type_sous_ensemble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_type_sous_ensemble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_type_sous_ensemble`
--

LOCK TABLES `prod_type_sous_ensemble` WRITE;
/*!40000 ALTER TABLE `prod_type_sous_ensemble` DISABLE KEYS */;
INSERT INTO `prod_type_sous_ensemble` VALUES (1,'Rotor'),(2,'Stator'),(3,'Palier'),(4,'Inducteur'),(5,'Induit'),(6,'Alternateur'),(7,'Compresseur'),(8,'Stator ST'),(9,'Roue Polaire ST'),(10,'Induit ST'),(11,'Inducteur ST');
/*!40000 ALTER TABLE `prod_type_sous_ensemble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualite_catalogue_defauts`
--

DROP TABLE IF EXISTS `qualite_catalogue_defauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualite_catalogue_defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mot_cle` varchar(50) NOT NULL,
  `fk_type_sous_ensemble` int(11) DEFAULT NULL,
  `fk_categorie_defaut` int(11) NOT NULL,
  `fk_gravite` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_defauts_categories_defauts_FK` (`fk_categorie_defaut`) USING BTREE,
  KEY `catalogue_defauts_gravite_defaut_FK` (`fk_gravite`) USING BTREE,
  KEY `catalogue_defauts_types_articles_FK` (`fk_type_sous_ensemble`) USING BTREE,
  CONSTRAINT `qualite_catalogue_defauts_prod_type_sous_ensemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `prod_type_sous_ensemble` (`id`),
  CONSTRAINT `qualite_catalogue_defauts_qualite_categories_defauts_FK` FOREIGN KEY (`fk_categorie_defaut`) REFERENCES `qualite_categories_defauts` (`id`),
  CONSTRAINT `qualite_catalogue_defauts_qualite_gravite_defaut_FK` FOREIGN KEY (`fk_gravite`) REFERENCES `qualite_gravite_defaut` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualite_catalogue_defauts`
--

LOCK TABLES `qualite_catalogue_defauts` WRITE;
/*!40000 ALTER TABLE `qualite_catalogue_defauts` DISABLE KEYS */;
INSERT INTO `qualite_catalogue_defauts` VALUES (5,'cosse',2,1,1,'Mauvaise soudure cosse'),(6,'connexion',2,1,1,'Câble de sortie trop long'),(7,'connexion',2,1,1,'Câble de sortie trop court'),(8,'connexion',1,1,1,'Cable sortie abîmée'),(9,'connexion',2,1,1,'Cable sortie abîmée'),(10,'bobinage',2,1,1,'Papier long'),(11,'bobinage',2,1,1,'Capote ressorti/absente'),(12,'diode',1,1,1,'Ponte-diode cassée'),(13,'diode',1,1,1,'Erreur de ponte-diode'),(14,'diode',1,1,1,'Cosse mal serti'),(15,'diode',1,1,1,'Câble mal serré'),(16,'equilibrage',1,2,2,'Vibration'),(17,'usinage',1,2,2,'Mauvaise cote'),(18,'usinage',2,2,2,'Mauvaise cote'),(19,'valeurs électriques',6,1,2,'Harmoniques fortes'),(20,'valeurs électriques',2,1,2,'Courant de circulation'),(21,'valeurs électriques',2,1,2,'Ordre des phases'),(22,'bobinage',2,1,2,'Bobine en court-circuit'),(23,'usinage',1,2,2,'Frottement'),(24,'valeurs électriques',6,1,1,'Harmonique élgèrement au dessus de la normale'),(25,'connexion',1,1,1,'gaine de protection sortie ou mal positionner');
/*!40000 ALTER TABLE `qualite_catalogue_defauts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualite_categories_defauts`
--

DROP TABLE IF EXISTS `qualite_categories_defauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualite_categories_defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualite_categories_defauts`
--

LOCK TABLES `qualite_categories_defauts` WRITE;
/*!40000 ALTER TABLE `qualite_categories_defauts` DISABLE KEYS */;
INSERT INTO `qualite_categories_defauts` VALUES (1,'Electrique'),(2,'Mécanique');
/*!40000 ALTER TABLE `qualite_categories_defauts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualite_controles`
--

DROP TABLE IF EXISTS `qualite_controles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualite_controles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_planning` int(11) NOT NULL,
  `fk_etat` int(11) NOT NULL,
  `hasDefaut` tinyint(4) NOT NULL DEFAULT 0,
  `commentaire` varchar(255) DEFAULT NULL,
  `date_controle` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `controles_date_controle_IDX` (`date_controle`) USING BTREE,
  KEY `controles_etats_FK` (`fk_etat`) USING BTREE,
  KEY `controles_planning_FK` (`fk_planning`) USING BTREE,
  CONSTRAINT `qualite_controles_etats_FK` FOREIGN KEY (`fk_etat`) REFERENCES `etats` (`id`),
  CONSTRAINT `qualite_controles_prod_planning_FK` FOREIGN KEY (`fk_planning`) REFERENCES `prod_planning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualite_controles`
--

LOCK TABLES `qualite_controles` WRITE;
/*!40000 ALTER TABLE `qualite_controles` DISABLE KEYS */;
INSERT INTO `qualite_controles` VALUES (59,63,5,1,NULL,'2024-11-06 14:00:00'),(60,63,7,0,NULL,'2024-11-06 14:00:00'),(61,64,7,0,NULL,'2024-11-06 14:00:00'),(62,65,7,0,NULL,'2024-11-07 14:00:00'),(63,66,7,0,NULL,'2024-11-07 14:00:00'),(64,67,7,0,NULL,'2024-11-07 14:00:00'),(65,68,7,0,NULL,'2024-11-07 14:00:00'),(66,69,7,0,NULL,'2024-11-08 14:00:00'),(67,70,7,0,NULL,'2024-11-08 14:00:00'),(68,71,7,0,NULL,'2024-11-07 14:00:00'),(69,72,7,0,NULL,'2024-11-12 14:00:00'),(70,73,7,0,NULL,'2024-11-12 14:00:00'),(71,74,7,0,NULL,'2024-11-13 14:00:00'),(72,75,7,0,NULL,'2024-11-13 14:00:00'),(73,76,7,0,NULL,'2024-11-13 14:00:00'),(74,77,7,1,NULL,'2024-11-13 14:00:00'),(75,78,7,0,NULL,'2024-11-13 14:00:00'),(76,79,7,0,NULL,'2024-11-14 14:00:00'),(77,80,7,0,NULL,'2024-11-14 14:00:00'),(78,81,7,0,NULL,'2024-11-14 14:00:00'),(79,82,7,0,NULL,'2024-11-21 14:00:00'),(80,83,7,0,NULL,'2024-11-18 14:00:00'),(81,84,7,0,NULL,'2024-11-19 14:00:00'),(82,85,7,0,NULL,'2024-11-19 14:00:00'),(83,86,7,0,NULL,'2024-11-20 14:00:00'),(84,87,7,0,NULL,'2024-11-20 14:00:00'),(85,88,7,0,NULL,'2024-11-21 14:00:00'),(86,89,7,0,NULL,'2024-11-22 14:00:00'),(87,93,7,0,NULL,'2024-11-26 10:36:11'),(88,94,7,0,NULL,'2024-11-27 10:00:00'),(89,95,7,0,NULL,'2024-11-27 10:00:00'),(90,92,7,0,NULL,'2024-11-27 10:00:00'),(91,99,7,0,NULL,'2024-11-27 10:00:00'),(92,90,7,0,NULL,'2024-11-27 10:00:00'),(93,96,7,0,NULL,'2024-11-28 07:51:40'),(94,100,7,0,NULL,'2024-11-29 10:00:00'),(95,101,7,0,NULL,'2024-11-29 10:00:00'),(96,106,7,0,NULL,'2024-11-29 10:00:00'),(97,98,7,0,NULL,'2024-12-02 16:17:14'),(98,102,7,0,NULL,'2024-12-02 16:17:14'),(99,103,7,1,NULL,'2024-12-03 10:20:29'),(100,104,7,1,NULL,'2024-12-03 14:16:34'),(101,104,7,0,NULL,'2024-12-03 14:16:34'),(102,111,7,0,NULL,'2024-12-03 16:00:48'),(103,112,7,0,NULL,'2024-12-04 09:52:23'),(104,91,7,0,NULL,'2024-12-04 11:52:04'),(105,109,7,1,NULL,'2024-12-04 15:18:40'),(106,113,7,0,NULL,'2024-12-05 07:36:09'),(107,108,5,1,'inversion phse 28V','2024-12-11 16:01:17'),(108,108,7,0,NULL,'2024-12-11 16:01:53'),(109,97,7,0,NULL,'2024-12-13 07:51:03'),(110,105,7,1,NULL,'2024-12-13 07:51:28'),(111,114,7,1,NULL,'2024-12-13 07:52:37'),(112,115,7,0,NULL,'2024-12-13 07:53:25'),(113,107,7,0,NULL,'2024-12-13 07:53:49'),(114,119,7,0,NULL,'2024-12-18 12:58:22'),(115,120,7,0,NULL,'2024-12-18 12:58:22'),(116,118,7,0,NULL,'2024-12-18 13:57:13'),(117,121,7,0,NULL,'2024-12-18 14:50:15'),(118,122,7,0,NULL,'2024-12-19 09:56:12'),(119,124,7,0,NULL,'2024-12-19 10:35:57'),(120,125,7,0,NULL,'2024-12-19 14:20:50'),(121,110,7,0,NULL,'2024-12-19 14:20:50'),(125,131,7,0,NULL,'2025-01-08 08:54:20'),(126,130,7,0,NULL,'2025-01-08 08:54:35'),(127,123,7,0,NULL,'2025-01-08 08:56:08'),(128,132,5,1,NULL,'2025-01-08 14:19:55'),(129,132,5,1,NULL,'2025-01-08 14:20:08'),(130,132,5,1,NULL,'2025-01-09 11:23:15'),(131,132,7,0,NULL,'2025-01-09 11:23:34'),(132,156,5,1,NULL,'2025-01-10 10:06:40'),(133,156,7,0,NULL,'2025-01-10 10:06:40'),(134,138,7,1,NULL,'2025-01-13 10:33:17'),(135,139,7,0,NULL,'2025-01-14 07:18:21'),(136,116,7,0,NULL,'2025-01-14 07:18:46'),(137,133,7,0,NULL,'2025-01-14 07:21:12'),(138,140,7,0,NULL,'2025-01-16 14:11:03'),(139,141,7,0,NULL,'2025-01-16 14:11:03'),(140,158,7,0,NULL,'2025-01-16 14:11:03'),(141,159,7,0,NULL,'2025-01-16 14:11:03'),(142,160,7,0,NULL,'2025-01-16 14:11:03'),(143,161,7,0,NULL,'2025-01-16 14:11:03'),(144,117,7,0,NULL,'2025-01-16 14:11:03'),(145,169,7,0,NULL,'2025-01-21 14:31:46'),(146,170,7,0,NULL,'2025-01-21 14:31:46'),(147,134,7,0,NULL,'2025-01-21 14:33:08'),(148,144,7,0,NULL,'2025-01-21 14:33:08'),(150,127,7,0,NULL,'2025-01-21 14:45:13'),(151,128,7,0,NULL,'2025-01-21 14:45:13'),(152,136,7,0,NULL,'2025-01-21 14:45:33'),(153,129,7,0,NULL,'2025-01-22 10:14:47'),(154,130,7,0,NULL,'2025-01-22 12:54:01'),(155,137,7,0,NULL,'2025-01-23 07:08:09'),(156,176,7,0,NULL,'2025-01-23 07:42:29'),(157,177,7,0,NULL,'2025-01-23 08:52:08'),(159,131,7,0,NULL,'2025-01-23 11:46:15'),(160,132,7,0,NULL,'2025-01-23 15:27:59'),(161,157,7,0,NULL,'2025-01-24 11:18:44'),(162,143,7,0,NULL,'2025-01-29 07:57:47'),(163,146,7,0,NULL,'2025-01-29 07:58:15'),(164,188,7,0,NULL,'2025-01-29 07:58:59'),(165,182,7,0,NULL,'2025-01-29 07:59:51'),(166,183,7,0,NULL,'2025-01-29 07:59:51'),(167,184,7,0,NULL,'2025-01-29 07:59:51'),(168,185,7,0,NULL,'2025-01-29 07:59:51'),(169,189,7,0,NULL,'2025-01-29 12:33:00'),(170,126,7,0,NULL,'2025-01-29 12:34:11'),(171,190,7,0,NULL,'2025-01-29 16:44:22'),(172,190,7,0,NULL,'2025-01-29 16:44:22'),(173,145,7,0,NULL,'2025-01-29 16:45:18'),(174,175,7,0,NULL,'2025-01-31 11:59:44'),(175,186,7,0,NULL,'2025-01-31 11:59:44'),(176,187,7,0,NULL,'2025-01-31 11:59:44'),(177,152,7,0,NULL,'2025-02-05 11:52:40'),(178,192,7,0,NULL,'2025-02-05 11:54:11'),(180,193,7,0,NULL,'2025-02-05 11:54:11'),(181,194,7,0,NULL,'2025-02-05 11:54:11'),(182,154,7,0,NULL,'2025-02-05 11:55:23'),(183,155,7,0,NULL,'2025-02-05 11:55:23'),(184,135,7,0,NULL,'2025-02-05 14:13:27'),(185,195,7,0,NULL,'2025-02-06 07:02:27'),(186,197,7,0,NULL,'2025-02-07 10:17:16'),(187,153,7,0,NULL,'2025-02-07 10:20:44'),(188,207,7,0,NULL,'2025-02-13 10:34:02'),(189,208,7,0,NULL,'2025-02-13 10:34:02'),(190,209,7,0,NULL,'2025-02-13 10:34:02'),(191,210,7,0,NULL,'2025-02-13 10:34:02'),(192,211,7,0,NULL,'2025-02-13 10:34:02'),(193,163,7,0,NULL,'2025-02-13 10:36:33'),(194,164,7,0,NULL,'2025-02-13 10:36:33'),(195,212,7,0,NULL,'2025-02-13 10:36:33'),(196,213,7,0,NULL,'2025-02-13 10:36:33'),(197,162,7,0,NULL,'2025-02-13 10:38:04'),(198,165,7,0,NULL,'2025-02-13 10:38:04'),(199,214,7,0,NULL,'2025-02-13 10:38:04'),(200,215,7,0,NULL,'2025-02-18 10:38:00'),(201,216,7,0,NULL,'2025-02-21 10:58:47'),(202,217,7,0,NULL,'2025-02-21 10:58:47'),(203,218,7,0,NULL,'2025-02-21 10:58:47'),(204,218,7,0,NULL,'2025-02-21 10:58:47'),(205,220,7,0,NULL,'2025-02-21 11:00:40'),(206,221,7,0,NULL,'2025-02-19 11:02:25'),(207,222,7,0,NULL,'2025-02-17 11:05:32'),(208,223,7,0,NULL,'2025-02-17 11:05:32'),(209,224,7,0,NULL,'2025-02-18 11:05:32'),(210,225,7,0,NULL,'2025-02-19 11:05:32'),(211,226,7,0,NULL,'2025-02-20 11:05:32'),(212,227,7,0,NULL,'2025-02-20 11:05:32'),(213,228,7,0,NULL,'2025-02-21 11:05:32'),(214,232,7,0,NULL,'2025-02-24 14:40:53'),(215,233,7,0,NULL,'2025-02-24 14:41:50'),(216,232,7,0,NULL,'2025-02-26 10:44:32'),(217,233,7,0,NULL,'2025-02-26 10:45:23'),(218,234,7,0,NULL,'2025-02-26 10:45:23'),(219,235,7,0,NULL,'2025-02-26 10:45:23'),(220,231,7,0,NULL,'2025-02-26 10:45:55'),(221,229,7,0,NULL,'2025-02-28 10:00:00'),(222,230,7,0,NULL,'2025-02-28 10:00:00'),(223,236,7,0,NULL,'2025-02-28 10:00:00'),(224,237,7,0,NULL,'2025-02-28 10:00:00'),(225,238,7,0,NULL,'2025-02-28 10:00:00'),(226,239,7,1,NULL,'2025-02-28 10:00:00'),(227,239,7,1,NULL,'2025-02-28 10:00:00'),(228,239,7,1,NULL,'2025-02-28 10:00:00'),(229,239,7,1,NULL,'2025-02-28 10:00:00'),(230,239,7,0,NULL,'2025-02-28 10:00:00'),(231,247,7,0,NULL,'2025-03-04 12:40:47'),(232,142,7,0,NULL,'2025-03-04 12:43:46'),(233,253,5,1,NULL,'2025-03-04 10:17:45'),(234,253,5,1,NULL,'2025-03-04 10:17:45'),(235,253,5,1,NULL,'2025-03-04 10:17:45'),(236,253,5,1,NULL,'2025-03-04 10:17:45'),(237,251,7,0,NULL,'2025-03-05 10:20:46'),(238,248,5,1,NULL,'2025-03-05 10:21:38'),(239,253,7,0,NULL,'2025-03-07 11:16:44'),(240,252,7,0,NULL,'2025-03-07 11:17:22'),(241,151,7,0,NULL,'2025-03-07 11:31:34'),(242,248,7,0,NULL,'2025-03-07 11:35:01'),(243,249,7,0,NULL,'2025-03-07 11:35:01'),(244,250,5,1,NULL,'2025-03-07 11:35:01'),(245,250,7,0,NULL,'2025-03-07 11:35:01'),(246,265,7,0,NULL,'2025-03-10 16:18:35'),(247,266,7,0,NULL,'2025-03-10 16:18:35'),(250,267,5,1,NULL,'2025-03-10 16:21:54'),(251,263,7,0,NULL,'2025-03-10 16:23:52'),(252,264,7,0,NULL,'2025-03-13 00:00:00'),(253,267,7,0,NULL,'2025-03-12 00:00:00'),(254,268,7,0,NULL,'2025-03-12 00:00:00'),(255,269,7,0,NULL,'2025-03-13 00:00:00'),(256,270,7,0,NULL,'2025-03-13 00:00:00'),(257,259,7,0,NULL,'2025-03-13 00:00:00'),(258,260,7,0,NULL,'2025-03-13 00:00:00'),(259,261,7,0,NULL,'2025-03-13 00:00:00'),(260,262,7,0,NULL,'2025-03-13 00:00:00'),(261,277,7,0,NULL,'2025-03-17 00:00:00'),(262,278,7,0,NULL,'2025-03-17 00:00:00'),(263,279,7,0,NULL,'2025-03-18 15:19:19'),(264,280,5,1,NULL,'2025-03-18 15:19:19'),(265,280,5,1,NULL,'2025-03-18 15:19:19'),(266,280,7,0,NULL,'2025-03-19 15:48:58'),(267,285,7,0,NULL,'2025-03-19 15:51:19'),(268,286,7,0,NULL,'2025-03-19 15:51:19'),(269,287,7,0,NULL,'2025-03-19 15:51:19'),(270,271,7,0,NULL,'2025-03-19 15:52:21'),(271,272,7,0,NULL,'2025-03-19 15:52:21'),(272,288,7,0,NULL,'2025-03-20 15:28:55'),(273,281,7,0,NULL,'2025-03-19 00:00:00'),(274,282,7,0,NULL,'2025-03-20 15:30:27'),(276,273,7,0,NULL,'2025-03-20 15:33:09'),(277,274,7,0,NULL,'2025-03-20 15:33:09'),(278,297,7,0,NULL,'2025-03-24 00:00:00'),(279,298,7,0,NULL,'2025-03-24 00:00:00'),(280,292,7,0,NULL,'2025-03-24 00:00:00'),(281,299,7,0,NULL,'2025-03-25 16:34:22'),(282,291,7,0,NULL,'2025-03-25 16:35:02'),(283,276,7,0,NULL,'2025-03-25 16:35:45'),(284,300,7,0,NULL,'2025-03-26 09:30:18'),(285,293,7,0,NULL,'2025-03-26 16:42:56'),(286,275,7,0,NULL,'2025-03-31 08:11:09'),(287,294,7,0,NULL,'2025-03-27 00:00:00'),(289,295,7,0,NULL,'2025-03-27 00:00:00'),(290,296,7,0,NULL,'2025-03-27 00:00:00'),(291,275,7,0,NULL,'2025-03-28 00:00:00'),(292,290,7,0,NULL,'2025-03-31 13:47:55'),(293,307,7,0,NULL,'2025-04-04 00:00:00'),(294,301,7,0,NULL,'2025-04-02 00:00:00'),(295,302,7,0,NULL,'2025-04-02 00:00:00'),(296,303,7,0,NULL,'2025-04-02 00:00:00'),(297,304,7,0,NULL,'2025-04-03 00:00:00'),(298,305,7,0,NULL,'2025-04-04 00:00:00'),(299,310,7,0,NULL,'2025-03-31 00:00:00'),(300,311,7,0,NULL,'2025-04-01 00:00:00'),(301,312,7,0,NULL,'2025-04-01 00:00:00'),(302,313,7,0,NULL,'2025-04-03 00:00:00'),(303,314,7,0,NULL,'2025-04-04 00:00:00'),(304,315,7,0,NULL,'2025-04-03 00:00:00'),(305,322,7,0,NULL,'2025-04-03 00:00:00'),(306,323,7,0,NULL,'2025-04-03 00:00:00'),(307,324,7,0,NULL,'2025-04-03 00:00:00'),(308,309,7,0,NULL,'2025-04-07 00:00:00'),(309,318,7,0,NULL,'2025-04-08 00:00:00'),(310,319,7,0,NULL,'2025-04-11 00:00:00'),(311,321,7,0,NULL,'2025-04-10 00:00:00'),(312,325,7,0,NULL,'2025-04-11 00:00:00'),(313,326,7,0,NULL,'2025-04-11 00:00:00'),(314,327,7,0,NULL,'2025-04-11 00:00:00'),(315,328,7,0,NULL,'2025-04-11 00:00:00'),(316,330,7,0,NULL,'2025-04-11 00:00:00'),(317,331,7,0,NULL,'2025-04-11 00:00:00'),(318,338,7,0,NULL,'2025-04-14 00:00:00'),(319,339,7,0,NULL,'2025-04-14 00:00:00'),(320,320,5,1,NULL,'2025-04-14 00:00:00'),(321,320,7,0,NULL,'2025-04-14 00:00:00'),(322,317,7,1,NULL,'2025-04-15 09:00:00'),(323,342,7,0,NULL,'2025-04-15 12:32:04'),(325,343,7,0,NULL,'2025-04-15 12:32:17'),(326,340,7,0,NULL,'2025-04-15 14:16:43'),(327,341,7,0,NULL,'2025-04-15 16:11:04'),(328,316,7,0,NULL,'2025-04-16 09:16:42'),(329,333,7,0,NULL,'2025-04-16 11:19:35'),(330,334,7,0,NULL,'2025-04-16 13:36:36'),(331,344,7,0,NULL,'2025-04-17 07:55:30'),(332,335,7,0,NULL,'2025-04-17 11:14:05'),(333,332,7,0,NULL,'2025-04-17 16:21:53'),(334,336,7,0,NULL,'2025-04-17 16:29:02'),(335,345,7,0,NULL,'2025-04-18 10:07:58'),(336,359,7,0,NULL,'2025-04-18 00:00:00'),(337,360,7,0,NULL,'2025-04-18 00:00:00'),(338,347,7,0,NULL,'2025-04-22 12:34:42'),(339,348,7,0,NULL,'2025-04-22 14:31:27'),(340,349,7,0,NULL,'2025-04-22 16:13:43'),(341,350,7,0,NULL,'2025-04-23 10:37:57'),(342,351,7,0,NULL,'2025-04-23 10:45:02'),(343,352,7,0,NULL,'2025-04-23 14:11:11'),(344,337,7,0,NULL,'2025-04-24 08:26:30'),(345,358,7,0,NULL,'2025-04-24 13:43:10'),(346,353,7,0,NULL,'2025-04-24 00:00:00'),(347,354,7,0,NULL,'2025-04-25 06:27:11'),(348,361,7,0,NULL,'2025-04-25 10:51:42'),(349,362,7,0,NULL,'2025-04-25 10:51:42'),(350,363,7,0,NULL,'2025-04-25 10:51:42'),(351,364,7,0,NULL,'2025-04-25 10:51:42'),(352,355,5,1,NULL,'2025-04-25 10:53:12'),(353,355,7,0,NULL,'2025-04-25 10:53:12'),(354,356,7,0,NULL,'2025-04-25 10:53:12'),(355,369,7,0,NULL,'2025-04-28 12:59:00'),(356,370,7,0,NULL,'2025-04-28 00:00:00'),(357,370,7,0,NULL,'2025-04-28 00:00:00'),(358,357,7,0,NULL,'2025-04-29 09:08:14'),(359,368,7,0,NULL,'2025-04-29 09:08:14'),(360,346,7,0,NULL,'2025-04-29 10:50:20'),(361,365,7,0,NULL,'2025-04-29 11:16:19'),(362,373,5,1,NULL,'2025-04-29 15:19:34'),(363,373,5,1,NULL,'2025-04-29 15:19:34'),(364,373,7,0,NULL,'2025-04-29 15:19:34'),(365,363,7,0,NULL,'2025-04-29 15:23:54'),(366,367,7,0,NULL,'2025-04-29 16:44:32'),(367,372,7,0,NULL,'2025-04-30 16:17:50'),(368,375,5,1,NULL,'2025-04-30 16:19:56'),(369,375,5,1,NULL,'2025-04-30 16:19:56'),(370,375,7,0,NULL,'2025-04-30 16:19:56'),(371,374,7,0,NULL,'2025-04-30 16:21:22'),(372,376,7,0,NULL,'2025-04-30 16:21:42'),(373,458,4,0,NULL,'2025-05-05 00:00:00'),(374,459,4,0,NULL,'2025-05-05 00:00:00'),(375,460,4,0,NULL,'2025-05-06 00:00:00'),(376,461,4,0,NULL,'2025-05-07 00:00:00'),(377,462,5,1,NULL,'2025-05-05 00:00:00'),(378,462,4,0,NULL,'2025-05-05 00:00:00'),(379,464,5,1,NULL,'2025-05-06 00:00:00'),(380,464,5,1,NULL,'2025-05-06 00:00:00'),(381,464,4,0,NULL,'2025-05-07 00:00:00'),(382,465,5,1,NULL,'2025-05-07 00:00:00'),(383,465,5,1,NULL,'2025-05-07 00:00:00'),(384,465,7,0,NULL,'2025-05-07 00:00:00'),(385,466,7,0,NULL,'2025-05-06 00:00:00'),(386,467,7,0,NULL,'2025-05-07 00:00:00'),(387,468,7,0,NULL,'2025-05-13 00:00:00'),(388,469,7,0,NULL,'2025-05-14 00:00:00'),(389,470,7,0,NULL,'2025-05-14 00:00:00'),(390,471,7,1,NULL,'2025-05-12 00:00:00'),(391,471,7,1,NULL,'2025-05-12 00:00:00'),(392,471,7,0,NULL,'2025-05-12 00:00:00'),(393,472,7,0,NULL,'2025-05-12 00:00:00'),(394,473,7,0,NULL,'2025-05-12 00:00:00'),(395,474,7,0,NULL,'2025-05-15 00:00:00'),(396,475,7,0,NULL,'2025-05-13 00:00:00'),(397,476,7,0,NULL,'2025-05-13 00:00:00'),(398,477,7,0,NULL,'2025-05-14 00:00:00'),(399,478,7,0,NULL,'2025-05-14 00:00:00'),(400,479,7,0,NULL,'2025-05-15 00:00:00');
/*!40000 ALTER TABLE `qualite_controles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualite_defauts`
--

DROP TABLE IF EXISTS `qualite_defauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualite_defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_controle` int(11) NOT NULL,
  `fk_type_sous_ensemble` int(11) NOT NULL,
  `fk_catalogue_defaut` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `defauts_users_FK` (`fk_user`) USING BTREE,
  KEY `qualite_defauts_qualite_catalogue_defauts_FK` (`fk_catalogue_defaut`),
  KEY `qualite_defauts_prod_type_sous_ensemble_FK` (`fk_type_sous_ensemble`),
  KEY `qualite_defauts_qualite_controles_FK` (`fk_controle`),
  CONSTRAINT `qualite_defauts_prod_type_sous_ensemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `prod_type_sous_ensemble` (`id`),
  CONSTRAINT `qualite_defauts_qualite_catalogue_defauts_FK` FOREIGN KEY (`fk_catalogue_defaut`) REFERENCES `qualite_catalogue_defauts` (`id`),
  CONSTRAINT `qualite_defauts_qualite_controles_FK` FOREIGN KEY (`fk_controle`) REFERENCES `qualite_controles` (`id`),
  CONSTRAINT `qualite_defauts_users_FK` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualite_defauts`
--

LOCK TABLES `qualite_defauts` WRITE;
/*!40000 ALTER TABLE `qualite_defauts` DISABLE KEYS */;
INSERT INTO `qualite_defauts` VALUES (11,59,2,18,14,NULL,'2024-11-06 14:00:00'),(12,74,2,5,3,NULL,'2024-11-13 19:10:47'),(14,99,6,24,14,NULL,'2024-12-03 10:22:32'),(15,100,6,19,14,NULL,'2024-12-03 14:17:04'),(16,105,6,24,14,NULL,'2024-12-04 15:19:31'),(17,107,6,21,1,NULL,'2024-12-11 16:02:37'),(18,107,6,5,1,NULL,'2024-12-11 16:03:13'),(19,107,6,25,1,NULL,'2024-12-11 16:05:45'),(20,110,6,24,14,NULL,'2024-12-13 07:51:54'),(21,111,6,24,14,NULL,'2024-12-13 07:53:05'),(22,128,6,19,14,NULL,'2025-01-08 14:20:50'),(23,129,6,19,14,NULL,'2025-01-08 14:20:50'),(24,130,6,19,14,NULL,'2025-01-09 11:34:48'),(25,132,6,20,14,NULL,'2025-01-10 10:07:21'),(26,134,6,24,14,NULL,'2025-01-13 10:33:45'),(27,226,2,19,14,NULL,'2025-02-28 09:30:32'),(28,227,2,19,14,NULL,'2025-02-28 09:30:32'),(29,228,2,19,14,NULL,'2025-02-28 09:30:32'),(30,229,2,19,14,NULL,'2025-02-28 09:30:32'),(31,233,6,19,12,'pb toles','2025-03-05 10:19:41'),(32,234,6,19,12,'pb toles','2025-03-05 10:19:41'),(33,235,6,19,12,'pb toles','2025-03-05 10:19:41'),(34,236,6,19,12,'pb toles','2025-03-05 10:19:41'),(35,238,2,22,2,NULL,'2025-03-05 10:22:45'),(36,244,2,19,14,NULL,'2025-03-07 11:35:49'),(38,250,2,22,1,'mélange phase','2025-03-10 16:22:51'),(39,264,6,19,14,NULL,'2025-03-18 15:20:20'),(40,265,6,19,14,NULL,'2025-03-18 15:20:20'),(41,320,6,19,14,NULL,'2025-04-14 00:00:00'),(42,352,1,23,14,NULL,'2025-04-25 10:53:53'),(43,362,6,20,12,NULL,'2025-04-28 00:00:00'),(44,363,6,20,12,NULL,'2025-04-28 00:00:00'),(45,368,1,16,9,NULL,'2025-04-30 16:20:59'),(46,369,1,16,9,NULL,'2025-04-30 16:20:59'),(47,377,6,19,1,NULL,'2025-05-05 00:00:00'),(48,379,6,20,13,NULL,'2025-05-06 00:00:00'),(49,380,6,20,13,NULL,'2025-05-06 00:00:00'),(50,381,6,19,13,NULL,'2025-05-07 00:00:00'),(51,382,6,19,13,NULL,'2025-05-07 00:00:00'),(52,390,6,16,13,NULL,'2025-05-12 00:00:00'),(53,391,6,19,13,NULL,'2025-05-12 00:00:00');
/*!40000 ALTER TABLE `qualite_defauts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualite_gravite_defaut`
--

DROP TABLE IF EXISTS `qualite_gravite_defaut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualite_gravite_defaut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `poids` float DEFAULT 1,
  `couleur` varchar(7) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualite_gravite_defaut`
--

LOCK TABLES `qualite_gravite_defaut` WRITE;
/*!40000 ALTER TABLE `qualite_gravite_defaut` DISABLE KEYS */;
INSERT INTO `qualite_gravite_defaut` VALUES (1,'mineur',0.5,'#FFA500','Défaut mineur '),(2,'majeur',1,'#FF0000','Défaut Majeur');
/*!40000 ALTER TABLE `qualite_gravite_defaut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securite_accidents_travail`
--

DROP TABLE IF EXISTS `securite_accidents_travail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securite_accidents_travail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_sst_id` int(11) NOT NULL,
  `fk_operation_id` int(11) NOT NULL,
  `arret` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accidents_travail_atelier_operations_FK` (`fk_operation_id`),
  KEY `securite_accidents_travail_users_FK` (`fk_sst_id`),
  KEY `securite_accidents_travail_users_FK_1` (`fk_user_id`),
  CONSTRAINT `accidents_travail_atelier_operations_FK` FOREIGN KEY (`fk_operation_id`) REFERENCES `suivis_operations` (`id`),
  CONSTRAINT `securite_accidents_travail_users_FK` FOREIGN KEY (`fk_sst_id`) REFERENCES `users` (`id`),
  CONSTRAINT `securite_accidents_travail_users_FK_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securite_accidents_travail`
--

LOCK TABLES `securite_accidents_travail` WRITE;
/*!40000 ALTER TABLE `securite_accidents_travail` DISABLE KEYS */;
/*!40000 ALTER TABLE `securite_accidents_travail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suivis_operations`
--

DROP TABLE IF EXISTS `suivis_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suivis_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suivis_operations`
--

LOCK TABLES `suivis_operations` WRITE;
/*!40000 ALTER TABLE `suivis_operations` DISABLE KEYS */;
INSERT INTO `suivis_operations` VALUES (1,'Empilage Stator'),(2,'Usinage Stator'),(3,'Bobinage Stator'),(4,'Imprégnation Stator'),(5,'Nettoyage Stator'),(6,'Empilage Rotor'),(7,'Bobinage Rotor'),(8,'Imprégnation Rotor'),(9,'Nettoyage Rotor'),(10,'Équipement Rotor'),(11,'Équilibrage Rotor'),(12,'Pré-équipement essais Rotor'),(13,'Insertion Palier'),(14,'Équipement Palier'),(15,'Essais Alternateur'),(16,'Essais Alternateur Redresseur'),(17,'Finition Alternateur'),(18,'Fabrication Bobine'),(19,'Compresseur'),(20,'Manutention');
/*!40000 ALTER TABLE `suivis_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(4) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` enum('user','superuser','admin') DEFAULT 'user',
  `sst` tinyint(4) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entree` date NOT NULL,
  `date_sortie` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_unique` (`nom`,`prenom`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jta1','$2y$10$9SVjx0LJeD9exiriwITU/e65QgK53FxuNc5g1yjYZ6EFl8RoE/ScW','TANKOY','Justin','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(2,'gsa1','$2y$10$h8K74SnGgGiBGuHFjIxPe.z2FjOlb/s3Zywo7q.ia21sOHWwnk4Eu','SAKAMESSO','germain','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(3,'yfo1','$2y$10$T8JG3fTJexfvYP1T8KP.su5xKNy5VbRDWqgsWQ0W2n2b5KSqaTxXu','FOFANA','yacouba','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(4,'aro1','$2y$10$C2iuG2Rz3t.0sYCKc3cwe.oq2Entb1M1q4VJ9f6ItrAPaV3iqcK9y','ROCHDI','abdellah','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(5,'ara1','$2y$10$Nltvrw9ZD9nmFOoHFvA3n.q8yX71foNOCnXcNNUNd76zAvIDcc9SK','RAMI','abderrahman','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(6,'rsi1','$2y$10$0P3UM6Y0TR7J/b2E3vgFjebT8Lg4dOdPPlzqfPazH733H1gNeBnT6','SIMON','régis','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(7,'aab1','$2y$10$oviCfWr95jR7UWbZAkQec.l6EpRLlzbtJdONmbUFjloQZT9vDyG/O','ABDALDJABAR BELAL','abdalkher','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(8,'aso1','$2y$10$MKaTQ1UYw8SW4L6gYwHKdeGVJFiKne4J2S3p69KoeiBkC9eu6rubi','SOUMAH','abdel','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(9,'pbo1','$2y$10$17OwohNiAHHklqopDbuOY.I4j76HEXl0rJ1GeiaBXU7nKvBorRVnq','BOIS','phillipe','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(10,'lik1','$2y$10$gOl0PbGiMl9BPeTYak3.xOTnxIpZe4RWpV2Rgr6CkjVGLGVlPyw5q','IKOUMZANE','lahoucine','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(11,'gnd1','$2y$10$8IhGEJaBaGN0/u2xHKtpx.8f9h7kQd1KrzTYIPQzRF.OFwQU/RT1.','NDOKOBANDA','gervais','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(12,'tsz1','$2y$10$cFOq7C.8VuvBPho8VF6UgOdIMg7elcmGv1T1nOwnrQSOuavyry./O','SZAMVEBER','thibault','user',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(13,'dpo1','$2y$10$a5OdkC/xyhDftEL/dkxG7uWpN37QFXpIC/Lias9kmkWgZpF8v87k.','POULIN','david','admin',0,0,'2023-01-01',NULL,'2025-04-30 16:52:11','2025-05-20 16:52:21'),(14,'hsa1','$2y$10$8rjSq4CX5sZk70o8PzSmCeOT1huUyoPZ1b.XlJVDN4L7iz9FTqf6C','SASULISA','hervé','user',0,0,'2025-01-27',NULL,'2025-04-30 16:53:09','2025-05-20 16:52:21'),(15,'mca1','$2y$10$EwZJv4qKdgWNDiHMUoj2C.i4N6fspVfqV76bGi4OniQiB0jSrZEKm','CAMARA','mamoudou','user',0,0,'2023-01-01',NULL,'2025-04-30 16:53:09','2025-05-20 16:52:21'),(16,'ple1','$2y$10$2rogaQcTXevdxGX9LMSBLuKxq/bgu6j/mQN9FaMdD08wmDGCCxFDa','LE PAPE','patrick','admin',0,0,'2023-01-01',NULL,'2025-04-30 16:53:09','2025-05-20 16:52:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vue_engagements_synthese`
--

DROP TABLE IF EXISTS `vue_engagements_synthese`;
/*!50001 DROP VIEW IF EXISTS `vue_engagements_synthese`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vue_engagements_synthese` AS SELECT
 1 AS `semaine_engagee`,
  1 AS `reference`,
  1 AS `coefficient`,
  1 AS `couleur`,
  1 AS `engagement`,
  1 AS `produit`,
  1 AS `reporté` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vue_prod_planning`
--

DROP TABLE IF EXISTS `vue_prod_planning`;
/*!50001 DROP VIEW IF EXISTS `vue_prod_planning`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vue_prod_planning` AS SELECT
 1 AS `id`,
  1 AS `reference`,
  1 AS `reference_couleur`,
  1 AS `type`,
  1 AS `numero`,
  1 AS `semaine`,
  1 AS `semaine_engagement`,
  1 AS `prete`,
  1 AS `status` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vue_qualite_defauts`
--

DROP TABLE IF EXISTS `vue_qualite_defauts`;
/*!50001 DROP VIEW IF EXISTS `vue_qualite_defauts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vue_qualite_defauts` AS SELECT
 1 AS `controle_id`,
  1 AS `date_controle`,
  1 AS `gravite` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'gestprod_v2'
--

--
-- Final view structure for view `vue_engagements_synthese`
--

/*!50001 DROP VIEW IF EXISTS `vue_engagements_synthese`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_engagements_synthese` AS select `pe`.`semaine_engagee` AS `semaine_engagee`,`pa`.`reference` AS `reference`,`pa`.`coefficient` AS `coefficient`,`pa`.`couleur` AS `couleur`,count(`pe`.`id`) AS `engagement`,sum(case when `pe`.`status` = 'fait' then 1 else 0 end) AS `produit`,sum(case when `pe`.`status` = 'reporte' then 1 else 0 end) AS `reporté` from ((`prod_engagement` `pe` join `prod_planning` `pp` on(`pe`.`fk_planning` = `pp`.`id`)) join `prod_articles` `pa` on(`pp`.`fk_article` = `pa`.`id`)) group by `pa`.`reference`,`pe`.`semaine_engagee` order by `pa`.`reference` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vue_prod_planning`
--

/*!50001 DROP VIEW IF EXISTS `vue_prod_planning`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_prod_planning` AS select `pp`.`id` AS `id`,`pa`.`reference` AS `reference`,`pa`.`couleur` AS `reference_couleur`,`ptse`.`designation` AS `type`,`pp`.`numero` AS `numero`,`pp`.`semaine` AS `semaine`,`pe`.`semaine_engagee` AS `semaine_engagement`,`pp`.`prete` AS `prete`,case when `pe`.`status` = 'fait' then 'Fait' when `pe`.`status` = 'en cours' then 'En cours' when `pe`.`status` = 'annulé' then 'Annulé' when `pe`.`status` = 'reporté' then 'Reporté' when `pe`.`status` = 'engagé' then 'Engagé' when `pe`.`status` = 'prévisionnel' then 'Prévisionnel' else 'Prévisionnel' end AS `status` from (((`prod_planning` `pp` join `prod_articles` `pa` on(`pp`.`fk_article` = `pa`.`id`)) join `prod_type_sous_ensemble` `ptse` on(`pp`.`fk_type_sous_ensemble` = `ptse`.`id`)) left join (select `pe1`.`id` AS `id`,`pe1`.`fk_planning` AS `fk_planning`,`pe1`.`semaine_engagee` AS `semaine_engagee`,`pe1`.`status` AS `status`,`pe1`.`commentaire` AS `commentaire`,`pe1`.`modified_at` AS `modified_at` from (`prod_engagement` `pe1` join (select `prod_engagement`.`fk_planning` AS `fk_planning`,max(`prod_engagement`.`modified_at`) AS `max_created` from `prod_engagement` group by `prod_engagement`.`fk_planning`) `latest` on(`pe1`.`fk_planning` = `latest`.`fk_planning` and `pe1`.`modified_at` = `latest`.`max_created`))) `pe` on(`pe`.`fk_planning` = `pp`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vue_qualite_defauts`
--

/*!50001 DROP VIEW IF EXISTS `vue_qualite_defauts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_qualite_defauts` AS select `qc`.`id` AS `controle_id`,`qc`.`date_controle` AS `date_controle`,(select `qgd`.`libelle` from ((`qualite_defauts` `qd` join `qualite_catalogue_defauts` `qcd` on(`qd`.`fk_catalogue_defaut` = `qcd`.`id`)) join `qualite_gravite_defaut` `qgd` on(`qcd`.`fk_gravite` = `qgd`.`id`)) where `qd`.`fk_controle` = `qc`.`id` order by `qgd`.`poids` desc limit 1) AS `gravite` from `qualite_controles` `qc` order by `qc`.`id` */;
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

-- Dump completed on 2025-05-21  6:24:22
