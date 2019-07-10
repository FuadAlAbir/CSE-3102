-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2019 at 02:32 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_lab3`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `emp_id` char(6) NOT NULL,
  `street_no` tinyint(4) DEFAULT NULL,
  `street_name` varchar(20) NOT NULL,
  `city` char(8) NOT NULL,
  `zip_code` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`emp_id`, `street_no`, `street_name`, `city`, `zip_code`) VALUES
('120111', 10, 'This street', 'Googong', '7234'),
('120112', 42, 'That street', 'Googong', '5532'),
('120113', 13, 'The Other Street', 'Googong', '1234'),
('120211', 15, 'Eve St.', 'Canberra', '3472'),
('120212', 24, 'Adam St.', 'Canberra', '5302'),
('120213', 31, 'Lone St.', 'Canberra', '1454'),
('120311', 51, 'Frog St.', 'Sydney', '7271'),
('120312', 49, 'Elephant St.', 'Sydney', '5099'),
('120313', 13, 'Tiger St.', 'Sydney', '1225'),
('120314', 54, 'Lion St.', 'Sydney', '3321'),
('120315', 66, 'Printer St.', 'Sydney', '7733'),
('120411', 23, 'New St.', 'Darwin', '3552'),
('120412', 55, 'Old St.', 'Darwin', '5882'),
('120413', 18, 'Nill St.', 'Darwin', '1994');

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `dept_id` char(2) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `dept_location` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`, `dept_location`) VALUES
('01', 'Engineering', 'Googong'),
('02', 'Foreman', 'Canberra'),
('03', 'Labor', 'Sydney'),
('04', 'R&D', 'Darwin');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` char(6) NOT NULL,
  `emp_name` varchar(30) NOT NULL,
  `dept_id` char(2) NOT NULL,
  `type_of_work` char(1) NOT NULL,
  `hourly_rate` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `dept_id`, `type_of_work`, `hourly_rate`) VALUES
('120111', 'Zaved Mabrur', '01', 'F', NULL),
('120112', 'Barik Sayed', '01', 'P', 35),
('120113', 'Anas Mahmud', '01', 'F', NULL),
('120211', 'Abdul Kader', '02', 'F', NULL),
('120212', 'Mazid Anwar', '02', 'F', NULL),
('120213', 'Sazid Kabir', '02', 'F', NULL),
('120311', 'Mir Ziyad', '03', 'P', 25),
('120312', 'Nur Muhammad', '03', 'P', 25),
('120313', 'Pintu Shiekh', '03', 'F', NULL),
('120314', 'Kalim Uddin', '03', 'F', NULL),
('120315', 'Rafsan Zaman', '03', 'F', NULL),
('120411', 'Dr. Musharraf', '04', 'F', NULL),
('120412', 'Dr. Sayed', '04', 'P', 50),
('120413', 'Dr. Mazed', '04', 'P', 50);

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `CK_hourly_rate` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN IF NEW.type_of_work = 'P' AND (NEW.hourly_rate < 25 OR NEW.hourly_rate > 60)
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID hourly_rate: must be between 25 USD to 60 USD'; END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `CK_type_of_work` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN IF NEW.type_of_work <> 'P' AND NEW.type_of_work <> 'F' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID type_of_work: must be F for Full-time and P for Part-time work'; END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ft_pt_work`
--

