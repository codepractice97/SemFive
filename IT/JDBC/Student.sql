-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 01, 2019 at 03:36 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Student`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `NumberOfRows` (OUT `A` INT)  SELECT count(`Roll Num`) into A from Student$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Result`
--

CREATE TABLE `Result` (
  `Roll Num` int(11) NOT NULL,
  `SP` float NOT NULL,
  `IT` float NOT NULL,
  `TOC` float NOT NULL,
  `MICROPROCESSOR` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Result`
--

INSERT INTO `Result` (`Roll Num`, `SP`, `IT`, `TOC`, `MICROPROCESSOR`) VALUES
(1, 86, 75, 80, 90),
(2, 76, 79, 82, 70),
(3, 93, 75, 65, 48),
(4, 86, 87, 89, 65),
(5, 76, 97, 78, 79),
(6, 93, 79, 69, 97);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `Name` varchar(50) NOT NULL,
  `Roll Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`Name`, `Roll Num`) VALUES
('Mukul', 1),
('Ankish', 2),
('Tanishq', 3),
('Parth', 4),
('Nishant', 5),
('Manavv', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Result`
--
ALTER TABLE `Result`
  ADD PRIMARY KEY (`Roll Num`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`Roll Num`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `ROLL_NO_FOREIGN_KEY` FOREIGN KEY (`Roll Num`) REFERENCES `Result` (`Roll Num`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
