-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_acao
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_investiments` (
  `idinvestiment` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idperson` int(11) NOT NULL,
  `sgcompany` varchar(20) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idinvestiment`),
  KEY `FK_investiments_users_idx` (`iduser`),
  KEY `fk_investiments_persons` (`idperson`),
  CONSTRAINT `fk_investiments_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_investiments_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_investiments`
--

LOCK TABLES `tb_investiments` WRITE;
/*!40000 ALTER TABLE `tb_investiments` DISABLE KEYS */;
INSERT INTO `tb_investiments` VALUES (1,1,4,'MGLU3','2021-04-13 17:16:35'),(3,1,4,'MGLU3','2021-04-13 17:18:48'),(5,1,4,'MGLU3','2021-04-13 17:19:43'),(7,1,5,'PETR3','2021-04-13 17:53:40'),(9,1,4,'MGLU3','2021-04-13 17:55:21'),(11,1,4,'MGLU3','2021-04-13 17:56:17'),(13,1,4,'MGLU3','2021-04-13 17:57:08'),(15,1,3,'ABEV3','2021-04-13 18:48:26'),(17,1,6,'SPRI3','2021-04-13 18:55:23'),(19,1,6,'SPRI3','2021-04-13 19:31:55'),(20,1,3,'ABEV3','2021-04-14 10:26:28'),(22,1,7,'KLBN11','2021-04-14 10:30:37'),(23,1,3,'ABEV3','2021-04-14 10:31:12'),(26,1,4,'MGLU3','2021-04-14 11:24:18'),(27,1,5,'PETR3','2021-04-14 11:25:09'),(28,1,7,'KLBN11','2021-04-14 11:25:54'),(29,1,3,'ABEV3','2021-04-14 11:26:38'),(30,1,5,'PETR3','2021-04-14 11:27:12'),(31,1,4,'MGLU3','2021-04-14 11:28:26'),(32,1,5,'PETR3','2021-04-14 11:29:31'),(33,1,3,'ABEV3','2021-04-14 11:30:01'),(34,1,3,'ABEV3','2021-04-14 11:30:25'),(39,1,5,'PETR3','2021-04-14 12:23:51'),(40,1,3,'ABEV3','2021-04-14 12:24:26'),(41,1,3,'ABEV3','2021-04-14 12:24:55'),(42,1,4,'MGLU3','2021-04-14 12:25:51'),(48,1,4,'MGLU3','2021-04-14 13:05:41'),(49,1,3,'ABEV3','2021-04-14 13:06:35'),(50,1,8,'ELET3','2021-04-14 13:08:47'),(51,1,8,'ELET3','2021-04-14 13:09:33'),(52,1,8,'ELET3','2021-04-14 13:10:14'),(53,1,4,'MGLU3','2021-04-14 13:14:01'),(55,1,3,'ABEV3','2021-04-14 13:16:02'),(56,1,8,'ELET3','2021-04-14 13:16:44'),(58,1,3,'ABEV3','2021-04-14 13:18:53'),(59,1,3,'ABEV3','2021-04-14 13:19:19'),(60,1,4,'MGLU3','2021-04-14 13:19:45'),(61,1,4,'MGLU3','2021-04-14 13:20:16'),(62,1,7,'KLBN11','2021-04-14 13:21:12'),(63,1,7,'KLBN11','2021-04-14 13:21:40'),(64,1,7,'KLBN11','2021-04-14 13:22:05'),(70,1,9,'AZUL4','2021-04-14 14:18:54'),(71,1,7,'KLBN11','2021-04-14 14:19:35'),(72,1,7,'KLBN11','2021-04-14 14:19:58'),(73,1,8,'ELET3','2021-04-14 14:20:29'),(74,1,8,'ELET3','2021-04-14 14:21:01'),(75,1,8,'ELET3','2021-04-14 14:21:27'),(76,1,9,'AZUL4','2021-04-14 14:22:12'),(77,1,9,'AZUL4','2021-04-14 14:22:40'),(78,1,3,'ABEV3','2021-04-14 14:23:00'),(83,1,3,'ABEV3','2021-04-14 16:48:53'),(84,1,4,'MGLU3','2021-04-14 16:49:19'),(85,1,8,'ELET3','2021-04-14 16:50:00'),(86,1,8,'ELET3','2021-04-14 16:50:26'),(87,1,8,'ELET3','2021-04-14 16:50:49'),(88,1,5,'PETR3','2021-04-14 16:52:14'),(89,1,7,'KLBN11','2021-04-14 16:52:57'),(90,1,7,'KLBN11','2021-04-14 16:53:18'),(95,1,4,'MGLU3','2021-04-14 16:57:47'),(96,1,8,'ELET3','2021-04-14 16:58:23'),(97,1,12,'PETR4','2021-04-14 16:59:46'),(98,1,12,'PETR4','2021-04-14 17:00:10'),(99,1,5,'PETR3','2021-04-14 17:00:34'),(100,1,10,'EMBR3','2021-04-14 17:01:39'),(101,1,3,'ABEV3','2021-04-14 17:02:30'),(102,1,3,'ABEV3','2021-04-14 17:02:51'),(103,1,7,'KLBN11','2021-04-14 17:03:19'),(104,1,7,'KLBN11','2021-04-14 17:03:38'),(105,1,9,'AZUL4','2021-04-14 17:04:10'),(106,1,9,'AZUL4','2021-04-14 17:04:34'),(108,1,12,'PETR4','2021-04-14 17:06:15'),(109,1,5,'PETR3','2021-04-14 17:06:40'),(110,1,9,'AZUL4','2021-04-14 17:07:04'),(112,1,11,'SUZB3','2021-04-15 10:25:59'),(113,1,11,'SUZB3','2021-04-15 10:31:54'),(114,1,11,'SUZB3','2021-04-15 10:32:26'),(115,1,11,'SUZB3','2021-04-15 10:32:52'),(116,1,7,'KLBN11','2021-04-15 10:33:50'),(117,1,9,'AZUL4','2021-04-15 10:34:35'),(118,1,9,'AZUL4','2021-04-15 10:35:42'),(123,1,11,'SUZB3','2021-04-15 10:52:02'),(124,1,10,'EMBR3','2021-04-15 10:56:51'),(125,1,10,'EMBR3','2021-04-15 10:57:18'),(126,1,13,'SBSP3','2021-04-15 10:58:37'),(127,1,10,'EMBR3','2021-04-15 10:59:34'),(128,1,13,'SBSP3','2021-04-15 11:00:20'),(129,1,12,'PETR4','2021-04-15 11:00:50'),(130,1,8,'ELET3','2021-04-15 11:01:34'),(131,1,8,'ELET3','2021-04-15 11:01:58'),(132,1,9,'AZUL4','2021-04-15 11:03:05'),(133,1,9,'AZUL4','2021-04-15 11:03:36'),(134,1,9,'AZUL4','2021-04-15 11:04:02'),(135,1,4,'MGLU3','2021-04-15 11:04:36'),(136,1,5,'PETR3','2021-04-15 11:05:05'),(142,1,13,'SBSP3','2021-04-15 11:34:59'),(143,1,14,'JBSS3','2021-04-15 11:36:17'),(144,1,10,'EMBR3','2021-04-15 11:36:59'),(145,1,3,'ABEV3','2021-04-15 11:37:31'),(146,1,3,'ABEV3','2021-04-15 11:38:00'),(147,1,4,'MGLU3','2021-04-15 11:39:02'),(148,1,11,'SUZB3','2021-04-15 11:39:43'),(150,1,10,'EMBR3','2021-04-20 20:57:36'),(151,1,13,'SBSP3','2021-04-15 11:49:06'),(152,1,10,'EMBR3','2021-04-15 11:50:01'),(153,1,10,'EMBR3','2021-04-15 11:50:21'),(154,1,10,'EMBR3','2021-04-15 11:51:06'),(155,1,8,'ELET3','2021-04-15 11:57:29'),(156,1,10,'EMBR3','2021-04-15 11:58:45'),(157,1,10,'EMBR3','2021-04-15 11:59:10'),(158,1,3,'ABEV3','2021-04-15 11:59:49'),(159,1,11,'SUZB3','2021-04-15 12:03:00'),(160,1,4,'MGLU3','2021-04-15 12:07:18'),(167,1,10,'EMBR3','2021-04-15 12:31:40'),(168,1,4,'MGLU3','2021-04-15 12:32:15'),(171,1,15,'COGN3','2021-04-15 12:37:30'),(172,1,4,'MGLU3','2021-04-15 12:37:59'),(173,1,4,'MGLU3','2021-04-15 12:38:21'),(174,1,13,'SBSP3','2021-04-15 12:38:59'),(177,1,9,'AZUL4','2021-04-15 12:50:30'),(179,1,16,'TPIS3','2021-04-15 12:48:10'),(180,1,11,'SUZB3','2021-04-15 12:48:54'),(181,1,13,'SBSP3','2021-04-15 12:49:21'),(182,1,9,'AZUL4','2021-04-15 12:50:30'),(183,1,17,'GOLL4','2021-04-15 12:51:30'),(184,1,17,'GOLL4','2021-04-15 12:51:58'),(185,1,17,'GOLL4','2021-04-15 12:52:22'),(186,1,17,'GOLL4','2021-04-15 12:52:48'),(187,1,4,'MGLU3','2021-04-15 12:53:15'),(189,1,13,'SBSP3','2021-04-15 12:55:21'),(190,1,11,'SUZB3','2021-04-15 12:55:54'),(191,1,11,'SUZB3','2021-04-15 12:56:31'),(192,1,8,'ELET3','2021-04-15 12:57:10'),(199,1,8,'ELET3','2021-04-15 13:40:54'),(200,1,17,'GOLL4','2021-04-15 13:41:47'),(201,1,10,'EMBR3','2021-04-15 13:43:11'),(202,1,17,'GOLL4','2021-04-15 13:43:42'),(203,1,9,'AZUL4','2021-04-15 13:44:09'),(204,1,10,'EMBR3','2021-04-15 13:44:49'),(205,1,18,'AMAR3','2021-04-15 13:47:51'),(206,1,17,'GOLL4','2021-04-15 13:48:17'),(207,1,9,'AZUL4','2021-04-15 13:49:02'),(208,1,10,'EMBR3','2021-04-15 13:49:29'),(209,1,18,'AMAR3','2021-04-15 13:50:13'),(210,1,17,'GOLL4','2021-04-15 13:50:35'),(211,1,9,'AZUL4','2021-04-15 13:51:01'),(212,1,10,'EMBR3','2021-04-15 13:51:23'),(216,1,8,'ELET3','2021-04-15 14:04:53'),(218,1,8,'ELET3','2021-04-15 14:04:53'),(219,1,3,'ABEV3','2021-04-15 14:05:23'),(220,1,8,'ELET3','2021-04-15 14:11:23'),(221,1,9,'AZUL4','2021-04-15 14:11:58'),(222,1,17,'GOLL4','2021-04-15 14:12:34'),(223,1,10,'EMBR3','2021-04-15 14:13:18'),(224,1,9,'AZUL4','2021-04-15 14:14:06'),(225,1,17,'GOLL4','2021-04-15 14:14:29'),(226,1,10,'EMBR3','2021-04-15 14:14:55'),(227,1,3,'ABEV3','2021-04-15 14:16:44'),(228,1,8,'ELET3','2021-04-15 14:17:08'),(229,1,9,'AZUL4','2021-04-15 14:17:43'),(230,1,10,'EMBR3','2021-04-15 14:18:14'),(233,1,3,'ABEV3','2021-04-15 14:29:44'),(234,1,10,'EMBR3','2021-04-15 14:30:34'),(238,1,10,'EMBR3','2021-04-15 16:59:01'),(239,1,8,'ELET3','2021-04-15 16:59:33'),(240,1,19,'ETER3','2021-04-15 17:01:01'),(243,1,8,'ELET3','2021-04-15 17:04:11'),(244,1,8,'ELET3','2021-04-15 17:04:29'),(245,1,10,'EMBR3','2021-04-15 17:05:20'),(246,1,19,'ETER3','2021-04-15 17:06:00'),(247,1,19,'ETER3','2021-04-15 17:06:22'),(248,1,15,'COGN3','2021-04-15 17:06:53'),(249,1,3,'ABEV3','2021-04-15 17:07:21'),(250,1,19,'ETER3','2021-04-15 17:07:40'),(251,1,15,'COGN3','2021-04-15 17:08:04'),(253,1,8,'ELET3','2021-04-15 17:10:28'),(254,1,20,'LUPA3','2021-04-15 17:11:36'),(255,1,20,'LUPA3','2021-04-15 17:12:06'),(256,1,19,'ETER3','2021-04-15 17:12:41'),(259,1,20,'LUPA3','2021-04-21 04:17:21'),(260,1,15,'COGN3','2021-04-15 17:17:09'),(261,1,20,'LUPA3','2021-04-15 17:18:15'),(262,1,15,'COGN3','2021-04-15 17:19:02'),(263,1,18,'AMAR3','2021-04-15 17:19:26'),(264,1,19,'ETER3','2021-04-15 17:20:06'),(265,1,20,'LUPA3','2021-04-15 17:20:30'),(267,1,15,'COGN3','2021-04-15 17:22:52'),(268,1,21,'VVAR3','2021-04-15 17:25:50'),(269,1,18,'AMAR3','2021-04-15 17:26:25'),(270,1,19,'ETER3','2021-04-15 17:26:51'),(273,1,19,'ETER3','2021-04-15 17:32:53'),(274,1,3,'ABEV3','2021-04-15 17:33:11'),(275,1,15,'COGN3','2021-04-15 17:33:46'),(276,1,19,'ETER3','2021-04-15 17:34:19'),(277,1,8,'ELET3','2021-04-15 17:34:49'),(278,1,3,'ABEV3','2021-04-15 17:35:15'),(279,1,15,'COGN3','2021-04-15 17:35:47'),(281,1,8,'ELET3','2021-04-15 17:38:06'),(282,1,15,'COGN3','2021-04-15 17:38:24'),(283,1,8,'ELET3','2021-04-15 17:38:46'),(284,1,8,'ELET3','2021-04-15 17:39:03'),(285,1,22,'TIET11','2021-04-15 17:40:05'),(286,1,23,'BBSE3','2021-04-15 17:40:59'),(287,1,17,'GOLL4','2021-04-15 17:41:25'),(288,1,24,'TAEE11','2021-04-15 17:42:33'),(289,1,25,'TAEE4','2021-04-15 17:43:40'),(290,1,15,'COGN3','2021-04-15 17:44:00'),(291,1,23,'BBSE3','2021-04-15 17:45:15'),(292,1,3,'ABEV3','2021-04-15 17:45:34'),(293,1,6,'SPRI3','2021-04-15 17:46:58'),(296,1,24,'TAEE11','2021-04-15 17:53:39'),(298,1,15,'COGN3','2021-04-15 17:55:24'),(299,1,15,'COGN3','2021-04-15 17:55:43'),(302,1,15,'COGN3','2021-04-15 17:58:32'),(305,1,23,'BBSE3','2021-04-15 18:00:40'),(306,1,25,'TAEE4','2021-04-15 18:01:11'),(307,1,10,'EMBR3','2021-04-15 18:01:34'),(308,1,15,'COGN3','2021-04-15 18:02:01'),(311,1,21,'VVAR3','2021-04-15 18:04:06'),(312,1,23,'BBSE3','2021-04-15 18:04:22'),(314,1,3,'ABEV3','2021-04-15 18:09:06'),(315,1,21,'VVAR3','2021-04-15 18:09:29'),(316,1,23,'BBSE3','2021-04-15 18:09:51'),(317,1,23,'BBSE3','2021-04-15 18:10:06'),(320,1,21,'VVAR3','2021-04-15 18:15:27'),(321,1,23,'BBSE3','2021-04-15 18:15:41'),(322,1,26,'GUAR3','2021-04-15 18:17:39'),(323,1,22,'TIET11','2021-04-15 18:18:05'),(324,1,23,'BBSE3','2021-04-15 18:18:26'),(325,1,26,'GUAR3','2021-04-15 18:18:53'),(326,1,26,'GUAR3','2021-04-15 18:22:45'),(327,1,23,'BBSE3','2021-04-21 14:21:42'),(328,1,22,'TIET11','2021-04-15 18:28:44'),(329,1,23,'BBSE3','2021-04-15 18:29:03'),(330,1,26,'GUAR3','2021-04-15 18:30:04'),(331,1,26,'GUAR3','2021-04-15 18:30:37'),(334,1,21,'VVAR3','2021-04-15 18:34:16'),(336,1,21,'VVAR3','2021-04-15 18:36:21'),(337,1,21,'VVAR3','2021-04-15 18:36:58'),(338,1,21,'VVAR3','2021-04-15 18:39:17'),(340,1,21,'VVAR3','2021-04-15 18:44:24'),(341,1,22,'TIET11','2021-04-15 18:44:47'),(342,1,21,'VVAR3','2021-04-15 18:45:17'),(346,1,21,'VVAR3','2021-04-15 19:10:37'),(348,1,3,'ABEV3','2021-04-15 19:15:04'),(349,1,21,'VVAR3','2021-04-15 19:15:33'),(350,1,21,'VVAR3','2021-04-15 19:15:52'),(351,1,27,'TOTS3','2021-04-15 19:17:20'),(352,1,21,'VVAR3','2021-04-15 19:18:12'),(353,1,3,'ABEV3','2021-04-15 19:18:28'),(354,1,27,'TOTS3','2021-04-15 19:19:03'),(360,1,17,'GOLL4','2021-04-15 20:04:09'),(361,1,23,'BBSE3','2021-04-15 20:04:31'),(362,1,17,'GOLL4','2021-04-15 20:10:30'),(363,1,23,'BBSE3','2021-04-15 20:11:05'),(364,1,21,'VVAR3','2021-04-15 20:11:29'),(366,1,23,'BBSE3','2021-04-15 20:16:40'),(367,1,25,'TAEE4','2021-04-15 20:17:15'),(368,1,28,'TAEE3','2021-04-15 20:17:37'),(369,1,17,'GOLL4','2021-04-15 20:18:03');
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

-- Dump completed on 2021-05-10  5:58:01
