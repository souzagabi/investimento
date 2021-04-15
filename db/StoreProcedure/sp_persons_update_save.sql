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

END