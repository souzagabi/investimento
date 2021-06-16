
CREATE TABLE `tb_persons` (
  `idperson` int NOT NULL AUTO_INCREMENT,
  `desperson` varchar(64) NOT NULL,
  `descpfcnpj` varchar(20) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `tb_users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `idperson` int NOT NULL,
  `deslogin` varchar(64) NOT NULL,
  `despassword` varchar(256) NOT NULL,
  `inadmin` tinyint(1) NOT NULL DEFAULT '0',
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iduser`),
  KEY `FK_users_persons_idx` (`idperson`),
  CONSTRAINT `fk_users_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `tb_sgcompany` (
  `idsgcompany` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idsgcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;


CREATE TABLE `tb_percomp` (
  `idpercomp` int NOT NULL AUTO_INCREMENT,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  PRIMARY KEY (`idpercomp`),
  KEY `FK_percomps_person_idx_idx` (`idperson`),
  KEY `FK_percomp_sgcompany_idx_idx` (`idsgcompany`),
  CONSTRAINT `FK_percomp_person_idx` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `FK_percomp_sgcompany_idx` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

CREATE TABLE `tb_investiments` (
  `idinvestiment` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  `dtbuy` date DEFAULT NULL,
  `dtsell` date DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idinvestiment`),
  KEY `FK_investiments_users_idx` (`iduser`),
  KEY `fk_investiments_persons` (`idperson`),
  KEY `fk_investiments_percomp_idx` (`idsgcompany`),
  CONSTRAINT `fk_investiments_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `fk_investiments_sgcompany` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`),
  CONSTRAINT `fk_investiments_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `tb_buys` (
  `idbuy` int NOT NULL AUTO_INCREMENT,
  `idinvestiment` int DEFAULT NULL,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  `qtdebuy` int DEFAULT '0',
  `dtbuy` date DEFAULT NULL,
  `prcbuy` decimal(10,2) DEFAULT '0.00',
  `tlbuy` decimal(10,2) DEFAULT '0.00',
  `bprcaverage` decimal(10,2) DEFAULT '0.00',
  `btptransaction` char(1) DEFAULT NULL,
  `btipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbuy`),
  KEY `FK_buys_investiments_idx` (`idinvestiment`),
  KEY `fk_buys_persons` (`idperson`),
  KEY `fk_buys_sgcompany_idx` (`idsgcompany`),
  CONSTRAINT `FK_buys_investiments_idx` FOREIGN KEY (`idinvestiment`) REFERENCES `tb_investiments` (`idinvestiment`) ON DELETE CASCADE,
  CONSTRAINT `fk_buys_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `fk_buys_sgcompany` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `tb_estoques` (
  `idestoque` int NOT NULL AUTO_INCREMENT,
  `idperson` int DEFAULT NULL,
  `sgecompany` varchar(20) DEFAULT NULL,
  `qtdeestoque` int DEFAULT NULL,
  `prcaverage` decimal(10,2) DEFAULT NULL,
  `dteregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idestoque`),
  KEY `FK_estoques_persons_idx` (`idperson`),
  CONSTRAINT `fk_estoques_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `tb_sells` (
  `idsell` int NOT NULL AUTO_INCREMENT,
  `idinvestiment` int NOT NULL,
  `idperson` int NOT NULL,
  `idsgcompany` int NOT NULL,
  `qtdesell` int DEFAULT '0',
  `dtsell` date DEFAULT NULL,
  `prcsell` decimal(10,2) DEFAULT '0.00',
  `tlsell` decimal(10,2) DEFAULT '0.00',
  `sprcaverage` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `lucre` decimal(10,2) DEFAULT '0.00',
  `stptransaction` char(1) DEFAULT NULL,
  `stipe` char(1) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsell`),
  KEY `FK_sells_investiments_idx` (`idinvestiment`),
  KEY `fk_sells_persons` (`idperson`),
  KEY `fk_sells_sgcompany_idx_idx` (`idsgcompany`),
  CONSTRAINT `FK_sells_investiments_idx` FOREIGN KEY (`idinvestiment`) REFERENCES `tb_investiments` (`idinvestiment`) ON DELETE CASCADE,
  CONSTRAINT `fk_sells_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE CASCADE,
  CONSTRAINT `fk_sells_sgcompany_idx` FOREIGN KEY (`idsgcompany`) REFERENCES `tb_sgcompany` (`idsgcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3;
