-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2020 at 07:34 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `category` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `category`) VALUES
(1, 0, 'اخبار سياسية'),
(2, 0, 'اخبار رياضية'),
(3, 0, 'اخبار طرائف وعجائب'),
(4, 1, 'اخبار سياسية محلية'),
(5, 1, 'اخبار سياسية عربية'),
(6, 1, 'اخبار سياسية عالمية'),
(7, 2, 'اخبار كرة القدم'),
(8, 2, 'اخبار كرة السلة'),
(9, 7, 'اخبار  الدوري الاسباني'),
(10, 7, 'اخبار الدوري الانجليزي'),
(11, 7, 'اخبار الدوري الالماني'),
(12, 8, 'اخبار الدوري الامريكي '),
(13, 8, 'اخبار الدوري الاوربي');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(3) NOT NULL,
  `news_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `news_image` text CHARACTER SET utf8 NOT NULL,
  `news_details` text CHARACTER SET utf8 NOT NULL,
  `news_date` date NOT NULL,
  `id_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `news_title`, `news_image`, `news_details`, `news_date`, `id_cat`) VALUES
(1, 'الحوثيون يعلنون \"إعادة تأهيل\" 64 طفلا مجندا ', 'image/sm.jpg', 'أعلن المتمردون اليمنيون الإثنين في صنعاء أنّهم قاموا بنقل 64 طفلاً اعتقلوا خلال عمليّات عسكرية في جبهات الحرب إلى مؤسّسة لإعادة تأهيلهم.\r\n\r\nوقال رئيس لجنة شؤون الأسرى لدى المتمرّدين عبد القادر المرتضى لوكالة فرانس برس: إنّ الأطفال \"أسروا في المعارك خاصة في جبهات الحدود\".\r\n\r\n\r\nواتّهم المرتضى: \"دول العدوان\"، في إشارة الدول المشاركة بالتحالف العسكري بقيادة السعودية الذي يقاتل الحوثيين، بإرسال هؤلاء الأطفال إلى جبهات القتال.\r\n\r\nوبحسب المرتضى فإنّ الأطفال سيتّم تسليمهم إلى وزارة الشؤون الاجتماعية \"للإهتمام بهم ورعايتهم وإعادة تأهيلهم وثم دمجهم في المجتمع\".\r\n\r\nوذكر مصدر مقرّب من المتمردين: إنّ الأطفال تقل أعمارهم عن 18 عاما.', '2020-11-18', 4),
(8, 'hhhhhhh', 'eeeeeeeeeeeeeeee', 'gfk/gh.u', '2020-11-23', 5),
(9, 'hhhhhhh', 'eeeeeeeeeeeeeeee', 'gfk/gh.u', '2020-11-23', 10),
(10, 'bbbbbbbbbbb', 'dddddddddddd', 'gfk/gh.u', '2020-11-23', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foreign_key` (`id_cat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_foreign_key` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
