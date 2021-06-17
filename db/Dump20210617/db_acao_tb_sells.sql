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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sells`
--

LOCK TABLES `tb_sells` WRITE;
/*!40000 ALTER TABLE `tb_sells` DISABLE KEYS */;
INSERT INTO `tb_sells` VALUES (1,1,3,1,2,'2020-04-24',47.28,94.56,47.28,0.30,0.28,'V','1','2021-06-16 08:56:42'),(2,2,3,1,2,'2020-04-24',47.28,94.56,47.28,0.64,0.60,'V','2','2021-06-17 07:42:55'),(3,3,3,1,2,'2020-04-27',48.43,96.86,48.43,3.15,2.96,'V','1','2021-06-17 07:44:24'),(4,4,2,3,2,'2020-04-27',11.69,23.38,11.69,0.52,0.12,'V','2','2021-06-17 07:45:19'),(5,5,3,1,2,'2020-04-27',48.60,97.20,48.60,1.02,0.98,'V','2','2021-06-17 07:46:00'),(6,6,3,1,2,'2020-04-27',48.75,97.50,48.75,0.43,0.42,'V','2','2021-06-17 07:46:48'),(7,7,3,1,2,'2020-04-27',48.72,97.44,48.72,0.39,0.38,'V','2','2021-06-17 07:47:41'),(8,8,4,2,2,'2020-04-27',16.50,33.00,16.50,0.30,0.10,'V','2','2021-06-17 07:48:39'),(9,9,5,4,2,'2020-04-28',26.00,52.00,26.00,-0.73,-0.38,'V','1','2021-06-17 07:49:45'),(10,10,5,4,2,NULL,10.51,21.02,10.51,-58.93,-30.16,'V','1','2021-06-17 07:52:21'),(11,11,2,3,2,'2020-04-29',11.87,23.74,11.87,0.68,0.16,'V','1','2021-06-17 07:53:17'),(12,12,6,5,2,'2020-05-05',18.74,37.48,18.74,3.59,1.30,'V','1','2021-06-17 07:54:20'),(13,13,2,3,2,'2020-05-04',11.48,22.96,11.48,0.88,0.20,'V','1','2021-06-17 07:56:15'),(14,14,3,1,1,'2020-05-06',53.46,53.46,53.46,3.26,1.69,'V','1','2021-06-17 08:22:54'),(15,15,2,3,2,'2020-05-06',12.18,24.36,12.18,1.50,0.36,'V','1','2021-06-17 08:50:30'),(16,16,6,5,2,'2020-05-07',19.55,39.10,19.55,4.32,1.62,'V','1','2021-06-17 08:51:51'),(17,17,4,2,2,'2020-05-07',18.54,37.08,18.54,1.09,0.40,'V','1','2021-06-17 08:53:49'),(18,18,4,2,2,'2020-05-08',18.85,37.70,18.85,3.12,1.14,'V','1','2021-06-17 08:54:33');
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

-- Dump completed on 2021-06-17  5:55:24
