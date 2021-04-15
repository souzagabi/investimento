CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_persons_delete`(
	pidperson INT(11))
BEGIN

	DECLARE ID INT;
    
	SELECT iduser INTO ID FROM tb_users WHERE idperson = pidperson;
    
    IF ID IS NOT NULL THEN
    BEGIN
		DELETE FROM tb_users WHERE iduser = ID;
    END;
    END IF;
    
	DELETE FROM tb_persons 
    WHERE idperson = pidperson;

END