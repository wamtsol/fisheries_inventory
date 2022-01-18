-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 06:04 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tamseel`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL,
  `is_petty_cash` int(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `title`, `type`, `description`, `balance`, `is_petty_cash`, `status`, `ts`) VALUES
(3, 'Aslam', 0, '', '0.00', 0, 1, '2019-04-02 19:18:28'),
(4, 'Cash', 0, '', '0.00', 1, 1, '2019-04-02 19:52:05'),
(5, 'Bank - Faysal Bank', 0, '', '0.00', 0, 1, '2019-04-02 19:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_type_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `monthly_salary` decimal(10,2) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_type_id`, `username`, `email`, `name`, `monthly_salary`, `password`, `status`) VALUES
(1, 1, 'admin', 'vickyali2@hotmail.com', 'admin', '0.00', 'admin', 1),
(14, 3, 'bilal', 'bilal@gmail.com', 'Bilal', '10000.00', 'bilal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_type`
--

CREATE TABLE `admin_type` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `can_add` int(1) NOT NULL DEFAULT 0,
  `can_edit` int(1) NOT NULL DEFAULT 0,
  `can_delete` int(1) NOT NULL DEFAULT 0,
  `can_read` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_type`
--

INSERT INTO `admin_type` (`id`, `title`, `can_add`, `can_edit`, `can_delete`, `can_read`, `status`, `ts`) VALUES
(1, 'Administrator', 1, 1, 1, 1, 1, '2017-02-27 12:10:38'),
(3, 'Computer Operator', 1, 1, 0, 1, 1, '2017-03-21 14:13:24');

-- --------------------------------------------------------

--
-- Table structure for table `config_type`
--

CREATE TABLE `config_type` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `sortorder` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_type`
--

INSERT INTO `config_type` (`id`, `title`, `sortorder`) VALUES
(1, 'General Settings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `config_variable`
--

CREATE TABLE `config_variable` (
  `id` int(11) NOT NULL,
  `config_type_id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `notes` varchar(512) NOT NULL,
  `type` varchar(200) NOT NULL,
  `default_values` text NOT NULL,
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `sortorder` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_variable`
--

INSERT INTO `config_variable` (`id`, `config_type_id`, `title`, `notes`, `type`, `default_values`, `key`, `value`, `sortorder`) VALUES
(1, 1, 'Site URL', '', 'text', '', 'site_url', 'http://localhost', 2),
(2, 1, 'Site Title', '', 'text', '', 'site_title', 'Tamseel Traders', 1),
(3, 1, 'Admin Logo', '', 'file', '', 'admin_logo', 'admin_logo.png', 4),
(11, 1, 'Thermal Printer Title', 'Enter the thermal printer installed on your pc. You can find it in your control panel settings', 'text', '', 'thermal_printer_title', 'POS-80(copy of 1)', 6),
(10, 1, 'Currency Symbol', '', 'text', '', 'currency_symbol', 'Rs', 5),
(7, 1, 'Admin Email', 'Main Email Address where all the notifications will be sent.', 'text', '', 'admin_email', 'vickyali2@hotmail.com', 3),
(12, 1, 'Thermal Printer Width', 'enter width in mm (e.g. 80)', 'text', '', 'thermal_printer_width', '80', 7),
(13, 1, 'Barcode Printer Title', 'Enter the barcode printer installed on your pc. You can find it in your control panel settings', 'text', '', 'barcode_printer_title', 'TSC TTP-244 Pro', 8),
(14, 1, 'Barcode Receipt Width', 'enter width in mm (e.g. 32)', 'text', '', 'barcode_printer_width', '32', 9),
(15, 1, 'Barcode Receipt Height', 'enter width in mm (e.g. 24)', 'text', '', 'barcode_printer_height', '24', 10),
(17, 1, 'Reciept Logo', '', 'file', '', 'reciept_logo', 'reciept_logo.png', 12),
(16, 1, 'Login Logo', '', 'file', '', 'login_logo', 'login_logo.png', 11),
(18, 1, 'Address/Phone', '', 'editor', '', 'address_phone', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<h6>Shop # 6, Jarrah Wali Gali, Station<br />Road HYD Mob: 0321 309 9855</h6>\r\n</body>\r\n</html>', 13);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(50) CHARACTER SET latin1 NOT NULL,
  `address` text CHARACTER SET latin1 NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `phone`, `address`, `status`, `ts`) VALUES
(1, 'Noor Jee Autos', '03003034684', 'Khokhar Muhallah', 1, '2017-05-08 14:08:54'),
(2, 'B.S Autos Nawab Shah', '03337006227', 'Raheel Hotel Nawab Shah', 1, '2017-05-09 08:38:25'),
(3, 'Numan Autos', '', 'Jarrah Wali Gali ', 1, '2017-05-09 15:08:32'),
(4, 'Iqra Mumtaz Autos', '03203515214', 'Gujjo Thatta', 1, '2017-05-10 09:04:07'),
(5, 'Qazi Autos ', '03072192145', 'Nushero Feroz', 1, '2017-05-13 12:52:36'),
(6, 'NASEER AUTOS ', '', 'PENJRA POOL', 1, '2017-05-18 15:25:25'),
(7, 'M.A. AUTOS', '03133528271', 'LATIFABAD NO. 08, HYD', 1, '2017-05-20 16:13:42'),
(8, 'NEW SAKHI AUTOS', '03133300590', 'PENJRA POOL', 1, '2017-05-20 16:41:22'),
(9, 'SAMNANI AUTOS', '03002247652', 'MAIN BUS STAND THANA BULA KHAN', 1, '2017-05-22 10:50:58'),
(10, 'Alam Autos', '', 'Denter Wali Gali', 1, '2017-05-22 11:55:19'),
(11, 'Delux Autos', '', 'Jarrah Wali Gali', 1, '2017-05-22 12:13:59'),
(12, 'M.Nasir Autos', '03013867092', 'Thari Road Mehrab ', 1, '2017-05-22 12:19:46'),
(13, 'Aslam Brother', '', 'Khokhar Muhalla', 1, '2017-05-24 07:49:44'),
(14, 'M.A Autos', '03003285956', 'New Saeda Bad', 1, '2017-05-24 14:19:23'),
(15, 'Unique Autos', '03133388840', 'Denter Wali Gali', 1, '2017-05-24 14:22:14'),
(16, 'Umair Autos', '03013245335', 'Kundri', 1, '2017-05-25 08:02:07'),
(17, 'Farhan Suplier', '', 'Latifabad', 1, '2017-05-25 09:46:31'),
(18, 'Khalid Autos ', '03070323287', 'Nawab Shah Bucheri', 1, '2017-05-27 08:10:00'),
(19, 'ARAIN AUTOS', '03452313542', 'JHREKH, THATHA', 1, '2017-05-27 08:50:19'),
(20, 'AURANGZAIB AUTOS', '03322439155', 'DIGREE', 1, '2017-05-27 12:05:37'),
(21, 'IRFAN AUTOS', '03128856507', 'PUNJRA POLE', 1, '2017-05-27 12:14:01'),
(22, 'KARACHI AUTOS', '03007250553', 'SECANDERABAD KOTRI', 1, '2017-05-27 12:24:47'),
(23, 'Waseem Bhai', '03164073421', 'Ghari Khatta, Hyderabad', 1, '2017-05-29 09:39:50'),
(24, 'WAQAS AUTOS', '03423070345', 'Kotri Fatak', 1, '2017-06-03 08:24:22'),
(25, 'AASA AUTO MOBILE', '', '', 1, '2017-06-03 10:11:08'),
(26, 'Arif Autos', '03453673373', 'Talhar', 1, '2017-06-04 08:08:06'),
(27, 'TALHA AUTOS', '03413239265', 'SANGHAR DEH 22', 1, '2017-06-06 10:12:39'),
(28, 'AL Shebaz Autos', '03003226049', 'Qazi Ahmed', 1, '2017-06-10 09:01:26'),
(29, 'Tahiri Autos', '03043198455', 'Tando Allayar', 1, '2017-06-10 10:08:52'),
(30, 'SAJID AUTOS', '03463460080', 'GOLARCHI', 1, '2017-06-10 10:44:57'),
(31, 'Noorani Autos', '03003012877', 'Mathiyari', 1, '2017-06-11 09:22:21'),
(32, 'Sheezad Autos', '03062896654', 'Mithani', 1, '2017-06-13 07:46:30'),
(33, 'B.Z Autos', '03333525383', 'Mirpur Khas', 1, '2017-06-19 07:10:12'),
(34, 'New Qaleem Autos', '03053109100', 'Bhiria Road', 1, '2017-06-19 09:46:19'),
(35, 'ISHTIAQUE AUTOS ', '03223094386', 'HIRABAD', 1, '2017-06-24 16:09:15'),
(36, 'FAISAL AUTOS HYD', '03149862065', 'Khokhar Mohalla Hyd', 1, '2017-06-29 12:53:01'),
(37, 'Fazal Autos', '03332844503', 'Hyderabad Road Badin', 1, '2017-07-05 10:10:12'),
(38, 'Aqib Autos', '03083794250', 'Pakka Chang Zilla Khai Pur', 1, '2017-07-08 09:54:05'),
(39, 'Mir Muhammad Autos', '03453534209', 'Islam Kot', 1, '2017-07-09 06:36:00'),
(40, 'S.F AUTOS ', '03433602089', 'Khokhar Mohalla Hyd', 1, '2017-07-10 09:48:04'),
(41, 'Friend Autos', '03342666755', 'Kundri', 1, '2017-07-11 08:43:29'),
(42, 'Jawed Autos', '03002680156', 'Noshero Feroze', 1, '2017-07-13 11:00:27'),
(43, 'AASA AUTO MOBILE', '03126649993 (Imran)', '', 1, '2017-07-17 11:42:40'),
(44, 'Qasim Autos', '03073768448', 'Tando Fazal', 1, '2017-07-19 15:25:52'),
(45, 'Ali Raza Autos', '03152450156', 'Rickshaw Market, Station Road Hyderabad', 1, '2017-07-22 15:32:51'),
(46, 'Mumtaz Autos', '03003798053', 'Hala', 1, '2017-07-24 09:58:10'),
(47, 'Nazeer Autos', '03075053349', 'Shezad Pur', 1, '2017-07-24 10:56:41'),
(48, 'Niaz Autos', '03013152023', 'Sakhrand', 1, '2017-07-24 11:06:49'),
(49, 'MANSOOR AUTOS', '03213043787', 'Punjra Poll', 1, '2017-07-29 15:16:13'),
(50, 'Sundar Autos', '03433722755', 'Sinjhoro', 1, '2017-07-30 08:07:33'),
(51, 'Sarfaraz Autos', '03033436399', 'Sinjhoro', 1, '2017-07-30 08:11:49'),
(52, 'Ayaz Autos', '03442458198', 'Chhore Cant', 1, '2017-07-30 14:13:29'),
(53, 'A.B Autos', '03453607906', 'Pinjrapol Hyd', 1, '2017-08-01 14:02:38'),
(54, 'ZUFIQAR AUTOS', '03111330177', 'DADU', 1, '2017-08-01 14:21:45'),
(55, 'Shahzar Autos ', '03002916799', 'Sanghar', 1, '2017-08-03 15:19:16'),
(56, 'Jamali Auto Parts', '03128500914', 'Shop No. 37, Pathan Colony, Cant Market, Hyd', 1, '2017-08-05 08:44:24'),
(57, 'Ghulam Mustafa Autos', '03005934013', 'Punjab', 1, '2017-08-05 12:03:50'),
(58, 'Shahzad Bhai (N.H)', '', 'Saddar Hyderabad', 1, '2017-08-05 14:54:46'),
(59, 'WAQAS AUTOS', '03423070345', 'Kotri Fatak', 1, '2017-08-05 15:45:59'),
(60, 'HAFEEZ AUTOS ', '03332652289', 'KOTRI', 1, '2017-08-06 11:07:50'),
(61, 'YASHPAL AUTOS', '03312942432', 'DEHI', 1, '2017-08-10 06:52:40'),
(62, 'Dua Autos', '03078228020', 'Jamshoro', 1, '2017-08-22 14:50:37'),
(63, 'G.A Sufi Autos', '03023455695', 'Shezad Pur', 1, '2017-08-27 09:57:46'),
(64, 'SUPER AUTOS', '03003283969', 'KHATRO, DISTRICT SANGHAR', 1, '2017-09-06 10:52:23'),
(65, 'Shehen Shah Autos', '03468900740', 'Kandiari (Sanghar)', 1, '2017-09-07 11:53:44'),
(66, 'Sakhi Sultan Autos', '03453716547', 'Maksorind Sanghar', 1, '2017-09-16 06:12:09'),
(67, 'ANSARI AUTOS', '03151290743', 'DADU', 1, '2017-09-18 12:32:49'),
(68, 'Rehman Autos', '03460005945', 'Qasimabad', 1, '2017-09-23 12:38:24'),
(69, 'Yeshpal Autos', '03312942432', 'Dehi', 1, '2017-09-24 10:59:44'),
(70, 'Jawed Autos', '03423276175', 'Golarchi', 1, '2017-09-25 07:52:02'),
(71, 'Jay Ganesh Autos', '03453785843', 'Khipro ', 1, '2017-10-10 16:29:55'),
(72, 'Hur Mujahid Autos', '03456412373', 'Islam kot', 1, '2017-10-11 10:07:06'),
(73, 'Saleem Autos', '03002498812', 'Nawab Shah', 1, '2017-10-19 09:58:02'),
(74, 'Arsalan Autos', '03342884989', 'Mirpur Road Sanghar', 1, '2017-11-05 12:28:07'),
(75, 'AL-MUSTAFA AUTOS', '03000353432', 'MORO', 1, '2017-11-06 14:19:12'),
(76, 'Fazal Autos', '03332844503', 'Badin', 1, '2017-11-08 10:07:09'),
(77, 'Rehman Autos', '03113031599', 'Tando Adam', 1, '2017-11-12 06:39:21'),
(78, 'Haider Autos', '', 'Dor', 1, '2017-11-13 05:34:55'),
(79, 'Hassan Autos', '03332969246', 'Mirpur Khas', 1, '2017-11-22 07:41:59'),
(80, 'Soomro Autos', '03003006031', 'Tharo Shah (Noshero Feroz)', 1, '2017-12-03 07:29:57'),
(81, 'RANA NISAR AUTOS', '03423270243', 'GULARCHI', 1, '2017-12-27 13:39:58'),
(82, 'Shezad Autos', '03046740358', 'Padidan (Noshero feroz)', 1, '2017-12-28 06:14:20'),
(83, 'KHURRAM AUTOS', '03163083622', 'Umar Kot', 1, '2018-01-04 08:16:43'),
(84, 'Ayaz Autos', '03482767818', 'Kotri Bhitai colony', 1, '2018-01-07 14:26:45'),
(85, 'Raja Autos', '03473253704', 'Maqsudo (Sanghar)', 1, '2018-01-27 08:32:08'),
(86, 'Hyderabad', '03043092130', 'Bhan Saidabad', 1, '2018-01-29 12:34:12'),
(87, 'Miya Jee Autos', '03333756664', 'Kundri', 1, '2018-01-30 11:52:35'),
(88, 'Taj Autos', '03332506828', 'Nangar parker', 1, '2018-02-17 11:53:10'),
(89, 'Jepal Dass', '03223601097', 'Photomal city Chundko', 1, '2018-02-19 07:20:02'),
(90, 'Jay Kumar Autos', '03453652202', 'johor ', 1, '2018-02-28 11:47:27'),
(91, 'Sindh Autos', '0238-575112', 'Nabesha road (umer koat)', 1, '2018-03-03 13:47:00'),
(92, 'Chitta Autos', '03002221978', '', 1, '2018-03-15 09:51:23'),
(93, 'Reshem Autos', '0308-3473509', 'Kot banglow barai chundko ', 1, '2018-03-18 12:05:08'),
(94, 'Mukesh Autos', '', 'pangrio', 1, '2018-04-11 13:40:40'),
(95, 'Kelash Kumar', '03453009600', 'Jhampeer (Thatta)', 1, '2018-04-12 06:02:21'),
(96, 'Salwani Autos', '03144469608', 'Bukera Sharif', 1, '2018-04-17 09:09:14'),
(97, 'Qalandri Autos', '03342957153', 'Kundri', 1, '2018-05-10 09:04:12'),
(98, 'Baber Autos', '03003206466', 'Dor', 1, '2018-06-25 08:16:58'),
(99, 'A.Samad Suplier ', '03063409247', 'Behria Road (Noshero Feroz)', 1, '2018-07-08 16:11:00'),
(100, 'Abdul Sattar Autos', '03118227267', '', 1, '2018-07-30 16:30:12'),
(101, 'Yousof Autos', '03002389070', 'Tando allahyar', 1, '2018-07-31 16:37:28'),
(102, 'Farhan Muskan Autos', '03003325255', 'Talhar', 1, '2018-08-05 11:12:11'),
(103, 'REHMAN AUTOS', '', 'CHAMBERH', 1, '2018-08-11 06:47:16'),
(104, 'New Adil Autos', '03083401660', 'Moro', 1, '2018-08-15 10:29:44'),
(105, 'New Raja Autos', '03023054526', 'Maldasi chock Shezad Pur', 1, '2018-08-16 13:12:16'),
(106, 'Ustand chand Autos (Ghulam Ali)', '03332801441', 'T.M.K', 1, '2018-08-19 07:30:42'),
(107, 'Qazi Autos ', '03072192145', 'Noshero ', 1, '2018-08-26 08:06:15'),
(108, 'Khalid Autos', '03070323287', 'Nawab Shah buchaeri', 1, '2018-08-30 09:50:13'),
(109, 'Adil Akber Autos', '03133613305', 'Nawab Shah', 1, '2018-09-01 11:44:01'),
(110, 'Tawakal Autos', '03363320709', 'umer kot ', 1, '2018-09-03 13:08:54'),
(111, 'New Adil Autos', '03083401660', 'Moro', 1, '2018-09-23 12:48:25'),
(112, 'Abid Autos', '03123832697', 'Tando alayar', 1, '2018-09-24 13:00:03'),
(113, 'Super Somroo Autos', '03033441660', 'Nawab Shah', 1, '2018-09-25 14:29:37'),
(114, 'New Waqas Autos', '03103036146', 'T.M.K', 1, '2018-10-01 11:56:33'),
(115, 'M.A AUTOS', '03073766461', 'TANDO ADAM', 1, '2018-10-10 16:51:31'),
(116, 'Japan Autos ', '03362802804', 'T.M.K', 1, '2018-11-06 12:06:41'),
(117, 'STAR AUTOS', '03313525625', 'HIRABAD HYDERABAD', 1, '2018-11-11 14:26:43'),
(118, 'Faizan Autos', '03138792087', 'Tando M.Khan', 1, '2018-11-12 10:43:36'),
(119, 'Jeye Sufi Autos', '03023455695', 'Shezad Pur', 1, '2018-12-01 11:11:40'),
(120, 'Ameer Hamza Autos', '03313643328', 'Thatta', 1, '2018-12-16 10:26:42'),
(121, 'Farhan Autos', '03038600323', 'Mirpur Mathelo', 1, '2018-12-19 10:30:15'),
(122, 'Diffrance closing 2018', '', '', 1, '2019-01-05 14:40:07'),
(123, 'RAJA AUTOS', '03443248844', 'Sanghar', 1, '2019-01-29 10:01:16'),
(124, 'Tahiri Autos', '03048869033', 'Kundri', 1, '2019-02-04 12:17:34'),
(125, 'Asad Autos', '03130038595', 'Nasar Pur', 1, '2019-02-14 09:30:11'),
(126, 'New Amir Autos', '03013453893', 'Kundri Busta', 1, '2019-02-26 07:07:20'),
(127, 'Happy Autos', '034582000056', 'Khair Pur Nathin shah', 1, '2019-03-10 13:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payment`
--

CREATE TABLE `customer_payment` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `datetime_added` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_payment`
--

INSERT INTO `customer_payment` (`id`, `customer_id`, `datetime_added`, `amount`, `type`, `account_id`, `details`, `status`, `ts`) VALUES
(1, 53, '2019-04-04 18:14:00', '100.00', 0, 4, 'Payment againset Sales #20330', 1, '2019-04-04 13:15:57'),
(3, 53, '2019-04-04 18:22:00', '240.00', 0, 4, 'Payment againset Sales #20332', 1, '2019-04-04 13:22:40'),
(4, 99, '2019-04-04 18:45:00', '1500.00', 0, 4, 'Payment againset Sales #20333', 1, '2019-04-04 13:47:14'),
(5, 99, '2019-04-05 18:44:00', '720.00', 0, 4, 'Payment againset Sales #20334', 1, '2019-04-05 13:45:20'),
(6, 53, '2021-09-13 21:42:00', '140.00', 0, 4, 'Payment againset Sales #1', 1, '2021-09-13 16:47:28'),
(7, 53, '2021-09-13 22:50:00', '330.00', 0, 4, 'Payment againset Sales #2', 1, '2021-09-13 17:51:17'),
(8, 99, '2021-09-13 23:15:00', '1250.00', 0, 4, 'Payment againset Sales #3', 1, '2021-09-13 18:21:35'),
(9, 53, '2021-09-14 19:16:00', '120.00', 0, 4, 'Payment againset Sales #4', 1, '2021-09-14 14:16:41'),
(10, 99, '2021-09-15 19:41:00', '240.00', 0, 4, 'Payment againset Sales #5', 1, '2021-09-15 14:41:49'),
(11, 53, '2021-09-15 19:52:00', '680.00', 0, 4, 'Payment againset Sales #6', 1, '2021-09-15 14:54:28'),
(12, 53, '2021-09-15 20:35:00', '220.00', 0, 4, 'Payment againset Sales #7', 1, '2021-09-15 15:36:58'),
(13, 0, '2021-09-20 16:49:00', '450.00', 0, 4, 'Payment againset Sales #8', 1, '2021-09-20 15:34:20'),
(14, 25, '2021-09-24 20:44:00', '520.00', 0, 4, 'Payment againset Sales #9', 1, '2021-09-24 15:45:21'),
(15, 43, '2021-09-24 20:45:00', '600.00', 0, 4, 'Payment againset Sales #11', 1, '2021-09-24 15:47:28'),
(16, 112, '2021-09-24 20:47:00', '220.00', 0, 4, 'Payment againset Sales #12', 1, '2021-09-24 15:47:55'),
(17, 10, '2021-09-24 20:50:00', '290.00', 0, 4, 'Payment againset Sales #13', 1, '2021-09-24 15:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance`
--

CREATE TABLE `employee_attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `checked_in` datetime DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_attendance`
--

INSERT INTO `employee_attendance` (`id`, `employee_id`, `date`, `checked_in`, `checked_out`) VALUES
(1, 1, '2019-04-06', '2019-04-06 16:17:36', NULL),
(2, 1, '2019-04-05', '2019-04-06 16:20:22', NULL),
(3, 14, '2019-04-05', '2019-04-06 16:20:22', NULL),
(4, 1, '2019-04-04', '2019-04-06 16:23:58', NULL),
(5, 14, '2019-04-04', '2019-04-06 16:23:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_daily_attendance`
--

CREATE TABLE `employee_daily_attendance` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `taken_by` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_daily_attendance`
--

INSERT INTO `employee_daily_attendance` (`id`, `date`, `taken_by`, `status`, `ts`) VALUES
(1, '2019-04-06', 1, 1, '2019-04-06 11:17:36'),
(2, '2019-04-05', 1, 1, '2019-04-06 11:20:22'),
(3, '2019-04-04', 1, 1, '2019-04-06 11:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `datetime_added` datetime NOT NULL,
  `expense_category_id` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `datetime_added`, `expense_category_id`, `account_id`, `details`, `amount`, `added_by`, `status`, `ts`) VALUES
(1, '2019-04-03 00:18:00', '3', 3, '', '2000.00', 1, 1, '2019-04-02 19:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`id`, `title`, `status`, `ts`) VALUES
(1, 'Office Expense', 1, '2018-07-20 12:39:02'),
(2, 'Milk and Tea', 1, '2018-01-18 13:26:28'),
(3, 'Daily Expense', 1, '2018-01-18 13:26:37'),
(4, 'House Rent', 1, '2018-01-18 13:27:17'),
(5, 'Utility Bills', 1, '2018-01-18 13:27:26'),
(6, 'Internet Expense', 1, '2018-01-18 13:27:42'),
(7, 'House Monthly', 1, '2018-01-19 03:27:59'),
(9, 'Transport', 1, '2018-02-14 03:53:27'),
(11, 'Shahzeen School Fees', 1, '2018-02-14 04:03:35'),
(12, 'Family Expense', 1, '2018-11-11 14:45:48'),
(13, 'Saeed/Sabahat', 1, '2018-02-14 04:17:13'),
(14, 'Gifts', 1, '2018-02-14 04:19:41'),
(16, 'Professional Fees', 1, '2018-11-11 14:40:53'),
(17, 'Miscellaneous', 1, '2018-03-15 14:36:50'),
(18, 'Refund', 1, '2018-04-07 16:40:20'),
(19, 'Goods Purchasing', 1, '2018-05-07 14:47:33'),
(20, 'Commission on Projects', 1, '2018-07-02 22:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `is_working_day` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '0:simple;1:group',
  `title` varchar(100) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `name_in_urdu` varchar(200) NOT NULL,
  `name_in_urdu_text` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `low_stock_quantity` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `type`, `title`, `unit_price`, `quantity`, `name_in_urdu`, `name_in_urdu_text`, `low_stock_quantity`, `status`, `ts`) VALUES
(11, 0, 'Mud Flapper Screw  Black (A.J)', '1.10', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.J)', 5000, 1, '2017-02-16 11:39:03'),
(310, 0, 'Bolt Hex Fixed Washer (6x20) (A.B.I)', '2.60', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 3725, 1, '2017-03-17 14:08:12'),
(15, 0, 'Seat Belt Screw K.D.M (T.T)', '3.00', 850, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ(T.T)K.D.M', 0, 1, '2017-03-11 18:14:06'),
(16, 0, 'Assembly Screw (5x20) (A.J)', '1.30', 50, '', 'Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™ÂˆÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.J) ', 0, 1, '2017-03-11 18:14:58'),
(17, 0, 'Assembly Screw (5x20) (A.B.I)', '0.80', 3719, '', 'Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.B.I) ', 0, 1, '2017-03-11 18:15:29'),
(18, 0, 'Assembly Screw (5x20) (T.T)', '0.90', 33, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (T.T) ', 0, 1, '2017-03-11 18:16:05'),
(19, 0, 'Assembly Screw (5x25) (A.J)', '1.50', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (A.J) ', 0, 1, '2017-03-11 18:17:46'),
(20, 0, 'Assembly Screw (5x25) (A.B.I)', '1.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (A.B.I) ', 0, 1, '2017-03-11 18:18:26'),
(21, 0, 'Assembly Screw (5x25) (T.T)', '1.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (T.T) ', 0, 1, '2017-03-11 18:19:32'),
(22, 0, 'Assembly Screw (5x30) (A.J)', '1.70', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§ (A.J) ', 0, 1, '2017-03-11 18:21:07'),
(23, 0, 'Assembly Screw (5x30) (A.B.I)', '1.60', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I) ', 0, 1, '2017-03-11 18:23:17'),
(24, 0, 'Assembly Screw (5x30) (T.T)', '1.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§ (T.T) ', 0, 1, '2017-03-11 18:24:10'),
(25, 0, 'Assembly Lever Screw +Nut(A.J)', '2.40', 9314, '', ' Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(A.J)', 0, 1, '2017-03-11 18:25:52'),
(26, 0, 'Assembly Lever Screw +Nut(A.B.I)', '2.40', -1074, '', ' Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(A.B.I)', 0, 1, '2017-03-11 18:26:15'),
(27, 0, 'Assembly Lever Screw +Nut(T.T)', '2.60', -389, '', ' Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(T.T)', 0, 1, '2017-03-11 19:11:57'),
(28, 0, 'CSK Screw (6x15) (T.T)', '1.10', 16500, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(A.B.I)', 0, 1, '2017-03-11 19:12:25'),
(29, 0, 'CSK Screw (6x15) (A.J)', '1.00', 0, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(T.T)', 0, 1, '2017-03-11 19:13:15'),
(30, 0, 'Carborator Tapa Screw (4x15) (A.J)', '0.60', 0, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2017-03-11 19:15:56'),
(31, 0, 'Carborator Tapa Screw (4x15) (A.B.I)', '0.60', 1000, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (T.T)', 0, 1, '2017-03-11 19:17:00'),
(32, 0, 'Carborator Tapa Screw (4x20) (A.J)', '0.80', 0, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.J)', 0, 1, '2017-03-11 19:17:39'),
(33, 0, 'Flat Screw (5x12) (A.B.I)', '1.00', 1800, '', 'Ã™ÂÃ™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (5x12) (A.B.I)', 2500, 1, '2017-03-13 11:14:51'),
(34, 0, 'Handle Lock Screw (6x12) (A.J)', '1.00', 11300, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ Ã™Â„Ã˜Â§ÃšÂ© Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.J)', 0, 1, '2017-03-13 11:15:34'),
(35, 0, 'Handle Lock Screw (6x12) (A.B.I)', '1.00', 200, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ Ã™Â„Ã˜Â§ÃšÂ© Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2017-03-13 11:16:11'),
(36, 0, 'Meter Cable Screw  (5x15) (A.J)', '1.00', 18900, '', 'Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã›ÂŒÃ˜Â¨Ã™Â„ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.J)', 0, 1, '2017-03-13 11:16:46'),
(37, 0, 'Meter Cable Screw  (5x15) (A.B.I)', '0.80', 0, '', 'Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã›ÂŒÃ˜Â¨Ã™Â„ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 1000, 1, '2017-03-13 11:17:20'),
(38, 0, 'Cut Screw (8x1/2) (A.B.I)', '0.50', 0, '', 'ÃšÂ©Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (8x1/2) (A.B.I)', 0, 1, '2017-03-13 11:18:43'),
(39, 0, 'Cut Screw (8x3/8) (A.B.I)', '0.50', 900, '', 'ÃšÂ©Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (8x3/8) (A.B.I)', 8000, 1, '2017-03-13 11:19:14'),
(40, 0, 'Carborator Tapa Screw (4x20) (A.B.I)', '0.70', 500, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§ (A.B.I)', 8000, 1, '2017-03-13 11:55:28'),
(41, 0, 'CSK Screw (6x15) (A.B.I)', '1.00', 0, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I) ', 5000, 1, '2017-03-13 12:01:23'),
(42, 0, 'Mud Flapper Screw  Black (A.B.I)', '1.20', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-13 12:04:18'),
(43, 0, 'Mud Flapper Screw Wht(AJ)', '1.00', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-13 12:04:27'),
(44, 0, 'Seat Belt Screw Chrome (A.B.I)', '3.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (A.B.I)', 0, 1, '2017-03-13 12:05:24'),
(45, 0, 'Flat Screw (5x12) (A.J)', '1.00', 0, '', 'Ã™ÂÃ™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (5x12) (A.J)', 0, 1, '2017-03-13 12:06:40'),
(46, 0, 'Pen Head Screw (4x25) (A.J)', '0.90', 0, '', 'Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x25) (A.J)', 0, 1, '2017-03-13 12:08:37'),
(47, 0, 'Pen Head Screw (4x25) (A.B.I)', '0.80', 0, '', ' Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x25) (A.B.I)', 0, 1, '2017-03-13 12:08:52'),
(48, 0, 'Pen Head Screw (4x30) (A.J)', '1.00', 0, '', ' Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x30) (A.J)', 0, 1, '2017-03-13 12:09:03'),
(49, 0, 'Pen Head Screw (4x30) (A.B.I)', '1.00', 3400, '', ' Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x30) (A.B.I)', 0, 1, '2017-03-13 12:09:14'),
(50, 0, 'Roller Bolt Washer Silver (T.T)', '0.60', 1400, '', 'Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± (T.T) ', 0, 1, '2017-03-13 12:09:39'),
(51, 0, 'Head Washer No.10 Silver (T.T)', '0.80', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± (T.T)', 0, 1, '2017-03-13 12:10:12'),
(52, 0, 'Brake Spring 125  White(A.B.I)', '8.00', 0, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (125) Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-13 12:10:33'),
(53, 0, 'Brake Spring 125 White(T.T)', '6.00', 0, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (125) Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-13 12:10:53'),
(54, 0, 'Horn Patti (A.B.I)', '5.00', 640, '', 'Ã›ÂÃ˜Â§Ã˜Â±Ã™Â† Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 12:11:11'),
(55, 0, 'Horn Patti (T.T)', '3.00', 0, '', ' Ã›ÂÃ˜Â§Ã˜Â±Ã™Â† Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 12:11:36'),
(56, 0, 'Chain Lock 420  (A.B.I)', '3.75', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† Ã™Â„Ã˜Â§ÃšÂ© (A.B.I) 420', 0, 1, '2017-03-13 12:11:56'),
(1157, 0, 'Chain Lock 428  (A.B.I)', '4.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† Ã™Â„Ã˜Â§ÃšÂ© (A.B.I) 428', 0, 1, '2017-03-18 15:12:03'),
(58, 0, 'Moon PAtti 125 (A.B.I)', '7.00', 0, '', ' ÃšÂ†Ã˜Â§Ã™Â†Ã˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I) 125 ', 0, 1, '2017-03-13 12:12:29'),
(59, 0, 'Seat Frame Patti (A.B.I)Set', '15.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã™ÂÃ˜Â±Ã›ÂŒÃ™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 12:12:52'),
(60, 0, 'Seat Frame Patti (T.T)Set', '15.00', 140, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã™ÂÃ˜Â±Ã›ÂŒÃ™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 1000, 1, '2017-03-13 12:12:59'),
(61, 0, 'Bolt Hex (10x20) (A.B.I)', '3.60', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-13 12:13:19'),
(62, 0, 'Bolt Hex (10x20) (T.T)', '3.00', 2150, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 500, 1, '2017-03-13 12:13:25'),
(63, 0, 'Rear Foot Rest Bolt Hex (10x25) (A.B.I)', '4.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(A.B.I) ', 0, 1, '2017-03-13 12:13:31'),
(64, 0, 'Bolt Hex (10x25) (T.T)', '3.40', 1400, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(T.T) ', 0, 1, '2017-03-13 12:13:39'),
(65, 0, 'Bolt Hex (10x30) (A.B.I)', '4.40', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I) ', 0, 1, '2017-03-13 12:13:44'),
(66, 0, 'Bolt Hex (10x30) (T.T)', '3.40', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T) ', 250, 1, '2017-03-13 12:13:50'),
(67, 0, 'Head Stud C.D (T.T)(4 piecs)', '40.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T) C.D', 0, 1, '2017-03-13 12:13:57'),
(68, 0, 'Head Stud C.D (A.B.I)(4 piecs)', '60.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (A.B.I) C.D', 0, 1, '2017-03-13 12:14:02'),
(69, 0, 'Head Stud China (T.T)(4 piecs)', '40.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T) China', 0, 1, '2017-03-13 12:14:09'),
(70, 0, 'Head Stud China (A.B.I)(4 piecs)', '60.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T) China', 0, 1, '2017-03-13 12:14:17'),
(71, 0, 'Front Fork Cap Nut (T.T)', '30.00', 145, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹(T.T) ', 0, 1, '2017-03-13 12:14:26'),
(72, 0, 'Handle Chek Nut CD (A.B.I)', '50.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹ CD (A.B.I)', 0, 1, '2017-03-13 12:14:47'),
(73, 0, 'Handle Chek Nut CD (T.T)', '34.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹CD (T.T)', 0, 1, '2017-03-13 12:15:08'),
(74, 0, 'Handle Chek Nut 125 (A.B.I)', '50.00', 10, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹ 125 (A.B.I)', 0, 1, '2017-03-13 12:15:23'),
(75, 0, 'Handle Chek Nut 125 (T.T)', '40.00', 3, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹ 125 (T.T) ', 0, 1, '2017-03-13 12:15:40'),
(76, 0, 'Rear Axle Nut 125 (T.T)', '12.00', 0, '', ' Ã™Â¾ÃšÂ†Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹ (T.T)125 ', 0, 1, '2017-03-13 12:16:03'),
(77, 0, 'Rear Axle Nut 125 (ABI)', '14.00', 0, '', ' Ã™Â¾ÃšÂ†Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹ (ABI)125 ', 0, 1, '2017-03-13 12:16:20'),
(78, 0, 'Cut Screw  (6x1/2) (A.B.I)', '0.50', 1600, '', 'ÃšÂ©Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (6x1/2) (A.B.I)', 0, 1, '2017-03-13 13:10:53'),
(79, 0, 'Meter Body Screw (A.B.I)', '0.60', 3700, '', ' Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã˜Â§ÃšÂˆÃ›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I) ', 5000, 1, '2017-03-13 13:11:38'),
(80, 0, 'Indicator Screw (A.B.I)', '0.40', 3700, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 10000, 1, '2017-03-13 13:11:45'),
(81, 0, 'Back Light Cover Screw (A.B.I)', '0.30', 1400, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I) ', 22000, 1, '2017-03-13 13:11:51'),
(82, 0, 'Back Light Screw Old Model (A.B.I)', '1.00', 100, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â¾Ã˜Â±Ã˜Â§Ã™Â†Ã›Â Ã™Â…Ã˜Â§ÃšÂˆÃ™Â„ (A.B.I)', 0, 1, '2017-03-13 13:12:09'),
(88, 0, 'Front Sprocket Lock 125 (A.B.I)', '5.00', 0, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã›ÂŒ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ ÃšÂ©Ã˜Â§ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 125 (A.B.I)', 0, 1, '2017-03-13 13:21:08'),
(89, 0, 'Front Wheel Bongli (A.B.I)', '12.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:21:34'),
(90, 0, 'Front Wheel Bongli (T.T)', '13.00', 130, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:21:58'),
(91, 0, 'Rear Wheel Bongli (A.B.I)', '16.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:22:20'),
(92, 0, 'Rear Wheel Bongli (T.T)', '15.00', 30, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:22:36'),
(93, 0, 'Indicator Patti (A.B.I)', '6.50', 240, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:23:31'),
(94, 0, 'Indicator Patti (T.T)', '6.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:23:50'),
(95, 0, 'Z Patti Small (A.B.I)', '3.00', 0, '', 'Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:24:07'),
(96, 0, 'Z Patti Small (T.T)', '2.40', 1700, '', 'Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:24:23'),
(97, 0, 'L Patti Small (A.B.I)', '3.00', 0, '', 'Ã˜Â§Ã›ÂŒÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:24:40'),
(98, 0, 'L Patti Small (T.T)', '2.40', 1700, '', 'Ã˜Â§Ã›ÂŒÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:24:55'),
(99, 0, 'Z Patti Golden Large (A.B.I)', '7.50', 0, '', 'Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ  Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I) ', 0, 1, '2017-03-13 13:25:20'),
(100, 0, 'Z Patti Golden Large  (T.T)', '6.50', 120, '', ' Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 0, 1, '2017-03-13 13:26:11'),
(105, 0, 'Career Patti (Flower) (A.B.I)', '6.50', 500, '', ' Ã™Â¾ÃšÂ¾Ã™ÂˆÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:26:36'),
(110, 0, 'Career Patti (Flower) (T.T)', '6.50', 0, '', ' Ã™Â¾ÃšÂ¾Ã™ÂˆÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:27:10'),
(113, 0, 'Switch Patti (A.B.I)', '2.00', 0, '', 'Ã˜Â³Ã™Âˆ Ã˜Â¦ÃšÂ† Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-13 13:29:11'),
(114, 0, 'Switch Patti (T.T)', '2.00', 600, '', ' Ã˜Â³Ã™Âˆ Ã˜Â¦ÃšÂ† Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-13 13:29:28'),
(115, 0, 'Silencer Packing Copper (A.B.I)', '2.60', 450, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„ (A.B.I) ', 1000, 1, '2017-03-13 13:29:55'),
(116, 0, 'Silencer Packing Local (T.T)', '1.20', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â Ã™Â„Ã™ÂˆÃšÂ©Ã™Â„ (T.T) ', 0, 1, '2017-03-13 13:30:17'),
(117, 0, 'Rickshaw Washer (T.T)', '0.50', 0, '', ' Ã˜Â±ÃšÂ©Ã˜Â´Ã›Â Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±(T.T)', 0, 1, '2017-03-13 13:30:33'),
(118, 0, 'Plain Washer (17x26x3) (A.B.I)', '2.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂº Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ(A.B.I) ', 0, 1, '2017-03-13 13:31:28'),
(119, 0, 'Rear Shock Washer (10x25x3)(K.D.M)', '1.60', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ(K.D.M) ', 0, 1, '2017-03-13 13:31:50'),
(120, 0, 'Plain Washer (10x20x3) (T.T)', '1.20', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â± Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ(T.T) ', 0, 1, '2017-03-13 13:32:31'),
(121, 0, 'Brake Spring Golden (A.B.I)', '6.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-13 13:32:49'),
(122, 0, 'Brake Spring Golden (T.T)', '5.00', 420, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 500, 1, '2017-03-13 13:33:06'),
(123, 0, 'Brake Spring White (A.B.I)', '8.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-13 13:34:40'),
(124, 0, 'Brake Spring White (T.T)', '7.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-13 13:34:54'),
(125, 0, 'Side Stand Spring Golden (A.B.I)', '10.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-13 13:35:13'),
(126, 0, 'Side Stand Spring Golden (T.T)', '10.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 750, 1, '2017-03-13 13:35:29'),
(131, 0, 'Side Stand Spring White (A.B.I)', '10.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-13 13:35:58'),
(149, 0, 'Side Stand Spring White (T.T)', '10.00', 10, '', 'Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-13 13:38:20'),
(150, 0, 'Main Stand Spring Golden (A.B.I)', '11.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-13 13:39:01'),
(151, 0, 'Main Stand Spring Golden (T.T)', '10.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 750, 1, '2017-03-13 13:39:17'),
(152, 0, 'Main Stand Spring White (A.B.I)', '11.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-13 13:39:49'),
(153, 0, 'Main Stand Spring White (T.T)', '10.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-13 13:40:05'),
(154, 0, 'Clutch Spring (A.B.I)', '6.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (A.B.I)', 0, 1, '2017-03-13 13:40:27'),
(155, 0, 'Clutch Spring (T.T)', '6.00', 250, '', ' ÃšÂ©Ã™Â„ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (T.T)', 0, 1, '2017-03-13 13:40:45'),
(156, 0, 'Brake Switch Spring (A.B.I)', '3.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â³Ã™ÂˆÃ˜Â¦ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (A.B.I)', 0, 1, '2017-03-13 13:41:04'),
(157, 0, 'Brake Switch Spring (T.T)', '3.50', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â³Ã™ÂˆÃ˜Â¦ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (T.T)', 0, 1, '2017-03-13 13:41:23'),
(158, 0, 'Oil Bolt Washer Silver CD (T.T)', '1.00', 0, '', ' Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± CD (T.T)', 0, 1, '2017-03-13 13:41:38'),
(159, 0, 'Front Axle Nut (A.B.I)', '7.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹(A.B.I)', 0, 1, '2017-03-13 13:43:00'),
(160, 0, 'Front Axle Nut (T.T)', '7.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã˜Â§Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹(T.T)', 0, 1, '2017-03-13 13:43:26'),
(161, 0, 'Rear Axle Nut Hex (A.B.I)', '8.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã˜Â¨Ã˜ÂºÃ›ÂŒÃ˜Â± ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I) ', 0, 1, '2017-03-13 13:43:36'),
(162, 0, 'Rear Axle Nut Hex (T.T)', '7.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã˜Â¨Ã˜ÂºÃ›ÂŒÃ˜Â± ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T) ', 0, 1, '2017-03-13 13:43:46'),
(163, 0, 'Rear Axle Nut Coller (A.B.I)', '9.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-13 13:43:58'),
(164, 0, 'Rear Axle Nut Coller (T.T)', '8.00', 40, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2017-03-13 13:44:03'),
(165, 0, 'Center Axle Lock Nut (10mm) (A.B.I)', '4.50', 100, '', ' ÃšÂ†Ã™Â…Ã™Â¹Ã›Â Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â¹ (A.B.I)', 0, 1, '2017-03-13 13:44:12'),
(166, 0, 'Nut Flange (5mm) (A.B.I)', '0.80', 0, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±8 (A.B.I)', 2500, 1, '2017-03-13 13:44:17'),
(167, 0, 'Nut Flange (6mm) (A.B.I)', '0.90', 100, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (A.B.I)', 0, 1, '2017-03-13 13:44:22'),
(169, 0, 'Nut Flange (8mm) (A.B.I)', '1.50', 900, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12 (A.B.I)', 0, 1, '2017-03-13 13:44:28'),
(1165, 1, 'Assembly Screw (5x20) (A.B.I)', '80.00', 37, '', 'Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.B.I) ', 0, 1, '2017-03-20 14:55:13'),
(1166, 1, 'Assembly Screw (5x20) (T.T)', '90.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (T.T) ', 0, 1, '2017-03-20 14:55:13'),
(1167, 1, 'Assembly Screw (5x25) (A.J)', '150.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (A.J) ', 0, 1, '2017-03-20 14:55:13'),
(1168, 1, 'Assembly Screw (5x25) (A.B.I)', '100.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (A.B.I) ', 0, 1, '2017-03-20 14:55:13'),
(1169, 1, 'Assembly Screw (5x25) (T.T)', '100.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (T.T) ', 0, 1, '2017-03-20 14:55:13'),
(1164, 1, 'Assembly Screw (5x20) (A.J)', '130.00', 0, '', 'Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™ÂˆÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.J) ', 0, 1, '2017-03-20 14:55:13'),
(180, 0, 'Nut Flange (10mm) (A.B.I)', '2.40', 2250, '', 'ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-03-13 13:49:29'),
(181, 0, 'Nut Flange (12mm) (A.B.I)', '4.40', 0, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±17 (A.B.I)', 0, 1, '2017-03-13 13:49:35'),
(182, 0, 'Nut Flange (14mm) (T.T)', '2.00', 0, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±19 (T.T)', 0, 1, '2017-03-13 13:49:41'),
(1163, 1, 'Seat Belt Screw K.D.M (T.T)', '150.00', 17, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ(T.T)K.D.M', 0, 1, '2017-03-20 14:55:13'),
(185, 0, 'Rear Shock Cap Nut (10x17) (A.B.I)', '6.00', 16, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (A.B.I)', 0, 1, '2017-03-13 13:50:42'),
(187, 0, 'Rear Shock Cap Nut (10x17) (T.T)', '4.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (T.T)', 0, 1, '2017-03-13 13:50:57'),
(188, 0, 'Rear Shock Cap Nut (10x14) (A.B.I)', '4.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (A.B.I)', 0, 1, '2017-03-13 13:51:03'),
(189, 0, 'Rear Shock Cap Nut (10x14) (T.T)', '3.20', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (T.T)', 0, 1, '2017-03-13 13:51:09'),
(191, 0, 'Flange Cap Nut Long 6mm A.B.I', '3.50', 0, '', ' Ã™Â„Ã™ÂˆÃ™Â†ÃšÂ¯ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-13 13:51:16'),
(192, 0, 'Flange Cap Nut Long 6mm T.T', '3.00', 11400, '', ' Ã™Â„Ã™ÂˆÃ™Â†ÃšÂ¯ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-13 13:51:58'),
(194, 0, 'Flange Cap Nut Small (6mm) (A.B.I)', '3.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â§Ã™Â„ (A.B.I)', 0, 1, '2017-03-13 13:52:04'),
(195, 0, 'Meter Cap Nut (6mm) (A.B.I)', '1.80', 1600, '', ' ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã˜Â§(A.B.I)', 0, 1, '2017-03-13 13:52:09'),
(197, 0, 'Meter Cap Nut (6mm) (T.T)', '1.10', 1000, '', ' ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã˜Â§(T.T)', 0, 1, '2017-03-13 13:52:14'),
(198, 0, 'Head Light Case Nut (A.B.I)', '4.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã™Â†Ã™Â¹ ÃšÂ©ÃšÂ¾Ã™ÂˆÃ™Â¾ÃšÂ‘Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I) ', 0, 1, '2017-03-13 13:52:20'),
(199, 0, 'Side Stand Nut(10x17) (A.B.I)', '2.20', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â†Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã˜Â§(A.B.I)', 0, 1, '2017-03-13 13:52:25'),
(201, 0, 'Nut Hex No.13 (8x13) (A.B.I)', '1.20', 400, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 (A.B.I)', 2500, 1, '2017-03-13 13:52:34'),
(204, 0, 'Nut Hex No.13 (8x13) (T.T)', '1.20', 0, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 (T.T)', 0, 1, '2017-03-13 14:00:16'),
(205, 0, 'Nut Hex No.14 (10x14) (A.B.I)', '1.80', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-03-13 14:00:23'),
(206, 0, 'Nut Hex No.14 (10x14) (T.T)', '1.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (T.T)', 0, 1, '2017-03-13 14:01:02'),
(207, 0, 'Nut Hex (6mm) (A.B.I)', '0.60', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (A.B.I)', 5000, 1, '2017-03-13 14:01:09'),
(208, 0, 'Nut Hex (6mm) (T.T)', '0.55', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (T.T)', 0, 1, '2017-03-13 14:01:15'),
(209, 0, 'Nut Hex (5mm) (A.B.I)', '0.40', 7000, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±8 (A.B.I)', 0, 1, '2017-03-13 14:01:20'),
(210, 0, 'Nut Hex (5mm) (T.T)', '0.40', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±8 (T.T)', 0, 1, '2017-03-13 14:01:26'),
(211, 0, 'Main Stand Pin Nut (12x17) (A.B.I)', '5.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹(12x17) (A.B.I)', 0, 1, '2017-03-13 14:01:32'),
(212, 0, 'Main Stand Pin Nut (12x19) (A.B.I)', '3.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹(12x19) (A.B.I)', 0, 1, '2017-03-13 14:01:38'),
(213, 0, 'Nut Hex (4mm) (A.B.I)', '0.35', 25000, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 6 Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ (A.B.I)', 0, 1, '2017-03-13 14:01:44'),
(214, 0, 'Nut Hex (4mm) (T.T)', '0.30', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 6 Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ (T.T)', 0, 1, '2017-03-13 14:01:49'),
(215, 0, 'Front Fork Cap Nut (A.B.I)', '32.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹(A.B.I) ', 0, 1, '2017-03-13 14:01:55'),
(1162, 1, 'Mud Flapper Screw  Black (A.J)', '110.00', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:13'),
(218, 0, 'Oil Bolt Washer Silver 110 (T.T)', '1.00', 300, '', 'Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± 110 (T.T)', 0, 1, '2017-03-17 13:20:36'),
(219, 0, 'Chrome Washer (10mm)(A.B.I)', '3.00', 0, '', 'ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-03-17 13:22:12'),
(220, 0, 'Chrome Washer (10mm)(T.T)', '3.00', 200, '', ' ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (T.T)', 0, 1, '2017-03-17 13:22:22'),
(221, 0, 'Chawani Washer Wht T.T Gross', '40.00', 6, '', ' ÃšÂ†Ã™ÂˆÃ™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T) ÃšÂ¯Ã˜Â±Ã™ÂˆÃ˜Â³', 0, 1, '2017-03-17 13:25:09'),
(222, 0, 'Washer No.10 Small White (T.T)(Gross) ', '18.00', 0, '', ' Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)ÃšÂ¯Ã˜Â±Ã™ÂˆÃ˜Â³', 0, 1, '2017-03-17 13:25:45'),
(223, 0, 'Washer No.8 Small White (T.T)(Gross)', '15.00', 190, '', ' Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 8 ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)ÃšÂ¯Ã˜Â±Ã™ÂˆÃ˜Â³', 0, 1, '2017-03-17 13:25:57'),
(224, 0, 'Spring Washer (6mm)(A.B.I)', '0.50', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± (A.B.I) 10', 0, 1, '2017-03-17 13:26:08'),
(225, 0, 'Spring Washer (6mm)(T.T)', '0.40', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± (T.T)10 ', 0, 1, '2017-03-17 13:26:20'),
(226, 0, 'Spring Washer (8mm) (A.B.I)', '0.70', 8500, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12 (A.B.I) ', 2500, 1, '2017-03-17 13:27:35'),
(227, 0, 'Spring Washer (8mm) (T.T)Gross', '0.42', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (T.T) ', 0, 1, '2017-03-17 13:27:46'),
(228, 0, 'Spring Washer (10mm)(A.B.I)Gross ', '0.55', 1, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (A.B.I)', 2500, 1, '2017-03-17 13:28:05'),
(229, 0, 'Spring Washer (10mm) (T.T)', '0.80', 1100, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (T.T)', 0, 1, '2017-03-17 13:31:22'),
(230, 0, 'Spring Washer (12mm) (A.B.I)', '1.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (A.B.I)', 1000, 1, '2017-03-17 13:32:26'),
(231, 0, 'Spring Washer (12mm) (T.T)Gross', '0.69', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (T.T)', 0, 1, '2017-03-17 13:32:44'),
(232, 0, 'Plain Washer Head (6x13x2) (T.T)', '0.50', 100, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (T.T)', 0, 1, '2017-03-17 13:32:56'),
(233, 0, 'Plain Washer (6x17x2) (A.B.I)', '0.50', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-17 13:33:11'),
(234, 0, 'Plain Washer (6x24x2) (A.B.I)', '1.00', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã˜Â¨ÃšÂ‘Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-17 13:33:26'),
(235, 0, 'Plain Washer (8x17x2) (A.B.I)', '0.50', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (A.B.I) ', 0, 1, '2017-03-17 13:33:37'),
(236, 0, 'Plain Washer (10x20x2) (A.B.I)', '0.70', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I) ', 0, 1, '2017-03-17 13:33:52'),
(237, 0, 'Plain Washer (12x27x2) (A.B.I)', '1.50', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±17Ã™Â¾Ã˜ÂªÃ™Â„Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-17 13:34:07'),
(238, 0, 'Plain Washer (12x27x3) (A.B.I)', '2.00', 200, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±17Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-17 13:34:22'),
(239, 0, 'Spacer Washer (A.B.I)', '2.60', 0, '', 'Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã›ÂŒ Ã˜Â§Ã™Â†Ã˜Â¯ Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±(A.B.I) ', 0, 1, '2017-03-17 13:39:04'),
(240, 0, 'Sprocket Patti (A.B.I)', '1.90', 2880, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã™Â¾Ã™Â¹Ã›ÂŒ(A.B.I)', 0, 1, '2017-03-17 13:39:16'),
(241, 0, 'Sprocket Patti (T.T)', '1.20', 7200, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã™Â¾Ã™Â¹Ã›ÂŒ(T.T)', 0, 1, '2017-03-17 13:39:28'),
(243, 0, 'Moon Patti CD (A.B.I)', '7.00', 480, '', ' ÃšÂ†Ã˜Â§Ã™Â†Ã˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I) CD ', 0, 1, '2017-03-17 13:40:19'),
(244, 0, 'Wheel Sleeve Bush (A.B.I)', '10.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã™Â„Ã™Âˆ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã˜Â´ (A.B.I) ', 0, 1, '2017-03-17 13:40:45'),
(245, 0, 'Front Wheel Axle Bush (A.B.I)', '15.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã˜Â´(A.B.I)', 0, 1, '2017-03-17 13:40:58'),
(246, 0, 'Rear Wheel Axle Bush (A.B.I)', '18.00', 14, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã˜Â´ (A.B.I) ', 0, 1, '2017-03-17 13:41:09'),
(247, 0, 'Golden Washer No.10 (A.B.I)', '0.60', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (A.B.I)', 0, 1, '2017-03-17 13:41:19'),
(248, 0, 'Golden Washer No.10 (T.T)', '0.50', 18900, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (T.T)', 0, 1, '2017-03-17 13:41:30'),
(249, 0, 'Golden Washer No.12 (A.B.I)', '0.60', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (A.B.I)', 0, 1, '2017-03-17 13:41:39'),
(250, 0, 'Golden Washer No.12 (T.T)', '0.60', 5000, '', 'ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (T.T)', 0, 1, '2017-03-17 13:43:45'),
(251, 0, 'Golden Washer No.14 (A.B.I)', '0.70', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (A.B.I)', 0, 1, '2017-03-17 13:43:55'),
(252, 0, 'Golden Washer No.14 (T.T)', '0.60', 1400, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (T.T)', 0, 1, '2017-03-17 13:44:03'),
(253, 0, 'Golden Washer No.17 (A.B.I)', '0.80', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (A.B.I)', 0, 1, '2017-03-17 13:44:12'),
(254, 0, 'Golden Washer No.17 (T.T)', '0.70', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (T.T)', 0, 1, '2017-03-17 13:44:20'),
(255, 0, 'Fuel Tank Bush (A.B.I)', '6.00', 0, '', ' Ã™Â¹Ã™Â†ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã˜Â´ /ÃšÂˆÃ˜Â§Ã™ÂˆÃ™Â„ (A.B.I)', 0, 1, '2017-03-17 13:44:32'),
(256, 0, 'Front Sprocket Lock CD (A.B.I)', '3.00', 1000, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›ÂŒ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ ÃšÂ©Ã˜Â§ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 CD (A.B.I)', 0, 1, '2017-03-17 13:44:41'),
(257, 0, 'Head Light Bolt Chrome (8x20) (T.T)', '4.50', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (T.T)', 0, 1, '2017-03-17 13:51:02'),
(258, 0, 'Rear Foot Rest Bolt D/W (10x20) (A.B.)', '6.00', 820, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ ÃšÂˆÃ˜Â¨Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.B.I)', 250, 1, '2017-03-17 13:51:13'),
(259, 0, 'Rear Foot Rest Bolt D/W (10x20) (T.T)', '6.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ ÃšÂˆÃ˜Â¨Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (T.T)', 0, 1, '2017-03-17 13:51:23'),
(260, 0, 'Bolt Hex S/W (10x20) (A.B.I)', '5.50', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ Ã˜Â³Ã™Â†ÃšÂ¯Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.B.I)', 1000, 1, '2017-03-17 13:51:32'),
(261, 0, 'Bolt S/W (10x20) (T.T)', '5.00', 400, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ Ã˜Â³Ã™Â†ÃšÂ¯Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (T.T)', 0, 1, '2017-03-17 13:51:42'),
(262, 0, 'Side Stand Bolt (A.B.I)', '8.00', 460, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.B.I)', 0, 1, '2017-03-17 13:51:52'),
(263, 0, 'Side Stand Bolt (T.T)', '8.00', 5, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(T.T)', 0, 1, '2017-03-17 13:52:02'),
(264, 0, 'Front Jump Bolt Set CD(A.B.I)', '28.00', 125, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹(A.B.I) CD', 100, 1, '2017-03-17 13:52:32'),
(265, 0, 'Front Jump Bolt CD(T.T)', '9.00', 2000, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ CD', 0, 1, '2017-03-17 13:52:46'),
(266, 0, 'Front Jump Bolt Set 125(A.B.I)', '48.00', 80, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹(A.B.I) 125', 0, 1, '2017-03-17 13:53:01'),
(267, 0, 'Front Jump Bolt Set 125 (T.T)', '40.00', 0, '', 'Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹(T.T) 125', 0, 1, '2017-03-17 13:55:50'),
(268, 0, 'Front Jump Bolt Set Hero(A.B.I)', '34.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹ Ã›ÂÃ›ÂŒÃ˜Â±Ã™Âˆ(A.B.I) ', 0, 1, '2017-03-17 13:56:00'),
(269, 0, 'Front Jump Bolt Set Hero(T.T)', '32.00', 10, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹ Ã›ÂÃ›ÂŒÃ˜Â±Ã™Âˆ(T.T) ', 0, 1, '2017-03-17 13:56:09'),
(270, 0, 'Bolt Hex 5x12 (A.J)', '0.90', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.J)(P.8)', 0, 1, '2017-03-17 13:56:12'),
(271, 0, 'Engine Oil Bolt CD (A.B.I)', '15.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹CD (A.B.I)', 0, 1, '2017-03-17 13:56:20'),
(272, 0, 'Engine Oil Bolt CD (T.T)', '10.00', 900, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹CD (T.T)', 500, 1, '2017-03-17 13:56:30'),
(273, 0, 'Bolt Hex 5x12 (A.B.I)', '0.80', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.B.I)(P.8)', 0, 1, '2017-03-17 13:56:32'),
(274, 0, 'Engine Oil Bolt 110 (A.B.I)', '15.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹110 (A.B.I)', 400, 1, '2017-03-17 13:56:44'),
(275, 0, 'Engine Oil Bolt 110 (T.T)', '12.00', 250, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹110 (T.T)', 0, 1, '2017-03-17 13:56:55'),
(276, 0, 'Bolt Hex 5x12 (T.T)', '1.00', 100, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(T.T)(P.8)', 0, 1, '2017-03-17 13:56:59'),
(277, 0, 'Wheel Sleeve White (A.B.I)', '30.00', 370, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ (A.B.I) White ', 160, 1, '2017-03-17 13:57:07'),
(278, 0, 'Wheel Sleeve White (T.T)', '15.00', 8, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ (T.T) White ', 0, 1, '2017-03-17 13:57:17'),
(279, 0, 'Bolt Hex 5x15 (A.J)', '1.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.J)', 0, 1, '2017-03-17 13:57:24'),
(280, 0, 'Wheel Sleeve Golden (A.B.I)', '30.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ Golden (A.B.I)', 0, 1, '2017-03-17 13:57:26'),
(281, 0, 'Bolt Hex 5x15 (A.B.I)', '0.90', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 13:58:06'),
(282, 0, 'Wheel Sleeve Golden (T.T)', '15.00', 4, '', 'Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ Golden (T.T)', 0, 1, '2017-03-17 13:58:34'),
(283, 0, 'Wheel Sleeve Foji Color (T.T)', '17.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(T.T)', 500, 1, '2017-03-17 13:58:46'),
(284, 0, 'Chain Adjuster Left (A.B.I)', '8.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ Ã˜Â¨ÃšÂ‘Ã›ÂŒ(A.B.I)', 0, 1, '2017-03-17 13:58:54'),
(285, 0, 'Chain Adjuster Left (T.T)', '8.00', 180, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ Ã˜Â¨ÃšÂ‘Ã›ÂŒ(T.T)', 0, 1, '2017-03-17 13:59:06'),
(286, 0, 'Chain Adjuster Right (A.B.I)', '10.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-17 13:59:14'),
(287, 0, 'Chain Adjuster Right (T.T)', '8.00', 100, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-17 13:59:22'),
(288, 0, 'Brake Rod (A.B.I)', '30.00', 110, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ(A.B.I) ', 0, 1, '2017-03-17 13:59:31'),
(289, 0, 'Brake Rod (T.T)', '18.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ(T.T) ', 0, 1, '2017-03-17 13:59:42'),
(290, 0, 'Main Stand Pin CD(A.B.I)', '65.00', 780, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â†CD (A.B.I)', 0, 1, '2017-03-17 13:59:55'),
(291, 0, 'Main Stand Pin CD(T.T)', '65.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† (T.T)CD', 0, 1, '2017-03-17 14:00:07'),
(292, 0, 'Limiter Pipe Golden (A.B.I)', '26.00', 0, '', 'Ã™Â„Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¾Ã˜Â§Ã˜Â¦Ã™Â¾ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â†(A.B.I)', 0, 1, '2017-03-17 14:01:46'),
(293, 0, 'Limiter Pipe Golden (T.T)', '28.00', 35, '', ' Ã™Â„Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¾Ã˜Â§Ã˜Â¦Ã™Â¾ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â†(T.T)', 0, 1, '2017-03-17 14:01:56'),
(294, 0, 'Front Wheel Axle (A.B.I)', '28.00', 275, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„(A.B.I)', 0, 1, '2017-03-17 14:02:09'),
(295, 0, 'Front Wheel Axle (T.T)', '28.00', 40, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„(T.T)', 0, 1, '2017-03-17 14:02:21'),
(296, 0, 'Rear Wheel Axle (A.B.I)', '40.00', 260, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™ÂˆÃ›ÂŒÃ™Â„(A.B.I)', 0, 1, '2017-03-17 14:02:39'),
(297, 0, 'Rear Wheel Axle (T.T)', '38.00', 0, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™ÂˆÃ›ÂŒÃ™Â„(T.T)', 0, 1, '2017-03-17 14:02:50'),
(298, 0, 'Center Axle (A.B.I)', '35.00', 650, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 14:03:01'),
(299, 0, 'Center Axle (T.T)', '32.00', 0, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â±(T.T)', 0, 1, '2017-03-17 14:03:11'),
(300, 0, 'Silencer Stud (A.B.I)', '8.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (A.B.I)', 1500, 1, '2017-03-17 14:03:21'),
(301, 0, 'Silencer Stud (T.T)', '3.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T)', 2500, 1, '2017-03-17 14:03:29'),
(303, 0, 'Clutch Gundi (T.T)', '3.60', 2100, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ¯Ã™Â†ÃšÂˆÃ›ÂŒ (T.T)', 0, 1, '2017-03-17 14:03:52'),
(304, 0, 'Bolt Hex Fixed Washer (6x6) (A.B.I)', '1.50', 1400, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 14:07:04'),
(305, 0, 'Bolt Hex Fixed Washer (6x6) (T.T)', '1.30', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-17 14:07:21'),
(306, 0, 'Bolt Hex Fixed Washer (6x12) (A.J)', '2.20', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 1000, 1, '2017-03-17 14:07:30'),
(307, 0, 'Bolt Hex Fixed Washer (6x12) (A.B.I)', '1.80', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-17 14:07:37'),
(308, 0, 'Bolt Hex Fixed Washer (6x12) (T.T)', '1.40', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-17 14:07:48'),
(309, 0, 'Bolt Hex Fixed Washer (6x20) (A.J)', '2.80', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-17 14:07:58'),
(311, 0, 'Bolt Hex Fixed Washer (6x20)(T.T)', '2.60', 100, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-17 14:08:22'),
(312, 0, 'Head Light Screw 5x12 (D.Green) (A.J)', '1.10', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 14:08:29'),
(313, 0, 'Head Light Screw 5x12(D.Green)(A.B.I)', '1.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 14:08:38'),
(314, 0, 'Head Light Screw 5x12 (D.Green) (T.T)', '0.90', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 14:10:17'),
(315, 0, 'Head Light Screw 5x12 (Black) (A.J)', '1.30', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.J)', 0, 1, '2017-03-17 14:10:27'),
(316, 0, 'Head Light Screw 5x12 (Black) (A.B.I)', '1.20', 1300, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 14:10:35'),
(317, 0, 'Head Light Screw 5x12 (Black) (T.T)', '1.20', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™ÂˆÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2017-03-17 14:10:44'),
(318, 0, 'Limiter Pipe Bolt Small 8x25 (A.J)', '6.50', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.J)', 0, 1, '2017-03-17 14:10:53'),
(319, 0, 'Limiter Pipe Bolt Small 8x25 (A.B.I)', '6.50', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 14:11:03'),
(320, 0, 'Limiter Pipe Bolt Small 8x25 (T.T)', '4.50', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(T.T)', 0, 1, '2017-03-17 14:11:19'),
(321, 0, 'Limiter Pipe Bolt Large 8x32 (A.J)', '6.50', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.J)', 0, 1, '2017-03-17 14:11:28'),
(322, 0, 'Limiter Pipe Bolt Large 8x32 (A.B.I)', '6.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 14:11:38'),
(323, 0, 'Limiter Pipe Bolt Large 8x32 (T.T)', '5.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T)', 0, 1, '2017-03-17 14:11:47'),
(324, 0, 'Limiter Pipe Bolt Large Comp (A.J)', '10.00', 0, '', 'ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã™Â…ÃšÂ©Ã™Â…Ã™Â„(A.J) ', 0, 1, '2017-03-17 14:18:23'),
(325, 0, 'Limiter Pipe Bolt Large Comp (A.B.I)', '10.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã™Â…ÃšÂ©Ã™Â…Ã™Â„(A.B.I)', 300, 1, '2017-03-17 14:18:33'),
(326, 0, 'Limiter Pipe Bolt Large Comp(T.T)', '10.00', 90, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (T.T)', 0, 1, '2017-03-17 14:18:42'),
(327, 0, 'Fuel Tank Monogram Screw (3x6)(A.J)', '0.50', 0, '', ' Ã™Â…Ã™ÂˆÃ™Â†Ã™ÂˆÃšÂ¯Ã˜Â±Ã˜Â§Ã™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-17 14:19:05'),
(328, 0, 'Fuel Tank Monogram Screw (3x6)(A.B.I)', '0.40', 0, '', ' Ã™Â…Ã™ÂˆÃ™Â†Ã™ÂˆÃšÂ¯Ã˜Â±Ã˜Â§Ã™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-17 14:19:18'),
(329, 0, 'Bolt Hex 5x15 (T.T)', '0.80', 2000, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(T.T)', 0, 1, '2017-03-17 14:19:24'),
(330, 0, 'Tikli Bolt (5x12) White (A.J)', '1.40', 0, '', ' Ã˜Â§Ã›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹5x12 Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(A.J)', 0, 1, '2017-03-17 14:19:28'),
(331, 0, 'Tikli Bolt (5x12) White (A.B.I)', '1.30', 0, '', ' Ã˜Â§Ã›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹5x12 Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(A.B.I)', 0, 1, '2017-03-17 14:19:36'),
(332, 0, 'Bolt Hex(5x12)Black P-9(AJ)', '1.40', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.J)(P.9) ', 2500, 1, '2017-03-17 14:19:39'),
(333, 0, 'Timing Cover Bolt (6x110) (A.J)', '12.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.J)', 0, 1, '2017-03-17 14:19:45'),
(334, 0, 'Timing Cover Bolt (6x110) (A.B.I)', '10.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.B.I)', 0, 1, '2017-03-17 14:19:53'),
(335, 0, 'Timing Cover Bolt (6x110) (T.T)', '12.00', 130, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (T.T)', 200, 1, '2017-03-17 14:20:01'),
(336, 0, 'Bolt Hex(5x12)Black P-9(ABI)', '0.90', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.B.I)(P.9)', 0, 1, '2017-03-17 14:20:45'),
(337, 0, 'Bolt Hex(5x12)Black P-9(TT)', '0.80', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)(P.9)', 0, 1, '2017-03-17 14:20:57'),
(338, 0, 'Bolt Hex 5x20 (A.J)', '1.10', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.J)', 0, 1, '2017-03-17 14:21:59'),
(339, 0, 'Head Cylender Bolt Chrome 6x23(A.J)', '6.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†ÃšÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… 6x23 (A.J)', 0, 1, '2017-03-17 14:22:04'),
(340, 0, 'Head Cylender Bolt Chrome 6x23(A.B.I)', '5.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†ÃšÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… 6x23 (A.B.I)', 0, 1, '2017-03-17 14:22:11'),
(341, 0, 'Bolt Hex 5x20 (A.B.I)', '1.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.B.I)', 0, 1, '2017-03-17 14:22:12'),
(342, 0, 'Head Cylender Bolt 6x23(T.T)', '5.00', 80, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†ÃšÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ 6x23 (T.T)', 950, 1, '2017-03-17 14:22:20'),
(343, 0, 'Bolt Hex 5x20 (T.T)', '0.90', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (T.T)', 0, 1, '2017-03-17 14:22:23'),
(344, 0, 'Pin Guide Roller (A.J)', '8.00', 0, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ©Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 14:22:28'),
(345, 0, 'Pin Guide Roller (A.B.I)', '6.00', 0, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ©Ã™Â„Ã˜Â±(A.B.I)', 500, 1, '2017-03-17 14:22:37'),
(346, 0, 'Pin Guide Roller (T.T)', '8.00', 110, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ©Ã™Â„Ã˜Â±(T.T)', 1000, 1, '2017-03-17 14:22:45'),
(347, 0, 'Bolt Hex 5x25 (A.J)', '1.70', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (A.J)', 0, 1, '2017-03-17 14:22:48'),
(348, 0, 'Pin Guide Roller Chrome (A.B.I)', '8.00', 0, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â…(A.B.I)', 0, 1, '2017-03-17 14:22:56'),
(1159, 0, 'Bolt Flange (8x32) S.S Black (A.B.I)', '8.00', 0, '', 'Ã™Â¹Ã›ÂŒ ÃšÂ©Ã˜Â§Ã™Â„Ã™Â… Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ S.S (A.B.I)', 0, 1, '2017-03-18 18:13:31'),
(1160, 0, 'Bolt Flange (8x32) Black (T.T)', '5.00', 0, '', ' Ã™Â¹Ã›ÂŒ ÃšÂ©Ã˜Â§Ã™Â„Ã™Â… Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨Ã™Â„Ã›ÂŒÃšÂ© ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-18 18:13:54'),
(351, 0, 'Rear Fender Bolt (8x28) (A.B.I)', '9.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™Â…Ã˜Â±ÃšÂ¯Ã˜Â§ÃšÂˆ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (8x28) (A.B.I)', 0, 1, '2017-03-17 14:23:31'),
(352, 0, 'Head Light Bolt Chrome (8x20) (A.B.I)', '5.50', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (A.B.I)', 0, 1, '2017-03-17 14:23:46'),
(353, 0, 'Bolt Hex 5x25 (T.T)', '1.10', 100, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(T.T)', 0, 1, '2017-03-17 14:24:30'),
(354, 0, 'Clutch Cover Bolt 6x55 (A.J)', '3.90', 250, '', 'ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â P.8 (A.J)', 0, 1, '2017-03-17 14:27:20'),
(355, 0, 'Clutch Cover Bolt 6x55 (A.B.I)', '3.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â P.8 (A.B.I)', 0, 1, '2017-03-17 14:27:34'),
(356, 0, 'Bolt Hex 5x25 (A.B.I)', '1.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(A.B.I)', 0, 1, '2017-03-17 14:27:42'),
(357, 0, 'Clutch Cover Bolt 6x55 (T.T)', '2.20', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â P.8 (T.T)', 0, 1, '2017-03-17 14:27:52'),
(358, 0, 'Clutch Cover Bolt 6x60 (A.J)', '4.20', 50, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ P.8 (A.J)', 0, 1, '2017-03-17 14:28:02'),
(359, 0, 'Clutch Cover Bolt 6x60 (A.B.I)', '3.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ P.8 (A.B.I)', 0, 1, '2017-03-17 14:28:09'),
(360, 0, 'Clutch Cover Bolt 6x60 (T.T)', '2.40', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ P.8 (T.T)', 0, 1, '2017-03-17 14:28:16'),
(361, 0, 'Engine Cover Bolt 6x65 (A.J)', '5.00', 50, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x65) P.8 (A.J)', 0, 1, '2017-03-17 14:28:35'),
(362, 0, 'Engine Cover Bolt 6x65 (A.B.I)', '3.40', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x65) P.8 (A.B.I)', 0, 1, '2017-03-17 14:28:47'),
(363, 0, 'Engine Cover Bolt 6x65 (T.T)', '2.80', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x65) P.8 (T.T)', 0, 1, '2017-03-17 14:28:59'),
(364, 0, 'Engine Cover Bolt 6x70 (A.J)', '7.00', 20, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x70) P.8 (A.J)', 0, 1, '2017-03-17 14:31:36'),
(365, 0, 'Engine Cover Bolt 6x70 (A.B.I)', '3.70', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x70) P.8 (A.B.I)', 0, 1, '2017-03-17 14:31:43'),
(366, 0, 'Engine Cover Bolt 6x70 (T.T)', '3.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x70) P.8 (T.T)', 0, 1, '2017-03-17 14:31:52'),
(367, 0, 'Engine Cover Bolt 6x100 (A.J)', '9.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x100) P.8 (A.J)', 0, 1, '2017-03-17 14:32:02'),
(368, 0, 'Engine Cover Bolt 6x100 (A.B.I)', '5.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x100) P.8 (A.B.I)', 0, 1, '2017-03-17 14:32:12'),
(369, 0, 'Engine Cover Bolt 6x100 (T.T)', '4.60', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x100) P.8 (T.T)', 0, 1, '2017-03-17 14:32:22'),
(370, 0, 'Engine Bolt Kit WH CDI 70(A.J)', '130.00', 100, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.J) CDI 70 ', 25, 1, '2017-03-17 14:33:02'),
(371, 0, 'Engine Bolt Kit WH CDI 70(A.B.I)', '110.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.B.I) CDI 70 ', 0, 1, '2017-03-17 14:33:28'),
(372, 0, 'Engine Bolt Kit WH CDI 70(T.T)', '80.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (T.T) CDI 70 ', 0, 1, '2017-03-17 14:33:44'),
(373, 0, 'Engine Bolt Kit WH CG 125(A.J)', '140.00', 2, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.J) CG 125 ', 10, 1, '2017-03-17 14:34:04'),
(374, 0, 'Engine Bolt Kit WH CG 125(A.B.I)', '120.00', 0, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.B.I) CG 125 ', 0, 1, '2017-03-17 14:35:30'),
(375, 0, 'Sprocket Bolt Kit White (A.J) ', '40.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ›ÂŒÃ˜Â¯(A.J) ', 0, 1, '2017-03-17 14:35:40'),
(376, 0, 'Sprocket Bolt Kit White (A.B.I) ', '32.00', 1800, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.B.I) ', 500, 1, '2017-03-17 14:35:48'),
(377, 0, 'Sprocket Bolt Kit White (T.T) ', '22.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (T.T) ', 0, 1, '2017-03-17 14:36:03'),
(378, 0, 'Front Grari Bolt (Green)  (A.J)', '3.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (ÃšÂ¯Ã˜Â±Ã›ÂŒÃ™Â† ) (A.J)', 25, 1, '2017-03-17 14:36:13'),
(379, 0, 'Engine Axle Lower (8x111) (A.J)', '22.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã™Â¹ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.J)', 0, 1, '2017-03-17 14:36:21'),
(380, 0, 'Engine Axle Lower (8x111) (A.B.I)', '20.00', 1140, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã™Â¹ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 14:36:29');
INSERT INTO `items` (`id`, `type`, `title`, `unit_price`, `quantity`, `name_in_urdu`, `name_in_urdu_text`, `low_stock_quantity`, `status`, `ts`) VALUES
(381, 0, 'Engine Axle Lower (8x111) (T.T)', '15.00', 240, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã™Â¹ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2017-03-17 14:36:42'),
(382, 0, 'Engine Axle Upper (8x115) (A.J)', '22.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 14:36:52'),
(383, 0, 'Engine Axle Upper (8x115) (A.B.I)', '20.00', 1050, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 14:37:20'),
(384, 0, 'Engine Axle Upper (8x115) (T.T)', '15.00', 550, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-17 14:39:22'),
(385, 0, 'Ex-Muffler Hood Screw 5x7 (A.J)', '1.40', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã™Â„Ã™Â†Ã˜Â³Ã˜Â± Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J) 5x7 ', 0, 1, '2017-03-17 14:39:37'),
(386, 0, 'Ex-Muffler Hood Screw 5x7 (A.B.I)', '1.30', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã™Â„Ã™Â†Ã˜Â³Ã˜Â± Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I) 5x7 ', 1500, 1, '2017-03-17 14:39:46'),
(387, 0, 'Mud Flapper Screw Complete White (A.J)', '1.80', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (A.J)', 0, 1, '2017-03-17 14:39:55'),
(388, 0, 'Mud Flapper Screw Com Wht (ABI)', '1.40', 14200, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (A.B.I)', 2500, 1, '2017-03-17 14:40:04'),
(389, 0, 'Mud Flapper Screw Com White (T.T)', '1.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (T.T)', 0, 1, '2017-03-17 14:40:12'),
(390, 0, 'Mud Flapper Screw Complete Black (A.J)', '1.70', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„(A.J)', 0, 1, '2017-03-17 14:40:22'),
(391, 0, 'Mud Flapper Screw Complete Black (A.B.I)', '1.10', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (A.B.I)', 0, 1, '2017-03-17 14:40:31'),
(392, 0, 'Mud Flapper Screw Com Black (T.T)', '1.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (T.T)', 0, 1, '2017-03-17 14:40:40'),
(393, 0, 'Bolt Hex Fixed Washer (6x6) (A.J)', '2.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-17 14:40:51'),
(394, 0, 'Bolt Hex 5x30 (A.J)', '1.40', 0, '', 'Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.J)', 1000, 1, '2017-03-17 15:00:42'),
(395, 0, 'Bolt Hex 5x30 (A.B.I)', '1.20', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 15:00:56'),
(396, 0, 'Bolt Hex 5x30 (T.T)', '1.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T)', 0, 1, '2017-03-17 15:01:13'),
(397, 0, 'Bolt Hex 5x35 (A.J)', '1.50', 0, '', ' Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã˜Â¨Ã˜Â± 8 (5x35) (A.J)', 0, 1, '2017-03-17 15:01:28'),
(398, 0, 'Bolt Hex 5x35 (A.B.I)', '1.30', 0, '', ' Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã˜Â¨Ã˜Â± 8 (5x35) (A.B.I)', 0, 1, '2017-03-17 15:01:53'),
(399, 0, 'Bolt Hex 5x35 (T.T)', '1.10', 0, '', ' Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã˜Â¨Ã˜Â± 8 (5x35) (T.T)', 0, 1, '2017-03-17 15:02:13'),
(400, 0, 'Bolt Hex 6x6 (A.J)', '1.00', 0, '', ' ÃšÂ†Ã›Â’ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J) ', 3000, 1, '2017-03-17 15:02:27'),
(401, 0, 'Bolt Hex 6x6 (A.B.I)', '0.90', 0, '', ' ÃšÂ†Ã›Â’ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I) ', 0, 1, '2017-03-17 15:02:44'),
(402, 0, 'Bolt Hex 6x6 (T.T)', '1.00', 0, '', ' ÃšÂ†Ã›Â’ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T) ', 0, 1, '2017-03-17 15:03:06'),
(403, 0, 'Bolt Hex 6x8 (A.J)', '1.10', 0, '', ' Ã™ÂÃ˜Â± Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:03:20'),
(404, 0, 'Bolt Hex 6x8 (A.B.I)', '1.00', 0, '', ' Ã™ÂÃ˜Â± Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 15:03:42'),
(405, 0, 'Bolt Hex 6x8 (T.T)', '0.90', 0, '', ' Ã™ÂÃ˜Â± Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-17 15:03:59'),
(406, 0, 'Bolt Hex 6x12 (A.J)', '1.40', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:04:13'),
(407, 0, 'Bolt Hex 6x12 (A.B.I)', '1.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 15:04:31'),
(408, 0, 'Bolt Hex 6x12 (T.T)', '0.80', 11700, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 5000, 1, '2017-03-17 15:04:52'),
(409, 0, 'Bolt Hex 6x15 (A.J)', '1.50', 0, '', 'Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆ ÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:05:55'),
(410, 0, 'Bolt Hex 6x15 (A.B.I)', '1.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆ ÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 15:06:09'),
(411, 0, 'Bolt Hex 6x15 (T.T)', '0.90', 5200, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆ ÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-17 15:06:26'),
(412, 0, 'Bolt Hex 6x20 (A.J)', '1.60', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:06:39'),
(413, 0, 'Bolt Hex 6x20 (A.B.I)', '1.40', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 9700, 1, '2017-03-17 15:06:52'),
(414, 0, 'Bolt Hex 6x20 (T.T)', '1.20', 1100, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-17 15:07:07'),
(415, 0, 'Bolt Hex 6x25 (A.J)', '1.85', 0, '', ' ÃšÂ©Ã›ÂŒÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:07:21'),
(416, 0, 'Bolt Hex 6x25 (A.B.I)', '1.50', 0, '', 'ÃšÂ©Ã›ÂŒÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 8500, 1, '2017-03-17 15:10:25'),
(417, 0, 'Bolt Hex 6x25 (T.T)', '1.30', 100, '', ' ÃšÂ©Ã›ÂŒÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 2500, 1, '2017-03-17 15:10:41'),
(418, 0, 'Bolt Hex 6x30 (A.J)', '2.10', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:10:57'),
(419, 0, 'Bolt Hex 6x30 (A.B.I)', '1.60', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 15:11:11'),
(420, 0, 'Bolt Hex 6x30 (T.T)', '1.50', 800, '', ' ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 2500, 1, '2017-03-17 15:11:25'),
(421, 0, 'Bolt Hex 6x35 (A.J)', '2.25', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:11:39'),
(422, 0, 'Bolt Hex 6x35 (A.B.I)', '1.80', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 15:11:54'),
(423, 0, 'Bolt Hex 6x35 (T.T)', '1.70', 600, '', ' ÃšÂ©Ã›ÂŒÃ˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 2000, 1, '2017-03-17 15:12:22'),
(424, 0, 'Bolt Hex 6x40 (A.J)', '2.50', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:12:34'),
(425, 0, 'Bolt Hex 6x40 (A.B.I)', '2.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-17 15:12:48'),
(426, 0, 'Bolt Hex 6x40 (T.T)', '1.80', 800, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-17 15:12:59'),
(427, 0, 'Bolt Hex 6x45 (A.J)', '2.70', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.J)', 0, 1, '2017-03-17 15:13:20'),
(428, 0, 'Bolt Hex 6x45 (A.B.I)', '2.20', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 15:13:39'),
(429, 0, 'Bolt Hex 6x45 (T.T)', '1.60', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(T.T)', 0, 1, '2017-03-17 15:13:59'),
(430, 0, 'Bolt Hex 6x50 (A.J)', '3.00', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(A.J)', 0, 1, '2017-03-17 15:14:36'),
(431, 0, 'Bolt Hex 6x50 (A.B.I)', '2.50', 0, '', 'ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I)', 0, 1, '2017-03-17 15:19:36'),
(432, 0, 'Bolt Hex 6x50 (T.T)', '2.20', 350, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T)', 0, 1, '2017-03-17 15:21:04'),
(433, 0, 'Bolt Hex 8x12 (A.J)', '2.70', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:22:47'),
(434, 0, 'Bolt Hex 8x12 (A.B.I)', '1.80', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-17 15:23:02'),
(435, 0, 'Bolt Hex 8x12 (T.T)', '1.30', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-17 15:23:15'),
(436, 0, 'Bolt Hex 8x15 (A.J)', '2.90', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:23:30'),
(437, 0, 'Bolt Hex 8x15 (A.B.I)', '2.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-17 15:23:44'),
(438, 0, 'Bolt Hex 8x15 (T.T)', '1.40', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-17 15:23:59'),
(439, 0, 'Bolt Hex 8x20 (A.J)', '3.20', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-17 15:24:12'),
(440, 0, 'Bolt Hex 8x20 (A.B.I)', '2.20', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 2500, 1, '2017-03-17 15:24:24'),
(441, 0, 'Bolt Hex 8x20 (T.T)', '1.80', 4045, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 2000, 1, '2017-03-17 15:24:37'),
(442, 0, 'Bolt Hex 8x25 (A.J)', '3.50', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:24:50'),
(443, 0, 'Bolt Hex 8x25 (A.B.I)', '2.60', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-17 15:25:05'),
(444, 0, 'Bolt Hex 8x25 (T.T)', '2.60', 750, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-17 15:25:15'),
(445, 0, 'Bolt Hex 8x30 (A.J)', '3.80', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:25:26'),
(446, 0, 'Bolt Hex 8x30 (A.B.I)', '3.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-17 15:27:01'),
(447, 0, 'Bolt Hex 8x30 (T.T)', '2.60', 2250, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 1000, 1, '2017-03-17 15:27:15'),
(448, 0, 'Bolt Hex 8x35 (A.J)', '4.10', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:27:33'),
(449, 0, 'Bolt Hex 8x35 (A.B.I)', '3.40', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-17 15:27:50'),
(450, 0, 'Bolt Hex 8x35 (T.T)', '2.80', 2150, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 1500, 1, '2017-03-17 15:28:04'),
(451, 0, 'Bolt Hex 8x40 (A.J)', '4.50', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x40) (A.J)', 0, 1, '2017-03-17 15:28:20'),
(452, 0, 'Bolt Hex 8x40 (A.B.I)', '3.80', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x40) (A.B.I)', 0, 1, '2017-03-17 15:28:36'),
(453, 0, 'Bolt Hex 8x40 (T.T)', '2.80', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x40) (T.T)', 0, 1, '2017-03-17 15:28:48'),
(454, 0, 'Bolt Hex 8x45 (A.J)', '5.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x45) (A.J', 0, 1, '2017-03-17 15:29:00'),
(455, 0, 'Bolt Hex 8x45 (A.B.I)', '4.40', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x45) (A.B.I)', 0, 1, '2017-03-17 15:29:12'),
(456, 0, 'Bolt Hex 8x45 (T.T)', '3.40', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x45) (T.T)', 0, 1, '2017-03-17 15:29:26'),
(457, 0, 'Bolt Hex 8x60 (A.J)', '6.00', 0, '', 'ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã›ÂÃ˜Â§Ã˜Â¦Ã›ÂŒ Ã˜Â§Ã˜Â³Ã™Â¾Ã›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-17 15:31:08'),
(458, 0, 'Bolt Hex 8x60 (A.B.I)', '5.20', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã›ÂÃ˜Â§Ã˜Â¦Ã›ÂŒ Ã˜Â§Ã˜Â³Ã™Â¾Ã›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-17 15:31:24'),
(459, 0, 'Bolt Hex 8x60 (T.T)', '4.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã›ÂÃ˜Â§Ã˜Â¦Ã›ÂŒ Ã˜Â§Ã˜Â³Ã™Â¾Ã›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-17 15:31:53'),
(460, 0, 'Bolt Flange 6x6 (A.J)', '1.40', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 15:32:07'),
(461, 0, 'Bolt Flange 6x6 (A.B.I)', '1.30', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 5000, 1, '2017-03-17 15:32:21'),
(462, 0, 'Bolt Flange 6x6 (T.T)', '1.20', 2400, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 5000, 1, '2017-03-17 15:32:36'),
(463, 0, 'Bolt Flange 6x12 (A.J)', '1.50', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 15:32:53'),
(464, 0, 'Bolt Flange 6x12 (A.B.I)', '1.80', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:33:06'),
(465, 0, 'Bolt Flange 6x12 (T.T)', '1.30', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 5000, 1, '2017-03-17 15:33:22'),
(466, 0, 'Bolt Flange 6x15 (A.J)', '1.60', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-17 15:33:57'),
(467, 0, 'Bolt Flange 6x15 (A.B.I)', '1.90', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:34:11'),
(468, 0, 'Bolt Flange 6x15 (T.T)', '1.50', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 15:34:21'),
(470, 0, 'Bolt Flange 6x20 (A.B.I)', '1.80', 400, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:35:09'),
(471, 0, 'Bolt Flange 6x20 (T.T)', '1.60', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 15:35:25'),
(472, 0, 'Bolt Flange 6x25 (A.J)', '2.60', 400, '', ' ÃšÂ©ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 15:35:41'),
(473, 0, 'Bolt Flange 6x25 (A.B.I)', '2.40', 0, '', 'ÃšÂ©ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:38:46'),
(474, 0, 'Bolt Flange 6x25 (T.T)', '1.80', 1899, '', ' ÃšÂ©ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 15:38:57'),
(475, 0, 'Bolt Flange 6x30 (A.J)', '2.80', 100, '', ' ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 2500, 1, '2017-03-17 15:39:09'),
(476, 0, 'Bolt Flange 6x30 (A.B.I)', '3.20', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:39:21'),
(477, 0, 'Bolt Flange 6x30 (T.T)', '2.00', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 2000, 1, '2017-03-17 15:39:31'),
(478, 0, 'Bolt Flange 6x35 (A.J)', '3.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â¹Ã›ÂŒÃšÂ© ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 1200, 1, '2017-03-17 15:39:45'),
(479, 0, 'Bolt Flange 6x35 (A.B.I)', '2.40', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â¹Ã›ÂŒÃšÂ© ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:40:08'),
(480, 0, 'Bolt Flange 6x35 (T.T)', '2.50', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â¹Ã›ÂŒÃšÂ© ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 15:40:18'),
(481, 0, 'Bolt Flange 7x8 (A.J)', '1.80', 1000, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â§Ã™ÂˆÃ˜Â± Ã˜Â³Ã˜Â§Ã˜Â¦Ã˜Â² Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.J)', 0, 1, '2017-03-17 15:40:32'),
(482, 0, 'Bolt Flange 8x12 (A.J)', '2.90', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 15:40:44'),
(483, 0, 'Bolt Flange 8x12 (A.B.I)', '2.40', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:41:01'),
(484, 0, 'Bolt Flange 8x12 (T.T)', '2.20', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 15:41:13'),
(485, 0, 'Bolt Flange 8x15 (A.J)', '3.10', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 15:41:24'),
(486, 0, 'Bolt Flange 8x15 (A.B.I)', '3.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-17 15:41:35'),
(487, 0, 'Bolt Flange 8x15 (T.T)', '2.20', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-17 15:41:48'),
(489, 0, 'Bolt Flange 8x20 (A.B.I)', '4.40', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 500, 1, '2017-03-17 15:42:58'),
(491, 0, 'Bolt Flange 8x25 (A.J)', '3.40', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-17 15:43:43'),
(492, 0, 'Bolt Flange 8x25 (A.B.I)', '4.60', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 1600, 1, '2017-03-17 15:43:57'),
(493, 0, 'Bolt Flange 8x25 (T.T)', '3.60', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-17 15:44:08'),
(494, 0, 'Bolt Flange 8x30 (A.J)', '4.20', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-17 15:46:13'),
(495, 0, 'Bolt Flange 8x30 (A.B.I)', '4.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-17 15:46:32'),
(496, 0, 'Bolt Flange 8x30 (T.T)', '2.80', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-17 15:46:57'),
(497, 0, 'Bolt Flange 8x35 (A.J)', '5.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-17 15:47:09'),
(498, 0, 'Bolt Flange 8x35 (A.B.I)', '3.80', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-17 15:47:20'),
(499, 0, 'Bolt Flange 8x35 (T.T)', '3.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-17 15:47:30'),
(500, 0, 'Bolt Flange 8x40 (A.J)', '5.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x40) (A.J)', 0, 1, '2017-03-17 15:47:41'),
(501, 0, 'Bolt Flange 8x40 (A.B.I)', '4.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x40) (A.B.I)', 0, 1, '2017-03-17 15:47:53'),
(502, 0, 'Bolt Flange 8x40 (T.T)', '3.40', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x40) (T.T)', 0, 1, '2017-03-17 15:48:04'),
(503, 0, 'Bolt Flange 8x45 (A.J)', '5.20', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x45) (A.J)', 0, 1, '2017-03-17 15:48:14'),
(504, 0, 'Bolt Flange 8x45 (A.B.I)', '4.30', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x45) (A.B.I)', 0, 1, '2017-03-17 15:48:29'),
(505, 0, 'Bolt Flange 8x45 (T.T)', '3.80', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x45) (T.T)', 0, 1, '2017-03-17 15:48:41'),
(506, 0, 'Magnet Cover Bolt 6x15 (A.J)', '1.50', 0, '', ' Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(6x15) P.8 (A.J)', 0, 1, '2017-03-17 15:48:52'),
(507, 0, 'Magnet Cover Bolt 6x15 (A.B.I)', '1.30', 0, '', ' Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(6x15) P.8 (A.B.I)', 0, 1, '2017-03-17 15:49:10'),
(508, 0, 'Magnet Cover Bolt 6x15 (T.T)', '1.00', 0, '', ' Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(6x15) P.8 (T.T)', 0, 1, '2017-03-17 15:49:25'),
(509, 0, 'Magnet Cover Bolt 6x20 (A.J)', '1.60', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ ÃšÂ©Ã˜Â§Ã™Â† Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(6x20) P.8 (A.J)', 0, 1, '2017-03-17 15:51:48'),
(510, 0, 'Magnet Cover Bolt 6x20 (A.B.I)', '2.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ ÃšÂ©Ã˜Â§Ã™Â† Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(6x20) P.8 (A.B.I)', 0, 1, '2017-03-17 15:52:01'),
(511, 0, 'Magnet Cover Bolt 6x20 (T.T)', '1.20', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ ÃšÂ©Ã˜Â§Ã™Â† Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(6x20) P.8 (T.T)', 0, 1, '2017-03-17 15:52:15'),
(512, 0, 'Magnet Cover Bolt 6x25 (A.J)', '2.30', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.J)', 0, 1, '2017-03-17 15:53:31'),
(513, 0, 'Magnet Cover Bolt 6x25 (A.B.I)', '2.20', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.B.I)', 0, 1, '2017-03-17 15:53:44'),
(514, 0, 'Magnet Cover Bolt 6x25 (T.T)', '1.90', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (T.T)', 0, 1, '2017-03-17 15:54:31'),
(515, 0, 'Magnet Cover Bolt 6x30 (A.J)', '2.40', 1100, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›ÂP.8 (A.J)', 2000, 1, '2017-03-17 15:54:41'),
(516, 0, 'Magnet Cover Bolt 6x30 (A.B.I)', '2.50', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›ÂP.8 (A.B.I)', 0, 1, '2017-03-17 15:54:52'),
(517, 0, 'Magnet Cover Bolt 6x30 (T.T)', '2.10', 100, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›ÂP.8 (T.T)', 1500, 1, '2017-03-17 15:55:07'),
(518, 0, 'Magnet Cover Bolt 6x35 (A.J)', '2.80', 750, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„P.8 (A.J)', 2500, 1, '2017-03-17 15:55:19'),
(519, 0, 'Magnet Cover Bolt 6x35 (A.B.I)', '2.80', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„P.8 (A.B.I)', 0, 1, '2017-03-17 15:56:02'),
(520, 0, 'Magnet Cover Bolt 6x35 (T.T)', '2.30', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„P.8 (T.T)', 0, 1, '2017-03-17 15:56:13'),
(521, 0, 'Magnet Cover Bolt 6x40 (A.J)', '3.00', 500, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§P.8 (A.J)', 1500, 1, '2017-03-17 15:56:30'),
(522, 0, 'Magnet Cover Bolt 6x40 (A.B.I)', '3.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§P.8 (A.B.I)', 0, 1, '2017-03-17 15:56:40'),
(523, 0, 'Magnet Cover Bolt 6x40 (T.T)', '2.80', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§P.8 (T.T)', 0, 1, '2017-03-17 15:57:21'),
(524, 0, 'Clutch Cover Bolt 6x45 (A.J)', '3.40', 900, '', 'ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.J)', 0, 1, '2017-03-17 16:00:07'),
(525, 0, 'Clutch Cover Bolt 6x45 (A.B.I)', '2.40', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.B.I)', 0, 1, '2017-03-17 16:00:48'),
(526, 0, 'Clutch Cover Bolt 6x45 (T.T)', '1.80', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (T.T)', 0, 1, '2017-03-17 16:01:19'),
(527, 0, 'Clutch Cover Bolt 6x50 (A.J)', '3.60', 100, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„ P.8 (A.J)', 0, 1, '2017-03-17 16:01:29'),
(528, 0, 'Clutch Cover Bolt 6x50 (A.B.I)', '2.60', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„ P.8 (A.B.I)', 0, 1, '2017-03-17 16:01:45'),
(529, 0, 'Clutch Cover Bolt 6x50 (T.T)', '2.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„ P.8 (T.T)', 0, 1, '2017-03-17 16:01:57'),
(614, 0, 'Mud Flapper Screw Wht(ABI)', '0.90', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-18 13:26:21'),
(630, 0, 'Bolt Flange 6x20 (A.J)', '1.70', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-18 13:41:18'),
(632, 0, 'Bolt Flange 8x20 (A.J)', '4.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-18 13:41:49'),
(634, 0, 'Bolt Flange 8x20 (T.T)', '3.20', 950, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-18 13:42:10'),
(1619, 1, 'Bolt Flange (8x32) Black (T.T)', '125.00', 0, '', ' Ã™Â¹Ã›ÂŒ ÃšÂ©Ã˜Â§Ã™Â„Ã™Â… Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨Ã™Â„Ã›ÂŒÃšÂ© ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-20 14:55:21'),
(1618, 1, 'Bolt Flange (8x32) S.S Black (A.B.I)', '80.00', 0, '', 'Ã™Â¹Ã›ÂŒ ÃšÂ©Ã˜Â§Ã™Â„Ã™Â… Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ S.S (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1617, 1, 'Chain Lock 428  (A.B.I)', '80.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† Ã™Â„Ã˜Â§ÃšÂ© (A.B.I) 428', 0, 1, '2017-03-20 14:55:20'),
(1616, 1, 'Bolt Flange 8x20 (T.T)', '160.00', 19, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1615, 1, 'Bolt Flange 8x20 (A.J)', '200.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1614, 1, 'Bolt Flange 6x20 (A.J)', '170.00', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1613, 1, 'Mud Flapper Screw Wht(ABI)', '90.00', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1612, 1, 'Clutch Cover Bolt 6x50 (T.T)', '100.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„ P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1611, 1, 'Clutch Cover Bolt 6x50 (A.B.I)', '130.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„ P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1610, 1, 'Clutch Cover Bolt 6x50 (A.J)', '180.00', 2, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„ P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1609, 1, 'Clutch Cover Bolt 6x45 (T.T)', '90.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1608, 1, 'Clutch Cover Bolt 6x45 (A.B.I)', '120.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1607, 1, 'Clutch Cover Bolt 6x45 (A.J)', '170.00', 18, '', 'ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1606, 1, 'Magnet Cover Bolt 6x40 (T.T)', '280.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1605, 1, 'Magnet Cover Bolt 6x40 (A.B.I)', '150.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1604, 1, 'Magnet Cover Bolt 6x40 (A.J)', '150.00', 10, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1603, 1, 'Magnet Cover Bolt 6x35 (T.T)', '230.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1602, 1, 'Magnet Cover Bolt 6x35 (A.B.I)', '140.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1601, 1, 'Magnet Cover Bolt 6x35 (A.J)', '140.00', 15, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã˜Â§Ã˜Â±Ã™Â…Ã™Â„P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1600, 1, 'Magnet Cover Bolt 6x30 (T.T)', '210.00', 1, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›ÂP.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1599, 1, 'Magnet Cover Bolt 6x30 (A.B.I)', '250.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›ÂP.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1598, 1, 'Magnet Cover Bolt 6x30 (A.J)', '120.00', 22, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›ÂP.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1597, 1, 'Magnet Cover Bolt 6x25 (T.T)', '190.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1596, 1, 'Magnet Cover Bolt 6x25 (A.B.I)', '220.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1595, 1, 'Magnet Cover Bolt 6x25 (A.J)', '230.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1594, 1, 'Magnet Cover Bolt 6x20 (T.T)', '120.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ ÃšÂ©Ã˜Â§Ã™Â† Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(6x20) P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1593, 1, 'Magnet Cover Bolt 6x20 (A.B.I)', '200.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ ÃšÂ©Ã˜Â§Ã™Â† Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(6x20) P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1592, 1, 'Magnet Cover Bolt 6x20 (A.J)', '160.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ ÃšÂ©Ã˜Â§Ã™Â† Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(6x20) P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1591, 1, 'Magnet Cover Bolt 6x15 (T.T)', '100.00', 0, '', ' Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(6x15) P.8 (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1590, 1, 'Magnet Cover Bolt 6x15 (A.B.I)', '130.00', 0, '', ' Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(6x15) P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1589, 1, 'Magnet Cover Bolt 6x15 (A.J)', '150.00', 0, '', ' Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(6x15) P.8 (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1588, 1, 'Bolt Flange 8x45 (T.T)', '190.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x45) (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1587, 1, 'Bolt Flange 8x45 (A.B.I)', '215.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x45) (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1586, 1, 'Bolt Flange 8x45 (A.J)', '260.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x45) (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1585, 1, 'Bolt Flange 8x40 (T.T)', '170.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x40) (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1584, 1, 'Bolt Flange 8x40 (A.B.I)', '200.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x40) (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1583, 1, 'Bolt Flange 8x40 (A.J)', '250.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (8x40) (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1582, 1, 'Bolt Flange 8x35 (T.T)', '150.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1581, 1, 'Bolt Flange 8x35 (A.B.I)', '190.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1580, 1, 'Bolt Flange 8x35 (A.J)', '250.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1579, 1, 'Bolt Flange 8x30 (T.T)', '140.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1578, 1, 'Bolt Flange 8x30 (A.B.I)', '200.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1577, 1, 'Bolt Flange 8x30 (A.J)', '210.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1576, 1, 'Bolt Flange 8x25 (T.T)', '180.00', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-20 14:55:20'),
(1575, 1, 'Bolt Flange 8x25 (A.B.I)', '230.00', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1574, 1, 'Bolt Flange 8x25 (A.J)', '170.00', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1573, 1, 'Bolt Flange 8x20 (A.B.I)', '220.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1572, 1, 'Bolt Flange 8x15 (T.T)', '110.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1571, 1, 'Bolt Flange 8x15 (A.B.I)', '150.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1570, 1, 'Bolt Flange 8x15 (A.J)', '155.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1569, 1, 'Bolt Flange 8x12 (T.T)', '110.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1568, 1, 'Bolt Flange 8x12 (A.B.I)', '120.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1567, 1, 'Bolt Flange 8x12 (A.J)', '145.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1566, 1, 'Bolt Flange 7x8 (A.J)', '180.00', 10, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â§Ã™ÂˆÃ˜Â± Ã˜Â³Ã˜Â§Ã˜Â¦Ã˜Â² Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1565, 1, 'Bolt Flange 6x35 (T.T)', '250.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â¹Ã›ÂŒÃšÂ© ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1564, 1, 'Bolt Flange 6x35 (A.B.I)', '240.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â¹Ã›ÂŒÃšÂ© ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1563, 1, 'Bolt Flange 6x35 (A.J)', '300.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â¹Ã›ÂŒÃšÂ© ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1562, 1, 'Bolt Flange 6x30 (T.T)', '200.00', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1561, 1, 'Bolt Flange 6x30 (A.B.I)', '160.00', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1560, 1, 'Bolt Flange 6x30 (A.J)', '280.00', 1, '', ' ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1559, 1, 'Bolt Flange 6x25 (T.T)', '180.00', 18, '', ' ÃšÂ©ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1558, 1, 'Bolt Flange 6x25 (A.B.I)', '240.00', 0, '', 'ÃšÂ©ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1557, 1, 'Bolt Flange 6x25 (A.J)', '260.00', 4, '', ' ÃšÂ©ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:20'),
(1556, 1, 'Bolt Flange 6x20 (T.T)', '160.00', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1555, 1, 'Bolt Flange 6x20 (A.B.I)', '180.00', 4, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1554, 1, 'Bolt Flange 6x15 (T.T)', '150.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1553, 1, 'Bolt Flange 6x15 (A.B.I)', '190.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1552, 1, 'Bolt Flange 6x15 (A.J)', '160.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.J)', 0, 1, '2017-03-20 14:55:20'),
(1551, 1, 'Bolt Flange 6x12 (T.T)', '130.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:20'),
(1550, 1, 'Bolt Flange 6x12 (A.B.I)', '180.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:20'),
(1549, 1, 'Bolt Flange 6x12 (A.J)', '150.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1548, 1, 'Bolt Flange 6x6 (T.T)', '120.00', 24, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1547, 1, 'Bolt Flange 6x6 (A.B.I)', '130.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1546, 1, 'Bolt Flange 6x6 (A.J)', '140.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1545, 1, 'Bolt Hex 8x60 (T.T)', '200.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã›ÂÃ˜Â§Ã˜Â¦Ã›ÂŒ Ã˜Â§Ã˜Â³Ã™Â¾Ã›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1544, 1, 'Bolt Hex 8x60 (A.B.I)', '260.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã›ÂÃ˜Â§Ã˜Â¦Ã›ÂŒ Ã˜Â§Ã˜Â³Ã™Â¾Ã›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1543, 1, 'Bolt Hex 8x60 (A.J)', '300.00', 0, '', 'ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã›ÂÃ˜Â§Ã˜Â¦Ã›ÂŒ Ã˜Â§Ã˜Â³Ã™Â¾Ã›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1542, 1, 'Bolt Hex 8x45 (T.T)', '170.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x45) (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1541, 1, 'Bolt Hex 8x45 (A.B.I)', '220.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x45) (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1540, 1, 'Bolt Hex 8x45 (A.J)', '250.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x45) (A.J', 0, 1, '2017-03-20 14:55:19'),
(1539, 1, 'Bolt Hex 8x40 (T.T)', '140.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x40) (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1538, 1, 'Bolt Hex 8x40 (A.B.I)', '190.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x40) (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1537, 1, 'Bolt Hex 8x40 (A.J)', '225.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±13 Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (8x40) (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1536, 1, 'Bolt Hex 8x35 (T.T)', '140.00', 43, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1535, 1, 'Bolt Hex 8x35 (A.B.I)', '170.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1534, 1, 'Bolt Hex 8x35 (A.J)', '205.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1533, 1, 'Bolt Hex 8x30 (T.T)', '130.00', 45, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1532, 1, 'Bolt Hex 8x30 (A.B.I)', '150.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1531, 1, 'Bolt Hex 8x30 (A.J)', '190.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1530, 1, 'Bolt Hex 8x25 (T.T)', '130.00', 15, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1529, 1, 'Bolt Hex 8x25 (A.B.I)', '130.00', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1528, 1, 'Bolt Hex 8x25 (A.J)', '175.00', 0, '', ' Ã™ÂÃ›ÂŒÃ™ÂˆÃ™Â„ Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1527, 1, 'Bolt Hex 8x20 (T.T)', '180.00', 40, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1526, 1, 'Bolt Hex 8x20 (A.B.I)', '220.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1525, 1, 'Bolt Hex 8x20 (A.J)', '160.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1524, 1, 'Bolt Hex 8x15 (T.T)', '140.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1523, 1, 'Bolt Hex 8x15 (A.B.I)', '200.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1522, 1, 'Bolt Hex 8x15 (A.J)', '145.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1521, 1, 'Bolt Hex 8x12 (T.T)', '130.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1520, 1, 'Bolt Hex 8x12 (A.B.I)', '180.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1519, 1, 'Bolt Hex 8x12 (A.J)', '135.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1518, 1, 'Bolt Hex 6x50 (T.T)', '110.00', 7, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1517, 1, 'Bolt Hex 6x50 (A.B.I)', '125.00', 0, '', 'ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1516, 1, 'Bolt Hex 6x50 (A.J)', '300.00', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1515, 1, 'Bolt Hex 6x45 (T.T)', '80.00', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1514, 1, 'Bolt Hex 6x45 (A.B.I)', '110.00', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1513, 1, 'Bolt Hex 6x45 (A.J)', '270.00', 0, '', ' ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã˜Âª ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1512, 1, 'Bolt Hex 6x40 (T.T)', '180.00', 8, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:19'),
(1511, 1, 'Bolt Hex 6x40 (A.B.I)', '200.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1510, 1, 'Bolt Hex 6x40 (A.J)', '250.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â± Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:19'),
(1509, 1, 'Bolt Hex 6x35 (T.T)', '170.00', 6, '', ' ÃšÂ©Ã›ÂŒÃ˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1508, 1, 'Bolt Hex 6x35 (A.B.I)', '180.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1507, 1, 'Bolt Hex 6x35 (A.J)', '225.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1506, 1, 'Bolt Hex 6x30 (T.T)', '150.00', 8, '', ' ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1505, 1, 'Bolt Hex 6x30 (A.B.I)', '160.00', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1503, 1, 'Bolt Hex 6x25 (T.T)', '130.00', 1, '', ' ÃšÂ©Ã›ÂŒÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1504, 1, 'Bolt Hex 6x30 (A.J)', '210.00', 0, '', ' ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1502, 1, 'Bolt Hex 6x25 (A.B.I)', '150.00', 0, '', 'ÃšÂ©Ã›ÂŒÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1501, 1, 'Bolt Hex 6x25 (A.J)', '185.00', 0, '', ' ÃšÂ©Ã›ÂŒÃšÂ© Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1500, 1, 'Bolt Hex 6x20 (T.T)', '120.00', 11, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1499, 1, 'Bolt Hex 6x20 (A.B.I)', '140.00', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1498, 1, 'Bolt Hex 6x20 (A.J)', '160.00', 0, '', ' ÃšÂ¯Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1497, 1, 'Bolt Hex 6x15 (T.T)', '90.00', 52, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆ ÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1496, 1, 'Bolt Hex 6x15 (A.B.I)', '100.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆ ÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1495, 1, 'Bolt Hex 6x15 (A.J)', '150.00', 0, '', 'Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™Â…ÃšÂˆ ÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1494, 1, 'Bolt Hex 6x12 (T.T)', '80.00', 117, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1493, 1, 'Bolt Hex 6x12 (A.B.I)', '100.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1492, 1, 'Bolt Hex 6x12 (A.J)', '140.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1491, 1, 'Bolt Hex 6x8 (T.T)', '90.00', 0, '', ' Ã™ÂÃ˜Â± Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:19'),
(1490, 1, 'Bolt Hex 6x8 (A.B.I)', '100.00', 0, '', ' Ã™ÂÃ˜Â± Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:19'),
(1489, 1, 'Bolt Hex 6x8 (A.J)', '110.00', 0, '', ' Ã™ÂÃ˜Â± Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:19'),
(1488, 1, 'Bolt Hex 6x6 (T.T)', '100.00', 0, '', ' ÃšÂ†Ã›Â’ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T) ', 0, 1, '2017-03-20 14:55:19'),
(1487, 1, 'Bolt Hex 6x6 (A.B.I)', '90.00', 0, '', ' ÃšÂ†Ã›Â’ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I) ', 0, 1, '2017-03-20 14:55:19'),
(1486, 1, 'Bolt Hex 6x6 (A.J)', '100.00', 0, '', ' ÃšÂ†Ã›Â’ ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.J) ', 0, 1, '2017-03-20 14:55:19'),
(1485, 1, 'Bolt Hex 5x35 (T.T)', '110.00', 0, '', ' Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã˜Â¨Ã˜Â± 8 (5x35) (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1483, 1, 'Bolt Hex 5x35 (A.J)', '150.00', 0, '', ' Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã˜Â¨Ã˜Â± 8 (5x35) (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1484, 1, 'Bolt Hex 5x35 (A.B.I)', '130.00', 0, '', ' Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã˜Â¨Ã˜Â± 8 (5x35) (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1482, 1, 'Bolt Hex 5x30 (T.T)', '100.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:18'),
(1481, 1, 'Bolt Hex 5x30 (A.B.I)', '120.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1480, 1, 'Bolt Hex 5x30 (A.J)', '140.00', 0, '', 'Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:18'),
(1479, 1, 'Bolt Hex Fixed Washer (6x6) (A.J)', '200.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1478, 1, 'Mud Flapper Screw Com Black (T.T)', '100.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1477, 1, 'Mud Flapper Screw Complete Black (A.B.I)', '110.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1476, 1, 'Mud Flapper Screw Complete Black (A.J)', '170.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„(A.J)', 0, 1, '2017-03-20 14:55:18'),
(1475, 1, 'Mud Flapper Screw Com White (T.T)', '100.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1474, 1, 'Mud Flapper Screw Com Wht (ABI)', '140.00', 142, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1473, 1, 'Mud Flapper Screw Complete White (A.J)', '180.00', 0, '', ' Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1472, 1, 'Ex-Muffler Hood Screw 5x7 (A.B.I)', '130.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã™Â„Ã™Â†Ã˜Â³Ã˜Â± Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I) 5x7 ', 0, 1, '2017-03-20 14:55:18'),
(1471, 1, 'Ex-Muffler Hood Screw 5x7 (A.J)', '140.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã™Â„Ã™Â†Ã˜Â³Ã˜Â± Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J) 5x7 ', 0, 1, '2017-03-20 14:55:18'),
(1470, 1, 'Engine Axle Upper (8x115) (T.T)', '150.00', 55, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:18'),
(1469, 1, 'Engine Axle Upper (8x115) (A.B.I)', '200.00', 105, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1468, 1, 'Engine Axle Upper (8x115) (A.J)', '220.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â(A.J)', 0, 1, '2017-03-20 14:55:18'),
(1467, 1, 'Engine Axle Lower (8x111) (T.T)', '150.00', 24, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã™Â¹ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:18'),
(1466, 1, 'Engine Axle Lower (8x111) (A.B.I)', '200.00', 114, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã™Â¹ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:18');
INSERT INTO `items` (`id`, `type`, `title`, `unit_price`, `quantity`, `name_in_urdu`, `name_in_urdu_text`, `low_stock_quantity`, `status`, `ts`) VALUES
(1465, 1, 'Engine Axle Lower (8x111) (A.J)', '220.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã™Â¹ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:18'),
(1464, 1, 'Front Grari Bolt (Green)  (A.J)', '108.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (ÃšÂ¯Ã˜Â±Ã›ÂŒÃ™Â† ) (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1463, 1, 'Sprocket Bolt Kit White (T.T) ', '220.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (T.T) ', 0, 1, '2017-03-20 14:55:18'),
(1462, 1, 'Sprocket Bolt Kit White (A.B.I) ', '160.00', 360, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.B.I) ', 0, 1, '2017-03-20 14:55:18'),
(1461, 1, 'Sprocket Bolt Kit White (A.J) ', '200.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ›ÂŒÃ˜Â¯(A.J) ', 0, 1, '2017-03-20 14:55:18'),
(1460, 1, 'Engine Bolt Kit WH CG 125(A.B.I)', '120.00', 0, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.B.I) CG 125 ', 0, 1, '2017-03-20 14:55:18'),
(1459, 1, 'Engine Bolt Kit WH CG 125(A.J)', '140.00', 2, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.J) CG 125 ', 0, 1, '2017-03-20 14:55:18'),
(1458, 1, 'Engine Bolt Kit WH CDI 70(T.T)', '80.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (T.T) CDI 70 ', 0, 1, '2017-03-20 14:55:18'),
(1457, 1, 'Engine Bolt Kit WH CDI 70(A.B.I)', '110.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.B.I) CDI 70 ', 0, 1, '2017-03-20 14:55:18'),
(1456, 1, 'Engine Bolt Kit WH CDI 70(A.J)', '130.00', 100, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ (A.J) CDI 70 ', 0, 1, '2017-03-20 14:55:18'),
(1455, 1, 'Engine Cover Bolt 6x100 (T.T)', '230.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x100) P.8 (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1454, 1, 'Engine Cover Bolt 6x100 (A.B.I)', '250.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x100) P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1453, 1, 'Engine Cover Bolt 6x100 (A.J)', '180.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x100) P.8 (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1452, 1, 'Engine Cover Bolt 6x70 (T.T)', '150.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x70) P.8 (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1451, 1, 'Engine Cover Bolt 6x70 (A.B.I)', '185.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x70) P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1450, 1, 'Engine Cover Bolt 6x70 (A.J)', '140.00', 1, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x70) P.8 (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1449, 1, 'Engine Cover Bolt 6x65 (T.T)', '140.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x65) P.8 (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1448, 1, 'Engine Cover Bolt 6x65 (A.B.I)', '170.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x65) P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1447, 1, 'Engine Cover Bolt 6x65 (A.J)', '250.00', 1, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x65) P.8 (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1446, 1, 'Clutch Cover Bolt 6x60 (T.T)', '120.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ P.8 (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1445, 1, 'Clutch Cover Bolt 6x60 (A.B.I)', '150.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1444, 1, 'Clutch Cover Bolt 6x60 (A.J)', '210.00', 1, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ P.8 (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1443, 1, 'Clutch Cover Bolt 6x55 (T.T)', '110.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â P.8 (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1442, 1, 'Bolt Hex 5x25 (A.B.I)', '100.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1441, 1, 'Clutch Cover Bolt 6x55 (A.B.I)', '150.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â P.8 (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1440, 1, 'Clutch Cover Bolt 6x55 (A.J)', '195.00', 5, '', 'ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â P.8 (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1439, 1, 'Bolt Hex 5x25 (T.T)', '110.00', 1, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(T.T)', 0, 1, '2017-03-20 14:55:18'),
(1438, 1, 'Head Light Bolt Chrome (8x20) (A.B.I)', '110.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1437, 1, 'Rear Fender Bolt (8x28) (A.B.I)', '90.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™Â…Ã˜Â±ÃšÂ¯Ã˜Â§ÃšÂˆ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (8x28) (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1436, 1, 'Pin Guide Roller Chrome (A.B.I)', '160.00', 0, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â…(A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1435, 1, 'Bolt Hex 5x25 (A.J)', '170.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1434, 1, 'Pin Guide Roller (T.T)', '160.00', 5, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ©Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:18'),
(1433, 1, 'Pin Guide Roller (A.B.I)', '120.00', 0, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ©Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1432, 1, 'Pin Guide Roller (A.J)', '160.00', 0, '', ' Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ©Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:18'),
(1431, 1, 'Bolt Hex 5x20 (T.T)', '90.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1430, 1, 'Head Cylender Bolt 6x23(T.T)', '100.00', 4, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†ÃšÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹  6x23 (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1429, 1, 'Bolt Hex 5x20 (A.B.I)', '100.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1428, 1, 'Head Cylender Bolt Chrome 6x23(A.B.I)', '100.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†ÃšÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… 6x23 (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1427, 1, 'Head Cylender Bolt Chrome 6x23(A.J)', '150.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†ÃšÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… 6x23 (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1426, 1, 'Bolt Hex 5x20 (A.J)', '110.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1425, 1, 'Bolt Hex(5x12)Black P-9(TT)', '80.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)(P.9)', 0, 1, '2017-03-20 14:55:18'),
(1424, 1, 'Bolt Hex(5x12)Black P-9(ABI)', '90.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.B.I)(P.9)', 0, 1, '2017-03-20 14:55:18'),
(1423, 1, 'Timing Cover Bolt (6x110) (T.T)', '120.00', 13, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1422, 1, 'Timing Cover Bolt (6x110) (A.B.I)', '100.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1421, 1, 'Timing Cover Bolt (6x110) (A.J)', '120.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã™Â¹ÃšÂ©Ã™Â„Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1420, 1, 'Bolt Hex(5x12)Black P-9(AJ)', '140.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.J)(P.9) ', 0, 1, '2017-03-20 14:55:18'),
(1419, 1, 'Tikli Bolt (5x12) White (A.B.I)', '130.00', 0, '', ' Ã˜Â§Ã›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹5x12 Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1417, 1, 'Bolt Hex 5x15 (T.T)', '80.00', 20, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:18'),
(1418, 1, 'Tikli Bolt (5x12) White (A.J)', '140.00', 0, '', ' Ã˜Â§Ã›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹5x12 Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(A.J)', 0, 1, '2017-03-20 14:55:18'),
(1416, 1, 'Fuel Tank Monogram Screw (3x6)(A.B.I)', '40.00', 0, '', ' Ã™Â…Ã™ÂˆÃ™Â†Ã™ÂˆÃšÂ¯Ã˜Â±Ã˜Â§Ã™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1415, 1, 'Fuel Tank Monogram Screw (3x6)(A.J)', '50.00', 0, '', ' Ã™Â…Ã™ÂˆÃ™Â†Ã™ÂˆÃšÂ¯Ã˜Â±Ã˜Â§Ã™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:18'),
(1414, 1, 'Limiter Pipe Bolt Large Comp(T.T)', '100.00', 9, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ (T.T)', 0, 1, '2017-03-20 14:55:18'),
(1413, 1, 'Limiter Pipe Bolt Large Comp (A.B.I)', '100.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã™Â…ÃšÂ©Ã™Â…Ã™Â„(A.B.I)', 0, 1, '2017-03-20 14:55:18'),
(1412, 1, 'Limiter Pipe Bolt Large Comp (A.J)', '100.00', 0, '', 'ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§Ã™Â…ÃšÂ©Ã™Â…Ã™Â„(A.J) ', 0, 1, '2017-03-20 14:55:18'),
(1411, 1, 'Limiter Pipe Bolt Large 8x32 (T.T)', '250.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1410, 1, 'Limiter Pipe Bolt Large 8x32 (A.B.I)', '300.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1409, 1, 'Limiter Pipe Bolt Large 8x32 (A.J)', '325.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:17'),
(1408, 1, 'Limiter Pipe Bolt Small 8x25 (T.T)', '225.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1407, 1, 'Limiter Pipe Bolt Small 8x25 (A.B.I)', '325.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1406, 1, 'Limiter Pipe Bolt Small 8x25 (A.J)', '325.00', 0, '', ' ÃšÂˆÃ˜Â±Ã™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:17'),
(1405, 1, 'Head Light Screw 5x12 (Black) (T.T)', '120.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™ÂˆÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1404, 1, 'Head Light Screw 5x12 (Black) (A.B.I)', '120.00', 13, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1403, 1, 'Head Light Screw 5x12 (Black) (A.J)', '130.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:17'),
(1402, 1, 'Head Light Screw 5x12(D.Green) (T.T)', '90.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1401, 1, 'Head Light Screw 5x12(D.Green)(A.B.I)', '100.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1400, 1, 'Head Light Screw 5x12(D.Green) (A.J)', '110.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(A.J)', 0, 1, '2017-03-20 14:55:17'),
(1399, 1, 'Bolt Hex Fixed Washer (6x20)(T.T)', '130.00', 2, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1398, 1, 'Bolt Hex Fixed Washer (6x20) (A.B.I)', '130.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1397, 1, 'Bolt Hex Fixed Washer (6x20) (A.J)', '140.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:17'),
(1396, 1, 'Bolt Hex Fixed Washer (6x12) (T.T)', '140.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1395, 1, 'Bolt Hex Fixed Washer (6x12) (A.B.I)', '180.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1394, 1, 'Bolt Hex Fixed Washer (6x12) (A.J)', '220.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:17'),
(1393, 1, 'Bolt Hex Fixed Washer (6x6) (T.T)', '130.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1392, 1, 'Bolt Hex Fixed Washer (6x6) (A.B.I)', '150.00', 14, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1391, 1, 'Clutch Gundi (T.T)', '180.00', 42, '', ' ÃšÂ©Ã™Â„ÃšÂ† ÃšÂ¯Ã™Â†ÃšÂˆÃ›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1389, 1, 'Silencer Stud (T.T)', '60.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1387, 1, 'Center Axle (T.T)', '160.00', 0, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1388, 1, 'Silencer Stud (A.B.I)', '160.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1386, 1, 'Center Axle (A.B.I)', '175.00', 130, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â±(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1385, 1, 'Rear Wheel Axle (T.T)', '190.00', 0, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™ÂˆÃ›ÂŒÃ™Â„(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1383, 1, 'Front Wheel Axle (T.T)', '140.00', 8, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1384, 1, 'Rear Wheel Axle (A.B.I)', '200.00', 52, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™ÂˆÃ›ÂŒÃ™Â„(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1382, 1, 'Front Wheel Axle (A.B.I)', '130.00', 55, '', ' Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1381, 1, 'Limiter Pipe Golden (T.T)', '140.00', 7, '', ' Ã™Â„Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¾Ã˜Â§Ã˜Â¦Ã™Â¾ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â†(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1380, 1, 'Limiter Pipe Golden (A.B.I)', '130.00', 0, '', 'Ã™Â„Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¾Ã˜Â§Ã˜Â¦Ã™Â¾ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â†(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1379, 1, 'Main Stand Pin CD(T.T)', '325.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† (T.T)CD', 0, 1, '2017-03-20 14:55:17'),
(1378, 1, 'Main Stand Pin CD(A.B.I)', '325.00', 156, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â†CD (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1376, 1, 'Brake Rod (A.B.I)', '300.00', 11, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ(A.B.I) ', 0, 1, '2017-03-20 14:55:17'),
(1377, 1, 'Brake Rod (T.T)', '180.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ(T.T) ', 0, 1, '2017-03-20 14:55:17'),
(1375, 1, 'Chain Adjuster Right (T.T)', '80.00', 10, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1374, 1, 'Chain Adjuster Right (A.B.I)', '100.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1373, 1, 'Chain Adjuster Left (T.T)', '80.00', 18, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ Ã˜Â¨ÃšÂ‘Ã›ÂŒ(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1372, 1, 'Chain Adjuster Left (A.B.I)', '80.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ Ã˜Â¨ÃšÂ‘Ã›ÂŒ(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1371, 1, 'Wheel Sleeve Foji Color (T.T)', '120.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ Ã™ÂÃ™ÂˆÃ˜Â¬Ã›ÂŒ ÃšÂ©Ã™Â„Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1370, 1, 'Wheel Sleeve Golden (T.T)', '150.00', 0, '', 'Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ Golden (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1369, 1, 'Bolt Hex 5x15 (A.B.I)', '90.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1368, 1, 'Wheel Sleeve Golden (A.B.I)', '300.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ Golden (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1367, 1, 'Bolt Hex 5x15 (A.J)', '100.00', 0, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§(A.J)', 0, 1, '2017-03-20 14:55:17'),
(1365, 1, 'Wheel Sleeve White (A.B.I)', '300.00', 37, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ (A.B.I) White ', 0, 1, '2017-03-20 14:55:17'),
(1366, 1, 'Wheel Sleeve White (T.T)', '150.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ (T.T) White ', 0, 1, '2017-03-20 14:55:17'),
(1364, 1, 'Bolt Hex 5x12 (T.T)', '100.00', 1, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(T.T)(P.8)', 0, 1, '2017-03-20 14:55:17'),
(1362, 1, 'Engine Oil Bolt 110 (A.B.I)', '150.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹110 (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1363, 1, 'Engine Oil Bolt 110 (T.T)', '120.00', 25, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹110 (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1361, 1, 'Bolt Hex 5x12 (A.B.I)', '80.00', 0, '', ' Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.B.I)(P.8)', 0, 1, '2017-03-20 14:55:17'),
(1360, 1, 'Engine Oil Bolt CD (T.T)', '100.00', 90, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹CD (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1359, 1, 'Engine Oil Bolt CD (A.B.I)', '150.00', 0, '', ' Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹CD (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1358, 1, 'Bolt Hex 5x12 (A.J)', '90.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.J)(P.8)', 0, 1, '2017-03-20 14:55:17'),
(1357, 1, 'Front Jump Bolt Set Hero(T.T)', '160.00', 2, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹ Ã›ÂÃ›ÂŒÃ˜Â±Ã™Âˆ(T.T) ', 0, 1, '2017-03-20 14:55:17'),
(1632, 0, 'Bolt Hex D/W(8x20)(ABI)', '3.20', 400, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(ABI)', 2000, 1, '2017-05-04 12:45:52'),
(1356, 1, 'Front Jump Bolt Set Hero(A.B.I)', '170.00', 0, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹ Ã›ÂÃ›ÂŒÃ˜Â±Ã™Âˆ(A.B.I) ', 0, 1, '2017-03-20 14:55:17'),
(1355, 1, 'Front Jump Bolt Set 125 (T.T)', '200.00', 0, '', 'Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹(T.T) 125', 0, 1, '2017-03-20 14:55:17'),
(1354, 1, 'Front Jump Bolt Set 125(A.B.I)', '240.00', 16, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹(A.B.I) 125', 0, 1, '2017-03-20 14:55:17'),
(1353, 1, 'Front Jump Bolt CD(T.T)', '9.00', 2000, '', 'Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ CD', 0, 1, '2017-03-20 14:55:17'),
(1352, 1, 'Front Jump Bolt Set CD(A.B.I)', '140.00', 25, '', ' Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã›ÂŒÃ™Â¹(A.B.I) CD', 0, 1, '2017-03-20 14:55:17'),
(1351, 1, 'Side Stand Bolt (T.T)', '160.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(T.T)', 0, 1, '2017-03-20 14:55:17'),
(1350, 1, 'Side Stand Bolt (A.B.I)', '160.00', 23, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1349, 1, 'Bolt S/W (10x20) (T.T)', '100.00', 20, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ Ã˜Â³Ã™Â†ÃšÂ¯Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1348, 1, 'Bolt Hex S/W (10x20) (A.B.I)', '110.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ Ã˜Â³Ã™Â†ÃšÂ¯Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1347, 1, 'Rear Foot Rest Bolt D/W (10x20) (T.T)', '120.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ ÃšÂˆÃ˜Â¨Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1346, 1, 'Rear Foot Rest Bolt D/W (10x20) (A.B.)', '120.00', 41, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ ÃšÂˆÃ˜Â¨Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1345, 1, 'Head Light Bolt Chrome (8x20) (T.T)', '90.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1343, 1, 'Fuel Tank Bush (A.B.I)', '120.00', 0, '', ' Ã™Â¹Ã™Â†ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã˜Â´ /ÃšÂˆÃ˜Â§Ã™ÂˆÃ™Â„ (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1344, 1, 'Front Sprocket Lock CD (A.B.I)', '60.00', 50, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›ÂŒ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ ÃšÂ©Ã˜Â§ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 CD (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1342, 1, 'Golden Washer No.17 (T.T)', '70.00', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1341, 1, 'Golden Washer No.17 (A.B.I)', '80.00', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1340, 1, 'Golden Washer No.14 (T.T)', '60.00', 14, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (T.T)', 0, 1, '2017-03-20 14:55:17'),
(1339, 1, 'Golden Washer No.14 (A.B.I)', '70.00', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (A.B.I)', 0, 1, '2017-03-20 14:55:17'),
(1338, 1, 'Golden Washer No.12 (T.T)', '60.00', 50, '', 'ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1337, 1, 'Golden Washer No.12 (A.B.I)', '120.00', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1336, 1, 'Golden Washer No.10 (T.T)', '50.00', 189, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1335, 1, 'Golden Washer No.10 (A.B.I)', '60.00', 0, '', ' ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1334, 1, 'Rear Wheel Axle Bush (A.B.I)', '180.00', 1, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã˜Â´ (A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1333, 1, 'Front Wheel Axle Bush (A.B.I)', '150.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã˜Â´(A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1331, 1, 'Moon Patti CD (A.B.I)', '140.00', 24, '', ' ÃšÂ†Ã˜Â§Ã™Â†Ã˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I) CD ', 0, 1, '2017-03-20 14:55:16'),
(1332, 1, 'Wheel Sleeve Bush (A.B.I)', '100.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã™Â„Ã™Âˆ ÃšÂ©Ã˜Â§ Ã˜Â¨Ã˜Â´ (A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1330, 1, 'Sprocket Patti (T.T)', '60.00', 144, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã™Â¾Ã™Â¹Ã›ÂŒ(T.T)', 0, 1, '2017-03-20 14:55:16'),
(1329, 1, 'Sprocket Patti (A.B.I)', '95.00', 57, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã™Â¾Ã™Â¹Ã›ÂŒ(A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1328, 1, 'Spacer Washer (A.B.I)', '130.00', 0, '', 'Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã›ÂŒ Ã˜Â§Ã™Â†Ã˜Â¯ Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±(A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1327, 1, 'Plain Washer (12x27x3) (A.B.I)', '200.00', 2, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±17Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1326, 1, 'Plain Washer (12x27x2) (A.B.I)', '150.00', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±17Ã™Â¾Ã˜ÂªÃ™Â„Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1325, 1, 'Plain Washer (10x20x2) (A.B.I)', '70.00', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1324, 1, 'Plain Washer (8x17x2) (A.B.I)', '100.00', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1323, 1, 'Plain Washer (6x24x2) (A.B.I)', '100.00', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã˜Â¨ÃšÂ‘Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1322, 1, 'Plain Washer (6x17x2) (A.B.I)', '100.00', 0, '', ' ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1321, 1, 'Plain Washer Head (6x13x2) (T.T)', '50.00', 1, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1320, 1, 'Spring Washer (12mm) (T.T)Gross', '100.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1319, 1, 'Spring Washer (12mm) (A.B.I)', '100.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1318, 1, 'Spring Washer (10mm) (T.T)', '80.00', 11, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1317, 1, 'Spring Washer (10mm) (A.B.I)Gross ', '80.00', 1, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1316, 1, 'Spring Washer (8mm) (T.T)Gross', '60.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 12 (T.T) ', 0, 1, '2017-03-20 14:55:16'),
(1314, 1, 'Spring Washer (6mm)(T.T)', '80.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± (T.T)10 ', 0, 1, '2017-03-20 14:55:16'),
(1315, 1, 'Spring Washer (8mm) (A.B.I)', '70.00', 85, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12 (A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1313, 1, 'Spring Washer (6mm)(A.B.I)', '100.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± (A.B.I) 10', 0, 1, '2017-03-20 14:55:16'),
(1312, 1, 'Washer No.8 Small White (T.T)(Gross)', '75.00', 38, '', ' Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 8 ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)ÃšÂ¯Ã˜Â±Ã™ÂˆÃ˜Â³', 0, 1, '2017-03-20 14:55:16'),
(1310, 1, 'Chawani Washer Wht T.T Gross', '80.00', 3, '', ' ÃšÂ†Ã™ÂˆÃ™Â†Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)ÃšÂ¯Ã˜Â±Ã™ÂˆÃ˜Â³', 0, 1, '2017-03-20 14:55:16'),
(1311, 1, 'Washer No.10 Small White (T.T)(Gross)', '90.00', 0, '', ' Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)ÃšÂ¯Ã˜Â±Ã™ÂˆÃ˜Â³', 0, 1, '2017-03-20 14:55:16'),
(1309, 1, 'Chrome Washer (10mm)(T.T)', '150.00', 4, '', ' ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1308, 1, 'Chrome Washer (10mm)(A.B.I)', '150.00', 0, '', 'ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1307, 1, 'Oil Bolt Washer Silver 110 (T.T)', '100.00', 3, '', 'Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± 110 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1306, 1, 'Front Fork Cap Nut (A.B.I)', '160.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹(A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1305, 1, 'Nut Hex (4mm) (T.T)', '60.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 6 Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1304, 1, 'Nut Hex (4mm) (A.B.I)', '70.00', 125, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 6 Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1303, 1, 'Main Stand Pin Nut (12x19) (A.B.I)', '150.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹(12x19) (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1302, 1, 'Main Stand Pin Nut (12x17) (A.B.I)', '250.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹(12x17) (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1301, 1, 'Nut Hex (5mm) (T.T)', '40.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±8 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1300, 1, 'Nut Hex (5mm) (A.B.I)', '80.00', 35, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±8 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1299, 1, 'Nut Hex (6mm) (T.T)', '110.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1298, 1, 'Nut Hex (6mm) (A.B.I)', '60.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1297, 1, 'Nut Hex No.14 (10x14) (T.T)', '100.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1296, 1, 'Nut Hex No.14 (10x14) (A.B.I)', '180.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1295, 1, 'Nut Hex No.13 (8x13) (T.T)', '120.00', 0, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1294, 1, 'Nut Hex No.13 (8x13) (A.B.I)', '120.00', 4, '', ' Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1293, 1, 'Side Stand Nut(10x17) (A.B.I)', '110.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â†Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1292, 1, 'Head Light Case Nut (A.B.I)', '200.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã™Â†Ã™Â¹ ÃšÂ©ÃšÂ¾Ã™ÂˆÃ™Â¾ÃšÂ‘Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1291, 1, 'Meter Cap Nut (6mm) (T.T)', '110.00', 10, '', ' ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:16'),
(1290, 1, 'Meter Cap Nut (6mm) (A.B.I)', '180.00', 16, '', ' ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1289, 1, 'Flange Cap Nut Small (6mm) (A.B.I)', '300.00', 0, '', ' ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â§Ã™Â„ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1288, 1, 'Flange Cap Nut Long 6mm T.T', '300.00', 114, '', ' Ã™Â„Ã™ÂˆÃ™Â†ÃšÂ¯ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1287, 1, 'Flange Cap Nut Long 6mm A.B.I', '350.00', 0, '', ' Ã™Â„Ã™ÂˆÃ™Â†ÃšÂ¯ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1286, 1, 'Rear Shock Cap Nut (10x14) (T.T)', '80.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1285, 1, 'Rear Shock Cap Nut (10x14) (A.B.I)', '200.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 14 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1284, 1, 'Rear Shock Cap Nut (10x17) (T.T)', '100.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1283, 1, 'Rear Shock Cap Nut (10x17) (A.B.I)', '150.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1282, 1, 'Nut Flange (14mm) (T.T)', '0.00', 0, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±19 (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1281, 1, 'Nut Flange (12mm) (A.B.I)', '220.00', 0, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±17 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1280, 1, 'Nut Flange (10mm) (A.B.I)', '120.00', 45, '', 'ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1279, 1, 'Nut Flange (8mm) (A.B.I)', '150.00', 9, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±12 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1278, 1, 'Nut Flange (6mm) (A.B.I)', '90.00', 1, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1276, 1, 'Center Axle Lock Nut (10mm) (A.B.I)', '225.00', 2, '', ' ÃšÂ†Ã™Â…Ã™Â¹Ã›Â Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1277, 1, 'Nut Flange (5mm) (A.B.I)', '80.00', 0, '', ' ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±8 (A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1275, 1, 'Rear Axle Nut Coller (T.T)', '80.00', 4, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2017-03-20 14:55:16'),
(1274, 1, 'Rear Axle Nut Coller (A.B.I)', '180.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1273, 1, 'Rear Axle Nut Hex (T.T)', '140.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã˜Â¨Ã˜ÂºÃ›ÂŒÃ˜Â± ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(T.T) ', 0, 1, '2017-03-20 14:55:16'),
(1272, 1, 'Rear Axle Nut Hex (A.B.I)', '80.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â†Ã™Â¹ Ã˜Â¨Ã˜ÂºÃ›ÂŒÃ˜Â± ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±(A.B.I) ', 0, 1, '2017-03-20 14:55:16'),
(1271, 1, 'Front Axle Nut (T.T)', '70.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã˜Â§Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹(T.T)', 0, 1, '2017-03-20 14:55:16'),
(1270, 1, 'Front Axle Nut (A.B.I)', '70.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹(A.B.I)', 0, 1, '2017-03-20 14:55:16'),
(1268, 1, 'Brake Switch Spring (T.T)', '126.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â³Ã™ÂˆÃ˜Â¦ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1269, 1, 'Oil Bolt Washer Silver CD (T.T)', '100.00', 0, '', ' Ã˜Â¢Ã˜Â¦Ã™Â„ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± CD (T.T)', 0, 1, '2017-03-20 14:55:16'),
(1267, 1, 'Brake Switch Spring (A.B.I)', '150.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â³Ã™ÂˆÃ˜Â¦ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1266, 1, 'Clutch Spring (T.T)', '60.00', 25, '', ' ÃšÂ©Ã™Â„ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1265, 1, 'Clutch Spring (A.B.I)', '120.00', 0, '', ' ÃšÂ©Ã™Â„ÃšÂ† Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1264, 1, 'Main Stand Spring White (T.T)', '100.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1263, 1, 'Main Stand Spring White (A.B.I)', '110.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1262, 1, 'Main Stand Spring Golden (T.T)', '100.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1261, 1, 'Main Stand Spring Golden (A.B.I)', '110.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1260, 1, 'Side Stand Spring White (T.T)', '100.00', 1, '', 'Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1259, 1, 'Side Stand Spring White (A.B.I)', '100.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1258, 1, 'Side Stand Spring Golden (T.T)', '100.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1257, 1, 'Side Stand Spring Golden (A.B.I)', '100.00', 0, '', ' Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1256, 1, 'Brake Spring White (T.T)', '70.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1255, 1, 'Brake Spring White (A.B.I)', '80.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1254, 1, 'Brake Spring Golden (T.T)', '100.00', 21, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1253, 1, 'Brake Spring Golden (A.B.I)', '120.00', 0, '', ' Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1252, 1, 'Plain Washer (10x20x3) (T.T)', '120.00', 0, '', ' Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â± Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ(T.T) ', 0, 1, '2017-03-20 14:55:15'),
(1251, 1, 'Rear Shock Washer (10x25x3)(K.D.M)', '80.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± ÃšÂ©Ã™Â…Ã™Â¾Ã™Â†Ã›ÂŒ(K.D.M) ', 0, 1, '2017-03-20 14:55:15'),
(1249, 1, 'Rickshaw Washer (T.T)', '100.00', 0, '', ' Ã˜Â±ÃšÂ©Ã˜Â´Ã›Â Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â±(T.T)', 0, 1, '2017-03-20 14:55:15'),
(1250, 1, 'Plain Washer (17x26x3) (A.B.I)', '200.00', 0, '', ' Ã™Â…Ã›ÂŒÃšÂº Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â† Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ(A.B.I) ', 0, 1, '2017-03-20 14:55:15'),
(1248, 1, 'Silencer Packing Local (T.T)', '120.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â Ã™Â„Ã™ÂˆÃšÂ©Ã™Â„ (T.T) ', 0, 1, '2017-03-20 14:55:15'),
(1246, 1, 'Switch Patti (T.T)', '100.00', 12, '', ' Ã˜Â³Ã™Âˆ Ã˜Â¦ÃšÂ† Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1247, 1, 'Silencer Packing Copper (A.B.I)', '130.00', 9, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„ (A.B.I) ', 0, 1, '2017-03-20 14:55:15'),
(1245, 1, 'Switch Patti (A.B.I)', '100.00', 0, '', 'Ã˜Â³Ã™Âˆ Ã˜Â¦ÃšÂ† Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1244, 1, 'Career Patti (Flower) (T.T)', '130.00', 0, '', ' Ã™Â¾ÃšÂ¾Ã™ÂˆÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:15'),
(1242, 1, 'Z Patti Golden Large  (T.T)', '130.00', 6, '', ' Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1243, 1, 'Career Patti (Flower) (A.B.I)', '130.00', 25, '', ' Ã™Â¾ÃšÂ¾Ã™ÂˆÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:15'),
(1241, 1, 'Z Patti Golden Large (A.B.I)', '150.00', 0, '', 'Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1240, 1, 'L Patti Small (T.T)', '120.00', 34, '', 'Ã˜Â§Ã›ÂŒÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1238, 1, 'Z Patti Small (T.T)', '120.00', 34, '', 'Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1239, 1, 'L Patti Small (A.B.I)', '150.00', 0, '', 'Ã˜Â§Ã›ÂŒÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1237, 1, 'Z Patti Small (A.B.I)', '150.00', 0, '', 'Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1235, 1, 'Indicator Patti (A.B.I)', '130.00', 12, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1236, 1, 'Indicator Patti (T.T)', '120.00', 0, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1234, 1, 'Rear Wheel Bongli (T.T)', '150.00', 3, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1233, 1, 'Rear Wheel Bongli (A.B.I)', '160.00', 0, '', ' Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1232, 1, 'Front Wheel Bongli (T.T)', '130.00', 13, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1231, 1, 'Front Wheel Bongli (A.B.I)', '120.00', 0, '', ' Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ©Ã›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â†ÃšÂ¯Ã™Â„Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1230, 1, 'Front Sprocket Lock 125 (A.B.I)', '100.00', 0, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã›ÂŒ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ ÃšÂ©Ã˜Â§ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 17 125 (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1229, 1, 'Back Light Screw Old Model (A.B.I)', '100.00', 1, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â¾Ã˜Â±Ã˜Â§Ã™Â†Ã›Â Ã™Â…Ã˜Â§ÃšÂˆÃ™Â„ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1228, 1, 'Back Light Cover Screw (A.B.I)', '60.00', 7, '', ' Ã˜Â¨Ã›ÂŒÃšÂ© Ã™Â„Ã˜Â§Ã˜Â¦Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I) ', 0, 1, '2017-03-20 14:55:14'),
(1227, 1, 'Indicator Screw (A.B.I)', '40.00', 37, '', ' Ã˜Â§Ã˜Â´Ã˜Â§Ã˜Â±Ã›Â Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1226, 1, 'Meter Body Screw (A.B.I)', '60.00', 37, '', ' Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã˜Â§ÃšÂˆÃ›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I) ', 0, 1, '2017-03-20 14:55:14'),
(1224, 1, 'Rear Axle Nut 125 (ABI)', '280.00', 0, '', ' Ã™Â¾ÃšÂ†Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹ (ABI)125 ', 0, 1, '2017-03-20 14:55:14'),
(1225, 1, 'Cut Screw  (6x1/2) (A.B.I)', '50.00', 16, '', 'ÃšÂ©Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (6x1/2) (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1223, 1, 'Rear Axle Nut 125 (T.T)', '120.00', 0, '', ' Ã™Â¾ÃšÂ†Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™Â†Ã™Â¹ (T.T)125 ', 0, 1, '2017-03-20 14:55:14'),
(1222, 1, 'Handle Chek Nut 125 (T.T)', '200.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹ 125 (T.T) ', 0, 1, '2017-03-20 14:55:14'),
(1221, 1, 'Handle Chek Nut 125 (A.B.I)', '250.00', 2, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹ 125 (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1219, 1, 'Handle Chek Nut CD (A.B.I)', '250.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹ CD (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1220, 1, 'Handle Chek Nut CD (T.T)', '170.00', 0, '', ' Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ†Ã›ÂŒÃšÂ© Ã™Â†Ã™Â¹CD (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1218, 1, 'Front Fork Cap Nut (T.T)', '150.00', 29, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹(T.T) ', 0, 1, '2017-03-20 14:55:14'),
(1216, 1, 'Head Stud China (T.T)(4 piecs)', '200.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T) China', 0, 1, '2017-03-20 14:55:14'),
(1217, 1, 'Head Stud China (A.B.I)(4 piecs)', '300.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T) China', 0, 1, '2017-03-20 14:55:14'),
(1215, 1, 'Head Stud C.D (A.B.I)(4 piecs)', '300.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (A.B.I) C.D', 0, 1, '2017-03-20 14:55:14'),
(1214, 1, 'Head Stud C.D (T.T)(4 piecs)', '200.00', 0, '', ' Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ (T.T) C.D', 0, 1, '2017-03-20 14:55:14'),
(1213, 1, 'Bolt Hex (10x30) (T.T)', '170.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(T.T) ', 0, 1, '2017-03-20 14:55:14'),
(1212, 1, 'Bolt Hex (10x30) (A.B.I)', '220.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I) ', 0, 1, '2017-03-20 14:55:14'),
(1211, 1, 'Bolt Hex (10x25) (T.T)', '170.00', 28, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(T.T) ', 0, 1, '2017-03-20 14:55:14'),
(1210, 1, 'Rear Foot Rest Bolt Hex (10x25) (A.B.I)', '200.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã˜Â¯Ã˜Â±Ã™Â…Ã›ÂŒÃ˜Â§Ã™Â†Ã›Â(A.B.I) ', 0, 1, '2017-03-20 14:55:14'),
(1209, 1, 'Bolt Hex (10x20) (T.T)', '150.00', 43, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1208, 1, 'Bolt Hex (10x20) (A.B.I)', '180.00', 0, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1207, 1, 'Seat Frame Patti (T.T)Set', '150.00', 14, '', ' Ã˜Â³Ã›ÂŒÃ™Â¹ Ã™ÂÃ˜Â±Ã›ÂŒÃ™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1205, 1, 'Moon PAtti 125 (A.B.I)', '140.00', 0, '', ' ÃšÂ†Ã˜Â§Ã™Â†Ã˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I) 125 ', 0, 1, '2017-03-20 14:55:14'),
(1206, 1, 'Seat Frame Patti (A.B.I)Set', '150.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã™ÂÃ˜Â±Ã›ÂŒÃ™Â… Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1204, 1, 'Chain Lock 420  (A.B.I)', '75.00', 0, '', ' ÃšÂ†Ã›ÂŒÃ™Â† Ã™Â„Ã˜Â§ÃšÂ© (A.B.I) 420', 0, 1, '2017-03-20 14:55:14'),
(1203, 1, 'Horn Patti (T.T)', '60.00', 0, '', ' Ã›ÂÃ˜Â§Ã˜Â±Ã™Â† Ã™Â¾Ã™Â¹Ã›ÂŒ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1202, 1, 'Horn Patti (A.B.I)', '100.00', 32, '', 'Ã›ÂÃ˜Â§Ã˜Â±Ã™Â† Ã™Â¾Ã™Â¹Ã›ÂŒ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1201, 1, 'Brake Spring 125 White(T.T)', '60.00', 0, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (125) Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1200, 1, 'Brake Spring 125  White(A.B.I)', '80.00', 0, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ (125) Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1199, 1, 'Head Washer No.10 Silver (T.T)', '80.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± (T.T)', 0, 1, '2017-03-20 14:55:14'),
(1198, 1, 'Roller Bolt Washer Silver (T.T)', '60.00', 14, '', 'Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã˜Â³Ã™Â„Ã™ÂˆÃ˜Â± (T.T) ', 0, 1, '2017-03-20 14:55:14'),
(1197, 1, 'Pen Head Screw (4x30) (A.B.I)', '100.00', 34, '', ' Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x30) (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1196, 1, 'Pen Head Screw (4x30) (A.J)', '100.00', 0, '', ' Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x30) (A.J)', 0, 1, '2017-03-20 14:55:14'),
(1195, 1, 'Pen Head Screw (4x25) (A.B.I)', '160.00', 0, '', ' Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x25) (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1194, 1, 'Pen Head Screw (4x25) (A.J)', '90.00', 0, '', 'Ã™Â¾Ã›ÂŒÃ™Â† Ã›ÂÃ›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (4x25) (A.J)', 0, 1, '2017-03-20 14:55:14'),
(1193, 1, 'Flat Screw (5x12) (A.J)', '100.00', 0, '', 'Ã™ÂÃ™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (5x12) (A.J)', 0, 1, '2017-03-20 14:55:14'),
(1192, 1, 'Seat Belt Screw Chrome (A.B.I)', '150.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1191, 1, 'Mud Flapper Screw Wht(AJ)', '100.00', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:14'),
(1190, 1, 'Mud Flapper Screw  Black (A.B.I)', '120.00', 0, '', 'Ã˜Â¯Ã™ÂÃ™Â… Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1189, 1, 'CSK Screw (6x15) (A.B.I)', '100.00', 0, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I) ', 0, 1, '2017-03-20 14:55:14'),
(1188, 1, 'Carborator Tapa Screw (4x20) (A.B.I)', '70.00', 5, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1186, 1, 'Cut Screw (8x1/2) (A.B.I)', '50.00', 0, '', 'ÃšÂ©Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (8x1/2) (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1187, 1, 'Cut Screw (8x3/8) (A.B.I)', '50.00', 9, '', 'ÃšÂ©Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (8x3/8) (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1185, 1, 'Meter Cable Screw  (5x15) (A.B.I)', '80.00', 0, '', 'Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã›ÂŒÃ˜Â¨Ã™Â„ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1184, 1, 'Meter Cable Screw  (5x15) (A.J)', '100.00', 189, '', 'Ã™Â…Ã›ÂŒÃ™Â¹Ã˜Â± ÃšÂ©Ã›ÂŒÃ˜Â¨Ã™Â„ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.J)', 0, 1, '2017-03-20 14:55:14'),
(1183, 1, 'Handle Lock Screw (6x12) (A.B.I)', '100.00', 2, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ Ã™Â„Ã˜Â§ÃšÂ© Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2017-03-20 14:55:14'),
(1182, 1, 'Handle Lock Screw (6x12) (A.J)', '100.00', 113, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ Ã™Â„Ã˜Â§ÃšÂ© Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.J)', 0, 1, '2017-03-20 14:55:13'),
(1181, 1, 'Flat Screw (5x12) (A.B.I)', '100.00', 18, '', 'Ã™ÂÃ™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (5x12) (A.B.I)', 0, 1, '2017-03-20 14:55:13'),
(1180, 1, 'Carborator Tapa Screw (4x20) (A.J)', '80.00', 0, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã˜Â§ (A.J)', 0, 1, '2017-03-20 14:55:13'),
(1179, 1, 'Carborator Tapa Screw (4x15) (A.B.I)', '60.00', 10, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (T.T)', 0, 1, '2017-03-20 14:55:13'),
(1178, 1, 'Carborator Tapa Screw (4x15) (A.J)', '60.00', 0, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2017-03-20 14:55:13'),
(1177, 1, 'CSK Screw (6x15) (A.J)', '100.00', 0, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(T.T)', 0, 1, '2017-03-20 14:55:13'),
(1176, 1, 'CSK Screw (6x15) (T.T)', '110.00', 165, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(A.B.I)', 0, 1, '2017-03-20 14:55:13'),
(1175, 1, 'Assembly Lever Screw +Nut(T.T)', '130.00', 41, '', ' Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(T.T)', 0, 1, '2017-03-20 14:55:13'),
(1174, 1, 'Assembly Lever Screw +Nut (A.B.I)', '120.00', 25, '', ' Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(A.B.I)', 0, 1, '2017-03-20 14:55:13'),
(1172, 1, 'Assembly Screw (5x30) (T.T)', '100.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§ (T.T) ', 0, 1, '2017-03-20 14:55:13'),
(1173, 1, 'Assembly Lever Screw +Nut(A.J)', '120.00', 35, '', ' Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾(A.J)', 0, 1, '2017-03-20 14:55:13'),
(1171, 1, 'Assembly Screw (5x30) (A.B.I)', '160.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§(A.B.I) ', 0, 1, '2017-03-20 14:55:13'),
(1170, 1, 'Assembly Screw (5x30) (A.J)', '170.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â¨Ã™Â„Ã›ÂŒ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã˜Â¨ÃšÂ‘Ã˜Â§ (A.J) ', 0, 1, '2017-03-20 14:55:13'),
(1635, 1, 'Silencer Packing Copper 125 (A.B.I)', '80.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„ 125 (A.B.I) ', 0, 1, '2017-05-08 07:04:49'),
(1620, 0, 'Seat Belt Screw K.D.M (A.B.I)', '3.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)K.D.M ', 900, 1, '2017-04-18 12:32:49'),
(1621, 1, 'Seat Belt Screw K.D.M (A.B.I)', '150.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)K.D.M ', 0, 1, '2017-04-18 12:34:32'),
(1622, 0, 'Seat Belt Screw Chrome (T.T)', '2.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (T.T)', 700, 1, '2017-04-18 12:37:40'),
(1623, 1, 'Seat Belt Screw Chrome (T.T)', '100.00', 0, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã›ÂŒÃ™Â„Ã™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (T.T)', 0, 1, '2017-04-18 12:38:23'),
(1624, 0, 'Plug Adopter (T.T)', '150.00', 1690, '', 'Ã™ÂÃ™ÂÃ™Â¾Ã™Â„ÃšÂ¯ Ã˜Â§ÃšÂˆÃ˜Â§Ã™Â¾Ã™Â¹Ã˜Â± (T.T)', 600, 1, '2017-04-27 14:55:40'),
(1625, 1, 'Plug Adopter (T.T)', '150.00', 169, '', 'Ã™ÂÃ™ÂÃ™Â¾Ã™Â„ÃšÂ¯ Ã˜Â§ÃšÂˆÃ˜Â§Ã™Â¾Ã™Â¹Ã˜Â± (T.T)', 0, 1, '2017-04-27 14:57:18'),
(1626, 0, 'Inner Jump Bolt CD (ABI) Set', '50.00', 59, '', 'Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã˜Â§Ã™Â†Ã˜Â¯Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ CD (ABI) ', 25, 1, '2017-05-01 10:19:40'),
(1627, 1, 'Inner Jump Bolt CD (ABI) Set', '250.00', 11, '', 'Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã˜Â§Ã™Â†Ã˜Â¯Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ CD (ABI) ', 0, 1, '2017-05-01 10:20:06'),
(1628, 0, 'Inner Jump Bolt China (ABI) Set', '60.00', 5, '', 'Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã˜Â§Ã™Â†Ã˜Â¯Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ China (ABI)', 30, 1, '2017-05-01 10:26:53'),
(1629, 1, 'Inner Jump Bolt China (ABI) Set', '300.00', 1, '', 'Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã˜Â§Ã™Â†Ã˜Â¯Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ China (ABI)', 0, 1, '2017-05-01 10:27:12'),
(1630, 0, 'Inner Jump Bolt 125 (ABI) Set', '60.00', 0, '', 'Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã˜Â§Ã™Â†Ã˜Â¯Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ 125 (ABI) ', 35, 1, '2017-05-01 11:35:16'),
(1631, 1, 'Inner Jump Bolt 125 (ABI) set', '300.00', 0, '', 'Ã˜Â¬Ã™Â…Ã™Â¾ ÃšÂ©Ã˜Â§ Ã˜Â§Ã™Â†Ã˜Â¯Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ 125 (ABI) ', 0, 1, '2017-05-01 11:35:28'),
(1633, 1, 'Bolt Hex D/W(8x20)(ABI)', '160.00', 8, '', ' Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(ABI)', 0, 1, '2017-05-04 12:48:53'),
(1634, 0, 'Silencer Packing Copper 125 (A.B.I)', '4.00', 0, '', ' Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„ 125 (A.B.I) ', 0, 1, '2017-05-08 07:04:24'),
(1640, 0, 'Wheel Sleeve Black (T.T)', '15.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ (T.T) Black', 0, 1, '2017-05-28 09:34:01');
INSERT INTO `items` (`id`, `type`, `title`, `unit_price`, `quantity`, `name_in_urdu`, `name_in_urdu_text`, `low_stock_quantity`, `status`, `ts`) VALUES
(1668, 0, 'Lever Bolt 125 P-10 (A.B.I)', '6.00', 12, '', ' 	Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ 125  ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (A.B.I)', 0, 1, '2017-11-05 09:17:41'),
(1743, 1, 'Bolt Hex 8x50 (T.T)', '180.00', 10, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2018-12-15 06:53:05'),
(1721, 1, 'Chain Adjuster Right125(T.T)', '80.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ125(T.T)', 0, 1, '2018-07-04 07:04:14'),
(1691, 1, 'Brake Spring Black (T.T)', '100.00', 1, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2018-03-03 12:14:45'),
(1686, 0, 'Timing Chain Rollar Set 82L (RK-M)', '350.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â³Ã›ÂŒÃ™Â¹82L (RK-M)', 0, 1, '2018-02-18 09:44:37'),
(1636, 0, 'L Patti Large Golden (A.B.I)', '6.00', 0, '', 'Ã˜Â§Ã›ÂŒÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I) ', 0, 1, '2017-05-14 09:03:26'),
(1637, 1, 'L Patti Large Golden (A.B.I)', '120.00', 0, '', 'Ã˜Â§Ã›ÂŒÃ™Â„ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â† (A.B.I) ', 0, 1, '2017-05-14 09:03:59'),
(1638, 0, 'Body Bolt Kit Com (A.B.I)', '1400.00', 0, '', 'Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ Ã˜Â¨Ã˜Â§ÃšÂˆÃ›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹(A.B.I)', 0, 1, '2017-05-15 15:00:26'),
(1639, 1, 'Body Bolt Kit Com (A.B.I)', '1400.00', 0, '', 'Ã™Â…ÃšÂ©Ã™Â…Ã™Â„ Ã˜Â¨Ã˜Â§ÃšÂˆÃ›ÂŒ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹(A.B.I)', 0, 1, '2017-05-15 15:00:50'),
(1750, 0, 'Front Wheel Axle (M.B.I)', '32.00', 840, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„(M.B.I)', 0, 1, '2018-12-20 14:04:32'),
(1660, 0, 'Silencer Stud Golden (T.T)', '2.00', 0, '', 'Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â†(T.T)', 0, 1, '2017-10-25 14:19:47'),
(1649, 1, 'Z Patti White Large (T.T)', '120.00', 0, '', ' Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)', 0, 1, '2017-08-16 06:21:20'),
(1641, 1, 'Wheel Sleeve Black (T.T)', '150.00', 0, '', ' Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ (T.T) Black', 0, 1, '2017-05-28 09:34:33'),
(1642, 0, 'Sprocket Bolt Kit Black (A.B.I) ', '30.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹  (A.B.I)Black', 0, 1, '2017-05-28 09:59:06'),
(1643, 1, 'Sprocket Bolt Kit Black (A.B.I) ', '300.00', 0, '', ' Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹  (A.B.I)Black', 0, 1, '2017-05-28 10:00:14'),
(1696, 0, 'Side Stand Spring Black (T.T)', '10.00', 0, '', 'Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2018-03-10 13:08:25'),
(1680, 0, 'catter pin main stand', '100.00', 6, '', '', 0, 1, '2018-02-08 06:58:30'),
(1644, 0, 'Handle Washer Chrome T.T', '5.00', 120, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â…T.T', 0, 1, '2017-07-06 11:10:34'),
(1645, 1, 'Handle Washer Chrome T.T', '100.00', 6, '', 'Ã›ÂÃ›ÂŒÃ™Â†ÃšÂˆÃ™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â…T.T', 0, 1, '2017-07-06 11:11:35'),
(1648, 0, 'Z Patti White Large (T.T)', '6.00', 0, '', ' Ã˜Â²Ã›ÂŒÃ˜Â¯ Ã™Â¾Ã™Â¹Ã›ÂŒ Ã˜Â¨ÃšÂ‘Ã›ÂŒ Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â¹(T.T)', 0, 1, '2017-08-16 06:19:44'),
(1656, 0, 'Lever Bolt New Model (A.B.I)', '8.00', 360, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã›ÂŒÃ™Âˆ Ã™Â…Ã˜Â§ÃšÂˆÃ™Â„ (A.B.I)', 0, 1, '2017-10-15 10:37:30'),
(1646, 0, 'Flange Cap Nut Small 6mm T.T', '3.00', 0, '', 'ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â§Ã™Â„T.T', 0, 1, '2017-07-18 12:33:12'),
(1647, 1, 'Flange Cap Nut Small 6mm T.T', '300.00', 0, '', 'ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã›ÂÃ›ÂŒÃšÂˆ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±10 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â…Ã˜Â§Ã™Â„T.T', 0, 1, '2017-07-18 12:33:40'),
(1694, 0, 'Timing Bolt CDI(14x13)(A.B.I)', '15.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ CDI(14x13)(A.B.I)', 0, 1, '2018-03-06 10:11:27'),
(1658, 0, 'Silencer Stud white (T.T)', '2.00', 0, '', 'Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(T.T)', 0, 1, '2017-10-25 14:17:08'),
(1650, 0, 'Copper Washer No.10 (6x17x2)', '0.80', 0, '', ' Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10', 0, 1, '2017-09-07 06:08:52'),
(1673, 1, 'Front Sprocket Spring ABI', '50.00', 0, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã›ÂŒ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ABI', 0, 1, '2017-11-21 10:56:19'),
(1670, 0, 'Mudgart Kit (T.T)', '35.00', 1, '', 'Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ ÃšÂ©Ã›ÂŒÃ™Â¹(T.T)', 0, 1, '2017-11-11 07:41:33'),
(1654, 0, 'Nut Hex No.14(10x17) (ABI)', '2.70', 75, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-10-04 06:41:29'),
(1655, 1, 'Nut Hex No.14(10x17) (ABI)', '270.00', 0, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â±14 (A.B.I)', 0, 1, '2017-10-04 06:41:48'),
(1652, 0, 'Main Stand Pin 125(T.T)', '55.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â†  125(T.T)', 0, 1, '2017-09-10 06:34:53'),
(1659, 1, 'Silencer Stud white (T.T)', '40.00', 0, '', 'Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(T.T)', 0, 1, '2017-10-25 14:17:50'),
(1651, 1, 'Copper Washer No.10 (6x17x2)', '80.00', 0, '', ' Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10', 0, 1, '2017-09-07 06:10:34'),
(1664, 0, 'Lever Bolt New Model Wht(ABI)', '5.00', 0, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã›ÂŒÃ™Âˆ Ã™Â…Ã˜Â§ÃšÂˆÃ™Â„ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(A.B.I)', 0, 1, '2017-11-01 16:07:02'),
(1653, 1, 'Main Stand Pin 125(T.T)', '275.00', 0, '', ' Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã™Â¾Ã™Â†  125(T.T)', 0, 1, '2017-09-10 06:35:28'),
(1704, 0, 'Horn Clip (A.B.I)', '0.55', 200, '', 'Ã›ÂÃ˜Â§Ã˜Â±Ã˜Â§Ã™Â† ÃšÂ©Ã™Â„Ã›ÂŒÃ™Â¾(A.B.I)', 0, 1, '2018-04-15 07:08:49'),
(1657, 1, 'Lever Bolt New Model (A.B.I)', '160.00', 18, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã›ÂŒÃ™Âˆ Ã™Â…Ã˜Â§ÃšÂˆÃ™Â„ (A.B.I)', 0, 1, '2017-10-15 10:38:04'),
(1662, 0, 'Nut Hex No.13 (8x14) (A.B.I)', '1.40', 6875, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 (A.B.I)', 0, 1, '2017-10-29 07:02:38'),
(1676, 0, 'Tappet Cover (T.T)', '18.00', 0, '', 'Ã™Â¹Ã›ÂŒÃ™Â¾Ã™Â¹ ÃšÂ©Ã˜Â§Ã™ÂˆÃ˜Â± (T.T)', 0, 1, '2017-12-02 10:31:34'),
(1681, 1, 'catter pin main stand', '100.00', 6, '', '', 0, 1, '2018-02-08 06:58:51'),
(1661, 1, 'Silencer Stud Golden (T.T)', '40.00', 0, '', 'Ã˜Â³Ã™Â„Ã›ÂŒÃ™Â†Ã˜Â³Ã˜Â± Ã˜Â§Ã˜Â³Ã™Â¹ÃšÂˆ ÃšÂ¯Ã™ÂˆÃ™Â„ÃšÂˆÃ™Â†(T.T)', 0, 1, '2017-10-25 14:20:00'),
(1725, 1, 'Head Washer No.10 Coper (T.T)', '100.00', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10 Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„(T.T)', 0, 1, '2018-07-24 11:00:30'),
(1702, 0, 'Wheel Sleeve White (S.S)', '45.00', 0, '', 'Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ White (S.S)', 0, 1, '2018-04-03 07:33:17'),
(1682, 0, 'Chain Set C.D (RK-M)', '1100.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â³Ã›ÂŒÃ™Â¹ C.D (RK-M)', 0, 1, '2018-02-18 09:29:38'),
(1663, 1, 'Nut Hex No.13 (8x14) (A.B.I) 	', '140.00', 68, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 (A.B.I)', 0, 1, '2017-10-29 07:03:42'),
(1665, 1, 'Lever Bolt New Model Wht(ABI)', '60.00', 0, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â†Ã›ÂŒÃ™Âˆ Ã™Â…Ã˜Â§ÃšÂˆÃ™Â„ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯(A.B.I)', 0, 1, '2017-11-01 16:07:32'),
(1672, 0, 'Front Sprocket Spring ABI', '5.00', 0, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã›ÂŒ ÃšÂ¯Ã˜Â±Ã˜Â§Ã˜Â±Ã›ÂŒ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ABI', 0, 1, '2017-11-21 10:55:29'),
(1674, 0, 'Front Brake Arm Spring (TT)', '10.00', 10, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© ÃšÂ©Ã›Â’ Ã˜Â¢Ã˜Â±Ã™Â… ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯(TT)', 0, 1, '2017-11-21 12:08:21'),
(1740, 0, 'Rear Fork Bush CD (T.T)', '50.00', 44, '', 'ÃšÂ†Ã™Â…Ã™Â¹Ã›Â Ã˜Â¨Ã™ÂˆÃ˜Â´CD', 0, 1, '2018-10-23 08:42:59'),
(1666, 0, 'Engine Bolt Kit Chrome CDI 70(ABI)', '180.00', 279, '', ' 	Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â±Ã™Â… (A.B.I) CDI 70 ', 0, 1, '2017-11-04 07:52:37'),
(1667, 1, 'Engine Bolt Kit Chrome CDI 70(ABI)', '180.00', 279, '', ' 	Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â±Ã™Â… (A.B.I) CDI 70 ', 0, 1, '2017-11-04 07:53:42'),
(1669, 1, 'Lever Bolt 125 P-10 (A.B.I)', '72.00', 1, '', 'Ã™Â„Ã›ÂŒÃ™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ 125  ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… (A.B.I)', 0, 1, '2017-11-05 09:20:10'),
(1678, 0, 'Brake Rod Spring (T.T)', '2.08', 0, '', 'Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ  Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯(T.T)', 0, 1, '2017-12-23 14:28:53'),
(1671, 1, 'Mudgart Kit (T.T)', '140.00', 0, '', 'Ã™Â…ÃšÂˆÃšÂ¯Ã˜Â§Ã˜Â±ÃšÂˆ ÃšÂ©Ã›ÂŒÃ™Â¹(T.T)', 0, 1, '2017-11-11 07:42:24'),
(1675, 1, 'Front Brake Arm Spring (TT)', '100.00', 1, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã›Â’ Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© ÃšÂ©Ã›Â’ Ã˜Â¢Ã˜Â±Ã™Â… ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯(TT)', 0, 1, '2017-11-21 12:09:16'),
(1677, 1, 'Tappet Cover (T.T)', '180.00', 0, '', 'Ã™Â¹Ã›ÂŒÃ™Â¾Ã™Â¹ ÃšÂ©Ã˜Â§Ã™ÂˆÃ˜Â± (T.T)', 0, 1, '2017-12-02 10:32:38'),
(1685, 1, 'Chain Set 125 (RK-M)', '1200.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â³Ã›ÂŒÃ™Â¹ (RK-M)125', 0, 1, '2018-02-18 09:38:16'),
(1720, 0, 'Chain Adjuster Right125(T.T)', '8.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ125(T.T)', 0, 1, '2018-07-04 07:02:55'),
(1684, 0, 'Chain Set 125 (RK-M)', '1200.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â³Ã›ÂŒÃ™Â¹ (RK-M)125', 0, 1, '2018-02-18 09:37:39'),
(1753, 1, 'Bolt Hex 8x20 No.11', '100.00', 0, '', 'Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ', 0, 1, '2019-01-23 07:19:10'),
(1683, 1, 'Chain Set C.D (RK-M)', '1100.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â³Ã›ÂŒÃ™Â¹ C.D (RK-M)', 0, 1, '2018-02-18 09:34:32'),
(1679, 1, 'Brake Rod Spring (T.T)', '75.00', 0, '', 'Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯(T.T)', 0, 1, '2017-12-23 14:29:46'),
(1690, 0, 'Brake Spring Black (T.T)', '5.00', 20, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2018-03-03 12:13:59'),
(1687, 1, 'Timing Chain Rollar Set 82L (RK-M)', '350.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â³Ã›ÂŒÃ™Â¹82L (RK-M)', 0, 1, '2018-02-18 09:45:57'),
(1688, 0, 'Timing Chain Rollar Set 84L (RK-M)', '350.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â³Ã›ÂŒÃ™Â¹84L (RK-M)', 0, 1, '2018-02-18 09:48:07'),
(1689, 1, 'Timing Chain Rollar Set 84L (RK-M)', '350.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒÃ™Â† Ã˜Â±Ã™ÂˆÃ™Â„Ã˜Â± Ã˜Â³Ã›ÂŒÃ™Â¹84L (RK-M)', 0, 1, '2018-02-18 09:48:34'),
(1692, 0, 'Main Stand Spring Black (TT)', '9.00', 0, '', 'Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(TT)', 0, 1, '2018-03-05 09:47:27'),
(1728, 0, 'Bolt Hex 6x12(No.11)T.T', '1.20', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒT.T', 0, 1, '2018-08-04 06:54:22'),
(1693, 1, 'Main Stand Spring Black (TT)', '90.00', 0, '', 'Ã™Â…Ã›ÂŒÃ™Â† Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(TT)', 0, 1, '2018-03-05 09:48:11'),
(1698, 0, 'Engine Axle Small (T.T)', '10.00', 0, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ˜ÂªÃ˜Â§ (T.T)', 0, 1, '2018-03-18 14:29:32'),
(1744, 0, 'Bolt Flange 10x20 (A.B.I)', '5.00', 2080, '', 'Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.B.I)', 0, 1, '2018-12-17 14:56:41'),
(1695, 1, 'Timing Bolt CDI(14x13)(A.B.I)', '150.00', 0, '', 'Ã™Â¹Ã˜Â§Ã˜Â¦Ã™Â…Ã™Â†ÃšÂ¯ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ CDI(14x13)(A.B.I)', 0, 1, '2018-03-06 10:12:08'),
(1697, 1, 'Side Stand Spring Black (T.T)', '100.00', 0, '', 'Ã˜Â³Ã˜Â§Ã˜Â¦Ã›ÂŒÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¹Ã›ÂŒÃ™Â†ÃšÂˆ Ã˜Â§Ã˜Â³Ã™Â¾Ã˜Â±Ã™Â†ÃšÂ¯ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â§(T.T)', 0, 1, '2018-03-10 13:09:46'),
(1699, 1, 'Engine Axle Small (T.T)', '100.00', 0, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ˜ÂªÃ˜Â§ (T.T)', 0, 1, '2018-03-18 14:30:16'),
(1700, 0, 'Engine Axle Large (T.T)', '10.00', 0, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â¨Ã™Â¹Ã˜Â±Ã˜Â§ (T.T)', 0, 1, '2018-03-18 14:32:14'),
(1701, 1, 'Engine Axle Large (T.T)', '100.00', 0, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â¨Ã™Â¹Ã˜Â±Ã˜Â§ (T.T)', 0, 1, '2018-03-18 14:32:54'),
(1742, 0, 'Bolt Hex 8x50 (T.T)', '3.60', 500, '', 'Ã˜Â³Ã›ÂŒÃ™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â¨ÃšÂ‘Ã˜Â§ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â (T.T)', 0, 1, '2018-12-15 06:51:55'),
(1722, 0, 'Bolt Hex D/W(8x20)(AJ)', '4.20', 0, '', 'Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(AJ)', 0, 1, '2018-07-14 12:56:09'),
(1703, 1, 'Wheel Sleeve White (S.S)', '450.00', 0, '', 'Ã™ÂˆÃ›ÂŒÃ™Â„ Ã˜Â³Ã›ÂŒÃ™Â„Ã™Âˆ White (S.S)', 0, 1, '2018-04-03 07:34:07'),
(1752, 0, 'Bolt Hex 8x20 No.11', '2.00', 0, '', 'Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ', 0, 1, '2019-01-23 07:18:38'),
(1705, 1, 'Horn Clip (A.B.I)', '110.00', 1, '', 'Ã›ÂÃ˜Â§Ã˜Â±Ã˜Â§Ã™Â† ÃšÂ©Ã™Â„Ã›ÂŒÃ™Â¾(A.B.I)', 0, 1, '2018-04-15 07:09:39'),
(1706, 0, 'Cap Nut (5mm) (A.B.I) ', '1.50', 0, '', 'ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 8 (A.B.I) ', 0, 1, '2018-04-15 07:17:56'),
(1707, 1, 'Cap Nut (5mm) (A.B.I)', '150.00', 0, '', 'ÃšÂ©Ã›ÂŒÃ™Â¾ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 8 (A.B.I)', 0, 1, '2018-04-15 07:18:28'),
(1708, 0, 'Flange Cap Nut Long 8mm T.T', '4.00', 1200, '', 'Ã™Â„Ã™ÂˆÃ™Â†ÃšÂ¯ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2018-04-15 07:21:27'),
(1709, 1, 'Flange Cap Nut Long 8mm T.T', '100.00', 48, '', 'Ã™Â„Ã™ÂˆÃ™Â†ÃšÂ¯ Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 13 ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± (T.T)', 0, 1, '2018-04-15 07:23:35'),
(1710, 0, 'Rear Wheel Axle Ching Chi (T.T)', '37.00', 0, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ(T.T)', 0, 1, '2018-04-15 08:08:44'),
(1711, 1, 'Rear Wheel Axle Ching Chi (T.T)', '185.00', 0, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â±Ã˜Â¦Ã›ÂŒÃ˜Â± Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ(T.T)', 0, 1, '2018-04-15 08:09:35'),
(1712, 0, 'Front Wheel Axle Ching Chi (T.T)', '30.00', 0, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ(T.T)', 0, 1, '2018-04-15 08:13:01'),
(1713, 1, 'Front Wheel Axle Ching Chi (T.T)', '150.00', 0, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ(T.T)', 0, 1, '2018-04-15 08:13:40'),
(1714, 0, 'Center Axle Ching Chi (T.T)', '35.00', 0, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â±ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ(T.T)', 0, 1, '2018-04-15 08:19:02'),
(1715, 1, 'Center Axle Ching Chi (T.T)', '175.00', 0, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã˜Â³Ã›ÂŒÃ™Â†Ã™Â¹Ã˜Â±ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ(T.T)', 0, 1, '2018-04-15 08:21:54'),
(1716, 0, 'Sprocket Bolt Kit Wht Small (T.T) ', '20.00', 0, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ', 0, 1, '2018-04-15 08:24:01'),
(1717, 1, 'Sprocket Bolt Kit Wht Small (T.T)', '200.00', 0, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ Ã˜Â³Ã™ÂÃ›ÂŒÃ˜Â¯ ÃšÂ†ÃšÂ¾Ã™ÂˆÃ™Â¹Ã›ÂŒ', 0, 1, '2018-04-15 08:26:02'),
(1718, 0, 'Sprocket Bolt Kit 125 (T.T) 	', '35.00', 30, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ 125', 0, 1, '2018-04-15 08:27:17'),
(1719, 1, 'Sprocket Bolt Kit 125 (T.T)', '350.00', 3, '', 'Ã˜Â§Ã˜Â³Ã™Â¾Ã™ÂˆÃšÂ©Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã™Â¹ 125', 0, 1, '2018-04-15 08:28:06'),
(1734, 0, 'Rear Axle Lock Nut ABI', '7.00', 0, '', 'Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§  Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â¹ ABI', 0, 1, '2018-08-19 07:36:55'),
(1724, 0, 'Head Washer No.10 Coper (T.T)', '0.50', 0, '', 'Ã›ÂÃ›ÂŒÃšÂˆ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 10  Ã™Â¾Ã›ÂŒÃ˜ÂªÃ™Â„(T.T)', 0, 1, '2018-07-24 10:59:54'),
(1746, 0, 'CSK Screw (6x20) (A.B.I)', '1.50', 3800, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2018-12-20 13:51:09'),
(1723, 1, 'Bolt Hex D/W(8x20)(AJ)', '210.00', 0, '', 'Ã™ÂÃ™Â¹ Ã˜Â±Ã˜Â§ÃšÂˆ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ˜Â§Ã˜Â´Ã˜Â± Ã™ÂˆÃ˜Â§Ã™Â„Ã˜Â§(AJ)', 0, 1, '2018-07-14 12:56:43'),
(1738, 0, 'Engine Cover Bolt 6x80 (A.J)', '7.50', 320, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x80) P.8 (A.J)', 0, 1, '2018-09-15 10:03:38'),
(1726, 0, 'Double Jump Stud Set (T.T)', '60.00', 1, '', 'ÃšÂˆÃ˜Â¨Ã™Â„ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(T.T)', 0, 1, '2018-07-24 12:23:19'),
(1727, 1, 'Double Jump Stud Set (T.T)', '60.00', 1, '', 'ÃšÂˆÃ˜Â¨Ã™Â„ Ã˜Â¬Ã™Â…Ã™Â¾ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(T.T)', 0, 1, '2018-07-24 12:23:49'),
(1741, 1, 'Rear Fork Bush CD (T.T)', '50.00', 44, '', 'ÃšÂ†Ã™Â…Ã™Â¹Ã›Â Ã˜Â¨Ã™ÂˆÃ˜Â´CD', 0, 1, '2018-10-23 08:47:01'),
(1739, 1, 'Engine Cover Bolt 6x80 (A.J)', '150.00', 16, '', 'Ã˜Â§Ã™Â†Ã˜Â¬Ã™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ (6x80) P.8 (A.J)', 0, 1, '2018-09-15 10:05:08'),
(1729, 1, 'Bolt Hex 6x12(No.11)T.T', '120.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ©Ã™ÂˆÃ˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒT.T', 0, 1, '2018-08-04 07:00:11'),
(1730, 0, 'Bolt Hex 6x30(No.11)(T.T)', '2.00', 0, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ(T.T)', 0, 1, '2018-08-04 07:03:19'),
(1731, 1, 'Bolt Hex 6x30(No.11)(T.T)', '100.00', 0, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ(T.T)', 0, 1, '2018-08-04 07:04:08'),
(1732, 0, 'Nut Hex (6mm)(No.11)(T.T)', '0.90', 1600, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 11Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ(T.T)', 0, 1, '2018-08-04 07:06:20'),
(1733, 1, 'Nut Hex (6mm)(No.11)(T.T)', '90.00', 16, '', 'Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â†Ã™Â¹ Ã™Â†Ã™Â…Ã˜Â¨Ã˜Â± 11Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ(T.T)', 0, 1, '2018-08-04 07:11:21'),
(1735, 1, 'Rear Axle Lock Nut ABI', '70.00', 0, '', 'Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§  Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â¹ ABI', 0, 1, '2018-08-19 07:38:03'),
(1736, 0, 'Front Axle Lock Nut ABI', '5.00', 10, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â¹ ABI', 0, 1, '2018-08-19 07:39:16'),
(1737, 1, 'Front Axle Lock Nut ABI', '50.00', 1, '', 'Ã˜Â§ÃšÂ¯Ã™Â„Ã˜Â§ Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ ÃšÂ©Ã˜Â§ Ã™Â„Ã˜Â§ÃšÂ© Ã™Â†Ã™Â¹ ABI', 0, 1, '2018-08-19 07:39:55'),
(1745, 1, 'Bolt Flange 10x20 (A.B.I)', '100.00', 104, '', 'Ã™Â¾ÃšÂ†ÃšÂ¾Ã™Â„Ã›Â’ Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ ÃšÂ©Ã˜Â§ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹(A.B.I)', 0, 1, '2018-12-17 14:57:06'),
(1747, 1, 'CSK Screw (6x20) (A.B.I)', '150.00', 38, '', 'Ã™Â…Ã›ÂŒÃšÂ¯Ã™Â†Ã™Â¹ ÃšÂ©Ã™ÂˆÃ˜Â§Ã˜Â¦Ã™Â„ Ã™Â¾Ã™Â„Ã›ÂŒÃ™Â¹ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ (A.B.I)', 0, 1, '2018-12-20 13:52:38'),
(1748, 0, 'Carborator Tapa Screw with nut(4x20) (A.B.I)', '1.20', 0, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾', 0, 1, '2018-12-20 13:55:44'),
(1749, 1, 'Carborator Tapa Screw with nut(4x20) (A.B.I)', '120.00', 0, '', 'ÃšÂ©Ã˜Â§Ã˜Â±Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã™Â¹Ã˜Â§Ã™Â¾Ã›Â’ ÃšÂ©Ã˜Â§ Ã˜Â§Ã˜Â³ÃšÂ©Ã˜Â±Ã™Âˆ Ã™Â†Ã™Â¹ ÃšÂ©Ã›Â’ Ã˜Â³Ã˜Â§Ã˜ÂªÃšÂ¾', 0, 1, '2018-12-20 13:56:13'),
(1751, 1, 'Front Wheel Axle (M.B.I)', '160.00', 168, '', 'Ã˜Â§Ã›ÂŒÃšÂ©Ã˜Â³Ã™Â„ Ã™ÂÃ˜Â±Ã™Â†Ã™Â¹ Ã™ÂˆÃ›ÂŒÃ™Â„(M.B.I)', 0, 1, '2018-12-20 14:04:59'),
(1754, 0, 'Bolt Hex 10x20 No.11', '3.00', 0, '', 'Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ', 0, 1, '2019-01-23 07:22:16'),
(1755, 1, 'Bolt Hex 10x20 No.11', '150.00', 0, '', 'Ã™ÂÃ™Â¹ Ã˜Â±Ã›ÂŒÃ˜Â³Ã™Â¹ Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ Ã˜Â³Ã˜Â§Ã˜Â¯Ã›Â Ã™Â…Ã™ÂˆÃ™Â¹Ã›ÂŒ ÃšÂ†Ã™ÂˆÃ˜Â±Ã›ÂŒ', 0, 1, '2019-01-23 07:22:40'),
(1760, 0, 'Bolt Flange 6x30 Chrome (A.B.I)', '5.00', 750, '', 'ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â… ', 0, 1, '2019-03-17 10:24:43'),
(1756, 0, 'Brake Rod Ching Chi (T.T)', '32.00', 0, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ', 0, 1, '2019-03-12 06:23:04'),
(1757, 1, 'Brake Rod Ching Chi (T.T)', '320.00', 0, '', 'Ã˜Â¨Ã˜Â±Ã›ÂŒÃšÂ© Ã˜Â±Ã˜Â§ÃšÂˆ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ', 0, 1, '2019-03-12 06:23:24'),
(1758, 0, 'Chain Adjuster Left Ching Chi(T.T)', '8.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ', 0, 1, '2019-03-12 06:26:00'),
(1759, 1, 'Chain Adjuster Left Ching Chi(T.T)', '80.00', 0, '', 'ÃšÂ†Ã›ÂŒÃ™Â† ÃšÂ†ÃšÂ‘Ã›ÂŒÃ˜Â§ Ã˜Â¨ÃšÂ‘Ã›ÂŒ ÃšÂ†Ã™Â†ÃšÂ¯ ÃšÂ†Ã›ÂŒ', 0, 1, '2019-03-12 06:26:37'),
(1761, 1, 'Bolt Flange 6x30 Chrome (A.B.I)', '250.00', 15, '', 'ÃšÂ©Ã˜Â§Ã˜Â± Ã˜Â¨Ã™ÂˆÃ˜Â±Ã›ÂŒÃ™Â¹Ã˜Â± Ã˜Â¨Ã™ÂˆÃ™Â„Ã™Â¹ ÃšÂ©Ã˜Â§Ã™Â„Ã˜Â±ÃšÂ©Ã˜Â±Ã™ÂˆÃ™Â…', 0, 1, '2019-03-17 10:26:06');

-- --------------------------------------------------------

--
-- Table structure for table `item_group`
--

CREATE TABLE `item_group` (
  `id` int(11) NOT NULL,
  `group_item_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_group`
--

INSERT INTO `item_group` (`id`, `group_item_id`, `item_id`, `quantity`) VALUES
(1, 1162, 11, 100),
(2, 1163, 15, 50),
(3, 1164, 16, 100),
(4, 1165, 17, 100),
(5, 1166, 18, 100),
(6, 1167, 19, 100),
(7, 1168, 20, 100),
(8, 1169, 21, 100),
(9, 1170, 22, 100),
(10, 1171, 23, 100),
(11, 1172, 24, 100),
(12, 1173, 25, 50),
(13, 1174, 26, 50),
(14, 1175, 27, 50),
(15, 1176, 28, 100),
(16, 1177, 29, 100),
(17, 1178, 30, 100),
(18, 1179, 31, 100),
(19, 1180, 32, 100),
(20, 1181, 33, 100),
(21, 1182, 34, 100),
(22, 1183, 35, 100),
(23, 1184, 36, 100),
(24, 1185, 37, 100),
(25, 1186, 38, 100),
(26, 1187, 39, 100),
(27, 1188, 40, 100),
(28, 1189, 41, 100),
(29, 1190, 42, 100),
(30, 1191, 43, 100),
(31, 1192, 44, 50),
(32, 1193, 45, 100),
(33, 1194, 46, 100),
(34, 1195, 47, 200),
(35, 1196, 48, 100),
(36, 1197, 49, 100),
(37, 1198, 50, 100),
(38, 1199, 51, 100),
(39, 1200, 52, 10),
(40, 1201, 53, 10),
(41, 1202, 54, 20),
(42, 1203, 55, 20),
(43, 1204, 56, 20),
(44, 1205, 58, 20),
(45, 1206, 59, 10),
(46, 1207, 60, 10),
(47, 1208, 61, 50),
(48, 1209, 62, 50),
(49, 1210, 63, 50),
(50, 1211, 64, 50),
(51, 1212, 65, 50),
(52, 1213, 66, 50),
(53, 1214, 67, 5),
(54, 1215, 68, 5),
(55, 1216, 69, 5),
(56, 1217, 70, 5),
(57, 1218, 71, 5),
(58, 1219, 72, 5),
(59, 1220, 73, 5),
(60, 1221, 74, 5),
(61, 1222, 75, 5),
(62, 1223, 76, 10),
(63, 1224, 77, 20),
(64, 1225, 78, 100),
(65, 1226, 79, 100),
(66, 1227, 80, 100),
(67, 1228, 81, 200),
(68, 1229, 82, 100),
(69, 1230, 88, 20),
(70, 1231, 89, 10),
(71, 1232, 90, 10),
(72, 1233, 91, 10),
(73, 1234, 92, 10),
(74, 1235, 93, 20),
(75, 1236, 94, 20),
(76, 1237, 95, 50),
(77, 1238, 96, 50),
(78, 1239, 97, 50),
(79, 1240, 98, 50),
(80, 1241, 99, 20),
(81, 1242, 100, 20),
(82, 1243, 105, 20),
(83, 1244, 110, 20),
(84, 1245, 113, 50),
(85, 1246, 114, 50),
(86, 1247, 115, 50),
(87, 1248, 116, 100),
(88, 1249, 117, 200),
(89, 1250, 118, 100),
(90, 1251, 119, 50),
(91, 1252, 120, 100),
(92, 1253, 121, 20),
(93, 1254, 122, 20),
(94, 1255, 123, 10),
(95, 1256, 124, 10),
(96, 1257, 125, 10),
(97, 1258, 126, 10),
(98, 1259, 131, 10),
(99, 1260, 149, 10),
(100, 1261, 150, 10),
(101, 1262, 151, 10),
(102, 1263, 152, 10),
(103, 1264, 153, 10),
(104, 1265, 154, 20),
(105, 1266, 155, 10),
(106, 1267, 156, 50),
(107, 1268, 157, 36),
(108, 1269, 158, 100),
(109, 1270, 159, 10),
(110, 1271, 160, 10),
(111, 1272, 161, 10),
(112, 1273, 162, 20),
(113, 1274, 163, 20),
(114, 1275, 164, 10),
(115, 1276, 165, 50),
(116, 1277, 166, 100),
(117, 1278, 167, 100),
(118, 1279, 169, 100),
(119, 1280, 180, 50),
(120, 1281, 181, 50),
(121, 1282, 182, 25),
(122, 1283, 185, 25),
(123, 1284, 187, 25),
(124, 1285, 188, 50),
(125, 1286, 189, 25),
(126, 1287, 191, 100),
(127, 1288, 192, 100),
(128, 1289, 194, 100),
(129, 1290, 195, 100),
(130, 1291, 197, 100),
(131, 1292, 198, 50),
(132, 1293, 199, 50),
(133, 1294, 201, 100),
(134, 1295, 204, 100),
(135, 1296, 205, 100),
(136, 1297, 206, 100),
(137, 1298, 207, 100),
(138, 1299, 208, 200),
(139, 1300, 209, 200),
(140, 1301, 210, 100),
(141, 1302, 211, 50),
(142, 1303, 212, 50),
(143, 1304, 213, 200),
(144, 1305, 214, 200),
(145, 1306, 215, 5),
(146, 1307, 218, 100),
(147, 1308, 219, 50),
(148, 1309, 220, 50),
(149, 1310, 221, 2),
(150, 1311, 222, 5),
(151, 1312, 223, 5),
(152, 1313, 224, 200),
(153, 1314, 225, 200),
(154, 1315, 226, 100),
(155, 1316, 227, 1),
(156, 1317, 228, 1),
(157, 1318, 229, 100),
(158, 1319, 230, 100),
(159, 1320, 231, 1),
(160, 1321, 232, 100),
(161, 1322, 233, 200),
(162, 1323, 234, 100),
(163, 1324, 235, 200),
(164, 1325, 236, 100),
(165, 1326, 237, 100),
(166, 1327, 238, 100),
(167, 1328, 239, 50),
(168, 1329, 240, 50),
(169, 1330, 241, 50),
(170, 1331, 243, 20),
(171, 1332, 244, 10),
(172, 1333, 245, 10),
(173, 1334, 246, 10),
(174, 1335, 247, 100),
(175, 1336, 248, 100),
(176, 1337, 249, 200),
(177, 1338, 250, 100),
(178, 1339, 251, 100),
(179, 1340, 252, 100),
(180, 1341, 253, 100),
(181, 1342, 254, 100),
(182, 1343, 255, 20),
(183, 1344, 256, 20),
(184, 1345, 257, 20),
(185, 1346, 258, 20),
(186, 1347, 259, 20),
(187, 1348, 260, 20),
(188, 1349, 261, 20),
(189, 1350, 262, 20),
(190, 1351, 263, 20),
(192, 1353, 265, 1),
(193, 1354, 266, 5),
(194, 1355, 267, 5),
(195, 1356, 268, 5),
(196, 1357, 269, 5),
(197, 1358, 270, 100),
(198, 1359, 271, 10),
(199, 1360, 272, 10),
(200, 1361, 273, 100),
(201, 1362, 274, 10),
(202, 1363, 275, 10),
(203, 1364, 276, 100),
(204, 1365, 277, 10),
(205, 1366, 278, 10),
(206, 1367, 279, 100),
(207, 1368, 280, 10),
(208, 1369, 281, 100),
(209, 1370, 282, 10),
(210, 1371, 283, 7),
(211, 1372, 284, 10),
(212, 1373, 285, 10),
(213, 1374, 286, 10),
(214, 1375, 287, 10),
(215, 1376, 288, 10),
(216, 1377, 289, 10),
(217, 1378, 290, 5),
(218, 1379, 291, 5),
(219, 1380, 292, 5),
(220, 1381, 293, 5),
(221, 1382, 294, 5),
(222, 1383, 295, 5),
(223, 1384, 296, 5),
(224, 1385, 297, 5),
(225, 1386, 298, 5),
(226, 1387, 299, 5),
(227, 1388, 300, 20),
(228, 1389, 301, 20),
(229, 1390, 302, 50),
(230, 1391, 303, 50),
(231, 1392, 304, 100),
(232, 1393, 305, 100),
(233, 1394, 306, 100),
(234, 1395, 307, 100),
(235, 1396, 308, 100),
(236, 1397, 309, 50),
(237, 1398, 310, 50),
(238, 1399, 311, 50),
(239, 1400, 312, 100),
(240, 1401, 313, 100),
(241, 1402, 314, 100),
(242, 1403, 315, 100),
(243, 1404, 316, 100),
(244, 1405, 317, 100),
(245, 1406, 318, 50),
(246, 1407, 319, 50),
(247, 1408, 320, 50),
(248, 1409, 321, 50),
(249, 1410, 322, 50),
(250, 1411, 323, 50),
(251, 1412, 324, 10),
(252, 1413, 325, 10),
(253, 1414, 326, 10),
(254, 1415, 327, 100),
(255, 1416, 328, 100),
(256, 1417, 329, 100),
(257, 1418, 330, 100),
(258, 1419, 331, 100),
(259, 1420, 332, 100),
(260, 1421, 333, 10),
(261, 1422, 334, 10),
(262, 1423, 335, 10),
(263, 1424, 336, 100),
(264, 1425, 337, 100),
(265, 1426, 338, 100),
(266, 1427, 339, 25),
(267, 1428, 340, 20),
(268, 1429, 341, 100),
(269, 1430, 342, 20),
(270, 1431, 343, 100),
(271, 1432, 344, 20),
(272, 1433, 345, 20),
(273, 1434, 346, 20),
(274, 1435, 347, 100),
(275, 1436, 348, 20),
(276, 1437, 351, 10),
(277, 1438, 352, 20),
(278, 1439, 353, 100),
(279, 1440, 354, 50),
(280, 1441, 355, 50),
(281, 1442, 356, 100),
(282, 1443, 357, 50),
(283, 1444, 358, 50),
(284, 1445, 359, 50),
(285, 1446, 360, 50),
(286, 1447, 361, 50),
(287, 1448, 362, 50),
(288, 1449, 363, 50),
(289, 1450, 364, 20),
(290, 1451, 365, 50),
(291, 1452, 366, 50),
(292, 1453, 367, 20),
(293, 1454, 368, 50),
(294, 1455, 369, 50),
(295, 1456, 370, 1),
(296, 1457, 371, 1),
(297, 1458, 372, 1),
(298, 1459, 373, 1),
(299, 1460, 374, 1),
(300, 1461, 375, 5),
(301, 1462, 376, 5),
(302, 1463, 377, 10),
(303, 1464, 378, 36),
(304, 1465, 379, 10),
(305, 1466, 380, 10),
(306, 1467, 381, 10),
(307, 1468, 382, 10),
(308, 1469, 383, 10),
(309, 1470, 384, 10),
(310, 1471, 385, 100),
(311, 1472, 386, 100),
(312, 1473, 387, 100),
(313, 1474, 388, 100),
(314, 1475, 389, 100),
(315, 1476, 390, 100),
(316, 1477, 391, 100),
(317, 1478, 392, 100),
(318, 1479, 393, 100),
(319, 1480, 394, 100),
(320, 1481, 395, 100),
(321, 1482, 396, 100),
(322, 1483, 397, 100),
(323, 1484, 398, 100),
(324, 1485, 399, 100),
(325, 1486, 400, 100),
(326, 1487, 401, 100),
(327, 1488, 402, 100),
(328, 1489, 403, 100),
(329, 1490, 404, 100),
(330, 1491, 405, 100),
(331, 1492, 406, 100),
(332, 1493, 407, 100),
(333, 1494, 408, 100),
(334, 1495, 409, 100),
(335, 1496, 410, 100),
(336, 1497, 411, 100),
(337, 1498, 412, 100),
(338, 1499, 413, 100),
(339, 1500, 414, 100),
(340, 1501, 415, 100),
(341, 1502, 416, 100),
(342, 1503, 417, 100),
(343, 1504, 418, 100),
(344, 1505, 419, 100),
(345, 1506, 420, 100),
(346, 1507, 421, 100),
(347, 1508, 422, 100),
(348, 1509, 423, 100),
(349, 1510, 424, 100),
(350, 1511, 425, 100),
(351, 1512, 426, 100),
(352, 1513, 427, 100),
(353, 1514, 428, 50),
(354, 1515, 429, 50),
(355, 1516, 430, 100),
(356, 1517, 431, 50),
(357, 1518, 432, 50),
(358, 1519, 433, 50),
(359, 1520, 434, 100),
(360, 1521, 435, 100),
(361, 1522, 436, 50),
(362, 1523, 437, 100),
(363, 1524, 438, 100),
(364, 1525, 439, 50),
(365, 1526, 440, 100),
(366, 1527, 441, 100),
(367, 1528, 442, 50),
(368, 1529, 443, 50),
(369, 1530, 444, 50),
(370, 1531, 445, 50),
(371, 1532, 446, 50),
(372, 1533, 447, 50),
(373, 1534, 448, 50),
(374, 1535, 449, 50),
(375, 1536, 450, 50),
(376, 1537, 451, 50),
(377, 1538, 452, 50),
(378, 1539, 453, 50),
(379, 1540, 454, 50),
(380, 1541, 455, 50),
(381, 1542, 456, 50),
(382, 1543, 457, 50),
(383, 1544, 458, 50),
(384, 1545, 459, 50),
(385, 1546, 460, 100),
(386, 1547, 461, 100),
(387, 1548, 462, 100),
(388, 1549, 463, 100),
(389, 1550, 464, 100),
(390, 1551, 465, 100),
(391, 1552, 466, 100),
(392, 1553, 467, 100),
(393, 1554, 468, 100),
(394, 1555, 470, 100),
(395, 1556, 471, 100),
(396, 1557, 472, 100),
(397, 1558, 473, 100),
(398, 1559, 474, 100),
(399, 1560, 475, 100),
(400, 1561, 476, 50),
(401, 1562, 477, 100),
(402, 1563, 478, 100),
(403, 1564, 479, 100),
(404, 1565, 480, 100),
(405, 1566, 481, 100),
(406, 1567, 482, 50),
(407, 1568, 483, 50),
(408, 1569, 484, 50),
(409, 1570, 485, 50),
(410, 1571, 486, 50),
(411, 1572, 487, 50),
(412, 1573, 489, 50),
(413, 1574, 491, 50),
(414, 1575, 492, 50),
(415, 1576, 493, 50),
(416, 1577, 494, 50),
(417, 1578, 495, 50),
(418, 1579, 496, 50),
(419, 1580, 497, 50),
(420, 1581, 498, 50),
(421, 1582, 499, 50),
(422, 1583, 500, 50),
(423, 1584, 501, 50),
(424, 1585, 502, 50),
(425, 1586, 503, 50),
(426, 1587, 504, 50),
(427, 1588, 505, 50),
(428, 1589, 506, 100),
(429, 1590, 507, 100),
(430, 1591, 508, 100),
(431, 1592, 509, 100),
(432, 1593, 510, 100),
(433, 1594, 511, 100),
(434, 1595, 512, 100),
(435, 1596, 513, 100),
(436, 1597, 514, 100),
(437, 1598, 515, 50),
(438, 1599, 516, 100),
(439, 1600, 517, 100),
(440, 1601, 518, 50),
(441, 1602, 519, 50),
(442, 1603, 520, 100),
(443, 1604, 521, 50),
(444, 1605, 522, 50),
(445, 1606, 523, 100),
(446, 1607, 524, 50),
(447, 1608, 525, 50),
(448, 1609, 526, 50),
(449, 1610, 527, 50),
(450, 1611, 528, 50),
(451, 1612, 529, 50),
(452, 1613, 614, 100),
(453, 1614, 630, 100),
(454, 1615, 632, 50),
(455, 1616, 634, 50),
(456, 1617, 1157, 20),
(457, 1618, 1159, 10),
(458, 1619, 1160, 25),
(459, 1621, 1620, 50),
(460, 1623, 1622, 50),
(461, 1625, 1624, 10),
(462, 1631, 1630, 5),
(463, 1627, 1626, 5),
(464, 1629, 1628, 5),
(465, 1633, 1632, 50),
(466, 1635, 1634, 20),
(467, 1637, 1636, 20),
(468, 1639, 1638, 1),
(469, 1641, 1640, 10),
(470, 1643, 1642, 10),
(471, 1645, 1644, 20),
(472, 1647, 1646, 100),
(473, 1649, 1648, 20),
(474, 1651, 1650, 100),
(475, 1653, 1652, 5),
(476, 1655, 1654, 100),
(477, 1657, 1656, 20),
(478, 1659, 1658, 20),
(479, 1661, 1660, 20),
(480, 1663, 1662, 100),
(481, 1665, 1664, 12),
(482, 1667, 1666, 1),
(483, 1669, 1668, 12),
(484, 1671, 1670, 4),
(485, 1673, 1672, 10),
(486, 1675, 1674, 10),
(487, 1677, 1676, 10),
(488, 1679, 1678, 36),
(489, 1681, 1680, 1),
(490, 1683, 1682, 1),
(491, 1685, 1684, 1),
(492, 1689, 1688, 1),
(493, 1687, 1686, 1),
(494, 1691, 1690, 20),
(495, 1693, 1692, 10),
(496, 1695, 1694, 10),
(497, 1697, 1696, 10),
(498, 1699, 1698, 10),
(499, 1701, 1700, 10),
(500, 1703, 1702, 10),
(501, 1705, 1704, 200),
(502, 1707, 1706, 100),
(503, 1709, 1708, 25),
(504, 1711, 1710, 5),
(505, 1713, 1712, 5),
(506, 1715, 1714, 5),
(507, 1719, 1718, 10),
(508, 1717, 1716, 10),
(509, 1721, 1720, 10),
(510, 1723, 1722, 50),
(513, 1725, 1724, 200),
(517, 1352, 264, 5),
(518, 1727, 1726, 1),
(519, 1729, 1728, 100),
(520, 1731, 1730, 50),
(521, 1733, 1732, 100),
(522, 1737, 1736, 10),
(523, 1735, 1734, 10),
(524, 1739, 1738, 20),
(525, 1741, 1740, 1),
(526, 1743, 1742, 50),
(527, 1745, 1744, 20),
(528, 1747, 1746, 100),
(529, 1749, 1748, 100),
(530, 1751, 1750, 5),
(531, 1753, 1752, 50),
(532, 1755, 1754, 50),
(533, 1757, 1756, 10),
(534, 1759, 1758, 10),
(535, 1761, 1760, 50);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `depth` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `small_icon` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`, `parent_id`, `depth`, `sortorder`, `icon`, `small_icon`) VALUES
(1, 'Dashboard', '#', 0, 0, 0, 'dashboard.png', 'home'),
(18, 'Manage Purchases', 'purchase_manage.php', 15, 1, 6, 'manage-purchases.png', 'truck'),
(17, 'Manage Supplier', 'supplier_manage.php', 15, 1, 7, 'manage-supplier.jpg', 'users'),
(19, 'Sales', '#', 0, 0, 8, 'sales.jpg', 'print'),
(20, ' Manage Customer', 'customer_manage.php', 19, 1, 11, 'manage-customer.jpg', 'street-view'),
(8, 'Administrator', 'admin_manage.php', 1, 1, 3, 'administrator.png', 'user'),
(7, 'General Settings', 'config_manage.php?config_id=1', 1, 1, 2, 'general-settings.png', 'adjust'),
(15, 'Inventory', '#', 0, 0, 4, 'inventory.jpg', 'glass'),
(16, 'Manage Sales', 'sales_manage.php', 19, 1, 10, 'manage-sales.png', 'shopping-cart'),
(14, 'Manage Items', 'items_manage.php', 15, 1, 8, 'manage-items.png', 'cog'),
(12, 'Upload Center', 'upload_manage.php', 1, 1, 4, 'upload-center.png', 'file-o'),
(21, 'Supplier Payment', 'supplier_payment_manage.php', 15, 1, 12, 'supplier-payment.png', 'money'),
(22, 'Reports', '#', 0, 0, 12, 'reports.png', 'list-alt'),
(23, 'Daily Report', 'report_manage.php?tab=daily', 22, 1, 14, 'daily-report.png', 'file-o'),
(24, 'Sales Report', 'report_manage.php?tab=sales', 22, 1, 15, 'sales-report.png', 'th-large'),
(25, 'Income Report', 'report_manage.php?tab=income', 22, 1, 16, 'income-report.gif', 'th'),
(26, 'Admin Type', 'admin_type_manage.php', 1, 1, 17, 'admin-type.png', 'unlock-alt'),
(27, 'Accounts', '#', 0, 0, 17, '', 'folder'),
(28, 'Manage Accounts', 'account_manage.php', 27, 1, 19, '', 'glass'),
(30, 'Expense Category', 'expense_category_manage.php', 27, 1, 20, 'expense-category.png', 'th-list'),
(31, 'Manage Expenses', 'expense_manage.php', 27, 1, 21, 'manage-expenses.png', 'asterisk'),
(32, 'Transaction', 'transaction_manage.php', 27, 1, 22, 'transaction.png', 'refresh'),
(33, 'Employees', '#', 0, 0, 23, 'employees.png', 'user-plus'),
(34, 'Generate Salary', 'salary_manage.php?tab=salary', 33, 1, 24, 'generate-salary.png', 'sellsy'),
(35, 'Salary Payments', 'salary_payment_manage.php', 33, 1, 25, 'salary-payments.png', 'bookmark'),
(36, 'Manage Salary', 'salary_manage.php', 33, 1, 26, 'manage-salary.png', 'list-alt'),
(37, 'General Journal', 'report_manage.php?tab=general_journal', 22, 1, 27, 'general-journal.png', 'th-large'),
(38, 'Customer Payment', 'customer_payment_manage.php', 19, 1, 28, 'customer-payment.png', 'fast-backward'),
(39, 'Balance Sheet', 'report_manage.php?tab=balance_sheet', 22, 1, 29, 'balance-sheet.png', 'crosshairs'),
(40, 'Employee Attendance', 'employee_attendance_manage.php', 33, 1, 30, 'employee-attendance.png', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `menu_2_admin_type`
--

CREATE TABLE `menu_2_admin_type` (
  `menu_id` int(11) NOT NULL,
  `admin_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_2_admin_type`
--

INSERT INTO `menu_2_admin_type` (`menu_id`, `admin_type_id`) VALUES
(0, 1),
(0, 3),
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(4, 3),
(4, 4),
(5, 1),
(5, 3),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(14, 1),
(14, 3),
(15, 1),
(15, 3),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `datetime_added` datetime NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `supplier_name` varchar(200) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `total_items` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `net_price` decimal(10,2) NOT NULL,
  `supplier_payment_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `datetime_added`, `type`, `supplier_name`, `phone`, `address`, `supplier_id`, `total_items`, `total_price`, `discount`, `net_price`, `supplier_payment_id`, `status`, `ts`) VALUES
(1, '2021-09-13 22:06:00', 0, 'A.B.I. HYDERABAD', '03009370566', 'Dantor Wali Gali, Khokhar Mohalla, Hyderabad', 5, 10, '1000.00', '0.00', '1000.00', 1, 1, '2021-09-13 17:06:56'),
(2, '2021-09-20 00:00:00', 0, 'A.B.I China ', '', 'Hyderabad', 45, 5, '600.00', '0.00', '600.00', 0, 1, '2021-09-20 15:35:02'),
(3, '2021-09-20 00:00:00', 0, 'Ahsan bhai Patti wale', '', 'Hyderabad', 47, 5, '600.00', '0.00', '600.00', 0, 1, '2021-09-20 15:46:42'),
(4, '2021-09-20 00:00:00', 0, 'A.B.I China ', '', 'Hyderabad', 45, 10005, '3000.00', '0.00', '3000.00', 0, 1, '2021-09-20 16:07:24'),
(5, '2021-09-24 20:05:00', 0, 'A.B.I. HYDERABAD', '03009370566', 'Dantor Wali Gali, Khokhar Mohalla, Hyderabad', 5, 100, '420.00', '0.00', '420.00', 0, 1, '2021-09-24 15:07:16'),
(6, '2021-09-24 00:00:00', 1, 'A.B.I. HYDERABAD', '03009370566', 'Dantor Wali Gali, Khokhar Mohalla, Hyderabad', 5, 40, '10000.00', '0.00', '10000.00', 0, 1, '2021-09-24 15:52:51'),
(7, '2021-09-24 00:00:00', 0, 'A.B.I. HYDERABAD', '03009370566', 'Dantor Wali Gali, Khokhar Mohalla, Hyderabad', 5, 10, '10.00', '0.00', '10.00', 0, 1, '2021-09-24 16:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `hundred_pieces_kg` int(10) NOT NULL,
  `unit` int(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `total_kg` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `item_id`, `unit_price`, `hundred_pieces_kg`, `unit`, `quantity`, `total_kg`, `total_price`) VALUES
(1, 1, 26, '100.00', 0, 0, 10, '0.00', '1000.00'),
(2, 2, 26, '300.00', 0, 1, 5, '2.00', '600.00'),
(3, 3, 25, '200.00', 0, 1, 5, '3.00', '600.00'),
(4, 4, 26, '100.00', 0, 0, 5, '200.00', '500.00'),
(5, 4, 25, '25.00', 1, 1, 10000, '100.00', '2500.00'),
(6, 5, 26, '210.00', 2, 1, 100, '2.00', '420.00'),
(7, 6, 26, '250.00', 100, 1, 40, '40.00', '10000.00'),
(8, 7, 26, '5.00', 20, 1, 10, '2.00', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `month` int(20) NOT NULL,
  `year` int(11) NOT NULL,
  `datetime_added` datetime DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_payment`
--

CREATE TABLE `salary_payment` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_id` int(11) DEFAULT 0,
  `datetime_added` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `account_id` int(11) NOT NULL,
  `details` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `datetime_added` datetime NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `net_price` decimal(10,2) NOT NULL,
  `customer_payment_id` int(11) NOT NULL,
  `cash_receive` decimal(10,2) NOT NULL,
  `cash_return` decimal(10,2) NOT NULL,
  `town` int(1) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `datetime_added`, `customer_name`, `phone`, `address`, `customer_id`, `total_items`, `total_price`, `discount`, `net_price`, `customer_payment_id`, `cash_receive`, `cash_return`, `town`, `status`, `ts`) VALUES
(1, '2021-09-13 21:42:00', 'A.B Autos', '03453607906', 'Pinjrapol Hyd', 53, 1, '140.00', '0.00', '140.00', 6, '0.00', '0.00', 2, 1, '2021-09-14 09:35:00'),
(2, '2021-09-13 22:50:00', 'A.B Autos', '03453607906', 'Pinjrapol Hyd', 53, 5, '550.00', '0.00', '550.00', 7, '0.00', '0.00', 1, 1, '2021-09-13 18:31:23'),
(3, '2021-09-13 23:15:00', 'A.Samad Suplier ', '03063409247', 'Behria Road (Noshero Feroz)', 99, 10, '1250.00', '0.00', '1250.00', 8, '1500.00', '250.00', 0, 1, '2021-09-13 18:30:54'),
(4, '2021-09-14 19:16:00', 'A.B Autos', '03453607906', 'Pinjrapol Hyd', 53, 1, '120.00', '0.00', '120.00', 9, '0.00', '0.00', 1, 1, '2021-09-14 14:16:41'),
(5, '2021-09-15 19:41:00', 'A.Samad Suplier ', '03063409247', 'Behria Road (Noshero Feroz)', 99, 3, '420.00', '0.00', '420.00', 10, '0.00', '0.00', 0, 1, '2021-09-15 14:48:04'),
(6, '2021-09-15 19:52:00', 'A.B Autos', '03453607906', 'Pinjrapol Hyd', 53, 5, '790.00', '0.00', '790.00', 11, '0.00', '0.00', 0, 1, '2021-09-15 15:04:09'),
(7, '2021-09-15 20:35:00', 'A.B Autos', '03453607906', 'Pinjrapol Hyd', 53, 2, '220.00', '0.00', '220.00', 12, '0.00', '0.00', 0, 1, '2021-09-15 15:36:59'),
(8, '2021-09-20 16:49:00', 'try', '33', '', 0, 1, '300.00', '0.00', '300.00', 13, '0.00', '0.00', 0, 1, '2021-09-24 15:42:18'),
(9, '2021-09-24 20:44:00', 'AASA AUTO MOBILE', '434', '', 25, 4, '520.00', '0.00', '520.00', 14, '0.00', '0.00', 0, 1, '2021-09-24 15:45:21'),
(10, '2021-09-24 20:45:00', 'AASA AUTO MOBILE', '03126649993 (Imran)', '', 43, 0, '0.00', '0.00', '0.00', 0, '0.00', '0.00', 0, 1, '2021-09-24 15:46:06'),
(11, '2021-09-24 20:45:00', 'AASA AUTO MOBILE', '03126649993 (Imran)', '', 43, 5, '600.00', '0.00', '600.00', 15, '0.00', '0.00', 0, 1, '2021-09-24 15:47:28'),
(12, '2021-09-24 20:47:00', 'Abid Autos', '03123832697', 'Tando alayar', 112, 1, '220.00', '0.00', '220.00', 16, '0.00', '0.00', 0, 1, '2021-09-24 15:47:55'),
(13, '2021-09-24 20:50:00', 'Alam Autos', '4334', 'Denter Wali Gali', 10, 1, '290.00', '0.00', '290.00', 17, '0.00', '0.00', 0, 1, '2021-09-24 15:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `unit` int(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `total_kg` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `sales_id`, `item_id`, `unit_price`, `unit`, `quantity`, `total_kg`, `total_price`) VALUES
(1, 1, 1174, '140.00', 0, 1, '0.00', '140.00'),
(2, 2, 1174, '110.00', 0, 5, '0.00', '550.00'),
(3, 3, 1173, '120.00', 0, 5, '0.00', '600.00'),
(4, 3, 1175, '130.00', 0, 5, '0.00', '650.00'),
(5, 4, 1174, '120.00', 0, 1, '0.00', '120.00'),
(6, 5, 1174, '120.00', 0, 2, '0.00', '240.00'),
(7, 5, 1555, '180.00', 0, 1, '0.00', '180.00'),
(8, 6, 1616, '160.00', 0, 2, '0.00', '320.00'),
(9, 6, 1559, '180.00', 0, 2, '0.00', '360.00'),
(10, 6, 1174, '110.00', 0, 1, '0.00', '110.00'),
(11, 7, 1548, '110.00', 0, 2, '0.00', '220.00'),
(12, 8, 1173, '150.00', 1, 1, '2.00', '300.00'),
(13, 9, 1175, '130.00', 0, 4, '0.00', '520.00'),
(14, 11, 1174, '150.00', 0, 5, '0.00', '600.00'),
(15, 12, 1174, '110.00', 1, 1, '2.00', '220.00'),
(16, 13, 1174, '145.00', 1, 1, '2.00', '290.00');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier_name`, `phone`, `address`, `status`, `ts`) VALUES
(5, 'A.B.I. HYDERABAD', '03009370566', 'Dantor Wali Gali, Khokhar Mohalla, Hyderabad', 1, '2017-03-29 09:28:31'),
(6, 'Liaqut Bhai (Bhaya Washer Wala) ', '03213025672', 'Paretabad Al Mashriq Road Muchal Pan Wala', 1, '2017-05-14 09:57:02'),
(7, 'Owais (Spring)', '03133057435', 'Latifabad #11', 1, '2017-05-16 08:30:20'),
(8, 'Aqeel Traders ', '', 'Karachi', 1, '2017-05-24 14:15:59'),
(9, 'Return Item', '', '', 1, '2017-05-24 15:41:09'),
(10, 'Shakeel (Spring Wala)', '03123866909', 'Pakka Qilla', 1, '2017-05-29 12:27:09'),
(11, 'Shahid Atta Sahab', '03214412303', 'Lahore', 1, '2017-05-31 09:50:35'),
(12, 'Faraz Ahmed (Spring Wala)', '03022401940', 'Latifabad No. 11, Hyderabad', 1, '2017-06-01 10:43:57'),
(13, 'Allah Tawakal (Rashid Bhai Lahore)', '', 'Lahore', 1, '2017-06-20 10:54:17'),
(14, 'Jawed Bhai (Kamoki)', '', '', 1, '2017-07-08 08:51:40'),
(15, 'Imran Mughal ', '', 'Karachi', 1, '2017-07-29 10:30:15'),
(16, 'O.K Autos', '', 'Karachi', 1, '2017-08-02 10:51:11'),
(17, 'S.K Technology', '', 'Tayab Complase', 1, '2017-08-02 10:53:26'),
(18, 'AKBER BHAI', '', 'HYDERABAD', 1, '2017-09-17 10:53:41'),
(19, 'LOCAL MARKET', '', 'KHOKHAR MOHLLA', 1, '2017-09-19 06:20:40'),
(20, 'Aslam Khatri (Persnal)', '', 'Hyderabad', 1, '2017-09-27 16:06:21'),
(21, 'Aslam Khatri (Social)', '', 'Hyderabad', 1, '2017-09-27 16:07:20'),
(22, 'Bilal Bhai (Softwear)', '', 'Latifabad No#8', 1, '2017-10-03 06:29:36'),
(23, 'Mounthly Expense', '', 'Tamseel Traders', 1, '2017-10-11 09:34:01'),
(24, 'Daily Expense', '', 'Tamseel Traders', 1, '2017-10-11 09:34:29'),
(25, 'Salman Bhai ', '', 'Karachi', 1, '2017-11-21 10:44:52'),
(26, 'SHADDU BHAI', '', 'HYDERABAD', 1, '2017-12-10 09:07:05'),
(27, 'Entertainment', '', 'Hyderabad', 1, '2017-12-28 07:50:27'),
(28, 'RK-M ', '', 'Lahor', 1, '2018-02-18 10:05:43'),
(29, 'Aqeel Bhai Washer Wale', '03212184359', 'Karachi', 1, '2018-02-18 15:56:32'),
(30, 'Waseem Autos', '', 'Lahor', 1, '2018-03-07 14:55:16'),
(31, 'SAANTA STAR', '', 'Lahor', 1, '2018-04-03 07:30:31'),
(32, 'Arif Autos', '', '', 1, '2018-04-18 14:31:42'),
(33, 'Rent Shop', '', '', 1, '2018-04-23 15:14:26'),
(34, 'Aslam Bhai Salary', '', '', 1, '2018-04-23 15:14:36'),
(35, 'Noorani Autos', '', '', 1, '2018-05-14 14:24:07'),
(36, 'Jawed Bhai (Gujra wala)', '', 'Gujra wala', 1, '2018-06-26 10:12:37'),
(37, 'Anas Autos', '', 'Karachi', 1, '2018-07-21 06:41:39'),
(38, 'Ismail Bhai ', '', 'Karachi', 1, '2018-08-09 09:47:32'),
(39, 'H.H.S China', '', '', 1, '2018-09-08 09:54:25'),
(40, 'Yaseen (Zam Zam)', '', 'Jarra wali gali', 1, '2018-10-07 09:40:06'),
(41, 'Ashraf Bhai', '', '', 1, '2018-10-08 14:03:33'),
(42, 'J.S ENGINEERING', '', 'Kasur', 1, '2018-10-23 09:35:26'),
(43, 'Danish ', '', 'Karachi', 1, '2018-11-10 12:00:52'),
(44, 'M.Shebaz Clutch gundi', '03162666666', 'sargoda', 1, '2018-11-24 10:14:30'),
(45, 'A.B.I China ', '', 'Hyderabad', 1, '2018-12-03 14:15:58'),
(46, 'Diffrance closing 2018', '', '', 1, '2019-01-05 14:40:46'),
(47, 'Ahsan bhai Patti wale', '', 'Hyderabad', 1, '2019-01-20 07:45:13'),
(48, 'S.M', '', 'Hyderabad', 1, '2019-01-29 14:51:12'),
(49, 'Zeeshan Razi (Horn Patti)', '', 'karachi', 1, '2019-03-23 06:32:34'),
(50, 'Fakhir Muhammad ', '', '', 1, '2019-03-26 07:43:39'),
(51, 'Nisar Bhai Karachi', '', 'Karachi', 1, '2019-04-02 10:39:45'),
(52, 'Raheel', '', '', 1, '2021-09-13 17:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payment`
--

CREATE TABLE `supplier_payment` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `datetime_added` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `details` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_payment`
--

INSERT INTO `supplier_payment` (`id`, `supplier_id`, `account_id`, `datetime_added`, `amount`, `details`, `status`, `ts`) VALUES
(1, 5, 4, '2021-09-13 22:06:00', '500.00', 'Payment againset Purchase #1', 1, '2021-09-13 17:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `reference_id` int(1) NOT NULL DEFAULT 0,
  `datetime_added` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `details` text NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filelocation` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `filename`, `filelocation`) VALUES
(9, 'test', 'test.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_type`
--
ALTER TABLE `admin_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_type`
--
ALTER TABLE `config_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_variable`
--
ALTER TABLE `config_variable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_payment`
--
ALTER TABLE `customer_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_daily_attendance`
--
ALTER TABLE `employee_daily_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_group`
--
ALTER TABLE `item_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_item_id` (`group_item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_2_admin_type`
--
ALTER TABLE `menu_2_admin_type`
  ADD PRIMARY KEY (`menu_id`,`admin_type_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_payment`
--
ALTER TABLE `salary_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin_type`
--
ALTER TABLE `admin_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `config_type`
--
ALTER TABLE `config_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `config_variable`
--
ALTER TABLE `config_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `customer_payment`
--
ALTER TABLE `customer_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_daily_attendance`
--
ALTER TABLE `employee_daily_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1762;

--
-- AUTO_INCREMENT for table `item_group`
--
ALTER TABLE `item_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=536;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_payment`
--
ALTER TABLE `salary_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
