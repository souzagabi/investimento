DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_delete`(
	pidinvestiment INT(11),
	pidestoque INT(11),
	pqtdetotal INT(11)
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
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

	IF EX = 1 THEN
		SET MESSAGE = "Erro ao excluir registro na tabela tb_investiments." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros excluído com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
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
    SET @sql = CONCAT(@sql,' INNER JOIN tb_estoques e USING(idperson) WHERE e.idperson = i.idperson ');
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
	END IF;
END$$
DELIMITER ;

DELIMITER $$
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
		SET MESSAGE = "Erro ao filtrar lista de IDs na tabela idinvestiment";
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros filtrado com sucesso!";
        SELECT MESSAGE
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
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
    pprcaverage DECIMAL(10, 2)
)
BEGIN
	DECLARE IDP, IDE, IDI, IDC, QTDE INT;
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
		INSERT INTO tb_persons (desperson, descpfcnpj) VALUES (pdescompany, pdescnpj);
		SET IDP = LAST_INSERT_ID();
        INSERT INTO tb_sgcompany (idperson,descricao) VALUES (IDP,psgcompany);
        SET IDC = LAST_INSERT_ID();
        INSERT INTO tb_percomp (idperson, idsgcompany) VALUES (IDP, IDC);
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Persons";
		END IF;
	ELSE
		SELECT idsgcompany INTO IDC FROM tb_sgcompany WHERE descricao = psgcompany;
        IF IDC IS NULL THEN
			INSERT INTO tb_sgcompany (descricao) VALUES (psgcompany);
            SET IDC = LAST_INSERT_ID();
            INSERT INTO tb_percomp (idperson, idsgcompany) VALUES (IDP, IDC);
		END IF;
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao gravar registro na tabela sgcompany";
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
END$$
DELIMITER ;

DELIMITER $$
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
	DECLARE IDP, IDE, IDI, IDC, QTDE INT;
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
		INSERT INTO tb_persons (desperson, descpfcnpj) VALUES (pdescompany, pdescnpj);
		SET IDP = LAST_INSERT_ID();
        INSERT INTO tb_sgcompany (idperson,descricao) VALUES (IDP,psgcompany);
        SET IDC = LAST_INSERT_ID();
        INSERT INTO tb_percomp (idperson, idsgcompany) VALUES (IDP, IDC);
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Persons";
		END IF;
	ELSE
		SELECT idsgcompany INTO IDC FROM tb_sgcompany WHERE descricao = psgcompany;
        IF IDC IS NULL THEN
			INSERT INTO tb_sgcompany (descricao) VALUES (psgcompany);
            SET IDC = LAST_INSERT_ID();
            INSERT INTO tb_percomp (idperson, idsgcompany) VALUES (IDP, IDC);
		END IF;
        IF EX = 1 THEN
			SET MESSAGE = "ERROR: Erro ao gravar registro na tabela sgcompany";
		END IF;
    END IF;
    
	INSERT INTO tb_investiments (iduser, idperson, dtbuy, idsgcompany) VALUES (piduser, IDP, pdtbuy, IDC);
	SET IDI = LAST_INSERT_ID();
	
	IF EX = 1 THEN
		SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Investimens";
	END IF;
	INSERT INTO tb_buys
		(idinvestiment, idperson, idsgcompany, dtbuy, qtdebuy, prcbuy, tlbuy, bprcaverage, btptransaction, btipe)
		VALUES (IDI, IDP, IDC, pdtbuy, pqtdebuy, pprcbuy, ptlbuy, pprcaverage, ptptransaction, ptipe);
	
    IF EX = 1 THEN
		SET MESSAGE = "ERROR: Erro ao gravar registro na tabela Buys";
    END IF; 
    
	IF IDE IS NULL THEN
		INSERT INTO tb_estoques (idperson, idsgcompany, qtdeestoque, prcaverage) VALUES (IDP,IDC, pqtdebuy,pprcaverage);
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
	
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_buy`(
	pidinvestiment INT(10)
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
	SELECT i.idinvestiment, p.idperson, p.desperson, p.descpfcnpj , i.iduser, 
		sg.idsgcompany,sg.descricao AS sgcompany, 
		b.dtbuy, b.qtdebuy, b.prcbuy, b.tlbuy, b.bprcaverage, b.btptransaction, b.btipe,
		s.dtsell, s.qtdesell, s.prcsell, s.tlsell, s.sprcaverage, s.stptransaction, s.stipe, 
		s.lucre, s.tax, e.idestoque, e.sgecompany AS sgecompany, e.prcaverage,
		e.qtdeestoque AS qtdetotal, s.qtdesell, b.qtdebuy
	
    FROM tb_persons p 
    
	INNER JOIN tb_percomp pc ON pc.idperson = p.idperson
    INNER JOIN tb_sgcompany sg ON sg.idsgcompany = pc.idsgcompany
    
	INNER JOIN tb_investiments i ON i.idsgcompany = pc.idsgcompany
	INNER JOIN tb_buys b ON b.idinvestiment = i.idinvestiment
    LEFT JOIN tb_sells s ON s.idinvestiment = i.idinvestiment
	LEFT JOIN tb_estoques e ON e.idperson = p.idperson
	WHERE i.idinvestiment = pidinvestiment;
        
	IF EX = 1 THEN
		SET MESSAGE = "Erro ao filtrar registro na tabela tb_investiments." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros filtrado com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
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
END$$
DELIMITER ;

DELIMITER $$
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
    
    SET @sql = CONCAT('SELECT i.idinvestiment AS idinvest, g.idsgcompany, g.descricao AS company,b.*, s.*, ');
    SET @sql = CONCAT(@sql,' (SELECT count(ii.idinvestiment) FROM tb_investiments  ii' );
    
    IF pdtbuy IS NOT NULL AND pdtbuy != '' THEN
		SET @sql = CONCAT(@sql,' INNER JOIN tb_buys bb ON bb.idinvestiment = ii.idinvestiment ');
    END IF;
    IF pdtsell IS NOT NULL AND pdtsell != '' THEN
		SET @sql = CONCAT(@sql,' LEFT JOIN tb_sells ss ON ss.idinvestiment = ii.idinvestiment ');
    END IF;
    
    #IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql,' LEFT JOIN tb_sgcompany sg ON sg.idsgcompany = ii.idsgcompany ');
    #END IF;
    
    SET @sql = CONCAT(@sql,' WHERE ii.idinvestiment IS NOT NULL ');
   
    IF pdtbuy IS NOT NULL AND pdtbuy != '' THEN
		SET @sql = CONCAT(@sql,' AND bb.dtbuy >= "',pdtbuy,'" ');
    END IF;
    IF pdtsell IS NOT NULL AND pdtsell != '' THEN
		SET @sql = CONCAT(@sql,' AND (ss.dtsell <= "',pdtsell, '") ');
    END IF;
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql,'  AND sg.descricao LIKE "%',psgcompany,'%" ');
    END IF;
    
    SET @sql = CONCAT(@sql,' ) / ',plimit,' AS pgs ');
	/*********************************************************************************************************/
    /*												Início do FROM					 						 */
    /*********************************************************************************************************/
    SET @sql = CONCAT(@sql,' FROM tb_investiments i ');
	SET @sql = CONCAT(@sql,' INNER JOIN tb_buys b ON b.idinvestiment = i.idinvestiment ');
	SET @sql = CONCAT(@sql,' LEFT JOIN tb_sells s ON s.idinvestiment = i.idinvestiment ');
    SET @sql = CONCAT(@sql,' LEFT JOIN tb_sgcompany g ON g.idsgcompany = i.idsgcompany ');
    
    SET @sql = CONCAT(@sql,' WHERE i.idinvestiment IS NOT NULL');
    
    IF pdtbuy IS NOT NULL AND pdtbuy != '' THEN
		SET @sql = CONCAT(@sql,' AND b.dtbuy >= "',pdtbuy,'"');
    END IF;
    
    IF pdtsell IS NOT NULL AND pdtsell != '' THEN
		SET @sql = CONCAT(@sql,' AND (s.dtsell <= "',pdtsell,'") ');
    END IF;
    
    IF psgcompany IS NOT NULL AND psgcompany != '' THEN
		SET @sql = CONCAT(@sql,' AND g.descricao LIKE "%',psgcompany,'%"');
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

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_update_save`(
	pidinvestiment INT(11), 
	pidperson INT(11),        
	piduser INT(11),
    pidsgcompany INT(10),
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
		idsgcompany	= pidsgcompany,
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
		idsgcompany		= pidsgcompany, 
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
							  
		INSERT INTO tb_sells (idinvestiment,idperson,idsgcompany,dtsell,qtdesell,prcsell,tlsell,sprcaverage,stptransaction,stipe,tax,lucre)
			VALUES (pidinvestiment,pidperson,pidsgcompany,pdtsell,pqtdesell,pprcsell,ptlsell,psprcaverage,pstptransaction,pstipe,ptax,plucre);
		IF EX = 1 THEN
			SET MESSAGE =  "ERROR: Erro ao cadastrar registro na tabela Sells";
		ELSE
			SET MESSAGE =  "SUCCESS: Insert Entrou na tabela Sells";
		END IF;
	ELSE
		UPDATE tb_sells
		SET
			idperson        = pidperson,
			idsgcompany		= pidsgcompany,
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
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE =  "SUCCESS: Dados atualizados com sucesso!!";
		SELECT MESSAGE;
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_persons_delete`(
	pidperson INT(11))
