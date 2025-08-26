
INSERT INTO qualite_catalogue_defauts 
(mot_cle, fk_type_sous_ensemble, fk_categorie_defaut, fk_gravite, description)
VALUES
('sous-traitance non servie', NULL, NULL, 2, 'Commande en sous-traitance non livrée'),
('manque référence', NULL, NULL, 2, 'Réception sans documentation ou numéro de référence fourni (à préciser en commentaire)'),
('non basculé réception > stock', NULL, NULL, 2, 'Pièces réceptionnées mais non enregistrées en stock'),
('réception incomplète', NULL, NULL, 2, 'Kit ou lot réceptionné incomplet (éléments manquants)'),
("erreur d'article livré", NULL, NULL, 2, 'Référence ou variante livrée non conforme à la commande');