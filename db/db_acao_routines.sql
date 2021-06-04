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
-- Dumping events for database 'db_acao'
--

--
-- Dumping routines for database 'db_acao'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_list`(
	pstart INT(10),
    plimit INT(10)
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
	/*==========================================================================================*/
    /*					Filtra os registros usando  nenhum parâmetros							*/
    /*==========================================================================================*/
    
    SET @sql = CONCAT('SELECT distinct(p.idperson), p.*, i.*, e.*, (SELECT count(idperson) FROM tb_persons) / ', plimit, ' AS pgs ');
	SET @sql = CONCAT(@sql,' FROM tb_persons p ');
    SET @sql = CONCAT(@sql,' INNER JOIN tb_investiments i USING(idperson) ');
    SET @sql = CONCAT(@sql,' INNER JOIN tb_estoques e WHERE e.idperson = i.idperson ');
    SET @sql = CONCAT(@sql,' GROUP BY p.idperson ');
    SET @sql = CONCAT(@sql,' ORDER BY e.sgecompany ');
    SET @sql = CONCAT(@sql,'  LIMIT ',pstart,',', plimit,';');
    
	PREPARE STMT FROM @sql;
    EXECUTE STMT;
    
    IF EX = 1 THEN
		SET MESSAGE = "Erro ao filtrar registro na tabela tb_persons com parêmetros vazio." ;
	END IF;
    #SELECT @sql;
    IF EX = 1 THEN
		#SELECT MESSAGE;
		ROLLBACK;
	ELSE
		#SELECT "Registros filtrado com sucesso!" AS MESSAGE;
        COMMIT;
	END IF; #Fim do if EX = 1 THEN
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_list_all_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_list_all_id`()
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
	SET @sql = CONCAT('SELECT idinvestiment FROM tb_investiments;');
    
    PREPARE STMT FROM @sql;
    EXECUTE STMT;
    
    IF EX = 1 THEN
		SELECT "Erro ao filtrar IDs na tabela idinvestiment com parêmetros vazio." AS MESSAGE;
	END IF;
    
    IF EX = 1 THEN
		ROLLBACK;
	ELSE
		#SELECT "Registros filtrado com sucesso!" AS MESSAGE;
        COMMIT;
	END IF; #Fim do if EX = 1 THEN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
			INSERT INTO tb_persons (desperson, sgcompany, descpfcnpj) VALUES (pdescompany, psgcompany, pdescnpj);
		END;
        SET IDP = LAST_INSERT_ID();
	END IF;
    
    INSERT INTO tb_investiments
    (iduser, idperson, sgcompany, dtbuy, dtsell, qtdebuy, qtdesell, prcbuy, prcsell, tlbuy, tlsell, tax, lucre, tptransaction, tipe)
    VALUES (piduser, IDP, psgcompany, pdtbuy, pdtsell, pqtdebuy, pqtdesell, pprcbuy, pprcsell, ptlbuy, ptlsell, ptax, plucre, ptptransaction, ptipe);
    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
	#Variável para receber o erro que acontecer
    
    DECLARE IDP, IDE, IDI, QTDE INT;
    DECLARE AVERAGE DECIMAL(10,2);
    DECLARE MESSAGE VARCHAR(200);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID." MESSAGE;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MESSAGE;
    START TRANSACTION;
	
	SELECT idperson INTO IDP FROM tb_persons WHERE sgcompany = psgcompany;
	SELECT idestoque INTO IDE FROM tb_estoques WHERE sgecompany = psgcompany;

	IF IDP IS NULL THEN
		INSERT INTO tb_persons (desperson, sgcompany, descpfcnpj) VALUES (pdescompany, psgcompany, pdescnpj);
		SET IDP = LAST_INSERT_ID();
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Persons";
		END IF;
    END IF;
    
	INSERT INTO tb_investiments (iduser, idperson, dtbuy, sgcompany) VALUES (piduser, IDP, pdtbuy, psgcompany);
	SET IDI = LAST_INSERT_ID();
	
	IF EX = 1 THEN
		SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Investimens";
	END IF;
	INSERT INTO tb_buys
		(idinvestiment, idperson, sgcompany, dtbuy, qtdebuy, prcbuy, tlbuy, bprcaverage, btptransaction, btipe)
		VALUES (IDI, IDP, psgcompany, pdtbuy, pqtdebuy, pprcbuy, ptlbuy, pprcaverage, ptptransaction, ptipe);
	
    IF EX = 1 THEN
		SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Buys";
    END IF; 
    
	IF IDE IS NULL THEN
		INSERT INTO tb_estoques (idperson, sgecompany, qtdeestoque, prcaverage) VALUES (IDP,psgcompany, pqtdebuy,pprcaverage);
		IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Estoques";
		 END IF;
	ELSE
		SELECT qtdeestoque  + pqtdebuy INTO QTDE FROM tb_estoques e WHERE idestoque = IDE;
		SELECT ((qtdeestoque * prcaverage) + ptlbuy ) / QTDE INTO AVERAGE FROM tb_estoques e WHERE idestoque = IDE;
		
		UPDATE tb_estoques
		SET 
			qtdeestoque = QTDE,
			prcaverage = AVERAGE
		WHERE idestoque = IDE;
		
		IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao atualizar registro na tabela Estoques";
		 END IF;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "SUCCESS: Dados gravar com sucesso!!" ;
		SELECT MESSAGE;
        COMMIT;
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_save_sell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_save_sell`(
	piduser INT(11),
	pdescompany VARCHAR(64),
	psgcompany VARCHAR(20),
	pdtsell DATE,
	pqtdesell INT(11),
	pprcsell DECIMAL(10,2),
	ptlsell DECIMAL(10,2),    
	ptptransaction CHAR(1),
	ptipe CHAR(1), 
	pprcaverage DECIMAL(10, 2)

)
BEGIN

	DECLARE IDE INT;
    
    SELECT idperson INTO IDE FROM tb_estoques WHERE sgecompany = psgcompany;

    INSERT INTO tb_investiments
		(iduser, idperson, sgcompany, dtsell, qtdesell, prcsell, tlsell, tptransaction, tipe)
		VALUES (piduser, IDE, psgcompany, pdtsell, pqtdesell, pprcsell, ptlsell, ptptransaction, ptipe);
    
    IF IDE IS NOT NULL THEN
    BEGIN
		UPDATE tb_estoques SET qtdeestoque = (SELECT SUM(e.qtdeestoque - pqtdesell) FROM tb_estoques e WHERE e.idperson = IDE)
		WHERE idperson = IDE;
        CASE 
			WHEN  (SELECT SUM(e.qtdeestoque - pqtdesell) FROM tb_estoques e WHERE e.idperson = IDE) = 0 THEN
				UPDATE tb_estoques
					SET prcaverage = 0;
		END CASE;
    END;
    END IF;
    
    
    SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) WHERE p.idperson = IDE;
    
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_buy`(
	pidinvestiment INT(10)
)
BEGIN
		SELECT i.idinvestiment, p.idperson, p.desperson, p.descpfcnpj , i.iduser, i.sgcompany, 
			b.dtbuy, b.qtdebuy, b.prcbuy, b.tlbuy, b.bprcaverage, b.btptransaction, b.btipe,
            s.dtsell, s.qtdesell, s.prcsell, s.tlsell, s.sprcaverage, s.stptransaction, s.stipe, 
            s.lucre, s.tax, e.idestoque, e.sgecompany AS sgecompany, e.prcaverage,
			e.qtdeestoque AS qtdetotal, s.qtdesell, b.qtdebuy
		FROM tb_persons p 
		INNER JOIN tb_investiments i ON i.idperson = p.idperson
        INNER JOIN tb_buys b ON b.idinvestiment = i.idinvestiment
        LEFT JOIN tb_sells s ON s.idinvestiment = i.idinvestiment
		LEFT JOIN tb_estoques e ON e.idperson = p.idperson
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
		SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtsell != '') AND (psgcompany != '') THEN
    BEGIN
		SELECT *, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND (pdtsell = '')) AND (psgcompany != '') THEN
    BEGIN
		SELECT * 
        FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
        WHERE i.sgcompany = psgcompany
        ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND pdtsell != '') AND (psgcompany != '') THEN
    BEGIN
		SELECT *, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND (pdtsell = '')) AND (psgcompany != '') THEN
    BEGIN
		SELECT *, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND i.dtbuy >= pdtbuy 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtsell != '') AND (psgcompany = '') THEN
    BEGIN
		SELECT *, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy IS NOT NULL) AND (pdtsell = '')) AND (psgcompany = '') THEN
    BEGIN
		SELECT *, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND pdtsell != '') AND (psgcompany = '') THEN
    BEGIN
		SELECT *, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.dtsell <= pdtsell
		GROUP BY p.sgcompany;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_estoque`(
	psgcompany VARCHAR(20) ,
	pdtbuy VARCHAR(10),
	pdtsell VARCHAR(10),
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
	
    IF pdtbuy IS NULL AND pdtbuy = '' THEN
		SET pdtbuy = '2020-04-01';
    END IF;
    /*==========================================================================================*/
    /*						Filtra os registros usando nenhum parâmetros						*/
    /*==========================================================================================*/
   IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SET @sql = CONCAT('SELECT p.idperson, p.desperson, p.sgcompany, p.descpfcnpj, ');
		SET @sql = CONCAT(@sql,' (SELECT count(idperson) FROM tb_persons) / ',plimit,' AS pgs, ');
        
		SET @sql = CONCAT(@sql, '(SELECT sum(bb.qtdebuy) FROM tb_persons pp INNER JOIN tb_buys bb USING(idperson) '); 
        SET @sql = CONCAT(@sql, ') AS buyTotal , ');
        
		SET @sql = CONCAT(@sql, '(SELECT sum(ss.qtdesell) FROM tb_sells ss ');
        SET @sql = CONCAT(@sql, ') AS sellTotal, ');
        
		SET @sql = CONCAT(@sql, '(SELECT sum(bb.qtdebuy) FROM tb_buys bb ');
        SET @sql = CONCAT(@sql, ') - (SELECT sum(ss.qtdesell) FROM tb_sells ss ');
        SET @sql = CONCAT(@sql, ') AS qtdeTotal, ');
        
        SET @sql = CONCAT(@sql,' e.prcaverage AS average,');
        
        SET @sql = CONCAT(@sql, 'e.prcaverage * ((SELECT sum(bb.qtdebuy) FROM tb_buys bb ');
        SET @sql = CONCAT(@sql, ') - (SELECT sum(ss.qtdesell) FROM tb_sells ss ');
        SET @sql = CONCAT(@sql, ')) AS vlrtotal ');
        
        
		SET @sql = CONCAT(@sql,' FROM tb_persons p ');
		SET @sql = CONCAT(@sql,' INNER JOIN tb_investiments i USING(idperson) ');
		SET @sql = CONCAT(@sql,' INNER JOIN tb_estoques e USING(idperson) ');
		
        SET @sql = CONCAT(@sql,' WHERE i.idinvestiment IS NOT NULL ');
        
        SET @sql = CONCAT(@sql,' GROUP BY p.sgcompany ');
        
        SET @sql = CONCAT(@sql, 'LIMIT ',pstart,', ',plimit,'; ');
        
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar IDs na tabela idinvestiment com parêmetros vazio.";
		END IF;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS SIGLA,  p.descpfcnpj, 
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_buys b USING(idperson) 
        INNER JOIN tb_sells s USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany 
		GROUP BY p.sgcompany;
        
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro company.";
		END IF;
    END;
    END IF;
    
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF (pdtbuy = '' OR pdtbuy IS NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS SIGSELL,  p.descpfcnpj,
			(SELECT count(idperson) FROM tb_persons) / plimit AS pgs, 
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM (SELECT * FROM tb_persons p LIMIT pstart, plimit) AS p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND s.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro company e data sell.";
		END IF;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS SIGBUY,  p.descpfcnpj,
			(SELECT count(idperson) FROM tb_persons) / plimit AS pgs,  
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM (SELECT * FROM tb_persons p LIMIT pstart, plimit) AS p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND s.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro company e data buy.";
		END IF;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS BUYSELL,  p.descpfcnpj,
			(SELECT count(idperson) FROM tb_persons) / plimit AS pgs,  
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM (SELECT * FROM tb_persons p LIMIT pstart, plimit) AS p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE s.dtbuy >= pdtbuy AND s.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro datas.";
		END IF;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell = '' OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS BUY,  p.descpfcnpj,
			(SELECT count(idperson) FROM tb_persons) / plimit AS pgs,  
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM (SELECT * FROM tb_persons p LIMIT pstart, plimit) AS p
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE s.dtbuy >= pdtbuy
		GROUP BY p.sgcompany;
        
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro data buy.";
		END IF;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL) AND pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.desperson AS SELL,  p.descpfcnpj,
			(SELECT count(idperson) FROM tb_persons) / plimit AS pgs,  
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM (SELECT * FROM tb_persons p LIMIT pstart, plimit) AS p
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE s.dtsell <= pdtsell 
		GROUP BY p.sgcompany;
        
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro data sell.";
		END IF;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtbuy IS NOT NULL) AND (pdtsell != '' AND pdtsell IS NOT NULL) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS CHEIO, p.sgcompany, p.descpfcnpj, 
			sum(b.qtdebuy) AS buyTotal, 
			sum(s.qtdesell) AS sellTotal, 
			sum(b.qtdebuy) - sum(s.qtdesell) AS qtdeTotal,
            e.prcaverage AS average,
            e.prcaverage * (sum(b.qtdebuy) - sum(s.qtdesell)) AS vlrtotal
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND s.dtbuy >= pdtbuy AND s.dtsell <= pdtsell
		GROUP BY p.sgcompany;
        
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao filtrar com parâmetro company e datas.";
		END IF;
    END;
    END IF;
    
    #SELECT @sql;
    #PREPARE STMT FROM @sql;
    #EXECUTE STMT;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "SUCCESS: Registros filtrado com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_acoes_select_inv_buy_sell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_inv_buy_sell`(
	psgcompany VARCHAR(20),
    pdtbuy VARCHAR(20),
    pdtsell VARCHAR(20),
	pstart INT(11),
    plimit INT(11)
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;

	/*********************************************************************************************************/
    /*												Início do Select				 						 */
    /*********************************************************************************************************/
    
    SET @sql = CONCAT('SELECT  i.sgcompany as company, i.idinvestiment AS idinvest,b.*, s.*, ');
    SET @sql = CONCAT(@sql,' (SELECT count(idinvestiment) FROM tb_investiments  ii' );
    
    IF pdtbuy IS NOT NULL AND pdtbuy != '' THEN
		SET @sql = CONCAT(@sql,' INNER JOIN tb_buys bb USING(idinvestiment) ');
    END IF;
    IF pdtsell IS NOT NULL AND pdtsell != '' THEN
		SET @sql = CONCAT(@sql,' LEFT JOIN tb_sells ss USING(idinvestiment) ');
    END IF;
    
    SET @sql = CONCAT(@sql,' WHERE ii.idinvestiment IS NOT NULL ');
   
    IF pdtbuy IS NOT NULL AND pdtbuy != '' THEN
		SET @sql = CONCAT(@sql,' AND bb.dtbuy >= "',pdtbuy,'" ');
    END IF;
    IF pdtsell IS NOT NULL AND pdtsell != '' THEN
		SET @sql = CONCAT(@sql,' AND (ss.dtsell <= "',pdtsell, '") ');
    END IF;
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql,' AND ii.sgcompany LIKE "%',psgcompany,'%" ');
    END IF;
    
    SET @sql = CONCAT(@sql,' ) / ',plimit,' AS pgs ');
	/*********************************************************************************************************/
    /*												Início do FROM					 						 */
    /*********************************************************************************************************/
    SET @sql = CONCAT(@sql,' FROM tb_investiments i ');
	SET @sql = CONCAT(@sql,' INNER JOIN tb_buys b USING(idinvestiment) ');
	SET @sql = CONCAT(@sql,' LEFT JOIN tb_sells s USING(idinvestiment) ');
    
    SET @sql = CONCAT(@sql,' WHERE i.idinvestiment IS NOT NULL');
    
    IF pdtbuy IS NOT NULL AND pdtbuy != '' THEN
		SET @sql = CONCAT(@sql,' AND b.dtbuy >= "',pdtbuy,'"');
    END IF;
    
    IF pdtsell IS NOT NULL AND pdtsell != '' THEN
		SET @sql = CONCAT(@sql,' AND (s.dtsell <= "',pdtsell,'") ');
    END IF;
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql,' AND i.sgcompany LIKE "%',psgcompany,'%"');
    END IF;
    
	SET @sql = CONCAT(@sql,' ORDER BY i.idinvestiment ');
    SET @sql = CONCAT(@sql,'  LIMIT ',pstart,',', plimit,';');

	/*********************************************************************************************************/
    /*											Início da Execução					 						 */
    /*********************************************************************************************************/
    #SELECT @sql;
    PREPARE STMT FROM @sql;
    EXECUTE STMT;
    IF EX = 1 THEN
		SET MESSAGE = "Erro ao filtrar IDs na tabela idinvestiment.";
	END IF;
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SELECT "Registros filtrado com sucesso!" AS MESSAGE;
        COMMIT;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_update_save`(
	pidinvestiment INT(11), 
	pidperson INT(11),        
	piduser INT(11),      
	pdesperson VARCHAR(64),
	psgcompany VARCHAR(20), 
	pdescpfcnpj VARCHAR(20),   
	pdtbuy VARCHAR(10),            
	pqtdebuy INT(11),       
	pprcbuy DECIMAL(10,2),  
	ptlbuy DECIMAL(10,2),   
	pbprcaverage DECIMAL(10,2),
	pbtptransaction CHAR(1),
	pbtipe CHAR(1), 
	pdtsell VARCHAR(10),           
	pqtdesell INT(11),      
	pprcsell DECIMAL(10,2), 
	ptlsell DECIMAL(10,2),
	psprcaverage DECIMAL(10,2),
	pstptransaction CHAR(1),
	pstipe CHAR(1),
	ptax DECIMAL(10,2),     
	plucre DECIMAL(10,2),   
	pidestoque INT(11),     
	psgecompany VARCHAR(20),
    pprcaverage DECIMAL(10,1),
	pqtdeestoque INT(11)
)
BEGIN
	DECLARE IDP, IDB, IDS INT;
    DECLARE MESSAGE VARCHAR(200);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID." MESSAGE;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MESSAGE;
    START TRANSACTION;
    
    UPDATE tb_investiments 
	SET 
		iduser		= piduser,
		idperson	= pidperson,
		sgcompany	= psgcompany,
		dtbuy		= pdtbuy,
		dtsell		= pdtsell
		
	WHERE idinvestiment = pidinvestiment;
    
    IF EX = 1 THEN
		SET MESSAGE =  "ERROR: Erro ao fazer update no registro na tabela Investiments";
	ELSE
		SET MESSAGE =  "SUCCESS: Entrou na tabela Investiments";
    END IF;
    
    UPDATE tb_buys 
	SET 
		idperson        = pidperson, 
		sgcompany       = psgcompany, 
		dtbuy           = pdtbuy, 
		qtdebuy         = pqtdebuy,
		prcbuy          = pprcbuy,
		tlbuy           = ptlbuy,
		bprcaverage     = pbprcaverage,
		btptransaction  = pbtptransaction,
		btipe           = pbtipe 
	WHERE idinvestiment = pidinvestiment;
    
    IF EX = 1 THEN
		SET MESSAGE =  "ERROR: Erro ao fazer update no registro na tabela Buys";
	ELSE
		SET MESSAGE =  "SUCCESS: Update Entrou na tabela Buys";
	END IF;
    
    SELECT idsell INTO IDS FROM tb_sells WHERE idinvestiment = pidinvestiment;

	IF (IDS IS NULL) THEN
							  
		INSERT INTO tb_sells (idinvestiment,idperson,sgcompany,qtdesell,dtsell,prcsell,tlsell,sprcaverage,tax,lucre,stptransaction,stipe)
			VALUES (pidinvestiment,pidperson,psgcompany,pqtdesell,pdtsell,pprcsell,ptlsell,psprcaverage,ptax,plucre,pstptransaction,pstipe);
		IF EX = 1 THEN
			SET MESSAGE =  "ERROR: Erro ao cadastrar registro na tabela Sells";
		ELSE
			SET MESSAGE =  "SUCCESS: Insert Entrou na tabela Sells";
		END IF;
	ELSE
		UPDATE tb_sells
		SET
			idperson        = pidperson,
			sgcompany       = psgcompany,
			qtdesell        = pqtdesell,
			dtsell          = pdtsell,
			prcsell         = pprcsell,
			tlsell          = ptlsell,
			sprcaverage     = psprcaverage,
			tax             = ptax,
			lucre           = plucre,
			stptransaction  = pstptransaction,
			stipe           = pstipe
		WHERE idsell = IDS;
		IF EX = 1 THEN
			SET MESSAGE =  "ERROR: Erro ao fazer update no registro na tabela Sells";
		ELSE
			SET MESSAGE =  "SUCCESS: Update Entrou na tabela Sells";
		END IF;
	END IF;
	
    UPDATE tb_estoques
	SET
		qtdeestoque = pqtdeestoque,
        prcaverage	= pprcaverage
	WHERE idestoque = pidestoque;
	IF EX = 1 THEN
		SET MESSAGE =  "ERROR: Erro ao fazer update no registro na tabela Estoques";
	END IF;
   
    IF EX = 1 THEN
		SET MESSAGE =  "ERROR: Erro ao fazer update no registro na tabela Estoques";
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE =  "SUCCESS: Dados atualizados com sucesso!!";
		SELECT MESSAGE;
        COMMIT;
	END IF;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_w_all_tests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_w_all_tests`(
	psgcompany VARCHAR(20) ,
	pdtbuy VARCHAR(10),
	pdtsell VARCHAR(10),
    pstart INT(10),
    plimit INT(10)
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;

	/*********************************************************************************************************/
    /*												Início do Select				 						 */
    /*********************************************************************************************************/
    
    SET @sql = CONCAT('SELECT p.idperson, p.desperson, p.sgcompany,  p.descpfcnpj,');
	SET @sql = CONCAT(@sql, '(SELECT count(idperson) FROM tb_persons) / ',plimit,' AS pgs, ');
	SET @sql = CONCAT(@sql, '(SELECT sum(bb.qtdebuy) FROM tb_buys bb ');
    SET @sql = CONCAT(@sql, 'WHERE bb.idbuy IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND bb.sgcompany = "',psgcompany,'"');
    END IF;
    
    SET @sql = CONCAT(@sql, ') AS buyTotal , ');
	SET @sql = CONCAT(@sql, '(SELECT sum(ss.qtdesell) FROM tb_sells ss ');
    SET @sql = CONCAT(@sql, 'WHERE ss.idsell IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND ss.sgcompany = "',psgcompany,'"');
    END IF;
    
    SET @sql = CONCAT(@sql, ') AS sellTotal, ');
	SET @sql = CONCAT(@sql, '(SELECT sum(bb.qtdebuy) FROM tb_buys bb ');
    SET @sql = CONCAT(@sql, 'WHERE bb.idbuy IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND bb.sgcompany = "',psgcompany,'"');
    END IF;
    
    SET @sql = CONCAT(@sql, ') - (SELECT sum(ss.qtdesell) FROM tb_sells ss ');
    SET @sql = CONCAT(@sql, 'WHERE ss.idsell IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND ss.sgcompany = "',sgcompany,'"');
    END IF;
    
    SET @sql = CONCAT(@sql, ') AS qtdeTotal, ');
	SET @sql = CONCAT(@sql, 'e.prcaverage, ');
	SET @sql = CONCAT(@sql, 'e.prcaverage * ((SELECT sum(bb.qtdebuy) FROM tb_buys bb ');
    SET @sql = CONCAT(@sql, 'WHERE bb.idbuy IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND bb.sgcompany = "',sgcompany,'"');
    END IF;
    
	SET @sql = CONCAT(@sql, ') - (SELECT sum(ss.qtdesell) FROM tb_sells ss ');
    SET @sql = CONCAT(@sql, 'WHERE ss.idsell IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND ss.sgcompany = "',sgcompany,'"');
    END IF;
    
	SET @sql = CONCAT(@sql, ')) AS vlrtotal ');
	SET @sql = CONCAT(@sql, 'FROM tb_persons p ');
	SET @sql = CONCAT(@sql, 'INNER JOIN tb_investiments i USING(idperson) '); 
	SET @sql = CONCAT(@sql, 'INNER JOIN tb_buys b USING(idperson) ');
	SET @sql = CONCAT(@sql, 'INNER JOIN tb_sells s USING(idperson) ');
	SET @sql = CONCAT(@sql, 'INNER JOIN tb_estoques e USING(idperson) ');
	SET @sql = CONCAT(@sql, 'WHERE i.idinvestiment IS NOT NULL ');
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND i.sgcompany = "',sgcompany,'" ');
    END IF;
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql, 'AND s.dtsell <= "',pdtsell,'" ');
	END IF;
    
    SET @sql = CONCAT(@sql, 'GROUP BY p.sgcompany ');
	SET @sql = CONCAT(@sql, 'LIMIT ',pstart,', ',plimit,'; ');
	/*********************************************************************************************************/
    /*												Início do FROM					 						 */
    /*********************************************************************************************************/
   

	/*********************************************************************************************************/
    /*											Início da Execução					 						 */
    /*********************************************************************************************************/
    SELECT @sql;
    PREPARE STMT FROM @sql;
    EXECUTE STMT;
    IF EX = 1 THEN
		SET MESSAGE = "ERROR: Erro ao filtrar IDs na tabela idinvestiment.";
	END IF;
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SELECT "SUCCESS: Registros filtrado com sucesso!" AS MESSAGE;
        COMMIT;
	END IF; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-04  6:15:19
