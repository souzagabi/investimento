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
    
END