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
INSERT INTO `tb_estoques` VALUES (1,4,'MGLU3',0,64.28,'2021-04-12 17:16:37'),(2,5,'PETR3',0,20.34,'2021-04-12 17:53:41'),(3,3,'ABEV3',0,14.40,'2021-04-12 18:48:26'),(4,6,'SPRI3',0,13.68,'2021-04-12 18:50:09'),(5,8,'ELET3',0,33.64,'2021-04-13 10:26:29'),(6,7,'KLBN11',0,19.37,'2021-04-13 10:30:37'),(7,9,'AZUL4',0,21.96,'2021-04-13 14:18:55'),(8,10,'EMBR3',0,7.96,'2021-04-13 17:01:39'),(9,11,'SUZB3',0,38.04,'2021-04-14 10:25:59'),(10,12,'PETR4',0,19.52,'2021-04-14 10:40:22'),(11,13,'SBSP3',0,54.11,'2021-04-14 10:58:37'),(12,14,'JBSS3',0,21.84,'2021-04-14 11:36:17'),(13,15,'COGN3',140,6.60,'2021-04-14 12:37:30'),(14,16,'TPIS3',0,1.23,'2021-04-14 12:48:10'),(15,17,'GOLL4',40,24.18,'2021-04-14 12:51:30'),(16,18,'AMAR3',0,7.98,'2021-04-14 13:47:51'),(17,19,'ETER3',0,4.95,'2021-04-14 17:01:01'),(18,20,'LUPA3',0,2.45,'2021-04-14 17:11:36'),(19,21,'VVAR3',73,16.91,'2021-04-14 17:25:50'),(20,22,'TIET11',0,14.67,'2021-04-14 17:40:05'),(21,23,'BBSE3',10,29.05,'2021-04-14 17:40:59'),(22,24,'TAEE11',0,15.50,'2021-04-14 17:42:33'),(23,25,'TAEE4',12,11.00,'2021-04-14 17:43:40'),(24,26,'GUAR3',105,15.84,'2021-04-14 18:17:39'),(25,27,'TOTS3',0,25.38,'2021-04-14 19:17:20'),(26,28,'TAEE3',49,10.98,'2021-04-14 20:06:45');
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

-- Dump completed on 2021-04-16  6:06:00
