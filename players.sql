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
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(60) NOT NULL,
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `position` varchar(15) NOT NULL,
  `age` int(11) NOT NULL,
  `jersey_number` int(11) NOT NULL,
  `matches_played` int(11) NOT NULL,
  `minutes_played` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL,
  `shots_total` int(11) NOT NULL,
  `pass_accuracy_pct` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `player_name`, `team_id`, `team_name`, `position`, `age`, `jersey_number`, `matches_played`, `minutes_played`, `goals`, `assists`, `yellow_cards`, `red_cards`, `shots_total`, `pass_accuracy_pct`) VALUES
(1, 'James Rodriguez', 9, 'Colombia', 'Midfielder', 22, 10, 5, 479, 6, 2, 1, 0, 20, 84.50),
(2, 'Thomas Muller', 25, 'Germany', 'Forward', 24, 13, 7, 569, 5, 3, 1, 0, 19, 81.20),
(3, 'Neymar', 1, 'Brazil', 'Forward', 22, 10, 4, 386, 4, 1, 1, 0, 20, 78.90),
(4, 'Lionel Messi', 21, 'Argentina', 'Forward', 27, 10, 7, 634, 4, 1, 2, 0, 25, 83.60),
(5, 'Robin van Persie', 5, 'Netherlands', 'Forward', 30, 9, 7, 589, 4, 0, 0, 0, 18, 80.10),
(6, 'Karim Benzema', 17, 'France', 'Forward', 26, 19, 5, 441, 3, 0, 0, 0, 17, 82.40),
(7, 'Enner Valencia', 19, 'Ecuador', 'Forward', 24, 7, 3, 270, 3, 0, 0, 0, 10, 76.30),
(8, 'Arjen Robben', 5, 'Netherlands', 'Forward', 30, 11, 7, 608, 3, 3, 0, 0, 22, 79.80),
(9, 'Xherdan Shaqiri', 18, 'Switzerland', 'Midfielder', 22, 23, 4, 353, 3, 0, 0, 0, 13, 81.70),
(10, 'Bryan Ruiz', 13, 'Costa Rica', 'Forward', 28, 10, 5, 450, 2, 1, 1, 0, 9, 77.50),
(11, 'Miroslav Klose', 25, 'Germany', 'Forward', 36, 11, 5, 247, 2, 0, 0, 0, 7, 74.20),
(12, 'Toni Kroos', 25, 'Germany', 'Midfielder', 24, 18, 7, 606, 2, 3, 1, 0, 14, 90.30),
(13, 'Mario Gotze', 25, 'Germany', 'Forward', 22, 19, 7, 352, 2, 0, 1, 0, 10, 83.10),
(14, 'Andre Schurrle', 25, 'Germany', 'Forward', 23, 7, 7, 367, 3, 1, 0, 0, 12, 80.60),
(15, 'Julian Green', 25, 'Germany', 'Forward', 19, 20, 1, 20, 0, 0, 0, 0, 1, 75.00),
(16, 'Mats Hummels', 25, 'Germany', 'Defender', 25, 5, 7, 630, 2, 0, 1, 0, 8, 89.70),
(17, 'Manuel Neuer', 25, 'Germany', 'Goalkeeper', 28, 1, 7, 690, 0, 0, 0, 0, 0, 88.20),
(18, 'Philipp Lahm', 25, 'Germany', 'Defender', 30, 16, 7, 690, 0, 1, 0, 0, 3, 91.40),
(19, 'Sami Khedira', 25, 'Germany', 'Midfielder', 27, 6, 4, 300, 1, 1, 0, 0, 6, 85.90),
(20, 'Bastian Schweinsteiger', 25, 'Germany', 'Midfielder', 29, 7, 7, 592, 0, 1, 2, 0, 9, 88.50),
(21, 'Sergio Aguero', 21, 'Argentina', 'Forward', 25, 16, 4, 183, 1, 1, 0, 0, 10, 76.40),
(22, 'Angel Di Maria', 21, 'Argentina', 'Midfielder', 26, 7, 5, 433, 1, 2, 1, 0, 11, 79.20),
(23, 'Gonzalo Higuain', 21, 'Argentina', 'Forward', 26, 9, 7, 433, 1, 0, 0, 0, 15, 74.80),
(24, 'Javier Mascherano', 21, 'Argentina', 'Midfielder', 29, 14, 7, 690, 0, 0, 3, 0, 4, 87.30),
(25, 'Sergio Romero', 21, 'Argentina', 'Goalkeeper', 27, 1, 7, 690, 0, 0, 1, 0, 0, 71.50),
(26, 'Ezequiel Lavezzi', 21, 'Argentina', 'Forward', 29, 22, 6, 320, 0, 1, 0, 0, 8, 78.00),
(27, 'Marcos Rojo', 21, 'Argentina', 'Defender', 24, 16, 6, 540, 1, 0, 1, 0, 3, 80.40),
(28, 'Oscar', 1, 'Brazil', 'Midfielder', 22, 11, 7, 617, 1, 1, 2, 0, 10, 81.90),
(29, 'David Luiz', 1, 'Brazil', 'Defender', 27, 4, 7, 690, 2, 0, 2, 0, 9, 83.70),
(30, 'Thiago Silva', 1, 'Brazil', 'Defender', 29, 3, 6, 540, 1, 0, 3, 0, 3, 88.10),
(31, 'Fred', 1, 'Brazil', 'Forward', 30, 9, 6, 441, 1, 0, 0, 0, 6, 72.60),
(32, 'Julio Cesar', 1, 'Brazil', 'Goalkeeper', 34, 1, 5, 481, 0, 0, 0, 0, 0, 73.40),
(33, 'Hulk', 1, 'Brazil', 'Forward', 27, 7, 7, 600, 1, 1, 1, 0, 17, 73.90),
(34, 'Marcelo', 1, 'Brazil', 'Defender', 26, 6, 7, 660, 0, 1, 1, 0, 5, 84.50),
(35, 'Luis Suarez', 14, 'Uruguay', 'Forward', 27, 9, 3, 270, 2, 0, 0, 1, 9, 76.70),
(36, 'Diego Godin', 14, 'Uruguay', 'Defender', 28, 3, 4, 360, 1, 0, 1, 0, 4, 82.90),
(37, 'Edinson Cavani', 14, 'Uruguay', 'Forward', 27, 21, 4, 352, 1, 0, 0, 0, 10, 74.30),
(38, 'Alexis Sanchez', 6, 'Chile', 'Forward', 25, 7, 4, 354, 2, 0, 0, 0, 14, 79.50),
(39, 'Arturo Vidal', 6, 'Chile', 'Midfielder', 27, 8, 4, 331, 1, 0, 2, 0, 9, 83.20),
(40, 'Eduardo Vargas', 6, 'Chile', 'Forward', 24, 16, 4, 215, 2, 0, 0, 0, 8, 73.80),
(41, 'Charles Aranguiz', 6, 'Chile', 'Midfielder', 25, 20, 4, 346, 0, 1, 1, 0, 6, 84.60),
(42, 'Diego Costa', 7, 'Spain', 'Forward', 25, 19, 3, 203, 0, 0, 0, 0, 7, 68.90),
(43, 'Andres Iniesta', 7, 'Spain', 'Midfielder', 30, 6, 3, 270, 0, 1, 0, 0, 5, 88.90),
(44, 'David Silva', 7, 'Spain', 'Midfielder', 28, 21, 3, 240, 0, 0, 0, 0, 4, 86.70),
(45, 'Xabi Alonso', 7, 'Spain', 'Midfielder', 32, 14, 3, 270, 0, 0, 1, 0, 3, 90.10),
(46, 'Iker Casillas', 7, 'Spain', 'Goalkeeper', 33, 1, 3, 270, 0, 0, 0, 0, 0, 72.00),
(47, 'Tim Howard', 26, 'United States', 'Goalkeeper', 35, 1, 4, 390, 0, 0, 0, 0, 0, 69.30),
(48, 'Clint Dempsey', 26, 'United States', 'Forward', 31, 8, 4, 360, 2, 0, 0, 0, 10, 76.50),
(49, 'Jozy Altidore', 26, 'United States', 'Forward', 24, 17, 2, 53, 0, 0, 0, 0, 1, 70.20),
(50, 'Michael Bradley', 26, 'United States', 'Midfielder', 26, 4, 4, 360, 0, 1, 0, 0, 6, 81.40),
(51, 'Cristiano Ronaldo', 27, 'Portugal', 'Forward', 29, 7, 3, 270, 1, 1, 0, 0, 11, 80.30),
(52, 'Nani', 27, 'Portugal', 'Forward', 27, 17, 3, 257, 1, 1, 0, 0, 7, 77.90),
(53, 'Pepe', 27, 'Portugal', 'Defender', 31, 3, 2, 180, 0, 0, 1, 1, 2, 81.50),
(54, 'Wayne Rooney', 16, 'England', 'Forward', 28, 9, 3, 270, 1, 1, 0, 0, 6, 79.40),
(55, 'Daniel Sturridge', 16, 'England', 'Forward', 24, 21, 3, 199, 1, 0, 0, 0, 7, 74.60),
(56, 'Steven Gerrard', 16, 'England', 'Midfielder', 34, 4, 3, 270, 0, 0, 0, 0, 3, 84.20),
(57, 'Mario Balotelli', 15, 'Italy', 'Forward', 23, 9, 3, 231, 1, 0, 1, 0, 8, 72.10),
(58, 'Andrea Pirlo', 15, 'Italy', 'Midfielder', 35, 21, 3, 270, 0, 1, 0, 0, 4, 89.60),
(59, 'Gianluigi Buffon', 15, 'Italy', 'Goalkeeper', 36, 1, 2, 180, 0, 0, 0, 0, 0, 75.00),
(60, 'Juan Cuadrado', 9, 'Colombia', 'Midfielder', 26, 16, 5, 442, 1, 4, 0, 0, 9, 80.70),
(61, 'Teofilo Gutierrez', 9, 'Colombia', 'Forward', 29, 7, 4, 246, 2, 0, 0, 0, 7, 75.30),
(62, 'David Ospina', 9, 'Colombia', 'Goalkeeper', 25, 1, 5, 480, 0, 0, 0, 0, 0, 74.80),
(63, 'Mario Yepes', 9, 'Colombia', 'Defender', 38, 3, 5, 480, 1, 0, 1, 0, 3, 83.90),
(64, 'Vincent Kompany', 29, 'Belgium', 'Defender', 28, 4, 5, 480, 0, 0, 1, 0, 2, 85.40),
(65, 'Eden Hazard', 29, 'Belgium', 'Forward', 23, 10, 5, 450, 0, 1, 1, 0, 10, 80.90),
(66, 'Kevin De Bruyne', 29, 'Belgium', 'Midfielder', 22, 7, 5, 391, 0, 0, 0, 0, 7, 82.30),
(67, 'Romelu Lukaku', 29, 'Belgium', 'Forward', 21, 9, 5, 257, 0, 1, 0, 0, 10, 71.50),
(68, 'Divock Origi', 29, 'Belgium', 'Forward', 19, 17, 5, 163, 1, 1, 0, 0, 4, 73.20),
(69, 'Thibaut Courtois', 29, 'Belgium', 'Goalkeeper', 22, 1, 5, 480, 0, 0, 0, 0, 0, 70.40),
(70, 'Joel Campbell', 13, 'Costa Rica', 'Forward', 21, 12, 5, 406, 1, 0, 0, 0, 7, 74.70),
(71, 'Keylor Navas', 13, 'Costa Rica', 'Goalkeeper', 27, 1, 5, 480, 0, 0, 0, 0, 0, 71.90),
(72, 'Giancarlo Gonzalez', 13, 'Costa Rica', 'Defender', 26, 3, 5, 480, 0, 0, 2, 0, 2, 80.50),
(73, 'Kolo Toure', 11, 'Ivory Coast', 'Defender', 33, 20, 3, 270, 0, 0, 1, 0, 2, 81.80),
(74, 'Yaya Toure', 11, 'Ivory Coast', 'Midfielder', 31, 8, 3, 264, 0, 0, 1, 0, 6, 83.40),
(75, 'Didier Drogba', 11, 'Ivory Coast', 'Forward', 36, 11, 2, 89, 0, 0, 0, 0, 3, 72.00),
(76, 'Wilfried Bony', 11, 'Ivory Coast', 'Forward', 25, 9, 3, 231, 1, 0, 0, 0, 6, 73.60),
(77, 'Asamoah Gyan', 28, 'Ghana', 'Forward', 28, 3, 3, 270, 1, 0, 0, 0, 8, 75.10),
(78, 'Andre Ayew', 28, 'Ghana', 'Forward', 24, 10, 3, 270, 2, 1, 0, 0, 7, 76.80),
(79, 'John Boye', 28, 'Ghana', 'Defender', 26, 21, 3, 270, 0, 0, 1, 0, 1, 79.30),
(80, 'Keisuke Honda', 12, 'Japan', 'Midfielder', 27, 4, 3, 270, 1, 1, 1, 0, 6, 80.20),
(81, 'Shinji Kagawa', 12, 'Japan', 'Midfielder', 25, 10, 3, 180, 0, 0, 0, 0, 4, 82.60),
(82, 'Yasuhito Endo', 12, 'Japan', 'Midfielder', 34, 7, 3, 229, 0, 0, 0, 0, 2, 86.70),
(83, 'Vincent Aboubakar', 4, 'Cameroon', 'Forward', 22, 10, 3, 270, 0, 0, 1, 0, 5, 72.40),
(84, 'Samuel Eto\'o', 4, 'Cameroon', 'Forward', 33, 15, 3, 241, 0, 0, 0, 0, 6, 74.00),
(85, 'Stephane Mbia', 4, 'Cameroon', 'Defender', 28, 6, 3, 270, 0, 0, 1, 1, 1, 76.90),
(86, 'Guillermo Ochoa', 2, 'Mexico', 'Goalkeeper', 28, 13, 4, 390, 0, 0, 0, 0, 0, 73.50),
(87, 'Javier Hernandez', 2, 'Mexico', 'Forward', 26, 14, 3, 140, 1, 0, 0, 0, 6, 75.70),
(88, 'Giovani dos Santos', 2, 'Mexico', 'Forward', 25, 10, 4, 315, 1, 1, 0, 0, 8, 78.10),
(89, 'Rafael Marquez', 2, 'Mexico', 'Defender', 35, 4, 4, 390, 0, 0, 0, 0, 3, 82.70),
(90, 'Mario Mandzukic', 3, 'Croatia', 'Forward', 28, 17, 3, 270, 1, 0, 1, 0, 7, 74.50),
(91, 'Ivan Rakitic', 3, 'Croatia', 'Midfielder', 26, 7, 3, 270, 1, 0, 0, 0, 6, 85.30),
(92, 'Luka Modric', 3, 'Croatia', 'Midfielder', 28, 10, 3, 270, 0, 1, 0, 0, 7, 88.00),
(93, 'Vedad Ibisevic', 23, 'Bosnia and Herzegovina', 'Forward', 29, 9, 3, 270, 1, 0, 0, 0, 6, 76.20),
(94, 'Edin Dzeko', 23, 'Bosnia and Herzegovina', 'Forward', 28, 17, 3, 241, 1, 0, 0, 0, 7, 77.40),
(95, 'Reza Ghoochannejhad', 24, 'Iran', 'Forward', 26, 7, 3, 180, 1, 0, 0, 0, 4, 73.10),
(96, 'Ashkan Dejagah', 24, 'Iran', 'Forward', 27, 11, 3, 201, 0, 0, 0, 0, 3, 72.80),
(97, 'John Obi Mikel', 22, 'Nigeria', 'Midfielder', 27, 10, 4, 360, 0, 0, 0, 0, 3, 82.00),
(98, 'Ahmed Musa', 22, 'Nigeria', 'Forward', 21, 7, 4, 313, 2, 0, 0, 0, 7, 73.90),
(99, 'Vincent Enyeama', 22, 'Nigeria', 'Goalkeeper', 31, 1, 4, 390, 0, 0, 0, 0, 0, 70.60),
(100, 'Islam Slimani', 30, 'Algeria', 'Forward', 25, 11, 4, 318, 2, 0, 0, 0, 8, 71.30),
(101, 'Yacine Brahimi', 30, 'Algeria', 'Midfielder', 24, 10, 4, 265, 1, 1, 0, 0, 6, 79.60),
(102, 'Rais M\'Bolhi', 30, 'Algeria', 'Goalkeeper', 27, 1, 4, 420, 0, 0, 0, 0, 0, 69.10),
(103, 'Alexander Kerzhakov', 31, 'Russia', 'Forward', 31, 17, 3, 180, 1, 0, 0, 0, 5, 72.50),
(104, 'Igor Akinfeev', 31, 'Russia', 'Goalkeeper', 28, 1, 3, 270, 0, 0, 0, 0, 0, 74.00),
(105, 'Son Heung-min', 32, 'South Korea', 'Forward', 21, 7, 3, 270, 1, 0, 0, 0, 6, 77.70),
(106, 'Koo Ja-cheol', 32, 'South Korea', 'Midfielder', 25, 17, 3, 225, 1, 0, 0, 0, 4, 79.90),
(107, 'Tim Cahill', 8, 'Australia', 'Forward', 34, 4, 3, 214, 1, 0, 0, 0, 5, 71.60),
(108, 'Mile Jedinak', 8, 'Australia', 'Midfielder', 29, 15, 3, 270, 1, 0, 1, 0, 4, 78.30),
(109, 'Jefferson Montero', 19, 'Ecuador', 'Forward', 24, 7, 3, 238, 0, 1, 0, 0, 6, 74.90),
(110, 'Antonio Valencia', 19, 'Ecuador', 'Midfielder', 28, 8, 3, 254, 0, 0, 0, 0, 4, 80.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
