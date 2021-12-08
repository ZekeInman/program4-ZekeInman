-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 07:02 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p4_zeke_inman`
--
CREATE DATABASE IF NOT EXISTS `p4_zeke_inman` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `p4_zeke_inman`;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `employeeID` int(5) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) NOT NULL,
  `birthDate` date NOT NULL,
  `hireDate` date DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  `rate` int(10) DEFAULT NULL,
  `avgWeeklyHours` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`employeeID`, `firstName`, `middleName`, `lastName`, `birthDate`, `hireDate`, `salary`, `rate`, `avgWeeklyHours`) VALUES
(65, 'Aaron', 'A', 'Aaronson', '1955-05-05', '1991-02-07', 50000, NULL, NULL),
(66, 'Erin', 'E', 'Erinson', '1963-06-03', '1991-04-15', 52000, NULL, NULL),
(734, 'Roy', NULL, 'Batty', '1962-06-02', '2016-01-09', NULL, NULL, NULL),
(1313, 'Beatrix', NULL, 'Kiddo', '1982-09-22', '2003-09-10', 44444, NULL, NULL),
(1985, 'Marty', NULL, 'McFly', '1950-06-01', '1885-01-01', NULL, 45, 33),
(2000, 'Paul', 'Muad\'Dib', 'Atreides', '1963-04-18', '1984-05-05', 123000, NULL, NULL),
(2001, 'Molly', NULL, 'Millions', '1956-03-19', '1995-02-28', NULL, 50, 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `employeeID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100003;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
