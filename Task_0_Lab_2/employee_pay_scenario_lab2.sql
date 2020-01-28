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
-- Database: `employee_pay_scenario_lab2`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'GIS'),
(2, 'HRM'),
(3, 'ENG'),
(4, 'MKT'),
(5, 'ACC'),
(6, 'MNG'),
(7, 'ADM');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `dept_id`) VALUES
(1, 'Abdur Rahim', 4),
(2, 'Riyad Morshed', 3),
(3, 'Sabbir Nahid', 6),
(4, 'Muhammad Nur', 1),
(5, 'Siddique Kamal', 1),
(6, 'Anwarullah', 2),
(7, 'Ataul Gani', 4),
(8, 'Fazle Rabbi', 1),
(9, 'Nitu Roy', 3),
(10, 'Mehedi Hasan', 6),
(11, 'Taposh Paul', 3),
(12, 'Tashfique Rahman', 7),
(13, 'Sakib Bin Rafique', 2),
(14, 'Abid Khan', 5);

-- --------------------------------------------------------

--
-- Table structure for table `paydetails`
--

CREATE TABLE `paydetails` (
  `emp_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `basic` int(11) NOT NULL,
  `DOJ` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paydetails`
--

INSERT INTO `paydetails` (`emp_id`, `dept_id`, `basic`, `DOJ`) VALUES
(1, 4, 8000, '1999-04-02'),
(2, 3, 6000, '2006-04-02'),
(3, 6, 12000, '2002-04-02'),
(4, 1, 5500, '2018-04-02'),
(5, 1, 5500, '2018-06-23'),
(6, 2, 6000, '2017-08-12'),
(7, 4, 6500, '2008-01-01'),
(8, 1, 5000, '2019-01-02'),
(9, 3, 5500, '2010-02-15'),
(10, 6, 8000, '2010-06-01'),
(11, 3, 5000, '2018-01-05'),
(12, 7, 15000, '2004-01-01'),
(13, 2, 6500, '2015-05-01'),
(14, 5, 7000, '2004-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `emp_id` int(11) NOT NULL,
  `pay_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`emp_id`, `pay_date`) VALUES
(1, '2019-06-03'),
(2, '2019-06-03'),
(3, '2019-06-03'),
(4, '2019-06-03'),
(5, '2019-06-03'),
(6, '2019-06-03'),
(7, '2019-06-03'),
(8, '2019-06-03'),
(9, '2019-06-03'),
(10, '2019-06-03'),
(11, '2019-06-03'),
(12, '2019-06-03'),
(13, '2019-06-03'),
(14, '2019-06-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `paydetails`
--
ALTER TABLE `paydetails`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
