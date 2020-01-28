-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2019 at 05:06 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_lab7`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `book_no` char(7) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`book_no`, `book_name`, `author`) VALUES
('', '', ''),
('1301001', 'Programming with C', 'Byron Gottfried'),
('1301002', 'Teach yourself C', 'Herbert Schildt'),
('1301003', 'Computer Networks', 'Andrew S. Tanenbaum'),
('1301004', 'Introduction to Algorithms', 'Thomas H. Cormen et al'),
('1301006', 'Database System Concepts', 'Avi Silberschatz et al'),
('1301007', 'Advanced Engineering Mathematics', 'H.K.Dash'),
('1301008', 'Advanced Engineering Physics', 'Albert Hysenburgh'),
('1301009', 'Computational Genomics', 'Rob Gallon'),
('1302002', 'Teach yourself C', 'Herbert Schildt'),
('1303006', 'Database System Concepts', 'Avi Silberschatz et al');

-- --------------------------------------------------------

--
-- Table structure for table `Iss_rec`
--

CREATE TABLE `Iss_rec` (
  `iss_no` int(11) NOT NULL,
  `iss_date` date NOT NULL,
  `mem_no` varchar(7) NOT NULL,
  `book_no` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Iss_rec`
--

INSERT INTO `Iss_rec` (`iss_no`, `iss_date`, `mem_no`, `book_no`) VALUES
(13001, '2013-01-01', 'M000001', '1301002'),
(13002, '2013-01-01', 'M000002', '1301001'),
(13003, '2019-09-15', 'M000006', '1301009'),
(13004, '2013-01-02', 'M000003', '1301004'),
(13006, '2013-01-03', 'M000002', '1302002'),
(13010, '2019-09-16', 'M000002', '1301007'),
(13011, '2019-09-16', 'M000006', '1301008');

--
-- Triggers `Iss_rec`
--
DELIMITER $$
CREATE TRIGGER `SET_book_limit` BEFORE INSERT ON `Iss_rec` FOR EACH ROW BEGIN IF (SELECT COUNT(*) FROM Iss_rec WHERE mem_no = New.mem_no) >= 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BOOK LIMIT EXCEDED - ISSUE NOT RECORDED: Highest # of books can be issued against a member is 3.';
END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `SET_cant_issue_issuedBook` BEFORE INSERT ON `Iss_rec` FOR EACH ROW BEGIN IF (SELECT COUNT(*) FROM Iss_rec WHERE book_no = New.book_no AND mem_no <> New.mem_no) = 1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UNAVAILABLE BOOK - This book is already issued, currently not available'; END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `SET_cant_issue_issuedBook_thisStudent` BEFORE INSERT ON `Iss_rec` FOR EACH ROW BEGIN IF (SELECT COUNT(*) FROM Iss_rec WHERE book_no = New.book_no AND mem_no = New.mem_no) = 1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UNAVAILABLE BOOK - This book is already issued under this student's name'; END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `SET_current_date` BEFORE INSERT ON `Iss_rec` FOR EACH ROW SET New.iss_date = IFNULL(NEW.iss_date, CURDATE())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Membership`
--

CREATE TABLE `Membership` (
  `mem_no` char(7) NOT NULL,
  `stud_no` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Membership`
--

INSERT INTO `Membership` (`mem_no`, `stud_no`) VALUES
('M000001', 'C033002'),
('M000003', 'C035001'),
('M000002', 'C043005'),
('M000006', 'C060606');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `stud_no` char(7) NOT NULL,
  `stud_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`stud_no`, `stud_name`) VALUES
('C011010', 'Labid Karim'),
('C033002', 'Sakib Rashid'),
('C035001', 'Dabirul Islam'),
('C043005', 'Nafis Shiekh'),
('C060606', 'Ali Azgar');

--
-- Triggers `Student`
--
DELIMITER $$
CREATE TRIGGER `SET_studID_C` BEFORE INSERT ON `Student` FOR EACH ROW BEGIN IF LEFT(New.stud_no, 1) NOT LIKE 'C%' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID FORMAT - stud_id must starts with "C"';
END IF; END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`book_no`);

--
-- Indexes for table `Iss_rec`
--
ALTER TABLE `Iss_rec`
  ADD PRIMARY KEY (`iss_no`),
  ADD KEY `FK_issrecBook` (`book_no`),
  ADD KEY `FK_issrecMembership` (`mem_no`);

--
-- Indexes for table `Membership`
--
ALTER TABLE `Membership`
  ADD PRIMARY KEY (`mem_no`),
  ADD KEY `FK_membershipStudent` (`stud_no`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`stud_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Iss_rec`
--
ALTER TABLE `Iss_rec`
  ADD CONSTRAINT `FK_issrecBook` FOREIGN KEY (`book_no`) REFERENCES `Book` (`book_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issrecMembership` FOREIGN KEY (`mem_no`) REFERENCES `Membership` (`mem_no`) ON DELETE CASCADE;

--
-- Constraints for table `Membership`
--
ALTER TABLE `Membership`
  ADD CONSTRAINT `FK_membershipStudent` FOREIGN KEY (`stud_no`) REFERENCES `Student` (`stud_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
