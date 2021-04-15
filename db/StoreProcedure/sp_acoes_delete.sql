CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_acoes_delete`(
	pidinvestiment INT(11),
	pidestoque INT(11),
	pqtdetotal INT(11)
)
BEGIN

	IF pqtdetotal IS NOT NULL THEN
    BEGIN
		UPDATE tb_estoques
        SET
			qtdeestoque = pqtdetotal
		WHERE idestoque = pidestoque;
    END;
    END IF;
    
	DELETE FROM tb_investiments
    WHERE idinvestiment = pidinvestiment;

END