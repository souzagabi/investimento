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
-- Table structure for table `tb_buys`
--

DROP TABLE IF EXISTS `tb_buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_buys` (
  `idbuy` int(11) NOT NULL AUTO_INCREMENT,
  `idinvestiment` int(11) DEFAULT NULL,
  `idperson` int(11) NOT NULL,
  `sgcompany` varchar(20) NOT NULL,
  `qtdebuy` int(11) DEFAULT 0,
  `dtbuy` date DEFAULT NULL,
  `prcbuy` decimal(10,2) DEFAULT 0.00,
  `tlbuy` decimal(10,2) DEFAULT 0.00,
  `bprcaverage` decimal(10,2) DEFAULT 0.00,
  `tax` decimal(10,2) DEFAULT 0.00,
  `lucre` decimal(10,2) DEFAULT 0.00,
  `tptransaction` char(1) DEFAULT NULL,
  `tipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idbuy`),
  KEY `FK_buys_investiments_idx` (`idinvestiment`),
  KEY `fk_buys_persons` (`idperson`),
  CONSTRAINT `FK_buys_investiments_idx` FOREIGN KEY (`idinvestiment`) REFERENCES `tb_investiments` (`idinvestiment`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_buys_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_buys`
--

LOCK TABLES `tb_buys` WRITE;
/*!40000 ALTER TABLE `tb_buys` DISABLE KEYS */;
INSERT INTO `tb_buys` VALUES (1,372,4,'MGLU3',10,'2021-04-24',47.14,471.40,0.00,0.00,0.00,'C','1','2021-04-30 08:59:30'),(2,373,4,'MGLU3',2,'2021-04-24',46.98,93.96,0.00,0.00,0.00,'C','1','2021-04-30 09:00:54');
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

-- Dump completed on 2021-04-30  6:09:44
