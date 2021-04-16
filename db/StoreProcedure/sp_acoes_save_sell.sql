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
		UPDATE tb_estoques 
        SET 
			qtdeestoque = (SELECT SUM(e.qtdeestoque - pqtdesell) FROM tb_estoques e WHERE e.idperson = IDE)
        WHERE idperson = IDE;
        CASE 
			WHEN  (SELECT SUM(e.qtdeestoque - pqtdesell) FROM tb_estoques e WHERE e.idperson = IDE) = 0 THEN
				SET prcaverage = 0;
		END CASE;
    END;
    END IF;
    
    
    SELECT * FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) WHERE p.idperson = IDE;
    
END