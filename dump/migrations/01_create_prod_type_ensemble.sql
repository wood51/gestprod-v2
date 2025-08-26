CREATE TABLE prod_type_ensemble (
    id INT(11) NOT NULL AUTO_INCREMENT,
    fk_type_sous_ensemble INT NOT NULL,
    libelle VARCHAR(100) NOT NULL,
    ordre_affichage INT NULL,
    CONSTRAINT prod_type_ensemble_pk PRIMARY KEY (id),
    CONSTRAINT prod_type_ensemble_fk FOREIGN KEY (fk_type_sous_ensemble) REFERENCES prod_type_sous_ensemble(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4;