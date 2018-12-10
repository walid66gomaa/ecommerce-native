-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2018 at 07:51 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `allowComment` tinyint(1) NOT NULL DEFAULT '0',
  `allowAds` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `ordering`, `visibility`, `allowComment`, `allowAds`, `parent`) VALUES
(1, 'electrics', '', 2, 1, 1, 1, NULL),
(10, 'food', '', 1, 1, 1, 1, NULL),
(12, 'vehicle', '', 3, 1, 0, 0, NULL),
(13, 'mobil factory', 'mobil factoryggg ggggf  hh', 555, 1, 1, 1, NULL),
(14, 'cars', 'cars in all world', 0, 1, 1, 1, 12),
(15, 'motor', 'vvvvv', 0, 1, 1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `item_id`, `user_id`, `status`, `date`) VALUES
(2, 'ljkkk', 5, 1, 0, '2018-11-10'),
(3, '?ljkljkljkl', 5, 1, 0, '2018-11-10'),
(4, 'dodkdjkdkk dkdkkd\r\n', 5, 1, 0, '2018-11-10'),
(5, 'dodkdjkdkk dkdkkd\r\n', 5, 1, 0, '2018-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` varchar(255) DEFAULT NULL,
  `addDate` date NOT NULL,
  `countryMade` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `approve` tinyint(1) DEFAULT '0',
  `viewNum` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `price`, `addDate`, `countryMade`, `status`, `image`, `rating`, `cat_id`, `user_id`, `approve`, `viewNum`) VALUES
(5, 'walid elbehery', 'orem ipsum dolor sit amet, consectetur adipisicing elit. asdfasdfasdfsdfa asdfasdf sdfasfasdfasfasdfasdfasdfsd asdf asdf Distinctio, evenietsdf sdfsdfsdfsdfsdfsdf.\r\n', '13000 LE', '2018-11-03', 'Djibouti', '1', NULL, NULL, 13, 1, 1, 1),
(6, 'battery ', 'orem ipsum dolor sit amet, consectetur adipisicing elit. asdfasdfasdfsdfa asdfasdf sdfasfasdfasfasdfasdfasdfsd asdf asdf Distinctio, evenietsdf sdfsdfsdfsdfsdfsdf.', '12 LE', '2018-11-03', 'Yemen', '1', NULL, NULL, 13, 1, 1, 2),
(7, 'eggs', 'xc vckcvkxcklc vckkv vlcl  vlcl goir flcllc cll;vllv vclk vociibndf', '50 LE', '2018-11-08', 'Gambia', '1', NULL, NULL, 10, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `item_id`, `user_id`, `num`) VALUES
(1, 7, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `avatar` varchar(300) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `regStatus` int(1) NOT NULL DEFAULT '0' COMMENT 'admin approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `userName`, `password`, `email`, `fullName`, `avatar`, `group_id`, `date`, `regStatus`) VALUES
(1, 'walid', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'iam66walid@gmail.com', 'walid gomaa  elbehery', NULL, 1, '2018-11-01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_cat` (`name`),
  ADD KEY `fkParentID` (`parent`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user` (`user_id`),
  ADD KEY `comment_item` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_1` (`user_id`),
  ADD KEY `cat_1` (`cat_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_key` (`item_id`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fkParentID` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `item_key` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
