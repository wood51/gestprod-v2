-- `gestprod-v2`.sorties definition

CREATE TABLE `sorties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_article_id` int(11) NOT NULL,
  `fk_type_sous_ensemble` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `date_sortie` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sorties_articles_FK` (`fk_article_id`),
  KEY `sorties_type_sous_emsemble_FK` (`fk_type_sous_ensemble`),
  CONSTRAINT `sorties_articles_FK` FOREIGN KEY (`fk_article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `sorties_type_sous_emsemble_FK` FOREIGN KEY (`fk_type_sous_ensemble`) REFERENCES `type_sous_emsemble` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;