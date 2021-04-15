CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_company`(
psgcompany VARCHAR(20) ,
pdtbuy DATE,
pdtsell DATE
)
BEGIN
	
    /*==========================================================================================*/
    /*						Filtra os registros usando os 2 parâmetros - data					*/
    /*==========================================================================================*/
    IF pdtbuy IS NOT NULL AND pdtsell IS NOT NULL AND psgcompany IS NULL THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.descpfcnpj, sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal  
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
		WHERE (i.dtbuy >= pdtbuy AND i.dtbuy <= pdtsell) 
		  OR (i.dtsell >= pdtbuy AND i.dtsell <= pdtsell) 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 1 parâmetros - sigla					*/
    /*==========================================================================================*/
    IF pdtbuy IS NULL AND pdtsell IS NULL AND psgcompany IS NOT NULL THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.descpfcnpj, sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal  
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
		WHERE i.sgcompany = psgcompany 
		GROUP BY p.sgcompany;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*						Filtra os registros usando os 3 parâmetros							*/
    /*==========================================================================================*/
    IF pdtbuy IS NOT NULL AND pdtsell IS NOT NULL AND psgcompany IS NOT NULL THEN
    BEGIN
		SELECT p.idperson, p.desperson, p.sgcompany, p.descpfcnpj, sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal  
		FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
		WHERE i.sgcompany = psgcompany 
			AND ((i.dtbuy >= pdtbuy AND i.dtbuy <= pdtsell) 
			OR (i.dtsell >= pdtbuy AND i.dtsell <= pdtsell))
        GROUP BY p.sgcompany;
    END;
    END IF;
    
    
END