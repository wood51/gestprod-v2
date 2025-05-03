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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (11,'AB100L100V2'),(12,'AB180L225V1'),(13,'AS180L170'),(14,'AB250M150V2'),(15,'AS250M150V3'),(16,'AS250M150V9'),(17,'AS250L250V2'),(18,'AS280M140V2'),(19,'AS280L240-28V9'),(20,'AS280L240-28-V10');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
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
-- Table structure for table `atelier_operations`
--

DROP TABLE IF EXISTS `atelier_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atelier_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atelier_operations`
--

LOCK TABLES `atelier_operations` WRITE;
/*!40000 ALTER TABLE `atelier_operations` DISABLE KEYS */;
INSERT INTO `atelier_operations` VALUES (1,'Empilage Stator'),(2,'Usinage Stator'),(3,'Bobinage Stator'),(4,'Imprégnation Stator'),(5,'Nettoyage Stator'),(6,'Empilage Rotor'),(7,'Bobinage Rotor'),(8,'Imprégnation Rotor'),(9,'Nettoyage Rotor'),(10,'Équipement Rotor'),(11,'Équilibrage Rotor'),(12,'Pré-équipement essais Rotor'),(13,'Insertion Palier'),(14,'Équipement Palier'),(15,'Essais Alternateur'),(16,'Essais Alternateur Redresseur'),(17,'Finition Alternateur'),(18,'Fabrication Bobine'),(19,'Compresseur'),(20,'Manutention');
/*!40000 ALTER TABLE `atelier_operations` ENABLE KEYS */;
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
  CONSTRAINT `accidents_travail_atelier_operations_FK` FOREIGN KEY (`fk_operation_id`) REFERENCES `atelier_operations` (`id`),
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
-- Table structure for table `sorties`
--

DROP TABLE IF EXISTS `sorties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_article_id` int(11) NOT NULL,
  `fk_type_sous_ensemble` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `date_sortie` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sorties_articles_FK` (`fk_article_id`),
  KEY `sorties_type_sous_emsemble_FK` (`fk_type_sous_ensemble`),
  CONSTRAINT `sorties_articles_FK` FOREIGN KEY (`fk_article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `sorties_type_sous_emsemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `type_sous_ensemble` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorties`
--

LOCK TABLES `sorties` WRITE;
/*!40000 ALTER TABLE `sorties` DISABLE KEYS */;
INSERT INTO `sorties` VALUES (9,18,8,6484,'2025-04-14 00:00:00'),(10,18,8,6495,'2025-04-14 00:00:00'),(11,20,6,6613,'2025-04-14 00:00:00'),(12,17,6,6615,'2025-04-14 00:00:00'),(13,18,8,6490,'2025-04-14 00:00:00'),(14,18,8,6489,'2025-04-14 00:00:00'),(15,20,6,6575,'2025-04-15 00:00:00'),(16,20,6,6563,'2025-04-15 00:00:00'),(17,15,6,6586,'2025-04-15 00:00:00'),(18,20,7,6623,'2025-04-15 00:00:00'),(19,20,7,6622,'2025-04-15 00:00:00'),(20,20,7,6625,'2025-04-15 00:00:00'),(21,18,8,6481,'2025-04-15 00:00:00');
/*!40000 ALTER TABLE `sorties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_sous_ensemble`
--

DROP TABLE IF EXISTS `type_sous_ensemble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_sous_ensemble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_sous_ensemble`
--

LOCK TABLES `type_sous_ensemble` WRITE;
/*!40000 ALTER TABLE `type_sous_ensemble` DISABLE KEYS */;
INSERT INTO `type_sous_ensemble` VALUES (6,'rotor'),(7,'stator'),(8,'stator_st'),(9,'palier'),(10,'alternateur');
/*!40000 ALTER TABLE `type_sous_ensemble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(4) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` enum('user','superuser','admin') DEFAULT 'user',
  `sst` tinyint(4) DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_unique` (`nom`,`prenom`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'ple1','$2a$12$XgsHH9KynbhoLWb1dQQsbO/CkHFMuBMuZG6fqa9g5nf7f9.d97bAC','le pape','patrick','admin',1,0,'2025-04-12 06:39:12','2025-04-27 17:17:23'),(46,'lik1','$2y$10$lcubGpOT7QxUn6BvvILb9en8y0NKCeKxgTLmZcew7zTnAJtCFjZnu','IKOUMZANE','Lahoucine','user',0,0,'2025-04-13 18:14:39','2025-04-13 18:44:54'),(56,'dpo1','$2y$10$lcAFSKl.P9pNoJEhcMIhme9OKQ8Fn7l/4fMQfnn7vna4ldi09oeZ2','Poulin','david','user',0,0,'2025-04-13 19:42:55','2025-04-13 19:43:17'),(57,'pbo1','$2y$10$zv82rmq5pfgVBIC17TKhGOensW.scAo/rOyDCxF/dv5LZswl8I8bq','Bois','phillipe','user',0,0,'2025-04-18 20:30:43','2025-04-18 20:30:43'),(58,'aso1','$2y$10$6B/iRSFvEREdXs/GklsN1.tCehBa83Q5ENqwJRn4iRi3jXAXORHCC','Soumah','abdel','user',0,0,'2025-04-18 20:31:34','2025-04-18 20:31:34'),(59,'rsi1','$2y$10$UrrPobWdKS6xzxDYad.8Xu8Qe1Kc8gWaxHcr7vDvDJTgyGDhCE1P.','Simon','régis','user',0,0,'2025-04-18 20:31:58','2025-04-18 20:31:58'),(60,'aab1','$2y$10$EI7J/AjGRaVrXAdQLu3lMeKny8kTg73d5Vuwkr9d22ODZ/1TgloVO','ABDALDJABAR BELAL','Abdalkher','user',0,0,'2025-04-19 00:35:27','2025-04-19 00:35:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vue_sorties`
--

DROP TABLE IF EXISTS `vue_sorties`;
/*!50001 DROP VIEW IF EXISTS `vue_sorties`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vue_sorties` AS SELECT
 1 AS `rotor`,
  1 AS `stator`,
  1 AS `stator_st`,
  1 AS `palier`,
  1 AS `alternateur`,
  1 AS `date`,
  1 AS `semaine` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'gestprod_v2'
--

--
-- Final view structure for view `vue_sorties`
--

/*!50001 DROP VIEW IF EXISTS `vue_sorties`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `vue_sorties` AS select cast(sum(`tse`.`designation` = 'rotor') as unsigned) AS `rotor`,cast(sum(`tse`.`designation` = 'stator') as unsigned) AS `stator`,cast(sum(`tse`.`designation` = 'stator_st') as unsigned) AS `stator_st`,cast(sum(`tse`.`designation` = 'palier') as unsigned) AS `palier`,cast(sum(`tse`.`designation` = 'alternateur') as unsigned) AS `alternateur`,date_format(`s`.`date_sortie`,'%d/%m/%Y') AS `date`,date_format(`s`.`date_sortie`,'%u-%Y') AS `semaine` from (`type_sous_ensemble` `tse` join `sorties` `s` on(`s`.`fk_type_sous_ensemble` = `tse`.`id`)) group by date_format(`s`.`date_sortie`,'%d/%m/%Y'),date_format(`s`.`date_sortie`,'%u-%Y') */;
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

-- Dump completed on 2025-04-29 22:47:22
