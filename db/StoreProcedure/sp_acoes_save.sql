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
    
END