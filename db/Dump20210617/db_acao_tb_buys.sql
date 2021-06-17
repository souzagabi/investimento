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
-- Table structure for table `tb_buys`
--

DROP TABLE IF EXISTS `tb_buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_buys` (
  `idbuy` int NOT NULL AUTO_INCREMENT,
  `idinvestiment` int DEFAULT NULL,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  `qtdebuy` int DEFAULT '0',
  `dtbuy` date DEFAULT NULL,
  `prcbuy` decimal(10,2) DEFAULT '0.00',
  `tlbuy` decimal(10,2) DEFAULT '0.00',
  `bprcaverage` decimal(10,2) DEFAULT '0.00',
  `btptransaction` char(1) DEFAULT NULL,
  `btipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbuy`),
  KEY `FK_buys_investiments_idx` (`idinvestiment`),
  KEY `fk_buys_persons` (`idperson`),
  KEY `fk_buys_sgcompany_idx` (`idsgcompany`),
  CONSTRAINT `FK_buys_investiments_idx` FOREIGN KEY (`idinvestiment`) REFERENCES `tb_investiments` (`idinvestiment`) ON DELETE CASCADE,
  CONSTRAINT `fk_buys_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `fk_buys_sgcompany` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_buys`
--

LOCK TABLES `tb_buys` WRITE;
/*!40000 ALTER TABLE `tb_buys` DISABLE KEYS */;
INSERT INTO `tb_buys` VALUES (1,1,3,1,2,'2020-04-24',47.14,94.28,47.14,'C','1','2021-06-16 08:56:42'),(2,2,3,1,2,'2020-04-24',46.98,93.96,46.98,'C','2','2021-06-17 07:42:55'),(3,3,3,1,2,'2020-04-24',46.95,93.90,46.95,'C','1','2021-06-17 07:44:24'),(4,4,2,3,2,'2020-04-27',11.63,23.26,11.63,'C','2','2021-06-17 07:45:19'),(5,5,3,1,2,'2020-04-27',48.11,96.22,48.11,'C','2','2021-06-17 07:46:00'),(6,6,3,1,2,'2020-04-27',48.54,97.08,48.54,'C','1','2021-06-17 07:46:48'),(7,7,3,1,2,'2020-04-27',48.53,97.06,48.53,'C','2','2021-06-17 07:47:41'),(8,8,4,2,2,'2020-04-27',16.45,32.90,16.45,'C','2','2021-06-17 07:48:39'),(9,9,5,4,2,'2020-04-27',26.19,52.38,26.19,'C','1','2021-06-17 07:49:45'),(10,10,5,4,2,'2020-04-27',25.59,51.18,25.59,'C','1','2021-06-17 07:52:21'),(11,11,2,3,2,'2020-04-28',11.79,23.58,11.79,'C','1','2021-06-17 07:53:17'),(12,12,6,5,2,'2020-04-28',18.09,36.18,18.09,'C','1','2021-06-17 07:54:20'),(13,13,2,3,2,'2020-04-30',11.38,22.76,11.38,'C','1','2021-06-17 07:56:15'),(14,14,3,1,1,'2020-05-05',51.77,51.77,51.77,'C','1','2021-06-17 08:22:54'),(15,15,2,3,2,'2020-05-06',12.00,24.00,12.00,'C','1','2021-06-17 08:50:30'),(16,16,6,5,2,'2020-05-06',18.74,37.48,18.74,'C','1','2021-06-17 08:51:51'),(17,17,4,2,2,'2020-05-06',18.34,36.68,18.34,'C','1','2021-06-17 08:53:49'),(18,18,4,2,2,'2020-05-06',18.28,36.56,18.28,'C','1','2021-06-17 08:54:33');
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

-- Dump completed on 2021-06-17  5:55:24
