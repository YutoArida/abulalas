-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 12:41 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_abulalas`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assigned_teacher_section_history`
--

CREATE TABLE `tbl_assigned_teacher_section_history` (
  `haid` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `sid` int(50) NOT NULL,
  `sycode` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_assigned_teacher_section_history`
--

INSERT INTO `tbl_assigned_teacher_section_history` (`haid`, `uid`, `sid`, `sycode`) VALUES
(1, '19734567', 1, 8079);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_announcement`
--

CREATE TABLE `tbl_school_announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_enrollee_fresh`
--

CREATE TABLE `tbl_school_enrollee_fresh` (
  `eid` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `sycode` int(50) NOT NULL,
  `gid` int(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `average` int(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `street` varchar(250) NOT NULL,
  `region_text` varchar(250) NOT NULL,
  `province_text` varchar(250) NOT NULL,
  `city_text` varchar(250) NOT NULL,
  `barangay_text` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_enrollee_fresh`
--

INSERT INTO `tbl_school_enrollee_fresh` (`eid`, `uid`, `sycode`, `gid`, `email`, `fname`, `mname`, `lname`, `average`, `gender`, `street`, `region_text`, `province_text`, `city_text`, `barangay_text`, `status`, `date_created`) VALUES
(1, '202311297191', 8079, 1, 'sherwinnagal23@outlook.com', 'Sherwin', 'Dia', 'Nagal', 98, 'MALE', 'Sitio Lawlawan, Masagana Homes', 'Region III (Central Luzon)', 'Bulacan', 'Guiguinto', 'Santa Rita', 'APPROVED', '2023-11-29'),
(2, '202311298444', 8079, 1, 'delarezmazsarinna@outlook.ph', 'Zsarinna', 'Pangan', 'Dela Rezma', 98, 'FEMALE', 'Purok 3', 'Region III (Central Luzon)', 'Bulacan', 'Hagonoy', 'Abulalas', 'APPROVED', '2023-11-29'),
(3, '202311296837', 8079, 1, 'arnel.ayopofficial@outlook.com', 'Arnel', 'Amancio', 'Ayop', 98, 'MALE', 'Purok 3', 'Region III (Central Luzon)', 'Bulacan', 'Hagonoy', 'Iba', 'APPROVED', '2023-11-29'),
(4, '202311308077', 8079, 1, 'ivanumali051@outlook.com', 'Ivan', 'X', 'Umali', 98, 'MALE', 'Iba Este', 'Region III (Central Luzon)', 'Bulacan', 'Calumpit', 'Iba O\'Este', 'APPROVED', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_enrollee_prereg`
--

CREATE TABLE `tbl_school_enrollee_prereg` (
  `eid` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `sycode` int(50) NOT NULL,
  `gid` int(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `average` int(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `street` varchar(250) NOT NULL,
  `region_text` varchar(250) NOT NULL,
  `province_text` varchar(250) NOT NULL,
  `city_text` varchar(250) NOT NULL,
  `barangay_text` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_enrollee_trans`
--

CREATE TABLE `tbl_school_enrollee_trans` (
  `eid` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `sycode` int(50) NOT NULL,
  `gid` int(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `average` int(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `street` varchar(250) NOT NULL,
  `region_text` varchar(250) NOT NULL,
  `province_text` varchar(250) NOT NULL,
  `city_text` varchar(250) NOT NULL,
  `barangay_text` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_enrollee_trans`
--

INSERT INTO `tbl_school_enrollee_trans` (`eid`, `uid`, `sycode`, `gid`, `email`, `fname`, `mname`, `lname`, `average`, `gender`, `street`, `region_text`, `province_text`, `city_text`, `barangay_text`, `status`, `date_created`) VALUES
(1, '202311299014', 8079, 2, 'markbryanatienza@outlook.com', 'Mark Bryan', 'Gutierrez', 'Atienza', 98, 'MALE', 'Purok 4', 'Region III (Central Luzon)', 'Bulacan', 'Hagonoy', 'Santo Rosario', 'APPROVED', '2023-11-29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_lost`
--

CREATE TABLE `tbl_school_lost` (
  `fid` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `foundby` varchar(50) NOT NULL,
  `foundin` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `another` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_monitoring_attendance`
--

CREATE TABLE `tbl_school_monitoring_attendance` (
  `scid` int(11) NOT NULL,
  `room` int(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `timein` varchar(100) NOT NULL,
  `timeout` varchar(100) NOT NULL,
  `date_inserted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_monitoring_attendance`
--

INSERT INTO `tbl_school_monitoring_attendance` (`scid`, `room`, `uid`, `timein`, `timeout`, `date_inserted`) VALUES
(1, 3, '202311296837', '2:06 AM', '2:07 AM', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_number_of_time_scan`
--

CREATE TABLE `tbl_school_number_of_time_scan` (
  `nscid` int(11) NOT NULL,
  `room` int(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `timein` varchar(100) NOT NULL,
  `timeout` varchar(100) NOT NULL,
  `date_inserted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_number_of_time_scan`
--

INSERT INTO `tbl_school_number_of_time_scan` (`nscid`, `room`, `uid`, `timein`, `timeout`, `date_inserted`) VALUES
(1, 3, '202311296837', '2:06 AM', '', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_request_type`
--

CREATE TABLE `tbl_school_request_type` (
  `req` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_request_type`
--

INSERT INTO `tbl_school_request_type` (`req`, `type`) VALUES
(1, 'REPORT OF GRADE'),
(2, 'GOOD MORAL'),
(3, 'CERTIFICATE OF ENROLLMENT'),
(4, 'FORM 137');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_student_record`
--

CREATE TABLE `tbl_school_student_record` (
  `rid` int(11) NOT NULL,
  `sycode` int(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `fname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `current_level` int(50) NOT NULL,
  `current_section` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_student_record`
--

INSERT INTO `tbl_school_student_record` (`rid`, `sycode`, `uid`, `fname`, `gender`, `address`, `current_level`, `current_section`) VALUES
(1, 8079, '202311297191', 'Sherwin Dia Nagal', 'MALE', 'Sitio Lawlawan, Masagana Homes Region III (Central Luzon) Bulacan Guiguinto Santa Rita', 1, 1),
(2, 8079, '202311298444', 'Zsarinna Pangan Dela Rezma', 'FEMALE', 'Purok 3 Region III (Central Luzon) Bulacan Hagonoy Abulalas Rita', 1, 1),
(3, 8079, '202311296837', 'Arnel Amancio Ayop', 'MALE', 'Purok 3 Region III (Central Luzon) Bulacan Hagonoy Iba', 1, 1),
(4, 8079, '202311299014', 'Mark Bryan Gutierrez Atienza', 'MALE', 'Purok 4 Region III (Central Luzon) Bulacan Hagonoy Santo Rosario', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_student_request`
--

CREATE TABLE `tbl_school_student_request` (
  `reqid` int(11) NOT NULL,
  `sycode` int(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `request_type` int(50) NOT NULL,
  `note` text NOT NULL,
  `requested_by` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_student_request`
--

INSERT INTO `tbl_school_student_request` (`reqid`, `sycode`, `uid`, `request_type`, `note`, `requested_by`, `status`, `date_created`) VALUES
(1, 8079, '202311296837', 3, 'Thank you po', 'Mrs. Ayop', 'COMPLETED', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_student_request_history`
--

CREATE TABLE `tbl_school_student_request_history` (
  `reqhid` int(11) NOT NULL,
  `reqid` int(50) NOT NULL,
  `note` text NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_student_request_history`
--

INSERT INTO `tbl_school_student_request_history` (`reqhid`, `reqid`, `note`, `date_added`) VALUES
(1, 1, 'Need po for financial assistance', '2023-11-30'),
(2, 1, 'Will process po', '2023-11-30'),
(3, 1, 'Pwede niyo na po makuha in monday', '2023-11-30'),
(4, 1, 'Thank you po', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_teacher_record`
--

CREATE TABLE `tbl_school_teacher_record` (
  `eid` int(11) NOT NULL,
  `sycode` int(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `region_text` varchar(255) NOT NULL,
  `province_text` varchar(255) NOT NULL,
  `city_text` varchar(255) NOT NULL,
  `barangay_text` varchar(255) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_teacher_record`
--

INSERT INTO `tbl_school_teacher_record` (`eid`, `sycode`, `uid`, `fname`, `mname`, `lname`, `street`, `region_text`, `province_text`, `city_text`, `barangay_text`, `date_created`) VALUES
(1, 8079, '19734567', 'Enid Angelo', 'X', 'Santiago', 'Purok 3', 'Region III (Central Luzon)', '', 'Hagonoy', 'San Juan', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_year_details_grade`
--

CREATE TABLE `tbl_school_year_details_grade` (
  `gid` int(11) NOT NULL,
  `sycode` int(50) NOT NULL,
  `grade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_year_details_grade`
--

INSERT INTO `tbl_school_year_details_grade` (`gid`, `sycode`, `grade`) VALUES
(1, 8079, 'GRADE 1'),
(2, 8079, 'GRADE 2'),
(3, 8079, 'GRADE 3'),
(4, 8079, 'GRADE 4'),
(5, 8079, 'GRADE 5'),
(6, 8079, 'GRADE 6');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_year_details_map`
--

CREATE TABLE `tbl_school_year_details_map` (
  `id` int(11) NOT NULL,
  `mid` varchar(50) NOT NULL,
  `room` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_year_details_map`
--

INSERT INTO `tbl_school_year_details_map` (`id`, `mid`, `room`, `building`) VALUES
(1, '3', 'ICT', 'BUILDING 1'),
(2, '3', 'CONFERENCE ROOM', 'BUILDING 1'),
(3, '6', 'ROOM 201', 'BUILDING 2'),
(4, '6', 'ROOM 202', 'BUILDING 2'),
(5, '9', 'CANTEEN', 'BUILDING 3'),
(6, '9', 'ROOM 301', 'BUILDING 3'),
(7, '9', 'ROOM 302', 'BUILDING 3'),
(8, '8', 'ROOM 303', 'BUILDING 3'),
(9, '8', 'ROOM 304', 'BUILDING 3'),
(10, '8', 'ROOM 305', 'BUILDING 3'),
(11, '8', 'ROOM 306', 'BUILDING 3'),
(12, '7', 'ROOM 401', 'BUILDING 4'),
(13, '7', 'ROOM 402', 'BUILDING 4'),
(14, '7', 'ROOM 403', 'BUILDING 4'),
(15, '7', 'ROOM 404', 'BUILDING 4'),
(16, '7', 'HOME ECONOMICS', 'BUILDING 5'),
(17, '4', 'CLINIC', 'BUILDING 6'),
(18, '1', 'ROOM 701', 'BUILDING 7'),
(19, '1', 'ROOM 703', 'BUILDING 7'),
(20, '2', 'ROOM 702', 'BUILDING 7'),
(21, '2', 'ROOM 704', 'BUILDING 7'),
(22, '2', 'LIBRARY', 'BUILDING 1'),
(23, '2', 'OFFICE', 'BUILDING 1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_year_details_section`
--

CREATE TABLE `tbl_school_year_details_section` (
  `sid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `sycode` int(50) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `min` int(50) NOT NULL,
  `max` int(50) NOT NULL,
  `student_max` int(50) NOT NULL,
  `rid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_school_year_details_section`
--

INSERT INTO `tbl_school_year_details_section` (`sid`, `gid`, `sycode`, `section_name`, `min`, `max`, `student_max`, `rid`) VALUES
(1, 1, 8079, 'SECTION 1', 90, 100, 40, 3),
(2, 1, 8079, 'SECTION 2', 80, 89, 40, 4),
(3, 2, 8079, 'SECTION 1', 90, 100, 40, 6),
(4, 2, 8079, 'SECTION 2', 80, 89, 40, 7),
(5, 3, 8079, 'SECTION 1', 90, 100, 40, 8),
(6, 3, 8079, 'SECTION 2', 80, 89, 40, 9),
(7, 4, 8079, 'SECTION 1', 90, 100, 40, 10),
(8, 4, 8079, 'SECTION 2', 80, 89, 40, 11),
(9, 5, 8079, 'SECTION 1', 90, 100, 40, 12),
(10, 5, 8079, 'SECTION 2', 80, 89, 40, 13),
(11, 6, 8079, 'SECTION 1', 90, 100, 40, 14),
(12, 6, 8079, 'SECTION 2', 80, 89, 40, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_confirmation_for_enrollment`
--

CREATE TABLE `tbl_student_confirmation_for_enrollment` (
  `cid` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `sycode` int(50) NOT NULL,
  `confirm` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_designation`
--

CREATE TABLE `tbl_user_designation` (
  `did` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_designation`
--

INSERT INTO `tbl_user_designation` (`did`, `role`) VALUES
(1, 'ADMIN'),
(2, 'TEACHER'),
(3, 'STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_information`
--

CREATE TABLE `tbl_user_information` (
  `user_id` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `designation` int(50) NOT NULL,
  `code` int(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_information`
--

INSERT INTO `tbl_user_information` (`user_id`, `uid`, `email`, `password`, `designation`, `code`, `status`) VALUES
(1, '202311106896', 'yuto.arida00@outlook.com', '21232f297a57a5a743894a0e4a801fc3', 1, 6899, 'VERIFIED'),
(2, '202311297191', 'sherwinnagal23@outlook.com', 'd311dcfe6065502a8d0492ce78fc5ad0', 3, 7349, 'UNVERIFIED'),
(4, '202311298444', 'delarezmazsarinna@outlook.ph', 'b34170e24d74ad5d0c57917be16dc92d', 3, 8017, 'UNVERIFIED'),
(5, '202311296837', 'arnel.ayopofficial@outlook.com', '21232f297a57a5a743894a0e4a801fc3', 3, 7451, 'VERIFIED'),
(6, '202311299014', 'markbryanatienza@outlook.com', '3479f9de7b08bac7204faf2196e71360', 3, 7430, 'UNVERIFIED'),
(8, '19734567', 'enidangelosantiago10@outlook.com', 'a337a45ddf631fb9921c6af694dd6213', 2, 7638, 'VERIFIED'),
(9, '202311308077', 'ivanumali051@outlook.com', '12e713e4a4d290005a8af6602d84e4b4', 3, 9360, 'UNVERIFIED');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_remember_me_tokens`
--

CREATE TABLE `tbl_user_remember_me_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_school_year`
--

CREATE TABLE `tbl_user_school_year` (
  `syid` int(11) NOT NULL,
  `year_from` varchar(100) NOT NULL,
  `year_to` varchar(100) NOT NULL,
  `sycode` int(100) NOT NULL,
  `date_created` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_school_year`
--

INSERT INTO `tbl_user_school_year` (`syid`, `year_from`, `year_to`, `sycode`, `date_created`, `status`) VALUES
(1, '2023', '2024', 8079, '2023-11-29', 'ACTIVATED');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_security`
--

CREATE TABLE `tbl_user_security` (
  `id` int(11) NOT NULL,
  `uid` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `code` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_security`
--

INSERT INTO `tbl_user_security` (`id`, `uid`, `email`, `code`, `status`, `date_created`) VALUES
(1, '202311106896', 'yuto.arida00@outlook.com', 9415, 'UNUSED', '2023-11-29'),
(2, '202311106896', 'yuto.arida00@outlook.com', 8386, 'UNUSED', '2023-11-29'),
(3, '202311296837', 'arnel.ayopofficial@outlook.com', 7535, 'UNUSED', '2023-11-30'),
(4, '19734567', 'enidangelosantiago10@outlook.com', 6683, 'UNUSED', '2023-11-30'),
(5, '202311296837', 'arnel.ayopofficial@outlook.com', 8853, 'UNUSED', '2023-11-30'),
(6, '19734567', 'enidangelosantiago10@outlook.com', 7641, 'UNUSED', '2023-11-30'),
(7, '202311106896', 'yuto.arida00@outlook.com', 9043, 'UNUSED', '2023-11-30'),
(8, '202311106896', 'yuto.arida00@outlook.com', 8595, 'UNUSED', '2023-11-30'),
(9, '202311106896', 'yuto.arida00@outlook.com', 9498, 'UNUSED', '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_student_history`
--

CREATE TABLE `tbl_user_student_history` (
  `hid` int(11) NOT NULL,
  `sycode` int(50) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `gid` int(50) NOT NULL,
  `section` int(50) NOT NULL,
  `average` int(50) NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_assigned_section`
--

CREATE TABLE `teacher_assigned_section` (
  `aid` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `sid` int(50) NOT NULL,
  `sycode` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_assigned_section`
--

INSERT INTO `teacher_assigned_section` (`aid`, `uid`, `sid`, `sycode`) VALUES
(1, '19734567', 1, 8079);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_assigned_teacher_section_history`
--
ALTER TABLE `tbl_assigned_teacher_section_history`
  ADD PRIMARY KEY (`haid`);

--
-- Indexes for table `tbl_school_announcement`
--
ALTER TABLE `tbl_school_announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_school_enrollee_fresh`
--
ALTER TABLE `tbl_school_enrollee_fresh`
  ADD PRIMARY KEY (`eid`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `tbl_school_enrollee_prereg`
--
ALTER TABLE `tbl_school_enrollee_prereg`
  ADD PRIMARY KEY (`eid`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `tbl_school_enrollee_trans`
--
ALTER TABLE `tbl_school_enrollee_trans`
  ADD PRIMARY KEY (`eid`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `tbl_school_lost`
--
ALTER TABLE `tbl_school_lost`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `tbl_school_monitoring_attendance`
--
ALTER TABLE `tbl_school_monitoring_attendance`
  ADD PRIMARY KEY (`scid`);

--
-- Indexes for table `tbl_school_number_of_time_scan`
--
ALTER TABLE `tbl_school_number_of_time_scan`
  ADD PRIMARY KEY (`nscid`);

--
-- Indexes for table `tbl_school_request_type`
--
ALTER TABLE `tbl_school_request_type`
  ADD PRIMARY KEY (`req`);

--
-- Indexes for table `tbl_school_student_record`
--
ALTER TABLE `tbl_school_student_record`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `tbl_school_student_request`
--
ALTER TABLE `tbl_school_student_request`
  ADD PRIMARY KEY (`reqid`);

--
-- Indexes for table `tbl_school_student_request_history`
--
ALTER TABLE `tbl_school_student_request_history`
  ADD PRIMARY KEY (`reqhid`);

--
-- Indexes for table `tbl_school_teacher_record`
--
ALTER TABLE `tbl_school_teacher_record`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `tbl_school_year_details_grade`
--
ALTER TABLE `tbl_school_year_details_grade`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `tbl_school_year_details_map`
--
ALTER TABLE `tbl_school_year_details_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_school_year_details_section`
--
ALTER TABLE `tbl_school_year_details_section`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `tbl_student_confirmation_for_enrollment`
--
ALTER TABLE `tbl_student_confirmation_for_enrollment`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_user_designation`
--
ALTER TABLE `tbl_user_designation`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `tbl_user_information`
--
ALTER TABLE `tbl_user_information`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `tbl_user_remember_me_tokens`
--
ALTER TABLE `tbl_user_remember_me_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_user_school_year`
--
ALTER TABLE `tbl_user_school_year`
  ADD PRIMARY KEY (`syid`);

--
-- Indexes for table `tbl_user_security`
--
ALTER TABLE `tbl_user_security`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_student_history`
--
ALTER TABLE `tbl_user_student_history`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `teacher_assigned_section`
--
ALTER TABLE `teacher_assigned_section`
  ADD PRIMARY KEY (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_assigned_teacher_section_history`
--
ALTER TABLE `tbl_assigned_teacher_section_history`
  MODIFY `haid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_school_announcement`
--
ALTER TABLE `tbl_school_announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_enrollee_fresh`
--
ALTER TABLE `tbl_school_enrollee_fresh`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_school_enrollee_prereg`
--
ALTER TABLE `tbl_school_enrollee_prereg`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_enrollee_trans`
--
ALTER TABLE `tbl_school_enrollee_trans`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_school_lost`
--
ALTER TABLE `tbl_school_lost`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_monitoring_attendance`
--
ALTER TABLE `tbl_school_monitoring_attendance`
  MODIFY `scid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_school_number_of_time_scan`
--
ALTER TABLE `tbl_school_number_of_time_scan`
  MODIFY `nscid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_school_request_type`
--
ALTER TABLE `tbl_school_request_type`
  MODIFY `req` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_school_student_record`
--
ALTER TABLE `tbl_school_student_record`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_school_student_request`
--
ALTER TABLE `tbl_school_student_request`
  MODIFY `reqid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_school_student_request_history`
--
ALTER TABLE `tbl_school_student_request_history`
  MODIFY `reqhid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_school_teacher_record`
--
ALTER TABLE `tbl_school_teacher_record`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_school_year_details_grade`
--
ALTER TABLE `tbl_school_year_details_grade`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_school_year_details_map`
--
ALTER TABLE `tbl_school_year_details_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_school_year_details_section`
--
ALTER TABLE `tbl_school_year_details_section`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_student_confirmation_for_enrollment`
--
ALTER TABLE `tbl_student_confirmation_for_enrollment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_designation`
--
ALTER TABLE `tbl_user_designation`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user_information`
--
ALTER TABLE `tbl_user_information`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user_remember_me_tokens`
--
ALTER TABLE `tbl_user_remember_me_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_school_year`
--
ALTER TABLE `tbl_user_school_year`
  MODIFY `syid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user_security`
--
ALTER TABLE `tbl_user_security`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user_student_history`
--
ALTER TABLE `tbl_user_student_history`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_assigned_section`
--
ALTER TABLE `teacher_assigned_section`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
