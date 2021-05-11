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
-- Table structure for table `tb_persons`
--

DROP TABLE IF EXISTS `tb_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_persons` (
  `idperson` int(11) NOT NULL AUTO_INCREMENT,
  `desperson` varchar(64) NOT NULL,
  `sgcompany` varchar(20) DEFAULT NULL,
  `descpfcnpj` varchar(20) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_persons`
--

LOCK TABLES `tb_persons` WRITE;
/*!40000 ALTER TABLE `tb_persons` DISABLE KEYS */;
INSERT INTO `tb_persons` VALUES (1,'Gabriel Alves','GS','14573057803','2021-03-01 06:00:00'),(2,'Suporte','SP','12354865202','2021-03-15 19:10:27'),(3,'AMBEV S.A.','ABEV3','07.526.557/0001-00','2021-04-12 11:21:21'),(4,'MAGAZINE LUIZA S.A.','MGLU3','47.960.950/0001-21','2021-04-12 11:22:09'),(5,'PETROLEO BRASILEIRO S.A.','PETR3','33.000.167/0001-01','2021-04-12 17:53:40'),(6,'SPRINGER S.A','SPRI3','92.929.520/0001-00','2021-04-12 18:48:25'),(7,'KLABIN S.A.','KLBN11','89.637.490/0001-45','2021-04-13 10:30:36'),(8,'CENTRAIS ELET BRAS S.A.','ELET3','00.001.180/0001-26','2021-04-13 03:00:00'),(9,'AZUL S.A.','AZUL4','09.305.994/0001-29','2021-04-13 14:18:54'),(10,'EMBRAER S.A.','EMBR3','07.689.002/0001-89','2021-04-13 17:01:39'),(11,'SUZANO S.A.','SUZB3','16.404.287/0001-55','2021-04-14 10:25:59'),(12,'PETROLEO BRASILEIRO S.A.','PETR4','33.000.167/0001-01','2021-04-15 10:37:25'),(13,'CIA SANEAMENTO BASICO EST SAO PAULO','SBSP3','43.776.517/0001-80','2021-04-14 10:58:36'),(14,'JBS S.A.','JBSS3','02.916.265/0001-60','2021-04-14 11:36:16'),(15,'KROTON EDUCACIONAL S.A.','COGN3','02.800.026/0001-40','2021-04-14 12:37:30'),(16,'TPI - TRIUNFO PARTICIP. E INVEST. S.A.','TPIS3','03.014.553/0001-91','2021-04-14 12:48:09'),(17,'GOL LINHAS AEREAS INTELIGENTES S.A.','GOLL4','06.164.253/0001-87','2021-04-14 12:51:30'),(18,'MARISA LOJAS S.A.','AMAR3','61.189.288/0001-89','2021-04-14 13:47:51'),(19,'ETERNIT S.A.','ETER3','61.092.037/0001-81','2021-04-14 17:01:00'),(20,'LUPATECH S.A.','LUPA3','89.463.822/0001-12','2021-04-14 17:11:36'),(21,'VIA VAREJO S.A.','VVAR3','33.041.260/0652-90','2021-04-14 17:25:50'),(22,'AES TIETE ENERGIA SA','TIET11','04.128.563/0001-10','2021-04-14 17:40:05'),(23,'BB SEGURIDADE PARTICIPAÇÕES S.A.','BBSE3','17.344.597/0001-94','2021-04-14 17:40:58'),(24,'TRANSMISSORA ALIANÇA DE ENERGIA ELÉTRICA S.A.','TAEE11','07.859.971/0001-30','2021-04-14 17:42:32'),(25,'TRANSMISSORA ALIANÇA DE ENERGIA ELÉTRICA S.A.','TAEE4','07.859.971/0001-30','2021-04-14 17:43:40'),(26,'GUARARAPES CONFECCOES S.A.','GUAR3','08.402.943/0001-52','2021-04-14 18:17:39'),(27,'TOTVS S.A.','TOTS3','53.113.791/0001-22','2021-04-14 19:17:20'),(28,'TRANSMISSORA ALIANÇA DE ENERGIA ELÉTRICA S.A.','TAEE3','07.859.971/0001-30','2021-04-14 20:06:44');
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

-- Dump completed on 2021-05-11  6:23:58
