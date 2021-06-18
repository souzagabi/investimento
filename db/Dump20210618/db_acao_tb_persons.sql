CREATE DATABASE  IF NOT EXISTS `db_acao` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_acao`;
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
-- Table structure for table `tb_persons`
--

DROP TABLE IF EXISTS `tb_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_persons` (
  `idperson` int NOT NULL AUTO_INCREMENT,
  `desperson` varchar(64) NOT NULL,
  `descpfcnpj` varchar(20) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_persons`
--

LOCK TABLES `tb_persons` WRITE;
/*!40000 ALTER TABLE `tb_persons` DISABLE KEYS */;
INSERT INTO `tb_persons` VALUES (1,'Gabriel Alves','14573057803','2021-03-01 09:00:00'),(2,'AMBEV S.A.','07.526.557/0001-00','2021-04-12 14:21:21'),(3,'MAGAZINE LUIZA S.A.','47.960.950/0001-21','2021-04-12 14:22:09'),(4,'PETROLEO BRASILEIRO S.A.','33.000.167/0001-01','2021-04-12 20:53:40'),(5,'SPRINGER S.A','92.929.520/0001-00','2021-04-12 21:48:25'),(6,'KLABIN S.A.','89.637.490/0001-45','2021-04-13 13:30:36'),(7,'CENTRAIS ELET BRAS S.A.','00.001.180/0001-26','2021-04-13 06:00:00'),(8,'AZUL S.A.','09.305.994/0001-29','2021-04-13 17:18:54'),(9,'EMBRAER S.A.','07.689.002/0001-89','2021-04-13 20:01:39'),(10,'SUZANO S.A.','16.404.287/0001-55','2021-04-14 13:25:59'),(11,'CIA SANEAMENTO BASICO EST SAO PAULO','43.776.517/0001-80','2021-04-14 13:58:36'),(12,'JBS S.A.','02.916.265/0001-60','2021-04-14 14:36:16'),(13,'KROTON EDUCACIONAL S.A.','02.800.026/0001-40','2021-04-14 15:37:30'),(14,'TPI - TRIUNFO PARTICIP. E INVEST. S.A.','03.014.553/0001-91','2021-04-14 15:48:09'),(15,'GOL LINHAS AEREAS INTELIGENTES S.A.','06.164.253/0001-87','2021-04-14 15:51:30'),(16,'MARISA LOJAS S.A.','61.189.288/0001-89','2021-04-14 16:47:51'),(17,'ETERNIT S.A.','61.092.037/0001-81','2021-04-14 20:01:00'),(18,'LUPATECH S.A.','89.463.822/0001-12','2021-04-14 20:11:36'),(19,'VIA VAREJO S.A.','33.041.260/0652-90','2021-04-14 20:25:50'),(20,'AES TIETE ENERGIA SA','04.128.563/0001-10','2021-04-14 20:40:05'),(21,'BB SEGURIDADE PARTICIPAÇÕES S.A.','17.344.597/0001-94','2021-04-14 20:40:58'),(22,'TRANSMISSORA ALIANÇA DE ENERGIA ELÉTRICA S.A.','07.859.971/0001-30','2021-04-14 20:42:32'),(23,'GUARARAPES CONFECCOES S.A.','08.402.943/0001-52','2021-04-14 21:17:39'),(24,'TOTVS S.A.','53.113.791/0001-22','2021-04-14 22:17:20');
/*!40000 ALTER TABLE `tb_persons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-18  5:55:34
