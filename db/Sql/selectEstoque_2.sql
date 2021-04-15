/*SELECT p.*, e.qtdeestoque FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) 
	WHERE (i.dtbuy >= '2020-04-01' AND i.dtbuy <= '2020-12-31') AND e.qtdeestoque > 0 GROUP BY i.sgcompany ORDER BY i.sgcompany*/
    SELECT p.*,  
    (SELECT sum(qtdebuy) FROM tb_investiments WHERE (dtbuy >= '2020-04-01' AND dtbuy <= '2020-12-31') GROUP BY sgcompany) AS buyTotal, 
    (SELECT sum(qtdesell) FROM tb_investiments WHERE (dtsell >= '2020-04-01' AND dtsell <= '2020-12-31') GROUP BY sgcompany ) AS sellTotal
    
    FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) INNER JOIN tb_estoques e USING(idperson) 
	WHERE (i.dtbuy >= '2020-04-01' AND i.dtbuy <= '2020-12-31') AND e.qtdeestoque > 0 GROUP BY i.sgcompany ORDER BY i.sgcompany