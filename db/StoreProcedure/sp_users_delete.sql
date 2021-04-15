CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete`(
	piduser INT
)
BEGIN
	DELETE FROM tb_users
    WHERE iduser = piduser;
    
END