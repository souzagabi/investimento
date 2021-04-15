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
	
END