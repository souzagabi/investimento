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
		UPDATE tb_estoques SET qtdeestoque = (SELECT SUM(e.qtdeestoque  + pqtdebuy) FROM tb_estoques e WHERE e.idperson = IDP), prcaverage = ((SELECT SUM(e.qtdeestoque * e.prcaverage) FROM tb_estoques e WHERE e.idperson = IDP) + ptlbuy) / (SELECT SUM(e.qtdeestoque  + pqtdebuy) FROM tb_estoques e WHERE e.idperson = IDP)
		WHERE idperson = IDP;
    
    END;
    END IF;
    
    
    SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) WHERE p.idperson = IDP;
    
END