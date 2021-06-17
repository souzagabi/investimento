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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_investiments`
--

LOCK TABLES `tb_investiments` WRITE;
/*!40000 ALTER TABLE `tb_investiments` DISABLE KEYS */;
INSERT INTO `tb_investiments` VALUES (1,1,3,1,'2020-04-24',NULL,'2021-06-16 08:55:15'),(2,1,3,1,'2020-04-24',NULL,'2021-06-17 07:42:55'),(3,1,3,1,'2020-04-24',NULL,'2021-06-17 07:44:24'),(4,1,2,3,'2020-04-27',NULL,'2021-06-17 07:45:19'),(5,1,3,1,'2020-04-27',NULL,'2021-06-17 07:46:00'),(6,1,3,1,'2020-04-27',NULL,'2021-06-17 07:46:48'),(7,1,3,1,'2020-04-27',NULL,'2021-06-17 07:47:41'),(8,1,4,2,'2020-04-27',NULL,'2021-06-17 07:48:39'),(9,1,5,4,'2020-04-27',NULL,'2021-06-17 07:49:45'),(10,1,5,4,'2020-04-27',NULL,'2021-06-17 07:52:21'),(11,1,2,3,'2020-04-28',NULL,'2021-06-17 07:53:17'),(12,1,6,5,'2020-04-28',NULL,'2021-06-17 07:54:20'),(13,1,2,3,'2020-04-30',NULL,'2021-06-17 07:56:15'),(14,1,3,1,'2020-05-05',NULL,'2021-06-17 08:22:54'),(15,1,2,3,'2020-05-06',NULL,'2021-06-17 08:50:30'),(16,1,6,5,'2020-05-06',NULL,'2021-06-17 08:51:51'),(17,1,4,2,'2020-05-06',NULL,'2021-06-17 08:53:49'),(18,1,4,2,'2020-05-06',NULL,'2021-06-17 08:54:33');
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

-- Dump completed on 2021-06-17  5:55:25
