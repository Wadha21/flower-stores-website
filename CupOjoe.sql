-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2022 at 02:33 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CupOjoe`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `ID` int(9) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`ID`, `Username`, `Password`, `email`) VALUES
(2, 'bdoor', '323', 'admin@gmail.com'),
(3, 'noura', '34', 'admin@gmail.com'),
(4, 'ruba', '123', 'admin@gmail.com'),
(123, 'leena', '123', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `ID` int(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`ID`, `name`, `description`) VALUES
(1, 'Near ', 'view all near cafes '),
(2, 'SpecialOccasion', 'for all your Occasions .. Valentine days , birthdays , mothers day eat .. '),
(3, 'Meeting', 'we suggest a cafe with meeting rooms and perfect place for meeting  .. \r\n'),
(4, 'studying', 'we got for you a perfect cafe to study at ! '),
(5, 'Relaxing', 'we suggest the most relaxing cafes in Riyadh '),
(6, 'with kids ', 'suitable cafes with kids ');

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `Name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `categoryID` int(9) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `Logoo` varchar(255) NOT NULL,
  `overall_rating` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Item`
--

INSERT INTO `Item` (`Name`, `description`, `categoryID`, `ID`, `Logoo`, `overall_rating`) VALUES
('Starbucks', 'Meeting rooms\r\nmusic \r\namazing atmosphere :) \r\n', 3, 43, 'S.png', '1.7'),
('Half million ', 'Cozy / Relaxing \r\nstudying \r\nmeeting rooms \r\n\r\n', 4, 45, 'HalfMillion.png', '1.8'),
('Jolt', 'good place to study at \r\nmusic /calm \r\naccept credit card.\r\n', 6, 47, 'j.png', '3.4'),
('Dunkin Donuts ', 'Cozy 🌈\r\nHas WI-IF\r\nMusic ', 5, 48, 'DD.png', '3.9');

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `ID` int(9) NOT NULL,
  `item_id` int(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `body` text NOT NULL,
  `rating` decimal(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`ID`, `item_id`, `name`, `body`, `rating`) VALUES
(1, 48, 'Norah ', 'nice :)', '3.1'),
(2, 45, 'leena', 'amazing', '4.0'),
(3, 47, 'Rema', 'you should try the latte !', '5.0'),
(4, 48, 'lama', 'Perfect ☺︎', '4.7'),
(5, 47, 'lama', 'good atmosphere ', '3.1'),
(9, 43, 'Layan', 'جميل جدا', '3.5'),
(10, 43, 'Sarah', 'I will come again ! ', '4.8'),
(11, 45, 'Samar ', 'latte is the BEST !!! ', '5.0');

--
-- Triggers `Review`
--
DELIMITER $$
CREATE TRIGGER `review_ins` AFTER INSERT ON `Review` FOR EACH ROW UPDATE Item SET overall_rating = overall_rating + NEW.rating /5
  WHERE ID = NEW.item_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `review_upd` AFTER UPDATE ON `Review` FOR EACH ROW UPDATE Item SET overall_rating = overall_rating - OLD.rating + NEW.rating/5
  WHERE ID = NEW.item_id
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Item`
--
ALTER TABLE `Item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `Review`
--
ALTER TABLE `Review`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `Category` (`ID`);

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Item` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
