CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_select_teste`(
	psgcompany VARCHAR(20) ,
	pdtbuy DATE,
	pdtsell DATE
)
BEGIN
	/*==========================================================================================*/
    /*					Filtra os registros usando os nenhum parâmetros							*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany = '' OR psgcompany IS NULL) THEN
    BEGIN
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		ORDER BY i.idinvestiment;
    END;
    END IF;
    
    /*==========================================================================================*/
    /*					Filtra os registros usando os 1 parâmetros - sigla						*/
    /*==========================================================================================*/
    IF ((pdtbuy = '' OR pdtbuy IS NULL ) AND (pdtsell = ''  OR pdtsell IS NULL)) AND (psgcompany != '' AND psgcompany IS NOT NULL) THEN
    BEGIN
		SELECT *, (SELECT count(idinvestiment)FROM tb_investiments WHERE sgcompany = psgcompany) / 10 AS pgs
		FROM tb_persons p 
		INNER JOIN (SELECT * FROM tb_investiments i WHERE i.sgcompany = psgcompany LIMIT 10) AS i USING(idperson) 
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
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
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
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
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
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
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
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
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
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
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
		SELECT *
		FROM tb_persons p 
		INNER JOIN tb_investiments i USING(idperson) 
		INNER JOIN tb_estoques e USING(idperson) 
		WHERE i.sgcompany = psgcompany
			AND i.dtbuy >= pdtbuy AND i.dtsell <= pdtsell
		ORDER BY p.sgcompany;
    END;
    END IF;
    
    
END