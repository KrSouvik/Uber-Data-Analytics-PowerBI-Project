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
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `confederation` varchar(20) NOT NULL,
  `group_name` char(1) NOT NULL,
  `matches_played` int(11) NOT NULL,
  `wins` int(11) NOT NULL,
  `draws` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `goals_for` int(11) NOT NULL,
  `goals_against` int(11) NOT NULL,
  `goal_difference` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `final_result` varchar(40) NOT NULL,
  `tactical_style` varchar(50) NOT NULL,
  `avg_possession_pct` decimal(5,2) NOT NULL,
  `pass_accuracy_pct` decimal(5,2) NOT NULL,
  `shots_per_game` decimal(5,2) NOT NULL,
  `tackles_per_game` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`, `confederation`, `group_name`, `matches_played`, `wins`, `draws`, `losses`, `goals_for`, `goals_against`, `goal_difference`, `points`, `final_result`, `tactical_style`, `avg_possession_pct`, `pass_accuracy_pct`, `shots_per_game`, `tackles_per_game`) VALUES
(0, 'team_name', 'confederation', 'g', 0, 0, 0, 0, 0, 0, 0, 0, 'final_result', 'tactical_style', 0.00, 0.00, 0.00, 0.00),
(1, 'Brazil', 'CONMEBOL', 'A', 7, 3, 2, 2, 11, 14, -3, 11, '4th Place (Semifinal exit)', 'Direct / Counter-attacking', 56.40, 79.10, 14.60, 17.80),
(2, 'Mexico', 'CONCACAF', 'A', 4, 2, 1, 1, 6, 3, 3, 7, 'Round of 16', 'Defensive / Low Block', 47.20, 78.40, 10.50, 20.10),
(3, 'Croatia', 'UEFA', 'A', 3, 1, 0, 2, 6, 6, 0, 3, 'Group Stage', 'Balanced', 52.80, 81.60, 13.20, 15.40),
(4, 'Cameroon', 'CAF', 'A', 3, 0, 0, 3, 1, 9, -8, 0, 'Group Stage', 'Direct / Long-Ball', 44.10, 70.20, 8.70, 16.90),
(5, 'Netherlands', 'UEFA', 'B', 7, 5, 1, 1, 15, 6, 9, 16, '3rd Place', 'Counter-attacking', 53.90, 82.30, 13.90, 16.20),
(6, 'Chile', 'CONMEBOL', 'B', 4, 2, 1, 1, 8, 5, 3, 7, 'Round of 16', 'High Pressing', 54.70, 83.10, 15.80, 19.60),
(7, 'Spain', 'UEFA', 'B', 3, 1, 0, 2, 4, 7, -3, 3, 'Group Stage', 'Possession-based (Tiki-Taka)', 63.80, 88.40, 14.10, 13.20),
(8, 'Australia', 'AFC', 'B', 3, 0, 0, 3, 2, 9, -7, 0, 'Group Stage', 'High Pressing', 45.30, 72.60, 10.90, 18.40),
(9, 'Colombia', 'CONMEBOL', 'C', 5, 4, 0, 1, 12, 5, 7, 12, 'Quarterfinal', 'Possession-based / Balanced', 54.20, 85.70, 15.40, 17.10),
(10, 'Greece', 'UEFA', 'C', 4, 1, 1, 2, 3, 6, -3, 4, 'Round of 16', 'Defensive / Low Block', 44.80, 75.30, 9.30, 19.80),
(11, 'Ivory Coast', 'CAF', 'C', 3, 1, 0, 2, 4, 5, -1, 3, 'Group Stage', 'Balanced', 48.60, 76.90, 11.70, 17.30),
(12, 'Japan', 'AFC', 'C', 3, 0, 1, 2, 2, 6, -4, 1, 'Group Stage', 'Possession-based', 56.10, 84.90, 12.40, 14.70),
(13, 'Costa Rica', 'CONCACAF', 'D', 5, 3, 2, 0, 5, 2, 3, 11, 'Quarterfinal', 'Defensive / Low Block (Counter)', 39.70, 74.10, 8.60, 22.40),
(14, 'Uruguay', 'CONMEBOL', 'D', 4, 2, 0, 2, 4, 5, -1, 6, 'Round of 16', 'Defensive / Counter-attacking', 44.50, 76.80, 10.10, 20.70),
(15, 'Italy', 'UEFA', 'D', 3, 1, 0, 2, 2, 3, -1, 3, 'Group Stage', 'Balanced / Possession', 53.40, 83.50, 11.80, 16.50),
(16, 'England', 'UEFA', 'D', 3, 0, 1, 2, 2, 4, -2, 1, 'Group Stage', 'Balanced / Direct', 50.20, 80.70, 12.60, 17.90),
(17, 'France', 'UEFA', 'E', 5, 3, 1, 1, 10, 3, 7, 10, 'Quarterfinal', 'Balanced / Possession', 56.80, 84.20, 15.90, 16.80),
(18, 'Switzerland', 'UEFA', 'E', 4, 2, 0, 2, 7, 9, -2, 6, 'Round of 16', 'Balanced', 51.30, 80.90, 12.90, 17.60),
(19, 'Ecuador', 'CONMEBOL', 'E', 3, 1, 1, 1, 3, 3, 0, 4, 'Group Stage', 'Balanced', 49.70, 78.60, 11.20, 18.30),
(20, 'Honduras', 'CONCACAF', 'E', 3, 0, 0, 3, 1, 8, -7, 0, 'Group Stage', 'Defensive / Low Block', 41.60, 69.80, 7.90, 21.50),
(21, 'Argentina', 'CONMEBOL', 'F', 7, 6, 1, 0, 11, 5, 6, 19, 'Runner-up (Final)', 'Counter-attacking', 52.60, 82.80, 14.30, 16.10),
(22, 'Nigeria', 'CAF', 'F', 4, 1, 2, 1, 5, 7, -2, 5, 'Round of 16', 'Counter-attacking', 47.90, 77.40, 11.10, 18.90),
(23, 'Bosnia and Herzegovina', 'UEFA', 'F', 3, 1, 0, 2, 4, 4, 0, 3, 'Group Stage', 'Balanced', 50.50, 80.10, 13.50, 16.40),
(24, 'Iran', 'AFC', 'F', 3, 0, 1, 2, 1, 4, -3, 1, 'Group Stage', 'Defensive / Low Block', 38.90, 73.20, 6.80, 23.60),
(25, 'Germany', 'UEFA', 'G', 7, 6, 1, 0, 18, 4, 14, 19, 'Champion', 'Possession-based / High Pressing', 59.60, 86.90, 16.70, 15.90),
(26, 'United States', 'CONCACAF', 'G', 4, 2, 1, 1, 6, 5, 1, 7, 'Round of 16', 'Defensive / Counter-attacking', 43.80, 74.50, 9.60, 21.20),
(27, 'Portugal', 'UEFA', 'G', 3, 1, 1, 1, 4, 7, -3, 4, 'Group Stage', 'Direct / Counter-attacking', 47.10, 76.30, 10.80, 17.70),
(28, 'Ghana', 'CAF', 'G', 3, 0, 2, 1, 4, 6, -2, 2, 'Group Stage', 'Balanced', 48.30, 77.10, 11.40, 18.60),
(29, 'Belgium', 'UEFA', 'H', 5, 4, 0, 1, 6, 4, 2, 12, 'Quarterfinal', 'Counter-attacking', 50.90, 80.40, 12.70, 17.20),
(30, 'Algeria', 'CAF', 'H', 4, 1, 2, 1, 7, 7, 0, 5, 'Round of 16', 'Direct / Counter-attacking', 45.60, 74.90, 10.30, 19.40),
(31, 'Russia', 'UEFA', 'H', 3, 0, 2, 1, 2, 3, -1, 2, 'Group Stage', 'Balanced', 48.10, 79.20, 10.60, 18.10),
(32, 'South Korea', 'AFC', 'H', 3, 0, 1, 2, 3, 6, -3, 1, 'Group Stage', 'High Pressing', 49.40, 78.80, 11.90, 19.10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
