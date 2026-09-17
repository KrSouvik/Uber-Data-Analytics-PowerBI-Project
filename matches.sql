-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:33306
-- Generation Time: Jul 05, 2026 at 04:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fifa_worldcup_2014`
--

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL,
  `stage` varchar(25) NOT NULL,
  `match_date` date NOT NULL,
  `venue` varchar(40) NOT NULL,
  `city` varchar(30) NOT NULL,
  `home_team_id` int(11) NOT NULL,
  `away_team_id` int(11) NOT NULL,
  `home_team` varchar(50) NOT NULL,
  `away_team` varchar(50) NOT NULL,
  `home_score` int(11) NOT NULL,
  `away_score` int(11) NOT NULL,
  `result` varchar(30) NOT NULL,
  `extra_time` tinyint(1) NOT NULL,
  `penalties` tinyint(1) NOT NULL,
  `home_penalty_score` int(11) DEFAULT NULL,
  `away_penalty_score` int(11) DEFAULT NULL,
  `attendance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_id`, `stage`, `match_date`, `venue`, `city`, `home_team_id`, `away_team_id`, `home_team`, `away_team`, `home_score`, `away_score`, `result`, `extra_time`, `penalties`, `home_penalty_score`, `away_penalty_score`, `attendance`) VALUES
(1, 'Group Stage', '2014-06-12', 'Arena de Sao Paulo', 'Sao Paulo', 1, 3, 'Brazil', 'Croatia', 3, 1, 'Home Win', 0, 0, 0, 0, 62103),
(2, 'Group Stage', '2014-06-13', 'Arena das Dunas', 'Natal', 2, 4, 'Mexico', 'Cameroon', 1, 0, 'Home Win', 0, 0, 0, 0, 39216),
(3, 'Group Stage', '2014-06-13', 'Arena Fonte Nova', 'Salvador', 7, 5, 'Spain', 'Netherlands', 1, 5, 'Away Win', 0, 0, 0, 0, 51227),
(4, 'Group Stage', '2014-06-13', 'Arena Pantanal', 'Cuiaba', 6, 8, 'Chile', 'Australia', 3, 1, 'Home Win', 0, 0, 0, 0, 40275),
(5, 'Group Stage', '2014-06-14', 'Estadio Mineirao', 'Belo Horizonte', 9, 10, 'Colombia', 'Greece', 3, 0, 'Home Win', 0, 0, 0, 0, 55182),
(6, 'Group Stage', '2014-06-14', 'Arena Pernambuco', 'Recife', 11, 12, 'Ivory Coast', 'Japan', 2, 1, 'Home Win', 0, 0, 0, 0, 40267),
(7, 'Group Stage', '2014-06-14', 'Estadio Castelao', 'Fortaleza', 14, 13, 'Uruguay', 'Costa Rica', 1, 3, 'Away Win', 0, 0, 0, 0, 60342),
(8, 'Group Stage', '2014-06-14', 'Arena Amazonia', 'Manaus', 16, 15, 'England', 'Italy', 1, 2, 'Away Win', 0, 0, 0, 0, 39800),
(9, 'Group Stage', '2014-06-15', 'Estadio Nacional', 'Brasilia', 18, 19, 'Switzerland', 'Ecuador', 2, 1, 'Home Win', 0, 0, 0, 0, 68670),
(10, 'Group Stage', '2014-06-15', 'Estadio Beira-Rio', 'Porto Alegre', 17, 20, 'France', 'Honduras', 3, 0, 'Home Win', 0, 0, 0, 0, 43012),
(11, 'Group Stage', '2014-06-15', 'Maracana', 'Rio de Janeiro', 21, 23, 'Argentina', 'Bosnia and Herzegovina', 2, 1, 'Home Win', 0, 0, 0, 0, 73947),
(12, 'Group Stage', '2014-06-16', 'Arena da Baixada', 'Curitiba', 24, 22, 'Iran', 'Nigeria', 0, 0, 'Draw', 0, 0, 0, 0, 39081),
(13, 'Group Stage', '2014-06-16', 'Arena Fonte Nova', 'Salvador', 25, 27, 'Germany', 'Portugal', 4, 0, 'Home Win', 0, 0, 0, 0, 51081),
(14, 'Group Stage', '2014-06-16', 'Arena das Dunas', 'Natal', 28, 26, 'Ghana', 'United States', 1, 2, 'Away Win', 0, 0, 0, 0, 39760),
(15, 'Group Stage', '2014-06-17', 'Estadio Mineirao', 'Belo Horizonte', 29, 30, 'Belgium', 'Algeria', 2, 1, 'Home Win', 0, 0, 0, 0, 56800),
(16, 'Group Stage', '2014-06-17', 'Arena Pantanal', 'Cuiaba', 31, 32, 'Russia', 'South Korea', 1, 1, 'Draw', 0, 0, 0, 0, 39311),
(17, 'Group Stage', '2014-06-17', 'Estadio Castelao', 'Fortaleza', 1, 2, 'Brazil', 'Mexico', 0, 0, 'Draw', 0, 0, 0, 0, 60342),
(18, 'Group Stage', '2014-06-18', 'Arena Amazonia', 'Manaus', 4, 3, 'Cameroon', 'Croatia', 0, 4, 'Away Win', 0, 0, 0, 0, 39733),
(19, 'Group Stage', '2014-06-18', 'Maracana', 'Rio de Janeiro', 7, 6, 'Spain', 'Chile', 0, 2, 'Away Win', 0, 0, 0, 0, 73820),
(20, 'Group Stage', '2014-06-18', 'Estadio Beira-Rio', 'Porto Alegre', 8, 5, 'Australia', 'Netherlands', 2, 3, 'Away Win', 0, 0, 0, 0, 43063),
(21, 'Group Stage', '2014-06-19', 'Estadio Nacional', 'Brasilia', 9, 11, 'Colombia', 'Ivory Coast', 2, 1, 'Home Win', 0, 0, 0, 0, 68748),
(22, 'Group Stage', '2014-06-19', 'Arena das Dunas', 'Natal', 12, 10, 'Japan', 'Greece', 0, 0, 'Draw', 0, 0, 0, 0, 39707),
(23, 'Group Stage', '2014-06-19', 'Arena de Sao Paulo', 'Sao Paulo', 14, 16, 'Uruguay', 'England', 2, 1, 'Home Win', 0, 0, 0, 0, 63267),
(24, 'Group Stage', '2014-06-20', 'Arena Pernambuco', 'Recife', 15, 13, 'Italy', 'Costa Rica', 0, 1, 'Away Win', 0, 0, 0, 0, 41212),
(25, 'Group Stage', '2014-06-20', 'Arena Fonte Nova', 'Salvador', 18, 17, 'Switzerland', 'France', 2, 5, 'Away Win', 0, 0, 0, 0, 51328),
(26, 'Group Stage', '2014-06-20', 'Arena da Baixada', 'Curitiba', 20, 19, 'Honduras', 'Ecuador', 1, 2, 'Away Win', 0, 0, 0, 0, 39122),
(27, 'Group Stage', '2014-06-21', 'Estadio Mineirao', 'Belo Horizonte', 21, 24, 'Argentina', 'Iran', 1, 0, 'Home Win', 0, 0, 0, 0, 56319),
(28, 'Group Stage', '2014-06-21', 'Estadio Castelao', 'Fortaleza', 25, 28, 'Germany', 'Ghana', 2, 2, 'Draw', 0, 0, 0, 0, 60142),
(29, 'Group Stage', '2014-06-21', 'Arena Pantanal', 'Cuiaba', 22, 23, 'Nigeria', 'Bosnia and Herzegovina', 1, 0, 'Home Win', 0, 0, 0, 0, 40182),
(30, 'Group Stage', '2014-06-22', 'Arena Amazonia', 'Manaus', 26, 27, 'United States', 'Portugal', 2, 2, 'Draw', 0, 0, 0, 0, 40123),
(31, 'Group Stage', '2014-06-22', 'Maracana', 'Rio de Janeiro', 29, 31, 'Belgium', 'Russia', 1, 0, 'Home Win', 0, 0, 0, 0, 73819),
(32, 'Group Stage', '2014-06-22', 'Estadio Beira-Rio', 'Porto Alegre', 32, 30, 'South Korea', 'Algeria', 2, 4, 'Away Win', 0, 0, 0, 0, 43012),
(33, 'Group Stage', '2014-06-23', 'Arena da Baixada', 'Curitiba', 8, 7, 'Australia', 'Spain', 0, 3, 'Away Win', 0, 0, 0, 0, 39311),
(34, 'Group Stage', '2014-06-23', 'Arena de Sao Paulo', 'Sao Paulo', 5, 6, 'Netherlands', 'Chile', 2, 0, 'Home Win', 0, 0, 0, 0, 62698),
(35, 'Group Stage', '2014-06-23', 'Estadio Nacional', 'Brasilia', 4, 1, 'Cameroon', 'Brazil', 1, 4, 'Away Win', 0, 0, 0, 0, 68967),
(36, 'Group Stage', '2014-06-23', 'Arena Pernambuco', 'Recife', 3, 2, 'Croatia', 'Mexico', 1, 3, 'Away Win', 0, 0, 0, 0, 41212),
(37, 'Group Stage', '2014-06-24', 'Arena Pantanal', 'Cuiaba', 12, 9, 'Japan', 'Colombia', 1, 4, 'Away Win', 0, 0, 0, 0, 40234),
(38, 'Group Stage', '2014-06-24', 'Estadio Castelao', 'Fortaleza', 10, 11, 'Greece', 'Ivory Coast', 2, 1, 'Home Win', 0, 0, 0, 0, 60000),
(39, 'Group Stage', '2014-06-24', 'Arena das Dunas', 'Natal', 15, 14, 'Italy', 'Uruguay', 0, 1, 'Away Win', 0, 0, 0, 0, 39800),
(40, 'Group Stage', '2014-06-24', 'Estadio Mineirao', 'Belo Horizonte', 13, 16, 'Costa Rica', 'England', 0, 0, 'Draw', 0, 0, 0, 0, 58598),
(41, 'Group Stage', '2014-06-25', 'Arena Amazonia', 'Manaus', 20, 18, 'Honduras', 'Switzerland', 0, 3, 'Away Win', 0, 0, 0, 0, 40322),
(42, 'Group Stage', '2014-06-25', 'Maracana', 'Rio de Janeiro', 19, 17, 'Ecuador', 'France', 0, 0, 'Draw', 0, 0, 0, 0, 73819),
(43, 'Group Stage', '2014-06-25', 'Estadio Beira-Rio', 'Porto Alegre', 22, 21, 'Nigeria', 'Argentina', 2, 3, 'Away Win', 0, 0, 0, 0, 43285),
(44, 'Group Stage', '2014-06-25', 'Arena Fonte Nova', 'Salvador', 23, 24, 'Bosnia and Herzegovina', 'Iran', 3, 1, 'Home Win', 0, 0, 0, 0, 48011),
(45, 'Group Stage', '2014-06-26', 'Arena Pernambuco', 'Recife', 26, 25, 'United States', 'Germany', 0, 1, 'Away Win', 0, 0, 0, 0, 41876),
(46, 'Group Stage', '2014-06-26', 'Estadio Nacional', 'Brasilia', 27, 28, 'Portugal', 'Ghana', 2, 1, 'Home Win', 0, 0, 0, 0, 67540),
(47, 'Group Stage', '2014-06-26', 'Arena de Sao Paulo', 'Sao Paulo', 32, 29, 'South Korea', 'Belgium', 0, 1, 'Away Win', 0, 0, 0, 0, 62997),
(48, 'Group Stage', '2014-06-26', 'Arena da Baixada', 'Curitiba', 30, 31, 'Algeria', 'Russia', 1, 1, 'Draw', 0, 0, 0, 0, 39311),
(49, 'Round of 16', '2014-06-28', 'Estadio Mineirao', 'Belo Horizonte', 1, 6, 'Brazil', 'Chile', 1, 1, 'Draw (Penalties)', 0, 0, 3, 2, 58141),
(50, 'Round of 16', '2014-06-28', 'Maracana', 'Rio de Janeiro', 9, 14, 'Colombia', 'Uruguay', 2, 0, 'Home Win', 0, 0, 0, 0, 73804),
(51, 'Round of 16', '2014-06-29', 'Estadio Castelao', 'Fortaleza', 5, 2, 'Netherlands', 'Mexico', 2, 1, 'Home Win', 0, 0, 0, 0, 60342),
(52, 'Round of 16', '2014-06-29', 'Arena Pernambuco', 'Recife', 13, 10, 'Costa Rica', 'Greece', 1, 1, 'Draw (Penalties)', 0, 0, 5, 3, 41212),
(53, 'Round of 16', '2014-06-30', 'Estadio Nacional', 'Brasilia', 17, 22, 'France', 'Nigeria', 2, 0, 'Home Win', 0, 0, 0, 0, 68748),
(54, 'Round of 16', '2014-06-30', 'Estadio Beira-Rio', 'Porto Alegre', 25, 30, 'Germany', 'Algeria', 2, 1, 'Home Win (ET)', 0, 0, 0, 0, 43063),
(55, 'Round of 16', '2014-07-01', 'Arena de Sao Paulo', 'Sao Paulo', 21, 18, 'Argentina', 'Switzerland', 1, 0, 'Home Win (ET)', 0, 0, 0, 0, 63255),
(56, 'Round of 16', '2014-07-01', 'Arena Fonte Nova', 'Salvador', 29, 26, 'Belgium', 'United States', 2, 1, 'Home Win (ET)', 0, 0, 0, 0, 51227),
(57, 'Quarterfinal', '2014-07-04', 'Maracana', 'Rio de Janeiro', 17, 25, 'France', 'Germany', 0, 1, 'Away Win', 0, 0, 0, 0, 74240),
(58, 'Quarterfinal', '2014-07-04', 'Estadio Castelao', 'Fortaleza', 1, 9, 'Brazil', 'Colombia', 2, 1, 'Home Win', 0, 0, 0, 0, 60342),
(59, 'Quarterfinal', '2014-07-05', 'Estadio Nacional', 'Brasilia', 21, 29, 'Argentina', 'Belgium', 1, 0, 'Home Win', 0, 0, 0, 0, 68748),
(60, 'Quarterfinal', '2014-07-05', 'Arena Fonte Nova', 'Salvador', 5, 13, 'Netherlands', 'Costa Rica', 0, 0, 'Draw (Penalties)', 0, 0, 4, 3, 51227),
(61, 'Semifinal', '2014-07-08', 'Estadio Mineirao', 'Belo Horizonte', 1, 25, 'Brazil', 'Germany', 1, 7, 'Away Win', 0, 0, 0, 0, 58141),
(62, 'Semifinal', '2014-07-09', 'Arena de Sao Paulo', 'Sao Paulo', 5, 21, 'Netherlands', 'Argentina', 0, 0, 'Draw (Penalties)', 0, 0, 2, 4, 63267),
(63, 'Third Place Play-off', '2014-07-12', 'Estadio Nacional', 'Brasilia', 1, 5, 'Brazil', 'Netherlands', 0, 3, 'Away Win', 0, 0, 0, 0, 68034),
(64, 'Final', '2014-07-13', 'Maracana', 'Rio de Janeiro', 25, 21, 'Germany', 'Argentina', 1, 0, 'Home Win (ET)', 0, 0, 0, 0, 74738);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `home_team_id` (`home_team_id`),
  ADD KEY `away_team_id` (`away_team_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
