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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estoques`
--

LOCK TABLES `tb_estoques` WRITE;
/*!40000 ALTER TABLE `tb_estoques` DISABLE KEYS */;
INSERT INTO `tb_estoques` VALUES (1,4,'MGLU3',0,0.00,'2021-04-13 08:16:37'),(2,5,'PETR3',0,0.00,'2021-04-13 08:53:41'),(3,3,'ABEV3',0,0.00,'2021-04-13 09:48:26'),(4,6,'SPRI3',0,0.00,'2021-04-13 09:50:09'),(5,8,'ELET3',0,0.00,'2021-04-14 01:26:29'),(6,7,'KLBN11',0,0.00,'2021-04-14 01:30:37'),(7,9,'AZUL4',0,0.00,'2021-04-14 05:18:55'),(8,10,'EMBR3',0,0.00,'2021-04-14 08:01:39'),(9,11,'SUZB3',0,0.00,'2021-04-15 01:25:59'),(10,12,'PETR4',0,0.00,'2021-04-15 01:40:22'),(11,13,'SBSP3',0,0.00,'2021-04-15 01:58:37'),(12,14,'JBSS3',0,0.00,'2021-04-15 02:36:17'),(13,15,'COGN3',140,6.59,'2021-04-15 03:37:30'),(14,16,'TPIS3',0,0.00,'2021-04-15 03:48:10'),(15,17,'GOLL4',40,25.60,'2021-04-15 03:51:30'),(16,18,'AMAR3',0,0.00,'2021-04-15 04:47:51'),(17,19,'ETER3',0,0.00,'2021-04-15 08:01:01'),(18,20,'LUPA3',0,0.00,'2021-04-15 08:11:36'),(19,21,'VVAR3',73,17.27,'2021-04-15 08:25:50'),(20,22,'TIET11',0,0.00,'2021-04-15 08:40:05'),(21,23,'BBSE3',10,29.05,'2021-04-15 08:40:59'),(22,24,'TAEE11',0,0.00,'2021-04-15 08:42:33'),(23,25,'TAEE4',12,11.00,'2021-04-15 08:43:40'),(24,26,'GUAR3',0,0.00,'2021-04-15 09:17:39'),(25,27,'TOTS3',0,0.00,'2021-04-15 10:17:20'),(26,28,'TAEE3',49,10.98,'2021-04-15 11:06:45');
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

-- Dump completed on 2021-05-11  6:23:58
