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
-- Table structure for table `tb_buys`
--

DROP TABLE IF EXISTS `tb_buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_buys` (
  `idbuy` int(11) NOT NULL AUTO_INCREMENT,
  `idinvestiment` int(11) DEFAULT NULL,
  `idperson` int(11) NOT NULL,
  `sgcompany` varchar(20) NOT NULL,
  `qtdebuy` int(11) DEFAULT 0,
  `dtbuy` date DEFAULT NULL,
  `prcbuy` decimal(10,2) DEFAULT 0.00,
  `tlbuy` decimal(10,2) DEFAULT 0.00,
  `bprcaverage` decimal(10,2) DEFAULT 0.00,
  `btptransaction` char(1) DEFAULT NULL,
  `btipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idbuy`),
  KEY `FK_buys_investiments_idx` (`idinvestiment`),
  KEY `fk_buys_persons` (`idperson`),
  CONSTRAINT `FK_buys_investiments_idx` FOREIGN KEY (`idinvestiment`) REFERENCES `tb_investiments` (`idinvestiment`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_buys_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_buys`
--

LOCK TABLES `tb_buys` WRITE;
/*!40000 ALTER TABLE `tb_buys` DISABLE KEYS */;
INSERT INTO `tb_buys` VALUES (2,1,4,'MGLU3',2,'2020-04-24',47.14,94.28,47.14,'C','2','2021-05-05 11:41:09'),(3,3,4,'MGLU3',2,'2020-04-24',46.98,93.96,46.98,'C','2','2021-05-05 11:41:58'),(4,5,4,'MGLU3',2,'2020-04-24',46.95,93.90,46.95,'C','1','2021-05-05 11:41:58'),(5,7,5,'PETR3',2,'2020-04-27',16.45,32.90,16.45,'C','2','2021-05-05 11:41:58'),(6,9,4,'MGLU3',2,'2020-04-27',48.11,96.22,48.11,'C','2','2021-05-05 11:41:58'),(7,11,4,'MGLU3',2,'2020-04-27',48.54,97.08,48.54,'C','2','2021-05-05 11:41:58'),(8,13,4,'MGLU3',2,'2020-04-27',48.53,97.06,48.53,'C','2','2021-05-05 11:41:58'),(9,15,3,'ABEV3',2,'2020-04-27',11.63,23.26,11.63,'C','1','2021-05-05 11:41:58'),(10,17,6,'SPRI3',2,'2020-04-27',26.19,52.38,26.19,'C','1','2021-05-05 11:41:58'),(11,19,6,'SPRI3',2,'2020-04-27',25.59,51.18,25.59,'C','1','2021-05-05 11:41:58'),(12,20,3,'ABEV3',2,'2020-04-28',11.79,23.58,11.79,'C','1','2021-05-05 11:41:58'),(13,22,7,'KLBN11',2,'2020-04-28',18.09,36.18,18.09,'C','1','2021-05-05 11:41:58'),(14,23,3,'ABEV3',2,'2020-04-30',11.38,22.76,11.38,'C','1','2021-05-05 11:41:58'),(15,26,4,'MGLU3',1,'2020-05-05',51.77,51.77,51.77,'C','1','2021-05-05 11:41:58'),(16,27,5,'PETR3',2,'2020-05-06',18.34,36.68,18.34,'C','1','2021-05-05 11:41:58'),(17,28,7,'KLBN11',2,'2020-05-06',18.74,37.48,18.74,'C','1','2021-05-05 11:41:58'),(18,29,3,'ABEV3',2,'2020-05-06',12.00,24.00,12.00,'C','1','2021-05-05 11:41:58'),(19,30,5,'PETR3',2,'2020-05-06',18.28,36.56,18.28,'C','2','2021-05-05 11:41:58'),(20,31,4,'MGLU3',1,'2020-05-07',53.85,53.85,53.85,'C','2','2021-05-05 11:41:58'),(21,32,5,'PETR3',2,'2020-05-07',18.22,36.44,18.22,'C','2','2021-05-05 11:41:58'),(22,33,3,'ABEV3',2,'2020-05-07',11.72,23.44,11.72,'C','2','2021-05-05 11:41:58'),(23,34,3,'ABEV3',2,'2020-05-07',11.53,23.06,11.53,'C','1','2021-05-05 11:41:58'),(24,39,5,'PETR3',2,'2020-05-08',18.89,37.78,18.89,'C','1','2021-05-05 11:41:58'),(25,40,3,'ABEV3',2,'2020-05-08',11.80,23.60,11.80,'C','1','2021-05-05 11:41:58'),(26,41,3,'ABEV3',2,'2020-05-08',11.92,23.84,11.92,'C','1','2021-05-05 11:41:58'),(27,42,4,'MGLU3',1,'2020-05-08',55.70,55.70,55.70,'C','2','2021-05-05 11:41:58'),(28,48,4,'MGLU3',1,'2020-05-11',55.49,55.49,55.49,'C','1','2021-05-05 11:41:58'),(29,49,3,'ABEV3',2,'2020-05-11',12.21,24.42,12.21,'C','1','2021-05-05 11:41:58'),(30,50,8,'ELET3',2,'2020-05-12',22.74,45.48,22.74,'C','2','2021-05-05 11:41:58'),(31,51,8,'ELET3',2,'2020-05-12',22.30,44.60,22.30,'C','2','2021-05-05 11:41:58'),(32,52,8,'ELET3',2,'2020-05-12',21.94,43.88,21.94,'C','2','2021-05-05 11:41:58'),(33,53,4,'MGLU3',1,'2020-05-12',54.99,54.99,54.99,'C','2','2021-05-05 11:41:58'),(34,55,3,'ABEV3',3,'2020-05-13',11.65,34.95,11.65,'C','1','2021-05-05 11:41:58'),(35,56,8,'ELET3',2,'2020-05-15',22.97,45.94,22.97,'C','2','2021-05-05 11:41:58'),(36,58,3,'ABEV3',2,'2020-05-18',11.96,23.92,11.96,'C','2','2021-05-05 11:41:58'),(37,59,3,'ABEV3',2,'2020-05-18',12.39,24.78,12.39,'C','2','2021-05-05 11:41:58'),(38,60,4,'MGLU3',1,'2020-05-18',55.94,55.94,55.94,'C','2','2021-05-05 11:41:58'),(39,61,4,'MGLU3',1,'2020-05-18',55.61,55.61,55.61,'C','1','2021-05-05 11:41:58'),(40,62,7,'KLBN11',2,'2020-05-18',20.15,40.30,20.15,'C','1','2021-05-05 11:41:58'),(41,63,7,'KLBN11',2,'2020-05-18',19.99,39.98,19.99,'C','1','2021-05-05 11:41:58'),(42,64,7,'KLBN11',2,'2020-05-18',20.68,41.36,20.68,'C','2','2021-05-05 11:41:58'),(43,70,9,'AZUL4',2,'2020-05-19',13.76,27.52,13.76,'C','1','2021-05-05 11:41:58'),(44,71,7,'KLBN11',2,'2020-05-19',20.05,40.10,20.05,'C','2','2021-05-05 11:41:58'),(45,72,7,'KLBN11',2,'2020-05-19',20.07,40.14,20.07,'C','2','2021-05-05 11:41:58'),(46,73,8,'ELET3',1,'2020-05-19',24.18,24.18,24.18,'C','2','2021-05-05 11:41:58'),(47,74,8,'ELET3',2,'2020-05-19',23.84,47.68,23.84,'C','2','2021-05-05 11:41:58'),(48,75,8,'ELET3',2,'2020-05-19',23.86,47.72,23.86,'C','2','2021-05-05 11:41:58'),(49,76,9,'AZUL4',1,'2020-05-19',14.42,14.42,14.42,'C','1','2021-05-05 11:41:58'),(50,77,9,'AZUL4',2,'2020-05-19',13.71,27.42,13.71,'C','1','2021-05-05 11:41:58'),(51,78,3,'ABEV3',1,'2020-05-19',12.14,12.14,12.14,'C','1','2021-05-05 11:41:58'),(52,83,3,'ABEV3',2,'2020-05-20',11.96,23.92,11.96,'C','2','2021-05-05 11:41:58'),(53,84,4,'MGLU3',1,'2020-05-20',57.48,57.48,57.48,'C','1','2021-05-05 11:41:58'),(54,85,8,'ELET3',1,'2020-05-20',24.29,24.29,24.29,'C','2','2021-05-05 11:41:58'),(55,86,8,'ELET3',2,'2020-05-20',23.73,47.46,23.73,'C','2','2021-05-05 11:41:58'),(56,87,8,'ELET3',2,'2020-05-20',23.63,47.26,23.63,'C','2','2021-05-05 11:41:58'),(57,88,5,'PETR3',1,'2020-05-20',20.16,20.16,20.16,'C','1','2021-05-05 11:41:58'),(58,89,7,'KLBN11',2,'2020-05-20',20.18,40.36,20.18,'C','2','2021-05-05 11:41:58'),(59,90,7,'KLBN11',1,'2020-05-20',19.55,19.55,19.55,'C','2','2021-05-05 11:41:58'),(60,95,4,'MGLU3',2,'2020-05-21',57.75,115.50,57.75,'C','2','2021-05-05 11:41:58'),(61,96,8,'ELET3',2,'2020-05-21',23.35,46.70,23.35,'C','2','2021-05-05 11:41:58'),(62,97,12,'PETR4',2,'2020-05-21',19.56,39.12,19.56,'C','1','2021-05-05 11:41:58'),(63,98,12,'PETR4',2,'2020-05-21',19.30,38.60,19.30,'C','1','2021-05-05 11:41:58'),(64,99,5,'PETR3',2,'2020-05-21',19.92,39.84,19.92,'C','1','2021-05-05 11:41:58'),(65,100,10,'EMBR3',1,'2020-05-21',6.52,6.52,6.52,'C','1','2021-05-05 11:41:58'),(66,101,3,'ABEV3',4,'2020-05-21',11.86,47.44,11.86,'C','1','2021-05-05 11:41:58'),(67,102,3,'ABEV3',1,'2020-05-21',11.82,11.82,11.82,'C','1','2021-05-05 11:41:58'),(68,103,7,'KLBN11',2,'2020-05-21',19.51,39.02,19.51,'C','1','2021-05-05 11:41:58'),(69,104,7,'KLBN11',2,'2020-05-21',19.15,38.30,19.15,'C','1','2021-05-05 11:41:58'),(70,105,9,'AZUL4',2,'2020-05-21',16.17,32.34,16.17,'C','1','2021-05-05 11:41:58'),(71,106,9,'AZUL4',2,'2020-05-21',15.57,31.14,15.57,'C','1','2021-05-05 11:41:58'),(72,108,12,'PETR4',2,'2020-05-22',18.61,37.22,18.61,'C','1','2021-05-05 11:41:58'),(73,109,5,'PETR3',2,'2020-05-21',19.53,39.06,19.53,'C','1','2021-05-05 11:41:59'),(74,110,9,'AZUL4',6,'2020-05-21',14.84,89.04,14.84,'C','1','2021-05-05 11:41:59'),(75,112,11,'SUZB3',2,'2020-05-25',37.84,75.68,37.84,'C','1','2021-05-05 11:41:59'),(76,113,11,'SUZB3',4,'2020-05-25',37.87,151.48,37.87,'C','1','2021-05-05 11:41:59'),(77,114,11,'SUZB3',1,'2020-05-25',37.86,37.86,37.86,'C','1','2021-05-05 11:41:59'),(78,115,11,'SUZB3',3,'2020-05-25',37.86,113.58,37.86,'C','1','2021-05-05 11:41:59'),(79,116,7,'KLBN11',4,'2020-05-25',18.87,75.48,18.87,'C','1','2021-05-05 11:41:59'),(80,117,9,'AZUL4',8,'2020-05-25',14.78,118.24,14.78,'C','1','2021-05-05 11:41:59'),(81,118,9,'AZUL4',2,'2020-05-25',15.32,30.64,15.32,'C','1','2021-05-05 11:41:59'),(82,123,11,'SUZB3',4,'2020-05-26',37.10,148.40,37.10,'C','1','2021-05-05 11:41:59'),(83,124,10,'EMBR3',2,'2020-05-26',6.93,13.86,6.93,'C','2','2021-05-05 11:41:59'),(84,125,10,'EMBR3',10,'2020-05-26',6.68,66.80,6.68,'C','2','2021-05-05 11:41:59'),(85,126,13,'SBSP3',2,'2020-05-27',51.98,103.96,51.98,'C','2','2021-05-05 11:41:59'),(86,127,10,'EMBR3',2,'2020-05-27',7.09,14.18,7.09,'C','2','2021-05-05 11:41:59'),(87,128,13,'SBSP3',1,'2020-05-27',53.02,53.02,53.02,'C','2','2021-05-05 11:41:59'),(88,129,12,'PETR4',2,'2020-05-27',19.52,39.04,19.52,'C','1','2021-05-05 11:41:59'),(89,130,8,'ELET3',1,'2020-05-27',28.90,28.90,28.90,'C','1','2021-05-05 11:41:59'),(90,131,8,'ELET3',2,'2020-05-27',28.77,57.54,28.77,'C','1','2021-05-05 11:41:59'),(91,132,9,'AZUL4',4,'2020-05-27',14.64,58.56,14.64,'C','1','2021-05-05 11:41:59'),(92,133,9,'AZUL4',4,'2020-05-27',14.39,57.56,14.39,'C','1','2021-05-05 11:41:59'),(93,134,9,'AZUL4',4,'2020-05-27',14.55,58.20,14.55,'C','1','2021-05-05 11:41:59'),(94,135,4,'MGLU3',1,'2020-05-27',67.17,67.17,67.17,'C','1','2021-05-05 11:41:59'),(95,136,5,'PETR3',2,'2020-05-27',20.34,40.68,20.34,'C','1','2021-05-05 11:41:59'),(96,142,13,'SBSP3',1,'2020-05-28',51.84,51.84,51.84,'C','2','2021-05-05 11:41:59'),(97,143,14,'JBSS3',1,'2020-05-28',21.84,21.84,21.84,'C','1','2021-05-05 11:41:59'),(98,144,10,'EMBR3',5,'2020-05-28',7.08,35.40,7.08,'C','2','2021-05-05 11:41:59'),(99,145,3,'ABEV3',1,'2020-05-28',13.31,13.31,13.31,'C','1','2021-05-05 11:41:59'),(100,146,3,'ABEV3',2,'2020-05-28',13.10,26.20,13.10,'C','1','2021-05-05 11:41:59'),(101,147,4,'MGLU3',1,'2020-05-28',65.15,65.15,65.15,'C','1','2021-05-05 11:41:59'),(102,148,11,'SUZB3',2,'2020-05-28',38.91,77.82,38.91,'C','1','2021-05-05 11:41:59'),(103,150,10,'EMBR3',2,'2020-05-29',7.36,14.72,7.36,'C','2','2021-05-05 11:41:59'),(104,151,13,'SBSP3',2,'2020-05-29',51.80,103.60,51.80,'C','1','2021-05-05 11:41:59'),(105,152,10,'EMBR3',2,'2020-05-29',6.94,13.88,6.94,'C','2','2021-05-05 11:41:59'),(106,153,10,'EMBR3',2,'2020-05-29',7.58,15.16,7.58,'C','2','2021-05-05 11:41:59'),(107,154,10,'EMBR3',2,'2020-05-29',7.36,29.44,7.36,'C','1','2021-05-05 11:41:59'),(108,155,8,'ELET3',2,'2020-05-29',27.90,55.80,27.90,'C','1','2021-05-05 11:41:59'),(109,156,10,'EMBR3',4,'2020-05-29',7.48,29.92,7.48,'C','2','2021-05-05 11:41:59'),(110,157,10,'EMBR3',6,'2020-05-29',7.48,44.88,7.48,'C','1','2021-05-05 11:41:59'),(111,158,3,'ABEV3',3,'2020-05-29',12.30,36.90,12.30,'C','1','2021-05-05 11:41:59'),(112,159,11,'SUZB3',2,'2020-05-29',37.61,75.22,37.61,'C','1','2021-05-05 11:41:59'),(113,160,4,'MGLU3',2,'2020-05-29',64.32,128.64,64.32,'C','1','2021-05-05 11:41:59'),(114,167,10,'EMBR3',5,'2020-06-01',7.25,36.25,7.25,'C','1','2021-05-05 11:41:59'),(115,168,4,'MGLU3',1,'2020-06-01',64.20,64.20,64.20,'C','1','2021-05-05 11:41:59'),(116,171,15,'COGN3',2,'2020-06-02',6.23,12.46,6.23,'C','1','2021-05-05 11:41:59'),(117,172,4,'MGLU3',1,'2020-06-02',63.75,63.75,63.75,'C','1','2021-05-05 11:41:59'),(118,173,4,'MGLU3',1,'2020-06-02',63.44,63.44,63.44,'C','1','2021-05-05 11:41:59'),(119,174,13,'SBSP3',2,'2020-06-02',54.21,108.42,54.21,'C','1','2021-05-05 11:41:59'),(120,177,9,'AZUL4',1,'2020-06-04',18.79,37.58,18.79,'C','1','2021-05-05 11:41:59'),(121,179,16,'TPIS3',10,'2020-06-03',1.20,12.00,1.20,'C','1','2021-05-05 11:41:59'),(122,180,11,'SUZB3',2,'2020-06-03',37.92,75.84,37.92,'C','1','2021-05-05 11:41:59'),(123,181,13,'SBSP3',2,'2020-06-03',54.90,109.80,54.90,'C','1','2021-05-05 11:41:59'),(124,182,9,'AZUL4',1,'2020-06-04',18.79,37.58,18.79,'C','1','2021-05-05 11:41:59'),(125,183,17,'GOLL4',2,'2020-06-04',17.21,34.42,17.21,'C','1','2021-05-05 11:41:59'),(126,184,17,'GOLL4',1,'2020-06-04',17.18,17.18,17.18,'C','1','2021-05-05 11:41:59'),(127,185,17,'GOLL4',2,'2020-06-04',16.95,33.90,16.95,'C','1','2021-05-05 11:41:59'),(128,186,17,'GOLL4',1,'2020-06-04',17.18,17.18,17.18,'C','1','2021-05-05 11:41:59'),(129,187,4,'MGLU3',1,'2020-06-04',61.88,61.88,61.88,'C','1','2021-05-05 11:41:59'),(130,189,13,'SBSP3',2,'2020-06-05',53.20,106.40,53.20,'C','1','2021-05-05 11:41:59'),(131,190,11,'SUZB3',2,'2020-06-08',38.05,76.10,38.05,'C','1','2021-05-05 11:41:59'),(132,191,11,'SUZB3',2,'2020-06-08',37.70,75.40,37.70,'C','1','2021-05-05 11:41:59'),(133,192,8,'ELET3',2,'2020-06-08',30.05,60.10,30.05,'C','1','2021-05-05 11:41:59'),(134,199,8,'ELET3',2,'2020-06-09',30.28,60.56,30.28,'C','1','2021-05-05 11:41:59'),(135,200,17,'GOLL4',2,'2020-06-09',22.70,45.40,22.70,'C','1','2021-05-05 11:41:59'),(136,201,10,'EMBR3',2,'2020-06-09',10.19,20.38,10.19,'C','1','2021-05-05 11:41:59'),(137,202,17,'GOLL4',2,'2020-06-10',23.80,47.60,23.80,'C','1','2021-05-05 11:41:59'),(138,203,9,'AZUL4',2,'2020-06-10',26.32,52.64,26.32,'C','1','2021-05-05 11:41:59'),(139,204,10,'EMBR3',1,'2020-06-10',9.52,9.52,9.52,'C','1','2021-05-05 11:41:59'),(140,205,18,'AMAR3',5,'2020-06-12',8.50,42.50,8.50,'C','1','2021-05-05 11:41:59'),(141,206,17,'GOLL4',5,'2020-06-12',18.23,91.15,18.23,'C','1','2021-05-05 11:41:59'),(142,207,9,'AZUL4',2,'2020-06-12',21.50,43.00,21.50,'C','1','2021-05-05 11:41:59'),(143,208,10,'EMBR3',5,'2020-06-12',8.55,42.75,8.55,'C','1','2021-05-05 11:41:59'),(144,209,18,'AMAR3',5,'2020-06-17',8.54,42.70,8.54,'C','1','2021-05-05 11:41:59'),(145,210,17,'GOLL4',5,'2020-06-17',18.73,93.65,18.73,'C','1','2021-05-05 11:41:59'),(146,211,9,'AZUL4',5,'2020-06-17',22.99,114.95,22.99,'C','1','2021-05-05 11:41:59'),(147,212,10,'EMBR3',5,'2020-06-17',8.82,44.10,8.82,'C','1','2021-05-05 11:41:59'),(148,216,8,'ELET3',1,'2020-06-18',30.15,30.15,30.15,'C','1','2021-05-05 11:41:59'),(149,218,8,'ELET3',4,'2020-06-18',30.15,120.60,30.15,'C','1','2021-05-05 11:41:59'),(150,219,3,'ABEV3',3,'2020-06-18',13.78,41.34,13.78,'C','1','2021-05-05 11:41:59'),(151,220,8,'ELET3',5,'2020-06-19',30.25,151.25,30.25,'C','1','2021-05-05 11:41:59'),(152,221,9,'AZUL4',5,'2020-06-22',21.15,105.75,21.15,'C','1','2021-05-05 11:41:59'),(153,222,17,'GOLL4',5,'2020-06-22',18.57,92.85,18.57,'C','1','2021-05-05 11:41:59'),(154,223,10,'EMBR3',5,'2020-06-22',8.45,42.25,8.45,'C','1','2021-05-05 11:41:59'),(155,224,9,'AZUL4',5,'2020-06-23',21.08,105.40,21.08,'C','1','2021-05-05 11:41:59'),(156,225,17,'GOLL4',5,'2020-06-23',18.57,92.85,18.57,'C','1','2021-05-05 11:41:59'),(157,226,10,'EMBR3',5,'2020-06-23',8.58,42.90,8.58,'C','1','2021-05-05 11:41:59'),(158,227,3,'ABEV3',5,'2020-06-24',13.58,67.90,13.58,'C','1','2021-05-05 11:41:59'),(159,228,8,'ELET3',2,'2020-06-25',30.00,60.00,30.00,'C','1','2021-05-05 11:41:59'),(160,229,9,'AZUL4',5,'2020-06-25',21.03,105.15,21.03,'C','1','2021-05-05 11:41:59'),(161,230,10,'EMBR3',5,'2020-06-28',8.11,40.55,8.11,'C','1','2021-05-05 11:41:59'),(162,233,3,'ABEV3',8,'2020-07-01',14.54,116.32,14.80,'C','1','2021-05-05 11:41:59'),(163,234,10,'EMBR3',3,'2020-07-01',8.11,24.33,8.11,'C','1','2021-05-05 11:41:59'),(164,238,10,'EMBR3',4,'2020-07-09',8.10,32.40,8.10,'C','1','2021-05-05 11:41:59'),(165,239,8,'ELET3',1,'2020-07-10',35.88,35.88,35.88,'C','1','2021-05-05 11:41:59'),(166,240,19,'ETER3',5,'2020-07-10',4.24,21.20,4.24,'C','1','2021-05-05 11:41:59'),(167,243,8,'ELET3',2,'2020-07-13',35.83,71.66,35.83,'C','1','2021-05-05 11:41:59'),(168,244,8,'ELET3',2,'2020-07-13',35.67,71.34,35.67,'C','1','2021-05-05 11:41:59'),(169,245,10,'EMBR3',5,'2020-07-13',8.09,40.45,8.09,'C','1','2021-05-05 11:41:59'),(170,246,19,'ETER3',5,'2020-07-13',4.16,20.80,4.16,'C','1','2021-05-05 11:41:59'),(171,247,19,'ETER3',5,'2020-07-13',4.02,20.10,4.02,'C','1','2021-05-05 11:41:59'),(172,248,15,'COGN3',2,'2020-07-14',8.89,17.78,8.89,'C','1','2021-05-05 11:41:59'),(173,249,3,'ABEV3',4,'2020-07-14',13.87,55.48,13.87,'C','1','2021-05-05 11:41:59'),(174,250,19,'ETER3',5,'2020-07-14',3.95,19.75,3.95,'C','1','2021-05-05 11:41:59'),(175,251,15,'COGN3',20,'2020-07-15',8.66,173.20,8.66,'C','1','2021-05-05 11:41:59'),(176,253,8,'ELET3',2,'2020-07-16',35.24,70.48,35.24,'C','1','2021-05-05 11:41:59'),(177,254,20,'LUPA3',10,'2020-07-16',2.57,25.70,2.57,'C','1','2021-05-05 11:41:59'),(178,255,20,'LUPA3',99,'2020-07-20',2.56,253.44,2.56,'C','1','2021-05-05 11:41:59'),(179,256,19,'ETER3',10,'2020-07-21',5.50,55.00,5.50,'C','1','2021-05-05 11:41:59'),(180,259,20,'LUPA3',5,'2020-07-23',2.42,12.10,2.42,'C','1','2021-05-05 11:41:59'),(181,260,15,'COGN3',5,'2020-07-23',8.80,44.00,8.80,'C','1','2021-05-05 11:41:59'),(182,261,20,'LUPA3',45,'2020-07-23',2.42,121.00,2.42,'C','1','2021-05-05 11:41:59'),(183,262,15,'COGN3',2,'2020-07-27',8.11,16.22,8.11,'C','1','2021-05-05 11:41:59'),(184,263,18,'AMAR3',10,'2020-07-27',8.14,81.40,8.14,'C','1','2021-05-05 11:41:59'),(185,264,19,'ETER3',10,'2020-07-27',5.24,52.40,5.24,'C','1','2021-05-05 11:41:59'),(186,265,20,'LUPA3',50,'2020-07-27',2.24,112.00,2.24,'C','1','2021-05-05 11:41:59'),(187,267,15,'COGN3',7,'2020-07-28',9.01,63.07,9.01,'C','1','2021-05-05 11:41:59'),(188,268,21,'VVAR3',5,'2020-07-28',19.00,95.00,19.00,'C','1','2021-05-05 11:41:59'),(189,269,18,'AMAR3',10,'2020-07-28',7.82,78.20,7.82,'C','1','2021-05-05 11:41:59'),(190,270,19,'ETER3',5,'2020-07-28',5.19,25.95,5.19,'C','1','2021-05-05 11:41:59'),(191,273,19,'ETER3',10,'2020-08-03',4.95,49.50,4.95,'C','1','2021-05-05 11:41:59'),(192,274,3,'ABEV3',5,'2020-08-03',13.91,69.55,13.91,'C','1','2021-05-05 11:41:59'),(193,275,15,'COGN3',15,'2020-08-03',7.75,116.25,7.75,'C','1','2021-05-05 11:41:59'),(194,276,19,'ETER3',2,'2020-08-04',4.70,9.40,4.70,'C','1','2021-05-05 11:41:59'),(195,277,8,'ELET3',2,'2020-08-12',35.60,71.20,35.60,'C','1','2021-05-05 11:41:59'),(196,278,3,'ABEV3',5,'2020-08-12',13.37,66.85,13.37,'C','1','2021-05-05 11:41:59'),(197,279,15,'COGN3',15,'2020-08-12',7.24,108.60,7.24,'C','1','2021-05-05 11:41:59'),(198,281,8,'ELET3',2,'2020-08-13',34.24,68.48,34.24,'C','1','2021-05-05 11:41:59'),(199,282,15,'COGN3',15,'2020-08-13',7.08,106.20,7.08,'C','1','2021-05-05 11:41:59'),(200,283,8,'ELET3',2,'2020-08-14',33.50,67.00,33.50,'C','1','2021-05-05 11:41:59'),(201,284,8,'ELET3',3,'2020-08-17',31.60,94.80,31.60,'C','1','2021-05-05 11:41:59'),(202,285,22,'TIET11',20,'2020-08-19',14.67,293.40,14.67,'C','1','2021-05-05 11:41:59'),(203,286,23,'BBSE3',10,'2020-08-19',26.66,266.60,26.66,'C','1','2021-05-05 11:41:59'),(204,287,17,'GOLL4',10,'2020-08-19',18.57,185.70,18.57,'C','1','2021-05-05 11:41:59'),(205,288,24,'TAEE11',4,'2020-08-19',28.30,113.20,28.30,'C','1','2021-05-05 11:41:59'),(206,289,25,'TAEE4',6,'2020-08-19',9.50,57.00,9.50,'C','1','2021-05-05 11:41:59'),(207,290,15,'COGN3',15,'2020-08-19',6.87,103.05,6.87,'C','1','2021-05-05 11:41:59'),(208,291,23,'BBSE3',10,'2020-08-20',26.31,263.10,26.31,'C','1','2021-05-05 11:41:59'),(209,292,3,'ABEV3',10,'2020-08-21',12.77,127.70,12.77,'C','1','2021-05-05 11:41:59'),(210,293,6,'SPRI3',10,'2020-08-21',11.30,113.00,11.30,'C','1','2021-05-05 11:41:59'),(211,296,24,'TAEE11',10,'2020-08-24',28.23,282.30,28.23,'C','1','2021-05-05 11:41:59'),(212,298,15,'COGN3',20,'2020-08-25',6.34,126.80,6.34,'C','1','2021-05-05 11:41:59'),(213,299,15,'COGN3',20,'2020-08-25',6.19,123.80,6.19,'C','1','2021-05-05 11:41:59'),(214,302,15,'COGN3',20,'2020-08-26',6.00,120.00,6.00,'C','1','2021-05-05 11:41:59'),(215,305,23,'BBSE3',2,'2020-08-31',26.90,53.80,26.90,'C','1','2021-05-05 11:41:59'),(216,306,25,'TAEE4',20,'2020-08-31',9.49,189.80,9.49,'C','1','2021-05-05 11:41:59'),(217,307,10,'EMBR3',20,'2020-08-31',7.40,148.00,7.40,'C','1','2021-05-05 11:41:59'),(218,308,15,'COGN3',20,'2020-08-31',5.92,118.40,5.92,'C','1','2021-05-05 11:41:59'),(219,311,21,'VVAR3',7,'2020-09-04',18.80,131.60,18.80,'C','1','2021-05-05 11:41:59'),(220,312,23,'BBSE3',5,'2020-09-04',26.80,134.00,26.80,'C','1','2021-05-05 11:41:59'),(221,314,3,'ABEV3',20,'2020-09-08',12.37,247.40,12.37,'C','1','2021-05-05 11:41:59'),(222,315,21,'VVAR3',10,'2020-09-08',18.19,181.90,18.19,'C','1','2021-05-05 11:41:59'),(223,316,23,'BBSE3',5,'2020-09-08',26.75,133.75,26.75,'C','1','2021-05-05 11:41:59'),(224,317,23,'BBSE3',5,'2020-09-08',26.55,132.75,26.55,'C','1','2021-05-05 11:41:59'),(225,320,21,'VVAR3',8,'2020-09-10',18.10,144.80,18.10,'C','1','2021-05-05 11:41:59'),(226,321,23,'BBSE3',2,'2020-09-10',26.35,52.70,26.35,'C','1','2021-05-05 11:41:59'),(227,322,26,'GUAR3',10,'2020-09-10',17.65,176.50,17.65,'C','1','2021-05-05 11:41:59'),(228,323,22,'TIET11',10,'2020-09-11',14.73,147.30,14.73,'C','1','2021-05-05 11:41:59'),(229,324,23,'BBSE3',5,'2020-09-11',25.72,257.20,25.72,'C','1','2021-05-05 11:41:59'),(230,325,26,'GUAR3',12,'2020-09-11',17.18,206.16,17.18,'C','1','2021-05-05 11:41:59'),(231,326,26,'GUAR3',30,'2020-09-17',16.77,503.10,16.77,'C','1','2021-05-05 11:41:59'),(232,327,23,'BBSE3',5,'2020-11-09',25.72,128.60,25.72,'C','1','2021-05-05 11:41:59'),(233,328,22,'TIET11',2,'2020-09-22',14.76,29.52,14.76,'C','1','2021-05-05 11:41:59'),(234,329,23,'BBSE3',15,'2020-09-22',25.30,379.50,25.30,'C','1','2021-05-05 11:41:59'),(235,330,26,'GUAR3',20,'2020-09-22',15.53,310.60,15.53,'C','1','2021-05-05 11:41:59'),(236,331,26,'GUAR3',33,'2020-10-09',14.16,467.28,14.16,'C','1','2021-05-05 11:41:59'),(237,334,21,'VVAR3',10,'2020-10-27',19.00,190.00,19.00,'C','1','2021-05-05 11:41:59'),(238,336,21,'VVAR3',10,'2020-11-09',18.80,188.00,18.80,'C','1','2021-05-05 11:41:59'),(239,337,21,'VVAR3',10,'2020-11-10',18.60,186.00,18.60,'C','1','2021-05-05 11:41:59'),(240,338,21,'VVAR3',10,'2020-11-10',18.20,182.00,18.20,'C','1','2021-05-05 11:41:59'),(241,340,21,'VVAR3',7,'2020-11-12',18.00,126.00,18.00,'C','1','2021-05-05 11:41:59'),(242,341,22,'TIET11',10,'2020-11-12',15.50,155.00,15.50,'C','1','2021-05-05 11:41:59'),(243,342,21,'VVAR3',20,'2020-11-16',17.70,354.00,17.70,'C','1','2021-05-05 11:41:59'),(244,346,21,'VVAR3',10,'2020-11-27',18.50,185.00,18.50,'C','1','2021-05-05 11:41:59'),(245,348,3,'ABEV3',10,'2020-11-30',14.20,142.00,14.20,'C','1','2021-05-05 11:41:59'),(246,349,21,'VVAR3',10,'2020-11-30',17.90,179.00,17.90,'C','1','2021-05-05 11:41:59'),(247,350,21,'VVAR3',10,'2020-11-30',17.65,176.50,17.65,'C','1','2021-05-05 11:41:59'),(248,351,27,'TOTS3',10,'2020-12-01',25.70,257.00,25.70,'C','1','2021-05-05 11:41:59'),(249,352,21,'VVAR3',30,'2020-12-01',17.15,514.50,17.15,'C','1','2021-05-05 11:41:59'),(250,353,3,'ABEV3',10,'2020-12-03',14.60,146.00,14.60,'C','1','2021-05-05 11:41:59'),(251,354,27,'TOTS3',10,'2020-12-03',25.05,250.50,25.05,'C','1','2021-05-05 11:41:59'),(252,360,17,'GOLL4',10,'2020-12-17',26.10,261.00,26.10,'C','1','2021-05-05 11:41:59'),(253,361,23,'BBSE3',10,'2020-12-18',29.50,295.00,29.50,'C','1','2021-05-05 11:41:59'),(254,362,17,'GOLL4',10,'2020-12-18',25.10,251.00,25.10,'C','1','2021-05-05 11:41:59'),(255,363,23,'BBSE3',10,'2021-01-07',28.40,284.00,28.40,'C','1','2021-05-05 11:41:59'),(256,364,21,'VVAR3',13,'2021-01-07',15.80,205.40,15.80,'C','1','2021-05-05 11:41:59'),(257,366,23,'BBSE3',10,'2021-01-18',29.05,290.50,29.05,'C','1','2021-05-05 11:41:59'),(258,367,25,'TAEE4',12,'2021-01-21',11.00,132.00,11.00,'C','1','2021-05-05 11:41:59'),(259,368,28,'TAEE3',49,'2021-01-21',10.98,538.02,10.98,'C','1','2021-05-05 11:41:59'),(260,369,17,'GOLL4',20,'2021-01-21',22.75,455.00,22.75,'C','1','2021-05-05 11:41:59');
/*!40000 ALTER TABLE `tb_buys` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-15  5:54:40
