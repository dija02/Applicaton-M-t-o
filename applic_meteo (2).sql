-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 03 déc. 2024 à 21:05
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `applic_meteo`
--

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE IF NOT EXISTS `historique` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `temperature` float NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `humidite` int NOT NULL,
  `pression` int NOT NULL,
  `date_consultation` datetime NOT NULL,
  `utulisateur_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meteo`
--

DROP TABLE IF EXISTS `meteo`;
CREATE TABLE IF NOT EXISTS `meteo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `temperature` float DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `humidite` int DEFAULT NULL,
  `pression` int DEFAULT NULL,
  `date_enregistrement` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `meteo`
--

INSERT INTO `meteo` (`id`, `ville`, `temperature`, `description`, `humidite`, `pression`, `date_enregistrement`) VALUES
(1, 'dakar', 25.1, 'Moderate or heavy rain with thunder', 94, 1011, '2024-09-25 22:18:27'),
(2, 'dakar', 25.1, 'Moderate or heavy rain with thunder', 94, 1011, '2024-09-25 22:18:28'),
(3, 'dakar', 25.1, 'Moderate or heavy rain with thunder', 94, 1011, '2024-09-25 22:19:02'),
(4, 'paris', 16, 'Light rain', 100, 994, '2024-09-25 22:20:00'),
(5, 'paris', 16, 'Light rain', 100, 994, '2024-09-25 22:20:00'),
(6, 'paris', 16, 'Light rain', 100, 994, '2024-09-25 22:20:11'),
(7, 'paris', 16, 'Light rain', 100, 994, '2024-09-25 22:27:53'),
(8, 'dakar', 25.1, 'Moderate or heavy rain with thunder', 94, 1011, '2024-09-25 22:30:25'),
(9, 'rufisque', 25.3, 'Moderate or heavy rain with thunder', 94, 1011, '2024-09-25 22:37:03'),
(10, 'thies', 25.9, 'Light rain shower', 84, 1012, '2024-09-25 22:45:36'),
(11, 'touba', 27.1, 'Moderate or heavy rain with thunder', 94, 1012, '2024-09-25 22:46:37'),
(12, 'banjul', 25.4, 'Light rain shower', 91, 1012, '2024-09-25 22:48:41'),
(13, 'banjul', 25.4, 'Light rain shower', 91, 1012, '2024-09-25 22:49:15'),
(14, 'banjul', 25.4, 'Light rain shower', 91, 1012, '2024-09-25 22:52:58'),
(15, 'thies', 25.4, 'Light rain shower', 86, 1012, '2024-09-25 23:09:56'),
(16, 'matam', 32.1, 'Partly cloudy', 26, 1014, '2024-09-25 23:38:34'),
(17, 'rufisque', 25.2, 'Pluie légère', 100, 1011, '2024-09-25 23:53:12'),
(18, 'tamba', 26.3, 'Brume', 89, 1003, '2024-09-25 23:57:44'),
(19, 'liban', 20.1, 'Partiellement nuageux', 78, 1024, '2024-09-25 23:59:02'),
(20, 'pikine', 25.2, 'Pluie légère', 100, 1011, '2024-09-25 23:59:32'),
(21, 'dakar', 30.2, 'Partiellement nuageux', 79, 1008, '2024-10-02 17:16:58'),
(22, 'dakar', 28.1, 'Partiellement nuageux', 84, 1010, '2024-10-02 23:16:07'),
(23, 'thies', 25.6, 'Clair', 85, 1010, '2024-10-03 00:37:17'),
(24, 'dakar', 27.1, 'Pluie légère', 89, 1011, '2024-10-10 22:12:04'),
(25, 'maty', -3.1, 'Couvert', 76, 1022, '2024-10-10 22:13:03'),
(26, 'maty', -3.1, 'Couvert', 76, 1022, '2024-10-10 22:13:49'),
(27, 'bella', 22.9, 'Averse de pluie légère', 92, 1007, '2024-10-10 22:14:53'),
(28, 'arame', 24.1, 'Pluie éparse à proximité', 87, 1011, '2024-10-10 22:15:13'),
(29, 'dakar', 25.4, 'Clair', 79, 1012, '2024-11-16 20:49:23'),
(30, 'dakar', 25.4, 'Clair', 79, 1012, '2024-11-16 20:52:59');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mot_de_passe` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom_utilisateur`, `email`, `mot_de_passe`, `date_creation`) VALUES
(1, 'ndigueul', 'serignecheikhndigueulfaye@gmail.com', 'faye2023', '2024-09-25 15:03:34'),
(2, 'khady', 'khady05@gmail.com', 'diop0000', '2024-09-25 15:13:50'),
(3, 'eliza', 'eliza2@gmail.com', '12345678', '2024-09-25 18:54:54'),
(4, 'modou', 'modou@gmail.com', 'asdfghjk', '2024-10-02 23:18:32');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
