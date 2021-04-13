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
-- Table structure for table `tb_estoques`
--

DROP TABLE IF EXISTS `tb_estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estoques` (
  `idestoque` int(11) NOT NULL AUTO_INCREMENT,
  `idperson` int(11) DEFAULT NULL,
  `sgecompany` varchar(20) DEFAULT NULL,
  `qtdeestoque` int(11) DEFAULT NULL,
  `prcaverage` decimal(10,2) DEFAULT NULL,
  `dteregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idestoque`),
  KEY `FK_estoques_persons_idx` (`idperson`),
  CONSTRAINT `fk_estoques_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estoques`
--

LOCK TABLES `tb_estoques` WRITE;
/*!40000 ALTER TABLE `tb_estoques` DISABLE KEYS */;
INSERT INTO `tb_estoques` VALUES (1,4,'MGLU3',0,57.66,'2021-04-12 17:16:37'),(2,5,'PETR3',11,19.46,'2021-04-12 17:53:41'),(3,3,'ABEV3',5,11.85,'2021-04-12 18:48:26'),(4,6,'SPRI3',2,25.59,'2021-04-12 18:50:09'),(5,8,'ELET3',0,23.71,'2021-04-13 10:26:29'),(6,7,'KLBN11',7,19.66,'2021-04-13 10:30:37'),(7,9,'AZUL4',10,15.25,'2021-04-13 14:18:55'),(8,10,'EMBR3',1,6.52,'2021-04-13 17:01:39');
/*!40000 ALTER TABLE `tb_estoques` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 17:39:23