BEGIN

	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
    DELETE FROM tb_persons 
    WHERE idperson = pidperson;

	IF EX = 1 THEN
		SET MESSAGE = "Erro ao excluir registro na tabela tb_persons." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros excluído com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_persons_update_save`(
	pidperson INT (11), 
    pdesperson VARCHAR (64),
    psgcompany VARCHAR(20),
    pdescpfcnpj VARCHAR(20)
)
BEGIN

	DECLARE IDE INT;
    DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
    SELECT idperson INTO IDE FROM tb_estoques WHERE idperson = pidperson;
        
    IF IDE IS NOT NULL THEN
	BEGIN
		UPDATE tb_estoques
		SET
			sgecompany = psgcompany
		WHERE idperson = IDE;
        
        IF EX = 1 THEN
			SET MESSAGE = "Erro ao atualizar registro na tabela tb_estoques." ;
		END IF;
	END;
    END IF;

	UPDATE tb_persons
    SET
		desperson     = pdesperson,
        descpfcnpj    = pdescpfcnpj
        
    WHERE idperson    = pidperson;
    
    IF EX = 1 THEN
		SET MESSAGE = "Erro ao atualizar registro na tabela tb_persons." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros atualizado com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete`(
	piduser INT
)
BEGIN
	DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
	DELETE FROM tb_users
    WHERE iduser = piduser;
    
    IF EX = 1 THEN
		SET MESSAGE = "Erro ao excluir registro na tabela tb_users." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros excluído com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_save`(
pdesperson VARCHAR(64),
pdescpfcnpj VARCHAR(20),
pdeslogin VARCHAR(64),
pdespassword VARCHAR(256),
pinadmin TINYINT

)
BEGIN
	DECLARE vidperson INT;
    DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
	INSERT INTO tb_persons (desperson, descpfcnpj)
	VALUES (pdesperson, pdescpfcnpj);
	
	SET vidperson = LAST_INSERT_ID();
	IF EX = 1 THEN
		SET MESSAGE = "Erro ao incluir registro na tabela tb_persons." ;
	END IF;
    
	INSERT INTO tb_users (idperson, deslogin, despassword, inadmin)
	VALUES (vidperson, pdeslogin, pdespassword, pinadmin);
	
	IF EX = 1 THEN
		SET MESSAGE = "Erro ao incluir registro na tabela tb_users." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros cadastrado com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_update_save`(
	piduser INT(11),
	pidperson INT(11),
	pdesperson VARCHAR(64),
	pdescpfcnpj VARCHAR(20),
	pdeslogin VARCHAR(64),
	pdespassword VARCHAR(256),
	pinadmin TINYINT(1)
)
BEGIN
	DECLARE IDP INT;
    DECLARE MESSAGE, MSGID, MSGSQL VARCHAR(100);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID."  MSGID;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MSGSQL;
    START TRANSACTION;
    
    SELECT idperson INTO IDP FROM tb_persons WHERE idperson = pidperson;
    
    IF IDP IS NOT NULL THEN
    BEGIN
		UPDATE tb_persons
		SET
			desperson     = pdesperson,
			descpfcnpj    = pdescpfcnpj
			
		WHERE idperson    = pidperson;
        
        IF EX = 1 THEN
		SET MESSAGE = "Erro ao atualizar registro na tabela tb_persons." ;
	END IF;
    END;
    END IF;
    
	UPDATE tb_users
    SET
		deslogin = pdeslogin,
        inadmin = pinadmin
    WHERE iduser = piduser;
    
    IF EX = 1 THEN
		SET MESSAGE = "Erro ao atualizar registro na tabela tb_users." ;
	END IF;
    
    IF EX = 1 THEN
		SELECT MESSAGE;
		ROLLBACK;
	ELSE
		SET MESSAGE = "Registros atualizado com sucesso!";
        SELECT MESSAGE;
        COMMIT;
	END IF;

