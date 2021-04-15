SELECT p.*, sum(i.qtdebuy) AS buyTotal, sum(i.qtdesell) AS sellTotal, sum(i.qtdebuy) - sum(i.qtdesell) AS finalTotal  
            FROM tb_persons p INNER JOIN tb_investiments i USING(idperson) 
			WHERE (i.dtbuy >= '2020-04-01' AND i.dtbuy <= '2020-12-31') 
			  OR (i.dtsell >= '2020-04-01' AND i.dtsell <= '2020-12-31') 
			GROUP BY p.sgcompany