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
  `qtdebuy` int(11) DEFAULT 0,
  `dtbuy` date DEFAULT NULL,
  `prcbuy` decimal(10,2) DEFAULT 0.00,
  `tlbuy` decimal(10,2) DEFAULT 0.00,
  `iprcaverage` decimal(10,2) DEFAULT 0.00,
  `dtsell` date DEFAULT NULL,
  `qtdesell` int(11) DEFAULT 0,
  `prcsell` decimal(10,2) DEFAULT 0.00,
  `tlsell` decimal(10,2) DEFAULT 0.00,
  `tax` decimal(10,2) DEFAULT 0.00,
  `lucre` decimal(10,2) DEFAULT 0.00,
  `tptransaction` char(1) DEFAULT NULL,
  `tipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idinvestiment`),
  KEY `FK_investiments_users_idx` (`iduser`),
  KEY `fk_investiments_persons` (`idperson`),
  CONSTRAINT `fk_investiments_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_investiments_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_investiments`
--

LOCK TABLES `tb_investiments` WRITE;
/*!40000 ALTER TABLE `tb_investiments` DISABLE KEYS */;
INSERT INTO `tb_investiments` VALUES (1,1,4,'MGLU3',2,'2020-04-24',47.14,94.28,47.14,'2020-04-24',2,47.23,94.46,0.19,0.18,'C','2','2021-04-13 14:16:35'),(3,1,4,'MGLU3',2,'2020-04-24',46.98,93.96,46.98,'2020-04-24',2,47.28,94.56,0.64,0.60,'C','2','2021-04-13 14:18:48'),(5,1,4,'MGLU3',2,'2020-04-24',46.95,93.90,46.95,'2020-04-27',2,48.43,96.86,3.15,2.96,'C','1','2021-04-13 14:19:43'),(7,1,5,'PETR3',2,'2020-04-27',16.45,32.90,16.45,'2020-04-27',2,16.50,33.00,0.30,0.10,'C','2','2021-04-13 14:53:40'),(9,1,4,'MGLU3',2,'2020-04-27',48.11,96.22,48.11,'2020-04-27',2,48.60,97.20,1.02,0.98,'C','2','2021-04-13 14:55:21'),(11,1,4,'MGLU3',2,'2020-04-27',48.54,97.08,48.54,'2020-04-27',2,48.75,97.50,0.43,0.42,'C','2','2021-04-13 14:56:17'),(13,1,4,'MGLU3',2,'2020-04-27',48.53,97.06,48.53,'2020-04-27',2,48.72,97.44,0.39,0.38,'C','2','2021-04-13 14:57:08'),(15,1,3,'ABEV3',2,'2020-04-27',11.63,23.26,11.63,'2020-04-27',2,11.69,23.38,0.52,0.12,'C','1','2021-04-13 15:48:26'),(17,1,6,'SPRI3',2,'2020-04-27',26.19,52.38,26.19,'2020-04-28',2,26.00,52.00,-0.73,-0.38,'C','1','2021-04-13 15:55:23'),(19,1,6,'SPRI3',2,'2020-04-27',25.59,51.18,25.59,'2020-11-28',2,10.51,21.02,-58.93,-30.16,'C','1','2021-04-13 16:31:55'),(20,1,3,'ABEV3',2,'2020-04-28',11.79,23.58,11.79,'2020-04-29',2,11.87,23.74,0.68,0.16,'C','1','2021-04-14 07:26:28'),(22,1,7,'KLBN11',2,'2020-04-28',18.09,36.18,18.09,'2021-05-05',2,18.74,37.48,3.59,1.30,'C','1','2021-04-14 07:30:37'),(23,1,3,'ABEV3',2,'2020-04-30',11.38,22.76,11.38,'2020-05-04',2,11.48,22.96,0.88,0.20,'C','1','2021-04-14 07:31:12'),(26,1,4,'MGLU3',1,'2020-05-05',51.77,51.77,51.77,'2020-05-06',1,53.46,53.46,3.26,1.69,'C','1','2021-04-14 08:24:18'),(27,1,5,'PETR3',2,'2020-05-06',18.34,36.68,18.34,'2020-05-07',2,18.54,37.08,1.09,0.40,'C','1','2021-04-14 08:25:09'),(28,1,7,'KLBN11',2,'2020-05-06',18.74,37.48,18.74,'2020-05-07',2,19.55,39.10,4.32,1.62,'C','1','2021-04-14 08:25:54'),(29,1,3,'ABEV3',2,'2020-05-06',12.00,24.00,12.00,'2020-05-07',2,12.18,24.36,1.50,0.36,'C','1','2021-04-14 08:26:38'),(30,1,5,'PETR3',2,'2020-05-06',18.28,36.56,18.28,'2020-05-08',2,18.85,37.70,3.12,1.14,'C','2','2021-04-14 08:27:12'),(31,1,4,'MGLU3',1,'2020-05-07',53.85,53.85,53.85,'2020-05-07',1,56.26,56.26,4.48,2.41,'C','2','2021-04-14 08:28:26'),(32,1,5,'PETR3',2,'2020-05-07',18.22,36.44,18.22,'2020-05-08',2,18.85,37.70,3.46,1.26,'C','2','2021-04-14 08:29:31'),(33,1,3,'ABEV3',2,'2020-05-07',11.72,23.44,11.72,'2020-05-07',2,12.18,24.36,3.92,0.92,'C','2','2021-04-14 08:30:01'),(34,1,3,'ABEV3',2,'2020-05-07',11.53,23.06,11.53,'2020-05-08',2,11.92,23.84,3.38,0.78,'C','1','2021-04-14 08:30:25'),(39,1,5,'PETR3',2,'2020-05-08',18.89,37.78,18.89,'2020-05-08',2,19.43,38.86,2.86,1.08,'C','1','2021-04-14 09:23:51'),(40,1,3,'ABEV3',2,'2020-05-08',11.80,23.60,11.80,'2020-05-08',2,12.03,24.06,1.95,0.46,'C','1','2021-04-14 09:24:26'),(41,1,3,'ABEV3',2,'2020-05-08',11.92,23.84,11.92,'2020-05-08',2,12.03,24.06,0.92,0.22,'C','1','2021-04-14 09:24:55'),(42,1,4,'MGLU3',1,'2020-05-08',55.70,55.70,55.70,'2020-05-12',1,56.39,56.39,1.24,0.69,'C','2','2021-04-14 09:25:51'),(48,1,4,'MGLU3',1,'2020-05-11',55.49,55.49,55.49,'2020-05-12',1,56.39,56.39,1.62,0.90,'C','1','2021-04-14 10:05:41'),(49,1,3,'ABEV3',2,'2020-05-11',12.21,24.42,12.21,'2020-05-18',2,12.18,24.36,-0.25,-0.06,'C','1','2021-04-14 10:06:35'),(50,1,8,'ELET3',2,'2020-05-12',22.74,45.48,22.74,'2020-05-15',2,22.90,45.80,0.70,0.32,'C','2','2021-04-14 10:08:47'),(51,1,8,'ELET3',2,'2020-05-12',22.30,44.60,22.30,'2020-05-15',2,22.90,45.80,2.69,1.20,'C','2','2021-04-14 10:09:33'),(52,1,8,'ELET3',2,'2020-05-12',21.94,43.88,21.94,'2020-05-15',2,22.90,45.80,4.38,1.92,'C','2','2021-04-14 10:10:14'),(53,1,4,'MGLU3',1,'2020-05-12',54.99,54.99,54.99,'2020-05-18',1,56.24,56.24,2.27,1.25,'C','2','2021-04-14 10:14:01'),(55,1,3,'ABEV3',3,'2020-05-13',11.65,34.95,11.65,'2020-05-18',3,12.18,36.54,4.55,1.59,'C','1','2021-04-14 10:16:02'),(56,1,8,'ELET3',2,'2020-05-15',22.97,45.94,22.97,'2020-05-18',2,23.27,46.54,1.31,0.60,'C','2','2021-04-14 10:16:44'),(58,1,3,'ABEV3',2,'2020-05-18',11.96,23.92,11.96,'2020-05-18',2,12.34,24.68,3.18,0.76,'C','2','2021-04-14 10:18:53'),(59,1,3,'ABEV3',2,'2020-05-18',12.39,24.78,12.39,'2020-05-18',2,12.34,24.68,-0.40,-0.10,'C','2','2021-04-14 10:19:19'),(60,1,4,'MGLU3',1,'2020-05-18',55.94,55.94,55.94,'2020-05-19',1,56.83,56.83,1.59,0.89,'C','2','2021-04-14 10:19:45'),(61,1,4,'MGLU3',1,'2020-05-18',55.61,55.61,55.61,'2020-05-19',1,56.83,56.83,2.19,1.22,'C','1','2021-04-14 10:20:16'),(62,1,7,'KLBN11',2,'2020-05-18',20.15,40.30,20.15,'2020-05-19',2,20.49,40.98,1.69,0.68,'C','1','2021-04-14 10:21:12'),(63,1,7,'KLBN11',2,'2020-05-18',19.99,39.98,19.99,'2020-05-19',2,20.55,41.10,2.80,1.12,'C','1','2021-04-14 10:21:40'),(64,1,7,'KLBN11',2,'2020-05-18',20.68,41.36,20.68,'2020-05-19',2,20.49,40.98,-0.92,-0.38,'C','2','2021-04-14 10:22:05'),(70,1,9,'AZUL4',2,'2020-05-19',13.76,27.52,13.76,'2020-05-20',2,14.37,28.74,4.43,1.22,'C','1','2021-04-14 11:18:54'),(71,1,7,'KLBN11',2,'2020-05-19',20.05,40.10,20.05,'2020-05-20',2,20.42,40.84,1.85,0.74,'C','2','2021-04-14 11:19:35'),(72,1,7,'KLBN11',2,'2020-05-19',20.07,40.14,20.07,'2020-05-20',2,20.42,40.84,1.74,0.70,'C','2','2021-04-14 11:19:58'),(73,1,8,'ELET3',1,'2020-05-19',24.18,24.18,24.18,'2020-05-20',1,24.41,24.41,0.95,0.23,'C','2','2021-04-14 11:20:29'),(74,1,8,'ELET3',2,'2020-05-19',23.84,47.68,23.84,'2020-05-20',2,24.41,48.82,2.39,1.14,'C','2','2021-04-14 11:21:01'),(75,1,8,'ELET3',2,'2020-05-19',23.86,47.72,23.86,'2020-05-20',2,24.41,48.82,2.31,1.10,'C','2','2021-04-14 11:21:27'),(76,1,9,'AZUL4',1,'2020-05-19',14.42,14.42,14.42,'2020-05-20',1,14.50,14.50,0.55,0.08,'C','1','2021-04-14 11:22:12'),(77,1,9,'AZUL4',2,'2020-05-19',13.71,27.42,13.71,'2020-05-20',2,14.50,29.00,5.76,1.58,'C','1','2021-04-14 11:22:40'),(78,1,3,'ABEV3',1,'2020-05-19',12.14,12.14,12.14,'2020-05-20',1,12.13,12.13,-0.08,-0.01,'C','1','2021-04-14 11:23:00'),(83,1,3,'ABEV3',2,'2020-05-20',11.96,23.92,11.96,'2020-05-20',2,12.13,24.26,1.42,0.34,'C','2','2021-04-14 13:48:53'),(84,1,4,'MGLU3',1,'2020-05-20',57.48,57.48,57.48,'2020-05-21',1,58.54,58.54,1.84,1.06,'C','1','2021-04-14 13:49:19'),(85,1,8,'ELET3',1,'2020-05-20',24.29,24.29,24.29,'2020-05-22',1,24.13,24.13,-0.66,-0.16,'C','2','2021-04-14 13:50:00'),(86,1,8,'ELET3',2,'2020-05-20',23.73,47.46,23.73,'2020-05-22',2,24.13,48.26,1.69,0.80,'C','2','2021-04-14 13:50:26'),(87,1,8,'ELET3',2,'2020-05-20',23.63,47.26,23.63,'2020-05-22',2,24.13,48.26,2.12,1.00,'C','2','2021-04-14 13:50:49'),(88,1,5,'PETR3',1,'2020-05-20',20.16,20.16,20.16,'2020-05-25',1,20.38,20.38,1.09,0.22,'C','1','2021-04-14 13:52:14'),(89,1,7,'KLBN11',2,'2020-05-20',20.18,40.36,20.18,'2020-07-01',2,20.20,40.40,0.10,0.04,'C','2','2021-04-14 13:52:57'),(90,1,7,'KLBN11',1,'2020-05-20',19.55,19.55,19.55,'2020-07-01',1,20.20,20.20,3.32,0.65,'C','2','2021-04-14 13:53:18'),(95,1,4,'MGLU3',2,'2020-05-21',57.75,115.50,57.75,'2020-05-21',2,58.54,117.08,1.37,1.58,'C','2','2021-04-14 13:57:47'),(96,1,8,'ELET3',2,'2020-05-21',23.35,46.70,23.35,'2020-05-20',2,24.13,48.26,3.34,1.56,'C','2','2021-04-14 13:58:23'),(97,1,12,'PETR4',2,'2020-05-21',19.56,39.12,19.56,'2020-05-25',2,19.54,39.08,-0.10,-0.04,'C','1','2021-04-14 13:59:46'),(98,1,12,'PETR4',2,'2020-05-21',19.30,38.60,19.30,'2020-05-25',2,19.54,39.08,1.24,0.48,'C','1','2021-04-14 14:00:10'),(99,1,5,'PETR3',2,'2020-05-21',19.92,39.84,19.92,'2020-05-25',2,20.38,40.76,2.31,0.92,'C','1','2021-04-14 14:00:34'),(100,1,10,'EMBR3',1,'2020-05-21',6.52,6.52,6.52,'2020-05-25',1,6.92,6.92,6.13,0.40,'C','1','2021-04-14 14:01:39'),(101,1,3,'ABEV3',4,'2020-05-21',11.86,47.44,11.86,'2020-05-25',4,12.12,48.48,2.19,1.04,'C','1','2021-04-14 14:02:30'),(102,1,3,'ABEV3',1,'2020-05-21',11.82,11.82,11.82,'2020-05-25',1,12.12,12.12,2.54,0.30,'C','1','2021-04-14 14:02:51'),(103,1,7,'KLBN11',2,'2020-05-21',19.51,39.02,19.51,'2020-07-01',2,20.20,40.40,3.54,1.38,'C','1','2021-04-14 14:03:19'),(104,1,7,'KLBN11',2,'2020-05-21',19.15,38.30,19.15,'2020-07-01',2,20.20,40.40,5.48,2.10,'C','1','2021-04-14 14:03:38'),(105,1,9,'AZUL4',2,'2020-05-21',16.17,32.34,16.17,'2020-06-02',2,16.25,32.50,0.49,0.16,'C','1','2021-04-14 14:04:10'),(106,1,9,'AZUL4',2,'2020-05-21',15.57,31.14,15.57,'2020-06-02',2,16.25,32.50,4.37,1.36,'C','1','2021-04-14 14:04:34'),(108,1,12,'PETR4',2,'2020-05-22',18.61,37.22,18.61,'2020-05-25',2,19.54,39.08,5.00,1.86,'C','1','2021-04-14 14:06:15'),(109,1,5,'PETR3',2,'2020-05-21',19.53,39.06,19.53,'2020-05-25',2,20.38,40.76,4.35,1.70,'C','1','2021-04-14 14:06:40'),(110,1,9,'AZUL4',6,'2020-05-21',14.84,89.04,14.84,'2020-06-02',6,16.25,97.50,9.50,8.46,'C','1','2021-04-14 14:07:04'),(112,1,11,'SUZB3',2,'2020-05-25',37.84,75.68,37.84,'2020-05-27',2,38.64,77.28,2.11,1.60,'C','1','2021-04-15 07:25:59'),(113,1,11,'SUZB3',4,'2020-05-25',37.87,151.48,37.87,'2020-05-27',4,38.64,154.56,2.03,3.08,'C','1','2021-04-15 07:31:54'),(114,1,11,'SUZB3',1,'2020-05-25',37.86,37.86,37.86,'2020-05-27',1,38.64,38.64,2.06,0.78,'C','1','2021-04-15 07:32:26'),(115,1,11,'SUZB3',3,'2020-05-25',37.86,113.58,37.86,'2020-05-27',3,38.83,116.49,2.56,2.91,'C','1','2021-04-15 07:32:52'),(116,1,7,'KLBN11',4,'2020-05-25',18.87,75.48,18.87,'2020-07-01',4,20.20,80.80,7.05,5.32,'C','1','2021-04-15 07:33:50'),(117,1,9,'AZUL4',8,'2020-05-25',14.78,118.24,14.78,'2020-06-02',8,16.50,132.00,11.64,13.76,'C','1','2021-04-15 07:34:35'),(118,1,9,'AZUL4',2,'2020-05-25',15.32,30.64,15.32,'2020-06-02',2,16.50,33.00,7.70,2.36,'C','1','2021-04-15 07:35:42'),(123,1,11,'SUZB3',4,'2020-05-26',37.10,148.40,37.10,'2020-05-27',4,38.83,155.32,4.66,6.92,'C','1','2021-04-15 07:52:02'),(124,1,10,'EMBR3',2,'2020-05-26',6.93,13.86,6.93,'2020-05-27',2,7.02,14.04,1.30,0.18,'C','2','2021-04-15 07:56:51'),(125,1,10,'EMBR3',10,'2020-05-26',6.68,66.80,6.68,'2020-05-27',10,7.02,70.20,5.09,3.40,'C','2','2021-04-15 07:57:18'),(126,1,13,'SBSP3',2,'2020-05-27',51.98,103.96,51.98,'2020-05-27',2,53.50,107.00,2.92,3.04,'C','2','2021-04-15 07:58:37'),(127,1,10,'EMBR3',2,'2020-05-27',7.09,14.18,7.09,'2020-05-27',2,7.24,14.48,2.12,0.30,'C','2','2021-04-15 07:59:34'),(128,1,13,'SBSP3',1,'2020-05-27',53.02,53.02,53.02,'2020-05-28',1,53.50,53.50,0.91,0.48,'C','2','2021-04-15 08:00:20'),(129,1,12,'PETR4',2,'2020-05-27',19.52,39.04,19.52,'2020-05-29',2,19.89,39.78,1.90,0.74,'C','1','2021-04-15 08:00:50'),(130,1,8,'ELET3',1,'2020-05-27',28.90,28.90,28.90,'2020-06-01',1,29.20,29.20,1.04,0.30,'C','1','2021-04-15 08:01:34'),(131,1,8,'ELET3',2,'2020-05-27',28.77,57.54,28.77,'2020-06-01',2,29.20,58.40,1.49,0.86,'C','1','2021-04-15 08:01:58'),(132,1,9,'AZUL4',4,'2020-05-27',14.64,58.56,14.64,'2020-06-02',4,16.50,66.00,12.70,7.44,'C','1','2021-04-15 08:03:05'),(133,1,9,'AZUL4',4,'2020-05-27',14.39,57.56,14.39,'2020-06-02',4,16.50,66.00,14.66,8.44,'C','1','2021-04-15 08:03:36'),(134,1,9,'AZUL4',4,'2020-05-27',14.55,58.20,14.55,'2020-06-02',4,16.50,66.00,13.40,7.80,'C','1','2021-04-15 08:04:02'),(135,1,4,'MGLU3',1,'2020-05-27',67.17,67.17,67.17,'2020-06-17',1,67.20,67.20,0.04,0.03,'C','1','2021-04-15 08:04:36'),(136,1,5,'PETR3',2,'2020-05-27',20.34,40.68,20.34,'2020-05-28',2,20.79,41.58,2.21,0.90,'C','1','2021-04-15 08:05:05'),(142,1,13,'SBSP3',1,'2020-05-28',51.84,51.84,51.84,'2020-05-28',1,53.50,53.50,3.20,1.66,'C','2','2021-04-15 08:34:59'),(143,1,14,'JBSS3',1,'2020-05-28',21.84,21.84,21.84,'2020-05-29',1,22.00,22.00,0.73,0.16,'C','1','2021-04-15 08:36:17'),(144,1,10,'EMBR3',5,'2020-05-28',7.08,35.40,7.08,'2020-05-29',5,7.70,38.50,8.76,3.10,'C','2','2021-04-15 08:36:59'),(145,1,3,'ABEV3',1,'2020-05-28',13.31,13.31,13.31,'2020-06-02',1,13.20,13.20,-0.83,-0.11,'C','1','2021-04-15 08:37:31'),(146,1,3,'ABEV3',2,'2020-05-28',13.10,26.20,13.10,'2020-06-02',2,13.20,26.40,0.76,0.20,'C','1','2021-04-15 08:38:00'),(147,1,4,'MGLU3',1,'2020-05-28',65.15,65.15,65.15,'2020-06-17',1,67.20,67.20,3.15,2.05,'C','1','2021-04-15 08:39:02'),(148,1,11,'SUZB3',2,'2020-05-28',38.91,77.82,38.91,'2020-06-17',2,38.85,77.70,-0.15,-0.12,'C','1','2021-04-15 08:39:43'),(150,1,10,'EMBR3',2,'2020-05-29',7.36,14.72,7.36,'2020-05-29',2,7.47,14.94,1.49,0.22,'C','2','2021-04-20 17:57:36'),(151,1,13,'SBSP3',2,'2020-05-29',51.80,103.60,51.80,'2020-05-29',2,53.00,106.00,2.32,2.40,'C','1','2021-04-15 08:49:06'),(152,1,10,'EMBR3',2,'2020-05-29',6.94,13.88,6.94,'2020-05-29',2,7.80,15.60,12.39,1.72,'C','2','2021-04-15 08:50:01'),(153,1,10,'EMBR3',2,'2020-05-29',7.58,15.16,7.58,'2020-05-29',2,7.47,14.94,-1.45,-0.22,'C','2','2021-04-15 08:50:21'),(154,1,10,'EMBR3',2,'2020-05-29',7.36,29.44,7.36,'2020-05-29',2,8.10,16.20,10.05,1.48,'C','1','2021-04-15 08:51:06'),(155,1,8,'ELET3',2,'2020-05-29',27.90,55.80,27.90,'2020-06-01',2,29.20,58.40,4.66,2.60,'C','1','2021-04-15 08:57:29'),(156,1,10,'EMBR3',4,'2020-05-29',7.48,29.92,7.48,'2020-06-02',4,8.10,32.40,8.29,2.48,'C','2','2021-04-15 08:58:45'),(157,1,10,'EMBR3',6,'2020-05-29',7.48,44.88,7.48,'2020-06-02',6,8.10,48.60,8.29,3.72,'C','1','2021-04-15 08:59:10'),(158,1,3,'ABEV3',3,'2020-05-29',12.30,36.90,12.30,'2020-06-02',3,13.20,39.60,7.32,2.70,'C','1','2021-04-15 08:59:49'),(159,1,11,'SUZB3',2,'2020-05-29',37.61,75.22,37.61,'2020-06-17',2,38.85,77.70,3.30,2.48,'C','1','2021-04-15 09:03:00'),(160,1,4,'MGLU3',2,'2020-05-29',64.32,128.64,64.32,'2020-06-17',2,67.20,134.40,4.48,5.76,'C','1','2021-04-15 09:07:18'),(167,1,10,'EMBR3',5,'2020-06-01',7.25,36.25,7.25,'2020-06-02',5,8.10,40.50,11.72,4.25,'C','1','2021-04-15 09:31:40'),(168,1,4,'MGLU3',1,'2020-06-01',64.20,64.20,64.20,'2020-06-17',1,67.20,67.20,4.67,3.00,'C','1','2021-04-15 09:32:15'),(171,1,15,'COGN3',2,'2020-06-02',6.23,12.46,6.23,'2020-06-04',2,6.79,13.58,8.99,1.12,'C','1','2021-04-15 09:37:30'),(172,1,4,'MGLU3',1,'2020-06-02',63.75,63.75,63.75,'2020-06-17',1,67.20,67.20,5.41,3.45,'C','1','2021-04-15 09:37:59'),(173,1,4,'MGLU3',1,'2020-06-02',63.44,63.44,63.44,'2020-06-17',1,67.20,67.20,5.93,3.76,'C','1','2021-04-15 09:38:21'),(174,1,13,'SBSP3',2,'2020-06-02',54.21,108.42,54.21,'2020-06-17',2,56.10,112.20,3.49,3.78,'C','1','2021-04-15 09:38:59'),(177,1,9,'AZUL4',1,'2020-06-04',18.79,37.58,18.79,'2020-06-08',1,25.50,25.50,35.71,6.71,'C','1','2021-04-15 09:50:30'),(179,1,16,'TPIS3',10,'2020-06-03',1.20,12.00,1.20,'2020-06-08',10,1.25,12.50,4.17,0.50,'C','1','2021-04-15 09:48:10'),(180,1,11,'SUZB3',2,'2020-06-03',37.92,75.84,37.92,'2020-06-17',2,38.85,77.70,2.45,1.86,'C','1','2021-04-15 09:48:54'),(181,1,13,'SBSP3',2,'2020-06-03',54.90,109.80,54.90,'2020-06-17',2,56.10,112.20,2.19,2.40,'C','1','2021-04-15 09:49:21'),(182,1,9,'AZUL4',1,'2020-06-04',18.79,37.58,18.79,'2020-06-08',1,26.25,26.25,39.70,7.46,'C','1','2021-04-15 09:50:30'),(183,1,17,'GOLL4',2,'2020-06-04',17.21,34.42,17.21,'2020-06-08',2,21.40,42.80,24.35,8.38,'C','1','2021-04-15 09:51:30'),(184,1,17,'GOLL4',1,'2020-06-04',17.18,17.18,17.18,'2020-06-08',1,21.40,21.40,24.56,4.22,'C','1','2021-04-15 09:51:58'),(185,1,17,'GOLL4',2,'2020-06-04',16.95,33.90,16.95,'2020-06-08',2,23.05,46.10,35.99,12.20,'C','1','2021-04-15 09:52:22'),(186,1,17,'GOLL4',1,'2020-06-04',17.18,17.18,17.18,'2020-06-08',1,23.17,23.17,34.87,5.99,'C','1','2021-04-15 09:52:48'),(187,1,4,'MGLU3',1,'2020-06-04',61.88,61.88,61.88,'2020-06-17',1,67.20,67.20,8.60,5.32,'C','1','2021-04-15 09:53:15'),(189,1,13,'SBSP3',2,'2020-06-05',53.20,106.40,53.20,'2020-06-17',2,56.10,112.20,5.45,5.80,'C','1','2021-04-15 09:55:21'),(190,1,11,'SUZB3',2,'2020-06-08',38.05,76.10,38.05,'2020-06-17',2,38.85,77.70,2.10,1.60,'C','1','2021-04-15 09:55:54'),(191,1,11,'SUZB3',2,'2020-06-08',37.70,75.40,37.70,'2020-06-17',2,38.85,77.70,3.05,2.30,'C','1','2021-04-15 09:56:31'),(192,1,8,'ELET3',2,'2020-06-08',30.05,60.10,30.05,'2020-06-17',2,31.81,63.62,5.86,3.52,'C','1','2021-04-15 09:57:10'),(199,1,8,'ELET3',2,'2020-06-09',30.28,60.56,30.28,'2020-06-17',2,32.05,64.10,5.85,3.54,'C','1','2021-04-15 10:40:54'),(200,1,17,'GOLL4',2,'2020-06-09',22.70,45.40,22.70,'2020-06-10',2,20.65,41.30,-9.03,-4.10,'C','1','2021-04-15 10:41:47'),(201,1,10,'EMBR3',2,'2020-06-09',10.19,20.38,10.19,'2020-12-03',2,8.80,17.60,-13.64,-2.78,'C','1','2021-04-15 10:43:11'),(202,1,17,'GOLL4',2,'2020-06-10',23.80,47.60,23.80,'2020-06-10',2,20.65,41.30,-13.24,-6.30,'C','1','2021-04-15 10:43:42'),(203,1,9,'AZUL4',2,'2020-06-10',26.32,52.64,26.32,'2020-08-12',2,24.40,48.80,-7.29,-3.84,'C','1','2021-04-15 10:44:09'),(204,1,10,'EMBR3',1,'2020-06-10',9.52,9.52,9.52,'2020-12-03',1,8.80,8.80,-7.56,-0.72,'C','1','2021-04-15 10:44:49'),(205,1,18,'AMAR3',5,'2020-06-12',8.50,42.50,8.50,'2020-07-07',5,9.05,45.25,6.47,2.75,'C','1','2021-04-15 10:47:51'),(206,1,17,'GOLL4',5,'2020-06-12',18.23,91.15,18.23,'2020-06-15',5,21.97,109.85,20.52,18.70,'C','1','2021-04-15 10:48:17'),(207,1,9,'AZUL4',2,'2020-06-12',21.50,43.00,21.50,'2020-08-12',2,24.40,48.80,13.49,5.80,'C','1','2021-04-15 10:49:02'),(208,1,10,'EMBR3',5,'2020-06-12',8.55,42.75,8.55,'2020-12-03',5,8.80,44.00,2.92,1.25,'C','1','2021-04-15 10:49:29'),(209,1,18,'AMAR3',5,'2020-06-17',8.54,42.70,8.54,'2020-07-10',5,8.96,44.80,4.92,2.10,'C','1','2021-04-15 10:50:13'),(210,1,17,'GOLL4',5,'2020-06-17',18.73,93.65,18.73,'2020-06-15',5,21.97,109.85,17.30,16.20,'C','1','2021-04-15 10:50:35'),(211,1,9,'AZUL4',5,'2020-06-17',22.99,114.95,22.99,'2020-08-12',5,24.40,122.00,6.13,7.05,'C','1','2021-04-15 10:51:01'),(212,1,10,'EMBR3',5,'2020-06-17',8.82,44.10,8.82,'2020-12-03',5,8.80,44.00,-0.23,-0.10,'C','1','2021-04-15 10:51:23'),(216,1,8,'ELET3',1,'2020-06-18',30.15,30.15,30.15,'2020-06-30',1,31.45,31.45,4.31,1.30,'C','1','2021-04-15 11:04:53'),(218,1,8,'ELET3',4,'2020-06-18',30.15,120.60,30.15,'2020-06-30',4,31.45,125.80,4.31,5.20,'C','1','2021-04-15 11:04:53'),(219,1,3,'ABEV3',3,'2020-06-18',13.78,41.34,13.78,'2020-07-01',3,14.06,42.18,2.03,0.84,'C','1','2021-04-15 11:05:23'),(220,1,8,'ELET3',5,'2020-06-19',30.25,151.25,30.25,'2020-06-30',5,31.45,157.25,3.97,6.00,'C','1','2021-04-15 11:11:23'),(221,1,9,'AZUL4',5,'2020-06-22',21.15,105.75,21.15,'2020-08-12',5,24.50,122.50,15.84,16.75,'C','1','2021-04-15 11:11:58'),(222,1,17,'GOLL4',5,'2020-06-22',18.57,92.85,18.57,'2020-09-04',5,19.80,99.00,6.62,6.15,'C','1','2021-04-15 11:12:34'),(223,1,10,'EMBR3',5,'2020-06-22',8.45,42.25,8.45,'2020-12-03',5,8.80,44.00,4.14,1.75,'C','1','2021-04-15 11:13:18'),(224,1,9,'AZUL4',5,'2020-06-23',21.08,105.40,21.08,'2020-08-12',5,24.50,122.50,16.22,17.10,'C','1','2021-04-15 11:14:06'),(225,1,17,'GOLL4',5,'2020-06-23',18.57,92.85,18.57,'2020-09-04',5,19.80,99.00,6.62,6.15,'C','1','2021-04-15 11:14:29'),(226,1,10,'EMBR3',5,'2020-06-23',8.58,42.90,8.58,'2020-12-03',5,8.80,44.00,2.56,1.10,'C','1','2021-04-15 11:14:55'),(227,1,3,'ABEV3',5,'2020-06-24',13.58,67.90,13.58,'2020-07-01',5,14.06,70.30,3.53,2.40,'C','1','2021-04-15 11:16:44'),(228,1,8,'ELET3',2,'2020-06-25',30.00,60.00,30.00,'2020-06-30',2,31.50,63.00,5.00,3.00,'C','1','2021-04-15 11:17:08'),(229,1,9,'AZUL4',5,'2020-06-25',21.03,105.15,21.03,'2020-08-12',5,24.50,122.50,16.50,17.35,'C','1','2021-04-15 11:17:43'),(230,1,10,'EMBR3',5,'2020-06-28',8.11,40.55,8.11,'2020-12-03',5,8.80,44.00,8.51,3.45,'C','1','2021-04-15 11:18:14'),(233,1,3,'ABEV3',8,'2020-07-01',14.54,116.32,14.80,'2020-07-01',8,14.51,116.08,-0.21,-0.24,'C','1','2021-04-15 11:29:44'),(234,1,10,'EMBR3',3,'2020-07-01',8.11,24.33,8.11,'2020-12-03',3,8.80,26.40,8.51,2.07,'C','1','2021-04-15 11:30:34'),(238,1,10,'EMBR3',4,'2020-07-09',8.10,32.40,8.10,'2020-12-03',4,8.80,35.20,8.64,2.80,'C','1','2021-04-15 13:59:01'),(239,1,8,'ELET3',1,'2020-07-10',35.88,35.88,35.88,'2020-07-27',1,39.10,39.10,8.97,3.22,'C','1','2021-04-15 13:59:33'),(240,1,19,'ETER3',5,'2020-07-10',4.24,21.20,4.24,'2020-07-16',5,4.48,22.40,5.66,1.20,'C','1','2021-04-15 14:01:01'),(243,1,8,'ELET3',2,'2020-07-13',35.83,71.66,35.83,'2020-07-27',2,39.10,78.20,9.13,6.54,'C','1','2021-04-15 14:04:11'),(244,1,8,'ELET3',2,'2020-07-13',35.67,71.34,35.67,'2020-07-27',2,39.10,78.20,9.62,6.86,'C','1','2021-04-15 14:04:29'),(245,1,10,'EMBR3',5,'2020-07-13',8.09,40.45,8.09,'2020-12-03',5,8.80,44.00,8.78,3.55,'C','1','2021-04-15 14:05:20'),(246,1,19,'ETER3',5,'2020-07-13',4.16,20.80,4.16,'2020-07-16',5,4.48,22.40,7.69,1.60,'C','1','2021-04-15 14:06:00'),(247,1,19,'ETER3',5,'2020-07-13',4.02,20.10,4.02,'2020-07-16',5,4.48,22.40,11.44,2.30,'C','1','2021-04-15 14:06:22'),(248,1,15,'COGN3',2,'2020-07-14',8.89,17.78,8.89,'2020-07-16',2,9.10,18.20,2.36,0.42,'C','1','2021-04-15 14:06:53'),(249,1,3,'ABEV3',4,'2020-07-14',13.87,55.48,13.87,'2020-07-22',4,15.00,60.00,8.15,4.52,'C','1','2021-04-15 14:07:21'),(250,1,19,'ETER3',5,'2020-07-14',3.95,19.75,3.95,'2020-07-16',5,4.48,22.40,13.42,2.65,'C','1','2021-04-15 14:07:40'),(251,1,15,'COGN3',20,'2020-07-15',8.66,173.20,8.66,'2020-07-16',20,9.10,182.00,5.08,8.80,'C','1','2021-04-15 14:08:04'),(253,1,8,'ELET3',2,'2020-07-16',35.24,70.48,35.24,'2020-07-27',2,39.10,78.20,10.95,7.72,'C','1','2021-04-15 14:10:28'),(254,1,20,'LUPA3',10,'2020-07-16',2.57,25.70,2.57,'2020-06-30',10,2.43,24.30,-5.45,-1.40,'C','1','2021-04-15 14:11:36'),(255,1,20,'LUPA3',99,'2020-07-20',2.56,253.44,2.56,'2020-08-24',99,2.33,230.67,-8.98,-22.77,'C','1','2021-04-15 14:12:06'),(256,1,19,'ETER3',10,'2020-07-21',5.50,55.00,5.50,'2020-09-08',10,5.30,53.00,-3.64,-2.00,'C','1','2021-04-15 14:12:41'),(259,1,20,'LUPA3',5,'2020-07-23',2.42,12.10,2.42,'2020-12-14',5,2.60,13.00,7.44,0.90,'C','1','2021-04-21 01:17:21'),(260,1,15,'COGN3',5,'2020-07-23',8.80,44.00,8.80,'2020-07-28',5,9.06,45.30,2.95,1.30,'C','1','2021-04-15 14:17:09'),(261,1,20,'LUPA3',45,'2020-07-23',2.42,121.00,2.42,'2020-07-30',45,2.15,96.75,-11.16,-12.15,'C','1','2021-04-15 14:18:15'),(262,1,15,'COGN3',2,'2020-07-27',8.11,16.22,8.11,'2020-07-28',2,9.06,18.12,11.71,1.90,'C','1','2021-04-15 14:19:02'),(263,1,18,'AMAR3',10,'2020-07-27',8.14,81.40,8.14,'2020-08-25',10,8.25,82.50,1.35,1.10,'C','1','2021-04-15 14:19:26'),(264,1,19,'ETER3',10,'2020-07-27',5.24,52.40,5.24,'2020-09-08',10,5.30,53.00,1.15,0.60,'C','1','2021-04-15 14:20:06'),(265,1,20,'LUPA3',50,'2020-07-27',2.24,112.00,2.24,'2020-12-14',50,2.60,130.00,16.07,18.00,'C','1','2021-04-15 14:20:30'),(267,1,15,'COGN3',7,'2020-07-28',9.01,63.07,9.01,'2020-07-28',7,9.06,63.42,0.55,0.35,'C','1','2021-04-15 14:22:52'),(268,1,21,'VVAR3',5,'2020-07-28',19.00,95.00,19.00,'2020-11-26',5,19.15,95.75,0.79,0.75,'C','1','2021-04-15 14:25:50'),(269,1,18,'AMAR3',10,'2020-07-28',7.82,78.20,7.82,'2020-08-25',10,8.25,82.50,5.50,4.30,'C','1','2021-04-15 14:26:25'),(270,1,19,'ETER3',5,'2020-07-28',5.19,25.95,5.19,'2020-09-08',5,5.30,26.50,2.12,0.55,'C','1','2021-04-15 14:26:51'),(273,1,19,'ETER3',10,'2020-08-03',4.95,49.50,4.95,'2020-09-08',10,5.30,53.00,7.07,3.50,'C','1','2021-04-15 14:32:53'),(274,1,3,'ABEV3',5,'2020-08-03',13.91,69.55,13.91,'2020-09-17',5,13.12,65.60,-5.68,-3.95,'C','1','2021-04-15 14:33:11'),(275,1,15,'COGN3',15,'2020-08-03',7.75,116.25,7.75,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:33:46'),(276,1,19,'ETER3',2,'2020-08-04',4.70,9.40,4.70,'2020-09-08',2,5.30,10.60,12.77,1.20,'C','1','2021-04-15 14:34:19'),(277,1,8,'ELET3',2,'2020-08-12',35.60,71.20,35.60,'2020-08-21',2,34.40,68.80,-3.37,-2.40,'C','1','2021-04-15 14:34:49'),(278,1,3,'ABEV3',5,'2020-08-12',13.37,66.85,13.37,'2020-09-17',5,13.12,65.60,-1.87,-1.25,'C','1','2021-04-15 14:35:15'),(279,1,15,'COGN3',15,'2020-08-12',7.24,108.60,7.24,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:35:47'),(281,1,8,'ELET3',2,'2020-08-13',34.24,68.48,34.24,'2020-08-21',2,34.40,68.80,0.47,0.32,'C','1','2021-04-15 14:38:06'),(282,1,15,'COGN3',15,'2020-08-13',7.08,106.20,7.08,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:38:24'),(283,1,8,'ELET3',2,'2020-08-14',33.50,67.00,33.50,'2020-08-21',2,34.40,68.80,2.69,1.80,'C','1','2021-04-15 14:38:46'),(284,1,8,'ELET3',3,'2020-08-17',31.60,94.80,31.60,'2020-08-21',3,34.40,103.20,8.86,8.40,'C','1','2021-04-15 14:39:03'),(285,1,22,'TIET11',20,'2020-08-19',14.67,293.40,14.67,'2020-08-25',20,15.20,304.00,3.61,10.60,'C','1','2021-04-15 14:40:05'),(286,1,23,'BBSE3',10,'2020-08-19',26.66,266.60,26.66,'2020-08-28',10,27.47,274.70,3.04,8.10,'C','1','2021-04-15 14:40:59'),(287,1,17,'GOLL4',10,'2020-08-19',18.57,185.70,18.57,'2020-09-04',10,19.80,198.00,6.62,12.30,'C','1','2021-04-15 14:41:25'),(288,1,24,'TAEE11',4,'2020-08-19',28.30,113.20,28.30,'2020-09-08',4,28.85,115.40,1.94,2.20,'C','1','2021-04-15 14:42:33'),(289,1,25,'TAEE4',6,'2020-08-19',9.50,57.00,9.50,'2020-11-05',6,9.95,59.70,4.74,2.70,'C','1','2021-04-15 14:43:40'),(290,1,15,'COGN3',15,'2020-08-19',6.87,103.05,6.87,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:44:00'),(291,1,23,'BBSE3',10,'2020-08-20',26.31,263.10,26.31,'2020-08-28',10,27.55,275.50,4.71,12.40,'C','1','2021-04-15 14:45:15'),(292,1,3,'ABEV3',10,'2020-08-21',12.77,127.70,12.77,'2020-09-17',10,13.12,131.20,2.74,3.50,'C','1','2021-04-15 14:45:34'),(293,1,6,'SPRI3',10,'2020-08-21',11.30,113.00,11.30,'2020-11-28',10,10.51,105.10,-6.99,-7.90,'C','1','2021-04-15 14:46:58'),(296,1,24,'TAEE11',10,'2020-08-24',28.23,282.30,28.23,'2020-09-08',10,28.85,288.50,2.20,6.20,'C','1','2021-04-15 14:53:39'),(298,1,15,'COGN3',20,'2020-08-25',6.34,126.80,6.34,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:55:24'),(299,1,15,'COGN3',20,'2020-08-25',6.19,123.80,6.19,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:55:43'),(302,1,15,'COGN3',20,'2020-08-26',6.00,120.00,6.00,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 14:58:32'),(305,1,23,'BBSE3',2,'2020-08-31',26.90,53.80,26.90,'2020-09-03',2,27.80,55.60,3.35,1.80,'C','1','2021-04-15 15:00:40'),(306,1,25,'TAEE4',20,'2020-08-31',9.49,189.80,9.49,'2020-11-05',20,9.95,199.00,4.85,9.20,'C','1','2021-04-15 15:01:11'),(307,1,10,'EMBR3',20,'2020-08-31',7.40,148.00,7.40,'2020-12-03',20,8.80,176.00,18.92,28.00,'C','1','2021-04-15 15:01:34'),(308,1,15,'COGN3',20,'2020-08-31',5.92,118.40,5.92,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 15:02:01'),(311,1,21,'VVAR3',7,'2020-09-04',18.80,131.60,18.80,'2020-11-26',7,19.15,134.05,1.86,2.45,'C','1','2021-04-15 15:04:06'),(312,1,23,'BBSE3',5,'2020-09-04',26.80,134.00,26.80,'2020-11-09',5,26.75,133.75,-0.19,-0.25,'C','1','2021-04-15 15:04:22'),(314,1,3,'ABEV3',20,'2020-09-08',12.37,247.40,12.37,'2020-09-17',20,13.12,262.40,6.06,15.00,'C','1','2021-04-15 15:09:06'),(315,1,21,'VVAR3',10,'2020-09-08',18.19,181.90,18.19,'2020-11-26',10,19.15,191.50,5.28,9.60,'C','1','2021-04-15 15:09:29'),(316,1,23,'BBSE3',5,'2020-09-08',26.75,133.75,26.75,'2020-11-09',5,26.75,133.75,0.00,0.00,'C','1','2021-04-15 15:09:51'),(317,1,23,'BBSE3',5,'2020-09-08',26.55,132.75,26.55,'2020-11-09',5,26.75,133.75,0.75,1.00,'C','1','2021-04-15 15:10:06'),(320,1,21,'VVAR3',8,'2020-09-10',18.10,144.80,18.10,'2020-11-26',8,19.15,153.20,5.80,8.40,'C','1','2021-04-15 15:15:27'),(321,1,23,'BBSE3',2,'2020-09-10',26.35,52.70,26.35,'2020-11-09',2,26.75,53.50,1.52,0.80,'C','1','2021-04-15 15:15:41'),(322,1,26,'GUAR3',10,'2020-09-10',17.65,176.50,17.65,'2021-04-16',10,17.15,171.50,-2.83,-5.00,'C','1','2021-04-15 15:17:39'),(323,1,22,'TIET11',10,'2020-09-11',14.73,147.30,14.73,'2020-10-19',10,15.30,153.00,3.87,5.70,'C','1','2021-04-15 15:18:05'),(324,1,23,'BBSE3',5,'2020-09-11',25.72,257.20,25.72,'2020-11-09',5,26.75,133.75,4.00,5.15,'C','1','2021-04-15 15:18:26'),(325,1,26,'GUAR3',12,'2020-09-11',17.18,206.16,17.18,'2021-04-16',12,17.15,205.80,-0.17,-0.36,'C','1','2021-04-15 15:18:53'),(326,1,26,'GUAR3',30,'2020-09-17',16.77,503.10,16.77,'2021-04-16',30,17.15,514.50,2.27,11.40,'C','1','2021-04-15 15:22:45'),(327,1,23,'BBSE3',5,'2020-11-09',25.72,128.60,25.72,'2020-11-16',5,27.50,137.50,6.92,8.90,'C','1','2021-04-21 11:21:42'),(328,1,22,'TIET11',2,'2020-09-22',14.76,29.52,14.76,'2020-10-19',2,15.30,30.60,3.66,1.08,'C','1','2021-04-15 15:28:44'),(329,1,23,'BBSE3',15,'2020-09-22',25.30,379.50,25.30,'2020-11-16',15,27.50,412.50,8.70,33.00,'C','1','2021-04-15 15:29:03'),(330,1,26,'GUAR3',20,'2020-09-22',15.53,310.60,15.53,'2021-04-16',20,17.15,343.00,10.43,32.40,'C','1','2021-04-15 15:30:04'),(331,1,26,'GUAR3',33,'2020-10-09',14.16,467.28,14.16,'2021-04-16',33,17.15,565.95,21.12,98.67,'C','1','2021-04-15 15:30:37'),(334,1,21,'VVAR3',10,'2020-10-27',19.00,190.00,19.00,'2020-11-26',10,19.15,191.50,0.79,1.50,'C','1','2021-04-15 15:34:16'),(336,1,21,'VVAR3',10,'2020-11-09',18.80,188.00,18.80,'2020-11-26',10,19.15,191.50,1.86,3.50,'C','1','2021-04-15 15:36:21'),(337,1,21,'VVAR3',10,'2020-11-10',18.60,186.00,18.60,'2020-11-26',10,19.15,191.50,2.96,5.50,'C','1','2021-04-15 15:36:58'),(338,1,21,'VVAR3',10,'2020-11-10',18.20,182.00,18.20,'2020-11-26',10,19.15,191.50,5.22,9.50,'C','1','2021-04-15 15:39:17'),(340,1,21,'VVAR3',7,'2020-11-12',18.00,126.00,18.00,'2020-11-26',7,19.15,134.05,6.39,8.05,'C','1','2021-04-15 15:44:24'),(341,1,22,'TIET11',10,'2020-11-12',15.50,155.00,15.50,'2020-11-26',10,16.10,161.00,3.87,6.00,'C','1','2021-04-15 15:44:47'),(342,1,21,'VVAR3',20,'2020-11-16',17.70,354.00,17.70,'2020-11-26',20,19.15,383.00,8.19,29.00,'C','1','2021-04-15 15:45:17'),(346,1,21,'VVAR3',10,'2020-11-27',18.50,185.00,18.50,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 16:10:37'),(348,1,3,'ABEV3',10,'2020-11-30',14.20,142.00,14.20,'2020-12-02',10,14.90,149.00,4.93,7.00,'C','1','2021-04-15 16:15:04'),(349,1,21,'VVAR3',10,'2020-11-30',17.90,179.00,17.90,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 16:15:33'),(350,1,21,'VVAR3',10,'2020-11-30',17.65,176.50,17.65,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 16:15:52'),(351,1,27,'TOTS3',10,'2020-12-01',25.70,257.00,25.70,'2020-12-16',10,26.70,267.00,3.89,10.00,'C','1','2021-04-15 16:17:20'),(352,1,21,'VVAR3',30,'2020-12-01',17.15,514.50,17.15,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 16:18:12'),(353,1,3,'ABEV3',10,'2020-12-03',14.60,146.00,14.60,'2020-12-10',10,15.60,156.00,6.85,10.00,'C','1','2021-04-15 16:18:28'),(354,1,27,'TOTS3',10,'2020-12-03',25.05,250.50,25.05,'2020-12-16',10,26.70,267.00,6.59,16.50,'C','1','2021-04-15 16:19:03'),(360,1,17,'GOLL4',10,'2020-12-17',26.10,261.00,26.10,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:04:09'),(361,1,23,'BBSE3',10,'2020-12-18',29.50,295.00,29.50,'2021-01-14',10,30.30,303.00,2.71,8.00,'C','1','2021-04-15 17:04:31'),(362,1,17,'GOLL4',10,'2020-12-18',25.10,251.00,25.10,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:10:30'),(363,1,23,'BBSE3',10,'2021-01-07',28.40,284.00,28.40,'2021-01-14',10,30.30,303.00,6.69,19.00,'C','1','2021-04-15 17:11:05'),(364,1,21,'VVAR3',13,'2021-01-07',15.80,205.40,15.80,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:11:29'),(366,1,23,'BBSE3',10,'2021-01-18',29.05,290.50,29.05,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:16:40'),(367,1,25,'TAEE4',12,'2021-01-21',11.00,132.00,11.00,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:17:15'),(368,1,28,'TAEE3',49,'2021-01-21',10.98,538.02,10.98,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:17:37'),(369,1,17,'GOLL4',20,'2021-01-21',22.75,455.00,22.75,NULL,0,0.00,0.00,0.00,0.00,'C','1','2021-04-15 17:18:03'),(370,1,4,'MGLU3',0,NULL,0.00,0.00,0.00,NULL,0,0.00,0.00,0.00,0.00,NULL,NULL,'2021-04-30 18:23:02');
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

-- Dump completed on 2021-04-30 17:33:53
