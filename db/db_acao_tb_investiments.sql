-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_acao
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_investiments`
--

DROP TABLE IF EXISTS `tb_investiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_investiments` (
  `idinvestiment` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  `sgcompany` varchar(20) NOT NULL,
  `dtbuy` date DEFAULT NULL,
  `dtsell` date DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idinvestiment`),
  KEY `FK_investiments_users_idx` (`iduser`),
  KEY `fk_investiments_persons` (`idperson`),
  KEY `fk_investiments_percomp_idx` (`idsgcompany`),
  CONSTRAINT `fk_investiments_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `fk_investiments_sgcompany` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`),
  CONSTRAINT `fk_investiments_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_investiments`
--

LOCK TABLES `tb_investiments` WRITE;
/*!40000 ALTER TABLE `tb_investiments` DISABLE KEYS */;
INSERT INTO `tb_investiments` VALUES (1,1,4,1,'MGLU3','2020-04-24','2020-04-24','2021-04-13 20:16:35'),(3,1,4,1,'MGLU3','2020-04-24','2020-04-24','2021-04-13 20:18:48'),(5,1,4,1,'MGLU3','2020-04-24','2020-04-27','2021-04-13 20:19:43'),(7,1,5,2,'PETR3','2020-04-27','2020-04-27','2021-04-13 20:53:40'),(9,1,4,1,'MGLU3','2020-04-27','2020-04-27','2021-04-13 20:55:21'),(11,1,4,1,'MGLU3','2020-04-27','2020-04-27','2021-04-13 20:56:17'),(13,1,4,1,'MGLU3','2020-04-27','2020-04-27','2021-04-13 20:57:08'),(15,1,3,3,'ABEV3','2020-04-27','2020-04-27','2021-04-13 21:48:26'),(17,1,6,4,'SPRI3','2020-04-27','2020-04-28','2021-04-13 21:55:23'),(19,1,6,4,'SPRI3','2020-04-27','2020-11-28','2021-04-13 22:31:55'),(20,1,3,3,'ABEV3','2020-04-28','2020-04-29','2021-04-14 13:26:28'),(22,1,7,5,'KLBN11','2020-04-28','2021-05-05','2021-04-14 13:30:37'),(23,1,3,3,'ABEV3','2020-04-30','2020-05-04','2021-04-14 13:31:12'),(26,1,4,1,'MGLU3','2020-05-05','2020-05-06','2021-04-14 14:24:18'),(27,1,5,2,'PETR3','2020-05-06','2020-05-07','2021-04-14 14:25:09'),(28,1,7,5,'KLBN11','2020-05-06','2020-05-07','2021-04-14 14:25:54'),(29,1,3,3,'ABEV3','2020-05-06','2020-05-07','2021-04-14 14:26:38'),(30,1,5,2,'PETR3','2020-05-06','2020-05-08','2021-04-14 14:27:12'),(31,1,4,1,'MGLU3','2020-05-07','2020-05-07','2021-04-14 14:28:26'),(32,1,5,2,'PETR3','2020-05-07','2020-05-08','2021-04-14 14:29:31'),(33,1,3,3,'ABEV3','2020-05-07','2020-05-07','2021-04-14 14:30:01'),(34,1,3,3,'ABEV3','2020-05-07','2020-05-08','2021-04-14 14:30:25'),(39,1,5,2,'PETR3','2020-05-08','2020-05-08','2021-04-14 15:23:51'),(40,1,3,3,'ABEV3','2020-05-08','2020-05-08','2021-04-14 15:24:26'),(41,1,3,3,'ABEV3','2020-05-08','2020-05-08','2021-04-14 15:24:55'),(42,1,4,1,'MGLU3','2020-05-08','2020-05-12','2021-04-14 15:25:51'),(48,1,4,1,'MGLU3','2020-05-11','2020-05-12','2021-04-14 16:05:41'),(49,1,3,3,'ABEV3','2020-05-11','2020-05-18','2021-04-14 16:06:35'),(50,1,8,6,'ELET3','2020-05-12','2020-05-15','2021-04-14 16:08:47'),(51,1,8,6,'ELET3','2020-05-12','2020-05-15','2021-04-14 16:09:33'),(52,1,8,6,'ELET3','2020-05-12','2020-05-15','2021-04-14 16:10:14'),(53,1,4,1,'MGLU3','2020-05-12','2020-05-18','2021-04-14 16:14:01'),(55,1,3,3,'ABEV3','2020-05-13','2020-05-18','2021-04-14 16:16:02'),(56,1,8,6,'ELET3','2020-05-15','2020-05-18','2021-04-14 16:16:44'),(58,1,3,3,'ABEV3','2020-05-18','2020-05-18','2021-04-14 16:18:53'),(59,1,3,3,'ABEV3','2020-05-18','2020-05-18','2021-04-14 16:19:19'),(60,1,4,1,'MGLU3','2020-05-18','2020-05-19','2021-04-14 16:19:45'),(61,1,4,1,'MGLU3','2020-05-18','2020-05-19','2021-04-14 16:20:16'),(62,1,7,5,'KLBN11','2020-05-18','2020-05-19','2021-04-14 16:21:12'),(63,1,7,5,'KLBN11','2020-05-18','2020-05-19','2021-04-14 16:21:40'),(64,1,7,5,'KLBN11','2020-05-18','2020-05-19','2021-04-14 16:22:05'),(70,1,9,7,'AZUL4','2020-05-19','2020-05-20','2021-04-14 17:18:54'),(71,1,7,5,'KLBN11','2020-05-19','2020-05-20','2021-04-14 17:19:35'),(72,1,7,5,'KLBN11','2020-05-19','2020-05-20','2021-04-14 17:19:58'),(73,1,8,6,'ELET3','2020-05-19','2020-05-20','2021-04-14 17:20:29'),(74,1,8,6,'ELET3','2020-05-19','2020-05-20','2021-04-14 17:21:01'),(75,1,8,6,'ELET3','2020-05-19','2020-05-20','2021-04-14 17:21:27'),(76,1,9,7,'AZUL4','2020-05-19','2020-05-20','2021-04-14 17:22:12'),(77,1,9,7,'AZUL4','2020-05-19','2020-05-20','2021-04-14 17:22:40'),(78,1,3,3,'ABEV3','2020-05-19','2020-05-20','2021-04-14 17:23:00'),(83,1,3,3,'ABEV3','2020-05-20','2020-05-20','2021-04-14 19:48:53'),(84,1,4,1,'MGLU3','2020-05-20','2020-05-21','2021-04-14 19:49:19'),(85,1,8,6,'ELET3','2020-05-20','2020-05-22','2021-04-14 19:50:00'),(86,1,8,6,'ELET3','2020-05-20','2020-05-22','2021-04-14 19:50:26'),(87,1,8,6,'ELET3','2020-05-20','2020-05-22','2021-04-14 19:50:49'),(88,1,5,2,'PETR3','2020-05-20','2020-05-25','2021-04-14 19:52:14'),(89,1,7,5,'KLBN11','2020-05-20','2020-07-01','2021-04-14 19:52:57'),(90,1,7,5,'KLBN11','2020-05-20','2020-07-01','2021-04-14 19:53:18'),(95,1,4,1,'MGLU3','2020-05-21','2020-05-21','2021-04-14 19:57:47'),(96,1,8,6,'ELET3','2020-05-21','2020-05-20','2021-04-14 19:58:23'),(97,1,5,8,'PETR4','2020-05-21','2020-05-25','2021-04-14 19:59:46'),(98,1,5,8,'PETR4','2020-05-21','2020-05-25','2021-04-14 20:00:10'),(99,1,5,2,'PETR3','2020-05-21','2020-05-25','2021-04-14 20:00:34'),(100,1,10,9,'EMBR3','2020-05-21','2020-05-25','2021-04-14 20:01:39'),(101,1,3,3,'ABEV3','2020-05-21','2020-05-25','2021-04-14 20:02:30'),(102,1,3,3,'ABEV3','2020-05-21','2020-05-25','2021-04-14 20:02:51'),(103,1,7,5,'KLBN11','2020-05-21','2020-07-01','2021-04-14 20:03:19'),(104,1,7,5,'KLBN11','2020-05-21','2020-07-01','2021-04-14 20:03:38'),(105,1,9,7,'AZUL4','2020-05-21','2020-06-02','2021-04-14 20:04:10'),(106,1,9,7,'AZUL4','2020-05-21','2020-06-02','2021-04-14 20:04:34'),(108,1,5,8,'PETR4','2020-05-22','2020-05-25','2021-04-14 20:06:15'),(109,1,5,2,'PETR3','2020-05-21','2020-05-25','2021-04-14 20:06:40'),(110,1,9,7,'AZUL4','2020-05-21','2020-06-02','2021-04-14 20:07:04'),(112,1,11,10,'SUZB3','2020-05-25','2020-05-27','2021-04-15 13:25:59'),(113,1,11,10,'SUZB3','2020-05-25','2020-05-27','2021-04-15 13:31:54'),(114,1,11,10,'SUZB3','2020-05-25','2020-05-27','2021-04-15 13:32:26'),(115,1,11,10,'SUZB3','2020-05-25','2020-05-27','2021-04-15 13:32:52'),(116,1,7,5,'KLBN11','2020-05-25','2020-07-01','2021-04-15 13:33:50'),(117,1,9,7,'AZUL4','2020-05-25','2020-06-02','2021-04-15 13:34:35'),(118,1,9,7,'AZUL4','2020-05-25','2020-06-02','2021-04-15 13:35:42'),(123,1,11,10,'SUZB3','2020-05-26','2020-05-27','2021-04-15 13:52:02'),(124,1,10,9,'EMBR3','2020-05-26','2020-05-27','2021-04-15 13:56:51'),(125,1,10,9,'EMBR3','2020-05-26','2020-05-27','2021-04-15 13:57:18'),(126,1,13,11,'SBSP3','2020-05-27','2020-05-27','2021-04-15 13:58:37'),(127,1,10,9,'EMBR3','2020-05-27','2020-05-27','2021-04-15 13:59:34'),(128,1,13,11,'SBSP3','2020-05-27','2020-05-28','2021-04-15 14:00:20'),(129,1,5,8,'PETR4','2020-05-27','2020-05-29','2021-04-15 14:00:50'),(130,1,8,6,'ELET3','2020-05-27','2020-06-01','2021-04-15 14:01:34'),(131,1,8,6,'ELET3','2020-05-27','2020-06-01','2021-04-15 14:01:58'),(132,1,9,7,'AZUL4','2020-05-27','2020-06-02','2021-04-15 14:03:05'),(133,1,9,7,'AZUL4','2020-05-27','2020-06-02','2021-04-15 14:03:36'),(134,1,9,7,'AZUL4','2020-05-27','2020-06-02','2021-04-15 14:04:02'),(135,1,4,1,'MGLU3','2020-05-27','2020-06-17','2021-04-15 14:04:36'),(136,1,5,2,'PETR3','2020-05-27','2020-05-28','2021-04-15 14:05:05'),(142,1,13,11,'SBSP3','2020-05-28','2020-05-28','2021-04-15 14:34:59'),(143,1,14,12,'JBSS3','2020-05-28','2020-05-29','2021-04-15 14:36:17'),(144,1,10,9,'EMBR3','2020-05-28','2020-05-29','2021-04-15 14:36:59'),(145,1,3,3,'ABEV3','2020-05-28','2020-06-02','2021-04-15 14:37:31'),(146,1,3,3,'ABEV3','2020-05-28','2020-06-02','2021-04-15 14:38:00'),(147,1,4,1,'MGLU3','2020-05-28','2020-06-17','2021-04-15 14:39:02'),(148,1,11,10,'SUZB3','2020-05-28','2020-06-17','2021-04-15 14:39:43'),(150,1,10,9,'EMBR3','2020-05-29','2020-05-29','2021-04-20 23:57:36'),(151,1,13,11,'SBSP3','2020-05-29','2020-05-29','2021-04-15 14:49:06'),(152,1,10,9,'EMBR3','2020-05-29','2020-05-29','2021-04-15 14:50:01'),(153,1,10,9,'EMBR3','2020-05-29','2020-05-29','2021-04-15 14:50:21'),(154,1,10,9,'EMBR3','2020-05-29','2020-05-29','2021-04-15 14:51:06'),(155,1,8,6,'ELET3','2020-05-29','2020-06-01','2021-04-15 14:57:29'),(156,1,10,9,'EMBR3','2020-05-29','2020-06-02','2021-04-15 14:58:45'),(157,1,10,9,'EMBR3','2020-05-29','2020-06-02','2021-04-15 14:59:10'),(158,1,3,3,'ABEV3','2020-05-29','2020-06-02','2021-04-15 14:59:49'),(159,1,11,10,'SUZB3','2020-05-29','2020-06-17','2021-04-15 15:03:00'),(160,1,4,1,'MGLU3','2020-05-29','2020-06-17','2021-04-15 15:07:18'),(167,1,10,9,'EMBR3','2020-06-01','2020-06-02','2021-04-15 15:31:40'),(168,1,4,1,'MGLU3','2020-06-01','2020-06-17','2021-04-15 15:32:15'),(171,1,15,13,'COGN3','2020-06-02','2020-06-04','2021-04-15 15:37:30'),(172,1,4,1,'MGLU3','2020-06-02','2020-06-17','2021-04-15 15:37:59'),(173,1,4,1,'MGLU3','2020-06-02','2020-06-17','2021-04-15 15:38:21'),(174,1,13,11,'SBSP3','2020-06-02','2020-06-17','2021-04-15 15:38:59'),(177,1,9,7,'AZUL4','2020-06-04','2020-06-08','2021-04-15 15:50:30'),(179,1,16,14,'TPIS3','2020-06-03','2020-06-08','2021-04-15 15:48:10'),(180,1,11,10,'SUZB3','2020-06-03','2020-06-17','2021-04-15 15:48:54'),(181,1,13,11,'SBSP3','2020-06-03','2020-06-17','2021-04-15 15:49:21'),(182,1,9,7,'AZUL4','2020-06-04','2020-06-08','2021-04-15 15:50:30'),(183,1,17,15,'GOLL4','2020-06-04','2020-06-08','2021-04-15 15:51:30'),(184,1,17,15,'GOLL4','2020-06-04','2020-06-08','2021-04-15 15:51:58'),(185,1,17,15,'GOLL4','2020-06-04','2020-06-08','2021-04-15 15:52:22'),(186,1,17,15,'GOLL4','2020-06-04','2020-06-08','2021-04-15 15:52:48'),(187,1,4,1,'MGLU3','2020-06-04','2020-06-17','2021-04-15 15:53:15'),(189,1,13,11,'SBSP3','2020-06-05','2020-06-17','2021-04-15 15:55:21'),(190,1,11,10,'SUZB3','2020-06-08','2020-06-17','2021-04-15 15:55:54'),(191,1,11,10,'SUZB3','2020-06-08','2020-06-17','2021-04-15 15:56:31'),(192,1,8,6,'ELET3','2020-06-08','2020-06-17','2021-04-15 15:57:10'),(199,1,8,6,'ELET3','2020-06-09','2020-06-17','2021-04-15 16:40:54'),(200,1,17,15,'GOLL4','2020-06-09','2020-06-10','2021-04-15 16:41:47'),(201,1,10,9,'EMBR3','2020-06-09','2020-12-03','2021-04-15 16:43:11'),(202,1,17,15,'GOLL4','2020-06-10','2020-06-10','2021-04-15 16:43:42'),(203,1,9,7,'AZUL4','2020-06-10','2020-08-12','2021-04-15 16:44:09'),(204,1,10,9,'EMBR3','2020-06-10','2020-12-03','2021-04-15 16:44:49'),(205,1,18,16,'AMAR3','2020-06-12','2020-07-07','2021-04-15 16:47:51'),(206,1,17,15,'GOLL4','2020-06-12','2020-06-15','2021-04-15 16:48:17'),(207,1,9,7,'AZUL4','2020-06-12','2020-08-12','2021-04-15 16:49:02'),(208,1,10,9,'EMBR3','2020-06-12','2020-12-03','2021-04-15 16:49:29'),(209,1,18,16,'AMAR3','2020-06-17','2020-07-10','2021-04-15 16:50:13'),(210,1,17,15,'GOLL4','2020-06-17','2020-06-15','2021-04-15 16:50:35'),(211,1,9,7,'AZUL4','2020-06-17','2020-08-12','2021-04-15 16:51:01'),(212,1,10,9,'EMBR3','2020-06-17','2020-12-03','2021-04-15 16:51:23'),(216,1,8,6,'ELET3','2020-06-18','2020-06-30','2021-04-15 17:04:53'),(218,1,8,6,'ELET3','2020-06-18','2020-06-30','2021-04-15 17:04:53'),(219,1,3,3,'ABEV3','2020-06-18','2020-07-01','2021-04-15 17:05:23'),(220,1,8,6,'ELET3','2020-06-19','2020-06-30','2021-04-15 17:11:23'),(221,1,9,7,'AZUL4','2020-06-22','2020-08-12','2021-04-15 17:11:58'),(222,1,17,15,'GOLL4','2020-06-22','2020-09-04','2021-04-15 17:12:34'),(223,1,10,9,'EMBR3','2020-06-22','2020-12-03','2021-04-15 17:13:18'),(224,1,9,7,'AZUL4','2020-06-23','2020-08-12','2021-04-15 17:14:06'),(225,1,17,15,'GOLL4','2020-06-23','2020-09-04','2021-04-15 17:14:29'),(226,1,10,9,'EMBR3','2020-06-23','2020-12-03','2021-04-15 17:14:55'),(227,1,3,3,'ABEV3','2020-06-24','2020-07-01','2021-04-15 17:16:44'),(228,1,8,6,'ELET3','2020-06-25','2020-06-30','2021-04-15 17:17:08'),(229,1,9,7,'AZUL4','2020-06-25','2020-08-12','2021-04-15 17:17:43'),(230,1,10,9,'EMBR3','2020-06-28','2020-12-03','2021-04-15 17:18:14'),(233,1,3,3,'ABEV3','2020-07-01','2020-07-01','2021-04-15 17:29:44'),(234,1,10,9,'EMBR3','2020-07-01','2020-12-03','2021-04-15 17:30:34'),(238,1,10,9,'EMBR3','2020-07-09','2020-12-03','2021-04-15 19:59:01'),(239,1,8,6,'ELET3','2020-07-10','2020-07-27','2021-04-15 19:59:33'),(240,1,19,17,'ETER3','2020-07-10','2020-07-16','2021-04-15 20:01:01'),(243,1,8,6,'ELET3','2020-07-13','2020-07-27','2021-04-15 20:04:11'),(244,1,8,6,'ELET3','2020-07-13','2020-07-27','2021-04-15 20:04:29'),(245,1,10,9,'EMBR3','2020-07-13','2020-12-03','2021-04-15 20:05:20'),(246,1,19,17,'ETER3','2020-07-13','2020-07-16','2021-04-15 20:06:00'),(247,1,19,17,'ETER3','2020-07-13','2020-07-16','2021-04-15 20:06:22'),(248,1,15,13,'COGN3','2020-07-14','2020-07-16','2021-04-15 20:06:53'),(249,1,3,3,'ABEV3','2020-07-14','2020-07-22','2021-04-15 20:07:21'),(250,1,19,17,'ETER3','2020-07-14','2020-07-16','2021-04-15 20:07:40'),(251,1,15,13,'COGN3','2020-07-15','2020-07-16','2021-04-15 20:08:04'),(253,1,8,6,'ELET3','2020-07-16','2020-07-27','2021-04-15 20:10:28'),(254,1,20,18,'LUPA3','2020-07-16','2020-06-30','2021-04-15 20:11:36'),(255,1,20,18,'LUPA3','2020-07-20','2020-08-24','2021-04-15 20:12:06'),(256,1,19,17,'ETER3','2020-07-21','2020-09-08','2021-04-15 20:12:41'),(259,1,20,18,'LUPA3','2020-07-23','2020-12-14','2021-04-21 07:17:21'),(260,1,15,13,'COGN3','2020-07-23','2020-07-28','2021-04-15 20:17:09'),(261,1,20,18,'LUPA3','2020-07-23','2020-07-30','2021-04-15 20:18:15'),(262,1,15,13,'COGN3','2020-07-27','2020-07-28','2021-04-15 20:19:02'),(263,1,18,16,'AMAR3','2020-07-27','2020-08-25','2021-04-15 20:19:26'),(264,1,19,17,'ETER3','2020-07-27','2020-09-08','2021-04-15 20:20:06'),(265,1,20,18,'LUPA3','2020-07-27','2020-12-14','2021-04-15 20:20:30'),(267,1,15,13,'COGN3','2020-07-28','2020-07-28','2021-04-15 20:22:52'),(268,1,21,19,'VVAR3','2020-07-28','2020-11-26','2021-04-15 20:25:50'),(269,1,18,16,'AMAR3','2020-07-28','2020-08-25','2021-04-15 20:26:25'),(270,1,19,17,'ETER3','2020-07-28','2020-09-08','2021-04-15 20:26:51'),(273,1,19,17,'ETER3','2020-08-03','2020-09-08','2021-04-15 20:32:53'),(274,1,3,3,'ABEV3','2020-08-03','2020-09-17','2021-04-15 20:33:11'),(275,1,15,13,'COGN3','2020-08-03',NULL,'2021-04-15 20:33:46'),(276,1,19,17,'ETER3','2020-08-04','2020-09-08','2021-04-15 20:34:19'),(277,1,8,6,'ELET3','2020-08-12','2020-08-21','2021-04-15 20:34:49'),(278,1,3,3,'ABEV3','2020-08-12','2020-09-17','2021-04-15 20:35:15'),(279,1,15,13,'COGN3','2020-08-12',NULL,'2021-04-15 20:35:47'),(281,1,8,6,'ELET3','2020-08-13','2020-08-21','2021-04-15 20:38:06'),(282,1,15,13,'COGN3','2020-08-13',NULL,'2021-04-15 20:38:24'),(283,1,8,6,'ELET3','2020-08-14','2020-08-21','2021-04-15 20:38:46'),(284,1,8,6,'ELET3','2020-08-17','2020-08-21','2021-04-15 20:39:03'),(285,1,22,20,'TIET11','2020-08-19','2020-08-25','2021-04-15 20:40:05'),(286,1,23,21,'BBSE3','2020-08-19','2020-08-28','2021-04-15 20:40:59'),(287,1,17,15,'GOLL4','2020-08-19','2020-09-04','2021-04-15 20:41:25'),(288,1,24,22,'TAEE11','2020-08-19','2020-09-08','2021-04-15 20:42:33'),(289,1,24,23,'TAEE4','2020-08-19','2020-11-05','2021-04-15 20:43:40'),(290,1,15,13,'COGN3','2020-08-19',NULL,'2021-04-15 20:44:00'),(291,1,23,21,'BBSE3','2020-08-20','2020-08-28','2021-04-15 20:45:15'),(292,1,3,3,'ABEV3','2020-08-21','2020-09-17','2021-04-15 20:45:34'),(293,1,6,4,'SPRI3','2020-08-21','2020-11-28','2021-04-15 20:46:58'),(296,1,24,22,'TAEE11','2020-08-24','2020-09-08','2021-04-15 20:53:39'),(298,1,15,13,'COGN3','2020-08-25',NULL,'2021-04-15 20:55:24'),(299,1,15,13,'COGN3','2020-08-25',NULL,'2021-04-15 20:55:43'),(302,1,15,13,'COGN3','2020-08-26',NULL,'2021-04-15 20:58:32'),(305,1,23,21,'BBSE3','2020-08-31','2020-09-03','2021-04-15 21:00:40'),(306,1,24,23,'TAEE4','2020-08-31','2020-11-05','2021-04-15 21:01:11'),(307,1,10,9,'EMBR3','2020-08-31','2020-12-03','2021-04-15 21:01:34'),(308,1,15,13,'COGN3','2020-08-31',NULL,'2021-04-15 21:02:01'),(311,1,21,19,'VVAR3','2020-09-04','2020-11-26','2021-04-15 21:04:06'),(312,1,23,21,'BBSE3','2020-09-04','2020-11-09','2021-04-15 21:04:22'),(314,1,3,3,'ABEV3','2020-09-08','2020-09-17','2021-04-15 21:09:06'),(315,1,21,19,'VVAR3','2020-09-08','2020-11-26','2021-04-15 21:09:29'),(316,1,23,21,'BBSE3','2020-09-08','2020-11-09','2021-04-15 21:09:51'),(317,1,23,21,'BBSE3','2020-09-08','2020-11-09','2021-04-15 21:10:06'),(320,1,21,19,'VVAR3','2020-09-10','2020-11-26','2021-04-15 21:15:27'),(321,1,23,21,'BBSE3','2020-09-10','2020-11-09','2021-04-15 21:15:41'),(322,1,26,24,'GUAR3','2020-09-10','2021-04-16','2021-04-15 21:17:39'),(323,1,22,20,'TIET11','2020-09-11','2020-10-19','2021-04-15 21:18:05'),(324,1,23,21,'BBSE3','2020-09-11','2020-11-09','2021-04-15 21:18:26'),(325,1,26,24,'GUAR3','2020-09-11','2021-04-16','2021-04-15 21:18:53'),(326,1,26,24,'GUAR3','2020-09-17','2021-04-16','2021-04-15 21:22:45'),(327,1,23,21,'BBSE3','2020-11-09','2020-11-16','2021-04-21 17:21:42'),(328,1,22,20,'TIET11','2020-09-22','2020-10-19','2021-04-15 21:28:44'),(329,1,23,21,'BBSE3','2020-09-22','2020-11-16','2021-04-15 21:29:03'),(330,1,26,24,'GUAR3','2020-09-22','2021-04-16','2021-04-15 21:30:04'),(331,1,26,24,'GUAR3','2020-10-09','2021-04-16','2021-04-15 21:30:37'),(334,1,21,19,'VVAR3','2020-10-27','2020-11-26','2021-04-15 21:34:16'),(336,1,21,19,'VVAR3','2020-11-09','2020-11-26','2021-04-15 21:36:21'),(337,1,21,19,'VVAR3','2020-11-10','2020-11-26','2021-04-15 21:36:58'),(338,1,21,19,'VVAR3','2020-11-10','2020-11-26','2021-04-15 21:39:17'),(340,1,21,19,'VVAR3','2020-11-12','2020-11-26','2021-04-15 21:44:24'),(341,1,22,20,'TIET11','2020-11-12','2020-11-26','2021-04-15 21:44:47'),(342,1,21,19,'VVAR3','2020-11-16','2020-11-26','2021-04-15 21:45:17'),(346,1,21,19,'VVAR3','2020-11-27',NULL,'2021-04-15 22:10:37'),(348,1,3,3,'ABEV3','2020-11-30','2020-12-02','2021-04-15 22:15:04'),(349,1,21,19,'VVAR3','2020-11-30',NULL,'2021-04-15 22:15:33'),(350,1,21,19,'VVAR3','2020-11-30',NULL,'2021-04-15 22:15:52'),(351,1,27,25,'TOTS3','2020-12-01','2020-12-16','2021-04-15 22:17:20'),(352,1,21,19,'VVAR3','2020-12-01',NULL,'2021-04-15 22:18:12'),(353,1,3,3,'ABEV3','2020-12-03','2020-12-10','2021-04-15 22:18:28'),(354,1,27,25,'TOTS3','2020-12-03','2020-12-16','2021-04-15 22:19:03'),(360,1,17,15,'GOLL4','2020-12-17','2021-05-26','2021-04-15 23:04:09'),(361,1,23,21,'BBSE3','2020-12-18','2021-01-14','2021-04-15 23:04:31'),(362,1,17,15,'GOLL4','2020-12-18','2021-05-26','2021-04-15 23:10:30'),(363,1,23,21,'BBSE3','2021-01-07','2021-01-14','2021-04-15 23:11:05'),(364,1,21,19,'VVAR3','2021-01-07',NULL,'2021-04-15 23:11:29'),(366,1,23,21,'BBSE3','2021-01-18',NULL,'2021-04-15 23:16:40'),(367,1,24,23,'TAEE4','2021-01-21','2021-05-04','2021-04-15 23:17:15'),(368,1,24,26,'TAEE3','2021-01-21',NULL,'2021-04-15 23:17:37'),(374,1,17,27,'GOLL2','2020-05-06','2021-05-07','2021-05-29 08:28:23'),(380,1,17,15,'GOLL4','2021-01-21',NULL,'2021-06-01 09:26:34'),(381,1,17,28,'GOLLE240','2021-05-11','2021-05-14','2021-06-04 08:50:24'),(382,1,17,28,'GOLLE240','2021-05-12','2021-05-14','2021-06-04 08:51:30'),(383,1,17,28,'GOLLE240','2021-05-13','2021-01-14','2021-06-04 08:52:09');
/*!40000 ALTER TABLE `tb_investiments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-07  6:09:35
