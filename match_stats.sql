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
-- Table structure for table `match_stats`
--

CREATE TABLE `match_stats` (
  `match_stat_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `stage` varchar(25) NOT NULL,
  `home_away` varchar(4) NOT NULL,
  `goals_scored` int(11) NOT NULL,
  `goals_conceded` int(11) NOT NULL,
  `possession_pct` decimal(5,2) NOT NULL,
  `pass_accuracy_pct` decimal(5,2) NOT NULL,
  `shots_total` int(11) NOT NULL,
  `shots_on_target` int(11) NOT NULL,
  `tackles` int(11) NOT NULL,
  `interceptions` int(11) NOT NULL,
  `corners` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `offsides` int(11) NOT NULL,
  `distance_covered_km` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_stats`
--

INSERT INTO `match_stats` (`match_stat_id`, `match_id`, `team_id`, `team_name`, `stage`, `home_away`, `goals_scored`, `goals_conceded`, `possession_pct`, `pass_accuracy_pct`, `shots_total`, `shots_on_target`, `tackles`, `interceptions`, `corners`, `fouls`, `offsides`, `distance_covered_km`) VALUES
(1, 1, 1, 'Brazil', 'Group Stage', 'home', 3, 1, 50.20, 75.80, 16, 5, 18, 12, 6, 14, 0, 110.60),
(2, 1, 3, 'Croatia', 'Group Stage', 'away', 1, 3, 44.90, 77.60, 12, 6, 12, 7, 7, 18, 2, 110.20),
(3, 2, 2, 'Mexico', 'Group Stage', 'home', 1, 0, 55.50, 74.10, 13, 5, 16, 9, 6, 17, 1, 112.60),
(4, 2, 4, 'Cameroon', 'Group Stage', 'away', 0, 1, 49.40, 69.10, 9, 3, 12, 7, 6, 13, 1, 112.60),
(5, 3, 7, 'Spain', 'Group Stage', 'home', 1, 5, 53.80, 86.30, 17, 8, 11, 8, 10, 18, 3, 108.70),
(6, 3, 5, 'Netherlands', 'Group Stage', 'away', 5, 1, 49.60, 78.50, 13, 6, 13, 9, 4, 16, 3, 112.40),
(7, 4, 6, 'Chile', 'Group Stage', 'home', 3, 1, 57.70, 81.20, 18, 8, 20, 14, 13, 18, 2, 113.60),
(8, 4, 8, 'Australia', 'Group Stage', 'away', 1, 3, 41.80, 74.40, 12, 7, 22, 14, 6, 16, 0, 111.00),
(9, 5, 9, 'Colombia', 'Group Stage', 'home', 3, 0, 52.10, 81.80, 11, 5, 13, 8, 6, 18, 0, 110.80),
(10, 5, 10, 'Greece', 'Group Stage', 'away', 0, 3, 45.60, 78.80, 11, 6, 17, 11, 5, 18, 4, 107.00),
(11, 6, 11, 'Ivory Coast', 'Group Stage', 'home', 2, 1, 43.80, 74.40, 10, 4, 18, 11, 3, 13, 1, 112.40),
(12, 6, 12, 'Japan', 'Group Stage', 'away', 1, 2, 57.20, 86.80, 12, 6, 16, 9, 9, 17, 3, 115.40),
(13, 7, 14, 'Uruguay', 'Group Stage', 'home', 1, 3, 52.00, 75.90, 7, 3, 15, 9, 3, 11, 1, 105.70),
(14, 7, 13, 'Costa Rica', 'Group Stage', 'away', 3, 1, 43.20, 71.00, 6, 3, 16, 13, 4, 10, 1, 109.50),
(15, 8, 16, 'England', 'Group Stage', 'home', 1, 2, 47.40, 77.00, 16, 9, 18, 13, 6, 10, 1, 108.40),
(16, 8, 15, 'Italy', 'Group Stage', 'away', 2, 1, 54.20, 80.10, 8, 4, 17, 10, 5, 9, 2, 117.70),
(17, 9, 18, 'Switzerland', 'Group Stage', 'home', 2, 1, 53.70, 82.80, 11, 4, 14, 11, 6, 17, 1, 107.90),
(18, 9, 19, 'Ecuador', 'Group Stage', 'away', 1, 2, 51.70, 83.20, 14, 7, 22, 17, 6, 14, 1, 105.40),
(19, 10, 17, 'France', 'Group Stage', 'home', 3, 0, 53.90, 82.00, 13, 6, 21, 14, 10, 19, 4, 109.70),
(20, 10, 20, 'Honduras', 'Group Stage', 'away', 0, 3, 40.00, 67.50, 6, 2, 23, 19, 4, 14, 3, 115.40),
(21, 11, 21, 'Argentina', 'Group Stage', 'home', 2, 1, 47.70, 84.40, 18, 9, 18, 12, 7, 17, 1, 115.40),
(22, 11, 23, 'Bosnia and Herzegovina', 'Group Stage', 'away', 1, 2, 52.80, 79.10, 13, 7, 19, 11, 5, 11, 4, 115.50),
(23, 12, 24, 'Iran', 'Group Stage', 'home', 0, 0, 42.00, 76.10, 9, 4, 22, 16, 4, 9, 4, 113.40),
(24, 12, 22, 'Nigeria', 'Group Stage', 'away', 0, 0, 55.40, 81.40, 11, 6, 23, 14, 5, 12, 1, 112.60),
(25, 13, 25, 'Germany', 'Group Stage', 'home', 4, 0, 53.90, 86.10, 12, 6, 14, 10, 7, 18, 2, 116.90),
(26, 13, 27, 'Portugal', 'Group Stage', 'away', 0, 4, 44.20, 76.60, 11, 4, 17, 10, 4, 17, 1, 111.20),
(27, 14, 28, 'Ghana', 'Group Stage', 'home', 1, 2, 54.20, 77.60, 10, 4, 19, 15, 4, 15, 1, 108.60),
(28, 14, 26, 'United States', 'Group Stage', 'away', 2, 1, 49.70, 74.60, 10, 5, 26, 18, 6, 14, 2, 114.00),
(29, 15, 29, 'Belgium', 'Group Stage', 'home', 2, 1, 52.40, 80.70, 12, 6, 19, 15, 9, 12, 2, 117.30),
(30, 15, 30, 'Algeria', 'Group Stage', 'away', 1, 2, 50.00, 71.60, 8, 3, 14, 9, 3, 16, 3, 116.70),
(31, 16, 31, 'Russia', 'Group Stage', 'home', 1, 1, 46.60, 81.30, 12, 4, 22, 18, 5, 19, 2, 111.30),
(32, 16, 32, 'South Korea', 'Group Stage', 'away', 1, 1, 54.60, 81.90, 9, 4, 19, 12, 4, 12, 3, 105.30),
(33, 17, 1, 'Brazil', 'Group Stage', 'home', 0, 0, 54.90, 78.50, 10, 4, 19, 13, 4, 19, 3, 117.60),
(34, 17, 2, 'Mexico', 'Group Stage', 'away', 0, 0, 42.40, 76.20, 7, 3, 17, 10, 4, 18, 3, 108.40),
(35, 18, 4, 'Cameroon', 'Group Stage', 'home', 0, 4, 42.70, 73.70, 9, 4, 13, 7, 6, 13, 0, 117.20),
(36, 18, 3, 'Croatia', 'Group Stage', 'away', 4, 0, 55.60, 84.60, 9, 5, 11, 9, 5, 12, 2, 117.00),
(37, 19, 7, 'Spain', 'Group Stage', 'home', 0, 2, 52.00, 84.50, 14, 5, 10, 6, 5, 11, 1, 109.00),
(38, 19, 6, 'Chile', 'Group Stage', 'away', 2, 0, 48.20, 81.00, 16, 6, 18, 10, 7, 9, 3, 112.20),
(39, 20, 8, 'Australia', 'Group Stage', 'home', 2, 3, 43.20, 72.40, 14, 5, 22, 15, 8, 17, 2, 111.60),
(40, 20, 5, 'Netherlands', 'Group Stage', 'away', 3, 2, 55.80, 87.10, 12, 6, 18, 13, 6, 12, 0, 106.70),
(41, 21, 9, 'Colombia', 'Group Stage', 'home', 2, 1, 49.30, 88.20, 13, 5, 13, 10, 9, 16, 1, 108.10),
(42, 21, 11, 'Ivory Coast', 'Group Stage', 'away', 1, 2, 45.60, 76.50, 9, 4, 15, 13, 7, 14, 1, 117.60),
(43, 22, 12, 'Japan', 'Group Stage', 'home', 0, 0, 54.10, 83.40, 8, 3, 14, 10, 3, 14, 0, 108.40),
(44, 22, 10, 'Greece', 'Group Stage', 'away', 0, 0, 41.10, 74.40, 6, 2, 18, 11, 4, 14, 3, 113.50),
(45, 23, 14, 'Uruguay', 'Group Stage', 'home', 2, 1, 48.70, 80.30, 9, 4, 27, 16, 6, 15, 0, 115.90),
(46, 23, 16, 'England', 'Group Stage', 'away', 1, 2, 56.10, 81.90, 15, 8, 14, 10, 8, 17, 3, 115.70),
(47, 24, 15, 'Italy', 'Group Stage', 'home', 0, 1, 58.00, 87.40, 13, 6, 14, 8, 5, 13, 0, 115.90),
(48, 24, 13, 'Costa Rica', 'Group Stage', 'away', 1, 0, 43.10, 75.20, 9, 4, 22, 12, 6, 16, 2, 112.00),
(49, 25, 18, 'Switzerland', 'Group Stage', 'home', 2, 5, 48.70, 76.70, 15, 6, 13, 8, 10, 11, 3, 117.70),
(50, 25, 17, 'France', 'Group Stage', 'away', 5, 2, 52.50, 83.00, 16, 8, 20, 15, 10, 10, 1, 108.30),
(51, 26, 20, 'Honduras', 'Group Stage', 'home', 1, 2, 47.50, 68.20, 8, 3, 16, 10, 5, 16, 3, 108.80),
(52, 26, 19, 'Ecuador', 'Group Stage', 'away', 2, 1, 54.60, 78.30, 11, 4, 23, 14, 8, 18, 0, 111.00),
(53, 27, 21, 'Argentina', 'Group Stage', 'home', 1, 0, 60.00, 87.50, 14, 5, 13, 11, 6, 15, 1, 111.80),
(54, 27, 24, 'Iran', 'Group Stage', 'away', 0, 1, 46.10, 70.00, 8, 3, 29, 22, 4, 18, 2, 105.30),
(55, 28, 25, 'Germany', 'Group Stage', 'home', 2, 2, 51.30, 86.80, 16, 6, 12, 8, 8, 17, 0, 114.80),
(56, 28, 28, 'Ghana', 'Group Stage', 'away', 2, 2, 47.50, 73.60, 15, 7, 23, 15, 7, 13, 4, 112.70),
(57, 29, 22, 'Nigeria', 'Group Stage', 'home', 1, 0, 47.60, 76.70, 9, 3, 14, 11, 4, 18, 1, 108.50),
(58, 29, 23, 'Bosnia and Herzegovina', 'Group Stage', 'away', 0, 1, 51.40, 77.10, 12, 6, 20, 16, 7, 18, 4, 112.10),
(59, 30, 26, 'United States', 'Group Stage', 'home', 2, 2, 49.90, 70.50, 11, 5, 24, 18, 5, 9, 4, 106.70),
(60, 30, 27, 'Portugal', 'Group Stage', 'away', 2, 2, 51.60, 74.90, 9, 4, 23, 14, 6, 12, 2, 110.10),
(61, 31, 29, 'Belgium', 'Group Stage', 'home', 1, 0, 48.80, 77.10, 10, 5, 17, 10, 7, 19, 2, 106.80),
(62, 31, 31, 'Russia', 'Group Stage', 'away', 0, 1, 46.10, 75.30, 9, 3, 15, 9, 5, 18, 3, 110.40),
(63, 32, 32, 'South Korea', 'Group Stage', 'home', 2, 4, 51.30, 79.00, 11, 4, 14, 9, 8, 10, 2, 113.20),
(64, 32, 30, 'Algeria', 'Group Stage', 'away', 4, 2, 50.90, 72.30, 9, 4, 18, 12, 7, 17, 3, 105.30),
(65, 33, 8, 'Australia', 'Group Stage', 'home', 0, 3, 37.80, 74.40, 14, 6, 19, 10, 7, 18, 3, 116.10),
(66, 33, 7, 'Spain', 'Group Stage', 'away', 3, 0, 62.30, 85.70, 10, 4, 13, 10, 7, 16, 3, 114.90),
(67, 34, 5, 'Netherlands', 'Group Stage', 'home', 2, 0, 49.30, 82.80, 9, 4, 14, 12, 6, 12, 1, 108.30),
(68, 34, 6, 'Chile', 'Group Stage', 'away', 0, 2, 51.50, 85.10, 12, 4, 20, 14, 6, 11, 2, 105.10),
(69, 35, 4, 'Cameroon', 'Group Stage', 'home', 1, 4, 42.30, 69.90, 12, 6, 21, 15, 5, 11, 4, 114.20),
(70, 35, 1, 'Brazil', 'Group Stage', 'away', 4, 1, 54.60, 74.60, 15, 7, 17, 11, 9, 18, 1, 105.40),
(71, 36, 3, 'Croatia', 'Group Stage', 'home', 1, 3, 51.50, 80.80, 15, 5, 18, 14, 8, 11, 4, 109.10),
(72, 36, 2, 'Mexico', 'Group Stage', 'away', 3, 1, 49.80, 75.90, 8, 4, 18, 15, 4, 11, 1, 110.40),
(73, 37, 12, 'Japan', 'Group Stage', 'home', 1, 4, 52.20, 89.50, 9, 4, 12, 10, 4, 10, 0, 110.10),
(74, 37, 9, 'Colombia', 'Group Stage', 'away', 4, 1, 52.30, 89.60, 18, 10, 22, 14, 7, 18, 3, 105.40),
(75, 38, 10, 'Greece', 'Group Stage', 'home', 2, 1, 49.30, 74.20, 8, 3, 16, 9, 4, 13, 4, 106.60),
(76, 38, 11, 'Ivory Coast', 'Group Stage', 'away', 1, 2, 55.70, 74.20, 10, 5, 21, 14, 4, 14, 1, 117.00),
(77, 39, 15, 'Italy', 'Group Stage', 'home', 0, 1, 52.10, 82.10, 15, 5, 16, 13, 10, 9, 0, 105.80),
(78, 39, 14, 'Uruguay', 'Group Stage', 'away', 1, 0, 48.80, 74.60, 12, 6, 19, 12, 9, 15, 1, 114.30),
(79, 40, 13, 'Costa Rica', 'Group Stage', 'home', 0, 0, 42.70, 72.10, 6, 3, 28, 21, 4, 9, 1, 111.20),
(80, 40, 16, 'England', 'Group Stage', 'away', 0, 0, 59.50, 85.10, 12, 5, 17, 12, 9, 11, 3, 114.60),
(81, 41, 20, 'Honduras', 'Group Stage', 'home', 0, 3, 47.40, 72.10, 8, 3, 19, 13, 5, 10, 1, 114.80),
(82, 41, 18, 'Switzerland', 'Group Stage', 'away', 3, 0, 53.20, 76.70, 9, 4, 16, 14, 6, 19, 1, 106.10),
(83, 42, 19, 'Ecuador', 'Group Stage', 'home', 0, 0, 43.40, 78.60, 13, 5, 15, 10, 8, 16, 3, 116.00),
(84, 42, 17, 'France', 'Group Stage', 'away', 0, 0, 54.60, 80.40, 20, 8, 18, 12, 13, 11, 1, 108.20),
(85, 43, 22, 'Nigeria', 'Group Stage', 'home', 2, 3, 44.90, 81.00, 12, 5, 18, 15, 7, 11, 3, 113.50),
(86, 43, 21, 'Argentina', 'Group Stage', 'away', 3, 2, 56.30, 78.80, 14, 7, 19, 16, 5, 12, 0, 107.50),
(87, 44, 23, 'Bosnia and Herzegovina', 'Group Stage', 'home', 3, 1, 60.30, 80.90, 18, 7, 20, 14, 8, 17, 4, 106.40),
(88, 44, 24, 'Iran', 'Group Stage', 'away', 1, 3, 44.30, 74.30, 6, 2, 18, 11, 3, 15, 3, 107.60),
(89, 45, 26, 'United States', 'Group Stage', 'home', 0, 1, 38.50, 73.00, 11, 4, 19, 12, 8, 14, 0, 106.30),
(90, 45, 25, 'Germany', 'Group Stage', 'away', 1, 0, 56.80, 87.40, 18, 6, 13, 10, 9, 12, 1, 117.40),
(91, 46, 27, 'Portugal', 'Group Stage', 'home', 2, 1, 47.90, 76.90, 10, 4, 22, 19, 5, 11, 3, 107.60),
(92, 46, 28, 'Ghana', 'Group Stage', 'away', 1, 2, 46.70, 80.80, 11, 6, 18, 15, 6, 11, 0, 112.20),
(93, 47, 32, 'South Korea', 'Group Stage', 'home', 0, 1, 50.40, 82.70, 8, 4, 18, 13, 3, 12, 2, 117.00),
(94, 47, 29, 'Belgium', 'Group Stage', 'away', 1, 0, 47.60, 80.30, 15, 8, 14, 8, 11, 19, 2, 105.70),
(95, 48, 30, 'Algeria', 'Group Stage', 'home', 1, 1, 52.10, 73.90, 13, 6, 23, 14, 9, 11, 2, 116.00),
(96, 48, 31, 'Russia', 'Group Stage', 'away', 1, 1, 54.00, 76.20, 8, 3, 18, 12, 3, 11, 3, 116.70),
(97, 49, 1, 'Brazil', 'Round of 16', 'home', 1, 1, 47.10, 79.70, 17, 6, 21, 12, 10, 15, 3, 109.00),
(98, 49, 6, 'Chile', 'Round of 16', 'away', 1, 1, 48.60, 83.90, 15, 7, 19, 13, 5, 15, 2, 108.10),
(99, 50, 9, 'Colombia', 'Round of 16', 'home', 2, 0, 57.00, 88.60, 15, 5, 17, 10, 6, 13, 0, 110.70),
(100, 50, 14, 'Uruguay', 'Round of 16', 'away', 0, 2, 45.20, 72.60, 11, 4, 24, 19, 6, 10, 2, 109.90),
(101, 51, 5, 'Netherlands', 'Round of 16', 'home', 2, 1, 56.90, 78.70, 17, 9, 18, 14, 7, 19, 2, 117.40),
(102, 51, 2, 'Mexico', 'Round of 16', 'away', 1, 2, 50.00, 75.20, 13, 7, 15, 10, 9, 11, 4, 108.60),
(103, 52, 13, 'Costa Rica', 'Round of 16', 'home', 1, 1, 49.50, 70.90, 9, 5, 18, 11, 5, 12, 0, 107.40),
(104, 52, 10, 'Greece', 'Round of 16', 'away', 1, 1, 50.30, 79.20, 10, 5, 16, 13, 4, 14, 3, 109.70),
(105, 53, 17, 'France', 'Round of 16', 'home', 2, 0, 57.20, 84.80, 17, 9, 13, 11, 10, 13, 3, 108.40),
(106, 53, 22, 'Nigeria', 'Round of 16', 'away', 0, 2, 49.70, 78.10, 10, 5, 18, 11, 7, 9, 3, 108.30),
(107, 54, 25, 'Germany', 'Round of 16', 'home', 2, 1, 57.80, 91.90, 18, 9, 14, 8, 6, 10, 2, 110.60),
(108, 54, 30, 'Algeria', 'Round of 16', 'away', 1, 2, 43.40, 78.50, 8, 3, 21, 12, 3, 13, 0, 109.60),
(109, 55, 21, 'Argentina', 'Round of 16', 'home', 1, 0, 48.40, 83.60, 15, 6, 17, 12, 6, 18, 1, 106.90),
(110, 55, 18, 'Switzerland', 'Round of 16', 'away', 0, 1, 46.10, 82.20, 16, 8, 17, 11, 5, 15, 2, 109.60),
(111, 56, 29, 'Belgium', 'Round of 16', 'home', 2, 1, 54.90, 79.90, 17, 8, 15, 12, 6, 14, 2, 108.10),
(112, 56, 26, 'United States', 'Round of 16', 'away', 1, 2, 42.70, 77.00, 6, 3, 27, 16, 2, 15, 2, 113.30),
(113, 57, 17, 'France', 'Quarterfinal', 'home', 0, 1, 51.30, 80.90, 14, 5, 12, 10, 9, 16, 0, 116.00),
(114, 57, 25, 'Germany', 'Quarterfinal', 'away', 1, 0, 53.20, 86.50, 20, 8, 13, 8, 9, 9, 1, 114.70),
(115, 58, 1, 'Brazil', 'Quarterfinal', 'home', 2, 1, 52.60, 82.40, 17, 6, 18, 12, 12, 14, 1, 113.30),
(116, 58, 9, 'Colombia', 'Quarterfinal', 'away', 1, 2, 52.70, 82.80, 20, 6, 15, 9, 13, 18, 3, 109.20),
(117, 59, 21, 'Argentina', 'Quarterfinal', 'home', 1, 0, 53.90, 81.10, 12, 6, 17, 13, 8, 19, 2, 115.90),
(118, 59, 29, 'Belgium', 'Quarterfinal', 'away', 0, 1, 50.80, 83.80, 12, 6, 18, 12, 5, 15, 0, 116.80),
(119, 60, 5, 'Netherlands', 'Quarterfinal', 'home', 0, 0, 54.70, 77.60, 10, 5, 15, 9, 3, 9, 3, 113.20),
(120, 60, 13, 'Costa Rica', 'Quarterfinal', 'away', 0, 0, 44.00, 76.20, 6, 3, 21, 17, 4, 18, 0, 116.30),
(121, 61, 1, 'Brazil', 'Semifinal', 'home', 1, 7, 51.90, 83.30, 11, 4, 14, 8, 8, 17, 3, 115.70),
(122, 61, 25, 'Germany', 'Semifinal', 'away', 7, 1, 52.40, 84.70, 12, 7, 18, 11, 6, 13, 0, 108.30),
(123, 62, 5, 'Netherlands', 'Semifinal', 'home', 0, 0, 48.90, 84.40, 13, 5, 21, 15, 9, 15, 0, 110.40),
(124, 62, 21, 'Argentina', 'Semifinal', 'away', 0, 0, 48.90, 85.50, 13, 6, 16, 10, 9, 10, 3, 107.20),
(125, 63, 1, 'Brazil', 'Third Place Play-off', 'home', 0, 3, 47.10, 76.30, 17, 9, 12, 8, 9, 17, 1, 111.40),
(126, 63, 5, 'Netherlands', 'Third Place Play-off', 'away', 3, 0, 47.60, 85.60, 12, 6, 14, 9, 8, 14, 0, 113.30),
(127, 64, 25, 'Germany', 'Final', 'home', 1, 0, 49.80, 89.90, 19, 10, 17, 11, 10, 13, 4, 106.10),
(128, 64, 21, 'Argentina', 'Final', 'away', 0, 1, 50.00, 78.10, 11, 4, 20, 14, 6, 18, 1, 111.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `match_stats`
--
ALTER TABLE `match_stats`
  ADD PRIMARY KEY (`match_stat_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `match_stats`
--
ALTER TABLE `match_stats`
  ADD CONSTRAINT `match_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  ADD CONSTRAINT `match_stats_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
