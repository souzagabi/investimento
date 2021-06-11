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
-- Table structure for table `tb_sells`
--

DROP TABLE IF EXISTS `tb_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sells` (
  `idsell` int NOT NULL AUTO_INCREMENT,
  `idinvestiment` int NOT NULL,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  `qtdesell` int DEFAULT '0',
  `dtsell` date DEFAULT NULL,
  `prcsell` decimal(10,2) DEFAULT '0.00',
  `tlsell` decimal(10,2) DEFAULT '0.00',
  `sprcaverage` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `lucre` decimal(10,2) DEFAULT '0.00',
  `stptransaction` char(1) DEFAULT NULL,
  `stipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsell`),
  KEY `FK_sells_investiments_idx` (`idinvestiment`),
  KEY `fk_sells_persons` (`idperson`),
  KEY `fk_sells_sgcompany_idx_idx` (`idsgcompany`),
  CONSTRAINT `FK_sells_investiments_idx` FOREIGN KEY (`idinvestiment`) REFERENCES `tb_investiments` (`idinvestiment`) ON DELETE CASCADE,
  CONSTRAINT `fk_sells_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `fk_sells_sgcompany_idx` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sells`
--

LOCK TABLES `tb_sells` WRITE;
/*!40000 ALTER TABLE `tb_sells` DISABLE KEYS */;
INSERT INTO `tb_sells` VALUES (1,1,4,1,2,'2020-04-24',47.23,94.46,47.23,0.19,0.18,'V','2','2021-05-05 11:41:09'),(2,3,4,1,2,'2020-04-24',47.28,94.56,47.28,0.64,0.60,'V','2','2021-05-05 11:41:58'),(3,5,4,1,2,'2020-04-27',48.43,96.86,48.43,3.15,2.96,'V','1','2021-05-05 11:41:58'),(4,7,5,2,2,'2020-04-27',16.50,33.00,16.50,0.30,0.10,'V','2','2021-05-05 11:41:58'),(5,9,4,1,2,'2020-04-27',48.60,97.20,48.60,1.02,0.98,'V','2','2021-05-05 11:41:58'),(6,11,4,1,2,'2020-04-27',48.75,97.50,48.75,0.43,0.42,'V','2','2021-05-05 11:41:58'),(7,13,4,1,2,'2020-04-27',48.72,97.44,48.72,0.39,0.38,'V','2','2021-05-05 11:41:58'),(8,15,3,3,2,'2020-04-27',11.69,23.38,11.69,0.52,0.12,'V','1','2021-05-05 11:41:58'),(9,17,6,4,2,'2020-04-28',26.00,52.00,26.00,-0.73,-0.38,'V','1','2021-05-05 11:41:58'),(10,19,6,4,2,'2020-11-28',10.51,21.02,10.51,-58.93,-30.16,'V','1','2021-05-05 11:41:58'),(11,20,3,3,2,'2020-04-29',11.87,23.74,11.87,0.68,0.16,'V','1','2021-05-05 11:41:58'),(12,22,7,5,2,'2021-05-05',18.74,37.48,18.74,3.59,1.30,'V','1','2021-05-05 11:41:58'),(13,23,3,3,2,'2020-05-04',11.48,22.96,11.48,0.88,0.20,'V','1','2021-05-05 11:41:58'),(14,26,4,1,1,'2020-05-06',53.46,53.46,53.46,3.26,1.69,'V','1','2021-05-05 11:41:58'),(15,27,5,2,2,'2020-05-07',18.54,37.08,18.54,1.09,0.40,'V','1','2021-05-05 11:41:58'),(16,28,7,5,2,'2020-05-07',19.55,39.10,19.55,4.32,1.62,'V','1','2021-05-05 11:41:58'),(17,29,3,3,2,'2020-05-07',12.18,24.36,12.18,1.50,0.36,'V','1','2021-05-05 11:41:58'),(18,30,5,2,2,'2020-05-08',18.85,37.70,18.85,3.12,1.14,'V','2','2021-05-05 11:41:58'),(19,31,4,1,1,'2020-05-07',56.26,56.26,56.26,4.48,2.41,'V','2','2021-05-05 11:41:58'),(20,32,5,2,2,'2020-05-08',18.85,37.70,18.85,3.46,1.26,'V','2','2021-05-05 11:41:58'),(21,33,3,3,2,'2020-05-07',12.18,24.36,12.18,3.92,0.92,'V','2','2021-05-05 11:41:58'),(22,34,3,3,2,'2020-05-08',11.92,23.84,11.92,3.38,0.78,'V','1','2021-05-05 11:41:58'),(23,39,5,2,2,'2020-05-08',19.43,38.86,19.43,2.86,1.08,'V','1','2021-05-05 11:41:58'),(24,40,3,3,2,'2020-05-08',12.03,24.06,12.03,1.95,0.46,'V','1','2021-05-05 11:41:58'),(25,41,3,3,2,'2020-05-08',12.03,24.06,12.03,0.92,0.22,'V','1','2021-05-05 11:41:58'),(26,42,4,1,1,'2020-05-12',56.39,56.39,56.39,1.24,0.69,'V','2','2021-05-05 11:41:58'),(27,48,4,1,1,'2020-05-12',56.39,56.39,56.39,1.62,0.90,'V','1','2021-05-05 11:41:58'),(28,49,3,3,2,'2020-05-18',12.18,24.36,12.18,-0.25,-0.06,'V','1','2021-05-05 11:41:58'),(29,50,8,6,2,'2020-05-15',22.90,45.80,22.90,0.70,0.32,'V','2','2021-05-05 11:41:58'),(30,51,8,6,2,'2020-05-15',22.90,45.80,22.90,2.69,1.20,'V','2','2021-05-05 11:41:58'),(31,52,8,6,2,'2020-05-15',22.90,45.80,22.90,4.38,1.92,'V','2','2021-05-05 11:41:58'),(32,53,4,1,1,'2020-05-18',56.24,56.24,56.24,2.27,1.25,'V','2','2021-05-05 11:41:58'),(33,55,3,3,3,'2020-05-18',12.18,36.54,12.18,4.55,1.59,'V','1','2021-05-05 11:41:58'),(34,56,8,6,2,'2020-05-18',23.27,46.54,23.27,1.31,0.60,'V','2','2021-05-05 11:41:58'),(35,58,3,3,2,'2020-05-18',12.34,24.68,12.34,3.18,0.76,'V','2','2021-05-05 11:41:58'),(36,59,3,3,2,'2020-05-18',12.34,24.68,12.34,-0.40,-0.10,'V','2','2021-05-05 11:41:58'),(37,60,4,1,1,'2020-05-19',56.83,56.83,56.83,1.59,0.89,'V','2','2021-05-05 11:41:58'),(38,61,4,1,1,'2020-05-19',56.83,56.83,56.83,2.19,1.22,'V','1','2021-05-05 11:41:58'),(39,62,7,5,2,'2020-05-19',20.49,40.98,20.49,1.69,0.68,'V','1','2021-05-05 11:41:58'),(40,63,7,5,2,'2020-05-19',20.55,41.10,20.55,2.80,1.12,'V','1','2021-05-05 11:41:58'),(41,64,7,5,2,'2020-05-19',20.49,40.98,20.49,-0.92,-0.38,'V','2','2021-05-05 11:41:58'),(42,70,9,7,2,'2020-05-20',14.37,28.74,14.37,4.43,1.22,'V','1','2021-05-05 11:41:58'),(43,71,7,5,2,'2020-05-20',20.42,40.84,20.42,1.85,0.74,'V','2','2021-05-05 11:41:58'),(44,72,7,5,2,'2020-05-20',20.42,40.84,20.42,1.74,0.70,'V','2','2021-05-05 11:41:58'),(45,73,8,6,1,'2020-05-20',24.41,24.41,24.41,0.95,0.23,'V','2','2021-05-05 11:41:58'),(46,74,8,6,2,'2020-05-20',24.41,48.82,24.41,2.39,1.14,'V','2','2021-05-05 11:41:58'),(47,75,8,6,2,'2020-05-20',24.41,48.82,24.41,2.31,1.10,'V','2','2021-05-05 11:41:58'),(48,76,9,7,1,'2020-05-20',14.50,14.50,14.50,0.55,0.08,'V','1','2021-05-05 11:41:58'),(49,77,9,7,2,'2020-05-20',14.50,29.00,14.50,5.76,1.58,'V','1','2021-05-05 11:41:58'),(50,78,3,3,1,'2020-05-20',12.13,12.13,12.13,-0.08,-0.01,'V','1','2021-05-05 11:41:58'),(51,83,3,3,2,'2020-05-20',12.13,24.26,12.13,1.42,0.34,'V','2','2021-05-05 11:41:58'),(52,84,4,1,1,'2020-05-21',58.54,58.54,58.54,1.84,1.06,'V','1','2021-05-05 11:41:58'),(53,85,8,6,1,'2020-05-22',24.13,24.13,24.13,-0.66,-0.16,'V','2','2021-05-05 11:41:58'),(54,86,8,6,2,'2020-05-22',24.13,48.26,24.13,1.69,0.80,'V','2','2021-05-05 11:41:58'),(55,87,8,6,2,'2020-05-22',24.13,48.26,24.13,2.12,1.00,'V','2','2021-05-05 11:41:58'),(56,88,5,2,1,'2020-05-25',20.38,20.38,20.38,1.09,0.22,'V','1','2021-05-05 11:41:58'),(57,89,7,5,2,'2020-07-01',20.20,40.40,20.20,0.10,0.04,'V','2','2021-05-05 11:41:58'),(58,90,7,5,1,'2020-07-01',20.20,20.20,20.20,3.32,0.65,'V','2','2021-05-05 11:41:58'),(59,95,4,1,2,'2020-05-21',58.54,117.08,58.54,1.37,1.58,'V','2','2021-05-05 11:41:58'),(60,96,8,6,2,'2020-05-20',24.13,48.26,24.13,3.34,1.56,'V','2','2021-05-05 11:41:58'),(61,97,5,8,2,'2020-05-25',19.54,39.08,19.54,-0.10,-0.04,'V','1','2021-05-05 11:41:58'),(62,98,5,8,2,'2020-05-25',19.54,39.08,19.54,1.24,0.48,'V','1','2021-05-05 11:41:58'),(63,99,5,2,2,'2020-05-25',20.38,40.76,20.38,2.31,0.92,'V','1','2021-05-05 11:41:58'),(64,100,10,9,1,'2020-05-25',6.92,6.92,6.92,6.13,0.40,'V','1','2021-05-05 11:41:58'),(65,101,3,3,4,'2020-05-25',12.12,48.48,12.12,2.19,1.04,'V','1','2021-05-05 11:41:58'),(66,102,3,3,1,'2020-05-25',12.12,12.12,12.12,2.54,0.30,'V','1','2021-05-05 11:41:58'),(67,103,7,5,2,'2020-07-01',20.20,40.40,20.20,3.54,1.38,'V','1','2021-05-05 11:41:58'),(68,104,7,5,2,'2020-07-01',20.20,40.40,20.20,5.48,2.10,'V','1','2021-05-05 11:41:58'),(69,105,9,7,2,'2020-06-02',16.25,32.50,16.25,0.49,0.16,'V','1','2021-05-05 11:41:58'),(70,106,9,7,2,'2020-06-02',16.25,32.50,16.25,4.37,1.36,'V','1','2021-05-05 11:41:58'),(71,108,5,8,2,'2020-05-25',19.54,39.08,19.54,5.00,1.86,'V','1','2021-05-05 11:41:58'),(72,109,5,2,2,'2020-05-25',20.38,40.76,20.38,4.35,1.70,'V','1','2021-05-05 11:41:59'),(73,110,9,7,6,'2020-06-02',16.25,97.50,16.25,9.50,8.46,'V','1','2021-05-05 11:41:59'),(74,112,11,10,2,'2020-05-27',38.64,77.28,38.64,2.11,1.60,'V','1','2021-05-05 11:41:59'),(75,113,11,10,4,'2020-05-27',38.64,154.56,38.64,2.03,3.08,'V','1','2021-05-05 11:41:59'),(76,114,11,10,1,'2020-05-27',38.64,38.64,38.64,2.06,0.78,'V','1','2021-05-05 11:41:59'),(77,115,11,10,3,'2020-05-27',38.83,116.49,38.83,2.56,2.91,'V','1','2021-05-05 11:41:59'),(78,116,7,5,4,'2020-07-01',20.20,80.80,20.20,7.05,5.32,'V','1','2021-05-05 11:41:59'),(79,117,9,7,8,'2020-06-02',16.50,132.00,16.50,11.64,13.76,'V','1','2021-05-05 11:41:59'),(80,118,9,7,2,'2020-06-02',16.50,33.00,16.50,7.70,2.36,'V','1','2021-05-05 11:41:59'),(81,123,11,10,4,'2020-05-27',38.83,155.32,38.83,4.66,6.92,'V','1','2021-05-05 11:41:59'),(82,124,10,9,2,'2020-05-27',7.02,14.04,7.02,1.30,0.18,'V','2','2021-05-05 11:41:59'),(83,125,10,9,10,'2020-05-27',7.02,70.20,7.02,5.09,3.40,'V','2','2021-05-05 11:41:59'),(84,126,13,11,2,'2020-05-27',53.50,107.00,53.50,2.92,3.04,'V','2','2021-05-05 11:41:59'),(85,127,10,9,2,'2020-05-27',7.24,14.48,7.24,2.12,0.30,'V','2','2021-05-05 11:41:59'),(86,128,13,11,1,'2020-05-28',53.50,53.50,53.50,0.91,0.48,'V','2','2021-05-05 11:41:59'),(87,129,5,8,2,'2020-05-29',19.89,39.78,19.89,1.90,0.74,'V','1','2021-05-05 11:41:59'),(88,130,8,6,1,'2020-06-01',29.20,29.20,29.20,1.04,0.30,'V','1','2021-05-05 11:41:59'),(89,131,8,6,2,'2020-06-01',29.20,58.40,29.20,1.49,0.86,'V','1','2021-05-05 11:41:59'),(90,132,9,7,4,'2020-06-02',16.50,66.00,16.50,12.70,7.44,'V','1','2021-05-05 11:41:59'),(91,133,9,7,4,'2020-06-02',16.50,66.00,16.50,14.66,8.44,'V','1','2021-05-05 11:41:59'),(92,134,9,7,4,'2020-06-02',16.50,66.00,16.50,13.40,7.80,'V','1','2021-05-05 11:41:59'),(93,135,4,1,1,'2020-06-17',67.20,67.20,67.20,0.04,0.03,'V','1','2021-05-05 11:41:59'),(94,136,5,2,2,'2020-05-28',20.79,41.58,20.79,2.21,0.90,'V','1','2021-05-05 11:41:59'),(95,142,13,11,1,'2020-05-28',53.50,53.50,53.50,3.20,1.66,'V','2','2021-05-05 11:41:59'),(96,143,14,12,1,'2020-05-29',22.00,22.00,22.00,0.73,0.16,'V','1','2021-05-05 11:41:59'),(97,144,10,9,5,'2020-05-29',7.70,38.50,7.70,8.76,3.10,'V','2','2021-05-05 11:41:59'),(98,145,3,3,1,'2020-06-02',13.20,13.20,13.20,-0.83,-0.11,'V','1','2021-05-05 11:41:59'),(99,146,3,3,2,'2020-06-02',13.20,26.40,13.20,0.76,0.20,'V','1','2021-05-05 11:41:59'),(100,147,4,1,1,'2020-06-17',67.20,67.20,67.20,3.15,2.05,'V','1','2021-05-05 11:41:59'),(101,148,11,10,2,'2020-06-17',38.85,77.70,38.85,-0.15,-0.12,'V','1','2021-05-05 11:41:59'),(102,150,10,9,2,'2020-05-29',7.47,14.94,7.47,1.49,0.22,'V','2','2021-05-05 11:41:59'),(103,151,13,11,2,'2020-05-29',53.00,106.00,53.00,2.32,2.40,'V','1','2021-05-05 11:41:59'),(104,152,10,9,2,'2020-05-29',7.80,15.60,7.80,12.39,1.72,'V','2','2021-05-05 11:41:59'),(105,153,10,9,2,'2020-05-29',7.47,14.94,7.47,-1.45,-0.22,'V','2','2021-05-05 11:41:59'),(106,154,10,9,3,'2020-05-29',8.10,24.30,8.10,10.05,2.22,'V','1','2021-05-05 11:41:59'),(107,155,8,6,2,'2020-06-01',29.20,58.40,29.20,4.66,2.60,'V','1','2021-05-05 11:41:59'),(108,156,10,9,2,'2020-06-02',8.10,16.20,8.10,8.29,1.24,'V','2','2021-05-05 11:41:59'),(109,157,10,9,6,'2020-06-02',8.10,48.60,8.10,8.29,3.72,'V','1','2021-05-05 11:41:59'),(110,158,3,3,3,'2020-06-02',13.20,39.60,13.20,7.32,2.70,'V','1','2021-05-05 11:41:59'),(111,159,11,10,2,'2020-06-17',38.85,77.70,38.85,3.30,2.48,'V','1','2021-05-05 11:41:59'),(112,160,4,1,2,'2020-06-17',67.20,134.40,67.20,4.48,5.76,'V','1','2021-05-05 11:41:59'),(113,167,10,9,5,'2020-06-02',8.10,40.50,8.10,11.72,4.25,'V','1','2021-05-05 11:41:59'),(114,168,4,1,1,'2020-06-17',67.20,67.20,67.20,4.67,3.00,'V','1','2021-05-05 11:41:59'),(115,171,15,13,2,'2020-06-04',6.79,13.58,6.79,8.99,1.12,'V','1','2021-05-05 11:41:59'),(116,172,4,1,1,'2020-06-17',67.20,67.20,67.20,5.41,3.45,'V','1','2021-05-05 11:41:59'),(117,173,4,1,1,'2020-06-17',67.20,67.20,67.20,5.93,3.76,'V','1','2021-05-05 11:41:59'),(118,174,13,11,2,'2020-06-17',56.10,112.20,56.10,3.49,3.78,'V','1','2021-05-05 11:41:59'),(119,177,9,7,1,'2020-06-08',25.50,25.50,25.50,35.71,6.71,'V','1','2021-05-05 11:41:59'),(120,179,16,14,10,'2020-06-08',1.25,12.50,1.25,4.17,0.50,'V','1','2021-05-05 11:41:59'),(121,180,11,10,2,'2020-06-17',38.85,77.70,38.85,2.45,1.86,'V','1','2021-05-05 11:41:59'),(122,181,13,11,2,'2020-06-17',56.10,112.20,56.10,2.19,2.40,'V','1','2021-05-05 11:41:59'),(123,182,9,7,1,'2020-06-08',26.25,26.25,26.25,39.70,7.46,'V','1','2021-05-05 11:41:59'),(124,183,17,15,2,'2020-06-08',21.40,42.80,21.40,24.35,8.38,'V','1','2021-05-05 11:41:59'),(125,184,17,15,1,'2020-06-08',21.40,21.40,21.40,24.56,4.22,'V','1','2021-05-05 11:41:59'),(126,185,17,15,2,'2020-06-08',23.05,46.10,23.05,35.99,12.20,'V','1','2021-05-05 11:41:59'),(127,186,17,15,1,'2020-06-08',23.17,23.17,23.17,34.87,5.99,'V','1','2021-05-05 11:41:59'),(128,187,4,1,1,'2020-06-17',67.20,67.20,67.20,8.60,5.32,'V','1','2021-05-05 11:41:59'),(129,189,13,11,2,'2020-06-17',56.10,112.20,56.10,5.45,5.80,'V','1','2021-05-05 11:41:59'),(130,190,11,10,2,'2020-06-17',38.85,77.70,38.85,2.10,1.60,'V','1','2021-05-05 11:41:59'),(131,191,11,10,2,'2020-06-17',38.85,77.70,38.85,3.05,2.30,'V','1','2021-05-05 11:41:59'),(132,192,8,6,2,'2020-06-17',31.81,63.62,31.81,5.86,3.52,'V','1','2021-05-05 11:41:59'),(133,199,8,6,2,'2020-06-17',32.05,64.10,32.05,5.85,3.54,'V','1','2021-05-05 11:41:59'),(134,200,17,15,2,'2020-06-10',20.65,41.30,20.65,-9.03,-4.10,'V','1','2021-05-05 11:41:59'),(135,201,10,9,2,'2020-12-03',8.80,17.60,8.80,-13.64,-2.78,'V','1','2021-05-05 11:41:59'),(136,202,17,15,2,'2020-06-10',20.65,41.30,20.65,-13.24,-6.30,'V','1','2021-05-05 11:41:59'),(137,203,9,7,2,'2020-08-12',24.40,48.80,24.40,-7.29,-3.84,'V','1','2021-05-05 11:41:59'),(138,204,10,9,1,'2020-12-03',8.80,8.80,8.80,-7.56,-0.72,'V','1','2021-05-05 11:41:59'),(139,205,18,16,5,'2020-07-07',9.05,45.25,9.05,6.47,2.75,'V','1','2021-05-05 11:41:59'),(140,206,17,15,5,'2020-06-15',21.97,109.85,21.97,20.52,18.70,'V','1','2021-05-05 11:41:59'),(141,207,9,7,2,'2020-08-12',24.40,48.80,24.40,13.49,5.80,'V','1','2021-05-05 11:41:59'),(142,208,10,9,5,'2020-12-03',8.80,44.00,8.80,2.92,1.25,'V','1','2021-05-05 11:41:59'),(143,209,18,16,5,'2020-07-10',8.96,44.80,8.96,4.92,2.10,'V','1','2021-05-05 11:41:59'),(144,210,17,15,5,'2020-06-15',21.97,109.85,21.97,17.30,16.20,'V','1','2021-05-05 11:41:59'),(145,211,9,7,5,'2020-08-12',24.40,122.00,24.40,6.13,7.05,'V','1','2021-05-05 11:41:59'),(146,212,10,9,5,'2020-12-03',8.80,44.00,8.80,-0.23,-0.10,'V','1','2021-05-05 11:41:59'),(147,216,8,6,1,'2020-06-30',31.45,31.45,31.45,4.31,1.30,'V','1','2021-05-05 11:41:59'),(148,218,8,6,4,'2020-06-30',31.45,125.80,31.45,4.31,5.20,'V','1','2021-05-05 11:41:59'),(149,219,3,3,3,'2020-07-01',14.06,42.18,14.06,2.03,0.84,'V','1','2021-05-05 11:41:59'),(150,220,8,6,5,'2020-06-30',31.45,157.25,31.45,3.97,6.00,'V','1','2021-05-05 11:41:59'),(151,221,9,7,5,'2020-08-12',24.50,122.50,24.50,15.84,16.75,'V','1','2021-05-05 11:41:59'),(152,222,17,15,5,'2020-09-04',19.80,99.00,19.80,6.62,6.15,'V','1','2021-05-05 11:41:59'),(153,223,10,9,5,'2020-12-03',8.80,44.00,8.80,4.14,1.75,'V','1','2021-05-05 11:41:59'),(154,224,9,7,5,'2020-08-12',24.50,122.50,24.50,16.22,17.10,'V','1','2021-05-05 11:41:59'),(155,225,17,15,5,'2020-09-04',19.80,99.00,19.80,6.62,6.15,'V','1','2021-05-05 11:41:59'),(156,226,10,9,5,'2020-12-03',8.80,44.00,8.80,2.56,1.10,'V','1','2021-05-05 11:41:59'),(157,227,3,3,5,'2020-07-01',14.06,70.30,14.06,3.53,2.40,'V','1','2021-05-05 11:41:59'),(158,228,8,6,2,'2020-06-30',31.50,63.00,31.50,5.00,3.00,'V','1','2021-05-05 11:41:59'),(159,229,9,7,5,'2020-08-12',24.50,122.50,24.50,16.50,17.35,'V','1','2021-05-05 11:41:59'),(160,230,10,9,5,'2020-12-03',8.80,44.00,8.80,8.51,3.45,'V','1','2021-05-05 11:41:59'),(161,233,3,3,8,'2020-07-01',14.51,116.08,14.51,-0.21,-0.24,'V','1','2021-05-05 11:41:59'),(162,234,10,9,3,'2020-12-03',8.80,26.40,8.80,8.51,2.07,'V','1','2021-05-05 11:41:59'),(163,238,10,9,4,'2020-12-03',8.80,35.20,8.80,8.64,2.80,'V','1','2021-05-05 11:41:59'),(164,239,8,6,1,'2020-07-27',39.10,39.10,39.10,8.97,3.22,'V','1','2021-05-05 11:41:59'),(165,240,19,17,5,'2020-07-16',4.48,22.40,4.48,5.66,1.20,'V','1','2021-05-05 11:41:59'),(166,243,8,6,2,'2020-07-27',39.10,78.20,39.10,9.13,6.54,'V','1','2021-05-05 11:41:59'),(167,244,8,6,2,'2020-07-27',39.10,78.20,39.10,9.62,6.86,'V','1','2021-05-05 11:41:59'),(168,245,10,9,5,'2020-12-03',8.80,44.00,8.80,8.78,3.55,'V','1','2021-05-05 11:41:59'),(169,246,19,17,5,'2020-07-16',4.48,22.40,4.48,7.69,1.60,'V','1','2021-05-05 11:41:59'),(170,247,19,17,5,'2020-07-16',4.48,22.40,4.48,11.44,2.30,'V','1','2021-05-05 11:41:59'),(171,248,15,13,2,'2020-07-16',9.10,18.20,9.10,2.36,0.42,'V','1','2021-05-05 11:41:59'),(172,249,3,3,4,'2020-07-22',15.00,60.00,15.00,8.15,4.52,'V','1','2021-05-05 11:41:59'),(173,250,19,17,5,'2020-07-16',4.48,22.40,4.48,13.42,2.65,'V','1','2021-05-05 11:41:59'),(174,251,15,13,20,'2020-07-16',9.10,182.00,9.10,5.08,8.80,'V','1','2021-05-05 11:41:59'),(175,253,8,6,2,'2020-07-27',39.10,78.20,39.10,10.95,7.72,'V','1','2021-05-05 11:41:59'),(176,254,20,18,10,'2020-06-30',2.43,24.30,2.43,-5.45,-1.40,'V','1','2021-05-05 11:41:59'),(177,255,20,18,99,'2020-08-24',2.33,230.67,2.33,-8.98,-22.77,'V','1','2021-05-05 11:41:59'),(178,256,19,17,10,'2020-09-08',5.30,53.00,5.30,-3.64,-2.00,'V','1','2021-05-05 11:41:59'),(179,259,20,18,5,'2020-12-14',2.60,13.00,2.60,7.44,0.90,'V','1','2021-05-05 11:41:59'),(180,260,15,13,5,'2020-07-28',9.06,45.30,9.06,2.95,1.30,'V','1','2021-05-05 11:41:59'),(181,261,20,18,45,'2020-07-30',2.15,96.75,2.15,-11.16,-12.15,'V','1','2021-05-05 11:41:59'),(182,262,15,13,2,'2020-07-28',9.06,18.12,9.06,11.71,1.90,'V','1','2021-05-05 11:41:59'),(183,263,18,16,10,'2020-08-25',8.25,82.50,8.25,1.35,1.10,'V','1','2021-05-05 11:41:59'),(184,264,19,17,10,'2020-09-08',5.30,53.00,5.30,1.15,0.60,'V','1','2021-05-05 11:41:59'),(185,265,20,18,50,'2020-12-14',2.60,130.00,2.60,16.07,18.00,'V','1','2021-05-05 11:41:59'),(186,267,15,13,7,'2020-07-28',9.06,63.42,9.06,0.55,0.35,'V','1','2021-05-05 11:41:59'),(187,268,21,19,5,'2020-11-26',19.15,95.75,19.15,0.79,0.75,'V','1','2021-05-05 11:41:59'),(188,269,18,16,10,'2020-08-25',8.25,82.50,8.25,5.50,4.30,'V','1','2021-05-05 11:41:59'),(189,270,19,17,5,'2020-09-08',5.30,26.50,5.30,2.12,0.55,'V','1','2021-05-05 11:41:59'),(190,273,19,17,10,'2020-09-08',5.30,53.00,5.30,7.07,3.50,'V','1','2021-05-05 11:41:59'),(191,274,3,3,5,'2020-09-17',13.12,65.60,13.12,-5.68,-3.95,'V','1','2021-05-05 11:41:59'),(192,275,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(193,276,19,17,2,'2020-09-08',5.30,10.60,5.30,12.77,1.20,'V','1','2021-05-05 11:41:59'),(194,277,8,6,2,'2020-08-21',34.40,68.80,34.40,-3.37,-2.40,'V','1','2021-05-05 11:41:59'),(195,278,3,3,5,'2020-09-17',13.12,65.60,13.12,-1.87,-1.25,'V','1','2021-05-05 11:41:59'),(196,279,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(197,281,8,6,2,'2020-08-21',34.40,68.80,34.40,0.47,0.32,'V','1','2021-05-05 11:41:59'),(198,282,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(199,283,8,6,2,'2020-08-21',34.40,68.80,34.40,2.69,1.80,'V','1','2021-05-05 11:41:59'),(200,284,8,6,3,'2020-08-21',34.40,103.20,34.40,8.86,8.40,'V','1','2021-05-05 11:41:59'),(201,285,22,20,20,'2020-08-25',15.20,304.00,15.20,3.61,10.60,'V','1','2021-05-05 11:41:59'),(202,286,23,21,10,'2020-08-28',27.47,274.70,27.47,3.04,8.10,'V','1','2021-05-05 11:41:59'),(203,287,17,15,10,'2020-09-04',19.80,198.00,19.80,6.62,12.30,'V','1','2021-05-05 11:41:59'),(204,288,24,22,4,'2020-09-08',28.85,115.40,28.85,1.94,2.20,'V','1','2021-05-05 11:41:59'),(205,289,24,23,6,'2020-11-05',9.95,59.70,9.95,4.74,2.70,'V','1','2021-05-05 11:41:59'),(206,290,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(207,291,23,21,10,'2020-08-28',27.55,275.50,27.55,4.71,12.40,'V','1','2021-05-05 11:41:59'),(208,292,3,3,10,'2020-09-17',13.12,131.20,13.12,2.74,3.50,'V','1','2021-05-05 11:41:59'),(209,293,6,4,10,'2020-11-28',10.51,105.10,10.51,-6.99,-7.90,'V','1','2021-05-05 11:41:59'),(210,296,24,22,10,'2020-09-08',28.85,288.50,28.85,2.20,6.20,'V','1','2021-05-05 11:41:59'),(211,298,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(212,299,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(213,302,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(214,305,23,21,2,'2020-09-03',27.80,55.60,27.80,3.35,1.80,'V','1','2021-05-05 11:41:59'),(215,306,24,23,20,'2020-11-05',9.95,199.00,9.95,4.85,9.20,'V','1','2021-05-05 11:41:59'),(216,307,10,9,20,'2020-12-03',8.80,176.00,8.80,18.92,28.00,'V','1','2021-05-05 11:41:59'),(217,308,15,13,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(218,311,21,19,7,'2020-11-26',19.15,134.05,19.15,1.86,2.45,'V','1','2021-05-05 11:41:59'),(219,312,23,21,5,'2020-11-09',26.75,133.75,26.75,-0.19,-0.25,'V','1','2021-05-05 11:41:59'),(220,314,3,3,20,'2020-09-17',13.12,262.40,13.12,6.06,15.00,'V','1','2021-05-05 11:41:59'),(221,315,21,19,10,'2020-11-26',19.15,191.50,19.15,5.28,9.60,'V','1','2021-05-05 11:41:59'),(222,316,23,21,5,'2020-11-09',26.75,133.75,26.75,0.00,0.00,'V','1','2021-05-05 11:41:59'),(223,317,23,21,5,'2020-11-09',26.75,133.75,26.75,0.75,1.00,'V','1','2021-05-05 11:41:59'),(224,320,21,19,8,'2020-11-26',19.15,153.20,19.15,5.80,8.40,'V','1','2021-05-05 11:41:59'),(225,321,23,21,2,'2020-11-09',26.75,53.50,26.75,1.52,0.80,'V','1','2021-05-05 11:41:59'),(226,322,26,24,10,'2021-04-16',17.15,171.50,17.15,-2.83,-5.00,'V','1','2021-05-05 11:41:59'),(227,323,22,20,10,'2020-10-19',15.30,153.00,15.30,3.87,5.70,'V','1','2021-05-05 11:41:59'),(228,324,23,21,5,'2020-11-09',26.75,133.75,26.75,4.00,5.15,'V','1','2021-05-05 11:41:59'),(229,325,26,24,12,'2021-04-16',17.15,205.80,17.15,-0.17,-0.36,'V','1','2021-05-05 11:41:59'),(230,326,26,24,30,'2021-04-16',17.15,514.50,17.15,2.27,11.40,'V','1','2021-05-05 11:41:59'),(231,327,23,21,5,'2020-11-16',27.50,137.50,27.50,6.92,8.90,'V','1','2021-05-05 11:41:59'),(232,328,22,20,2,'2020-10-19',15.30,30.60,15.30,3.66,1.08,'V','1','2021-05-05 11:41:59'),(233,329,23,21,15,'2020-11-16',27.50,412.50,27.50,8.70,33.00,'V','1','2021-05-05 11:41:59'),(234,330,26,24,20,'2021-04-16',17.15,343.00,17.15,10.43,32.40,'V','1','2021-05-05 11:41:59'),(235,331,26,24,33,'2021-04-16',17.15,565.95,17.15,21.12,98.67,'V','1','2021-05-05 11:41:59'),(236,334,21,19,10,'2020-11-26',19.15,191.50,19.15,0.79,1.50,'V','1','2021-05-05 11:41:59'),(237,336,21,19,10,'2020-11-26',19.15,191.50,19.15,1.86,3.50,'V','1','2021-05-05 11:41:59'),(238,337,21,19,10,'2020-11-26',19.15,191.50,19.15,2.96,5.50,'V','1','2021-05-05 11:41:59'),(239,338,21,19,10,'2020-11-26',19.15,191.50,19.15,5.22,9.50,'V','1','2021-05-05 11:41:59'),(240,340,21,19,7,'2020-11-26',19.15,134.05,19.15,6.39,8.05,'V','1','2021-05-05 11:41:59'),(241,341,22,20,10,'2020-11-26',16.10,161.00,16.10,3.87,6.00,'V','1','2021-05-05 11:41:59'),(242,342,21,19,20,'2020-11-26',19.15,383.00,19.15,8.19,29.00,'V','1','2021-05-05 11:41:59'),(243,346,21,19,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(244,348,3,3,10,'2020-12-02',14.90,149.00,14.90,4.93,7.00,'V','1','2021-05-05 11:41:59'),(245,349,21,19,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(246,350,21,19,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(247,351,27,25,10,'2020-12-16',26.70,267.00,26.70,3.89,10.00,'V','1','2021-05-05 11:41:59'),(248,352,21,19,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(249,353,3,3,10,'2020-12-10',15.60,156.00,15.60,6.85,10.00,'V','1','2021-05-05 11:41:59'),(250,354,27,25,10,'2020-12-16',26.70,267.00,26.70,6.59,16.50,'V','1','2021-05-05 11:41:59'),(252,361,23,21,10,'2021-01-14',30.30,303.00,30.30,2.71,8.00,'V','1','2021-05-05 11:41:59'),(254,363,23,21,10,'2021-01-14',30.30,303.00,30.30,6.69,19.00,'V','1','2021-05-05 11:41:59'),(255,364,21,19,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(256,366,23,21,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(257,367,24,23,12,'2021-05-04',14.50,174.00,14.50,31.82,42.00,'V','1','2021-05-05 11:41:59'),(258,368,24,26,0,NULL,0.00,0.00,0.00,0.00,0.00,'V','1','2021-05-05 11:41:59'),(270,374,17,27,2,'2021-05-07',2.56,5.12,2.56,36.90,1.38,'V','1','2021-06-03 08:57:30'),(271,381,17,28,200,'2021-05-14',1.18,236.00,1.18,7.27,16.00,'V','1','2021-06-04 08:54:04'),(272,382,17,28,400,'2021-05-14',1.18,472.00,1.18,68.57,192.00,'V','1','2021-06-04 09:13:36'),(273,383,17,28,200,'2021-01-14',1.20,240.00,1.20,84.62,110.00,'V','1','2021-06-04 09:13:48'),(274,360,17,15,10,'2021-05-26',26.60,266.00,26.60,1.92,5.00,'V','1','2021-06-07 23:30:48'),(275,362,17,15,10,'2021-05-26',26.60,266.00,26.60,5.98,15.00,'V','1','2021-06-08 07:49:40'),(276,380,17,15,20,'2021-05-26',26.60,532.00,26.60,16.92,77.00,'V','1','2021-06-08 07:51:12');
/*!40000 ALTER TABLE `tb_sells` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08  5:18:53
