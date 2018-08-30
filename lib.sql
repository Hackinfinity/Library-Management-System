-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2017 at 03:32 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lib`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_book` ()  NO SQL
select * from book$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_student` ()  NO SQL
select * from student$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `UserName` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Sec_Q` varchar(100) NOT NULL,
  `Answer` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`UserName`, `Name`, `Password`, `Sec_Q`, `Answer`) VALUES
('apb', 'anantha', '0', 'What is your language?', 'kannada'),
('anantha', 'ananthainnanje', '0', 'What is your mother\'s name?', 'mohini'),
('infinity', 'anantha', '0', 'What is your mother\'s name?', 'mother');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_ID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Edition` varchar(100) NOT NULL,
  `Publisher` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  `Pages` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_ID`, `Name`, `Edition`, `Publisher`, `Price`, `Pages`) VALUES
('86', 'atc', '4', 'shreekumar', '120', '200'),
('228', 'atc', '1', 'shreekumar', '200', '250'),
('236', 'dbms', '3', 'manjunath', '500', '300'),
('912', 'physics', '6', 'Bosco', '300', '450'),
('623', 'ceh', '2', 'ankith fadia', '250', '100'),
('328', 'computer', '3', 'anantha', '200', '200');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `Book_ID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Edition` varchar(100) NOT NULL,
  `Publisher` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  `Pages` varchar(100) NOT NULL,
  `Student_ID` varchar(100) NOT NULL,
  `SName` varchar(100) NOT NULL,
  `FName` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Branch` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Semester` varchar(100) NOT NULL,
  `issue_date` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `issue`
--
DELIMITER $$
CREATE TRIGGER `issued_books_details` BEFORE DELETE ON `issue` FOR EACH ROW insert INTO oldissuedata (BName,Book_ID,issued,SNAME,Student_ID) VALUES (old.Name,old.Book_ID,old.issue_date,old.SName,old.Student_ID)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `oldissuedata`
--

CREATE TABLE `oldissuedata` (
  `BName` varchar(100) NOT NULL,
  `Book_ID` varchar(100) NOT NULL,
  `SName` varchar(100) NOT NULL,
  `Student_ID` varchar(100) NOT NULL,
  `issued` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldissuedata`
--

INSERT INTO `oldissuedata` (`BName`, `Book_ID`, `SName`, `Student_ID`, `issued`) VALUES
('ceh', '623', 'Anantha Bhat', '666', 'Nov 26, 2017'),
('computer', '328', 'anu', '729', 'Nov 28, 2017');

-- --------------------------------------------------------

--
-- Table structure for table `returnb`
--

CREATE TABLE `returnb` (
  `Student_ID` varchar(100) NOT NULL,
  `S_Name` varchar(100) NOT NULL,
  `F_Name` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Branch` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Semester` varchar(100) NOT NULL,
  `Book_ID` varchar(100) NOT NULL,
  `B_Name` varchar(100) NOT NULL,
  `Edition` varchar(100) NOT NULL,
  `Publisher` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  `Pages` varchar(100) NOT NULL,
  `DOI` varchar(100) NOT NULL,
  `DOR` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnb`
--

INSERT INTO `returnb` (`Student_ID`, `S_Name`, `F_Name`, `Course`, `Branch`, `Year`, `Semester`, `Book_ID`, `B_Name`, `Edition`, `Publisher`, `Price`, `Pages`, `DOI`, `DOR`) VALUES
('729', 'anu', 'father', 'B Tech', 'cse', '3', '5', '228', 'atc', '1', 'shreekumar', '200', '250', 'Nov 18, 2017', 'Nov 20, 2017'),
('667', 'anu', 'father', 'B Tech', 'cse', '3', '5', '86', 'atc', '4', 'shreekumar', '120', '200', 'Nov 23, 2017', 'Nov 24, 2017'),
('729', 'anu', 'father', 'B Tech', 'cse', '3', '5', '86', 'atc', '4', 'shreekumar', '120', '200', 'Nov 23, 2017', 'Nov 24, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '228', 'atc', '1', 'shreekumar', '200', '250', 'Nov 22, 2017', 'Nov 24, 2017'),
('504', 'dhavan', 'fathername', 'B Tech', 'cse', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '86', 'atc', '4', 'shreekumar', '120', '200', 'Nov 26, 2017', 'Nov 26, 2017'),
('504', 'dhavan', 'fathername', 'B Tech', 'cse', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5', '623', 'ceh', '2', 'ankith fadia', '250', '100', 'Nov 26, 2017', 'Nov 26, 2017'),
('729', 'anu', 'father', 'B Tech', 'cse', '3', '5', '328', 'computer', '3', 'anantha', '200', '200', 'Nov 28, 2017', 'Nov 28, 2017');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Father_Name` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Branch` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Semester` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Father_Name`, `Course`, `Branch`, `Year`, `Semester`) VALUES
('729', 'anu', 'father', 'B Tech', 'cse', '3', '5'),
('667', 'jaya', 'gopal', 'BSc', 'pcmc', '3', '5'),
('666', 'Anantha Bhat', 'Father Name', 'B Tech', 'CSE', '3', '5'),
('504', 'dhavan', 'fathername', 'B Tech', 'cse', '3', '5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_ID`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`Book_ID`,`Student_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