CREATE TABLE `ft_pt_work` (
  `project_id` char(4) NOT NULL,
  `emp_id` char(6) NOT NULL,
  `dept_id` char(2) NOT NULL,
  `num_of_hours` tinyint(4) DEFAULT NULL,
  `works_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ft_pt_work`
--

INSERT INTO `ft_pt_work` (`project_id`, `emp_id`, `dept_id`, `num_of_hours`, `works_date`) VALUES
('1201', '120111', '01', 8, '2012-06-01'),
('1201', '120111', '01', 8, '2012-06-02'),
('1201', '120111', '01', 8, '2012-06-03'),
('1201', '120111', '01', 8, '2012-06-04'),
('1201', '120111', '01', 8, '2012-06-05'),
('1201', '120112', '01', 8, '2012-06-01'),
('1201', '120112', '01', 8, '2012-06-03'),
('1201', '120112', '01', 8, '2012-06-05'),
('1202', '120111', '01', 8, '2012-06-15'),
('1202', '120111', '01', 8, '2012-06-16'),
('1202', '120111', '01', 8, '2012-06-17'),
('1201', '120311', '03', 8, '2012-06-01'),
('1201', '120311', '03', 8, '2012-06-02'),
('1201', '120311', '03', 8, '2012-06-03'),
('1201', '120311', '03', 8, '2012-06-04'),
('1201', '120312', '03', 6, '2012-06-01'),
('1201', '120312', '03', 4, '2012-06-02'),
('1201', '120312', '03', 6, '2012-06-04'),
('1201', '120313', '03', 8, '2012-06-02'),
('1201', '120313', '03', 8, '2012-06-03'),
('1202', '120313', '03', 8, '2012-06-01'),
('1202', '120313', '03', 8, '2012-06-04'),
('1202', '120211', '02', 8, '2012-06-01'),
('1202', '120211', '02', 8, '2012-06-02'),
('1202', '120211', '02', 8, '2012-06-03'),
('1202', '120211', '02', 8, '2012-06-04'),
('1201', '120213', '02', 8, '2012-06-02'),
('1201', '120213', '02', 8, '2012-06-03'),
('1201', '120213', '02', 8, '2012-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` char(4) NOT NULL,
  `project_name` varchar(30) NOT NULL,
  `project_location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `project_location`) VALUES
('1201', 'Googong Subdivision', 'Googong'),
('1202', 'Burton Highway', 'Burton Canberra');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `emp_id` char(6) NOT NULL,
  `basic` int(11) DEFAULT NULL,
  `salary_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`emp_id`, `basic`, `salary_date`) VALUES
('120111', 6000, '2012-07-03'),
('120111', 6500, '2012-08-03'),
('120111', 5000, '2012-03-03'),
('120312', 400, '2012-07-03'),
('120112', 840, '2012-07-03'),
('120311', 800, '2012-07-05'),
('120412', NULL, '2012-07-02'),
('120413', NULL, '2012-07-03'),
('120113', 5000, '2012-07-03'),
('120211', 5500, '2012-07-03'),
('120212', 6000, '2012-07-03'),
('120213', 7000, '2012-07-05'),
('120313', 5000, '2012-07-03'),
('120314', 5000, '2012-07-03'),
('120315', 5500, '2012-07-04'),
('120411', 8000, '2012-07-10');

--
-- Triggers `salary`
--
DELIMITER $$
CREATE TRIGGER `SET_basic_ft` BEFORE INSERT ON `salary` FOR EACH ROW BEGIN IF NEW.basic < 5000 AND (SELECT COUNT(*) FROM employee WHERE employee.emp_id = NEW.emp_id AND employee.type_of_work = 'F') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID basic for full-time employee; must be greater than 5000 USD'; END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `SET_basic_pt` BEFORE INSERT ON `salary` FOR EACH ROW BEGIN IF (SELECT COUNT(*) FROM employee WHERE NEW.emp_id = employee.emp_id AND employee.type_of_work = 'P') THEN SET NEW.basic = (SELECT SUM(num_of_hours) FROM ft_pt_work WHERE emp_id = NEW.emp_id) * (SELECT hourly_rate FROM employee WHERE NEW.emp_id = emp_id); END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `test_view`
-- (See below for the actual view)
--
CREATE TABLE `test_view` (
`emp_name` varchar(30)
,`dept_name` varchar(20)
,`type_of_work` char(1)
,`basic` int(11)
,`allowance` decimal(13,2)
,`deduction` decimal(14,2)
,`salary` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Structure for view `test_view`
--
DROP TABLE IF EXISTS `test_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`fuad`@`localhost` SQL SECURITY DEFINER VIEW `test_view`  AS  select distinct `employee`.`emp_name` AS `emp_name`,`dept`.`dept_name` AS `dept_name`,`employee`.`type_of_work` AS `type_of_work`,`salary`.`basic` AS `basic`,(`salary`.`basic` * 0.45) AS `allowance`,(`salary`.`basic` * (0.09 + 0.15)) AS `deduction`,(`salary`.`basic` * ((1 + 0.45) - (0.09 + 0.15))) AS `salary` from (((`employee` join `dept`) join `ft_pt_work`) join `salary`) where ((`employee`.`dept_id` = `dept`.`dept_id`) and (`employee`.`emp_id` = `salary`.`emp_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD KEY `FK_addressEmployee` (`emp_id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `FK_employeeDept` (`dept_id`);

--
-- Indexes for table `ft_pt_work`
--
ALTER TABLE `ft_pt_work`
  ADD KEY `FK_ft_pt_workProject_id` (`project_id`),
  ADD KEY `FK_ft_pt_workEmployee` (`emp_id`),
  ADD KEY `FK_ft_pt_workDept` (`dept_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD KEY `FK_salaryEmployee` (`emp_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_addressEmployee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_employeeDept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`);

--
-- Constraints for table `ft_pt_work`
--
ALTER TABLE `ft_pt_work`
  ADD CONSTRAINT `FK_ft_pt_workDept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`),
  ADD CONSTRAINT `FK_ft_pt_workEmployee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `FK_ft_pt_workProject_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FK_salaryEmployee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
