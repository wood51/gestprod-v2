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
-- Table structure for table `prod_engagements`
--

DROP TABLE IF EXISTS `prod_engagements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_engagements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_planning` int(11) DEFAULT NULL,
  `semaine_engagee` varchar(10) DEFAULT NULL,
  `status` enum('prévu','reporté','fait','annulé','retour client') DEFAULT 'prévu',
  `commentaire` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_engagements`
--

LOCK TABLES `prod_engagements` WRITE;
/*!40000 ALTER TABLE `prod_engagements` DISABLE KEYS */;
INSERT INTO `prod_engagements` VALUES (1,63,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(2,64,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(3,65,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(4,66,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(5,67,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(6,68,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(7,69,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(8,70,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(9,71,'2024-45','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(10,72,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(11,73,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(12,74,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(13,75,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(14,76,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(15,77,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(16,78,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(17,79,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(18,80,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(19,81,'2024-46','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(20,82,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(21,83,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(22,84,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(23,85,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(24,86,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(25,87,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(26,88,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(27,89,'2024-47','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(28,90,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(29,91,'2024-48','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(30,91,'2024-49','fait','Import : réalisé après report','2025-05-01 10:00:54'),(31,92,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(32,93,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(33,94,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(34,95,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(35,96,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(36,97,'2024-49','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(37,97,'2024-50','fait','Import : réalisé après report','2025-05-01 10:00:54'),(38,98,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(39,99,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(40,100,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(41,101,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(42,102,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(43,103,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(44,104,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(45,105,'2024-50','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(46,106,'2024-48','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(47,107,'2024-50','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(48,108,'2024-50','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(49,109,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(50,110,'2024-50','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(51,110,'2024-51','fait','Import : réalisé après report','2025-05-01 10:00:54'),(52,111,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(53,112,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(54,113,'2024-49','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(55,114,'2024-50','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(56,115,'2024-50','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(57,116,'2024-51','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(58,116,'2025-03','fait','Import : réalisé après report','2025-05-01 10:00:54'),(59,117,'2024-51','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(60,117,'2025-03','fait','Import : réalisé après report','2025-05-01 10:00:54'),(61,118,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(62,119,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(63,120,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(64,121,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(65,122,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(66,123,'2025-02','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(67,124,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(68,125,'2024-51','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(69,126,'2025-02','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(70,126,'2025-05','fait','Import : réalisé après report','2025-05-01 10:00:54'),(71,127,'2025-02','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(72,127,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(73,128,'2025-02','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(74,128,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(75,129,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(76,129,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(77,130,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(78,130,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(79,131,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(80,131,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(81,132,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(82,132,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(83,133,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(84,134,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(85,134,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(86,135,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(87,135,'2025-06','fait','Import : réalisé après report','2025-05-01 10:00:54'),(88,136,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(89,136,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(90,137,'2025-03','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(91,137,'2025-04','fait','Import : réalisé après report','2025-05-01 10:00:54'),(92,138,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(93,139,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(94,140,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(95,141,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(96,142,'2025-04','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(97,142,'2025-10','fait','Import : réalisé après report','2025-05-01 10:00:54'),(98,143,'2025-04','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(99,143,'2025-05','fait','Import : réalisé après report','2025-05-01 10:00:54'),(100,144,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(101,145,'2025-04','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(102,145,'2025-05','fait','Import : réalisé après report','2025-05-01 10:00:54'),(103,146,'2025-04','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(104,146,'2025-05','fait','Import : réalisé après report','2025-05-01 10:00:54'),(109,151,'2025-05','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(110,151,'2025-10','fait','Import : réalisé après report','2025-05-01 10:00:54'),(111,152,'2025-05','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(112,152,'2025-06','fait','Import : réalisé après report','2025-05-01 10:00:54'),(113,153,'2025-05','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(114,153,'2025-06','fait','Import : réalisé après report','2025-05-01 10:00:54'),(115,154,'2025-05','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(116,154,'2025-06','fait','Import : réalisé après report','2025-05-01 10:00:54'),(117,155,'2025-05','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(118,155,'2025-06','fait','Import : réalisé après report','2025-05-01 10:00:54'),(119,156,'2025-02','prévu','Import : prévu sans numéro','2025-05-01 10:00:54'),(120,157,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(121,158,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(122,159,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(123,160,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(124,161,'2025-03','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(125,162,'2025-06','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(126,162,'2025-07','fait','Import : réalisé après report','2025-05-01 10:00:54'),(127,163,'2025-06','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(128,163,'2025-07','fait','Import : réalisé après report','2025-05-01 10:00:54'),(129,164,'2025-06','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(130,164,'2025-07','fait','Import : réalisé après report','2025-05-01 10:00:54'),(131,165,'2025-06','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(132,165,'2025-07','fait','Import : réalisé après report','2025-05-01 10:00:54'),(133,169,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(134,170,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(135,175,'2025-04','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(136,175,'2025-05','fait','Import : réalisé après report','2025-05-01 10:00:54'),(137,176,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(138,177,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(139,181,'2025-04','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(140,182,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(141,183,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(142,184,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(143,185,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(144,186,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(145,187,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(146,188,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(147,189,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(148,190,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(149,191,'2025-05','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(150,192,'2025-06','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(151,193,'2025-06','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(152,194,'2025-06','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(153,195,'2025-06','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(154,196,'2025-06','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(155,197,'2025-06','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(156,200,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(157,201,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(158,202,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(159,203,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(160,204,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(161,205,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(162,206,'2025-06','fait','Import : réalisé normalement + donnée engagement  non fiable oublie du no semaine engagement','2025-05-01 10:00:54'),(163,207,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(164,208,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(165,209,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(166,210,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(167,211,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(168,212,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(169,213,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(170,214,'2025-07','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(171,215,'2025-07','reporté','Import : initialement prévu','2025-05-01 10:00:54'),(172,215,'2025-08','fait','Import : réalisé après report','2025-05-01 10:00:54'),(173,216,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(174,217,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(175,218,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(176,219,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(177,220,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(178,221,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:54'),(179,222,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(180,223,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(181,224,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(182,225,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(183,226,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(184,227,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(185,228,'2025-08','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(186,229,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(187,230,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(188,231,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(189,232,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(190,233,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(191,234,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(192,235,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(193,236,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(194,237,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(195,238,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(196,239,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(197,241,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(198,242,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(199,243,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(200,244,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(201,245,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(202,246,'2025-09','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(203,247,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(204,248,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(205,249,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(206,250,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(207,251,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(208,252,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(209,253,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(210,254,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(211,256,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(212,257,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(213,258,'2025-10','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(214,259,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(215,260,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(216,261,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(217,262,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(218,263,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(219,264,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(220,265,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(221,266,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(222,267,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(223,268,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(224,269,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(225,270,'2025-11','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(226,271,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(227,272,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(228,273,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(229,274,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(230,275,'2025-12','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(231,275,'2025-13','fait','Import : réalisé après report','2025-05-01 10:00:55'),(232,276,'2025-12','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(233,276,'2025-13','fait','Import : réalisé après report','2025-05-01 10:00:55'),(234,277,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(235,278,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(236,279,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(237,280,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(238,281,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(239,282,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(240,283,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(241,284,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(242,285,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(243,286,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(244,287,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(245,288,'2025-12','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(246,290,'2025-13','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(247,290,'2025-14','fait','Import : réalisé après report','2025-05-01 10:00:55'),(248,291,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(249,292,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(250,293,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(251,294,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(252,295,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(253,296,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(254,297,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(255,298,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(256,299,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(257,300,'2025-13','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(258,301,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(259,302,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(260,303,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(261,304,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(262,305,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(263,307,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(264,309,'2025-14','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(265,309,'2025-15','fait','Import : réalisé après report','2025-05-01 10:00:55'),(266,310,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(267,311,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(268,312,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(269,313,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(270,314,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(271,315,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(272,316,'2025-15','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(273,316,'2025-16','fait','Import : réalisé après report','2025-05-01 10:00:55'),(274,317,'2025-15','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(275,317,'2025-16','fait','Import : réalisé après report','2025-05-01 10:00:55'),(276,318,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(277,319,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(278,320,'2025-15','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(279,320,'2025-16','fait','Import : réalisé après report','2025-05-01 10:00:55'),(280,321,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(281,322,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(282,323,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(283,324,'2025-14','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(284,325,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(285,326,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(286,327,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(287,328,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(288,330,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(289,331,'2025-15','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(290,332,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(291,333,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(292,334,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(293,335,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(294,336,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(295,337,'2025-16','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(296,337,'2025-17','fait','Import : réalisé après report','2025-05-01 10:00:55'),(297,338,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(298,339,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(299,340,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(300,341,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(301,342,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(302,343,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(303,344,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(304,345,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(305,346,'2025-17','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(306,346,'2025-18','fait','Import : réalisé après report','2025-05-01 10:00:55'),(307,347,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(308,348,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(309,349,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(310,350,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(311,351,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(312,352,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(313,353,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(314,354,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(315,355,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(316,356,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(317,357,'2025-17','reporté','Import : initialement prévu','2025-05-01 10:00:55'),(318,357,'2025-18','fait','Import : réalisé après report','2025-05-01 10:00:55'),(319,358,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(320,359,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(321,360,'2025-16','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(322,361,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(323,362,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(324,363,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(325,364,'2025-17','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(326,365,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(327,366,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(328,367,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(329,368,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(330,369,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(331,370,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(332,371,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(333,372,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(334,373,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(335,374,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(336,375,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55'),(337,376,'2025-18','fait','Import : réalisé normalement','2025-05-01 10:00:55');
/*!40000 ALTER TABLE `prod_engagements` ENABLE KEYS */;
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
  `fk_etat` int(11) NOT NULL,
  `semaine` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
  `engagement` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
  `commentaire` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
  `prete` tinyint(1) NOT NULL DEFAULT 0,
  `livree` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prod_planning_unique` (`fk_article`,`numero`),
  KEY `prod_planning_prod_type_sous_ensemble_FK` (`fk_type_sous_ensemble`),
  CONSTRAINT `prod_planning_prod_articles_FK` FOREIGN KEY (`fk_article`) REFERENCES `prod_articles` (`id`),
  CONSTRAINT `prod_planning_prod_type_sous_ensemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `prod_type_sous_ensemble` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_planning`