END$$
DELIMITER ;

DELIMITER $$
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

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `w_test`(
	pidinvestiment INT(11), 
	pidperson INT(11),        
	piduser INT(11),
    pidsgcompany INT(10),
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
	DECLARE IDP, IDB, IDS, IDC INT;
    DECLARE MESSAGE VARCHAR(200);
	DECLARE EX SMALLINT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EX = 1;
    DECLARE EXIT HANDLER FOR 1062 SELECT  "ERRO de duplicidade do ID." MESSAGE;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Erro no código SQL.' MESSAGE;
    START TRANSACTION;
    SELECT idsgcompany INTO IDC FROM tb_sgcompany WHERE idsgcompany = pidsgcompany;
    SELECT idsgcompany INTO IDC FROM tb_sgcompany WHERE idsgcompany = pidsgcompany;
    
    IF IDC IS NULL THEN
		INSERT INTO tb_sgcompany (descricao) VALUE (psgcompany);
        SET IDC = LAST_INSERT_ID();
        INSERT INTO tb_percomp (idperson, idsgcomany) VALUES (pidperson,IDC);
    END IF;
    UPDATE tb_investiments 
	SET 
		iduser		= piduser,
		idperson	= pidperson,
		idsgcompany	= pidsgcompany,
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
		idsgcompany		= pidsgcompany, 
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
							  
		INSERT INTO tb_sells (idinvestiment,idperson,idsgcompany,qtdesell,dtsell,prcsell,tlsell,sprcaverage,tax,lucre,stptransaction,stipe)
			VALUES (pidinvestiment,pidperson,pidsgcompany,pqtdesell,pdtsell,pprcsell,ptlsell,psprcaverage,ptax,plucre,pstptransaction,pstipe);
		IF EX = 1 THEN
			SET MESSAGE =  "ERROR: Erro ao cadastrar registro na tabela Sells";
		ELSE
			SET MESSAGE =  "SUCCESS: Insert Entrou na tabela Sells";
		END IF;
	ELSE
		UPDATE tb_sells
		SET
			idperson        = pidperson,
			idsgcompany		= pidsgcompany,
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
END$$
DELIMITER ;
