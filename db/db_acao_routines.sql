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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'db_acao'
--

--
-- Dumping routines for database 'db_acao'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_delete`(
	pidinvestiment INT(11),
	pidestoque INT(11),
	pqtdetotal INT(11)
)
BEGIN

	IF pqtdetotal IS NOT NULL THEN
    BEGIN
		UPDATE tb_estoques
        SET
			qtdeestoque = pqtdetotal
		WHERE idestoque = pidestoque;
    END;
    END IF;
    
	DELETE FROM tb_investiments
    WHERE idinvestiment = pidinvestiment;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_list`(
	pstart INT(10),
    plimit INT(10)
)
BEGIN
	/*==========================================================================================*/
    /*					Filtra os registros usando  nenhum parâmetros							*/
    /*==========================================================================================*/
    SELECT distinct(p.idperson), p.*, i.*, e.*, (SELECT count(idperson) FROM tb_persons) / plimit AS pgs 
	FROM (SELECT * FROM tb_persons p  LIMIT pstart, plimit) AS p 
	INNER JOIN tb_investiments i USING(idperson) 
    INNER JOIN tb_estoques e USING(idperson)
	GROUP BY p.idperson
    ORDER BY e.sgecompany;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_list_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_list_test`(
	pstart INT(10),
    plimit INT(10)
)
BEGIN
	/*==========================================================================================*/
    /*					Filtra os registros usando nenhum parâmetros							*/
    /*==========================================================================================*/
    SELECT distinct(p.idperson), p.*, i.*, e.*, (SELECT count(idperson) FROM tb_persons) / plimit AS pgs 
	FROM (SELECT * FROM tb_persons p  LIMIT pstart, plimit) AS p 
	INNER JOIN tb_investiments i USING(idperson) 
    INNER JOIN tb_estoques e USING(idperson)
	GROUP BY p.idperson
    ORDER BY e.sgecompany;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_person`(
	pidperson INT(10)
)
BEGIN
	SELECT * 
    FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
    INNER JOIN tb_estoques e USING(idperson) 
    WHERE p.idperson = pidperson AND e.qtdeestoque > 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_save`(
	piduser INT(11),
	pdescompany VARCHAR(64),
	psgcompany VARCHAR(20),
	pdescnpj VARCHAR(20),
	pdtbuy DATE,
	pqtdebuy INT(11),
	pprcbuy DECIMAL(10,2),
	ptlbuy DECIMAL(10,2),
    ptptransaction CHAR(1),
	ptipe CHAR(1),
    pprcAverage DECIMAL(10, 2)
)
BEGIN

	DECLARE IDP INT;
    
    SELECT idperson INTO IDP FROM tb_persons WHERE sgcompany = psgcompany;

	IF IDP IS NULL THEN
		BEGIN
			INSERT INTO tb_persons (desperson, sgcompany, descpfcnpj) VALUES (psgcompany, psgcompany, pdescnpj);
		END;
        SET IDP = LAST_INSERT_ID();
	END IF;
    
    INSERT INTO tb_investiments
    (iduser, idperson, descompany, sgcompany, descnpj, dtbuy, dtsell, qtdebuy, qtdesell, prcbuy, prcsell, tlbuy, tlsell, tax, lucre, tptransaction, tipe)
    VALUES (piduser, IDP, pdescompany, psgcompany, pdescnpj, pdtbuy, pdtsell, pqtdebuy, pqtdesell, pprcbuy, pprcsell, ptlbuy, ptlsell, ptax, plucre, ptptransaction, ptipe);
    
    INSERT INTO tb_estoques (qtdeestoque, prcAverage) VALUES ((SELECT qtdeestoque FROM tb_estoques WHERE sgecompany = psgcompany) + pqtdebuy, pprcAverage);
    
    SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) WHERE p.idperson = IDP;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_save_buy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_save_buy`(
	piduser INT(11),
	pdescompany VARCHAR(64),
	psgcompany VARCHAR(20),
	pdescnpj VARCHAR(20),
	pdtbuy DATE,
	pqtdebuy INT(11),
	pprcbuy DECIMAL(10,2),
	ptlbuy DECIMAL(10,2),
    ptptransaction CHAR(1),
	ptipe CHAR(1),
    pprcaverage DECIMAL(10, 2)
)
BEGIN

	DECLARE IDP INT;
    DECLARE IDE INT;
    
    SELECT idperson INTO IDP FROM tb_persons WHERE sgcompany = psgcompany;
    SELECT idperson INTO IDE FROM tb_estoques WHERE sgecompany = psgcompany;

	IF IDP IS NULL THEN
		BEGIN
			INSERT INTO tb_persons (desperson, sgcompany, descpfcnpj) VALUES (pdescompany, psgcompany, pdescnpj);
            SET IDP = LAST_INSERT_ID();
		END;
    END IF;
    
    INSERT INTO tb_investiments
    (iduser, idperson, sgcompany, dtbuy, qtdebuy, prcbuy, tlbuy, tptransaction, tipe)
    VALUES (piduser, IDP, psgcompany, pdtbuy, pqtdebuy, pprcbuy, ptlbuy, ptptransaction, ptipe);
    
    IF IDE IS NULL THEN
    BEGIN
		INSERT INTO tb_estoques (idperson, sgecompany, qtdeestoque, prcaverage) VALUES (IDP, psgcompany, pqtdebuy, pprcaverage);
    END;    
    ELSE
    BEGIN
		UPDATE tb_estoques 
        SET 
			qtdeestoque = (SELECT SUM(e.qtdeestoque  + pqtdebuy) FROM tb_estoques e WHERE e.idperson = IDP), 
            prcaverage = ((SELECT SUM(e.qtdeestoque * e.prcaverage) FROM tb_estoques e WHERE e.idperson = IDP) + ptlbuy) / (SELECT SUM(e.qtdeestoque  + pqtdebuy) FROM tb_estoques e WHERE e.idperson = IDP)
		WHERE idperson = IDP;
    
    END;
    END IF;
    
    
    SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) WHERE p.idperson = IDP;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select`(
	psgcompany VARCHAR(20) ,
	pdtbuy DATE,
	pdtsell DATE,
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	/*==========================================================================================*/
    /*					Filtra os registros usando os nenhum parâmetros							*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
		ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell 
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtbuy >= pdtbuy) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy LIMIT pstart, plimit) AS i USING(idperson)  
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy 
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtbuy >= pdtbuy AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson)  
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell 
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtbuy >= pdtbuy) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtbuy >= pdtbuy LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtbuy >= pdtbuy AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson)
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select_buy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
<<<<<<< HEAD
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_buy`(
	pidinvestiment INT(10)
)
BEGIN
		SELECT *, sum(e.qtdeestoque - i.qtdebuy + i.qtdesell) AS qtdetotal 
        FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
        WHERE i.idinvestiment = pidinvestiment;
        
        SELECT p.idperson, p.desperson, p.descpfcnpj , i.idinvestiment, i.sgcompany, 
			i.dtbuy, i.dtsell, i.qtdebuy, i.prcbuy, i.iprcaverage, i.qtdesell, i.prcsell, 
			i.tlsell, i.tptransaction, i.tipe, i.lucre, i.tax, e.idestoque,
			(SELECT sum(tlbuy) FROM tb_investiments WHERE idperson = p.idperson) AS tlbuy , 
		sum(e.qtdeestoque + i.qtdesell - i.qtdebuy) AS qtdetotal
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.idinvestiment = pidinvestiment;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_company`(
psgcompany VARCHAR(20) ,
pdtbuy DATE,
pdtsell DATE
)
BEGIN

    /*==========================================================================================*/
    /*						Filtra os registros usando nenhum parâmetros						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND (pdtsell = '')) AND (psgcompany = '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS VAZIO, p.sgcompany, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				(sum(i.tlbuy) - sum(i.tlsell)) / (sum(i.qtdebuy) - sum(i.qtdesell))  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
		GROUP BY p.sgcompany;
=======
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select`(
	psgcompany VARCHAR(20) ,
	pdtbuy DATE,
	pdtsell DATE,
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	/*==========================================================================================*/
    /*					Filtra os registros usando os nenhum parâmetros							*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		ORDER BY i.idinvestiment;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
<<<<<<< HEAD
    IF ((pdtbuy = '') AND (pdtsell = '')) AND (psgcompany != '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson)
		WHERE i.sgcompany = psgcompany 
		GROUP BY p.sgcompany;
=======
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
		ORDER BY i.idinvestiment;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
<<<<<<< HEAD
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS SIGSELL, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson)
		WHERE i.sgcompany = psgcompany 
        AND ((i.dtbuy <= pdtsell) 
			OR (i.dtsell <= pdtsell)) 
		GROUP BY p.sgcompany;
=======
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell 
		ORDER BY p.sgcompany;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
<<<<<<< HEAD
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS SIGSELL, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson)
		WHERE i.sgcompany = psgcompany 
			AND ((i.dtbuy >= pdtbuy) 
            OR (i.dtsell >= pdtbuy))
		GROUP BY p.sgcompany;
=======
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtbuy >= pdtbuy) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy LIMIT pstart, plimit) AS i USING(idperson)  
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy 
		ORDER BY p.sgcompany;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
<<<<<<< HEAD
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS BuySell, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson)
		WHERE (i.dtbuy >= pdtbuy AND i.dtbuy <= pdtsell) 
		  OR (i.dtsell >= pdtbuy AND i.dtsell <= pdtsell) 
		GROUP BY p.sgcompany;
=======
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtbuy >= pdtbuy AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson)  
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell 
		ORDER BY p.sgcompany;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
<<<<<<< HEAD
    IF ((pdtbuy IS NOT NULL) AND (pdtsell = '')) AND (psgcompany = '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS BUY, p.sgcompany, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson)
		WHERE (i.dtbuy >= pdtbuy) 
		  OR (i.dtsell >= pdtbuy) 
		GROUP BY p.sgcompany;
=======
    IF ((pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtbuy >= pdtbuy) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtbuy >= pdtbuy LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy
		ORDER BY p.sgcompany;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
<<<<<<< HEAD
		SELECT p.idperson, p.desperson, p.desperson AS SELL, p.sgcompany, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE (i.dtbuy <= pdtsell) 
		  OR (i.dtsell <= pdtsell) 
		GROUP BY p.sgcompany;
=======
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
<<<<<<< HEAD
    IF (pdtbuy != '' AND pdtsell != '') AND (psgcompany != '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS CHEIO, p.sgcompany, p.descpfcnpj, 
				sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, 
                sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
				e.prcaverage  AS average,
                (sum(i.tlbuy) - sum(i.tlsell)) AS vlrtotal  
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND ((i.dtbuy >= pdtbuy AND i.dtbuy <= pdtsell) 
			OR (i.dtsell >= pdtbuy AND i.dtsell <= pdtsell) )
		GROUP BY p.sgcompany;
=======
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtbuy >= pdtbuy AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson)
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
    END;
    END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select_estoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_estoque`(
	psgcompany VARCHAR(20),
	pdtbuy DATE,
	pdtsell DATE,
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	
    /*==========================================================================================*/
    /*						Filtra os registros usando nenhum parâmetros						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS VAZIO, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
   IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF (pdtbuy = '' OR pdtbuy IS NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGSell, p.sgcompany, p.descpfcnpj,
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND  i.dtsell <= pdtsell
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
   /* IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGBuy, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
    END;
    END IF;*/
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
   /* IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS DtDt, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
    END;
    END IF;*/
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		DECLARE bTotal INT; 
		SELECT sum(qtdebuy) INTO bTotal FROM tb_investiments WHERE dtbuy >= pdtbuy GROUP BY sgcompany;
        
		SELECT p.idperson, p.desperson, p.desperson AS Buy, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
        /*SET i.qtdesell = bTotal;*/
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS Sell, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    /*IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGDtDt, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		GROUP BY p.sgcompany;
    END;
    END IF;*/
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select_estoque_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_estoque_test`(
	psgcompany VARCHAR(20),
	pdtbuy DATE,
	pdtsell DATE,
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	
    /*==========================================================================================*/
    /*						Filtra os registros usando nenhum parâmetros						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.descpfcnpj,
			(SELECT count(idperson)FROM tb_persons) / plimit AS pgs,
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM (SELECT * FROM tb_persons p LIMIT pstart, plimit) AS p 
		INNER JOIN tb_investiments i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
   IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF (pdtbuy = '' OR pdtbuy IS NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGSell, p.sgcompany, p.descpfcnpj,
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND  i.dtsell <= pdtsell
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
   /* IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGBuy, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
    END;
    END IF;*/
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
   /* IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS DtDt, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
    END;
    END IF;*/
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS Buy, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
        /*SET i.qtdesell = bTotal;*/
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS Sell, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    /*IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGDtDt, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(i.qtdebuy) - sum(i.qtdesell)) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		GROUP BY p.sgcompany;
    END;
    END IF;*/
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select_teste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_teste`(
	psgcompany VARCHAR(20) ,
	pdtbuy DATE,
	pdtsell DATE,
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	/*==========================================================================================*/
    /*					Filtra os registros usando os nenhum parâmetros							*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
		ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell 
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtbuy >= pdtbuy) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy LIMIT pstart, plimit) AS i USING(idperson)  
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy 
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtbuy >= pdtbuy AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson)  
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell 
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtbuy >= pdtbuy) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtbuy >= pdtbuy LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany AND dtbuy >= pdtbuy AND dtsell <= pdtsell) / plimit AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell LIMIT pstart, plimit) AS i USING(idperson)
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_update_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_update_save`(
	pidinvestiment INT(11), 
	pidperson INT(11),      
	piduser INT(11),        
	pdesperson VARCHAR(64),
	psgcompany VARCHAR(20), 
	pdescnpj VARCHAR(20),   
	pdtbuy DATE,            
	pdtsell DATE,           
	pqtdebuy INT(11),       
	pqtdesell INT(11),      
	pprcbuy DECIMAL(10,2),  
	pprcsell DECIMAL(10,2), 
	ptlbuy DECIMAL(10,2),   
	ptlsell DECIMAL(10,2),  
	ptax DECIMAL(10,2),     
	plucre DECIMAL(10,2),   
	ptipe CHAR(1),          
	pidestoque INT(11),     
	psgecompany VARCHAR(20),
    pqtdeestoque INT(11),
    ptptransaction CHAR(1),
    piprcaverage DECIMAL(10,2)
)
BEGIN
	DECLARE IDP INT;
    
    SELECT idperson INTO IDP FROM tb_persons WHERE sgcompany = psgcompany;
    
    IF IDP IS NULL THEN
		BEGIN
			INSERT INTO tb_persons (desperson, sgcompany, descpfcnpj) VALUES (pdesperson, psgcompany, pdescnpj);
		END;
        SET IDP = LAST_INSERT_ID();
	END IF;
    
    UPDATE tb_investiments
    SET
		sgcompany     = psgcompany,
		dtbuy         = pdtbuy,
		dtsell        = pdtsell,
		qtdebuy       = pqtdebuy,
        iprcaverage   = piprcaverage,
		qtdesell      = pqtdesell,
		prcbuy        = pprcbuy,
		prcsell       = pprcsell,
		tlbuy         = ptlbuy,
		tlsell        = ptlsell,
		tax           = ptax,
		lucre         = plucre,
		tipe          = ptipe
    WHERE idinvestiment = pidinvestiment;
    
	UPDATE tb_estoques
	SET
		qtdeestoque = pqtdeestoque
	WHERE idestoque = pidestoque;
    
    SELECT * FROM tb_person p INNER JOIN tb_estoques e USING(idperson) WHERE p.idperson = IDP;    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_persons_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_persons_delete`(
	pidperson INT(11))
BEGIN

	DECLARE ID INT;
    DECLARE IDE INT;
    
    SELECT idestoque INTO IDE FROM tb_estoques WHERE idperson = pidperson;
	SELECT iduser INTO ID FROM tb_users WHERE idperson = pidperson;
    
    IF IDE IS NOT NULL THEN
    BEGIN
		DELETE FROM tb_estoques WHERE idestoque = IDE;
    END;
    END IF;
    
    IF ID IS NOT NULL THEN
    BEGIN
		DELETE FROM tb_users WHERE iduser = ID;
    END;
    END IF;
    
	DELETE FROM tb_persons 
    WHERE idperson = pidperson;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_persons_update_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_persons_update_save`(
	pidperson INT (11), 
    pdesperson VARCHAR (64),
    psgcompany VARCHAR(20),
    pdescpfcnpj VARCHAR(20)
)
BEGIN

	DECLARE IDE INT;
    
    SELECT idperson INTO IDE FROM tb_estoques WHERE idperson = pidperson;
        
    IF IDE IS NOT NULL THEN
	BEGIN
		UPDATE tb_estoques
		SET
			sgecompany = psgcompany
		WHERE idperson = IDE;
	END;
    END IF;

	UPDATE tb_persons
    SET
		desperson     = pdesperson,
		sgcompany     = psgcompany,
        descpfcnpj    = pdescpfcnpj
        
    WHERE idperson    = pidperson;
    
    SELECT * FROM tb_persons WHERE idperson = pidperson;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete`(
	piduser INT
)
BEGIN
	DELETE FROM tb_users
    WHERE iduser = piduser;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_save`(
pdesperson VARCHAR(64),
psgcompany VARCHAR(20),
pdescpfcnpj VARCHAR(20),
pdeslogin VARCHAR(64),
pdespassword VARCHAR(256),
pinadmin TINYINT

)
BEGIN
	DECLARE vidperson INT;
	INSERT INTO tb_persons (desperson, sgcompany, descpfcnpj)
	VALUES (pdesperson, psgcompany, pdescpfcnpj);
	
	SET vidperson = LAST_INSERT_ID();
	
	INSERT INTO tb_users (idperson, deslogin, despassword, inadmin)
	VALUES (vidperson, pdeslogin, pdespassword, pinadmin);
	
	SELECT * FROM tb_users a INNER JOIN tb_persons n USING(idperson) WHERE a.iduser = LAST_INSERT_ID();
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_update_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_update_save`(
	piduser INT(11),
	pidperson INT(11),
	pdesperson VARCHAR(64),
	pdescpfcnpj VARCHAR(20),
	psgcompany VARCHAR(20),
	pdeslogin VARCHAR(64),
	pdespassword VARCHAR(256),
	pinadmin TINYINT(1)
)
BEGIN
	DECLARE IDP INT;
    
    SELECT idperson INTO IDP FROM tb_persons WHERE idperson = pidperson;
    
    IF IDP IS NOT NULL THEN
    BEGIN
		UPDATE tb_persons
		SET
			desperson     = pdesperson,
			sgcompany     = psgcompany,
			descpfcnpj    = pdescpfcnpj
			
		WHERE idperson    = pidperson;
    END;
    END IF;
    
	UPDATE tb_users
    SET
		deslogin = pdeslogin,
        inadmin = pinadmin
    WHERE iduser = piduser;
    
    SELECT * FROM tb_users WHERE iduser = piduser;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

<<<<<<< HEAD
-- Dump completed on 2021-04-29 17:31:16
=======
-- Dump completed on 2021-04-29  6:21:02
>>>>>>> 2ab6d4e8168744da3562ebd9ae6afd99d9fce723
