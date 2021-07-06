-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 22, 2021 at 06:14 PM
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `JEE_Advanced_Portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `roll` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `marks` int(3) NOT NULL,
  `rank` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`roll`, `name`, `password`, `marks`, `rank`) VALUES
(21000001, 'Adhiraj Singh', 'adhi@12', 250, 1500),
(21000002, 'Shreya Ghosh', 'ghosherya@21', 200, 1980),
(21000010, 'Aman Rajawat', 'aman@2021', 180, 2490),
(21001023, 'Mohak Singh ', 'mohaksingh@12', 380, 1),
(21000045, 'Arshi Solanki', 'arso@22', 300, 24),
(21003092, 'Ayush Tripathi', 'ayush#12', 220, 1547),
(21003287, 'Suraj Goel', 'suraj@1234', 248, 1023),
(21034872, 'Ashish Sharma', 'ashish@578', 128, 6897),
(21000423, 'Gauri Khan', 'gaur#63524$', 148, 4378),
(21003847, 'Lakshya Sharma', 'laksh@2435', 117, 8647),
(21043765, 'Hema Naik', '1@hema', 143, 4578);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
