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
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p 
        INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson)
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND (pdtsell = '')) AND (psgcompany != '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal 
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data sell				*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND pdtsell != '') AND (psgcompany != '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND ((i.dtbuy <= pdtsell) 
		  OR (i.dtsell <= pdtsell)) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 2 parâmetros - sigla e data buy				*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND (pdtsell = '')) AND (psgcompany != '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany AND ((i.dtbuy >= pdtbuy) 
		  OR (i.dtsell >= pdtbuy) )
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtsell != '') AND (psgcompany = '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE (i.dtbuy >= pdtbuy AND i.dtbuy <= pdtsell) 
		  OR (i.dtsell >= pdtbuy AND i.dtsell <= pdtsell) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data buy					*/
    /*==========================================================================================*/
    IF ((pdtbuy IS NOT NULL) AND (pdtsell = '')) AND (psgcompany = '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE (i.dtbuy >= pdtbuy) 
		  OR (i.dtsell >= pdtbuy) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - data sell					*/
    /*==========================================================================================*/
    IF ((pdtbuy = '') AND pdtsell != '') AND (psgcompany = '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE (i.dtbuy <= pdtsell) 
		  OR (i.dtsell <= pdtsell) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*				Filtra os registros usando os 3 parâmetros - sigla e data					*/
    /*==========================================================================================*/
    IF (pdtbuy != '' AND pdtsell != '') AND (psgcompany != '') THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.desperson AS SIGLA, p.sgcompany, p.descpfcnpj, 
			sum(i.qtdebuy) AS buyTotal, 
			sum(i.qtdesell) AS sellTotal, 
			sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal,
            e.prcaverage AS average,
            sum(e.prcaverage * e.qtdeestoque) AS vlrtotal
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
        INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND ((i.dtbuy >= pdtbuy AND i.dtbuy <= pdtsell) 
			OR (i.dtsell >= pdtbuy AND i.dtsell <= pdtsell) )
		GROUP BY p.sgcompany;
    END;
    END IF;
    
END