-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2019 at 05:47 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Ayon_neub', 'admin@123', '2019-07-15 16:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_course`
--

CREATE TABLE IF NOT EXISTS `assigned_course` (
`id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigned_course`
--

INSERT INTO `assigned_course` (`id`, `course_id`, `user_id`, `Status`) VALUES
(2, 1, 2, 0),
(5, 1, 2, 1),
(6, 3, 3, 1),
(7, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_taken`
--

CREATE TABLE IF NOT EXISTS `course_taken` (
`id` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `attendance` double NOT NULL,
  `class_test` double NOT NULL,
  `assignment` double NOT NULL,
  `mid_term` double NOT NULL,
  `final` double NOT NULL,
  `total` double NOT NULL,
  `gpa` double NOT NULL,
  `grade` varchar(11) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_taken`
--

INSERT INTO `course_taken` (`id`, `SubjectId`, `StudentId`, `UserId`, `attendance`, `class_test`, `assignment`, `mid_term`, `final`, `total`, `gpa`, `grade`, `Status`) VALUES
(8, 1, 5, 2, 3, 2, 1, 3, 44, 53, 0, '', 1),
(9, 1, 6, 2, 3, 4, 5, 65, 23, 100, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE IF NOT EXISTS `tblresult` (
`id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `grade` varchar(5) NOT NULL,
  `gpa` double NOT NULL,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `SubjectId`, `marks`, `grade`, `gpa`, `PostingDate`, `UpdationDate`) VALUES
(0, 5, 1, 45, 'D', 0, '2019-08-15 05:34:05', NULL),
(6, 5, 1, 40, 'D', 0, '2019-07-31 05:02:43', NULL),
(12, 5, 1, 56, 'B-', 0, '2019-08-23 15:42:11', NULL),
(13, 6, 1, 90, 'A+', 0, '2019-08-23 15:44:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE IF NOT EXISTS `tblstudents` (
`StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) NOT NULL,
  `RollId` varchar(100) NOT NULL,
  `session` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `StudentEmail` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `session`, `year`, `StudentEmail`, `Gender`, `DOB`, `RegDate`, `UpdationDate`, `Status`) VALUES
(5, 'Fabiha Rob Chowdhury', '1603', 'Spring', 17, 'ayondey2@gmail.com', 'Male', '1996-12-08', '2019-07-30 14:54:49', '2019-07-30 15:51:37', 1),
(6, 'Ayon Dey', '15', 'Spring', 16, 'ayon@gmail.com', 'Male', '1996-02-02', '2019-07-30 16:51:42', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE IF NOT EXISTS `tblsubjects` (
`id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) NOT NULL,
  `Creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Computer Architectur', 'CSE-331', '2019-07-22 18:47:12', '2019-07-30 15:14:03'),
(3, 'Artificial Intelligence', 'CSE-111', '2019-07-30 15:13:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `teacher_name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_number` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `teacher_name`, `user_name`, `password`, `email`, `mobile_number`, `designation`, `DOB`, `Gender`, `RegDate`, `UpdationDate`, `Status`) VALUES
(2, 'Nafisa Nowshin Piya', 'Nafisa_SUST', 'user@123', 'nafisa@gmail.com', '01710332211', 'Lecturer', '1995-01-09', 'Female', '2019-07-26 18:58:47', '0000-00-00 00:00:00', 1),
(3, 'Mir Lutfur Rahman', 'mlr_NEUB', 'user2@123', 'mir@gmail.com', '012313213', 'lecturer', '275760-02-02', 'Male', '2019-07-26 19:00:04', '0000-00-00 00:00:00', 1),
(4, 'Buddho Chandra Banik', 'Buddo_NEUB', 'admin', 'buddho@gmail.com', '014455666', 'Lecturer', '1995-05-05', 'Male', '2019-07-30 15:37:57', '0000-00-00 00:00:00', 1),
(5, 'Noushad Sojib', 'Noushad_SUST', 'admin@123', 'noushad.sust@gmail.com', '01710333333', 'Lecturer', '1990-03-04', 'Male', '2019-08-21 15:22:41', '0000-00-00 00:00:00', 1),
(6, 'Ayon Dey', 'Ayon_neub', 'admin', 'ayon.cse.neub@gmail.com', '01710329076', 'Student', '19/08/1996', 'Male', '2019-08-22 03:05:24', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_course`
--
ALTER TABLE `assigned_course`
 ADD PRIMARY KEY (`id`), ADD KEY `ac_tbls_1` (`course_id`), ADD KEY `ac_u_2` (`user_id`);

--
-- Indexes for table `course_taken`
--
ALTER TABLE `course_taken`
 ADD PRIMARY KEY (`id`), ADD KEY `SubjectId` (`SubjectId`), ADD KEY `StudentId` (`StudentId`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
 ADD PRIMARY KEY (`id`), ADD KEY `StudentId` (`StudentId`), ADD KEY `SubjectId` (`SubjectId`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
 ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `assigned_course`
--
ALTER TABLE `assigned_course`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `course_taken`
--
ALTER TABLE `course_taken`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_course`
--
ALTER TABLE `assigned_course`
ADD CONSTRAINT `ac_tbls_1` FOREIGN KEY (`course_id`) REFERENCES `tblsubjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ac_u_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_taken`
--
ALTER TABLE `course_taken`
ADD CONSTRAINT `course_taken_ibfk_1` FOREIGN KEY (`SubjectId`) REFERENCES `tblsubjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `course_taken_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `tblstudents` (`StudentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblresult`
--
ALTER TABLE `tblresult`
ADD CONSTRAINT `tblresult_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `tblstudents` (`StudentId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `tblresult_ibfk_3` FOREIGN KEY (`SubjectId`) REFERENCES `tblsubjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
