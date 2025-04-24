-- `gestprod-v2`.accidents_travail definition

CREATE TABLE `accidents_travail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arret` int(11) NOT NULL DEFAULT 0,
  `zone` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;