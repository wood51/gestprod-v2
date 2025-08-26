-- gestprod_v2.qualite_types_defauts definition

CREATE TABLE `qualite_types_defauts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

INSERT INTO qualite_types_defauts (libelle)
	VALUES ('Autre');
INSERT INTO qualite_types_defauts (libelle)
	VALUES ('Appro');
INSERT INTO qualite_types_defauts (libelle)
	VALUES ('Production');