ALTER TABLE qualite_defauts
  MODIFY COLUMN fk_controle INT(11) NULL,
  ADD COLUMN fk_type_defaut INT(11) NULL,
  ADD CONSTRAINT qualite_defauts_qualite_types_defauts_FK
    FOREIGN KEY (fk_type_defaut) REFERENCES qualite_types_defauts(id);

UPDATE
	qualite_defauts
SET
	fk_type_defaut = 1
WHERE
	id IN (
  11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
  25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 38,
  39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
  52, 53, 54, 57, 58, 59, 60, 61, 62
);


ALTER TABLE qualite_defauts 
ADD COLUMN fk_engagement INT NULL;

ALTER TABLE qualite_defauts 
ADD CONSTRAINT qualite_defauts_prod_engagement_FK
FOREIGN KEY (fk_engagement)
REFERENCES .prod_engagement(id);