--

LOCK TABLES `prod_planning` WRITE;
/*!40000 ALTER TABLE `prod_planning` DISABLE KEYS */;
INSERT INTO `prod_planning` VALUES (63,9,6,951,7,'2024-45','2024-45',NULL,1,1),(64,9,6,952,7,'2024-45','2024-45',NULL,1,1),(65,9,6,953,7,'2024-45','2024-45',NULL,1,1),(66,9,6,954,7,'2024-45','2024-45',NULL,1,1),(67,11,6,566,7,'2024-45','2024-45',NULL,1,1),(68,11,6,567,7,'2024-45','2024-45',NULL,1,1),(69,11,6,568,7,'2024-45','2024-45',NULL,1,1),(70,7,6,43,7,'2024-45','2024-45',NULL,1,1),(71,2,6,1435,7,'2024-45','2024-45',NULL,1,1),(72,11,6,569,7,'2024-46','2024-46',NULL,1,1),(73,9,6,955,7,'2024-46','2024-46',NULL,1,1),(74,9,6,956,7,'2024-46','2024-46',NULL,1,1),(75,11,6,570,7,'2024-46','2024-46',NULL,1,1),(76,11,6,571,7,'2024-46','2024-46',NULL,1,1),(77,10,6,890,7,'2024-46','2024-46',NULL,1,1),(78,6,6,1794,7,'2024-46','2024-46',NULL,1,1),(79,9,6,957,7,'2024-46','2024-46',NULL,1,1),(80,2,6,1436,7,'2024-46','2024-46',NULL,1,1),(81,2,6,1437,7,'2024-46','2024-46',NULL,1,1),(82,2,6,1438,7,'2024-47','2024-47',NULL,1,1),(83,11,6,572,7,'2024-47','2024-47',NULL,1,1),(84,11,6,573,7,'2024-47','2024-47',NULL,1,1),(85,11,6,574,7,'2024-47','2024-47',NULL,1,1),(86,11,6,575,7,'2024-47','2024-47',NULL,1,1),(87,11,6,576,7,'2024-47','2024-47',NULL,1,1),(88,11,6,577,7,'2024-47','2024-47',NULL,1,1),(89,7,6,44,7,'2024-47','2024-47',NULL,1,1),(90,2,6,1439,7,'2024-48','2024-48',NULL,1,1),(91,2,6,1441,7,'2024-48','2024-49',NULL,1,1),(92,11,6,578,7,'2024-48','2024-48',NULL,1,1),(93,9,6,959,7,'2024-49','2024-48',NULL,1,1),(94,9,6,960,7,'2024-49','2024-48',NULL,1,1),(95,9,6,961,7,'2024-49','2024-48',NULL,1,1),(96,9,6,962,7,'2024-49','2024-48',NULL,1,1),(97,10,6,891,7,'2024-49','2024-50',NULL,1,1),(98,2,6,1440,7,'2024-49','2024-49',NULL,1,1),(99,11,6,579,7,'2024-49','2024-48',NULL,1,1),(100,11,6,580,7,'2024-49','2024-48',NULL,1,1),(101,9,6,963,7,'2024-50','2024-48',NULL,1,1),(102,9,6,964,7,'2024-50','2024-49',NULL,1,1),(103,9,6,965,7,'2024-50','2024-49',NULL,1,1),(104,9,6,966,7,'2024-50','2024-49',NULL,1,1),(105,10,6,892,7,'2024-50','2024-50',NULL,1,1),(106,7,6,45,7,'2024-50','2024-48',NULL,1,1),(107,7,6,46,7,'2024-50','2024-50',NULL,1,1),(108,2,6,1442,7,'2024-50','2024-50',NULL,1,1),(109,11,6,581,7,'2024-50','2024-49',NULL,1,1),(110,11,6,582,7,'2024-50','2024-51',NULL,1,1),(111,9,6,967,7,'2024-51','2024-49',NULL,1,1),(112,9,6,968,7,'2024-51','2024-49',NULL,1,1),(113,9,6,969,7,'2024-51','2024-49',NULL,1,1),(114,9,6,970,7,'2024-51','2024-50','Bobinage DEE',1,1),(115,2,6,1443,7,'2024-51','2024-50',NULL,1,1),(116,11,6,583,7,'2024-51','2025-03',NULL,1,1),(117,11,6,584,7,'2024-51','2025-03',NULL,1,1),(118,2,6,1444,7,'2025-01','2024-51',NULL,1,1),(119,9,6,971,7,'2025-02','2024-51',NULL,1,1),(120,9,6,972,7,'2025-02','2024-51',NULL,1,1),(121,9,6,973,7,'2025-02','2024-51',NULL,1,1),(122,9,6,974,7,'2025-02','2024-51',NULL,1,1),(123,10,6,893,7,'2025-02','2025-02',NULL,1,1),(124,2,6,1445,7,'2025-02','2024-51',NULL,1,1),(125,7,6,47,7,'2025-02','2024-51',NULL,1,1),(126,7,6,48,1,'2025-02','2025-05',NULL,1,NULL),(127,11,6,585,2,'2025-02','2025-04',NULL,1,NULL),(128,11,6,586,2,'2025-02','2025-04',NULL,1,NULL),(129,9,6,988,2,'2025-03','2025-04',NULL,1,NULL),(130,9,6,989,2,'2025-03','2025-04',NULL,1,NULL),(131,9,6,990,1,'2025-03','2025-04',NULL,1,NULL),(132,9,6,991,1,'2025-03','2025-04',NULL,1,NULL),(133,10,6,894,7,'2025-03','2025-03',NULL,1,1),(134,10,6,895,2,'2025-03','2025-04',NULL,1,NULL),(135,2,6,1446,1,'2025-03','2025-06',NULL,1,NULL),(136,11,6,587,2,'2025-03','2025-04',NULL,1,NULL),(137,11,6,588,2,'2025-03','2025-04',NULL,1,NULL),(138,9,6,979,7,'2025-04','2025-03',NULL,1,1),(139,9,6,980,7,'2025-04','2025-03',NULL,1,1),(140,9,6,981,7,'2025-04','2025-03',NULL,1,1),(141,9,6,982,7,'2025-04','2025-03',NULL,1,1),(142,2,6,1447,1,'2025-04','2025-10',NULL,1,NULL),(143,11,6,589,1,'2025-04','2025-05',NULL,1,NULL),(144,10,6,896,2,'2025-04','2025-04',NULL,1,NULL),(145,11,6,590,1,'2025-04','2025-05',NULL,1,NULL),(146,10,6,897,1,'2025-04','2025-05',NULL,1,NULL),(151,2,6,1148,1,'2025-05','2025-10',NULL,1,NULL),(152,11,6,591,1,'2025-05','2025-06',NULL,1,NULL),(153,11,6,592,1,'2025-05','2025-06',NULL,1,NULL),(154,10,6,898,1,'2025-05','2025-06',NULL,1,NULL),(155,10,6,899,1,'2025-05','2025-06',NULL,1,NULL),(156,6,6,1793,7,'2025-06','2025-02',NULL,1,1),(157,13,6,4,1,'2025-06','2025-04',NULL,1,NULL),(158,9,6,983,7,'2025-06','2025-03',NULL,1,1),(159,9,6,984,7,'2025-06','2025-03',NULL,1,1),(160,9,6,985,7,'2025-06','2025-03',NULL,1,1),(161,9,6,986,7,'2025-06','2025-03',NULL,1,1),(162,11,6,593,1,'2025-06','2025-07',NULL,1,NULL),(163,10,6,900,7,'2025-06','2025-07',NULL,1,NULL),(164,10,6,901,7,'2025-06','2025-07',NULL,1,NULL),(165,11,6,594,1,'2025-06','2025-07',NULL,1,NULL),(169,9,6,987,2,'2025-07','2025-04','rajouter car manque planning',1,NULL),(170,9,6,958,2,'2025-07','2025-04','rajouter car manque planning',1,NULL),(175,1,6,123,7,'2025-04','2025-05','Ajouter car pas dans le planning',1,NULL),(176,14,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL),(177,14,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL),(181,15,7,NULL,3,'2025-04','2025-04','ajouter pour test',1,NULL),(182,9,6,992,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(183,9,6,993,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(184,9,6,994,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(185,9,6,995,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(186,9,6,996,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(187,9,6,997,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(188,13,6,5,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(189,13,6,6,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(190,13,6,7,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(191,13,6,8,1,'2025-05','2025-05','Ajout car pas de planning',1,NULL),(192,9,6,998,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(193,9,6,999,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(194,9,6,1000,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(195,9,6,1001,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(196,9,6,1002,1,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(197,8,6,362,1,'2025-06','2025-06','Ajpouter pas de planning',1,NULL),(200,18,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(201,18,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(202,18,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(203,16,7,NULL,2,'2025-06','2025-06','2025-06	2025-06	Ajouter pas de planning',1,NULL),(204,16,7,NULL,2,'2025-06','2025-06','2025-06	2025-06	Ajouter pas de planning',1,NULL),(205,16,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(206,16,7,NULL,2,'2025-06','2025-06','Ajouter pas de planning',1,NULL),(207,9,6,1003,7,'2025-07','2025-07','ajout pas planning',1,NULL),(208,9,6,1004,7,'2025-07','2025-07','ajout pas planning',1,NULL),(209,9,6,1005,7,'2025-07','2025-07','ajout pas planning',1,NULL),(210,9,6,1006,7,'2025-07','2025-07','ajout pas planning',1,NULL),(211,9,6,1007,7,'2025-07','2025-07','ajout pas planning',1,NULL),(212,10,6,902,7,'2025-07','2025-07','ajout planning',1,NULL),(213,10,6,903,7,'2025-07','2025-07','ajout planning',1,NULL),(214,13,6,9,7,'2025-07','2025-07','ajout planning',1,NULL),(215,1,1,124,7,'2025-07','2025-08','ajouter planning',1,NULL),(216,1,6,125,7,'2025-08','2025-08','ajout planing',1,NULL),(217,1,6,126,7,'2025-08','2025-08','ajout planing',1,NULL),(218,1,6,127,7,'2025-08','2025-08','ajout planing',1,NULL),(219,1,6,128,7,'2025-08','2025-08','ajout planing',1,NULL),(220,5,6,155,7,'2025-08','2025-08','ajout planning',1,NULL),(221,9,6,1008,7,'2025-08','2025-08','ajout planning',1,NULL),(222,11,6,595,7,'2025-08','2025-08','ajout planning',1,NULL),(223,11,6,596,7,'2025-08','2025-08','ajout planning',1,NULL),(224,11,6,597,7,'2025-08','2025-08','ajout planning',1,NULL),(225,11,6,598,7,'2025-08','2025-08','ajout planning',1,NULL),(226,11,6,599,7,'2025-08','2025-08','ajout planning',1,NULL),(227,11,6,600,7,'2025-08','2025-08','ajout planning',1,NULL),(228,11,6,601,7,'2025-08','2025-08','ajout planning',1,NULL),(229,1,6,129,8,'2025-09','2025-09','ajout planning',1,NULL),(230,8,6,363,8,'2025-09','2025-09','ajout planning',1,NULL),(231,9,6,1009,8,'2025-09','2025-09','ajout planning',1,NULL),(232,10,6,904,8,'2025-09','2025-09','ajout planning',1,NULL),(233,11,6,602,8,'2025-09','2025-09','ajout planning',1,NULL),(234,11,6,603,8,'2025-09','2025-09','ajout planning',1,NULL),(235,11,6,604,8,'2025-09','2025-09','ajout planning',1,NULL),(236,11,6,605,8,'2025-09','2025-09','ajout planning',1,NULL),(237,11,6,606,8,'2025-09','2025-09','ajout planning',1,NULL),(238,11,6,607,8,'2025-09','2025-09','ajout planning',1,NULL),(239,11,6,608,8,'2025-09','2025-09','ajout planning',1,NULL),(241,14,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL),(242,14,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL),(243,14,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL),(244,16,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL),(245,16,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL),(246,17,7,NULL,8,'2025-09','2025-09','ajout planning',1,NULL),(247,11,6,609,1,'2025-10','2025-10','ajout planning',1,NULL),(248,11,6,610,1,'2025-10','2025-10','ajout planning',1,NULL),(249,11,6,611,1,'2025-10','2025-10','ajout planning',1,NULL),(250,11,6,612,1,'2025-10','2025-10','ajout planning',1,NULL),(251,10,6,905,1,'2025-10','2025-10','ajout planning',1,NULL),(252,5,6,156,1,'2025-10','2025-10','ajout planning',1,NULL),(253,9,6,1010,1,'2025-10','2025-10','ajout planning',1,NULL),(254,18,7,NULL,8,'2025-10','2025-10','ajout planning',1,NULL),(256,16,7,NULL,8,'2025-10','2025-10','ajout planning',1,NULL),(257,17,7,NULL,8,'2025-10','2025-10','ajout planning',1,NULL),(258,14,7,NULL,1,'2025-10','2025-10','ajout planning',1,NULL),(259,1,6,130,8,'2025-11','2025-11','ajout planning',1,NULL),(260,1,6,131,8,'2025-11','2025-11','ajout planning',1,NULL),(261,1,6,132,8,'2025-11','2025-11','ajout planning',1,NULL),(262,1,6,133,8,'2025-11','2025-11','ajout planning',1,NULL),(263,10,6,906,8,'2025-11','2025-11','ajout planning',1,NULL),(264,10,6,907,8,'2025-11','2025-11','ajout planning',1,NULL),(265,11,6,613,8,'2025-11','2025-11','ajout planning',1,NULL),(266,11,6,614,8,'2025-11','2025-11','ajout planning',1,NULL),(267,11,6,615,8,'2025-11','2025-11','ajout planning +default',1,NULL),(268,11,6,616,8,'2025-11','2025-11','ajout planning',1,NULL),(269,11,6,617,8,'2025-11','2025-11','ajout planning',1,NULL),(270,11,6,618,8,'2025-11','2025-11','ajout planning',1,NULL),(271,1,6,134,1,'2025-12','2025-12','ajout planning',1,NULL),(272,1,6,135,1,'2025-12','2025-12','ajout planning',1,NULL),(273,1,6,136,1,'2025-12','2025-12','ajout planning',1,NULL),(274,1,6,137,1,'2025-12','2025-12','ajout planning',1,NULL),(275,1,6,139,1,'2025-12','2025-13','ajout planning',1,NULL),(276,10,6,909,1,'2025-12','2025-13','ajout planning',1,NULL),(277,11,6,619,2,'2025-12','2025-12','ajout planning',1,NULL),(278,11,6,620,2,'2025-12','2025-12','ajout planning',1,NULL),(279,11,6,621,2,'2025-12','2025-12','ajout planning',1,NULL),(280,11,6,622,2,'2025-12','2025-12','ajout planning',1,NULL),(281,11,6,623,1,'2025-12','2025-12','ajout planning',1,NULL),(282,11,6,624,1,'2025-12','2025-12','ajout planning',1,NULL),(283,14,7,NULL,3,'2025-12','2025-12','ajout planning',1,NULL),(284,14,7,NULL,3,'2025-12','2025-12','ajout planning',1,NULL),(285,9,6,1011,1,'2025-12','2025-12','ajout planning',1,NULL),(286,9,6,1012,1,'2025-12','2025-12','ajout planning',1,NULL),(287,9,6,1013,1,'2025-12','2025-12','ajout planning',1,NULL),(288,9,6,1014,1,'2025-12','2025-12','ajout planning',1,NULL),(290,5,6,157,7,'2025-13','2025-14','ajout planning',1,NULL),(291,8,6,364,1,'2025-13','2025-13','ajout planning',1,NULL),(292,11,6,626,1,'2025-13','2025-13','ajout planning',1,NULL),(293,11,6,627,1,'2025-13','2025-13','ajout planning',1,NULL),(294,11,6,628,1,'2025-13','2025-13','ajout planning',1,NULL),(295,11,6,629,1,'2025-13','2025-13','ajout planning',1,NULL),(296,11,6,630,1,'2025-13','2025-13','ajout planning',1,NULL),(297,9,6,1015,3,'2025-13','2025-13','ajout planning',1,NULL),(298,9,6,1016,3,'2025-13','2025-13','ajout planning',1,NULL),(299,9,6,1017,1,'2025-13','2025-13','ajout planning',1,NULL),(300,9,6,1018,1,'2025-13','2025-13','ajout planning',1,NULL),(301,1,6,140,7,'2025-14','2025-14','ajout planning',1,NULL),(302,1,6,141,7,'2025-14','2025-14','ajout planning',1,NULL),(303,1,6,142,7,'2025-14','2025-14','ajout planning',1,NULL),(304,1,6,143,7,'2025-14','2025-14','ajout planning',1,NULL),(305,1,6,144,7,'2025-14','2025-14','ajout planning',1,NULL),(307,5,6,158,7,'2025-14','2025-14','ajout planning',1,NULL),(309,8,6,365,8,'2025-14','2025-15','ajout planning',1,NULL),(310,10,6,910,7,'2025-14','2025-14','ajout planning',1,NULL),(311,11,6,631,7,'2025-14','2025-14','ajout planning',1,NULL),(312,11,6,632,7,'2025-14','2025-14','ajout planning',1,NULL),(313,11,6,633,7,'2025-14','2025-14','ajout planning',1,NULL),(314,11,6,634,7,'2025-14','2025-14','ajout planning',1,NULL),(315,6,6,1795,7,'2025-14','2025-14','ajout planning stator recharger',1,NULL),(316,8,6,366,1,'2025-15','2025-16','ajout planning',1,NULL),(317,6,6,1796,1,'2025-15','2025-16','ajout planning',1,NULL),(318,11,6,635,8,'2025-15','2025-15','ajout planning',1,NULL),(319,11,6,636,8,'2025-15','2025-15','ajout planning',1,NULL),(320,11,6,637,1,'2025-15','2025-16','ajout planning',1,NULL),(321,5,6,159,8,'2025-15','2025-15','ajout planning',1,NULL),(322,17,7,NULL,7,'2025-14','2025-14','ajout planning',1,NULL),(323,17,7,NULL,7,'2025-14','2025-14','ajout planning',1,NULL),(324,16,7,NULL,7,'2025-14','2025-14','ajout planning',1,NULL),(325,16,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL),(326,16,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL),(327,16,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL),(328,17,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL),(330,17,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL),(331,19,7,NULL,8,'2025-15','2025-15','ajout planning',1,NULL),(332,8,6,367,1,'2025-16','2025-16','ajout planning',1,NULL),(333,11,6,638,1,'2025-16','2025-16','ajout planning',1,NULL),(334,11,6,639,1,'2025-16','2025-16','ajout planning',1,NULL),(335,11,6,640,1,'2025-16','2025-16','ajout planning',1,NULL),(336,7,6,49,1,'2025-16','2025-16','ajout planning',1,NULL),(337,7,6,50,1,'2025-16','2025-17','ajout planning',1,NULL),(338,9,6,1019,1,'2025-16','2025-16','ajout planning',1,NULL),(339,9,6,1020,1,'2025-16','2025-16','ajout planning',1,NULL),(340,9,6,1021,1,'2025-16','2025-16','ajout planning',1,NULL),(341,9,6,1022,1,'2025-16','2025-16','ajout planning',1,NULL),(342,1,6,145,1,'2025-16','2025-16','ajout planning',1,NULL),(343,1,6,146,1,'2025-16','2025-16','ajout planning',1,NULL),(344,1,6,147,1,'2025-16','2025-16','ajout planning',1,NULL),(345,1,6,148,1,'2025-16','2025-16','ajout planning',1,NULL),(346,7,6,51,1,'2025-17','2025-18','ajout planning',1,NULL),(347,9,6,1023,1,'2025-17','2025-17','ajout planning',1,NULL),(348,9,6,1024,1,'2025-17','2025-17','ajout planning',1,NULL),(349,9,6,1025,1,'2025-17','2025-17','ajout planning',1,NULL),(350,9,6,1026,1,'2025-17','2025-17','ajout planning',1,NULL),(351,11,6,641,1,'2025-17','2025-17','ajout planning',1,NULL),(352,11,6,642,1,'2025-17','2025-17','ajout planning',1,NULL),(353,6,6,1797,1,'2025-17','2025-17','ajout planning',1,NULL),(354,8,6,368,1,'2025-17','2025-17','ajout planning',1,NULL),(355,1,6,149,1,'2025-17','2025-17','ajout planning',1,NULL),(356,1,6,150,1,'2025-17','2025-17','ajout planning',1,NULL),(357,1,6,151,1,'2025-17','2025-18','ajout planning',1,NULL),(358,11,6,643,1,'2025-17','2025-17','ajout planning',1,NULL),(359,18,7,NULL,4,'2025-16','2025-16','ajout planning',1,NULL),(360,19,7,NULL,4,'2025-16','2025-16','ajout planning',1,NULL),(361,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL),(362,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL),(363,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL),(364,18,7,NULL,1,'2025-17','2025-17','ajout planning',1,NULL),(365,1,6,152,1,'2025-18','2025-18','ajout planning',1,NULL),(366,1,6,153,1,'2025-18','2025-18','ajout planning',1,NULL),(367,1,6,154,1,'2025-18','2025-18','ajout planning',1,NULL),(368,6,6,1798,1,'2025-18','2025-18','ajout planning',1,NULL),(369,9,6,1027,1,'2025-18','2025-18','ajout planning',1,NULL),(370,9,6,1028,1,'2025-18','2025-18','ajout planning',1,NULL),(371,9,6,1029,1,'2025-18','2025-18','ajout planning',1,NULL),(372,9,6,1030,1,'2025-18','2025-18','ajout planning',1,NULL),(373,11,6,644,1,'2025-18','2025-18','ajout planning',1,NULL),(374,11,6,645,1,'2025-18','2025-18','ajout planning',1,NULL),(375,11,6,646,1,'2025-18','2025-18','ajout planning',1,NULL),(376,1,6,155,1,'2025-18','2025-18','ajout planning',1,NULL);
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
INSERT INTO `users` VALUES (1,'jta1','$2y$10$9SVjx0LJeD9exiriwITU/e65QgK53FxuNc5g1yjYZ6EFl8RoE/ScW','TANKOY','justin','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:10:52'),(2,'gsa1','$2y$10$h8K74SnGgGiBGuHFjIxPe.z2FjOlb/s3Zywo7q.ia21sOHWwnk4Eu','SAKAMESSO','germain','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:10:52'),(3,'yfo1','$2y$10$T8JG3fTJexfvYP1T8KP.su5xKNy5VbRDWqgsWQ0W2n2b5KSqaTxXu','FOFANA','yacouba','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(4,'aro1','$2y$10$C2iuG2Rz3t.0sYCKc3cwe.oq2Entb1M1q4VJ9f6ItrAPaV3iqcK9y','ROCHDI','abdellah','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(5,'ara1','$2y$10$Nltvrw9ZD9nmFOoHFvA3n.q8yX71foNOCnXcNNUNd76zAvIDcc9SK','RAMI','abderrahman','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(6,'rsi1','$2y$10$0P3UM6Y0TR7J/b2E3vgFjebT8Lg4dOdPPlzqfPazH733H1gNeBnT6','SIMON','régis','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(7,'aab1','$2y$10$oviCfWr95jR7UWbZAkQec.l6EpRLlzbtJdONmbUFjloQZT9vDyG/O','ABDALDJABAR BELAL','abdalkher','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(8,'aso1','$2y$10$MKaTQ1UYw8SW4L6gYwHKdeGVJFiKne4J2S3p69KoeiBkC9eu6rubi','SOUMAH','abdel','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(9,'pbo1','$2y$10$17OwohNiAHHklqopDbuOY.I4j76HEXl0rJ1GeiaBXU7nKvBorRVnq','BOIS','phillipe','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(10,'lik1','$2y$10$gOl0PbGiMl9BPeTYak3.xOTnxIpZe4RWpV2Rgr6CkjVGLGVlPyw5q','IKOUMZANE','lahoucine','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:13:46'),(11,'gnd1','$2y$10$8IhGEJaBaGN0/u2xHKtpx.8f9h7kQd1KrzTYIPQzRF.OFwQU/RT1.','NDOKOBANDA','gervais','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:15:21'),(12,'tsz1','$2y$10$cFOq7C.8VuvBPho8VF6UgOdIMg7elcmGv1T1nOwnrQSOuavyry./O','SZAMVEBER','thibault','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:15:21'),(13,'dpo1','$2y$10$a5OdkC/xyhDftEL/dkxG7uWpN37QFXpIC/Lias9kmkWgZpF8v87k.','POULIN','david','user',0,0,'2025-04-30 16:52:11','2025-04-30 17:15:21'),(14,'hsa1','$2y$10$8rjSq4CX5sZk70o8PzSmCeOT1huUyoPZ1b.XlJVDN4L7iz9FTqf6C','SASULISA','hervé','user',0,0,'2025-04-30 16:53:09','2025-04-30 17:15:21'),(15,'mca1','$2y$10$EwZJv4qKdgWNDiHMUoj2C.i4N6fspVfqV76bGi4OniQiB0jSrZEKm','CAMARA','mamoudou','user',0,0,'2025-04-30 16:53:09','2025-04-30 17:15:21'),(16,'ple1','$2y$10$2rogaQcTXevdxGX9LMSBLuKxq/bgu6j/mQN9FaMdD08wmDGCCxFDa','LE PAPE','patrick','user',0,0,'2025-04-30 16:53:09','2025-04-30 17:15:21');
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
  1 AS `type`,
  1 AS `semaine`,
  1 AS `prete` */;
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
/*!50001 VIEW `vue_engagements_synthese` AS select `pe`.`semaine_engagee` AS `semaine_engagee`,`pa`.`reference` AS `reference`,`pa`.`coefficient` AS `coefficient`,`pa`.`couleur` AS `couleur`,count(`pe`.`id`) AS `engagement`,sum(case when `pe`.`status` = 'fait' then 1 else 0 end) AS `produit`,sum(case when `pe`.`status` = 'reporte' then 1 else 0 end) AS `reporté` from ((`prod_engagements` `pe` join `prod_planning` `pp` on(`pe`.`fk_planning` = `pp`.`id`)) join `prod_articles` `pa` on(`pp`.`fk_article` = `pa`.`id`)) group by `pa`.`reference`,`pe`.`semaine_engagee` order by `pa`.`reference` */;
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
/*!50001 VIEW `vue_prod_planning` AS select `pp`.`id` AS `id`,`pa`.`reference` AS `reference`,`ptse`.`designation` AS `type`,`pp`.`semaine` AS `semaine`,`pp`.`prete` AS `prete` from ((`prod_planning` `pp` join `prod_articles` `pa` on(`pp`.`fk_article` = `pa`.`id`)) join `prod_type_sous_ensemble` `ptse` on(`pp`.`fk_type_sous_ensemble` = `ptse`.`id`)) */;
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

-- Dump completed on 2025-05-02 19:58:02
