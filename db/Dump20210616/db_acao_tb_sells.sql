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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sells`
--

LOCK TABLES `tb_sells` WRITE;
/*!40000 ALTER TABLE `tb_sells` DISABLE KEYS */;
INSERT INTO `tb_sells` VALUES (1,1,3,1,2,'2020-04-24',47.28,94.56,47.28,0.30,0.28,'V','1','2021-06-16 08:56:42');
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

-- Dump completed on 2021-06-16  6:03:12
