-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 03:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin`, `admin_email`, `admin_password`) VALUES
('admin 1', 'admin@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `appliedjobs`
--

CREATE TABLE `appliedjobs` (
  `applyid` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `companyusername` varchar(250) NOT NULL,
  `action` int(11) NOT NULL COMMENT 'accepted 1\r\nrejected 2\r\npending 0',
  `applydate` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(50) NOT NULL,
  `blog_name` varchar(100) NOT NULL,
  `blog_title` varchar(100) NOT NULL,
  `blog_image` varchar(100) NOT NULL,
  `blog_description` varchar(250) NOT NULL,
  `blog_tags` varchar(100) NOT NULL,
  `other_image` varchar(100) DEFAULT NULL,
  `blog_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `bookmarkid` int(11) NOT NULL,
  `jobid` int(52) NOT NULL,
  `username` varchar(50) NOT NULL,
  `companyusername` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(100) NOT NULL,
  `category` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(100) NOT NULL,
  `blog_id` int(50) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `comment_date` date NOT NULL DEFAULT current_timestamp(),
  `person_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cin` varchar(250) NOT NULL,
  `gst` varchar(250) NOT NULL,
  `pancard` varchar(250) NOT NULL,
  `gstcertificate` varchar(250) NOT NULL,
  `signup_date` date NOT NULL DEFAULT current_timestamp(),
  `coins` int(255) NOT NULL,
  `companytype` varchar(100) NOT NULL,
  `companysize` int(100) DEFAULT NULL,
  `companylogo` varchar(250) NOT NULL,
  `location` varchar(100) NOT NULL,
  `websitelink` varchar(250) NOT NULL,
  `facebook` varchar(250) NOT NULL,
  `linkedin` varchar(250) NOT NULL,
  `mobile` bigint(255) NOT NULL,
  `alternatemobile` bigint(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'pending=0)\r\n(active=1)\r\n(rejected=2)',
  `company_date` date NOT NULL DEFAULT current_timestamp(),
  `token` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(110) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `image_category` varchar(100) NOT NULL,
  `image_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobcards`
--

CREATE TABLE `jobcards` (
  `card_id` varchar(50) NOT NULL,
  `client_name` varchar(250) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `card_active` int(10) NOT NULL DEFAULT 0 COMMENT '\r\npending=0\r\nactive=1\r\nexpire=2\r\n',
  `card_sdate` date DEFAULT NULL,
  `card_edate` date DEFAULT NULL,
  `expire_months` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobcard_client`
--

CREATE TABLE `jobcard_client` (
  `jobcard_client_name` varchar(250) NOT NULL,
  `client_phone` bigint(255) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `client_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `username` varchar(250) NOT NULL,
  `jobid` int(250) NOT NULL,
  `compname` varchar(250) NOT NULL,
  `jobtitle` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `deadline` date DEFAULT NULL,
  `location2` varchar(250) NOT NULL,
  `typeofjob` varchar(20) NOT NULL,
  `location` varchar(250) NOT NULL,
  `banner` varchar(200) DEFAULT NULL,
  `paytype` varchar(50) NOT NULL,
  `minsalary` int(250) NOT NULL,
  `maxsalary` int(250) NOT NULL,
  `education` varchar(250) NOT NULL,
  `minyr` int(50) NOT NULL,
  `maxyr` int(50) NOT NULL,
  `vacancy` int(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `description` varchar(250) NOT NULL,
  `responsibility` varchar(250) NOT NULL,
  `requirements` varchar(250) NOT NULL,
  `active` int(50) NOT NULL COMMENT '\r\n(==0 admin pending )\r\n(==1 accept admin active)\r\n(==2 expired )',
  `sdate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `link` varchar(250) NOT NULL,
  `media_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `username` varchar(250) NOT NULL,
  `amount` int(250) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `sdate` date NOT NULL DEFAULT current_timestamp(),
  `edate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `query_id` int(50) NOT NULL,
  `q_name` varchar(100) NOT NULL,
  `q_email` varchar(100) NOT NULL,
  `q_number` bigint(255) NOT NULL,
  `message` varchar(200) NOT NULL,
  `q_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_candidate`
--

CREATE TABLE `users_candidate` (
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `currentjob` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `experience_level` int(50) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `cardtype` int(11) NOT NULL DEFAULT 0 COMMENT '0 normal)\r\n(1= card type)',
  `student_date` date NOT NULL DEFAULT current_timestamp(),
  `expire_date` date DEFAULT NULL,
  `srno` int(11) NOT NULL,
  `token` varchar(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `video_id` int(100) NOT NULL,
  `video_name` varchar(100) NOT NULL,
  `video_category` varchar(100) NOT NULL,
  `video_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_email`);

--
-- Indexes for table `appliedjobs`
--
ALTER TABLE `appliedjobs`
  ADD PRIMARY KEY (`applyid`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmarkid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `jobcards`
--
ALTER TABLE `jobcards`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `jobcard_client`
--
ALTER TABLE `jobcard_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`query_id`);

--
-- Indexes for table `users_candidate`
--
ALTER TABLE `users_candidate`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `srno` (`srno`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appliedjobs`
--
ALTER TABLE `appliedjobs`
  MODIFY `applyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmarkid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(110) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobcard_client`
--
ALTER TABLE `jobcard_client`
  MODIFY `client_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `jobid` int(250) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `query`
--
ALTER TABLE `query`
  MODIFY `query_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_candidate`
--
ALTER TABLE `users_candidate`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(100) NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `jobcard_status to 2` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-10-16 23:55:32' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE jobcards
SET card_active = 2
WHERE card_edate < CURDATE()$$

CREATE DEFINER=`root`@`localhost` EVENT `user_candidate card update to 0` ON SCHEDULE EVERY 1 DAY STARTS '2023-10-16 23:55:55' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE users_candidate SET cardtype = 0 WHERE expire_date < CURDATE()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
