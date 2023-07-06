-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2023 at 05:32 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laguna_local_shop_custom`
--

-- --------------------------------------------------------

--
-- Table structure for table `md_config_email`
--

CREATE TABLE `md_config_email` (
  `id` int(11) NOT NULL,
  `email_type_id` int(11) NOT NULL,
  `email_body` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_config_email`
--

INSERT INTO `md_config_email` (`id`, `email_type_id`, `email_body`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'You have successfully completed your registration..', 'admin@gmail.com', '2021-11-25 13:14:57', NULL, NULL),
(2, 2, 'Your order has been placed successfully.', 'admin@gmail.com', '2021-11-25 13:15:41', 'admin@gmail.com', '2022-12-30 09:31:32'),
(3, 3, 'We are happy to have you as a part of the Shop Local Laguna family!\nYour payment has been done successfully.', 'admin@gmail.com', '2021-11-25 13:16:25', NULL, NULL),
(4, 5, '<p><font color=\"#000000\"><font face=\"Arial\"><font>Dear <b>#[contact-person]</b> at the <b>#[hotel-name]</b></font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font>We would like to thank you for your interest in the above platform ad confirm we will be in contact with you very shortly to discuss this in more detail.</font></font></font></p><p><br></p><p><font color=\"#000000\"><font face=\"Arial\"><font>If for any reason your schedule changes and you would like to re-arrange the day and time you indicated for us to call, which was <b>#[contact-time]</b>, then please do not hesitate to reply to this email.</font></font></font></p><p><br></p><p><font color=\"#000000\"><font face=\"Arial\"><font>Kind regards</font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font>Cindy Ferguson</font></font></font></p>', 'admin@gmail.com', '2022-01-27 09:55:01', NULL, NULL),
(5, 6, '<p><font color=\"#000000\"><font face=\"Arial\"><font>An enquiry form has just been completed by the following Hotel, Please make contact with them to discuss their requirement on the date and time indicated.</font></font></font></p><p><font color=\"#000000\"><font face=\"Roboto, sans-serif\"><font><font face=\"Arial\">Hotel Name: </font><font face=\"Arial\"><b>#[hotel-name]</span></b></font></font></font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font><span>Address: <b>#[address]</b></span></font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font><span>Zip Code: <b>#[zip-code]</b></span></font></font></font></p><p><font color=\"#000000\"><font face=\"Roboto, sans-serif\"><font><font face=\"Arial\"><font><span>Contact Person: </span></font></font><font face=\"Arial\"><font><b><span>#[contact-person]</span></b></font></font></font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font>Mobile: <b>#[mobile]</b></font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font>Email: <b>#[email]</b></font></font></font></p><p><font color=\"#000000\"><font face=\"Arial\"><font>Best Day to contact: <b>#[contact-time]</b></font></font></font></p>', 'admin@gmail.com', '2022-01-27 09:55:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_config_inst`
--

CREATE TABLE `md_config_inst` (
  `id` int(11) NOT NULL,
  `menu_help` text DEFAULT NULL,
  `calender_help` text DEFAULT NULL,
  `qr_help` text DEFAULT NULL,
  `birthday_help` text DEFAULT NULL,
  `cantact_info_help` text DEFAULT NULL,
  `birthday_body` text DEFAULT NULL,
  `event_body` text DEFAULT NULL,
  `event_img` text DEFAULT NULL,
  `order_conf` text DEFAULT NULL,
  `cover_img` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_config_inst`
--

INSERT INTO `md_config_inst` (`id`, `menu_help`, `calender_help`, `qr_help`, `birthday_help`, `cantact_info_help`, `birthday_body`, `event_body`, `event_img`, `order_conf`, `cover_img`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'This is a sample help text for menu. ', 'This is a sample help text for calendar. ', 'This is a sample help text for QR Code signage. ', 'This is a sample help text for birthday/anniversary. happy Birthday ', 'This is a sample help text for contact information. ', '<font face=\"Arial\">This is a rule set for birthdays and anniversary. There are certain rules to be followed if someone has chosen birthday/anniversary. The facility is free by default and it is up to the admin to decide whether is free or not. The rules are as followed:</font><p></p><ol><li><font face=\"Arial\">Rule 1</font></li><li><font face=\"Arial\">Rule 2</font></li><li><font face=\"Arial\">Rule 3</font></li></ol><p></p>', '<font face=\"Arial\">This is a rule set for event calendar. There are certain rules to be followed if someone has chosen event calendar. The facility is free by default and it is up to the admin to decide whether is free or not. The rules are as followed:</font><p></p><ol><li><font face=\"Arial\">Rule 1</font></li><li><font face=\"Arial\">Rule 2</font></li><li><font face=\"Arial\">Rule 3</font></li></ol><p></p>', 'dif_THA.png', 'We are happy to have you as a part of the Shop Local Laguna family!\nWe\'ve received your order, including all photos and data (or link to your website\nfor us to collect), and will now commence with the development of your Digital\nMenu.\nIf for any reason there are any problems then we will contact you by email.\nWhat\'s Next?\nBefore your Digital Menu can go live you must check that all of the menu\ncontent is correct, and meets with your overall approval. You should do this by\nscanning the QR Code contained in the completion email we send you, this way\nyou will experience (the same way that your customers will) viewing and\nnavigating your new menu platform on your mobile.\nIf everything is in order then you will Approve the Menu.\nHowever if there are any errors or omissions you will identify those issues in the\nform and they would be corrected by our technical support team and once\ncompleted you will receive the confirmation email again. Any future\namendments to the Menu will be handled by you or your authorized staff, from\nwithin your platform\'s back-office.\nOnce you\'ve provided us with your final approval, your Menu will go LIVE. You\nwill receive an email which includes a link to your sign-in page, where your\nUsername will be your registered email address. We will provide a temporary\npassword which expires 2 hours after first logging in, so the first thing you must\ndo is to create your new password.', 'dif_cov_rest_cov.jpg', 'admin@gmail.com', '2021-11-18 12:41:22', 'admin@gmail.com', '2023-06-30 13:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `md_config_menu`
--

CREATE TABLE `md_config_menu` (
  `id` int(11) NOT NULL,
  `footer_color` varchar(50) DEFAULT NULL,
  `footer_content` text DEFAULT NULL,
  `text_color` varchar(50) DEFAULT NULL,
  `greet_text_color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_config_menu`
--

INSERT INTO `md_config_menu` (`id`, `footer_color`, `footer_content`, `text_color`, `greet_text_color`) VALUES
(1, '#cc1414', '<div><font color=\"#e1d014\"><strong>Lorem Ipsum</strong><span>&#160;is simply dummy text of the printing and typesetting industry.</span></font><br></div>', '#222020', '#3600fa');

-- --------------------------------------------------------

--
-- Table structure for table `md_country`
--

CREATE TABLE `md_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `md_country`
--

INSERT INTO `md_country` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'China', NULL, NULL),
(2, 'India', NULL, NULL),
(3, 'United States', NULL, NULL),
(4, 'Indonesia', NULL, NULL),
(5, 'Brazil', NULL, NULL),
(6, 'Pakistan', NULL, NULL),
(7, 'Nigeria', NULL, NULL),
(8, 'Bangladesh', NULL, NULL),
(9, 'Russia', NULL, NULL),
(10, 'Japan', NULL, NULL),
(11, 'Mexico', NULL, NULL),
(12, 'Philippines', NULL, NULL),
(13, 'Vietnam', NULL, NULL),
(14, 'Ethiopia', NULL, NULL),
(15, 'Egypt', NULL, NULL),
(16, 'Germany', NULL, NULL),
(17, 'Iran', NULL, NULL),
(18, 'Turkey', NULL, NULL),
(19, 'Democratic Republic of the Congo', NULL, NULL),
(20, 'Thailand', NULL, NULL),
(21, 'France', NULL, NULL),
(22, 'United Kingdom', NULL, NULL),
(23, 'Italy', NULL, NULL),
(24, 'Burma', NULL, NULL),
(25, 'South Africa', NULL, NULL),
(26, 'South Korea', NULL, NULL),
(27, 'Colombia', NULL, NULL),
(28, 'Spain', NULL, NULL),
(29, 'Ukraine', NULL, NULL),
(30, 'Tanzania', NULL, NULL),
(31, 'Kenya', NULL, NULL),
(32, 'Argentina', NULL, NULL),
(33, 'Algeria', NULL, NULL),
(34, 'Poland', NULL, NULL),
(35, 'Sudan', NULL, NULL),
(36, 'Uganda', NULL, NULL),
(37, 'Canada', NULL, NULL),
(38, 'Iraq', NULL, NULL),
(39, 'Morocco', NULL, NULL),
(40, 'Peru', NULL, NULL),
(41, 'Uzbekistan', NULL, NULL),
(42, 'Saudi Arabia', NULL, NULL),
(43, 'Malaysia', NULL, NULL),
(44, 'Venezuela', NULL, NULL),
(45, 'Nepal', NULL, NULL),
(46, 'Afghanistan', NULL, NULL),
(47, 'Yemen', NULL, NULL),
(48, 'North Korea', NULL, NULL),
(49, 'Ghana', NULL, NULL),
(50, 'Mozambique', NULL, NULL),
(51, 'Taiwan', NULL, NULL),
(52, 'Australia', NULL, NULL),
(53, 'Ivory Coast', NULL, NULL),
(54, 'Syria', NULL, NULL),
(55, 'Madagascar', NULL, NULL),
(56, 'Angola', NULL, NULL),
(57, 'Cameroon', NULL, NULL),
(58, 'Sri Lanka', NULL, NULL),
(59, 'Romania', NULL, NULL),
(60, 'Burkina Faso', NULL, NULL),
(61, 'Niger', NULL, NULL),
(62, 'Kazakhstan', NULL, NULL),
(63, 'Netherlands', NULL, NULL),
(64, 'Chile', NULL, NULL),
(65, 'Malawi', NULL, NULL),
(66, 'Ecuador', NULL, NULL),
(67, 'Guatemala', NULL, NULL),
(68, 'Mali', NULL, NULL),
(69, 'Cambodia', NULL, NULL),
(70, 'Senegal', NULL, NULL),
(71, 'Zambia', NULL, NULL),
(72, 'Zimbabwe', NULL, NULL),
(73, 'Chad', NULL, NULL),
(74, 'South Sudan', NULL, NULL),
(75, 'Belgium', NULL, NULL),
(76, 'Cuba', NULL, NULL),
(77, 'Tunisia', NULL, NULL),
(78, 'Guinea', NULL, NULL),
(79, 'Greece', NULL, NULL),
(80, 'Portugal', NULL, NULL),
(81, 'Rwanda', NULL, NULL),
(82, 'Czech Republic', NULL, NULL),
(83, 'Somalia', NULL, NULL),
(84, 'Haiti', NULL, NULL),
(85, 'Benin', NULL, NULL),
(86, 'Burundi', NULL, NULL),
(87, 'Bolivia', NULL, NULL),
(88, 'Hungary', NULL, NULL),
(89, 'Sweden', NULL, NULL),
(90, 'Belarus', NULL, NULL),
(91, 'Dominican Republic', NULL, NULL),
(92, 'Azerbaijan', NULL, NULL),
(93, 'Honduras', NULL, NULL),
(94, 'Austria', NULL, NULL),
(95, 'United Arab Emirates', NULL, NULL),
(96, 'Israel', NULL, NULL),
(97, 'Switzerland', NULL, NULL),
(98, 'Tajikistan', NULL, NULL),
(99, 'Bulgaria', NULL, NULL),
(100, 'Hong Kong (China)', NULL, NULL),
(101, 'Serbia', NULL, NULL),
(102, 'Papua New Guinea', NULL, NULL),
(103, 'Paraguay', NULL, NULL),
(104, 'Laos', NULL, NULL),
(105, 'Jordan', NULL, NULL),
(106, 'El Salvador', NULL, NULL),
(107, 'Eritrea', NULL, NULL),
(108, 'Libya', NULL, NULL),
(109, 'Togo', NULL, NULL),
(110, 'Sierra Leone', NULL, NULL),
(111, 'Nicaragua', NULL, NULL),
(112, 'Kyrgyzstan', NULL, NULL),
(113, 'Denmark', NULL, NULL),
(114, 'Finland', NULL, NULL),
(115, 'Slovakia', NULL, NULL),
(116, 'Singapore', NULL, NULL),
(117, 'Turkmenistan', NULL, NULL),
(118, 'Norway', NULL, NULL),
(119, 'Lebanon', NULL, NULL),
(120, 'Costa Rica', NULL, NULL),
(121, 'Central African Republic', NULL, NULL),
(122, 'Ireland', NULL, NULL),
(123, 'Georgia', NULL, NULL),
(124, 'New Zealand', NULL, NULL),
(125, 'Republic of the Congo', NULL, NULL),
(126, 'Palestine', NULL, NULL),
(127, 'Liberia', NULL, NULL),
(128, 'Croatia', NULL, NULL),
(129, 'Oman', NULL, NULL),
(130, 'Bosnia and Herzegovina', NULL, NULL),
(131, 'Puerto Rico', NULL, NULL),
(132, 'Kuwait', NULL, NULL),
(133, 'Moldov', NULL, NULL),
(134, 'Mauritania', NULL, NULL),
(135, 'Panama', NULL, NULL),
(136, 'Uruguay', NULL, NULL),
(137, 'Armenia', NULL, NULL),
(138, 'Lithuania', NULL, NULL),
(139, 'Albania', NULL, NULL),
(140, 'Mongolia', NULL, NULL),
(141, 'Jamaica', NULL, NULL),
(142, 'Namibia', NULL, NULL),
(143, 'Lesotho', NULL, NULL),
(144, 'Qatar', NULL, NULL),
(145, 'Macedonia', NULL, NULL),
(146, 'Slovenia', NULL, NULL),
(147, 'Botswana', NULL, NULL),
(148, 'Latvia', NULL, NULL),
(149, 'Gambia', NULL, NULL),
(150, 'Kosovo', NULL, NULL),
(151, 'Guinea-Bissau', NULL, NULL),
(152, 'Gabon', NULL, NULL),
(153, 'Equatorial Guinea', NULL, NULL),
(154, 'Trinidad and Tobago', NULL, NULL),
(155, 'Estonia', NULL, NULL),
(156, 'Mauritius', NULL, NULL),
(157, 'Swaziland', NULL, NULL),
(158, 'Bahrain', NULL, NULL),
(159, 'Timor-Leste', NULL, NULL),
(160, 'Djibouti', NULL, NULL),
(161, 'Cyprus', NULL, NULL),
(162, 'Fiji', NULL, NULL),
(163, 'Reunion (France)', NULL, NULL),
(164, 'Guyana', NULL, NULL),
(165, 'Comoros', NULL, NULL),
(166, 'Bhutan', NULL, NULL),
(167, 'Montenegro', NULL, NULL),
(168, 'Macau (China)', NULL, NULL),
(169, 'Solomon Islands', NULL, NULL),
(170, 'Western Sahara', NULL, NULL),
(171, 'Luxembourg', NULL, NULL),
(172, 'Suriname', NULL, NULL),
(173, 'Cape Verde', NULL, NULL),
(174, 'Malta', NULL, NULL),
(175, 'Guadeloupe (France)', NULL, NULL),
(176, 'Martinique (France)', NULL, NULL),
(177, 'Brunei', NULL, NULL),
(178, 'Bahamas', NULL, NULL),
(179, 'Iceland', NULL, NULL),
(180, 'Maldives', NULL, NULL),
(181, 'Belize', NULL, NULL),
(182, 'Barbados', NULL, NULL),
(183, 'French Polynesia (France)', NULL, NULL),
(184, 'Vanuatu', NULL, NULL),
(185, 'New Caledonia (France)', NULL, NULL),
(186, 'French Guiana (France)', NULL, NULL),
(187, 'Mayotte (France)', NULL, NULL),
(188, 'Samoa', NULL, NULL),
(189, 'Sao Tom and Principe', NULL, NULL),
(190, 'Saint Lucia', NULL, NULL),
(191, 'Guam (USA)', NULL, NULL),
(192, 'Curacao (Netherlands)', NULL, NULL),
(193, 'Saint Vincent and the Grenadines', NULL, NULL),
(194, 'Kiribati', NULL, NULL),
(195, 'United States Virgin Islands (USA)', NULL, NULL),
(196, 'Grenada', NULL, NULL),
(197, 'Tonga', NULL, NULL),
(198, 'Aruba (Netherlands)', NULL, NULL),
(199, 'Federated States of Micronesia', NULL, NULL),
(200, 'Jersey (UK)', NULL, NULL),
(201, 'Seychelles', NULL, NULL),
(202, 'Antigua and Barbuda', NULL, NULL),
(203, 'Isle of Man (UK)', NULL, NULL),
(204, 'Andorra', NULL, NULL),
(205, 'Dominica', NULL, NULL),
(206, 'Bermuda (UK)', NULL, NULL),
(207, 'Guernsey (UK)', NULL, NULL),
(208, 'Greenland (Denmark)', NULL, NULL),
(209, 'Marshall Islands', NULL, NULL),
(210, 'American Samoa (USA)', NULL, NULL),
(211, 'Cayman Islands (UK)', NULL, NULL),
(212, 'Saint Kitts and Nevis', NULL, NULL),
(213, 'Northern Mariana Islands (USA)', NULL, NULL),
(214, 'Faroe Islands (Denmark)', NULL, NULL),
(215, 'Sint Maarten (Netherlands)', NULL, NULL),
(216, 'Saint Martin (France)', NULL, NULL),
(217, 'Liechtenstein', NULL, NULL),
(218, 'Monaco', NULL, NULL),
(219, 'San Marino', NULL, NULL),
(220, 'Turks and Caicos Islands (UK)', NULL, NULL),
(221, 'Gibraltar (UK)', NULL, NULL),
(222, 'British Virgin Islands (UK)', NULL, NULL),
(223, 'Aland Islands (Finland)', NULL, NULL),
(224, 'Caribbean Netherlands (Netherlands)', NULL, NULL),
(225, 'Palau', NULL, NULL),
(226, 'Cook Islands (NZ)', NULL, NULL),
(227, 'Anguilla (UK)', NULL, NULL),
(228, 'Wallis and Futuna (France)', NULL, NULL),
(229, 'Tuvalu', NULL, NULL),
(230, 'Nauru', NULL, NULL),
(231, 'Saint Barthelemy (France)', NULL, NULL),
(232, 'Saint Pierre and Miquelon (France)', NULL, NULL),
(233, 'Montserrat (UK)', NULL, NULL),
(234, 'Saint Helena', NULL, NULL),
(235, 'Svalbard and Jan Mayen (Norway)', NULL, NULL),
(236, 'Falkland Islands (UK)', NULL, NULL),
(237, 'Norfolk Island (Australia)', NULL, NULL),
(238, 'Christmas Island (Australia)', NULL, NULL),
(239, 'Niue (NZ)', NULL, NULL),
(240, 'Tokelau (NZ)', NULL, NULL),
(241, 'Vatican City', NULL, NULL),
(242, 'Cocos (Keeling) Islands (Australia)', NULL, NULL),
(243, 'Pitcairn Islands (UK)', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_department`
--

CREATE TABLE `md_department` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_department`
--

INSERT INTO `md_department` (`id`, `hotel_id`, `dept_name`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Front Office', 'admin@gmail.com', '2023-02-06 13:56:19', 'admin@gmail.com', '2023-06-30 06:51:49'),
(2, 1, 'Housekeeping', 'admin@gmail.com', '2023-02-06 13:56:52', NULL, NULL),
(3, 1, 'Food & Beverage service', 'admin@gmail.com', '2023-02-06 14:37:04', NULL, NULL),
(4, 1, 'Kitchen', 'admin@gmail.com', '2023-02-06 15:03:49', 'admin@gmail.com', '2023-02-06 15:15:41'),
(5, 1, 'Engineering & Maintenance', 'admin@gmail.com', '2023-02-06 15:04:05', NULL, NULL),
(6, 1, 'Accounts', 'admin@gmail.com', '2023-02-06 15:03:49', NULL, NULL),
(7, 1, 'Security', 'admin@gmail.com', '2023-02-06 00:00:00', NULL, NULL),
(8, 1, 'Human Resources', 'admin@gmail.com', '2023-02-06 15:03:49', NULL, NULL),
(9, 1, 'Sales & Marketing', 'admin@gmail.com', '2023-02-06 15:04:05', NULL, NULL),
(10, 1, 'Purchase', 'admin@gmail.com', '2023-02-06 00:00:00', NULL, NULL),
(11, 1, 'Information Technology', 'admin@gmail.com', '2023-02-06 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_email_type`
--

CREATE TABLE `md_email_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_email_type`
--

INSERT INTO `md_email_type` (`id`, `type_name`, `created_by`, `created_dt`) VALUES
(1, 'Order Placement', 'admin@gmail.com', '2021-11-05 00:00:00'),
(2, 'Payment', 'admin@gmail.com', '2021-11-05 00:00:00'),
(3, 'Login Credential', 'admin@gmail.com', '2021-11-05 00:00:00'),
(4, 'Order Confirm', 'admin@gmail.com', '2022-01-20 18:19:34'),
(5, 'Enquiry Restaurant', NULL, NULL),
(6, 'Enquiry Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_employee`
--

CREATE TABLE `md_employee` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL DEFAULT 0,
  `emp_name` varchar(50) NOT NULL,
  `emp_dept_id` int(11) NOT NULL COMMENT 'md_department->id',
  `mobile_no` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `manager_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `pref_lang` varchar(50) DEFAULT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Revoke Permission',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_employee`
--

INSERT INTO `md_employee` (`id`, `hotel_id`, `emp_id`, `emp_name`, `emp_dept_id`, `mobile_no`, `email_id`, `manager_flag`, `pref_lang`, `active_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(2, 1, 2, 'Brian Foster', 2, '9836751294', 'brian@hotmail.com', 'Y', NULL, 'Y', 'admin@gmail.com', '2023-02-08 15:31:51', 'admin@gmail.com', '2023-02-20 16:20:00'),
(5, 1, 5, 'Sayantika Chatterjee', 2, '98367512941', 'sayantika@synergicsoftek.in', 'Y', NULL, 'Y', 'admin@gmail.com', '2023-02-08 15:44:14', 'admin@gmail.com', '2023-02-13 15:18:36'),
(16, 1, 0, 'Nabiganjer Daitya', 1, '8118214212', 'somnath.thakur16@gmail.com', 'Y', NULL, 'Y', 'admin@gmail.com', '2023-02-21 11:34:25', NULL, NULL),
(18, 1, 0, 'gewbham ghewmanta', 5, '9834561720', 'gewbham@gmail.com', 'N', NULL, 'Y', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:16:51', NULL, NULL),
(19, 1, 0, 'Sayantika Dhar', 1, '8240404524', 'sayantika.dhar4@gmail.com', 'Y', NULL, 'Y', 'admin@gmail.com', '2023-05-15 06:19:09', NULL, NULL),
(20, 1, 0, 'Tiyasha Saha', 4, '9051203118', 'sayantika.dhar04+4@gmail.com', 'N', NULL, 'Y', 'sayantika.dhar4@gmail.com', '2023-05-15 08:12:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_holder_cling`
--

CREATE TABLE `md_holder_cling` (
  `id` int(11) NOT NULL,
  `free_flag` enum('Y','N') NOT NULL DEFAULT 'Y',
  `price` float(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_holder_cling`
--

INSERT INTO `md_holder_cling` (`id`, `free_flag`, `price`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(6, 'N', 2.00, 'Subham', '2021-09-15 00:00:00', 'admin@gmail.com', '2021-12-24 13:13:24'),
(7, 'N', 5.00, 'Subham', '2021-09-15 00:00:00', 'admin@gmail.com', '2021-10-13 05:30:28'),
(8, 'N', 8.00, 'Subham', '2021-09-15 00:00:00', 'admin@gmail.com', '2021-10-13 05:30:29'),
(9, 'N', 6.00, 'Subham', '2021-09-15 00:00:00', 'admin@gmail.com', '2021-10-13 05:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `md_menu`
--

CREATE TABLE `md_menu` (
  `id` int(11) NOT NULL,
  `menu_description` text NOT NULL,
  `info` text DEFAULT NULL,
  `restaurant_id` bigint(22) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_menu`
--

INSERT INTO `md_menu` (`id`, `menu_description`, `info`, `restaurant_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'Breakfast', 'This is a demo instruction for breakfast menu. Once you choose them, you can enter the details and the admin will approve it.', 0, NULL, NULL, 'admin@gmail.com', '2021-11-26 04:45:41'),
(2, 'Lunch', 'This is a demo instruction for lunch menu. Once you choose them, you can enter the details and the admin will approve it.', 0, NULL, NULL, 'admin@gmail.com', '2021-11-26 04:45:50'),
(3, 'Dinner', 'This is a demo instruction for dinner menu. Once you choose them, you can enter the details and the admin will approve it.', 0, NULL, NULL, 'admin@gmail.com', '2021-11-26 04:46:03'),
(4, 'Brunch', 'This is a demo instruction for brunch menu. Once you choose them, you can enter the details and the admin will approve it.', 0, NULL, NULL, 'admin@gmail.com', '2021-11-26 04:46:13'),
(5, 'Special', 'This is a demo instruction for special menu. Once you choose them, you can enter the details and the admin will approve it.\nRemember Special Menu is for special occasion only', 0, NULL, NULL, 'admin@gmail.com', '2022-01-20 08:13:15'),
(6, 'Kids', NULL, 44, '44', '2021-11-22 12:46:44', NULL, NULL),
(7, 'Vegan', NULL, 44, '44', '2021-11-22 12:46:49', NULL, NULL),
(8, 'Vegan', NULL, 48, '48', '2021-11-26 09:20:24', NULL, NULL),
(9, 'Desserts', NULL, 48, '48', '2021-11-26 09:20:30', NULL, NULL),
(14, 'Test', NULL, 44, '44', '2021-11-29 10:33:07', NULL, NULL),
(20, 'Drinks', NULL, 51, '51', '2021-12-03 20:34:53', NULL, NULL),
(21, 'Vegan', NULL, 51, '51', '2021-12-03 20:35:36', NULL, NULL),
(22, 'Desserts', NULL, 51, '51', '2021-12-03 20:35:47', NULL, NULL),
(23, 'Sunday Lunch', NULL, 51, '51', '2021-12-03 20:36:41', NULL, NULL),
(24, 'Kids', NULL, 51, '51', '2021-12-03 20:37:07', NULL, NULL),
(25, 'Slimming', NULL, 51, '51', '2021-12-03 20:37:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_menu_info`
--

CREATE TABLE `md_menu_info` (
  `id` int(11) NOT NULL,
  `menu_sec_id` int(11) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_menu_info`
--

INSERT INTO `md_menu_info` (`id`, `menu_sec_id`, `info`) VALUES
(2, 1, '<font face=\"Arial\">This is a random hotel info...</font><p></p><ul><li><font face=\"Arial\">This is a random list</font></li><li><font face=\"Arial\">This is a random list 2</font></li><li><font face=\"Arial\">This is a random list 3</font></li></ul><p></p>'),
(3, 8, '<font face=\"Arial\">This is an info for Lost &amp; Found:</font><p></p><ul><li><font face=\"Arial\">You need to read the first item of the list.</font></li><li><font face=\"Arial\">You need to read the next item of the list.</font></li><li><font face=\"Arial\">You need to read the next item of the list.</font></li></ul><p></p>'),
(4, 6, 'To update your Safety FAQs follow these instructions<blockquote><p>1. Select the FAQ you want to EDIT from the drop down list&#160;</p><p>2. Both the Question and Answer will appear in the boxes below&#160;</p><p>3. Click on EDIT to make the changes&#160;</p><p>4. Type your amendments&#160;</p><p>5. To add a NEW FAQ use &#34;Create a NEW Question&#34;&#160;</p><p>6. Enter both the Question and the Answer into the respective box&#160;</p><p>7. Use the CLEAR button to delete anything you have written&#160;</p><p>8. When you are happy with what you have entered click ADD&#160;</p><p>9. Once you have reviewed all your changes click on SAVE&#160;</p><p>10. Finally check on the live page to make sure the changes have taken place Always delete your cache memory before reviewing any changes. </p></blockquote>'),
(5, 2, '<ul><li><b>MARKETING</b>: The Hotel Assistant provides you with several ways to &#34;get the word out!&#34; and to generate additional revenue streams. Click one of the three options/tabs below to learn more, and to SEND A GUEST NOTIFICATION.</li><li><b>PROMOTIONS</b>: Hotel promotions and upsells.&#160;</li><li><b>YOUR VACATION FLIP BOOK</b>:&#160;A guests own custom designed Vacation Photo Album, to be shared by your guests, on their own social media.</li></ul>'),
(6, 4, '<ul><li><span>MARKETING</span>: The Hotel Assistant provides you with several ways to &#34;get the word out!&#34; and to generate additional revenue streams. Click one of the three options/tabs below to learn more, and to SEND A GUEST NOTIFICATION.</li><li><span>PROMOTIONS</span>: Hotel promotions and upsells.&#160;</li><li><span>YOUR VACATION FLIP BOOK</span>:&#160;A guests own custom designed Vacation Photo Album, to be shared by your guests, on their own social media.</li></ul>'),
(7, 4, '<ul><li><span><b>MARKETING</b></span>: The Hotel Assistant provides you with several ways to &#34;get the word out!&#34; and to generate additional revenue streams. Click one of the three options/tabs below to learn more, and to SEND A GUEST NOTIFICATION.</li><li><span><b>PROMOTIONS</b></span>: Hotel promotions and upsells.&#160;</li><li><span><b>YOUR VACATION FLIP BOOK</b></span>:&#160;A guests own custom designed Vacation Photo Album, to be shared by your guests, on their own social media.</li></ul>'),
(8, 8, '<span>Hotel admin can post LOST or FOUND items from here.</span><br><span>Guests can post from the Directory if they have LOST or FOUND an item, and those items will automatically display on the Directory as a LOST or FOUND item.</span><br><span>On the Directory, guests are instructed to take any FOUND items to the nearest hotel staff or department.</span><br><span>Guests can CLAIM an item, by going to the&#160; department.</span><br><span>Once claimed, hotel staff can manually remove that item from the LOST list.</span><br><span>All posts expire after 7 days.</span><br><p></p>'),
(9, 9, '<span>From the Directory, hotel guests can click SUGGESTION BOX, and enter their suggestions anonymously, that will automatically fall into the hotel admins SUGGESTION BOX in their admin area.</span><br><span>Suggestions will remain indefinitely, unless removed manually by staff.</span>'),
(10, 3, '<b>TO THE HOTEL</b>: What is more fun than designing an electronic photo album, with the exciting images and videos taken on vacation, and sharing it with friends and family on social media? EVERY room will receive one FREE Vacation Flip Book, where the guest has the option to select their own COVER and COVER TITLE, two inside pages with EIGHT IMAGES or VIDEOS (with an option to add more pag- es/photos), and all with CAPTIONS! It is simple and quick to design, and can be downloaded in seconds to be shared on your guests social media platforms. The back cover is 100% dedicated TO YOU! Your hotel image with all of your contact information and links to your web site. So, when the guests share their photo album on their social media, they also promote you! NO BETTER MARKETING THAN AN ENDORESMENT WITH PHOTOS AND VIDEOS, FROM A HAPPY GUEST!'),
(11, 4, '<ul><li><span>TO THE HOTEL</span>: What is more fun than designing an electronic photo album, with the exciting images and videos taken on vacation, and sharing it with friends and family on social media? EVERY room will receive one FREE Vacation Flip Book, where the guest has the option to select their own COVER and COVER TITLE, two inside pages with EIGHT IMAGES or VIDEOS (with an option to add more pag- es/photos), and all with CAPTIONS! It is simple and quick to design, and can be downloaded in seconds to be shared on your guests social media platforms. The back cover is 100% dedicated TO YOU! Your hotel image with all of your contact information and links to your web site. So, when the guests share their photo album on their social media, they also promote you! NO BETTER MARKETING THAN AN ENDORESMENT WITH PHOTOS AND VIDEOS, FROM A HAPPY GUEST!<br></li></ul>'),
(12, 5, '<span><strong>Lorem Ipsum</strong><span>&#160;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></span>'),
(13, 10, '<span><font size=\"2\">When the hotel has APPROVED their RESTAURANTS &amp; MENUS / SERVICES &amp; LISTS set-up, the hotel is instructed to move on to the second set-up area, starting with <b>AVATAR</b>.</font></span><p><font color=\"#000000\" face=\"Verdana, sans-serif\" size=\"2\"><br></font></p><p><span><font size=\"2\">As you can see on the image, from the FIRST TAB (Personal Concierge Avatar) the hotel can select an <b>AVATAR IMAGE</b> from either our gallery, or they can upload their own image, and an <b>AVATAR NAME</b>.</font></span></p><p></p>'),
(14, 11, '<p></p><ul><li>To update your Personal Concierge Intro voice message for a venue follow these instructions.</li></ul><p></p><p></p><ol><li>Select your venue</li><li>Select your preferred language, voice actor, and speaking style, and then adjust speed and pitch levels</li><li>Write your new message and press PLAYsten to the result If acceptable click UPDATE or CLEAR to make any edits or try a different setting until you find the correct result</li><li>If you do NOT want to have the voice option shown on a venue landing page check &#34;Disable Voice and the Play and Pause buttons will be hidden and the READ button will be centered</li><li>To replace the existing READ message shown in the Existing Text box simply write the new message in the NEW faxt box and click UPDATE</li><li>When you are satisfied with your updates click SAVE A Finally, check the live version of the updated venue always making sure you refresh the page first</li></ol><p></p>'),
(15, 12, '<p>A navigation menu is a list of links pointing to important areas of a &#10;website. They are usually presented as a vertical bar of links at the left of every page.</p><p>Navigation menus give your site structure and help visitors find what they&#8217;re looking for.</p>'),
(16, 13, '<span class=\"\">Menu engineers make a point of studying which parts of &#10;the menu are &#8220;prime real estate&#8221;&#8212;where people look first in that short &#10;109 seconds, and (as a result) which menu items tend to be the most &#10;profitable.</span>'),
(17, 14, 'Creating menus, categories, tags, and locations make your website more &#10;accessible, intuitive, and user-friendly. Now, why do you need a menu? &#10;The answer is simple &#8211; To show the pages or posts to your visitors that &#10;you will be creating later on.'),
(18, 15, '<p>A navigation menu is a list of links pointing to important areas of a &#10;website. They are usually presented as a vertical bar of links at the left of every page.</p><p>Navigation menus give your site structure and help visitors find what they&#8217;re looking for.</p>'),
(19, 16, '<span class=\"\">Menu engineers make a point of studying which parts of &#10;the menu are &#8220;prime real estate&#8221;&#8212;where people look first in that short &#10;109 seconds, and (as a result) which menu items tend to be the most &#10;profitable.</span>'),
(20, 17, 'Creating menus, categories, tags, and locations make your website more &#10;accessible, intuitive, and user-friendly. Now, why do you need a menu? &#10;The answer is simple &#8211; To show the pages or posts to your visitors that &#10;you will be creating later on.'),
(21, 18, '<p><font face=\"Arial\"><u>Edit Button</u>:</font></p><p><font face=\"Arial\">For selecting text color for the header<br></font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\"><u>FlipBook</u>:<br></font></p><p><font face=\"Arial\">Upload images here</font></p><p><font face=\"Arial\"><br></font></p><p><font face=\"Arial\"><u>Arrow Right</u>:</font></p><p><font face=\"Arial\">Save full FlipBook Data<br></font></p><p><font face=\"Arial\"><br></font></p>'),
(22, 19, '<span class=\"ILfuVd\" lang=\"en\"><span class=\"hgKElc\">Preregistration is <b>the practice of registering the hypotheses, methods, and/or analyses of a scientific study before it is conducted</b>.</span></span>'),
(23, 6, 'To update your Safety FAQs follow these instructions<blockquote><p>1. Select the FAQ you want to EDIT from the drop down list&#160;</p><p>2. Both the Question and Answer will appear in the boxes below&#160;</p><p>3. Click on EDIT to make the changes&#160;</p><p>4. Type your amendments&#160;</p><p>5. To add a NEW FAQ use &#34;Create a NEW Question&#34;&#160;</p><p>6. Enter both the Question and the Answer into the respective box&#160;</p><p>7. Use the CLEAR button to delete anything you have written&#160;</p><p>8. When you are happy with what you have entered click ADD&#160;</p><p>9. Once you have reviewed all your changes click on SAVE&#160;</p><p>10. Finally check on the live page to make sure the changes have taken place Always delete your cache memory before reviewing any changes. </p><p><font face=\"Arial\">11. rtyukllkjj</font></p></blockquote>');

-- --------------------------------------------------------

--
-- Table structure for table `md_menu_section`
--

CREATE TABLE `md_menu_section` (
  `id` int(11) NOT NULL,
  `route` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `flag` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_menu_section`
--

INSERT INTO `md_menu_section` (`id`, `route`, `name`, `flag`) VALUES
(1, 'home', 'Hotel Information', NULL),
(2, 'hotel_promo', 'Promotions', NULL),
(3, 'hotel_promo_dash', 'Promotions Dashboard', NULL),
(4, 'hotel_photo', 'Photo OPS', NULL),
(5, 'hotel_flip', 'Flip Book', NULL),
(6, 'platform_faq', 'FAQ', 'F'),
(7, 'platform_faq', 'FAQ Tips', 'T'),
(8, 'lost_found', 'Lost & Found', NULL),
(9, 'suggestion', 'Suggestion Box', NULL),
(10, 'add-pca', 'Avatar', NULL),
(11, 'hotel_create_voice', 'Create Voice', NULL),
(12, 'fundirectory', 'Fun Directory / Add Menu', 'M'),
(13, 'fundirectory', 'Fun Directory / Configure Menu', 'C'),
(14, 'fundirectory', 'Fun Directory / Page Details', 'P'),
(15, 'fundirectory', 'Fun Directory / Add Section Details', 'S'),
(16, 'fundirectory', 'Fun Directory / Section Details', 'D'),
(17, 'fundirectory', 'Fun Directory / Entertainment', 'E'),
(18, 'flipcreate', 'FlipBook', NULL),
(19, 'pre_reg_url', 'Pre-Registration', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_package_custom`
--

CREATE TABLE `md_package_custom` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `pakage_name` varchar(50) NOT NULL,
  `no_of_menu` int(11) NOT NULL DEFAULT 0,
  `special_menu` enum('Y','N') NOT NULL DEFAULT 'Y',
  `setup_fee` float(10,2) NOT NULL DEFAULT 0.00,
  `monthly_fee` float(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_package_custom`
--

INSERT INTO `md_package_custom` (`id`, `restaurant_id`, `pakage_name`, `no_of_menu`, `special_menu`, `setup_fee`, `monthly_fee`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Custom', 3, 'Y', 15.00, 20.00, 'admin@gmail.com', '2021-12-24 12:02:22', 'admin@gmail.com', '2021-12-24 12:12:34'),
(2, 2, 'Custom', 3, 'Y', 200.00, 25.00, 'admin@gmail.com', '2021-12-24 12:02:22', 'admin@gmail.com', '2021-12-24 12:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `md_parm_value`
--

CREATE TABLE `md_parm_value` (
  `id` int(11) NOT NULL,
  `param_desc` varchar(100) NOT NULL,
  `param_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_parm_value`
--

INSERT INTO `md_parm_value` (`id`, `param_desc`, `param_value`) VALUES
(1, 'Project Name', 'Shop Local Laguna'),
(2, 'Email Name', 'Cindy Ferguson');

-- --------------------------------------------------------

--
-- Table structure for table `md_promotion_admin_custom`
--

CREATE TABLE `md_promotion_admin_custom` (
  `id` bigint(22) NOT NULL,
  `intro` text DEFAULT NULL,
  `confirm_email` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pop_up_offer_title` varchar(100) DEFAULT NULL,
  `pop_up_offer_body` text DEFAULT NULL,
  `questions1` text DEFAULT NULL,
  `questions2` text DEFAULT NULL,
  `questions3` text DEFAULT NULL,
  `mailing_email_subject` varchar(100) DEFAULT NULL,
  `mailing_email_body` text DEFAULT NULL,
  `privacy` text DEFAULT NULL,
  `authorization` text DEFAULT NULL,
  `back_color` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_promotion_admin_custom`
--

INSERT INTO `md_promotion_admin_custom` (`id`, `intro`, `confirm_email`, `image`, `pop_up_offer_title`, `pop_up_offer_body`, `questions1`, `questions2`, `questions3`, `mailing_email_subject`, `mailing_email_body`, `privacy`, `authorization`, `back_color`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'We would love to make your next Birthday/Anniversary extra special.', 'We would like to thank you for registering on our Birthday/Anniversary Offer program and will contact you again a couple of weeks before the date/s you have provided. Please show this email to our staff who will make sure you receive your FREE Beverage. Many thanks and enjoy your meal.', 'birthday.jpg', 'Free Drinks', 'Register now and get a free drinks with your meal. Show the code you receive by text to our waiter', 'What hobbies/interests do you have? ', 'What is your favorit sport?', 'Where is your favorit vacation destination?', 'A [Happy Birthday] PRESENT from [The Cliff Restaur', 'Hello [name from promotion registration]!\n			\nWe are SO HAPPY to hear, it is almost your [Birthday]!\n\nWe would like to invite you to JOIN US on your [Birthday], and receive a SPECIAL SURPRISE!\n\nSimply make a reservation, then show the waiter/waitress this email when you are first seated.\n\nSee you soon!\n[Restaurant\'s Contact Name]\n\n[Name of Restaurant]\n[Address]\n[Phone]\n[Email]\n[URL to MENU LANDING PAGE] (ie. https://www.shoplocallaguna.com/restaurants/the-cliff/LandingPage.php)\n			\nSAVE THIS INF', '    This Privacy Policy describes how Wiley collects and uses the personal information you provide to Wiley. It also describes the choices available to you regarding our use of your personal information ', '    Personal information will not be kept longer than is necessary for the purpose.', '#e68484', 'admin@gmail.com', '2021-10-27 06:37:26', 'admin@gmail.com', '2021-11-29 11:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `md_promotion_restaurant_custom`
--

CREATE TABLE `md_promotion_restaurant_custom` (
  `id` bigint(22) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `intro` text DEFAULT NULL,
  `confirm_email` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pop_up_offer_title` varchar(100) DEFAULT NULL,
  `pop_up_offer_body` text DEFAULT NULL,
  `questions1` text DEFAULT NULL,
  `questions2` text DEFAULT NULL,
  `questions3` text DEFAULT NULL,
  `mailing_email_subject` varchar(100) DEFAULT NULL,
  `mailing_email_body` text DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `month_day` int(11) DEFAULT NULL,
  `status_id` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0: enable; 1: disable',
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_promotion_restaurant_custom`
--

INSERT INTO `md_promotion_restaurant_custom` (`id`, `restaurant_id`, `venue_id`, `intro`, `confirm_email`, `image`, `pop_up_offer_title`, `pop_up_offer_body`, `questions1`, `questions2`, `questions3`, `mailing_email_subject`, `mailing_email_body`, `menu_id`, `month_day`, `status_id`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 9, 'We would love to make your next Birthday/Anniversary extra special.', 'We would like to thank you for registering on our Birthday/Anniversary Offer program and will contact you again a couple of weeks before the date/s you have provided. Please show this email to our staff who will make sure you receive your FREE Beverage. Many thanks and enjoy your meal.', 'birthday.jpg', 'Free Drinks', 'Register now and get a free drinks with your meal. Show the code you receive by text to our waiter', 'What hobbies/interests do you have? ', 'What is your favorit sport?', 'Where is your favorit vacation destination?', 'A [Happy Birthday] PRESENT from [The Cliff Restaur', 'Hello [name from promotion registration]!\n			\nWe are SO HAPPY to hear, it is almost your [Birthday]!\n\nWe would like to invite you to JOIN US on your [Birthday], and receive a SPECIAL SURPRISE!\n\nSimply make a reservation, then show the waiter/waitress this email when you are first seated.\n\nSee you soon!\n[Restaurant\'s Contact Name]\n\n[Name of Restaurant]\n[Address]\n[Phone]\n[Email]\n[URL to MENU LANDING PAGE] (ie. https://www.shoplocallaguna.com/restaurants/the-cliff/LandingPage.php)\n			\nSAVE THIS INF', 0, 1, '0', '4', '2022-02-04 11:45:30', '4', '2022-02-04 14:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `md_promo_calander`
--

CREATE TABLE `md_promo_calander` (
  `id` int(11) NOT NULL,
  `free_flag` enum('Y','N') NOT NULL,
  `price` float(10,2) NOT NULL DEFAULT 0.00,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_promo_calander`
--

INSERT INTO `md_promo_calander` (`id`, `free_flag`, `price`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(4, 'Y', 0.00, 'admin@gmail.com', '2021-09-28 06:07:17', 'admin@gmail.com', '2021-12-24 12:38:53'),
(5, 'Y', 0.00, 'admin@gmail.com', '2021-09-28 06:07:18', 'admin@gmail.com', '2021-10-13 05:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `md_reserv_category`
--

CREATE TABLE `md_reserv_category` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') DEFAULT NULL COMMENT ' 	S :Service R :Restaurant ',
  `srv_res_id` int(11) DEFAULT NULL COMMENT ' 	Service (S):td_quest_service Restaurant (R) :td_quest_res_bars ',
  `catg_name` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_reserv_category`
--

INSERT INTO `md_reserv_category` (`id`, `hotel_id`, `srv_res_flag`, `srv_res_id`, `catg_name`, `capacity`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'R', 1, 'Indoor', 40, 'admin@gmail.com', '2023-05-22 16:37:53', NULL, NULL),
(2, 1, 'R', 1, 'Outdoor', 60, 'admin@gmail.com', '2023-05-22 16:37:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_restaurant_items`
--

CREATE TABLE `md_restaurant_items` (
  `item_id` int(11) NOT NULL,
  `restaurant_id` int(10) NOT NULL,
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast L:Lunch D:Dinner R:Brunch S:Special A:Bar V:Menu Service',
  `section_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_restaurant_item_description`
--

CREATE TABLE `md_restaurant_item_description` (
  `item_id` int(11) NOT NULL,
  `item_price` float(10,2) NOT NULL DEFAULT 0.00,
  `item_desc` text NOT NULL,
  `item_note` text NOT NULL,
  `note_color` varchar(50) DEFAULT NULL,
  `note_back_color` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_restaurant_item_description`
--

INSERT INTO `md_restaurant_item_description` (`item_id`, `item_price`, `item_desc`, `item_note`, `note_color`, `note_back_color`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 34.00, 'Jumbo Pizza is available at the very best.', 'IN STOCK', '#04ff00', '#ffffff', '4', '2022-01-24 11:10:53', NULL, NULL),
(2, 99.00, 'Breakfast buritos now available at cheaper rates', 'OUT OF STOCK', '#ff0000', '#ffffff', '4', '2022-01-24 11:11:32', NULL, NULL),
(3, 77.00, 'Afghani Burger at its best', '', '#ff0000', '#ffffff', '4', '2022-01-24 11:11:58', NULL, NULL),
(4, 67.00, 'Lasagna at its very best', '', '#ff0000', '#ffffff', '4', '2022-01-24 11:12:48', NULL, NULL),
(5, 102.00, 'Turkey from Turkey', 'OUT OF STOCK', '#ff0019', '#ffffff', '4', '2022-01-24 11:14:22', NULL, NULL),
(36, 3.50, '(vegan)', '', NULL, NULL, '34', '2021-11-01 13:16:00', NULL, NULL),
(37, 8.00, 'with Korean BBQ Ketchup, sesame, scallions', '', NULL, NULL, '34', '2021-11-01 13:14:08', NULL, NULL),
(38, 6.00, 'with Korean BBQ Ketchup, sesame, scallions (vegan)', '', NULL, NULL, '34', '2021-11-01 13:15:20', NULL, NULL),
(39, 8.00, 'Mr Wolf ’s spiced bean salad, radicchio', '', NULL, NULL, '34', '2021-11-01 13:16:47', NULL, NULL),
(40, 8.00, 'crispy oyster mushroom, vegan sheeze, hot sauce, pumpkin seeds (vegan)', '', NULL, NULL, '34', '2021-11-01 13:18:40', NULL, NULL),
(41, 6.00, 'croutes, crusty bread (vegetarian)', '', NULL, NULL, '34', '2021-11-01 13:21:53', NULL, NULL),
(42, 7.00, 'Heathers Harvest carrot chutney, artisan toast', '', NULL, NULL, '34', '2021-11-01 13:22:15', NULL, NULL),
(43, 9.00, 'smoked salmon, crayfish & crab, lemon & lobster mayo, gem hearts, caviar, buttered granary bread', '', NULL, NULL, '34', '2021-11-01 13:23:09', NULL, NULL),
(44, 6.50, 'sage aioli, lemon', '', NULL, NULL, '34', '2021-11-01 13:23:41', NULL, NULL),
(45, 6.50, 'dukkah hummus, ful medames, olives, pomegranate molasses, warm pitta', '', NULL, NULL, '34', '2021-11-01 13:24:11', NULL, NULL),
(46, 19.00, ' dukkah hummus, ful madames, crispy halloumi, marinated olives, crispy falafels, \nwarm pittas  (vegetarian) (can be made vegan)', '', NULL, NULL, '34', '2021-11-01 13:25:03', NULL, NULL),
(47, 24.00, 'half crispy duckling with hoisin, scallions, cucumber & pancakes, chicken satay skewers with bang bang sauce, firecracker noodle salad, prawn cracker', '', NULL, NULL, '34', '2021-11-01 13:25:39', NULL, NULL),
(48, 22.00, 'Moydens cheeses, pork pie, cured meats, terrine of the day, pickles, olives, breads', '', NULL, NULL, '34', '2021-11-01 13:26:14', NULL, NULL),
(49, 14.00, 'minted mushy peas, tartare sauce', '', NULL, NULL, '34', '2021-11-01 13:26:47', NULL, NULL),
(50, 14.00, 'Hollowdene hens eggs, chips', '', NULL, NULL, '34', '2021-11-01 13:27:26', NULL, NULL),
(51, 14.50, 'acorn buttered vegetables, chips', '', NULL, NULL, '34', '2021-11-01 13:28:01', NULL, NULL),
(52, 14.50, 'Moydens Wrekin blue, tomato, pickle, Korean ketchup, toasted brioche, chips ', '', NULL, NULL, '34', '2021-11-01 13:28:41', NULL, NULL),
(53, 9.00, 'summer greens, pumpkin seeds  (vegan)', '', NULL, NULL, '34', '2021-11-01 13:29:28', '34', '2021-11-01 13:35:13'),
(54, 9.00, 'succulent chicken, smoked bacon, Caesar mayo, gem, beef tomato, toasted artisan \nbread, Kuhn pickle', '', NULL, NULL, '34', '2021-11-01 13:36:01', NULL, NULL),
(55, 6.50, 'Delicious', '', NULL, NULL, '34', '2021-11-01 13:36:52', NULL, NULL),
(56, 8.50, 'tartare, gem, beef tomato', '', NULL, NULL, '34', '2021-11-01 13:37:22', NULL, NULL),
(57, 8.00, 'crisp apple, grapes, celery & toasted walnut, garden herb vegan mayo (vegan)', '', NULL, NULL, '34', '2021-11-01 13:38:11', NULL, NULL),
(58, 10.00, 'Moydens Wrekin white, gem, beef tomato, horseradish mayo, red onions', '', NULL, NULL, '34', '2021-11-01 13:40:36', NULL, NULL),
(59, 15.50, 'firecracker rice noodles, cucumber, scallions, miso roasted cashews ', '', NULL, NULL, '34', '2021-11-01 13:41:17', NULL, NULL),
(60, 13.50, 'chicken & smoked bacon, gem leaves, croutons, caesar dressing, anchovies, parmesan', '', NULL, NULL, '34', '2021-11-01 13:44:46', NULL, NULL),
(61, 12.50, 'sun-dried tomatoes, cucumber, red onion, marinated olives, barrel aged feta, gem, oregano & marjoram dressing', '', NULL, NULL, '34', '2021-11-01 13:45:23', NULL, NULL),
(62, 11.50, 'tempura avocado, hot firecracker rice noodles with beansprouts, carrot pickle, nam \nprik dressing, cucumber & scallions Bao bun, hot sauce', '', NULL, NULL, '34', '2021-11-01 13:46:05', NULL, NULL),
(63, 22.75, 'delicious', '', NULL, NULL, '34', '2021-11-01 13:47:23', NULL, NULL),
(64, 22.75, 'Delicious', '', NULL, NULL, '34', '2021-11-01 13:47:51', NULL, NULL),
(65, 7.00, 'biscoff, popping candy ', '', NULL, NULL, '34', '2021-11-01 14:18:09', NULL, NULL),
(66, 6.00, 'crumble crumbs, baby apples', '', NULL, NULL, '34', '2021-11-01 14:18:42', NULL, NULL),
(67, 6.00, 'butterscotch sauce, pouring cream or Madagascan vanilla bean ice cream ', '', NULL, NULL, '34', '2021-11-01 14:19:24', NULL, NULL),
(68, 8.00, 'please ask your server for details', '', NULL, NULL, '34', '2021-11-01 14:19:56', NULL, NULL),
(69, 7.00, 'meringue, chantilly, berries, cherry syrup', '', NULL, NULL, '34', '2021-11-01 14:20:25', NULL, NULL),
(70, 7.00, 'please ask your server for details', '', NULL, NULL, '34', '2021-11-01 14:21:05', NULL, NULL),
(71, 5.00, 'please ask your server for details (vegan)', '', NULL, NULL, '34', '2021-11-01 14:22:12', NULL, NULL),
(72, 9.00, 'please ask your server for details selection of crackers, celery, grapes, Heathers Harvest carrot chutney', '', NULL, NULL, '34', '2021-11-01 14:22:32', NULL, NULL),
(73, 14.00, 'summer greens, pumpkin seeds (vegan)', '', NULL, NULL, '34', '2021-11-01 13:34:56', NULL, NULL),
(102, 3.50, 'Our own delicious recipe (vegan)', '', '#ffffff', '#000000', '34', '2022-01-16 23:11:07', '34', '2022-01-19 15:40:31'),
(103, 8.00, 'with Korean BBQ sauce, sesame, scallions ', '', '#ffffff', '#000000', '34', '2022-01-16 23:11:49', NULL, NULL),
(104, 6.00, 'with crispy garlic & chilli sauce, sesame, scallions', '', '#ffffff', '#000000', '34', '2022-01-16 23:12:30', NULL, NULL),
(105, 15.00, 'Crispy duck, oyster sauce, Chinatown noodles, greens, crispy chilli, kochajang, sesame', '', '#ffffff', '#000000', '34', '2022-01-16 23:13:08', NULL, NULL),
(106, 11.50, 'Tempura avocado, hot firecracker rice noodles with beansprouts, carrot pickle, nam\nprik dressing, cucumber & scallions Bao bun, hot sauce', '', '#ffffff', '#000000', '34', '2022-01-16 23:13:51', NULL, NULL),
(107, 14.00, 'Corbett\'s roast beef, pork & lamb, stuffing, gravy pot & roasties', '', '#ffffff', '#000000', '34', '2022-01-16 23:14:24', NULL, NULL),
(108, 7.50, 'From local producers', 'Served with French Fries *', '#ffffff', '#000000', '34', '2022-01-16 23:15:32', NULL, NULL),
(109, 10.00, 'Lobster mayo, cucumber, lemon', '', '#ffffff', '#000000', '34', '2022-01-16 23:16:07', NULL, NULL),
(110, 10.00, 'Chicken, harissa, halloumi, tomato, nuts & seeds', '', '#ffffff', '#000000', '34', '2022-01-16 23:16:41', NULL, NULL),
(111, 9.00, 'Summer greens, pumpkin seeds', 'Large 12.00\nVegan', '#ffffff', '#000000', '34', '2022-01-16 23:17:55', NULL, NULL),
(112, 14.00, 'Shropshire chicken, bacon, anchovies, croutons, gem, Caesar dressing, parmesan', '', '#ffffff', '#000000', '34', '2022-01-16 23:18:28', NULL, NULL),
(113, 15.50, 'Firecracker rice noodles, cucumber, scallions, miso roasted cashews ', '', '#ffffff', '#000000', '34', '2022-01-16 23:19:03', NULL, NULL),
(114, 14.00, 'Hollowdene hens eggs, chips', '', '#ffffff', '#000000', '34', '2022-01-16 23:19:56', NULL, NULL),
(115, 13.00, 'Stuffing, rich pan jus', '', '#ffffff', '#000000', '34', '2022-01-16 23:20:43', NULL, NULL),
(116, 14.50, 'Stuffing, cracklings, rich pan jus ', '', '#ffffff', '#000000', '34', '2022-01-16 23:21:21', NULL, NULL),
(117, 15.00, 'Yorkshire pudding, rich pan jus', '', '#ffffff', '#000000', '34', '2022-01-16 23:21:51', NULL, NULL),
(118, 15.00, 'Rich pan jus', 'THIS ITEM IS SOLD OUT', '#ffffff', '#e70808', '34', '2022-01-16 23:22:25', '34', '2022-01-19 14:37:49'),
(119, 19.00, 'Corbett\'s beef, pork & lamb, Yorkshire pudding, stuffing, pigs in blankets, rich pan jus ', '', '#ffffff', '#000000', '34', '2022-01-16 23:22:58', NULL, NULL),
(120, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:08:56', '34', '2022-01-19 14:23:44'),
(121, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:09:31', '34', '2022-01-19 14:24:03'),
(122, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:10:26', '34', '2022-01-19 14:24:23'),
(123, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:11:12', '34', '2022-01-19 14:24:59'),
(124, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:11:34', '34', '2022-01-19 14:25:24'),
(125, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:11:52', '34', '2022-01-19 14:26:09'),
(126, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:12:11', '34', '2022-01-19 14:26:34'),
(127, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:12:41', '34', '2022-01-19 14:27:13'),
(128, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:13:00', '34', '2022-01-19 14:29:42'),
(129, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:13:17', '34', '2022-01-19 14:27:30'),
(130, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:13:36', '34', '2022-01-19 14:29:23'),
(131, 3.50, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:13:55', '34', '2022-01-19 14:28:57'),
(132, 7.00, 'profiteroles, chocolate, butterscotch, berries, cocoa nibs, popping candy', '', '#ffffff', '#000000', '34', '2022-01-19 14:14:59', NULL, NULL),
(133, 6.00, 'butterscotch sauce, pouring cream or Madagascan vanilla bean ice cream', '', '#ffffff', '#000000', '34', '2022-01-19 14:15:34', NULL, NULL),
(134, 8.00, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:16:22', NULL, NULL),
(135, 7.00, 'custard cream crumbs, summer berries', '', '#ffffff', '#000000', '34', '2022-01-19 14:16:58', NULL, NULL),
(136, 7.00, 'Shropshire meringue, chantilly, berries, cherry syrup, raspberry crumb', '', '#ffffff', '#000000', '34', '2022-01-19 14:17:30', NULL, NULL),
(137, 5.00, 'please ask your server for details', '', '#ffffff', '#000000', '34', '2022-01-19 14:18:22', '34', '2022-01-19 14:32:00'),
(138, 9.00, 'selection of crackers, celery, grapes, Heather Harvest carrot pickle\n(please ask your server for details)', '', '#ffffff', '#000000', '34', '2022-01-19 14:19:53', NULL, NULL),
(140, 12.00, 'pita bread & fresh vegetables', '', '#ffffff', '#000000', '5', '2023-01-09 06:43:02', '5', '2023-01-09 07:06:21'),
(141, 21.50, 'lobster or crab, egg, tomatoes, marinated vegetables, olives, avocado, romaine & thousand island', '', '#ffffff', '#000000', '5', '2023-01-09 06:46:09', NULL, NULL),
(142, 17.00, 'diced ahi tuna, soy, jalapeno, onion, sesame, wonton bowl & taro chips', '', '#ffffff', '#000000', '5', '2023-01-09 06:43:31', NULL, NULL),
(143, 16.00, 'coconut breaded shrimp, mango & papaya dipping sauce', '', '#ffffff', '#000000', '5', '2023-01-09 06:45:14', NULL, NULL),
(144, 18.50, 'romaine, parmesan, creamy caesar dressing, croutons', '', '#ffffff', '#000000', '5', '2023-01-09 06:46:38', NULL, NULL),
(145, 22.50, 'baby spinach, feta, candied pecans, strawberries, raspberry vinaigrette', '', '#ffffff', '#000000', '5', '2023-01-09 06:47:03', NULL, NULL),
(146, 25.00, 'fettuccini, garlic, capers and butter sauce', '', '#ffffff', '#000000', '5', '2023-01-09 06:47:37', NULL, NULL),
(147, 8.00, 'grilled shrimp, salmon or ahi', '', '#ffffff', '#000000', '5', '2023-01-09 06:48:13', NULL, NULL),
(148, 19.00, 'penne pasta, sun dried tomatoes, creamy tomato sauce', '', '#ffffff', '#000000', '5', '2023-01-09 06:48:42', NULL, NULL),
(149, 20.00, 'anaheim pepper [hand stuffed] with jack, cheddar and parmesan, sour cream & tomatillo salsa, spanish rice & refried beans', '', '#ffffff', '#000000', '5', '2023-01-09 06:49:17', NULL, NULL),
(150, 22.00, 'corn tortillas with marinated chicken & cheddar cheese, topped with guacamole, sour cream, enchilada sauce, spanish rice and refried beans', '', '#ffffff', '#000000', '5', '2023-01-09 06:49:45', NULL, NULL),
(151, 21.00, 'grilled mahi, shredded cabbage, cilantro, red onion, roasted salsa, corn or flour t orllas,  spanish rice & mixed greens', '', '#ffffff', '#000000', '5', '2023-01-09 06:50:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_sales_agent`
--

CREATE TABLE `md_sales_agent` (
  `id` int(11) NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `territory` varchar(50) NOT NULL,
  `frst_comm` float(10,2) NOT NULL DEFAULT 0.00,
  `snd_comm` float(10,2) NOT NULL DEFAULT 0.00,
  `comments` text DEFAULT NULL,
  `email_title` varchar(100) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `email_send_dt` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_sales_agent`
--

INSERT INTO `md_sales_agent` (`id`, `agent_name`, `address`, `phone_no`, `whatsapp_no`, `email`, `start_date`, `territory`, `frst_comm`, `snd_comm`, `comments`, `email_title`, `email_body`, `email_send_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'Steve Rogers', 'Dallas, Texas', '9836751294', '5748484567', 'somnath.thakur16@gmail.com', '2023-04-06', '1', 50.00, 50.00, 'Sample comments', 'Welcome Steve Rogers', 'Hello Steve Rogers,\n\n    Please log in to your account with the following credentials to add and manage hotels.\n\n    Login Link: http://localhost:4200/#//main/sales/saleslogin\n    UserID: 9836751294\n    Password: Fe3WI\n    \n    Thank You,\n    Cindy Ferguson', '2023-04-06', 'admin@gmail.com', '2023-04-06 06:34:28', NULL, NULL),
(3, 'Tanmoy Mondal', '82 L N Road\nPo.Rabindra Nagar\nKolkata - 700065', '9831887194', '9831887194', 'mondal.tanmoy@synergicsoftek.com', '2023-04-06', '1', 20.00, 80.00, 'New Sales Agent', 'Welcome Tanmoy Mondal', 'Hello Tanmoy Mondal,\n\n    Please log in to your account with the following credentials to add and manage hotels.\n\n    Login Link: https://custom.shoplocal-lagunabeach.com/#//main/sales/saleslogin\n    UserID: 9831887194\n    Password: jPGWY\n    \n    Thank You,\n    Cindy Ferguson', '2023-04-06', 'admin@gmail.com', '2023-04-06 08:57:11', NULL, NULL),
(4, 'Amit Mondal', 'Katwa-kalna', '7890833920', '7890833920', 'amit@synergisoftek.in', '2023-05-11', '1', 25.00, 75.00, 'Parina', 'Welcome Amit Mondal', 'Hello Amit Mondal,\nPlease log in to your account with the following credentials to add and manage hotels.\n\nLogin Link: http://localhost:4200/#//main/sales/saleslogin\nUserID: 7890833920\nPassword: NWh66\n    \nThank You,\nCindy Ferguson', '2023-05-11', 'admin@gmail.com', '2023-05-11 06:35:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_section`
--

CREATE TABLE `md_section` (
  `section_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `restaurant_id` int(10) NOT NULL COMMENT 'td_quest_res_bars',
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast L:Lunch D:Dinner R:Brunch S:Special A:Bar V:Menu Service',
  `section_name` varchar(100) NOT NULL,
  `section_img` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_section`
--

INSERT INTO `md_section` (`section_id`, `hotel_id`, `restaurant_id`, `menu_id`, `section_name`, `section_img`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 1, 'B', 'House Specialities', '1_1_B_sectionHouse_Specialities_breakfast_2.jpg', '1', '2023-03-21 15:40:48', NULL, NULL),
(2, 1, 1, 'B', 'AÇAÍ', '1_1_B_sectionAÇAÍ_433148495.jpg', '1', '2023-03-21 15:44:22', 'undefined', '2023-03-21 16:28:03'),
(3, 1, 1, 'B', 'SIDES', '1_1_B_sectionSIDES_261543445.jpg', '1', '2023-03-21 15:46:32', NULL, NULL),
(4, 1, 1, 'B', 'TRADITIONAL BREAKFAST', '1_1_B_sectionTRADITIONAL_BREAKFAST_5199750.jpg', '1', '2023-03-21 15:58:05', NULL, NULL),
(5, 1, 1, 'B', 'OMELETS', '1_1_B_sectionOMELETS_368135470.jpg', '1', '2023-03-21 16:05:40', NULL, NULL),
(6, 1, 1, 'L', 'STARTERS', '1_1_L_sectionSTARTERS_341244391.jpg', '1', '2023-03-21 18:09:38', NULL, NULL),
(7, 1, 1, 'L', 'STARTERS TO SHARE', '1_1_L_sectionSTARTERS_TO SHARE_425445692.jpg', '1', '2023-03-21 18:10:31', NULL, NULL),
(8, 1, 1, 'L', 'SALADS', '1_1_L_sectionSALADS_432764816.jpg', '1', '2023-03-21 18:10:53', NULL, NULL),
(9, 1, 1, 'A', 'STARTERS', '1_1_A_sectionSTARTERS_726057.jpg', '1', '2023-03-21 18:46:16', NULL, NULL),
(10, 1, 1, 'A', 'STARTERS TO SHARE', '1_1_A_sectionSTARTERS_TO SHARE_284277343.jpg', '1', '2023-03-21 18:46:43', NULL, NULL),
(11, 1, 1, 'A', 'SALADS', '1_1_A_sectionSALADS_437169707.jpg', '1', '2023-03-21 18:47:00', NULL, NULL),
(12, 1, 1, 'B', 'Burger', '', '1', '2023-06-30 12:14:54', NULL, NULL),
(13, 25, 39, 'B', 'salad', '25_39_B_sectionsalad_chopped-power-salad-with-chicken-0ad93f1931524a679c0f8854d74e6e57.jpg', '25', '2023-07-03 06:52:31', NULL, NULL),
(14, 25, 39, 'B', 'Pancakes', '25_39_B_sectionPancakes_wholesomeyum-Low-Carb-Keto-Pancakes-Recipe-21.jpg', '25', '2023-07-03 06:59:20', NULL, NULL),
(15, 25, 39, 'B', 'omelette', '25_39_B_sectionomelette_Ham-and-cheese-omelette_1.jpg', '25', '2023-07-03 07:01:14', NULL, NULL),
(16, 25, 39, 'B', 'Smoothie', '', '25', '2023-07-03 07:11:18', 'undefined', '2023-07-03 07:11:31'),
(17, 25, 39, 'B', 'French Toast ', '', '25', '2023-07-03 07:26:34', NULL, NULL),
(18, 26, 62, 'A', 'Mojito', '', '26', '2023-07-04 06:04:38', '26', '2023-07-04 07:36:40'),
(19, 26, 62, 'A', 'Mojito', '', '26', '2023-07-04 07:10:01', NULL, NULL),
(20, 26, 62, 'A', 'Stater', '', '26', '2023-07-04 07:49:11', NULL, NULL),
(21, 26, 62, 'A', 'Mimosa', '', '26', '2023-07-04 08:01:37', NULL, NULL),
(22, 26, 63, 'A', 'Mimosa', '26_63_A_sectionMimosa_download (1).jpg', '26', '2023-07-04 08:24:15', NULL, NULL),
(23, 26, 63, 'A', 'Mimosa', '26_63_A_sectionMimosa_download (1).jpg', '26', '2023-07-04 09:28:26', NULL, NULL),
(24, 26, 64, 'A', 'Mimosa', '26_64_A_sectionMimosa_download (1).jpg', '26', '2023-07-04 09:33:05', NULL, NULL),
(25, 26, 62, 'A', 'Mimosa', '26_62_A_sectionMimosa_download (1).jpg', '26', '2023-07-04 09:44:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_service_items`
--

CREATE TABLE `md_service_items` (
  `service_item_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL COMMENT 'md_section',
  `item_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_service_items`
--

INSERT INTO `md_service_items` (`service_item_id`, `hotel_id`, `section_id`, `item_name`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 1, 'BREAKFAST BURRITO', '1', '2023-03-21 17:34:13', NULL, NULL),
(2, 1, 1, 'LOX BAGEL', '1', '2023-03-21 17:34:30', NULL, NULL),
(3, 1, 1, 'STEEL CUT OATS BREAKFAST', '1', '2023-03-21 17:34:45', NULL, NULL),
(4, 1, 1, 'CHICKEN & WAFFLES', '1', '2023-03-21 17:34:56', NULL, NULL),
(5, 1, 2, 'AÇAÍ BOWL', '1', '2023-03-21 17:52:03', NULL, NULL),
(6, 1, 3, 'Bagel & Cream Cheese', '1', '2023-03-21 17:52:24', NULL, NULL),
(7, 1, 3, 'Breakfast Potatoes', '1', '2023-03-21 17:52:37', NULL, NULL),
(8, 1, 3, 'Toast or English Muffin', '1', '2023-03-21 17:52:51', NULL, NULL),
(9, 1, 3, 'Sausage, Ham or Bacon', '1', '2023-03-21 17:53:05', NULL, NULL),
(10, 1, 4, 'TWO EGGS ANY STYLE', '1', '2023-03-21 17:54:52', NULL, NULL),
(11, 1, 4, 'STEAK & EGGS', '1', '2023-03-21 17:55:21', NULL, NULL),
(12, 1, 5, 'CLIFF', '1', '2023-03-21 17:55:49', NULL, NULL),
(13, 1, 5, 'CALIFORNIA', '1', '2023-03-21 17:55:59', NULL, NULL),
(14, 1, 5, 'SPANISH', '1', '2023-03-21 17:56:09', NULL, NULL),
(15, 1, 5, 'EGG WHITE OMELET', '1', '2023-03-21 17:56:23', NULL, NULL),
(16, 1, 6, 'CALAMARI STEAK', '1', '2023-03-21 18:19:32', NULL, NULL),
(17, 1, 6, 'AHI POKE', '1', '2023-03-21 18:19:48', NULL, NULL),
(18, 1, 6, 'SHRIMP CEVICHE', '1', '2023-03-21 18:20:02', NULL, NULL),
(19, 1, 6, '**SCALLOPS WASABI**', '1', '2023-03-21 18:20:26', NULL, NULL),
(20, 1, 7, 'CHICKEN NACHOS', '1', '2023-03-21 18:20:43', NULL, NULL),
(21, 1, 7, 'CHEESE & FRUIT PLATE', '1', '2023-03-21 18:20:54', NULL, NULL),
(22, 1, 7, 'SEAFOOD TOWER', '1', '2023-03-21 18:21:07', NULL, NULL),
(23, 1, 8, 'SEAFOOD TOWER', '1', '2023-03-21 18:21:19', NULL, NULL),
(24, 1, 8, 'PEAR GORGONZOLA', '1', '2023-03-21 18:21:28', NULL, NULL),
(25, 1, 9, 'CALAMARI STEAK', '1', '2023-03-21 18:47:47', NULL, NULL),
(26, 1, 9, 'AHI POKE', '1', '2023-03-21 18:48:08', NULL, NULL),
(27, 1, 9, 'SHRIMP CEVICHE', '1', '2023-03-21 18:48:19', NULL, NULL),
(28, 1, 9, '**SCALLOPS WASABI**', '1', '2023-03-21 18:48:32', NULL, NULL),
(29, 1, 10, 'CHICKEN NACHOS', '1', '2023-03-21 18:48:51', NULL, NULL),
(30, 1, 10, 'CHEESE & FRUIT PLATE', '1', '2023-03-21 18:49:02', NULL, NULL),
(31, 1, 10, 'SEAFOOD TOWER', '1', '2023-03-21 18:49:17', NULL, NULL),
(32, 1, 11, 'PEAR GORGONZOLA', '1', '2023-03-21 18:49:28', NULL, NULL),
(33, 1, 11, 'CRAB OR LOBSTER LOUIE', '1', '2023-03-21 18:49:37', NULL, NULL),
(34, 1, 11, 'GRILLED SHRIMP SALAD', '1', '2023-03-21 18:49:46', NULL, NULL),
(35, 1, 12, 'Burger', '1', '2023-06-30 12:31:14', NULL, NULL),
(36, 25, 13, 'Grilled Chicken Salad ', '25', '2023-07-03 07:28:10', NULL, NULL),
(37, 25, 14, 'Buttermilk Pancakes', '25', '2023-07-03 07:28:43', NULL, NULL),
(38, 25, 15, 'Strawberry Smoothie ', '25', '2023-07-03 07:29:13', '25', '2023-07-03 07:48:24'),
(39, 25, 15, 'cheese omelette ', '25', '2023-07-03 07:31:29', NULL, NULL),
(40, 25, 17, 'Baked French Toast ', '25', '2023-07-03 07:48:55', NULL, NULL),
(41, 25, 16, 'Strawberry Smoothie ', '25', '2023-07-03 07:50:30', NULL, NULL),
(42, 26, 21, 'lemon drinks', '26', '2023-07-04 10:08:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_service_item_description`
--

CREATE TABLE `md_service_item_description` (
  `service_item_id` int(11) NOT NULL,
  `item_price` float(10,2) NOT NULL DEFAULT 0.00,
  `item_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `note_back_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `md_service_item_description`
--

INSERT INTO `md_service_item_description` (`service_item_id`, `item_price`, `item_desc`, `item_note`, `note_color`, `note_back_color`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 12.00, 'Choice of bacon or chorizo with scrambled eggs, potatoes & cheese, wrapped in a flour tortilla Served with breakfast potatoes or fresh fruit', '', '#ffffff', '#000000', '1', '2023-03-21 17:39:20', NULL, NULL),
(2, 12.00, 'Cold smoked salmon, tomato, cucumber, avocado, capers, red onion & cream cheese', '', '#ffffff', '#000000', '1', '2023-03-21 17:40:01', NULL, NULL),
(3, 12.00, 'Warm oats, brown sugar, dried cranberries & candied pecans. One egg any style and choice of bacon, ham or sausage', '', '#ffffff', '#000000', '1', '2023-03-21 17:40:31', NULL, NULL),
(4, 14.00, 'Belgian waffle with three pieces of fried chicken, house gravy, sriracha honey butter and orange agave maple syrup add a fried egg for $1', '', '#ffffff', '#000000', '1', '2023-03-21 17:42:04', NULL, NULL),
(5, 10.00, 'Sambazon açaí, granola, pineapple, strawberries, blueberries, blackberries, chia, coconut & honey', '', '#ffffff', '#000000', '1', '2023-03-21 17:56:52', NULL, NULL),
(6, 5.00, 'good', '', '#ffffff', '#000000', '1', '2023-03-21 17:57:25', NULL, NULL),
(7, 3.00, 'good', '', '#ffffff', '#000000', '1', '2023-03-21 17:57:49', NULL, NULL),
(8, 2.00, 'good', '', '#ffffff', '#000000', '1', '2023-03-21 17:58:31', NULL, NULL),
(9, 5.00, 'good', '', '#ffffff', '#000000', '1', '2023-03-21 17:58:51', NULL, NULL),
(10, 11.00, 'With Ham, Bacon or Sausage', '', '#ffffff', '#000000', '1', '2023-03-21 17:59:18', NULL, NULL),
(11, 33.00, 'USDA Choice Ribeye Steak with two eggs any style', '', '#ffffff', '#000000', '1', '2023-03-21 17:59:36', NULL, NULL),
(12, 12.50, 'Diced ham, brie cheese, sauteed mushrooms, spinach, sweet onion, garlic & sour cream', '', '#ffffff', '#000000', '1', '2023-03-21 18:00:07', NULL, NULL),
(13, 17.00, 'Crab, havarti, avocado & hollandaise', '', '#ffffff', '#000000', '1', '2023-03-21 18:00:22', NULL, NULL),
(14, 12.00, 'Chorizo, red, yellow & green bell peppers, sauteed onion, tomatoes, pepper jack cheese & pico de gallo', '', '#ffffff', '#000000', '1', '2023-03-21 18:00:40', NULL, NULL),
(15, 13.00, 'Sauteed spinach, mushrooms, black olives & onions', '', '#ffffff', '#000000', '1', '2023-03-21 18:00:59', NULL, NULL),
(16, 16.00, 'panko breaded calamari, tartar & cocktail sauce', '', '#ffffff', '#000000', '1', '2023-03-21 18:21:56', NULL, NULL),
(17, 17.00, 'diced ahi tuna, soy, jalapeno, onion, sesame, wonton bowl & taro chips', '', '#ffffff', '#000000', '1', '2023-03-21 18:22:31', NULL, NULL),
(18, 17.00, 'shrimp, avocado, lemon red onion, cilantro and tortilla chips', '', '#ffffff', '#000000', '1', '2023-03-21 18:22:55', NULL, NULL),
(19, 17.00, 'raw scallops on the half shell seaweed salad, ginger, wasabi cream 3ea/30doz', '', '#ffffff', '#000000', '1', '2023-03-21 18:23:20', NULL, NULL),
(20, 15.00, 'grilled chicken, white cheddar, hava-a-chips, pico de gallo', '', '#ffffff', '#000000', '1', '2023-03-21 18:37:39', NULL, NULL),
(21, 35.00, 'five premium cheeses, fruit, candied pec ans, marinated vegetables, jam & crackers serves 3-4', '', '#ffffff', '#000000', '1', '2023-03-21 18:38:10', NULL, NULL),
(22, 75.00, 'two tiered red arrangement of: 12 scallops wasabi, 12 chilled prawns, 6 snow crab claws, cocktail sauce & lemon', '', '#ffffff', '#000000', '1', '2023-03-21 18:38:33', NULL, NULL),
(23, 18.50, 'romaine, parmesan, creamy caesar dressing, croutons', '', '#ffffff', '#000000', '1', '2023-03-21 18:38:57', NULL, NULL),
(24, 16.50, 'butter lettuce, pear, gorgonzola, dried cranberries, candied pecans & balsamic vinaigrette', '', '#ffffff', '#000000', '1', '2023-03-21 18:39:18', NULL, NULL),
(25, 16.00, 'panko breaded calamari, tartar & cocktail sauce', '', '#ffffff', '#000000', '1', '2023-03-21 18:50:30', NULL, NULL),
(26, 17.00, 'diced ahi tuna, soy, jalapeno, onion, sesame, wonton bowl & taro chips', '', '#ffffff', '#000000', '1', '2023-03-21 18:50:49', NULL, NULL),
(27, 17.00, 'shrimp, avocado, lemon red onion, cilantro and tortilla chips', '', '#ffffff', '#000000', '1', '2023-03-21 18:51:07', NULL, NULL),
(28, 16.00, 'raw scallops on the half shell seaweed salad, ginger, wasabi cream 3ea/30doz', '', '#ffffff', '#000000', '1', '2023-03-21 18:51:25', NULL, NULL),
(29, 15.00, 'grilled chicken, white cheddar, hava-a-chips, pico de gallo', '', '#ffffff', '#000000', '1', '2023-03-21 18:51:49', NULL, NULL),
(30, 35.00, 'five premium cheeses, fruit, candied pec ans, marinated vegetables, jam & crackers serves 3-4', '', '#ffffff', '#000000', '1', '2023-03-21 18:52:10', NULL, NULL),
(31, 75.00, 'two tiered red arrangement of: 12 scallops wasabi, 12 chilled prawns, 6 snow crab claws, cocktail sauce & lemon', '', '#ffffff', '#000000', '1', '2023-03-21 18:52:26', NULL, NULL),
(32, 16.50, 'butter lettuce, pear, gorgonzola, dried cranberries, candied pecans & balsamic vinaigrette', '', '#ffffff', '#000000', '1', '2023-03-21 18:52:56', NULL, NULL),
(33, 21.50, 'lobster or crab, egg, tomatoes, marinated vegetables, olives, avocado, romaine & thousand island', '', '#ffffff', '#000000', '1', '2023-03-21 18:53:20', NULL, NULL),
(34, 20.50, 'romaine, parmesan, creamy caesar dressing, croutons', '', '#ffffff', '#000000', '1', '2023-03-21 18:53:37', NULL, NULL),
(36, 13.49, 'Grilled Chicken ', 'Salad ', '#a72f2f', '#bd3d3d', '25', '2023-07-03 07:46:00', NULL, NULL),
(37, 10.00, 'Buttermilk ', '', '#a72f2f', '#bd3d3d', '25', '2023-07-03 07:46:48', NULL, NULL),
(38, 9.00, 'cheese omlette', '', '#a72f2f', '#bd3d3d', '25', '2023-07-03 07:47:18', NULL, NULL),
(40, 10.00, 'Baked', '', '#a72f2f', '#bd3d3d', '25', '2023-07-03 07:49:52', NULL, NULL),
(41, 8.00, 'strawberry ', '', '#a72f2f', '#bd3d3d', '25', '2023-07-03 07:50:48', NULL, NULL),
(42, 250.00, 'n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without re', 'Lorem ipsum dolor sit amet, consectetur adipiscing', '#fafafa', '#000000', '26', '2023-07-04 10:10:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_special_category`
--

CREATE TABLE `md_special_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_special_category`
--

INSERT INTO `md_special_category` (`id`, `name`) VALUES
(1, 'New year\'s Day'),
(2, 'Martin Luther King Day'),
(3, 'Valentine\'s Day'),
(4, 'President\'s Day'),
(5, 'St.Patrick\'s Day'),
(6, 'April Fool\'s Day'),
(7, 'Good Friday'),
(8, 'Easter'),
(9, 'Mother\'s Day'),
(10, 'Father\'s Day'),
(11, 'Memorial Day'),
(12, 'Independence Day'),
(13, 'Labor Day'),
(14, 'Columbus Day'),
(15, 'Daughter\'s Day'),
(16, 'Friendship Day'),
(17, 'Halloween'),
(18, 'Veterans Day'),
(19, 'Thanksgiving Day'),
(20, 'Christmas'),
(21, 'Friday Specials'),
(22, 'Taco Tuesday Specials'),
(23, 'Grand Feast'),
(24, 'Birthday'),
(25, 'Anniversary'),
(26, 'Flipbook'),
(27, 'Directory Divider'),
(28, 'Icon-Colored'),
(29, 'Icon-Black'),
(30, 'Icon-White');

-- --------------------------------------------------------

--
-- Table structure for table `md_sub_sales_agent`
--

CREATE TABLE `md_sub_sales_agent` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `agent_name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `territory` varchar(50) NOT NULL,
  `frst_comm` float(10,2) NOT NULL DEFAULT 0.00,
  `snd_comm` float(10,2) NOT NULL DEFAULT 0.00,
  `comments` text DEFAULT NULL,
  `email_title` varchar(100) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `email_send_dt` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_sub_sales_agent`
--

INSERT INTO `md_sub_sales_agent` (`id`, `sales_id`, `agent_name`, `address`, `phone_no`, `whatsapp_no`, `email`, `start_date`, `territory`, `frst_comm`, `snd_comm`, `comments`, `email_title`, `email_body`, `email_send_dt`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Leo DeCaprio', 'Dallas, Texas', '9836751295', '9051203114', 'somnath@synergicsoftek.in', '2023-04-07', '2', 25.00, 75.00, 'Sample comments', 'Welcome Leo DeCaprio', 'Hello Leo DeCaprio,\n    \n         Please log in to your account with the following credentials to add and manage hotels.\n    \n        Login Link: http://localhost:4200/#//main/sales/saleslogin\n        UserID: 9836751296\n        Password: A54Ub\n        \n        Thank You,\n        Cindy Ferguson', NULL, 'somnath.thakur16@gmail.com', '2023-04-06 06:48:53', 'null', '2023-05-10 12:16:03'),
(4, 3, 'P Maity', 'Kolaghat\nEast Midnapore\nWest Bengal\nIndia', '8240378957', '8240378957', 'meettan@gmail.com', '2023-04-06', '2', 40.00, 60.00, 'New Sub Sales Agent', 'Welcome P Maity', 'Hello P Maity,\n    \n         Please log in to your account with the following credentials to add and manage hotels.\n    \n        Login Link: https://custom.shoplocal-lagunabeach.com/#//main/sales/saleslogin\n        UserID: 8240378957\n        Password: 3pytq\n        \n        Thank You,\n        Cindy Ferguson', NULL, 'somnath.thakur16@gmail.com', '2023-04-06 08:59:05', NULL, NULL),
(5, 3, 'Kita Maity', 'Eagra\nMidnapore (W)\nWest Bengal\nIndia', '9874001458', '9874001458', 'pin05@rediffmail.com', '2023-04-06', '2', 80.00, 20.00, 'New Sub Sales Agent', 'Welcome Kita Maity', 'Hello Kita Maity,\n    \n         Please log in to your account with the following credentials to add and manage hotels.\n    \n        Login Link: https://custom.shoplocal-lagunabeach.com/#//main/sales/saleslogin\n        UserID: 9874001458\n        Password: S9so4\n        \n        Thank You,\n        Cindy Ferguson', NULL, 'somnath.thakur16@gmail.com', '2023-04-06 09:02:49', NULL, NULL),
(6, 4, 'Suman Mitra', 'Sodepur', '8777528909', '8777528909', 'somnath.thakur16@gmail.com', '2023-05-12', '2', 50.00, 50.00, 'Hoyna', 'Welcome Suman Mitra', 'Hello Suman Mitra,\n    \n         Please log in to your account with the following credentials to add and manage hotels.\n    \n        Login Link: http://localhost:4200/#//main/sales/saleslogin\n        UserID: 8777528909\n        Password: aTxRU\n        \n        Thank You,\n        Cindy Ferguson', NULL, 'null', '2023-05-11 06:44:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `md_time_zone`
--

CREATE TABLE `md_time_zone` (
  `id` int(11) NOT NULL,
  `time_zone` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_time_zone`
--

INSERT INTO `md_time_zone` (`id`, `time_zone`, `name`) VALUES
(1, '(GMT-12:00) International Date Line West', 'Etc/GMT+12'),
(2, '(GMT-11:00) Midway Island, Samoa', 'Pacific/Midway'),
(3, '(GMT-07:00) Arizona', 'US/Arizona'),
(4, '(GMT-06:00) Central America', 'America/Managua'),
(5, '(GMT-10:00) Hawaii', 'Pacific/Honolulu'),
(6, '(GMT-08:00) Tijuana, Baja California', 'America/Tijuana'),
(7, '(GMT-08:00) Pacific Time (US & Canada)', 'America/Los_Angeles'),
(8, '(GMT-07:00) Mountain Time (US & Canada)', 'US/Mountain'),
(9, '(GMT-09:00) Alaska', 'US/Alaska'),
(10, '(GMT-07:00) Chihuahua, La Paz, Mazatlan', 'America/Chihuahua'),
(11, '(GMT-06:00) Central Time (US & Canada)', 'US/Central'),
(12, '(GMT-06:00) Guadalajara, Mexico City, Monterrey', 'America/Mexico_City'),
(13, '(GMT-05:00) Indiana (East)', 'US/East-Indiana'),
(14, '(GMT-06:00) Saskatchewan', 'Canada/Saskatchewan'),
(15, '(GMT-05:00) Bogota, Lima, Quito, Rio Branco', 'America/Bogota'),
(16, '(GMT-05:00) Eastern Time (US & Canada)', 'US/Eastern'),
(17, '(GMT-04:00) Manaus', 'America/Manaus'),
(18, '(GMT-04:00) Santiago', 'America/Santiago'),
(19, '(GMT-03:30) Newfoundland', 'Canada/Newfoundland'),
(20, '(GMT-04:00) Atlantic Time (Canada)', 'Canada/Atlantic'),
(21, '(GMT-04:00) Caracas, La Paz', 'America/Caracas'),
(22, '(GMT-03:00) Greenland', 'America/Godthab'),
(23, '(GMT-03:00) Montevideo', 'America/Montevideo'),
(24, '(GMT-03:00) Brasilia', 'America/Sao_Paulo'),
(25, '(GMT-03:00) Buenos Aires, Georgetown', 'America/Argentina/Buenos_Aires'),
(26, '(GMT-02:00) Mid-Atlantic', 'America/Noronha'),
(27, '(GMT-01:00) Cape Verde Is.', 'Atlantic/Cape_Verde'),
(28, '(GMT+00:00) Casablanca, Monrovia, Reykjavik', 'Africa/Casablanca'),
(29, '(GMT+00:00) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London', 'Etc/Greenwich'),
(30, '(GMT-01:00) Azores', 'Atlantic/Azores'),
(31, '(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', 'Europe/Amsterdam'),
(32, '(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', 'Europe/Brussels'),
(33, '(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb', 'Europe/Sarajevo'),
(34, '(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', 'Europe/Belgrade'),
(35, '(GMT+01:00) West Central Africa', 'Africa/Lagos'),
(36, '(GMT+02:00) Amman', 'Asia/Amman'),
(37, '(GMT+02:00) Athens, Bucharest, Istanbul', 'Europe/Athens'),
(38, '(GMT+02:00) Cairo', 'Africa/Cairo'),
(39, '(GMT+02:00) Harare, Pretoria', 'Africa/Harare'),
(40, '(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius', 'Europe/Helsinki'),
(41, '(GMT+02:00) Beirut', 'Asia/Beirut'),
(42, '(GMT+02:00) Jerusalem', 'Asia/Jerusalem'),
(43, '(GMT+02:00) Minsk', 'Europe/Minsk'),
(44, '(GMT+02:00) Windhoek', 'Africa/Windhoek'),
(45, '(GMT+03:00) Kuwait, Riyadh, Baghdad', 'Asia/Kuwait'),
(46, '(GMT+03:00) Moscow, St. Petersburg, Volgograd', 'Europe/Moscow'),
(47, '(GMT+03:00) Tbilisi', 'Asia/Tbilisi'),
(48, '(GMT+04:00) Abu Dhabi, Muscat', 'Asia/Muscat'),
(49, '(GMT+04:00) Baku', 'Asia/Baku'),
(50, '(GMT+03:00) Nairobi', 'Africa/Nairobi'),
(51, '(GMT+03:30) Tehran', 'Asia/Tehran'),
(52, '(GMT+04:30) Kabul', 'Asia/Kabul'),
(53, '(GMT+05:00) Yekaterinburg', 'Asia/Yekaterinburg'),
(54, '(GMT+05:00) Islamabad, Karachi, Tashkent', 'Asia/Karachi'),
(55, '(GMT+04:00) Yerevan', 'Asia/Yerevan'),
(56, '(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', 'Asia/Calcutta'),
(57, '(GMT+05:30) Sri Jayawardenapura', 'Asia/Calcutta'),
(58, '(GMT+06:00) Almaty, Novosibirsk', 'Asia/Almaty'),
(59, '(GMT+06:00) Astana, Dhaka', 'Asia/Dhaka'),
(60, '(GMT+06:30) Yangon (Rangoon)', 'Asia/Rangoon'),
(61, '(GMT+05:45) Kathmandu', 'Asia/Katmandu'),
(62, '(GMT+07:00) Krasnoyarsk', 'Asia/Krasnoyarsk'),
(63, '(GMT+08:00) Kuala Lumpur, Singapore', 'Asia/Kuala_Lumpur'),
(64, '(GMT+07:00) Bangkok, Hanoi, Jakarta', 'Asia/Bangkok'),
(65, '(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi', 'Asia/Hong_Kong'),
(66, '(GMT+08:00) Irkutsk, Ulaan Bataar', 'Asia/Irkutsk'),
(67, '(GMT+08:00) Perth', 'Australia/Perth'),
(68, '(GMT+09:00) Osaka, Sapporo, Tokyo', 'Asia/Tokyo'),
(69, '(GMT+09:00) Seoul', 'Asia/Seoul'),
(70, '(GMT+09:00) Yakutsk', 'Asia/Yakutsk'),
(71, '(GMT+08:00) Taipei', 'Asia/Taipei'),
(72, '(GMT+10:00) Brisbane', 'Australia/Brisbane'),
(73, '(GMT+09:30) Darwin', 'Australia/Darwin'),
(74, '(GMT+09:30) Adelaide', 'Australia/Adelaide'),
(75, '(GMT+10:00) Hobart', 'Australia/Hobart'),
(76, '(GMT+10:00) Canberra, Melbourne, Sydney', 'Australia/Canberra'),
(77, '(GMT+10:00) Guam, Port Moresby', 'Pacific/Guam'),
(78, '(GMT+12:00) Fiji, Kamchatka, Marshall Is.', 'Pacific/Fiji'),
(79, '(GMT+10:00) Vladivostok', 'Asia/Vladivostok'),
(80, '(GMT+11:00) Magadan, Solomon Is., New Caledonia', 'Asia/Magadan'),
(81, '(GMT+12:00) Auckland, Wellington', 'Pacific/Auckland'),
(82, '(GMT+13:00) Nuku\'alofa', 'Pacific/Tongatapu');

-- --------------------------------------------------------

--
-- Table structure for table `md_url`
--

CREATE TABLE `md_url` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('R','S') NOT NULL COMMENT 'S :Service R :Restaurant	',
  `srv_res_id` bigint(22) NOT NULL COMMENT 'Service (S):td_quest_service Restaurant (R) :td_quest_res_bars',
  `url` text DEFAULT NULL,
  `bitly_url` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `dynamic_img` varchar(100) DEFAULT NULL,
  `v_card_img` varchar(100) DEFAULT NULL,
  `fun_directory_img` varchar(100) DEFAULT NULL,
  `approval_flag` enum('U','A','S') NOT NULL DEFAULT 'U',
  `approved_by` varchar(50) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `md_url`
--

INSERT INTO `md_url` (`id`, `hotel_id`, `srv_res_flag`, `srv_res_id`, `url`, `bitly_url`, `image`, `dynamic_img`, `v_card_img`, `fun_directory_img`, `approval_flag`, `approved_by`, `approved_date`) VALUES
(1, 1, 'R', 1, 'https://custom.shoplocal-lagunabeach.com/#/user/user_menu/MS8x/MQ%3D%3D', 'https://bit.ly/3YD2Jkp', NULL, '1_1_dynamic_qr_qr-code (1).png', '1_1_v_card_qr_qr-code (1).png', NULL, 'U', NULL, NULL),
(2, 26, 'R', 63, 'http://localhost:4200/#/user/user_menu/MjYvNjM=/NjM%3D', 'undefined', NULL, '26_63_dynamic_qr_qr-code.png', '26_63_v_card_qr_qr-code (1).png', NULL, 'U', NULL, NULL),
(3, 26, 'R', 62, 'http://localhost:4200/#/user/user_menu/MjYvNjI=/NjI%3D', 'undefined', NULL, '26_62_dynamic_qr_qr-code (2).png', '26_62_v_card_qr_qr-code (3).png', NULL, 'U', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_about`
--

CREATE TABLE `td_about` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') NOT NULL COMMENT 'S :Service R :Restaurant ',
  `restaurant_id` bigint(22) NOT NULL,
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast L:Lunch D:Dinner R:Brunch S:Special A:Bar V:Menu Service',
  `about_us` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_about`
--

INSERT INTO `td_about` (`id`, `hotel_id`, `srv_res_flag`, `restaurant_id`, `menu_id`, `about_us`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 0, 'S', 1, 'B', 'qetaesgasdgsdg', '38', '2021-11-01 22:57:39', '1', '2023-01-14 08:12:45'),
(2, 0, 'S', 2, 'B', 'A family owned coaching inn on the banks of the River Severn in Shrewsbury\r\n\r\nThis is a magnificent grade II listed building on the outskirts of town', '34', '2021-11-01 10:44:06', NULL, NULL),
(3, 0, 'S', 5, 'B', 'sdfsdfasdfasdfasdfqwegrwrGVwesdvsaecg', '5', '2023-01-04 10:15:53', '5', '2023-01-04 11:13:17'),
(4, 1, 'S', 1, 'B', 'about restu', '1', '2023-01-14 10:28:08', NULL, NULL),
(5, 1, 'S', 3, 'B', 'about bar', '3', '2023-01-14 10:28:29', NULL, NULL),
(6, 1, 'S', 2, 'B', 'about room', '2', '2023-01-14 10:29:12', NULL, NULL),
(7, 26, 'S', 62, 'B', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500', '62', '2023-07-05 05:43:34', NULL, NULL),
(8, 26, 'R', 62, 'A', 'abcdseufhgffgfh', '62', '2023-07-05 08:26:50', '26', '2023-07-05 09:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `td_calendar`
--

CREATE TABLE `td_calendar` (
  `id` bigint(22) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') NOT NULL COMMENT 'S :Service R :Restaurant',
  `srv_res_id` int(11) NOT NULL COMMENT 'Service (S):td_quest_service Restaurant (R) :td_quest_res_bars	',
  `event_date` date NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_sub_title` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `tkt_url` text NOT NULL,
  `description` text NOT NULL,
  `img_path` text DEFAULT NULL,
  `cal_type` enum('O','R') NOT NULL DEFAULT 'O' COMMENT 'O-> Once; R-> Repetative',
  `cal_schedule` enum('D','W') DEFAULT NULL COMMENT 'D-> Daily; W-> Weakly',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `event_day` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_calendar`
--

INSERT INTO `td_calendar` (`id`, `hotel_id`, `srv_res_flag`, `srv_res_id`, `event_date`, `event_title`, `event_sub_title`, `website`, `video_url`, `tkt_url`, `description`, `img_path`, `cal_type`, `cal_schedule`, `start_date`, `end_date`, `event_time`, `event_day`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(10, 1, 'R', 1, '2022-02-19', 'Michael Jackson at the Wembley', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Michael_Jackson', 'Michael Jackson will be doing his iconic renditions at the legendary stadiums.', '44_calender_mj.jpg', 'O', NULL, NULL, NULL, NULL, 0, 'admin@gmail.com', '2021-12-11 05:48:39', NULL, NULL),
(13, 1, 'R', 1, '2022-02-24', 'Kolkata Video Speed Dating', NULL, 'null', 'null', 'https://www.eventbrite.com/e/kolkata-video-speed-dating-filter-off-tickets-106558886498?aff=ebdssbcitybrowse', '', '4_calender_48_9_top_salty_desserts_cover.jpg', 'O', NULL, NULL, NULL, NULL, 0, 'abcd@gmail.com', '2021-12-07 07:13:16', 'admin@gmail.com', '2022-02-22 05:21:47'),
(14, 1, 'R', 2, '2022-02-23', 'Free Meditation course', NULL, NULL, NULL, 'https://www.eventbrite.com/e/online-free-meditation-course-kolkata-experience-the-peace-balance-tickets-192149272647?aff=ebdssbcitybrowse', 'Looking for peace, balance, joy, overcome stress, transform and meet other seekers? Welcome to free guided \'Sahaja Yoga\' online meditation classes that help you achieve meditation benefits in quick and easy steps and discover its healing power. No prior experience needed. These classes are designed to provide experience of an in-person interactive session.', '4_calender_1.jpeg', 'O', NULL, NULL, NULL, NULL, 0, 'abcd@gmail.com', '2021-12-07 07:13:16', 'admin@gmail.com', '2022-02-04 15:09:20'),
(15, 1, 'S', 4, '2022-02-22', 'New year offer', NULL, NULL, NULL, 'https://www.eventbrite.com/e/new-year-offer-tickets-240757621527?aff=ebdssbcitybrowse', 'new year game', '4_calender_2.jpeg', 'O', NULL, NULL, NULL, NULL, 0, 'abcd@gmail.com', '2021-12-07 07:13:16', 'admin@gmail.com', '2022-02-04 15:10:59'),
(16, 1, 'S', 5, '2022-02-22', 'Tech Startup Business', NULL, NULL, NULL, 'https://www.eventbrite.com/e/develop-a-successful-healthcare-tech-startup-business-today-tickets-241858303697?aff=ebdssbcitybrowse', 'Always wanted to start an Healthcare Tech Startup? Now we have a complete blueprint for you start your own Healthcare Tech Startup Business. During our tech startup program you will learn and navigate through tools, software, hardware, platforms, resources, projects, processes, methods and strategies to penetrate your own Healthcare Tech Startup Business into different market.s and industries. For more information visit our website at Atechup.com', '4_calender_3.jpeg', 'O', NULL, NULL, NULL, NULL, 0, 'abcd@gmail.com', '2021-12-07 07:13:16', 'admin@gmail.com', '2022-02-04 15:11:55'),
(17, 1, 'R', 2, '2022-02-22', 'Michael Jackson\'s Bad Tour', NULL, 'https://g.co/kgs/3KMTbe', 'https://www.youtube.com/embed/CfeT02iEwUU/724s', 'https://g.co/kgs/3KMTbe', 'Michael Jackson will be back after his hiatus', '4_calender_dif_eventsample.jpg', 'O', NULL, NULL, NULL, NULL, 0, 'admin@gmail.com', '2022-02-09 09:46:11', NULL, NULL),
(18, 1, 'S', 4, '2023-04-11', 'ioyrkuydkjd', NULL, '', '', 'glkug;k', '', '', 'O', NULL, NULL, NULL, NULL, 0, 'admin@gmail.com', '2023-01-06 05:17:17', NULL, NULL),
(19, 1, 'R', 1, '2023-04-21', 'Arijit Singh', 'Pop', 'www.arijitsingh.com', 'https://www.youtube.com/embed/1UF6NZxerS0', 'www.ticket.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'calendar/1_msgImg_0.3236238751503069.jpg', 'O', NULL, NULL, NULL, NULL, 0, 'somnath.thakur16@gmail.com', '2023-04-08 11:56:07', 'somnath.thakur16@gmail.com', '2023-04-11 05:46:35'),
(21, 1, 'R', 1, '2023-04-21', '2023 Smithsonian Craft Show', 'The best in American craft returns to Washington', 'www.arijitsingh.com', 'https://www.youtube.com/embed/1UF6NZxerS0', 'www.ticket.com', 'Preview Night Benefit Wednesday, May 3\n\nFRIEND - First Look and Visionary Reception 5:00 - 6:00 PM One ticket to Preview Night and Cocktail Reception to meet the Visionary Award winners, Craft Show Friend listing (program and website) $500 ($180 fair market value)\n\nINDIVIDUAL - Preview Night Party 6:00 - 9:00 PM Meet the artists, shop the show, and enjoy cocktails and a buffet reception $250 ($120 fair market value)\n\nHigher Level Tickets and Donations call the Smithsonian Office at (202) 633-5006', 'calendar/original.jpeg', 'O', NULL, NULL, NULL, NULL, 0, 'somnath.thakur16@gmail.com', '2023-04-08 11:56:07', 'somnath.thakur16@gmail.com', '2023-04-11 05:46:35'),
(25, 1, 'R', 1, '2023-04-18', 'FoodieLand Night Market', 'FoodieLand is a three-day outdoor multicultural food festival for foodies!', 'www.arijitsingh.com', 'https://www.youtube.com/embed/1UF6NZxerS0', 'www.ticket.com', ' Tickets will only be available online through Eventbrite. No tickets will be sold at the door. To help regulate the arrival of incoming guests, all tickets have a designated timed entry. There is no limit on how long you can stay for the day. In the event you need to change your entry time after purchasing, you can contact us through Eventbrite to request a free time slot change. Event tickets typically sell out prior to the event and we recommend purchasing them in advance.', 'calendar/food.jpeg', 'O', NULL, NULL, NULL, NULL, 0, 'somnath.thakur16@gmail.com', '2023-04-08 11:56:07', 'somnath.thakur16@gmail.com', '2023-04-11 05:46:35'),
(31, 1, 'R', 3, '2023-04-12', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(32, 1, 'R', 3, '2023-04-13', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(33, 1, 'R', 3, '2023-04-14', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(34, 1, 'R', 3, '2023-04-15', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(35, 1, 'R', 3, '2023-04-16', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(36, 1, 'R', 3, '2023-04-17', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(37, 1, 'R', 3, '2023-04-18', 'CULTURAL MUSIC FEST 2023', 'Celebrate blackness through art, food, and music.', 'www.durgapuja.com', 'https://www.youtube.com/embed/N8eNTFEPFsM', 'durgapujatkt.com', 'Cultural Music Fest 2023 Presented by T.E.G. Worldwide and V101.9. Date : Sunday, April 30th Location : Route 29 Pavilion 5650 Sandusky Blvd., Charlotte, NC 28027 Musical Line Up Featuring: Montell Jordan, Adina Howard, DJ Fatman Scoop, EU, Carl Thomas, Chubb Rock, Sunshine Anderson, Uptown Swagga, Sahara Reggae Band, Iconic Truth Band, 69 Boyz, DJ Incognito, & DJ Stacy Blackman! Hosted by Tone-X. M﻿usic. Food Trucks. Vendors. Culture. Beer, wine and alcohol will be available to purchase.', 'calendar/music_fest.jpeg', 'R', 'D', '2023-04-12', '2023-04-18', '18:07:00', 0, 'somnath.thakur16@gmail.com', '2023-04-12 08:21:13', NULL, NULL),
(38, 1, 'S', 4, '2023-04-18', 'Southern Charm at the Farm Spring 2023', 'Southern Charm at the Farm is the largest artisan festival in the Southeast!', 'www.monohar.com', 'https://www.youtube.com/embed/P5W7d2zP6Lw', 'monohartkt.com', 'Grab your besties, and join us for a full day of feel good shopping, knowing you\'ll be supporting hundreds of small businesses! Southern Charm at the Farm Spring 2023 show will be held on April 22 from 9am to 4pm at the fabulous Tanglewood Park in Clemmons, NC! Our show is the largest artisan festival in the Southeast, boasting nearly 300 makers & collectors who travel from near and far!', 'calendar/farm.jpeg', 'R', 'W', '2023-04-14', '2023-04-29', '18:05:00', 2, 'somnath.thakur16@gmail.com', '2023-04-12 08:32:05', NULL, NULL),
(39, 1, 'S', 4, '2023-04-25', 'Southern Charm at the Farm Spring 2023', 'Southern Charm at the Farm is the largest artisan festival in the Southeast!', 'www.monohar.com', 'https://www.youtube.com/embed/P5W7d2zP6Lw', 'monohartkt.com', 'Grab your besties, and join us for a full day of feel good shopping, knowing you\'ll be supporting hundreds of small businesses! Southern Charm at the Farm Spring 2023 show will be held on April 22 from 9am to 4pm at the fabulous Tanglewood Park in Clemmons, NC! Our show is the largest artisan festival in the Southeast, boasting nearly 300 makers & collectors who travel from near and far!', 'calendar/farm.jpeg', 'R', 'W', '2023-04-14', '2023-04-29', '18:05:00', 2, 'somnath.thakur16@gmail.com', '2023-04-12 08:32:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_contacts_custom`
--

CREATE TABLE `td_contacts_custom` (
  `id` bigint(22) NOT NULL,
  `contact_date` datetime NOT NULL,
  `restaurant_name` varchar(150) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `cnct_position` varchar(100) DEFAULT NULL,
  `cnct_phone_no` varchar(50) DEFAULT NULL,
  `cnct_whatsapp_no` varchar(50) DEFAULT NULL,
  `phone_no` varchar(50) NOT NULL,
  `whatsapp_no` varchar(50) DEFAULT NULL,
  `email` varchar(70) NOT NULL,
  `addr_line1` text NOT NULL,
  `addr_line2` text DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `time_zone` varchar(100) NOT NULL,
  `website` text DEFAULT NULL,
  `contact_time` varchar(100) DEFAULT NULL,
  `active_user` enum('Y','N') DEFAULT 'Y',
  `approval_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `account_type` enum('H','S','U') DEFAULT NULL COMMENT 'H : House Account\r\nS : Sales Account\r\nU: Sub-Sales',
  `sales_agent` int(10) NOT NULL DEFAULT 0,
  `proposal_status` enum('P','S','C','N') NOT NULL DEFAULT 'P' COMMENT 'P:Pending\r\nS:Send\r\nC:Accepted \r\nN:No Sale\r\n',
  `proposal_amt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `first_pay` date DEFAULT NULL,
  `final_pay` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `questionnaire_send` enum('Y','N') NOT NULL DEFAULT 'N',
  `questionnaire_send_dt` datetime DEFAULT NULL,
  `pay_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `setup_mode` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_contacts_custom`
--

INSERT INTO `td_contacts_custom` (`id`, `contact_date`, `restaurant_name`, `contact_name`, `cnct_position`, `cnct_phone_no`, `cnct_whatsapp_no`, `phone_no`, `whatsapp_no`, `email`, `addr_line1`, `addr_line2`, `city`, `zip`, `country`, `time_zone`, `website`, `contact_time`, `active_user`, `approval_flag`, `account_type`, `sales_agent`, `proposal_status`, `proposal_amt`, `first_pay`, `final_pay`, `remarks`, `questionnaire_send`, `questionnaire_send_dt`, `pay_flag`, `setup_mode`, `created_by`, `created_at`, `modified_by`, `modified_dt`) VALUES
(1, '2022-01-21 10:34:32', 'The Cliff', 'Somnath Thakur', 'Manager', '56789890', '23567890', '(949) 494-1956', '5748484567', 'somnath.thakur16@gmail.com', 'Laguna Beach', NULL, 'California', '92651', '22', 'Asia/Calcutta', 'https://www.thecliffrestaurant.com/', NULL, 'Y', 'Y', NULL, 0, 'C', 120.00, '2023-01-26', '2023-01-31', 'Notes', 'Y', '2023-01-10 08:16:37', 'Y', 'Y', 'samantasubham9804@gmail.com', '2022-01-21 10:34:32', 'somnath.thakur16@gmail.com', '2023-01-14 17:19:10'),
(2, '2021-11-01 08:35:50', 'UGM Diner', 'Brian Robert Foster', NULL, NULL, NULL, '+447970292203', NULL, 'ugolfmedia@gmail.com', '1 Sefton Drive', 'Bomere Heath', 'Shropshire', 'SY4 3NL', '22', 'Etc/Greenwich', 'www.ugolfmedia.com', NULL, 'Y', 'N', NULL, 0, 'C', 0.00, '0000-00-00', '0000-00-00', NULL, 'N', NULL, 'Y', 'Y', 'ugolfmedia@gmail.com', '2021-11-01 08:35:50', NULL, NULL),
(3, '2022-09-13 19:11:56', 'Test Restaurant', 'Brian Robert Foster', NULL, NULL, NULL, '+447970292203', NULL, 'kwoodpol@msn.com', '1 Sefton Drive', 'Bomere Heath', 'Shrewsbury', 'SY4 3NL', '22', 'Etc/Greenwich', 'www.testrestaurant.com', '10.00', 'N', 'N', NULL, 0, 'C', 0.00, '0000-00-00', '0000-00-00', NULL, 'N', NULL, 'Y', 'N', 'kwoodpol@msn.com', '2022-09-13 19:11:56', 'kwoodpol@msn.com', '2023-01-04 05:38:08'),
(5, '2022-12-22 11:34:13', 'Horir Hotel', 'Gubham Samanta', NULL, NULL, NULL, '9830327803', NULL, 'somnath.thakur16+90@gmail.com', 'samanta jekhane thake', 'hain jekhane samanta thake', 'samantar sohor', '700047', '2', 'Asia/Calcutta', 'samanta.com', 'kokhona na', 'N', 'N', NULL, 0, 'C', 0.00, '0000-00-00', '0000-00-00', NULL, 'N', NULL, 'Y', 'N', 'somnath.thakur16+90@gmail.com', '2022-12-22 11:34:13', 'somnath.thakur16+90@gmail.com', '2022-12-23 06:41:47'),
(6, '2023-01-02 05:06:10', 'New Hotel', 'Hotel_contact', 'Manager', '56789890', '34547454', '9836751294', '6290759694', 's@gmail.com', 'Naktala', 'a', 'a', 'a', '2', 'Asia/Calcutta', 'hotel.com', 'undefined', 'Y', 'N', NULL, 0, 'P', 0.00, '2023-01-19', '2023-01-28', 'We are here for some fun', 'N', NULL, 'N', 'N', 's@gmail.com', '2023-01-02 05:06:10', 's@gmail.com', '2023-01-10 07:17:43'),
(7, '2023-01-09 10:39:56', 'Hotel 1', '436436343', 'pos', '9883765589', 'Hotel_contact', '9836751294', '37574574357', 'wery@gmail.com', 'add1', 'add2', 'Kolkata', '700047', '2', 'Asia/Calcutta', 'hotel.com', 'undefined', 'N', 'N', 'H', 0, 'P', 0.00, NULL, NULL, 'null', 'N', NULL, 'N', 'N', 'wery@gmail.com', '2023-01-09 10:39:56', 'wery@gmail.com', '2023-01-27 12:18:49'),
(8, '2023-01-25 07:37:18', 'KFC', 'Subham Samanta', 'Employee', '9051203118', '9051203118', '9051203118', '9051203118', 'samantasubham9804@gmail.com', '29/12 Shambhunath Das Lane', '29/12 Shambhunath das lane', 'Kolkata', '700050', '2', 'Asia/Calcutta', 'http://localhost:3000', 'undefined', 'Y', 'N', 'H', 0, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'samantasubham9804@gmail.com', '2023-01-25 07:37:18', NULL, NULL),
(9, '2023-01-27 10:38:09', 'Darao Pothik Bor', 'Subham Samanta', 'Subham Samanta', '9051203118', '9051203118', '9051203119', '9051203118', 'samantasubham9804+1@gmail.com', '29/12 Shambhunath Das Lane', '29/12 Shambhunath das lane', 'Kolkata', '700050', '2', 'Asia/Calcutta', 'http://localhost:3000', 'undefined', 'Y', 'N', 'H', 0, 'P', 120.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'samantasubham9804+1@gmail.com', '2023-01-27 10:38:09', 'samantasubham9804+1@gmail.com', '2023-01-27 11:17:50'),
(10, '2023-02-20 07:54:52', 'Dey kitchen', 'Sayantani Dey', '', '8583949565', '8583949565', '9784512879', '8583949565', 'sayantani@gmail.com', 'Rabindranagar', 'Rabindranagar', 'West Bengal', '700153', '2', 'US/East-Indiana', 'https://abcdefgh.com', 'undefined', 'Y', 'N', 'S', 1, 'P', 0.00, NULL, NULL, 'Notes', 'N', NULL, 'N', 'N', 'sayantani@gmail.com', '2023-02-20 07:54:52', 'sayantani@gmail.com', '2023-05-10 12:06:03'),
(11, '2023-02-25 10:35:11', 'Mitra Cafe', 'Sharmila Ghosh', '', '8910294924', '8910294924', 'NA', '8910294924', 'mitra@gmail.com', 'Shyambazar', 'Shyambazar', 'kolkata', '700156', '2', 'US/East-Indiana', 'https://abcdefghi.com', 'undefined', 'Y', 'N', 'U', 3, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'mitra@gmail.com', '2023-02-25 10:35:11', NULL, NULL),
(12, '2023-03-01 06:22:41', 'ITC Royal Bengal', 'Tanmoy Mondal', 'System Admin (IT)', '9831887194', '9831887194', '03324244745', '8240378957', 'mondal.tanmoy@synergicsoftek.com', 'Acropolis', '1851/1 Rajdanga Main Road', 'Kolkata', '700107', '2', 'Asia/Calcutta', 'https://www.itchotels.com/', 'undefined', 'Y', 'Y', 'H', 0, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'mondal.tanmoy@synergicsoftek.com', '2023-03-01 06:22:41', NULL, NULL),
(13, '2023-04-03 09:39:55', 'KFC', 'Subham Samanta', 'Subham Samanta', '9051203118', '9051203118', '0', '9051203118', 'subham@synergicsoftek.in', '29/12 Shambhunath Das Lane', '29/12 Shambhunath Das Lane', 'Kolkata', '700050', '2', 'Asia/Calcutta', 'https://online.kfc.co.in/', 'undefined', 'Y', 'N', 'H', 0, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'subham@synergicsoftek.in', '2023-04-03 09:39:55', NULL, NULL),
(14, '2023-04-06 07:17:55', 'Holiday INN', 'Stevie Wonder', '', '9836751298', 'Stevie Wonder', '9836751296', '7485674366', 'somnath@synergicsoftek.in', 'Nirmala Kunja, 10J Dpp Road, Naktala', NULL, 'Kolkata', '700047', '2', 'Asia/Calcutta', 'hotel.com', 'undefined', 'Y', 'N', 'S', 1, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'somnath@synergicsoftek.in', '2023-04-06 07:17:55', NULL, NULL),
(15, '2023-05-10 06:10:58', 'Calcutta Bistro', 'Sayantani Dey', 'Manager', '8240404524', '8240404524', '8240404524', '8240404524', 'sayantika.dhar04@gmail.com', 'Jadavpur', 'Sulekha Main Road', 'West Bengal', '700153', '2', 'Asia/Calcutta', 'https://abcdefgh.com', 'undefined', 'Y', 'Y', 'H', 0, 'C', 1000.00, '2023-05-11', NULL, 'undefined', 'N', NULL, 'Y', 'Y', 'sayantika.dhar04@gmail.com', '2023-05-10 06:10:58', '15', '2023-05-11 12:02:53'),
(16, '2023-05-11 06:59:29', 'Cafe De Luxe', 'Nathan Lyon', '', '9836751294', '9836751294', '9836751295', '9836751294', 'somnath.thakur16+98@gmail.com', 'Nirmala Kunja, 10J Dpp Road, Naktala', NULL, 'Kolkata', '700047', '2', 'Asia/Calcutta', 'cafe.com', 'undefined', 'Y', 'N', 'S', 4, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'somnath.thakur16+98@gmail.com', '2023-05-11 06:59:29', NULL, NULL),
(17, '2023-05-13 05:17:23', 'The Mariott', 'Siman Mittal', '9831887194', '03325664312', '8240378957', '03325664312', '8240378957', 'sayantika.dhar04+2@gmail.com', 'L N Road', 'Dum Dum', 'Kolkata', '700028', '2', 'Asia/Calcutta', 'https://www.marriott.com/', 'undefined', 'Y', 'Y', 'H', 0, 'C', 100.00, '2023-05-13', NULL, 'undefined', 'N', NULL, 'Y', 'Y', 'somnath.thakur16+2@gmail.com', '2023-05-13 05:17:23', '17', '2023-05-13 10:44:45'),
(18, '2023-06-09 07:23:26', 'Deja Brew', 'Sudeshna Sen', 'Manager', '9742563520', '9742563520', '9742563520', '9742563520', 'sen.sudeshna@gmail.com', 'Prince Gulam Hussain Shah Rd,Jadavpur', 'Prince Gulam Hussain Shah Rd,Jadavpur', 'West Bengal', '700032', '2', 'US/East-Indiana', 'https://ijklmno.com', 'undefined', 'N', 'N', 'H', 0, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'sen.sudeshna@gmail.com', '2023-06-09 07:23:26', NULL, NULL),
(20, '2023-06-09 07:43:51', 'Deja Brew', '8240404524', 'Manager', '8240404524', '8240404524', '8240404524', '8240404524', 'sayantika@synergicsoftek.in', 'Prince Gulam Hussain Shah Rd, Jadavpur', 'Prince Gulam Hussain Shah Rd, Jadavpur', 'West Bengal', '700032', '2', 'US/East-Indiana', 'https://ijklmno.com', 'undefined', 'N', 'Y', 'H', 0, 'C', 1000.00, '2023-06-09', NULL, 'undefined', 'N', NULL, 'Y', 'Y', 'sayantika@synergicsoftek.in', '2023-06-09 07:43:51', '20', '2023-06-09 08:05:30'),
(24, '2023-06-24 10:15:45', 'Deja Brew', 'Sudeshna Sen', 'HR', '8583949565', '8583949565', '8583949565', '8583949565', 'sayantika.dhar04+3@gmail.com', 'Prince Gulam Hussain Shah Road', 'Prince Gulam Hussain Shah Road', 'kolkata', '700032', '2', 'Asia/Calcutta', 'https://qrstuv.com', 'undefined', 'N', 'N', 'H', 0, 'P', 0.00, NULL, NULL, 'undefined', 'N', NULL, 'N', 'N', 'sayantika.dhar04+3@gmail.com', '2023-06-24 10:15:45', NULL, NULL),
(25, '2023-06-30 09:36:14', 'The Asian Santaroni', 'Poulomi Nath', 'Manager', '7648930214', '4536271889', '89234567234', '4536271889', 'shamim@synergicsoftek.in', 'K.M.Royuchowdhury Road, Rajour, Kolkata- 700151', 'K.M.Royuchowdhury Road, Rajour, Kolkata- 700151', 'Kolkata', '00151', '2', 'Asia/Calcutta', 'aaa', 'undefined', 'Y', 'Y', 'H', 0, 'C', 50000.00, '2023-07-03', NULL, 'undefined', 'N', NULL, 'Y', 'Y', 'poulomi@synergicsoftek.in', '2023-06-30 09:36:14', '25', '2023-07-03 06:36:24'),
(26, '2023-06-30 11:33:43', 'Deja Brew', 'Sayani Sinha', 'HR', '8583949565', '8583949565', '8583949565', '8583949565', 'sayantika.dhar04+4@gmail.com', 'Prince Gulam Hussain Shah ', 'Prince Gulam Hussain Shah ', 'West Bengal', '700032', '2', 'Asia/Calcutta', 'https://uvwxyz.com', 'undefined', 'Y', 'Y', 'H', 0, 'C', 1000.00, '2023-07-01', NULL, 'undefined', 'N', NULL, 'Y', 'Y', 'sayantika.dhar04+4@gmail.com', '2023-06-30 11:33:43', '26', '2023-07-01 06:15:27'),
(27, '2023-07-04 06:50:33', 'Beachside Getaway', 'Jason Wine', 'Executive', '24697452', '24697452', '24697452', '24697452', 'shamim+1@synergicsoftek.in', '2566 Hc 1, Glennallen, Alaska 99588, USA', '1522 Cohoe Ct, Kenai, Alaska 99611, USA', 'Alaska ', '99611', '3', 'Canada/Newfoundland', 'aaa', 'undefined', 'Y', 'Y', 'H', 0, 'C', 40000.00, '2023-07-04', NULL, 'undefined', 'N', NULL, 'Y', 'Y', 'shamim+1@synergicsoftek.in', '2023-07-04 06:50:33', '27', '2023-07-04 11:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `td_contact_us`
--

CREATE TABLE `td_contact_us` (
  `id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `c_name` varchar(100) DEFAULT NULL,
  `c_web` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_contact_us`
--

INSERT INTO `td_contact_us` (`id`, `f_name`, `l_name`, `email`, `phone_no`, `c_name`, `c_web`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 08:41:01', NULL, NULL),
(2, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 08:43:56', NULL, NULL),
(3, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 08:55:49', NULL, NULL),
(4, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 08:59:17', NULL, NULL),
(5, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 09:45:55', NULL, NULL),
(6, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 09:47:09', NULL, NULL),
(7, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '2023-05-27 09:48:23', NULL, NULL),
(8, 'utsab', 'lastname', 'a@aaa.com', 'undefined', 'com name', 'com web', 'System', '2023-05-27 09:50:36', NULL, NULL),
(9, 'utsab', 'lastname', 'a@aaa.com', 'undefined', 'com name', 'com web', 'System', '2023-05-27 09:52:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_date_time`
--

CREATE TABLE `td_date_time` (
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') NOT NULL COMMENT 'S :Service R :Restaurant',
  `srv_res_id` int(10) NOT NULL COMMENT 'Service (S):td_quest_service Restaurant (R) :td_quest_res_bars	',
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast L:Lunch D:Dinner R:Brunch S:Special A:Bar V:Menu Service',
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `month_day` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_date_time`
--

INSERT INTO `td_date_time` (`hotel_id`, `srv_res_flag`, `srv_res_id`, `menu_id`, `active_flag`, `month_day`, `start_time`, `end_time`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(25, 'S', 38, 'A', 'Y', 2, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 38, 'A', 'Y', 3, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 38, 'A', 'Y', 4, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 38, 'A', 'Y', 5, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 38, 'A', 'Y', 6, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 38, 'A', 'Y', 7, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 38, 'A', 'Y', 8, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:20', NULL, NULL),
(25, 'S', 80, 'V', 'Y', 2, '07:00:00', '16:00:00', '25', '2023-07-03 10:02:17', NULL, NULL),
(25, 'S', 80, 'V', 'Y', 4, '07:00:00', '16:00:00', '25', '2023-07-03 10:02:17', NULL, NULL),
(25, 'S', 80, 'V', 'Y', 5, '07:00:00', '16:00:00', '25', '2023-07-03 10:02:17', NULL, NULL),
(25, 'S', 80, 'V', 'Y', 6, '07:00:00', '16:00:00', '25', '2023-07-03 10:02:17', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 2, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 3, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 4, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 5, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 6, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 7, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(25, 'S', 81, 'V', 'Y', 8, '07:00:00', '20:00:00', '25', '2023-07-03 10:02:31', NULL, NULL),
(1, 'R', 1, 'B', 'Y', 3, '08:00:00', '12:00:00', '1', '2023-03-21 12:59:25', '1', '2023-03-21 13:02:41'),
(1, 'R', 1, 'B', 'Y', 4, '08:00:00', '12:00:00', '1', '2023-03-21 12:59:25', '1', '2023-03-21 13:02:41'),
(1, 'R', 1, 'B', 'Y', 5, '08:00:00', '12:00:00', '1', '2023-03-21 12:59:38', '1', '2023-03-21 13:02:41'),
(1, 'R', 1, 'B', 'Y', 6, '08:00:00', '12:00:00', '1', '2023-03-21 12:59:25', '1', '2023-03-21 13:02:41'),
(1, 'R', 1, 'L', 'Y', 2, '12:10:00', '23:00:00', '1', '2023-03-21 13:03:55', NULL, NULL),
(1, 'R', 1, 'L', 'Y', 3, '12:10:00', '23:00:00', '1', '2023-03-21 13:03:55', NULL, NULL),
(1, 'R', 1, 'L', 'Y', 4, '12:10:00', '23:00:00', '1', '2023-03-21 13:03:55', NULL, NULL),
(1, 'R', 1, 'L', 'Y', 5, '12:10:00', '23:00:00', '1', '2023-03-21 13:03:55', NULL, NULL),
(1, 'R', 1, 'A', 'Y', 2, '16:10:00', '23:59:00', '1', '2023-03-21 13:06:21', NULL, NULL),
(1, 'R', 1, 'A', 'Y', 3, '16:10:00', '23:59:00', '1', '2023-03-21 13:06:21', NULL, NULL),
(1, 'R', 1, 'A', 'Y', 5, '16:10:00', '23:59:00', '1', '2023-03-21 13:06:21', NULL, NULL),
(1, 'R', 1, 'A', 'Y', 6, '16:10:00', '23:59:00', '1', '2023-03-21 13:06:21', NULL, NULL),
(1, 'R', 1, 'A', 'Y', 8, '16:10:00', '23:59:00', '1', '2023-03-21 13:06:21', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 2, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 3, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 4, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 5, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 6, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 7, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 38, 'A', 'Y', 8, '18:00:00', '23:00:00', '25', '2023-07-03 10:00:30', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 2, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 3, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 4, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 5, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 6, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 7, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 39, 'B', 'Y', 8, '06:00:00', '11:00:00', '25', '2023-07-03 09:59:08', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 2, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 3, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 4, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 5, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 6, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 7, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 44, 'R', 'Y', 8, '12:00:00', '15:00:00', '25', '2023-07-03 10:01:03', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 2, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 3, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 4, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 5, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 6, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 7, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(25, 'R', 45, 'A', 'Y', 8, '00:00:00', '04:00:00', '25', '2023-07-03 10:01:40', NULL, NULL),
(26, 'R', 62, 'A', 'Y', 2, '13:14:00', '16:14:00', '26', '2023-07-03 07:45:07', NULL, NULL),
(26, 'R', 62, 'A', 'Y', 3, '13:14:00', '16:14:00', '26', '2023-07-03 07:45:07', NULL, NULL),
(26, 'R', 62, 'A', 'Y', 6, '13:14:00', '16:14:00', '26', '2023-07-03 07:45:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_directory_live`
--

CREATE TABLE `td_directory_live` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `fd_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `wifi_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `rs_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `ent_cal` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'ENTERTAINMENT Calendar',
  `photo_ops` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'PHOTO OPS',
  `con_faq` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'CONCIERGE FAQs',
  `fun_dir` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'FUN DIRECTORY',
  `promo` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'PROMOTIONS',
  `saf_faq` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'SAFETY FAQs',
  `hot_faq` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'HOTEL FAQ''s',
  `lost_found` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'LOST & FOUND',
  `sug_box` enum('Y','N') NOT NULL COMMENT 'SUGGESTION BOX',
  `flip_book` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'VACATION BOOK',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_directory_live`
--

INSERT INTO `td_directory_live` (`id`, `hotel_id`, `fd_flag`, `wifi_flag`, `rs_flag`, `ent_cal`, `photo_ops`, `con_faq`, `fun_dir`, `promo`, `saf_faq`, `hot_faq`, `lost_found`, `sug_box`, `flip_book`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL, NULL, 'undefined', '2023-07-03 13:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `td_directory_setup`
--

CREATE TABLE `td_directory_setup` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `bg_col` varchar(30) NOT NULL,
  `txt_col` varchar(30) NOT NULL,
  `bord_col` varchar(30) NOT NULL,
  `expansion_col` varchar(30) NOT NULL,
  `font_family` varchar(100) NOT NULL,
  `header_size` varchar(20) NOT NULL,
  `subheader_size` varchar(20) NOT NULL,
  `bord_thickness` varchar(20) NOT NULL,
  `other_size` varchar(20) NOT NULL,
  `div_img` text DEFAULT NULL,
  `msg_btn_col` varchar(50) NOT NULL,
  `inner_border_col` varchar(50) DEFAULT NULL,
  `wifi_pass` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_directory_setup`
--

INSERT INTO `td_directory_setup` (`id`, `hotel_id`, `bg_col`, `txt_col`, `bord_col`, `expansion_col`, `font_family`, `header_size`, `subheader_size`, `bord_thickness`, `other_size`, `div_img`, `msg_btn_col`, `inner_border_col`, `wifi_pass`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, '#f599e3', '#e90c22', '#0b446f', '#e6c4f8', 'Times New Roman, serif', '18.72px', '16px', '8px', '16px', 'https://customapi.shoplocal-lagunabeach.com/stock/divider-g7d5556867_1280.png', '#a5dfee', '#0ae1f0', 'Test', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `td_directory_setup_img`
--

CREATE TABLE `td_directory_setup_img` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `section` varchar(100) NOT NULL,
  `img_path` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_directory_setup_img`
--

INSERT INTO `td_directory_setup_img` (`id`, `hotel_id`, `section`, `img_path`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'hotelf_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cyclists.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:57:21'),
(2, 1, 'promotions_img', 'https://customapi.shoplocal-lagunabeach.com/stock/thanksgiving.jpeg', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:57:21'),
(3, 1, 'lost_found_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_white/lost-found.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(4, 1, 'entertainment_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera-2.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(5, 1, 'banner2_img', 'https://customapi.shoplocal-lagunabeach.com/stock/mothers_day.jpg', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:18:44'),
(6, 1, 'photo_ops_img', 'https://customapi.shoplocal-lagunabeach.com/stock/birthday.jpg', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:57:21'),
(7, 1, 'rs_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/bellboy trolley.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(8, 1, 'con_faq_img', 'https://customapi.shoplocal-lagunabeach.com/stock/icons_color/enter-win.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:57:21'),
(9, 1, 'banner1_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cup.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(10, 1, 'fun_directory_img', 'https://customapi.shoplocal-lagunabeach.com/stock/icons_color/drinks.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(11, 1, 'vacation_img', 'https://customapi.shoplocal-lagunabeach.com/directory/1_2.jpg', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:40:51'),
(12, 1, 'fd_img', 'https://customapi.shoplocal-lagunabeach.com/directory/1_4.jpg', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 10:37:05'),
(13, 1, 'safety_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/coke-n-burger.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(14, 1, 'suggestion_img', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_white/restaurant-sign.png', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-26 10:49:50'),
(15, 1, 'cover', 'https://customapi.shoplocal-lagunabeach.com/stock/HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'undefined', '2023-06-02 05:59:57', 'undefined', '2023-06-27 07:45:16'),
(16, 1, 'fdCall', 'https://customapi.shoplocal-lagunabeach.com/stock/icons_color/ice-cream.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(17, 2, 'restaurant_img_0', 'directory/1_HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'undefined', '2023-06-08 16:24:37', NULL, NULL),
(18, 2, 'restaurant_img_1', 'directory/1_HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'undefined', '2023-06-08 16:24:37', NULL, NULL),
(19, 1, 'rsMenu', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/bellboy trolley.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(20, 1, 'rsCall', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera-2.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(21, 1, 'rsOrder', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/concierge.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(22, 1, 'entView', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(23, 1, 'photoOps', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cyclists.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(24, 1, 'conFaqIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/concierge.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(25, 1, 'funDirIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/burger.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(26, 1, 'promoIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/fries.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(27, 1, 'safetyIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/spa-studio.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(28, 1, 'hotelFaqIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/waiter-drinks-3.png', 'undefined', '2023-06-08 16:24:37', 'undefined', '2023-06-27 10:57:21'),
(29, 1, 'lostFoundCall', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/restaurant-sign.png', 'undefined', '2023-06-08 16:24:38', 'undefined', '2023-06-27 10:57:21'),
(30, 1, 'lostFoundView', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/reception-bell.png', 'undefined', '2023-06-08 16:24:38', 'undefined', '2023-06-27 10:57:21'),
(31, 1, 'SuggBoxIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/receptionist.png', 'undefined', '2023-06-08 16:24:38', 'undefined', '2023-06-27 10:57:21'),
(32, 1, 'VacBookIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/music-notes.png', 'undefined', '2023-06-08 16:24:38', 'undefined', '2023-06-27 10:57:21'),
(33, 20, 'fdCall', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/concierge.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(34, 20, 'banner2_img', 'directory/20_room.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(35, 20, 'fd_img', 'directory/20_front.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(36, 20, 'cover', 'directory/20_book.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(37, 20, 'rs_img', 'directory/20_room.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(38, 20, 'photo_ops_img', 'directory/20_photo.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(39, 20, 'banner1_img', 'directory/20_concierge.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(40, 20, 'hotelf_img', 'directory/20_photo.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(41, 20, 'entertainment_img', 'directory/20_golf.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(42, 20, 'con_faq_img', 'directory/20_concierge.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(43, 20, 'fun_directory_img', 'directory/20_cycling.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(44, 20, 'undefined', 'directory/20_cycling.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(45, 20, 'lost_found_img', 'directory/20_concierge.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(46, 20, 'undefined', 'directory/20_cycling.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(47, 20, 'safety_img', 'directory/20_room.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(48, 20, 'suggestion_img', 'directory/20_photo.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(49, 20, 'vacation_img', 'directory/20_cycling.jpg', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(50, 20, 'rsMenu', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/coke-n-burger.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(51, 20, 'rsCall', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cup.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(52, 20, 'rsOrder', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cutlery.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(53, 20, 'entView', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/golfer.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(54, 20, 'photoOps', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera-2.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(55, 20, 'conFaqIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/reception-bell.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(56, 20, 'funDirIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cyclists.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(57, 20, 'promoIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/suggestions.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(58, 20, 'safetyIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/music-notes.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(59, 20, 'hotelFaqIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/limo.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(60, 20, 'lostFoundCall', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/office-chair.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(61, 20, 'lostFoundView', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/presents.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(62, 20, 'SuggBoxIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(63, 20, 'VacBookIcon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/restaurant-sign.png', 'undefined', '2023-06-10 11:19:18', NULL, NULL),
(64, 1, 'undefined', 'directory/1_rs_farm.jpeg', 'undefined', '2023-06-11 08:07:23', 'undefined', '2023-06-17 11:10:58'),
(65, 1, 'undefined', 'directory/1_gall3.jpeg', 'undefined', '2023-06-11 08:07:23', NULL, NULL),
(66, 1, 'TriggerFish_ent_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/fish-bones.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(67, 1, 'PoolBar_menu_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/concierge.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(68, 1, 'PoolBar_reserve_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/limo.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(69, 1, 'PoolBar_ent_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/fun.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(70, 1, 'Gym_menu_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/shopper-1.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(71, 1, 'Gym_services_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/suggestions.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(72, 1, 'Gym_cal_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/question.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(73, 1, 'Spa_menu_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/icons_color/severe-weather-circle.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(74, 1, 'Spa_services_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/sunbed-umbrella.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(75, 1, 'Spa_cal_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/crab.png', 'undefined', '2023-06-11 08:58:10', 'undefined', '2023-06-27 10:57:21'),
(76, 1, 'wifiCall', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera.png', 'undefined', '2023-06-16 05:36:24', 'undefined', '2023-06-27 10:57:21'),
(77, 1, 'Trigger Fish', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/fish-bones.png', 'undefined', '2023-06-17 10:48:00', NULL, NULL),
(78, 1, 'Pool Bar', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/fun.png', 'undefined', '2023-06-17 10:48:00', 'undefined', '2023-06-17 10:48:00'),
(79, 1, 'Room Service', 'undefined', 'undefined', '2023-06-17 10:48:00', 'undefined', '2023-06-17 10:48:00'),
(80, 1, 'Gym', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/question.png', 'undefined', '2023-06-17 10:48:00', 'undefined', '2023-06-17 10:48:00'),
(81, 1, 'Spa', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/crab.png', 'undefined', '2023-06-17 10:48:00', 'undefined', '2023-06-17 10:48:00'),
(82, 1, 'RoomService_ent_icon', 'undefined', 'undefined', '2023-06-17 10:55:29', 'undefined', '2023-06-17 11:18:52'),
(83, 1, 'TriggerFish_menu_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/camera-2.png', 'undefined', '2023-06-17 10:56:38', 'undefined', '2023-06-27 10:57:21'),
(84, 1, 'TriggerFish_reserve_icon', 'https://customapi.shoplocal-lagunabeach.com/stock/PNG_black/cutlery.png', 'undefined', '2023-06-17 10:56:38', 'undefined', '2023-06-27 10:57:21'),
(85, 1, 'RoomService_menu_icon', 'undefined', 'undefined', '2023-06-17 10:56:39', 'undefined', '2023-06-17 11:18:52'),
(86, 1, 'RoomService_reserve_icon', 'undefined', 'undefined', '2023-06-17 10:56:39', 'undefined', '2023-06-17 11:18:52'),
(94, 1, 'restaurant_img_0', 'directory/1_3..jpg', 'undefined', '2023-06-17 11:18:52', 'undefined', '2023-06-26 10:12:30'),
(95, 1, 'restaurant_img_1', 'directory/1_gall3.jpeg', 'undefined', '2023-06-17 11:18:52', NULL, NULL),
(96, 1, 'restaurant_img', 'https://customapi.shoplocal-lagunabeach.com/directory/1_3..jpg,https://customapi.shoplocal-lagunabeach.com/directory/1_gall3.jpeg', 'undefined', '2023-06-21 07:31:57', 'undefined', '2023-06-27 10:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `td_emergency_rec_report`
--

CREATE TABLE `td_emergency_rec_report` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `record_date` date NOT NULL,
  `guest_group_id` int(11) NOT NULL,
  `message_body` text NOT NULL,
  `repo_status` enum('P','S','F') NOT NULL DEFAULT 'P' COMMENT 'P-> pending; S-> solved; F-> forwarded',
  `action_taken` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_emergency_rec_report`
--

INSERT INTO `td_emergency_rec_report` (`id`, `hotel_id`, `record_date`, `guest_group_id`, `message_body`, `repo_status`, `action_taken`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, '2023-01-04', 22, 'A guy was murdered.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'P', 'Under investigation', 'undefined', '2023-01-20 13:19:40', 'undefined', '2023-05-03 06:51:54'),
(2, 1, '2023-01-26', 22, 'A storm is coming', 'S', 'It was chased away', 'undefined', '2023-01-20 13:20:47', 'undefined', '2023-05-03 05:29:16'),
(3, 1, '2023-01-25', 22, 'Lots of bugs in the bed', 'F', 'Nothing yet', 'undefined', '2023-01-20 13:26:53', NULL, NULL),
(4, 1, '2023-01-01', 22, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', 'P', 'Still waiting.', 'undefined', '2023-01-20 17:47:43', 'undefined', '2023-05-03 07:00:51'),
(5, 12, '2023-03-10', 22, 'fvefvevevebbrtb', 'P', 'tbrtrtgtr', 'undefined', '2023-03-10 07:46:42', NULL, NULL),
(6, 1, '2023-04-04', 22, 'egsgsdsdg', 'P', 'gsdgsdgklmmmm', 'undefined', '2023-04-04 10:27:22', 'undefined', '2023-05-15 12:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `td_emp_schedule`
--

CREATE TABLE `td_emp_schedule` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `msg_type` varchar(2) NOT NULL COMMENT 'H-> Hotel; E-> Emergency; V-> VIP; M->employee; G-> Group',
  `emp_id` int(11) NOT NULL COMMENT 'td_guest_user -> id',
  `emp_code` int(11) NOT NULL,
  `day_dt` int(11) NOT NULL,
  `date_on_off` enum('Y','N') NOT NULL,
  `start_time` time DEFAULT '00:00:00',
  `end_time` time DEFAULT '00:00:00',
  `approve_flag` enum('A','U') NOT NULL DEFAULT 'U' COMMENT 'A-> Approved; U-> un approved',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_emp_schedule`
--

INSERT INTO `td_emp_schedule` (`id`, `hotel_id`, `msg_type`, `emp_id`, `emp_code`, `day_dt`, `date_on_off`, `start_time`, `end_time`, `approve_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'M', 10, 4, 1, 'N', '01:03:00', '00:03:00', 'A', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 17:01:17'),
(2, 1, 'M', 10, 4, 2, 'Y', '00:00:00', '00:00:00', 'U', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 16:59:34'),
(3, 1, 'M', 10, 4, 3, 'Y', '00:00:00', '00:00:00', 'U', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 16:59:35'),
(4, 1, 'M', 10, 4, 4, 'N', '02:04:00', '11:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 16:59:37'),
(5, 1, 'M', 10, 4, 5, 'Y', '00:00:00', '00:00:00', 'U', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 12:42:38'),
(6, 1, 'M', 10, 4, 6, 'N', '04:05:00', '02:03:00', 'A', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 16:59:40'),
(7, 1, 'M', 10, 4, 7, 'Y', '00:00:00', '00:00:00', 'U', 'admin@gmail.com', '2023-02-09 11:09:46', 'somnath.thakur16@gmail.com', '2023-02-20 16:59:41'),
(15, 1, 'H', 11, 2, 1, 'N', '03:11:00', '04:16:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(16, 1, 'H', 11, 2, 2, 'N', '01:15:00', '05:18:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(17, 1, 'H', 11, 2, 3, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(18, 1, 'H', 11, 2, 4, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(19, 1, 'H', 11, 2, 5, 'N', '02:15:00', '05:18:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(20, 1, 'H', 11, 2, 6, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(21, 1, 'H', 11, 2, 7, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(22, 1, 'E', 11, 2, 1, 'N', '03:11:00', '04:16:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(23, 1, 'E', 11, 2, 2, 'N', '01:15:00', '05:18:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(24, 1, 'E', 11, 2, 3, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(25, 1, 'E', 11, 2, 4, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(26, 1, 'E', 11, 2, 5, 'N', '02:15:00', '05:18:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(27, 1, 'E', 11, 2, 6, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(28, 1, 'E', 11, 2, 7, 'Y', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 11:12:24', NULL, NULL),
(50, 1, 'E', 13, 6, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(51, 1, 'E', 13, 6, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(52, 1, 'E', 13, 6, 3, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(53, 1, 'E', 13, 6, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(54, 1, 'E', 13, 6, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(55, 1, 'E', 13, 6, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(56, 1, 'E', 13, 6, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(57, 1, 'V', 13, 6, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(58, 1, 'V', 13, 6, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(59, 1, 'V', 13, 6, 3, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(60, 1, 'V', 13, 6, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(61, 1, 'V', 13, 6, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(62, 1, 'V', 13, 6, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(63, 1, 'V', 13, 6, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:07:40', NULL, NULL),
(64, 1, 'E', 14, 6, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(65, 1, 'E', 14, 6, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(66, 1, 'E', 14, 6, 3, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(67, 1, 'E', 14, 6, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(68, 1, 'E', 14, 6, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(69, 1, 'E', 14, 6, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(70, 1, 'E', 14, 6, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(71, 1, 'V', 14, 6, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(72, 1, 'V', 14, 6, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(73, 1, 'V', 14, 6, 3, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(74, 1, 'V', 14, 6, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(75, 1, 'V', 14, 6, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(76, 1, 'V', 14, 6, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(77, 1, 'V', 14, 6, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:08:45', NULL, NULL),
(78, 1, 'E', 15, 6, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(79, 1, 'E', 15, 6, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(80, 1, 'E', 15, 6, 3, 'N', '00:02:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(81, 1, 'E', 15, 6, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(82, 1, 'E', 15, 6, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(83, 1, 'E', 15, 6, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(84, 1, 'E', 15, 6, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(85, 1, 'V', 15, 6, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(86, 1, 'V', 15, 6, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(87, 1, 'V', 15, 6, 3, 'N', '00:02:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(88, 1, 'V', 15, 6, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(89, 1, 'V', 15, 6, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(90, 1, 'V', 15, 6, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(91, 1, 'V', 15, 6, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:10:55', NULL, NULL),
(92, 1, 'G', 16, 4, 1, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(93, 1, 'G', 16, 4, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(94, 1, 'G', 16, 4, 3, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(95, 1, 'G', 16, 4, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(96, 1, 'G', 16, 4, 5, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(97, 1, 'G', 16, 4, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(98, 1, 'G', 16, 4, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(99, 1, 'M', 16, 4, 1, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', 'admin@gmail.com', '2023-02-15 10:36:26'),
(100, 1, 'M', 16, 4, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(101, 1, 'M', 16, 4, 3, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(102, 1, 'M', 16, 4, 4, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', 'admin@gmail.com', '2023-02-15 10:36:26'),
(103, 1, 'M', 16, 4, 5, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(104, 1, 'M', 16, 4, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(105, 1, 'M', 16, 4, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-09 14:31:31', NULL, NULL),
(106, 1, 'M', 15, 5, 1, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-15 10:35:00', NULL, NULL),
(107, 1, 'M', 15, 5, 4, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-15 10:35:00', NULL, NULL),
(108, 1, 'M', 17, 5, 1, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-15 10:38:38', NULL, NULL),
(109, 1, 'M', 17, 5, 4, 'N', '00:00:00', '23:59:00', 'A', 'admin@gmail.com', '2023-02-15 10:38:38', NULL, NULL),
(110, 1, 'M', 18, 5, 1, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(111, 1, 'M', 18, 5, 2, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(112, 1, 'M', 18, 5, 3, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(113, 1, 'M', 18, 5, 4, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(114, 1, 'M', 18, 5, 5, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(115, 1, 'M', 18, 5, 6, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(116, 1, 'M', 18, 5, 7, 'N', '00:00:00', '00:00:00', 'A', 'admin@gmail.com', '2023-02-15 10:45:05', NULL, NULL),
(117, 1, 'E', 20, 0, 1, 'Y', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(118, 1, 'E', 20, 0, 2, 'N', '00:00:00', '00:00:00', 'A', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(119, 1, 'E', 20, 0, 3, 'N', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(120, 1, 'E', 20, 0, 4, 'N', '00:00:00', '00:00:00', 'A', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(121, 1, 'E', 20, 0, 5, 'N', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(122, 1, 'E', 20, 0, 6, 'Y', '00:00:00', '00:00:00', 'A', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(123, 1, 'E', 20, 0, 7, 'N', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:34:41', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 12:46:58'),
(124, 1, 'M', 12, 6, 1, 'Y', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(125, 1, 'M', 12, 6, 2, 'N', '00:00:00', '23:59:00', 'A', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(126, 1, 'M', 12, 6, 3, 'Y', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(127, 1, 'M', 12, 6, 4, 'Y', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(128, 1, 'M', 12, 6, 5, 'N', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(129, 1, 'M', 12, 6, 6, 'N', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(130, 1, 'M', 12, 6, 7, 'Y', '00:00:00', '00:00:00', 'U', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:16', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:00:56'),
(131, 1, 'U', 34, 2, 1, 'N', '10:00:00', '23:00:00', 'A', 'admin@gmail.com', '2023-02-28 08:00:16', 'admin@gmail.com', '2023-02-28 08:00:56'),
(132, 1, 'E', 34, 2, 1, 'Y', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL),
(133, 1, 'E', 34, 2, 2, 'Y', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL),
(134, 1, 'E', 34, 2, 3, 'N', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL),
(135, 1, 'E', 34, 2, 4, 'N', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL),
(136, 1, 'E', 34, 2, 5, 'N', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL),
(137, 1, 'E', 34, 2, 6, 'N', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL),
(138, 1, 'E', 34, 2, 7, 'N', '00:00:00', '00:00:00', 'U', 'sayantika.dhar4@gmail.com', '2023-05-15 10:42:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_faq`
--

CREATE TABLE `td_faq` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `faq_type` enum('C','H','S') DEFAULT NULL COMMENT 'C-> Concerge; H-> Hotel; S-> Safety',
  `quest` varchar(100) DEFAULT NULL,
  `ans` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_faq`
--

INSERT INTO `td_faq` (`id`, `hotel_id`, `faq_type`, `quest`, `ans`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(2, 1, 'C', 'Hey how are you?', 'I am okay', 'somnath.thakur16@gmail.com', '2023-03-08 11:53:35', 'somnath.thakur16@gmail.com', '2023-03-13 15:13:22'),
(3, 1, 'C', 'abdfnadbfn', 'ajrywj78888', 'somnath.thakur16@gmail.com', '2023-03-08 11:53:35', 'somnath.thakur16@gmail.com', '2023-03-08 12:11:33'),
(4, 1, 'C', 'Not feeling like going out?', 'I would like to stay home', 'somnath.thakur16@gmail.com', '2023-03-08 12:11:33', 'somnath.thakur16@gmail.com', '2023-03-13 15:13:22'),
(5, 1, 'H', 'A', 'V', 'somnath.thakur16@gmail.com', '2023-03-09 05:00:07', 'null', '2023-05-03 05:32:39'),
(6, 1, 'H', 'B', 'N', 'somnath.thakur16@gmail.com', '2023-03-09 05:00:07', 'null', '2023-05-03 05:32:39'),
(7, 1, 'H', 'Is it good?', 'Very Good.', 'somnath.thakur16@gmail.com', '2023-03-09 05:00:07', 'null', '2023-05-03 05:32:39'),
(8, 1, 'S', 'Who investigated ', 'Byomkesh Bakshi.', 'somnath.thakur16@gmail.com', '2023-03-09 05:02:03', 'somnath.thakur16@gmail.com', '2023-05-03 10:05:18'),
(9, 1, 'S', 'Who investigated ', 'Byomkesh Bakshi.', 'somnath.thakur16@gmail.com', '2023-03-09 05:02:03', 'somnath.thakur16@gmail.com', '2023-05-03 10:05:18'),
(10, 1, 'S', 'Who investigated ', 'Byomkesh Bakshi.', 'somnath.thakur16@gmail.com', '2023-03-09 05:02:03', 'somnath.thakur16@gmail.com', '2023-05-03 10:05:18'),
(11, 1, 'S', 'Who investigated ', 'Byomkesh Bakshi.', 'somnath.thakur16@gmail.com', '2023-03-09 05:02:03', 'somnath.thakur16@gmail.com', '2023-05-03 10:05:18'),
(12, 12, 'S', 'What are the THA Safety Protocols?', 'As part of the Hotels Safety Protocol, our top priority is maintaining the highest levels of safety in accordance with each country’s local regulations. Prevention steps include disinfecting all key entry points, including buffet areas and high touch points in public areas. A personalized contactless service is being offered throughout our properties wherever possible. Our team members’ health is monitored, and they receive regular Covid prevention training. In addition, we continuously monitor indoor air quality, and select hotels are adding CO2 meters in areas such as meeting rooms and fitness centers.', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:33:36', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:39:14'),
(13, 12, 'S', 'PCR testing ?', 'To facilitate the return of travel, Hotels are able to direct guests to an easily accessible and affordable PCR testing location. In addition, selected hotels will offer PCR testing on location for groups or individuals, or self-sampling PCR tests via the Group’s specialized partners.', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:33:36', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:39:14'),
(14, 12, 'S', 'Access to medical assistance for your peace of mind', 'Our hotel teams are ready to assist to help ensure the safety and well-being of everyone. As part of our continued efforts to help our guests enjoy a relaxed stay with us, our hotels can provide information on locally available medical assistance and support. If you or someone in your traveling party are feeling ill, our team members will do all they can to connect guests with the best locally available resources and local medical advisors. Our team can advise you on the nearest pharmacies and stores to purchase personal protective equipment kits, masks, and other medical necessities.', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:33:36', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:39:14'),
(15, 12, 'S', 'What is your smoking policy?', 'Healthier. Happier. Fresher. Our Hotel is committed to catering to the needs of all guests. A designated smoking area is located on the 2nd floor for your convenience. However, usage of shisha, cigarettes, vape pens, and e-cigarettes is prohibited in all guest rooms. A fee equivalent to Php 10,000.00 per incident will be charged to your account if a smoking incident occurs in your room during your stay. ', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:36:22', 'mondal.tanmoy@synergicsoftek.com', '2023-03-09 07:38:51'),
(16, 1, 'S', 'Who investigated ', 'Byomkesh Bakshi.', 'somnath.thakur16@gmail.com', '2023-05-03 10:05:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_flipbook`
--

CREATE TABLE `td_flipbook` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `guest_name` varchar(50) NOT NULL,
  `room_no` int(11) NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `flip_url` text DEFAULT NULL,
  `flip_back_img` text DEFAULT NULL,
  `border_color` varchar(50) DEFAULT NULL,
  `text_color` varchar(50) DEFAULT NULL,
  `send_flag` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Y-> Yes; N->No',
  `send_date` datetime DEFAULT NULL,
  `approve_flag` enum('A','R','P') NOT NULL DEFAULT 'P' COMMENT 'A-> Accept; R->Reject; P->Pending',
  `pay_amt` float(10,2) NOT NULL DEFAULT 0.00,
  `no_of_pages` int(11) NOT NULL DEFAULT 0,
  `pay_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `addition_flag` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Additional pages active',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_flipbook`
--

INSERT INTO `td_flipbook` (`id`, `hotel_id`, `guest_id`, `guest_name`, `room_no`, `check_in`, `check_out`, `flip_url`, `flip_back_img`, `border_color`, `text_color`, `send_flag`, `send_date`, `approve_flag`, `pay_amt`, `no_of_pages`, `pay_flag`, `addition_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 29, 'Shane Watson', 6, '2023-03-01 20:48:00', '2023-03-30 20:48:00', 'flip/1', 'flipBook/angular-line-chart.png', NULL, NULL, 'N', NULL, 'A', 0.00, 0, 'N', 'N', 'undefined', '2023-03-20 11:17:46', 'somnath.thakur16@gmail.com', '2023-03-20 13:22:05'),
(2, 1, 23, 'Nick Carter', 6, '2023-02-28 00:00:00', '2023-03-10 00:00:00', 'flip/2', 'flipBook/directory-header-smart.png', NULL, NULL, 'N', NULL, 'A', 0.00, 0, 'N', 'N', 'undefined', '2023-03-20 12:29:59', 'somnath.thakur16@gmail.com', '2023-03-20 12:42:29'),
(3, 1, 24, 'Shane Filan', 7, '2023-03-01 00:00:00', '2023-03-31 00:00:00', 'flip/3', 'flipBook/sampleimage1.jpeg', NULL, NULL, 'N', NULL, 'A', 0.00, 0, 'N', 'N', 'undefined', '2023-03-20 15:42:16', 'somnath.thakur16@gmail.com', '2023-03-20 15:49:14'),
(5, 1, 33, 'Justin Langer', 6, '2023-03-15 20:49:00', '2023-03-25 20:49:00', 'flip/4', NULL, NULL, NULL, 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-22 06:35:04', NULL, NULL),
(6, 1, 26, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-03-30 00:00:00', 'flip/6', NULL, NULL, NULL, 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-22 10:21:25', NULL, NULL),
(7, 1, 25, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-03-30 00:00:00', 'flip/7', NULL, NULL, NULL, 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-23 06:44:41', NULL, NULL),
(8, 1, 1, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-03-30 00:00:00', 'flip/8', NULL, NULL, NULL, 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-24 08:56:52', NULL, NULL),
(9, 1, 2, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-03-30 00:00:00', 'flip/9', NULL, NULL, NULL, 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-28 12:28:32', NULL, NULL),
(10, 1, 3, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/10', NULL, 'undefined', 'undefined', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-30 11:04:24', NULL, NULL),
(11, 1, 4, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/11', NULL, '#e62d2d', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-30 11:19:12', NULL, NULL),
(12, 1, 5, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/12', NULL, '#dd2c2c', '#320b0b', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-30 11:21:22', NULL, NULL),
(13, 1, 6, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/13', NULL, '#d72828', '#0f86a3', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-03-30 11:31:55', NULL, NULL),
(16, 1, 7, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/16', NULL, '#ee1717', '#320b0b', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-01 10:22:53', NULL, NULL),
(17, 1, 8, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/17', NULL, '', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-01 15:24:39', NULL, NULL),
(18, 1, 9, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/18', NULL, '#ac1616', '#b80a0a', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-03 05:32:27', NULL, NULL),
(19, 1, 10, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/19', NULL, '#3100e0', '#e60000', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-03 05:42:15', NULL, NULL),
(20, 1, 11, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/20', NULL, '#308acf', '#ed0202', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-03 06:05:33', NULL, NULL),
(21, 1, 12, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/21', NULL, '#e01f1f', '#d92b0d', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-03 06:21:25', NULL, NULL),
(22, 1, 13, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-04-30 00:00:00', 'flip/22', NULL, '#df6c20', '#ffffff', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-04-06 16:28:24', NULL, NULL),
(23, 1, 23, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-05-30 00:00:00', 'flip/23', NULL, '#f07070', '#fffafa', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-05-06 12:37:10', NULL, NULL),
(24, 1, 24, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-05-30 00:00:00', 'flip/24', NULL, '', '#3e5ea8', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-05-08 08:58:18', NULL, NULL),
(25, 1, 25, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-05-30 00:00:00', 'flip/25', NULL, '#ff5cf1', '#ffc31f', 'N', NULL, 'P', 550.00, 12, 'Y', 'N', 'undefined', '2023-05-08 11:01:49', 'undefined', '2023-05-31 12:55:09'),
(26, 1, 26, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/26', NULL, '#0a032b', '#050123', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-01 10:48:08', NULL, NULL),
(27, 1, 27, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/27', NULL, '', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-05 07:04:09', NULL, NULL),
(28, 1, 28, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/28', NULL, '', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-05 07:13:12', NULL, NULL),
(29, 1, 29, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/29', NULL, '', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-05 07:18:05', NULL, NULL),
(30, 1, 30, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/30', NULL, '', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-05 07:23:01', NULL, NULL),
(31, 1, 31, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/31', NULL, '', '', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-05 07:27:08', NULL, NULL),
(32, 1, 32, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/32', NULL, '', '', 'N', NULL, 'P', 14.99, 5, 'Y', 'Y', 'undefined', '2023-06-05 07:27:08', 'undefined', '2023-06-07 05:05:23'),
(33, 1, 33, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/33', NULL, '', '#ffea00', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-06 05:48:21', NULL, NULL),
(34, 1, 34, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/34', NULL, '', '', 'N', NULL, 'P', 14.99, 5, 'Y', 'Y', 'undefined', '2023-06-06 12:39:13', 'undefined', '2023-06-28 16:39:21'),
(35, 1, 35, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/35', NULL, '#969696', '#ffffff', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-27 12:06:41', NULL, NULL),
(36, 1, 36, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/36', NULL, '#233120', '#fff2b3', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-27 13:01:42', NULL, NULL),
(37, 1, 37, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/37', NULL, '#625555', '#d09f9f', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-27 13:28:14', NULL, NULL),
(38, 1, 22, 'Nick Carter', 6, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 'flip/38', NULL, '#00ffff', '#00ffff', 'N', NULL, 'P', 0.00, 0, 'N', 'N', 'undefined', '2023-06-28 09:57:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_flipbook_caption`
--

CREATE TABLE `td_flipbook_caption` (
  `id` int(11) NOT NULL,
  `flip_id` int(11) NOT NULL COMMENT 'td_flipbook->id',
  `sl_no` int(11) NOT NULL,
  `flip_title` varchar(100) DEFAULT NULL,
  `flip_body` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_flipbook_caption`
--

INSERT INTO `td_flipbook_caption` (`id`, `flip_id`, `sl_no`, `flip_title`, `flip_body`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 16, 2, 'Header cofghsfghsdhmes here!', 'Your text shdaghdfh!', 'undefined', '2023-04-01 10:22:57', NULL, NULL),
(2, 16, 1, 'adfgdfsgga', 'adfgasgsgsdg', 'undefined', '2023-04-01 10:22:57', NULL, NULL),
(3, 16, 3, 'ertfhdfgh', 'ktfghmfgh', 'undefined', '2023-04-01 10:22:57', NULL, NULL),
(4, 17, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:24:40', NULL, NULL),
(5, 17, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:24:40', NULL, NULL),
(6, 17, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:24:40', NULL, NULL),
(7, 17, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:52:33', NULL, NULL),
(8, 17, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:52:33', NULL, NULL),
(9, 17, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:52:33', NULL, NULL),
(10, 17, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:52:33', NULL, NULL),
(11, 17, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:52:33', NULL, NULL),
(12, 17, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-04-01 15:52:33', NULL, NULL),
(13, 19, 1, 'asdfsdfa', 'Your textsasadfasdf', 'undefined', '2023-04-03 05:42:21', NULL, NULL),
(14, 19, 2, 'asdfsadfasdfsadf', 'Yasddfsadfsadfsdsf', 'undefined', '2023-04-03 05:42:21', NULL, NULL),
(15, 19, 3, 'asdfasdfadfsasdf', 'asdfafdsafdsafsd', 'undefined', '2023-04-03 05:42:21', NULL, NULL),
(16, 20, 3, 'This is my third header', 'This is my third text!', 'undefined', '2023-04-03 06:07:02', NULL, NULL),
(17, 20, 1, 'This is my inner page', 'This is my first text!', 'undefined', '2023-04-03 06:07:02', NULL, NULL),
(18, 20, 2, 'This is my second header', 'This is my second text', 'undefined', '2023-04-03 06:07:02', NULL, NULL),
(19, 21, 2, 'This is my third header', 'This is my third text!', 'undefined', '2023-04-03 06:21:27', NULL, NULL),
(20, 21, 3, 'This is my second header', 'This is my second text', 'undefined', '2023-04-03 06:21:27', NULL, NULL),
(21, 21, 1, 'This is my first header', 'This is my first text!', 'undefined', '2023-04-03 06:21:27', NULL, NULL),
(22, 22, 1, 'This is my first header', 'This is my first caption', 'undefined', '2023-04-06 16:28:30', NULL, NULL),
(23, 22, 2, 'This is my third header', 'This is my third caption', 'undefined', '2023-04-06 16:28:30', NULL, NULL),
(24, 22, 3, 'This is my second header', 'This is my second caption', 'undefined', '2023-04-06 16:28:30', NULL, NULL),
(25, 23, 3, 'Ekhane itachi', 'Itachi ekta darun anime character', 'undefined', '2023-05-06 12:37:18', NULL, NULL),
(26, 23, 1, 'hebby lagchhe', 'Eta hebby hoyechhe bhai darun lagchhe ekdom byapok lagchhe janish to bhai!', 'undefined', '2023-05-06 12:37:18', NULL, NULL),
(27, 23, 2, 'Cholo anime dekhi', 'Anime dekhte amar hebby lage bhai', 'undefined', '2023-05-06 12:37:18', NULL, NULL),
(28, 23, 2, 'fsdgsdhhsjfhs', 'gdssdgsdgdgsdgs', 'undefined', '2023-05-08 08:47:52', NULL, NULL),
(29, 23, 3, 'sdghdhdfhfd', 'gsdfhhdfshdfhfd', 'undefined', '2023-05-08 08:47:52', NULL, NULL),
(30, 23, 1, 'sdffdggsgsa', 'sdfgshsfh', 'undefined', '2023-05-08 08:47:52', NULL, NULL),
(31, 23, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:54:51', NULL, NULL),
(32, 23, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:54:51', NULL, NULL),
(33, 23, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:54:51', NULL, NULL),
(34, 24, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:58:27', NULL, NULL),
(35, 24, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:58:27', NULL, NULL),
(36, 24, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:58:27', NULL, NULL),
(37, 24, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:58:27', NULL, NULL),
(38, 24, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:58:27', NULL, NULL),
(39, 24, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-05-08 08:58:27', NULL, NULL),
(40, 25, 1, 'my first header', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industryLorem Ipsum is simply dummy text of the pr', 'undefined', '2023-05-08 11:01:52', NULL, NULL),
(41, 25, 3, 'my second header', 'Lorem Ipsum is simply dummy text of the', 'undefined', '2023-05-08 11:01:52', NULL, NULL),
(42, 25, 2, 'my third header', 'Lorem Ipsum is simply dummy text of the printing', 'undefined', '2023-05-08 11:01:52', NULL, NULL),
(43, 26, 1, 'Where does it come', 'Your text here!Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at ', 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(44, 26, 3, 'Where can I get so', 'There are many variations of passages', 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(45, 26, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(46, 27, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:04:11', NULL, NULL),
(47, 27, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:04:11', NULL, NULL),
(48, 27, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:04:11', NULL, NULL),
(49, 28, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:13:15', NULL, NULL),
(50, 28, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:13:15', NULL, NULL),
(51, 28, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:13:15', NULL, NULL),
(52, 29, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:18:32', NULL, NULL),
(53, 29, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:18:32', NULL, NULL),
(54, 29, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:18:32', NULL, NULL),
(55, 30, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:23:04', NULL, NULL),
(56, 30, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:23:04', NULL, NULL),
(57, 30, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:23:04', NULL, NULL),
(58, 31, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:27:13', NULL, NULL),
(59, 31, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:27:13', NULL, NULL),
(60, 31, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 07:27:13', NULL, NULL),
(61, 32, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 10:29:10', NULL, NULL),
(62, 32, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 10:29:10', NULL, NULL),
(63, 32, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-05 10:29:10', NULL, NULL),
(64, 33, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-06 05:48:23', NULL, NULL),
(65, 33, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-06 05:48:23', NULL, NULL),
(66, 33, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-06 05:48:23', NULL, NULL),
(67, 34, 1, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-06 12:39:17', NULL, NULL),
(68, 34, 2, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-06 12:39:17', NULL, NULL),
(69, 34, 3, 'Header comes here!', 'Your text here!', 'undefined', '2023-06-06 12:39:17', NULL, NULL),
(70, 36, 1, 'This is random ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley', 'undefined', '2023-06-27 13:01:43', NULL, NULL),
(71, 36, 3, 'aribbass eta kobe ', 'Lorem Ipsum is simply dummy text of the ', 'undefined', '2023-06-27 13:01:43', NULL, NULL),
(72, 37, 1, 'This is my random ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley', 'undefined', '2023-06-27 13:28:19', NULL, NULL),
(73, 37, 3, 'another hahahaha', 'ohohohoho ishq tera tadpave', 'undefined', '2023-06-27 13:28:19', NULL, NULL),
(74, 38, 1, 'FchzjydYzddtdzdzgz', 'FtxuxtugcigcigcihcigcwkbCiwhCwihCwiHczihwcihwfzhifouqgghjjnvjjnjhfdbjutjvfgjgfhhghh', 'undefined', '2023-06-28 09:57:32', NULL, NULL),
(75, 38, 3, 'Header comes here!', 'Tttgrffgyyyytrggfcghii', 'undefined', '2023-06-28 09:57:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_flipbook_img`
--

CREATE TABLE `td_flipbook_img` (
  `id` int(11) NOT NULL,
  `flip_id` int(11) NOT NULL COMMENT 'td_flipbook->id',
  `img_catg` enum('C','O') DEFAULT NULL COMMENT 'C-> Cover; O-> Page Images',
  `img_path` text DEFAULT NULL,
  `img_title` varchar(100) DEFAULT NULL,
  `img_height` float(10,2) NOT NULL DEFAULT 0.00,
  `img_width` float(10,3) NOT NULL DEFAULT 0.000,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_flipbook_img`
--

INSERT INTO `td_flipbook_img` (`id`, `flip_id`, `img_catg`, `img_path`, `img_title`, `img_height`, `img_width`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'C', 'flipBook/Shane_Watson_H1_R6/angular-line-chart.png', 'vgg', 0.00, 0.000, 'undefined', '2023-03-20 11:17:46', NULL, NULL),
(2, 1, 'O', 'flipBook/Shane_Watson_H1_R6/angular-line-chart.png', 'sdgsdggds', 0.00, 0.000, 'undefined', '2023-03-20 11:17:48', NULL, NULL),
(3, 1, 'O', 'flipBook/Shane_Watson_H1_R6/beach-chair.jpeg', 'dsgsdgsd', 0.00, 0.000, 'undefined', '2023-03-20 11:17:49', NULL, NULL),
(4, 1, 'O', 'flipBook/Shane_Watson_H1_R6/back_cover.png', 'gsdgsdgdsag', 0.00, 0.000, 'undefined', '2023-03-20 11:17:49', NULL, NULL),
(5, 1, 'O', 'flipBook/Shane_Watson_H1_R6/angular-line-chart.png', 'sdgsdggds', 0.00, 0.000, 'undefined', '2023-03-20 11:17:48', NULL, NULL),
(6, 1, 'O', 'flipBook/Shane_Watson_H1_R6/beach-chair.jpeg', 'dsgsdgsd', 0.00, 0.000, 'undefined', '2023-03-20 11:17:49', NULL, NULL),
(7, 1, 'O', 'flipBook/Shane_Watson_H1_R6/back_cover.png', 'gsdgsdgdsag', 0.00, 0.000, 'undefined', '2023-03-20 11:17:49', NULL, NULL),
(8, 1, 'O', 'flipBook/Shane_Watson_H1_R6/beach-chair.jpeg', 'dsgsdgsd', 0.00, 0.000, 'undefined', '2023-03-20 11:17:49', NULL, NULL),
(9, 1, 'O', 'flipBook/Shane_Watson_H1_R6/back_cover.png', 'gsdgsdgdsag', 0.00, 0.000, 'undefined', '2023-03-20 11:17:49', NULL, NULL),
(10, 2, 'C', 'flipBook/Nick_Carter_H1_R6/20-black-wallpaper.1366.jpg', 'Our Holidays!!!!!!!', 0.00, 0.000, 'undefined', '2023-03-20 12:29:59', NULL, NULL),
(11, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0096.JPG', 'Image 2', 0.00, 0.000, 'undefined', '2023-03-20 12:29:59', NULL, NULL),
(12, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0100.JPG', 'Image 4', 0.00, 0.000, 'undefined', '2023-03-20 12:29:59', NULL, NULL),
(13, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0090.JPG', 'Image 1', 0.00, 0.000, 'undefined', '2023-03-20 12:29:59', NULL, NULL),
(14, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0106.JPG', 'Image 6', 0.00, 0.000, 'undefined', '2023-03-20 12:30:00', NULL, NULL),
(15, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0112.JPG', 'Image 7', 0.00, 0.000, 'undefined', '2023-03-20 12:30:00', NULL, NULL),
(16, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0097.JPG', 'Image 3', 0.00, 0.000, 'undefined', '2023-03-20 12:30:00', NULL, NULL),
(17, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0101.JPG', 'Image 5', 0.00, 0.000, 'undefined', '2023-03-20 12:30:00', NULL, NULL),
(18, 2, 'O', 'flipBook/Nick_Carter_H1_R6/IMG_0118.JPG', 'Image 8', 0.00, 0.000, 'undefined', '2023-03-20 12:30:00', NULL, NULL),
(19, 3, 'C', 'flipBook/Shane_Filan_H1_R7/front-cover.png', 'Family Vacation', 0.00, 0.000, 'undefined', '2023-03-20 15:42:16', NULL, NULL),
(20, 3, 'O', 'flipBook/Shane_Filan_H1_R7/img1.jpeg', 'Image 3', 0.00, 0.000, 'undefined', '2023-03-20 15:42:16', NULL, NULL),
(21, 3, 'O', 'flipBook/Shane_Filan_H1_R7/img4.jpeg', 'Image 5', 0.00, 0.000, 'undefined', '2023-03-20 15:42:17', NULL, NULL),
(22, 3, 'O', 'flipBook/Shane_Filan_H1_R7/upload.png', 'Image 6', 0.00, 0.000, 'undefined', '2023-03-20 15:42:17', NULL, NULL),
(23, 3, 'O', 'flipBook/Shane_Filan_H1_R7/sampleimage5.jpeg', 'Image 8', 0.00, 0.000, 'undefined', '2023-03-20 15:42:18', NULL, NULL),
(24, 3, 'O', 'flipBook/Shane_Filan_H1_R7/sampleimage3.jpeg', 'Image 7', 0.00, 0.000, 'undefined', '2023-03-20 15:42:19', NULL, NULL),
(25, 3, 'O', 'flipBook/Shane_Filan_H1_R7/beach-chair.jpeg', 'Image 2', 0.00, 0.000, 'undefined', '2023-03-20 15:42:19', NULL, NULL),
(26, 3, 'O', 'flipBook/Shane_Filan_H1_R7/back_cover.png', 'Image 1', 0.00, 0.000, 'undefined', '2023-03-20 15:42:20', NULL, NULL),
(27, 3, 'O', 'flipBook/Shane_Filan_H1_R7/img3.jpeg', 'Image 4', 0.00, 0.000, 'undefined', '2023-03-20 15:42:22', NULL, NULL),
(28, 4, 'C', 'flipBook/Justin_Langer_H1_R6/back_cover.png', 'asggasfgsa', 0.00, 0.000, 'undefined', '2023-03-21 08:39:02', NULL, NULL),
(29, 4, 'O', 'flipBook/Justin_Langer_H1_R6/angular-line-chart.png', 'asdggdsgdsa', 0.00, 0.000, 'undefined', '2023-03-21 08:39:02', NULL, NULL),
(30, 4, 'O', 'flipBook/Justin_Langer_H1_R6/img_avatar.png', 'dgasgasdgasd', 0.00, 0.000, 'undefined', '2023-03-21 08:39:02', NULL, NULL),
(31, 4, 'O', 'flipBook/Justin_Langer_H1_R6/qr-code.png', 'asdgas', 0.00, 0.000, 'undefined', '2023-03-21 08:39:03', NULL, NULL),
(32, 4, 'O', 'flipBook/Justin_Langer_H1_R6/photo_(1).jpg', 'gasdgasdgasd', 0.00, 0.000, 'undefined', '2023-03-21 08:39:04', NULL, NULL),
(33, 4, 'O', 'flipBook/Justin_Langer_H1_R6/photo.jpg', 'gasdgasdg', 0.00, 0.000, 'undefined', '2023-03-21 08:39:04', NULL, NULL),
(34, 4, 'O', 'flipBook/Justin_Langer_H1_R6/beach-chair.jpeg', 'adgsdgsaagsgas', 0.00, 0.000, 'undefined', '2023-03-21 08:39:04', NULL, NULL),
(35, 4, 'O', 'flipBook/Justin_Langer_H1_R6/back_cover.png', 'dgsdgsagsad', 0.00, 0.000, 'undefined', '2023-03-21 08:39:05', NULL, NULL),
(36, 4, 'O', 'flipBook/Justin_Langer_H1_R6/BIT_MESRA_certificate.jpg', 'adfgwegsegas', 0.00, 0.000, 'undefined', '2023-03-21 08:39:05', NULL, NULL),
(37, 5, 'C', 'flipBook/Justin_Langer_H1_R6/angular-line-chart.png', 'Family Vacation', 0.00, 0.000, 'undefined', '2023-03-22 06:35:04', NULL, NULL),
(38, 5, 'O', 'flipBook/Justin_Langer_H1_R6/img_avatar.png', 'img7', 0.00, 0.000, 'undefined', '2023-03-22 06:35:21', NULL, NULL),
(39, 5, 'O', 'flipBook/Justin_Langer_H1_R6/angular-line-chart.png', 'img1', 0.00, 0.000, 'undefined', '2023-03-22 06:35:23', NULL, NULL),
(40, 5, 'O', 'flipBook/Justin_Langer_H1_R6/photo.jpg', 'img8', 0.00, 0.000, 'undefined', '2023-03-22 06:35:39', NULL, NULL),
(41, 5, 'O', 'flipBook/Justin_Langer_H1_R6/beach-chair.jpeg', 'img3', 0.00, 0.000, 'undefined', '2023-03-22 06:36:04', NULL, NULL),
(42, 5, 'O', 'flipBook/Justin_Langer_H1_R6/back_cover.png', 'img2', 0.00, 0.000, 'undefined', '2023-03-22 06:36:27', NULL, NULL),
(43, 5, 'O', 'flipBook/Justin_Langer_H1_R6/BIT_MESRA_certificate.jpg', 'img4', 0.00, 0.000, 'undefined', '2023-03-22 06:37:13', NULL, NULL),
(44, 5, 'O', 'flipBook/Justin_Langer_H1_R6/form09022023.jpg', 'img6', 0.00, 0.000, 'undefined', '2023-03-22 06:37:33', NULL, NULL),
(45, 5, 'O', 'flipBook/Justin_Langer_H1_R6/forget_yesterday_-_mock_up.png', 'img5', 0.00, 0.000, 'undefined', '2023-03-22 06:39:33', NULL, NULL),
(46, 13, 'C', 'flipBook/Nick_Carter_H1_R6/front-cover.png', 'Family Vacation', 0.00, 0.000, 'undefined', '2023-03-22 10:21:25', NULL, NULL),
(47, 6, 'O', 'flipBook/Nick_Carter_H1_R6/img_avatar.png', 'Avatar', 0.00, 0.000, 'undefined', '2023-03-22 10:21:26', NULL, NULL),
(48, 6, 'O', 'flipBook/Nick_Carter_H1_R6/pie.png', 'Pie', 0.00, 0.000, 'undefined', '2023-03-22 10:21:26', NULL, NULL),
(49, 6, 'O', 'flipBook/Nick_Carter_H1_R6/photo.jpg', 'Ampr', 0.00, 0.000, 'undefined', '2023-03-22 10:21:26', NULL, NULL),
(50, 6, 'O', 'flipBook/Nick_Carter_H1_R6/beach-chair.jpeg', 'Chair', 0.00, 0.000, 'undefined', '2023-03-22 10:21:26', NULL, NULL),
(51, 6, 'O', 'flipBook/Nick_Carter_H1_R6/img_forest.jpeg', 'Bridge', 0.00, 0.000, 'undefined', '2023-03-22 10:21:26', NULL, NULL),
(52, 6, 'O', 'flipBook/Nick_Carter_H1_R6/back_cover.png', 'Front', 0.00, 0.000, 'undefined', '2023-03-22 10:21:28', NULL, NULL),
(53, 6, 'O', 'flipBook/Nick_Carter_H1_R6/front-cover.png', 'Vacation with caption', 0.00, 0.000, 'undefined', '2023-03-22 10:21:29', NULL, NULL),
(54, 6, 'O', 'flipBook/Nick_Carter_H1_R6/BIT_MESRA_certificate.jpg', 'BIT', 0.00, 0.000, 'undefined', '2023-03-22 10:21:30', NULL, NULL),
(55, 7, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', 'Cover', 0.00, 0.000, 'undefined', '2023-03-23 06:44:41', NULL, NULL),
(56, 7, 'O', 'flipBook/Nick_Carter_H1_R6/beach-chair.jpeg', 'First', 0.00, 0.000, 'undefined', '2023-03-23 06:44:42', NULL, NULL),
(57, 7, 'O', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'Fourth', 0.00, 0.000, 'undefined', '2023-03-23 06:44:42', NULL, NULL),
(58, 7, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage13.jpeg', 'Fifth', 0.00, 0.000, 'undefined', '2023-03-23 06:44:42', NULL, NULL),
(59, 7, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage5.jpeg', 'sixth', 0.00, 0.000, 'undefined', '2023-03-23 06:44:42', NULL, NULL),
(60, 7, 'O', 'flipBook/Nick_Carter_H1_R6/BIT_MESRA_certificate.jpg', 'Second', 0.00, 0.000, 'undefined', '2023-03-23 06:44:44', NULL, NULL),
(61, 7, 'O', 'flipBook/Nick_Carter_H1_R6/forget_yesterday_-_mock_up.png', 'Third', 0.00, 0.000, 'undefined', '2023-03-23 06:44:53', NULL, NULL),
(62, 7, 'O', 'flipBook/Nick_Carter_H1_R6/beach-back.jpeg', 'Seven', 0.00, 0.000, 'undefined', '2023-03-23 06:45:34', NULL, NULL),
(63, 8, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', '', 0.00, 0.000, 'undefined', '2023-03-24 08:56:52', NULL, NULL),
(64, 8, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', '', 0.00, 0.000, 'undefined', '2023-03-24 09:39:19', NULL, NULL),
(65, 8, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', '', 0.00, 0.000, 'undefined', '2023-03-24 09:49:00', NULL, NULL),
(66, 9, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', '', 0.00, 0.000, 'undefined', '2023-03-28 12:28:32', NULL, NULL),
(67, 9, 'O', 'flipBook/Nick_Carter_H1_R6/img_avatar.png', '', 0.00, 0.000, 'undefined', '2023-03-28 12:28:33', NULL, NULL),
(68, 10, 'C', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'This is our cover', 0.00, 0.000, 'undefined', '2023-03-30 11:04:24', NULL, NULL),
(69, 10, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage2.jpeg', 'Second img', 0.00, 0.000, 'undefined', '2023-03-30 11:04:24', NULL, NULL),
(70, 10, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage4.jpeg', 'Fourth Img', 0.00, 0.000, 'undefined', '2023-03-30 11:04:25', NULL, NULL),
(71, 10, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage1.jpeg', 'First img', 0.00, 0.000, 'undefined', '2023-03-30 11:04:25', NULL, NULL),
(72, 10, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage3.jpeg', 'Third img', 0.00, 0.000, 'undefined', '2023-03-30 11:04:25', NULL, NULL),
(73, 10, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage5.jpeg', 'Fifth Img', 0.00, 0.000, 'undefined', '2023-03-30 11:04:25', NULL, NULL),
(74, 11, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:19:12', NULL, NULL),
(75, 11, 'O', 'flipBook/Nick_Carter_H1_R6/cross.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:19:13', NULL, NULL),
(76, 11, 'O', 'flipBook/Nick_Carter_H1_R6/baeach-anondo.avif', '', 0.00, 0.000, 'undefined', '2023-03-30 11:19:14', NULL, NULL),
(77, 11, 'O', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:19:14', NULL, NULL),
(78, 11, 'O', 'flipBook/Nick_Carter_H1_R6/back_cover.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:19:15', NULL, NULL),
(79, 12, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', 'dsdsds', 0.00, 0.000, 'undefined', '2023-03-30 11:21:22', NULL, NULL),
(80, 12, 'O', 'flipBook/Nick_Carter_H1_R6/img_avatar.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:21:23', NULL, NULL),
(81, 12, 'O', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', '', 0.00, 0.000, 'undefined', '2023-03-30 11:21:24', NULL, NULL),
(82, 12, 'O', 'flipBook/Nick_Carter_H1_R6/img_forest.jpeg', '', 0.00, 0.000, 'undefined', '2023-03-30 11:21:24', NULL, NULL),
(83, 12, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage2.jpeg', '', 0.00, 0.000, 'undefined', '2023-03-30 11:21:24', NULL, NULL),
(84, 12, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage1.jpeg', '', 0.00, 0.000, 'undefined', '2023-03-30 11:21:24', NULL, NULL),
(85, 0, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', 'ffffff', 0.00, 0.000, 'undefined', '2023-03-30 11:31:55', NULL, NULL),
(86, 0, 'O', 'flipBook/Nick_Carter_H1_R6/cross.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:31:56', NULL, NULL),
(87, 0, 'O', 'flipBook/Nick_Carter_H1_R6/beach-chair.jpeg', '', 0.00, 0.000, 'undefined', '2023-03-30 11:31:57', NULL, NULL),
(88, 0, 'O', 'flipBook/Nick_Carter_H1_R6/back_cover.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:31:58', NULL, NULL),
(89, 0, 'O', 'flipBook/Nick_Carter_H1_R6/forget_yesterday_-_mock_up.png', '', 0.00, 0.000, 'undefined', '2023-03-30 11:32:08', NULL, NULL),
(90, 0, 'O', 'flipBook/Nick_Carter_H1_R6/beach-back.jpeg', '', 0.00, 0.000, 'undefined', '2023-03-30 11:32:28', NULL, NULL),
(112, 16, 'C', 'flipBook/Nick_Carter_H1_R6/front-cover.png', 'HAHAHAHAHA', 0.00, 0.000, 'undefined', '2023-04-01 10:22:53', NULL, NULL),
(113, 16, 'O', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'undefined', 247.00, 158.000, 'undefined', '2023-04-01 10:22:55', NULL, NULL),
(114, 16, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage2.jpeg', 'undefined', 125.00, 134.000, 'undefined', '2023-04-01 10:22:55', NULL, NULL),
(115, 16, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage7.webp', 'undefined', 141.00, 149.000, 'undefined', '2023-04-01 10:22:56', NULL, NULL),
(116, 16, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage10.png', 'undefined', 210.00, 120.000, 'undefined', '2023-04-01 10:22:56', NULL, NULL),
(117, 16, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage13.jpeg', 'undefined', 170.00, 140.000, 'undefined', '2023-04-01 10:22:57', NULL, NULL),
(118, 17, 'C', 'flipBook/Nick_Carter_H1_R6/bigstock-Contemplative-Spa-578099_(1).jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-04-01 15:24:39', NULL, NULL),
(119, 17, 'C', 'flipBook/Nick_Carter_H1_R6/bigstock-Contemplative-Spa-578099_(1).jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-04-01 15:52:19', NULL, NULL),
(120, 19, 'C', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', 'Hiii', 0.00, 0.000, 'undefined', '2023-04-03 05:42:15', NULL, NULL),
(121, 19, 'O', 'flipBook/Nick_Carter_H1_R6/back_cover.png', 'undefined', 179.00, 98.000, 'undefined', '2023-04-03 05:42:20', NULL, NULL),
(122, 19, 'O', 'flipBook/Nick_Carter_H1_R6/book.gif', 'undefined', 157.00, 153.000, 'undefined', '2023-04-03 05:42:20', NULL, NULL),
(123, 19, 'O', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'undefined', 297.00, 135.000, 'undefined', '2023-04-03 05:42:20', NULL, NULL),
(124, 19, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage3.jpeg', 'undefined', 251.00, 166.000, 'undefined', '2023-04-03 05:42:21', NULL, NULL),
(125, 19, 'O', 'flipBook/Nick_Carter_H1_R6/forget_yesterday_-_mock_up.png', 'undefined', 324.00, 166.000, 'undefined', '2023-04-03 05:42:23', NULL, NULL),
(126, 20, 'C', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'This is my cover title', 0.00, 0.000, 'undefined', '2023-04-03 06:05:33', NULL, NULL),
(127, 20, 'O', 'flipBook/Nick_Carter_H1_R6/img_avatar.png', 'undefined', 208.00, 123.000, 'undefined', '2023-04-03 06:05:37', NULL, NULL),
(128, 20, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage1.jpeg', 'undefined', 241.00, 153.000, 'undefined', '2023-04-03 06:05:38', NULL, NULL),
(129, 21, 'C', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'The cover text', 0.00, 0.000, 'undefined', '2023-04-03 06:21:25', NULL, NULL),
(130, 21, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage4.jpeg', 'undefined', 194.00, 102.000, 'undefined', '2023-04-03 06:21:26', NULL, NULL),
(131, 21, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage10.png', 'undefined', 146.00, 100.000, 'undefined', '2023-04-03 06:21:26', NULL, NULL),
(132, 21, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage1.jpeg', 'undefined', 243.00, 151.000, 'undefined', '2023-04-03 06:21:27', NULL, NULL),
(133, 21, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage3.jpeg', 'undefined', 281.00, 140.000, 'undefined', '2023-04-03 06:21:27', NULL, NULL),
(134, 21, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage5.jpeg', 'undefined', 189.00, 94.000, 'undefined', '2023-04-03 06:21:27', NULL, NULL),
(135, 22, 'C', 'flipBook/Nick_Carter_H1_R6/samplecover2.jpeg', 'This is my cover text!', 0.00, 0.000, 'undefined', '2023-04-06 16:28:24', NULL, NULL),
(136, 22, 'O', 'flipBook/Nick_Carter_H1_R6/cross.png', 'undefined', 197.00, 156.000, 'undefined', '2023-04-06 16:28:26', NULL, NULL),
(137, 22, 'O', 'flipBook/Nick_Carter_H1_R6/sampleimage1.jpeg', 'undefined', 245.00, 155.000, 'undefined', '2023-04-06 16:28:29', NULL, NULL),
(138, 22, 'O', 'flipBook/Nick_Carter_H1_R6/img_avatar.png', 'undefined', 310.00, 158.000, 'undefined', '2023-04-06 16:28:29', NULL, NULL),
(139, 22, 'O', 'flipBook/Nick_Carter_H1_R6/angular-line-chart.png', 'undefined', 287.00, 167.000, 'undefined', '2023-04-06 16:28:29', NULL, NULL),
(140, 22, 'O', 'flipBook/Nick_Carter_H1_R6/back_cover.png', 'undefined', 237.00, 153.000, 'undefined', '2023-04-06 16:28:32', NULL, NULL),
(141, 23, 'C', 'flipBook/Nick_Carter_H1_R6/HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'Itachi was here', 0.00, 0.000, 'undefined', '2023-05-06 12:37:10', NULL, NULL),
(142, 23, 'O', 'flipBook/Nick_Carter_H1_R6/blob', 'undefined', 229.11, 180.891, 'undefined', '2023-05-06 12:37:13', NULL, NULL),
(143, 23, 'O', 'flipBook/Nick_Carter_H1_R6/blob', 'undefined', 229.11, 180.891, 'undefined', '2023-05-06 12:37:13', NULL, NULL),
(144, 23, 'O', 'flipBook/Nick_Carter_H1_R6/blob', 'undefined', 229.11, 180.891, 'undefined', '2023-05-06 12:37:15', NULL, NULL),
(145, 23, 'O', 'flipBook/Nick_Carter_H1_R6/blob', 'undefined', 179.00, 359.094, 'undefined', '2023-05-06 12:37:16', NULL, NULL),
(146, 23, 'O', 'flipBook/Nick_Carter_H1_R6/blob', 'undefined', 179.00, 262.797, 'undefined', '2023-05-06 12:37:19', NULL, NULL),
(147, 23, 'C', 'flipBook/Nick_Carter_H1_R6/aich_obit20160612.jpeg', 'ffffassaadsfsgsdh', 0.00, 0.000, 'undefined', '2023-05-08 08:47:44', NULL, NULL),
(148, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 141.344, 'undefined', '2023-05-08 08:47:48', NULL, NULL),
(149, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 141.344, 'undefined', '2023-05-08 08:47:48', NULL, NULL),
(150, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 141.344, 'undefined', '2023-05-08 08:47:49', NULL, NULL),
(151, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 180.25, 280.016, 'undefined', '2023-05-08 08:47:50', NULL, NULL),
(152, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 180.25, 210.062, 'undefined', '2023-05-08 08:47:56', NULL, NULL),
(153, 23, 'C', 'flipBook/Nick_Carter_H1_R6/anbu-anime-moon-silhouette-wallpaper-preview.jpeg', 'This is my anime', 0.00, 0.000, 'undefined', '2023-05-08 08:54:42', NULL, NULL),
(154, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 141.344, 'undefined', '2023-05-08 08:54:48', NULL, NULL),
(155, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 141.344, 'undefined', '2023-05-08 08:54:48', NULL, NULL),
(156, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 141.344, 'undefined', '2023-05-08 08:54:49', NULL, NULL),
(157, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 180.25, 210.062, 'undefined', '2023-05-08 08:54:50', NULL, NULL),
(158, 23, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 180.25, 280.016, 'undefined', '2023-05-08 08:54:56', NULL, NULL),
(159, 24, 'C', 'flipBook/Nick_Carter_H1_R6/anbu-anime-moon-silhouette-wallpaper-preview.jpeg', 'This is my anime', 0.00, 0.000, 'undefined', '2023-05-08 08:58:18', NULL, NULL),
(160, 24, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 303.422, 'undefined', '2023-05-08 08:58:22', NULL, NULL),
(161, 24, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 303.422, 'undefined', '2023-05-08 08:58:22', NULL, NULL),
(162, 24, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 230.72, 303.422, 'undefined', '2023-05-08 08:58:24', NULL, NULL),
(163, 24, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 180.25, 426.172, 'undefined', '2023-05-08 08:58:25', NULL, NULL),
(164, 24, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg', 'undefined', 180.25, 604.156, 'undefined', '2023-05-08 08:58:32', NULL, NULL),
(165, 25, 'C', 'flipBook/Nick_Carter_H1_R6/abstractcover.webp', 'My Flipbook', 0.00, 0.000, 'undefined', '2023-05-08 11:01:49', NULL, NULL),
(166, 25, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8094204807969614', 'undefined', 200.31, 180.891, 'undefined', '2023-05-08 11:01:50', NULL, NULL),
(167, 25, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.9162401522211419', 'undefined', 200.31, 180.891, 'undefined', '2023-05-08 11:01:50', NULL, NULL),
(168, 25, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.29967134122814065', 'undefined', 200.31, 180.891, 'undefined', '2023-05-08 11:01:51', NULL, NULL),
(169, 25, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6056162555472997', 'undefined', 156.50, 262.797, 'undefined', '2023-05-08 11:01:52', NULL, NULL),
(170, 25, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.540996452922808', 'undefined', 156.50, 359.094, 'undefined', '2023-05-08 11:01:54', NULL, NULL),
(171, 26, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Our dessert safari', 0.00, 0.000, 'undefined', '2023-06-01 10:48:08', NULL, NULL),
(172, 26, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.013143299582649925', 'undefined', 210.23, 211.531, 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(173, 26, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6569257727692088', 'undefined', 164.25, 444.094, 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(174, 26, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.01573631802415698', 'undefined', 164.25, 444.094, 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(175, 26, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.3810061507993563', 'undefined', 210.23, 203.438, 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(176, 26, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.361173797998557', 'undefined', 210.23, 211.531, 'undefined', '2023-06-01 10:48:10', NULL, NULL),
(177, 27, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-05 07:04:09', NULL, NULL),
(178, 27, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.4821645484870649', 'undefined', 210.23, 211.531, 'undefined', '2023-06-05 07:04:10', NULL, NULL),
(179, 27, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6888853509097568', 'undefined', 164.25, 0.000, 'undefined', '2023-06-05 07:04:10', NULL, NULL),
(180, 27, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8777682416671684', 'undefined', 164.25, 0.000, 'undefined', '2023-06-05 07:04:10', NULL, NULL),
(181, 27, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8802688285615736', 'undefined', 210.23, 203.438, 'undefined', '2023-06-05 07:04:11', NULL, NULL),
(182, 27, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.7230237176107821', 'undefined', 210.23, 211.531, 'undefined', '2023-06-05 07:04:11', NULL, NULL),
(183, 28, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-05 07:13:12', NULL, NULL),
(184, 28, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.38267115141895114', 'undefined', 210.23, 211.531, 'undefined', '2023-06-05 07:13:14', NULL, NULL),
(185, 28, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6570363949129852', 'undefined', 164.25, 0.000, 'undefined', '2023-06-05 07:13:14', NULL, NULL),
(186, 28, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.15438407858166858', 'undefined', 164.25, 0.000, 'undefined', '2023-06-05 07:13:14', NULL, NULL),
(187, 28, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.04666786709178039', 'undefined', 210.23, 203.438, 'undefined', '2023-06-05 07:13:15', NULL, NULL),
(188, 28, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.10723259297366727', 'undefined', 210.23, 211.531, 'undefined', '2023-06-05 07:13:15', NULL, NULL),
(189, 29, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-05 07:18:05', NULL, NULL),
(190, 29, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.7582726815364782', 'undefined', 95.36, 211.531, 'undefined', '2023-06-05 07:18:08', NULL, NULL),
(191, 29, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.08294927130820429', 'undefined', 95.36, 211.531, 'undefined', '2023-06-05 07:18:09', NULL, NULL),
(192, 29, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.2540159924635359', 'undefined', 95.36, 203.438, 'undefined', '2023-06-05 07:18:11', NULL, NULL),
(193, 29, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6966557383479228', 'undefined', 74.50, 0.000, 'undefined', '2023-06-05 07:18:30', NULL, NULL),
(194, 29, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.16799126210064808', 'undefined', 74.50, 0.000, 'undefined', '2023-06-05 07:18:31', NULL, NULL),
(195, 30, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-05 07:23:01', NULL, NULL),
(196, 30, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.09608829383135076', 'undefined', 95.36, 211.531, 'undefined', '2023-06-05 07:23:03', NULL, NULL),
(197, 30, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.9488750659374396', 'undefined', 95.36, 211.531, 'undefined', '2023-06-05 07:23:03', NULL, NULL),
(198, 30, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.06359576909742648', 'undefined', 95.36, 203.438, 'undefined', '2023-06-05 07:23:03', NULL, NULL),
(199, 30, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.24210026354693048', 'undefined', 74.50, 0.000, 'undefined', '2023-06-05 07:23:03', NULL, NULL),
(200, 30, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.5988928922099186', 'undefined', 74.50, 0.000, 'undefined', '2023-06-05 07:23:03', NULL, NULL),
(201, 31, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-05 07:27:08', NULL, NULL),
(202, 31, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.9020202476260626', 'undefined', 95.36, 211.531, 'undefined', '2023-06-05 07:27:11', NULL, NULL),
(203, 31, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.18891568447044627', 'undefined', 95.36, 211.531, 'undefined', '2023-06-05 07:27:11', NULL, NULL),
(204, 31, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.7021731610729924', 'undefined', 95.36, 203.438, 'undefined', '2023-06-05 07:27:12', NULL, NULL),
(205, 31, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.5907527304489848', 'undefined', 74.50, 444.094, 'undefined', '2023-06-05 07:27:13', NULL, NULL),
(206, 31, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.22777499198383921', 'undefined', 74.50, 444.094, 'undefined', '2023-06-05 07:27:13', NULL, NULL),
(207, 32, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-05 10:29:05', NULL, NULL),
(208, 32, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8502117688132358', 'undefined', 99.52, 211.531, 'undefined', '2023-06-05 10:29:08', NULL, NULL),
(209, 32, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.18288494111789233', 'undefined', 99.52, 211.531, 'undefined', '2023-06-05 10:29:08', NULL, NULL),
(210, 32, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.35949941514748596', 'undefined', 99.52, 203.438, 'undefined', '2023-06-05 10:29:08', NULL, NULL),
(211, 32, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.9580970336297059', 'undefined', 77.75, 0.000, 'undefined', '2023-06-05 10:29:09', NULL, NULL),
(212, 32, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8993868005702388', 'undefined', 77.75, 0.000, 'undefined', '2023-06-05 10:29:09', NULL, NULL),
(213, 33, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'vdfvdfvd', 0.00, 0.000, 'undefined', '2023-06-06 05:48:21', NULL, NULL),
(214, 33, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.19251524386423813', 'undefined', 210.23, 211.531, 'undefined', '2023-06-06 05:48:22', NULL, NULL),
(215, 33, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.5474880706834611', 'undefined', 164.25, 0.000, 'undefined', '2023-06-06 05:48:22', NULL, NULL),
(216, 33, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.002870366955283865', 'undefined', 164.25, 0.000, 'undefined', '2023-06-06 05:48:23', NULL, NULL),
(217, 33, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.9318490559896953', 'undefined', 210.23, 203.438, 'undefined', '2023-06-06 05:48:23', NULL, NULL),
(218, 33, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6792170055161553', 'undefined', 210.23, 211.531, 'undefined', '2023-06-06 05:48:24', NULL, NULL),
(219, 34, 'C', 'flipBook/Nick_Carter_H1_R6/cover.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-06 12:39:13', NULL, NULL),
(220, 34, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6986099493897058', 'undefined', 91.83, 211.531, 'undefined', '2023-06-06 12:39:14', NULL, NULL),
(221, 34, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.050453192172843275', 'undefined', 91.83, 203.438, 'undefined', '2023-06-06 12:39:15', NULL, NULL),
(222, 34, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.6996555618452294', 'undefined', 91.83, 211.531, 'undefined', '2023-06-06 12:39:15', NULL, NULL),
(223, 34, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.2711648915964162', 'undefined', 71.75, 444.094, 'undefined', '2023-06-06 12:39:15', NULL, NULL),
(224, 34, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.593411429975081', 'undefined', 71.75, 444.094, 'undefined', '2023-06-06 12:39:16', NULL, NULL),
(225, 35, 'C', 'flipBook/Nick_Carter_H1_R6/book2.jpg', 'THIS IS MY RANDOM HEADER ', 0.00, 0.000, 'undefined', '2023-06-27 12:06:41', NULL, NULL),
(226, 35, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8461310373327704', 'undefined', 166.72, -5.000, 'undefined', '2023-06-27 12:06:46', NULL, NULL),
(227, 35, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.11662084873470291', 'undefined', 130.25, 344.891, 'undefined', '2023-06-27 12:06:47', NULL, NULL),
(228, 35, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.3160843081138167', 'undefined', 166.72, 0.000, 'undefined', '2023-06-27 12:06:49', NULL, NULL),
(229, 35, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.4132455198791971', 'undefined', 130.25, 344.891, 'undefined', '2023-06-27 12:06:50', NULL, NULL),
(230, 35, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.12027055011344423', 'undefined', 166.72, 0.000, 'undefined', '2023-06-27 12:06:51', NULL, NULL),
(231, 36, 'C', 'flipBook/Nick_Carter_H1_R6/book3.jpg', 'Omni ami jhuliechhi', 0.00, 0.000, 'undefined', '2023-06-27 13:01:42', NULL, NULL),
(232, 36, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.561298228609149', 'undefined', 166.72, -5.000, 'undefined', '2023-06-27 13:01:43', NULL, NULL),
(233, 36, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.4351054983356659', 'undefined', 166.72, 0.000, 'undefined', '2023-06-27 13:01:51', NULL, NULL),
(234, 36, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.1935833996228471', 'undefined', 130.25, 344.891, 'undefined', '2023-06-27 13:01:56', NULL, NULL),
(235, 36, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.9962381272837959', 'undefined', 130.25, 344.891, 'undefined', '2023-06-27 13:02:00', NULL, NULL),
(236, 36, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.18464500543191376', 'undefined', 166.72, 0.000, 'undefined', '2023-06-27 13:02:00', NULL, NULL),
(237, 37, 'C', 'flipBook/Nick_Carter_H1_R6/book1.jpg', 'This is the hahahahaah', 0.00, 0.000, 'undefined', '2023-06-27 13:28:14', NULL, NULL),
(238, 37, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.24774230317204582', 'undefined', 130.25, 344.891, 'undefined', '2023-06-27 13:28:23', NULL, NULL),
(239, 37, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.055748069519863996', 'undefined', 166.72, -5.000, 'undefined', '2023-06-27 13:28:23', NULL, NULL),
(240, 37, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.13213023199132867', 'undefined', 130.25, 344.891, 'undefined', '2023-06-27 13:28:26', NULL, NULL),
(241, 37, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.16789737351733502', 'undefined', 166.72, 0.000, 'undefined', '2023-06-27 13:28:36', NULL, NULL),
(242, 37, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.5900439541628519', 'undefined', 166.72, 0.000, 'undefined', '2023-06-27 13:28:37', NULL, NULL),
(243, 38, 'C', 'flipBook/Nick_Carter_H1_R6/IMG_20230627_180715.jpg', 'Header comes here!', 0.00, 0.000, 'undefined', '2023-06-28 09:57:28', NULL, NULL),
(244, 38, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.787259736530777', 'undefined', 258.33, 0.000, 'undefined', '2023-06-28 09:57:36', NULL, NULL),
(245, 38, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.8218130244834221', 'undefined', 201.82, 0.000, 'undefined', '2023-06-28 09:58:08', NULL, NULL),
(246, 38, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.7229520129421558', 'undefined', 201.82, 0.000, 'undefined', '2023-06-28 09:58:48', NULL, NULL),
(247, 38, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.592714246867833', 'undefined', 258.33, 0.000, 'undefined', '2023-06-28 09:59:03', NULL, NULL),
(248, 38, 'O', 'flipBook/Nick_Carter_H1_R6/cropImg0.143491682855182', 'undefined', 258.33, -5.000, 'undefined', '2023-06-28 09:59:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_flipbook_user`
--

CREATE TABLE `td_flipbook_user` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `guest_name` varchar(50) DEFAULT NULL,
  `room_no` int(11) NOT NULL,
  `flip_id` int(11) NOT NULL,
  `flip_url` varchar(50) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_flipbook_user`
--

INSERT INTO `td_flipbook_user` (`id`, `hotel_id`, `guest_id`, `guest_name`, `room_no`, `flip_id`, `flip_url`, `user_id`, `password`, `active_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 22, 'Nick Carter', 6, 32, 'flip/32', '8240404524', '$2b$10$6aY317PaZODwjuE3JF/lUuvTpk8lhGL1TYw.1T99Ih6ZLHn610jpu', 'Y', 'Nick Carter', '2023-06-05 10:42:30', NULL, NULL),
(2, 1, 22, 'Nick Carter', 6, 33, 'flip/33', '8240404524', '$2b$10$z1SXfOeopIyI9OWn/BlzJONdCJB5EwzkxlGfTQSHzkj9ELaGZzyPu', 'Y', 'Nick Carter', '2023-06-06 05:48:23', NULL, NULL),
(3, 1, 22, 'Nick Carter', 6, 34, 'flip/34', '8240404524', '$2b$10$K3SE.IXYGUck5yhd4eMgOeLASls//whgLRkWYYPAkjFKv93Iu6mVS', 'Y', 'Nick Carter', '2023-06-06 12:39:17', NULL, NULL),
(4, 1, 22, 'Nick Carter', 6, 34, 'flip/34', '8240404524', '$2b$10$wNxAp.dK9HAMLK483.Fcu.1PbIRClmf/BvrHU0iVHPhAyEQmCQMhO', 'Y', 'Nick Carter', '2023-06-06 12:44:26', NULL, NULL),
(5, 1, 22, 'Nick Carter', 6, 34, 'flip/34', '8240404524', '$2b$10$Sy9651rAdVOpkXk/8fw3VuBm3tP9pMf6aUzLCXpmd9ghVKC.HtBfG', 'Y', 'Nick Carter', '2023-06-06 12:49:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory`
--

CREATE TABLE `td_fun_directory` (
  `id` int(11) NOT NULL,
  `top_img` text DEFAULT NULL,
  `bg_color` varchar(50) DEFAULT NULL,
  `txt_color` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory`
--

INSERT INTO `td_fun_directory` (`id`, `top_img`, `bg_color`, `txt_color`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'fun_directory/hotel.png', '#13b6ec', '#ffffff', 'undefined', '2023-04-17 08:07:24', 'undefined', '2023-04-25 13:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_calendar`
--

CREATE TABLE `td_fun_directory_calendar` (
  `id` bigint(22) NOT NULL,
  `event_date` date NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_sub_title` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `tkt_url` text NOT NULL,
  `description` text NOT NULL,
  `img_path` text DEFAULT NULL,
  `cal_type` enum('O','R') NOT NULL DEFAULT 'O' COMMENT 'O-> Once; R-> Repetative',
  `cal_schedule` enum('D','W') DEFAULT NULL COMMENT 'D-> Daily; W-> Weakly',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `event_day` int(11) NOT NULL DEFAULT 0,
  `bg_color` varchar(50) DEFAULT NULL,
  `txt_color` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_calendar`
--

INSERT INTO `td_fun_directory_calendar` (`id`, `event_date`, `event_title`, `event_sub_title`, `website`, `video_url`, `tkt_url`, `description`, `img_path`, `cal_type`, `cal_schedule`, `start_date`, `end_date`, `event_time`, `event_day`, `bg_color`, `txt_color`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, '2023-04-21', 'Stand Up Comedy', 'Comedy', 'www.standup.com', 'https://www.youtube.com/embed/pKd0Rpw7O48', 'standupcomedy.com', 'a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'fun_directory/calendar_msgImg_0.1345172039413587.jpg', 'O', NULL, NULL, NULL, NULL, 0, '#f57070', 'undefined', 'null', '2023-04-20 10:38:08', 'somnath.thakur16@gmail.com,undefined', '2023-04-24 13:18:32'),
(2, '2023-04-25', 'Rock Music', 'Rock / Metal', 'www.michaeljackson.com', 'https://www.youtube.com/embed/pKd0Rpw7O48', 'mj.com', 'a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'fun_directory/calendar_msgImg_0.6063941868731153.jpg', 'R', 'D', '2023-04-22', '2023-04-25', '20:12:00', 0, '#cb1501', 'undefined', 'null', '2023-04-20 10:42:15', 'somnath.thakur16@gmail.com,undefined', '2023-04-24 13:20:24'),
(3, '2023-04-26', 'Rock Music', 'Rock / Metal', 'www.michaeljackson.com', 'https://www.youtube.com/embed/pKd0Rpw7O48', 'mj.com', 'a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'fun_directory/calendar_msgImg_0.6063941868731153.jpg', 'R', 'D', '2023-04-22', '2023-04-25', '20:12:00', 0, '#a01313', 'undefined', 'null', '2023-04-20 10:42:15', 'null,#ffffff', '2023-04-21 06:01:43'),
(4, '2023-04-27', 'Rock Music', 'Rock / Metal', 'www.michaeljackson.com', 'https://www.youtube.com/embed/pKd0Rpw7O48', 'mj.com', 'a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'fun_directory/calendar_msgImg_0.6063941868731153.jpg', 'R', 'D', '2023-04-22', '2023-04-25', '20:12:00', 0, '#c60e01', 'undefined', 'null', '2023-04-20 10:42:15', 'somnath.thakur16@gmail.com,undefined', '2023-04-24 13:20:56'),
(5, '2023-04-28', 'Rock Music', 'Rock / Metal', 'www.michaeljackson.com', 'https://www.youtube.com/embed/pKd0Rpw7O48', 'mj.com', 'a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'fun_directory/calendar_msgImg_0.6063941868731153.jpg', 'R', 'D', '2023-04-22', '2023-04-25', '20:12:00', 0, '#cc2828', 'undefined', 'null', '2023-04-20 10:42:15', 'somnath.thakur16@gmail.com,undefined', '2023-04-24 13:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_menu`
--

CREATE TABLE `td_fun_directory_menu` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'Y',
  `menu_url` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_menu`
--

INSERT INTO `td_fun_directory_menu` (`id`, `menu_name`, `active_flag`, `menu_url`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'Home', 'Y', 'Home', 'admin@gmail.com', '2023-04-17 07:30:42', 'admin@gmail.com', '2023-04-19 05:35:30'),
(2, 'Directory', 'Y', 'Directory', 'admin@gmail.com', '2023-04-17 07:33:07', 'admin@gmail.com', '2023-06-01 19:10:25'),
(3, 'Entertainment / Event Calendar', 'Y', 'Entertainment/EventCalendar', 'admin@gmail.com', '2023-04-17 07:33:30', NULL, NULL),
(4, 'Restaurants', 'Y', 'Restaurants', 'admin@gmail.com', '2023-04-17 07:30:42', 'admin@gmail.com', '2023-06-01 19:04:49'),
(5, 'Bars / Happy Hours', 'Y', 'Bars/HappyHours', 'admin@gmail.com', '2023-04-17 07:33:07', 'admin@gmail.com', '2023-04-17 07:33:16'),
(6, 'Artists', 'Y', 'Artists', 'admin@gmail.com', '2023-04-17 07:33:30', NULL, NULL),
(7, 'Gallery', 'Y', 'Gallery', 'admin@gmail.com', '2023-04-17 07:47:11', NULL, NULL),
(8, 'Shopping', 'Y', 'Shopping', 'admin@gmail.com', '2023-04-17 15:19:52', NULL, NULL),
(9, 'Fun Bar', 'N', 'FunBar', 'admin@gmail.com', '2023-04-18 05:25:46', 'admin@gmail.com', '2023-04-24 14:48:28'),
(10, 'Book Cafe', 'N', 'BookCafe', 'admin@gmail.com', '2023-04-18 05:26:00', 'admin@gmail.com', '2023-04-24 14:48:27'),
(11, 'Snack Bar', 'N', 'SnackBar', 'admin@gmail.com', '2023-04-18 05:26:09', 'admin@gmail.com', '2023-04-24 14:48:25'),
(12, 'Magnolia', 'N', 'Magnolia', 'admin@gmail.com', '2023-04-18 05:26:18', 'admin@gmail.com', '2023-04-24 14:48:24'),
(13, 'Fight Club', 'N', 'FightClub', 'admin@gmail.com', '2023-04-18 05:26:24', 'admin@gmail.com', '2023-04-24 14:47:57'),
(14, 'Game Zone', 'N', 'GameZone', 'admin@gmail.com', '2023-04-18 05:45:41', 'admin@gmail.com', '2023-04-18 05:53:26'),
(15, 'New Cafe', 'N', 'NewCafe', 'admin@gmail.com', '2023-04-18 05:51:21', 'admin@gmail.com', '2023-04-18 05:53:55'),
(16, 'My hotel', 'N', 'Myhotel', 'admin@gmail.com', '2023-04-24 14:48:44', 'admin@gmail.com', '2023-04-25 13:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_menu_img`
--

CREATE TABLE `td_fun_directory_menu_img` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `img_path` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_menu_img`
--

INSERT INTO `td_fun_directory_menu_img` (`id`, `dir_menu_id`, `img_path`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'fun_directory/fundir.jpeg', 'undefined', '2023-04-18 09:57:40', 'undefined', '2023-04-24 12:47:31'),
(2, 4, 'fun_directory/california-california-baby.jpg', 'undefined', '2023-04-19 12:16:47', NULL, NULL),
(3, 4, 'fun_directory/dining-room.jpg', 'undefined', '2023-04-19 12:16:47', NULL, NULL),
(4, 4, 'fun_directory/RCLAGUN_00374-1.jpeg', 'undefined', '2023-04-19 12:16:47', NULL, NULL),
(5, 4, 'fun_directory/restaurant-with-a-view.jpg', 'undefined', '2023-04-19 12:16:47', NULL, NULL),
(6, 5, 'fun_directory/afar.brightspotcdn.jpeg', 'undefined', '2023-04-19 12:22:16', NULL, NULL),
(7, 5, 'fun_directory/Happy-Hour-Specials-in-Laguna-Niguel.jpg', 'undefined', '2023-04-19 12:22:16', NULL, NULL),
(8, 5, 'fun_directory/rooftop.jpg', 'undefined', '2023-04-19 12:22:16', NULL, NULL),
(9, 5, 'fun_directory/starfish-98.jpg', 'undefined', '2023-04-19 12:22:16', NULL, NULL),
(10, 6, 'fun_directory/ca-times.brightspotcdn.jpeg', 'undefined', '2023-04-19 12:24:10', NULL, NULL),
(11, 6, 'fun_directory/airs.art-api.jpeg', 'undefined', '2023-04-19 12:24:10', NULL, NULL),
(12, 6, 'fun_directory/istockphoto-1047900592-612x612.jpg', 'undefined', '2023-04-19 12:24:10', NULL, NULL),
(13, 6, 'fun_directory/A-89-17.jpg', 'undefined', '2023-04-19 12:24:10', NULL, NULL),
(14, 7, 'fun_directory/gall.jpeg', 'undefined', '2023-04-19 12:25:11', NULL, NULL),
(15, 7, 'fun_directory/gall1.jpg', 'undefined', '2023-04-19 12:25:11', NULL, NULL),
(16, 7, 'fun_directory/gall2.jpg', 'undefined', '2023-04-19 12:25:11', NULL, NULL),
(17, 7, 'fun_directory/gall3.jpeg;', 'undefined', '2023-04-19 12:25:11', NULL, NULL),
(18, 8, 'fun_directory/sho.jpg', 'undefined', '2023-04-19 12:26:20', NULL, NULL),
(19, 8, 'fun_directory/shop.jpg', 'undefined', '2023-04-19 12:26:20', NULL, NULL),
(20, 8, 'fun_directory/shop2.jpg', 'undefined', '2023-04-19 12:26:20', NULL, NULL),
(21, 8, 'fun_directory/shop3.jpg', 'undefined', '2023-04-19 12:26:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_menu_info`
--

CREATE TABLE `td_fun_directory_menu_info` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `menu_title` varchar(100) DEFAULT NULL,
  `menu_sub_title` varchar(100) DEFAULT NULL,
  `menu_desc` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_menu_info`
--

INSERT INTO `td_fun_directory_menu_info` (`id`, `dir_menu_id`, `menu_title`, `menu_sub_title`, `menu_desc`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, '<font face=\"Arial\" size=\"6\">This is our Home Page</font>', '<font face=\"Arial\" size=\"5\">Click on the sidebar to navigate</font>', '<span>Random gibberish text to use in web pages, site templates and in typography demos.</span><br><span>Get rid of Lorem Ipsum forever. A tool for web designers who want to save time.</span><span>Random gibberish text to use in web pages, site templates and in typography demos.</span><br>', 'undefined', '2023-04-18 09:57:40', 'undefined', '2023-04-24 12:47:31'),
(2, 5, '<font face=\"Arial\" size=\"6\">This is our bar</font>', '<font face=\"Arial\" size=\"5\">This is bar subtitle</font>', '<span>ust about everybody uses a cell phone these days. In fact,&#160;</span><a href=\"https://www.statista.com/statistics/245501/multiple-mobile-device-ownership-worldwide/\">Statista</a><span>&#160;puts the number of active mobile devices in the world at nearly 16 billion, which is roughly two for every person on the planet. What&#8217;s more, users take them everywhere and research from&#160;</span><a href=\"https://www.smscomparison.com/\">SMS Comparison</a><span>&#160;shows that 95% of SMS messages are read and responded to</span>', 'undefined', '2023-04-18 13:53:30', 'undefined', '2023-04-19 12:22:16'),
(3, 4, '<font size=\"6\">This is our restaurant</font>', '<font size=\"5\">This is my restaurant</font>', '<span>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for</span>', 'undefined', '2023-04-19 12:16:47', 'undefined', '2023-04-21 07:47:43'),
(4, 6, '<font face=\"Arial\" size=\"6\">This is our artist</font>', '<font face=\"Arial\" size=\"5\">Our fav artist</font>', '<span>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for</span>', 'undefined', '2023-04-19 12:24:10', NULL, NULL),
(5, 7, '<font size=\"6\">This is our gallery</font>', '<font size=\"5\">I love my gallery</font>', '<span>Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like</span>', 'undefined', '2023-04-19 12:25:11', NULL, NULL),
(6, 8, '<font size=\"6\">These is our shopping</font>', '<font size=\"4\">We love shopping</font>', '<span>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,</span>', 'undefined', '2023-04-19 12:26:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_menu_section`
--

CREATE TABLE `td_fun_directory_menu_section` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `sec_name` varchar(50) DEFAULT NULL,
  `bg_color` varchar(50) DEFAULT NULL,
  `txt_color` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_menu_section`
--

INSERT INTO `td_fun_directory_menu_section` (`id`, `dir_menu_id`, `sec_name`, `bg_color`, `txt_color`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 4, 'Americans', '#979795', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-24 13:04:04'),
(2, 4, 'California Contemporary', '#969696', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-24 13:04:46'),
(3, 7, 'Posh Galleria', '#FFA500', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-18 11:57:50'),
(4, 7, 'Gem Mountain Studios', '#FFA500', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-18 11:57:50'),
(5, 7, 'Occasions at Laguna Village', '#FFA500', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-18 11:57:50'),
(6, 8, 'Laguna Village Shops', '#FFA500', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-18 11:57:50'),
(7, 8, 'Downtown Shopping', '#FFA500', '#FFFFFF', 'admin@gmail.com', '2023-04-18 11:47:48', 'admin@gmail.com', '2023-04-18 11:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_menu_section_dtls`
--

CREATE TABLE `td_fun_directory_menu_section_dtls` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `dir_menu_sec_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu_section -> id',
  `img` text DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `special_offer` text DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `map_url` text DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_menu_section_dtls`
--

INSERT INTO `td_fun_directory_menu_section_dtls` (`id`, `dir_menu_id`, `dir_menu_sec_id`, `img`, `title`, `sub_title`, `about`, `special_offer`, `website`, `map_url`, `phone_no`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 4, 1, 'fun_directory/cliffvadodara.jpeg', 'Cliff', 'Our Cliff Restaurant', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'www.cliff.com', 'https://www.google.com/maps/d/embed?mid=1B1lAsUpYFg82Je7XN1_cxRPf1UU&hl=en_US&ehbc=2E312F', '9836751294', 'admin@gmail.com', '2023-04-19 09:59:16', 'admin@gmail.com', '2023-04-24 12:53:48'),
(2, 4, 1, 'fun_directory/holiday_inn_-helsinki_cc.jpeg', 'Holiday INN', 'This is our holiday inn', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'www.holidayinn.com', 'https://www.google.com/maps/d/embed?mid=1B1lAsUpYFg82Je7XN1_cxRPf1UU&hl=en_US&ehbc=2E312F', '9836751294', 'admin@gmail.com', '2023-04-19 11:57:14', 'admin@gmail.com', '2023-04-24 12:55:39'),
(5, 4, 2, 'fun_directory/img_forest.jpeg', 'The forest fun', 'This is our forest fun', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 'www.forestfun.com', 'https://www.google.com/maps/d/embed?mid=1B1lAsUpYFg82Je7XN1_cxRPf1UU&hl=en_US&ehbc=2E312F', '9836751294', 'admin@gmail.com', '2023-04-19 12:13:41', 'admin@gmail.com', '2023-04-19 12:14:58'),
(6, 7, 3, 'fun_directory/icon.png', 'The Manhattan project', 'Our manhattan project', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,', 'www.manhattan.com', 'https://www.google.com/maps/d/embed?mid=1B1lAsUpYFg82Je7XN1_cxRPf1UU&hl=en_US&ehbc=2E312F', '9836751294', 'admin@gmail.com', '2023-04-19 12:28:07', 'admin@gmail.com', '2023-04-19 12:28:30'),
(7, 4, 1, 'fun_directory/nyh.jpeg', 'New York Hotel', 'Our NYH', ' dsfgsgsdgsdgasgeqvyqyertgctqw4tcwtwet', 'awtrvqwtw4tw4TQW46BQYBQERYB', 'www.cliff.com', 'undefined', '9836751294', 'admin@gmail.com', '2023-04-22 12:57:55', 'admin@gmail.com', '2023-04-24 13:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_res_menu_catg`
--

CREATE TABLE `td_fun_directory_res_menu_catg` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `dir_menu_sec_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu_section -> id',
  `dir_menu_sec_dt_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu_section_dtls -> id',
  `catg_name` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_res_menu_catg`
--

INSERT INTO `td_fun_directory_res_menu_catg` (`id`, `dir_menu_id`, `dir_menu_sec_id`, `dir_menu_sec_dt_id`, `catg_name`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 4, 1, 1, 'Special Dinner', 'admin@gmail.com', '2023-04-22 09:10:28', 'admin@gmail.com', '2023-05-19 10:37:35'),
(2, 4, 1, 1, 'Lunch', 'admin@gmail.com', '2023-04-22 09:11:18', NULL, NULL),
(3, 4, 1, 1, 'Dinner', 'admin@gmail.com', '2023-04-22 09:11:25', NULL, NULL),
(4, 4, 2, 2, 'Lunch', 'admin@gmail.com', '2023-04-22 12:55:44', NULL, NULL),
(5, 4, 2, 2, 'Dinner', 'admin@gmail.com', '2023-04-22 12:55:53', NULL, NULL),
(6, 4, 1, 1, 'Tiffin', 'admin@gmail.com', '2023-05-19 10:15:54', NULL, NULL),
(7, 4, 1, 1, 'Breakfast', 'admin@gmail.com', '2023-05-19 10:21:10', NULL, NULL),
(8, 4, 1, 1, 'Special breakfast', 'admin@gmail.com', '2023-05-19 10:24:41', NULL, NULL),
(9, 4, 1, 1, 'Brunch', 'admin@gmail.com', '2023-05-19 10:38:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_res_menu_sec`
--

CREATE TABLE `td_fun_directory_res_menu_sec` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `dir_menu_sec_id` int(11) NOT NULL COMMENT ' 	td_fun_directory_menu_section -> id',
  `dir_menu_sec_dt_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu_section_dtls -> id',
  `f_res_menu_catg` int(11) NOT NULL COMMENT 'td_fun_directory_res_menu_catg -> id',
  `res_sec_name` varchar(50) NOT NULL,
  `img_path` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_res_menu_sec`
--

INSERT INTO `td_fun_directory_res_menu_sec` (`id`, `dir_menu_id`, `dir_menu_sec_id`, `dir_menu_sec_dt_id`, `f_res_menu_catg`, `res_sec_name`, `img_path`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(2, 4, 1, 1, 1, 'House Specialities', '1_1_B_sectionHouse_Specialities_breakfast_2.jpg', 'undefined', '2023-04-22 11:01:47', NULL, NULL),
(3, 4, 1, 1, 1, 'AÇAÍ', '1_1_B_sectionAÇAÍ_433148495.jpg', 'admin@gmail.com', '2023-04-22 11:03:18', NULL, NULL),
(4, 4, 1, 1, 2, 'SALADS', '1_1_L_sectionSALADS_432764816.jpg', 'admin@gmail.com', '2023-04-22 11:03:39', NULL, NULL),
(5, 4, 1, 1, 2, 'SIDES', '1_1_B_sectionSIDES_261543445.jpg', 'admin@gmail.com', '2023-04-22 11:04:10', NULL, NULL),
(6, 4, 1, 1, 3, 'TRADITIONAL BREAKFAST', '1_1_B_sectionTRADITIONAL_BREAKFAST_5199750.jpg', 'admin@gmail.com', '2023-04-22 11:04:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_fun_directory_res_menu_sec_item`
--

CREATE TABLE `td_fun_directory_res_menu_sec_item` (
  `id` int(11) NOT NULL,
  `dir_menu_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu -> id',
  `dir_menu_sec_id` int(11) NOT NULL COMMENT ' 	td_fun_directory_menu_section -> id',
  `dir_menu_sec_dt_id` int(11) NOT NULL COMMENT 'td_fun_directory_menu_section_dtls -> id',
  `f_res_menu_catg` int(11) NOT NULL COMMENT 'td_fun_directory_res_menu_catg -> id',
  `f_res_sec_id` int(11) NOT NULL COMMENT 'td_fun_directory_res_menu_sec -> id',
  `item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_price` float(10,2) NOT NULL DEFAULT 0.00,
  `item_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_fun_directory_res_menu_sec_item`
--

INSERT INTO `td_fun_directory_res_menu_sec_item` (`id`, `dir_menu_id`, `dir_menu_sec_id`, `dir_menu_sec_dt_id`, `f_res_menu_catg`, `f_res_sec_id`, `item_name`, `item_price`, `item_desc`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 4, 1, 1, 1, 2, 'BREAKFAST BURRITO', 32.00, 'We are one of the foremost manufacturers and suppliers of highly delicious Special Tiffin Cake', 'admin@gmail.com', '2023-04-22 11:40:16', NULL, NULL),
(2, 4, 1, 1, 1, 3, 'LOX BAGEL', 15.00, 'An exquisite tea that combines the rich fullness of fine valley grown teas from Assam with the irresistible aroma of specially selected long leaves', 'admin@gmail.com', '2023-04-22 11:40:54', NULL, NULL),
(3, 4, 1, 1, 2, 4, 'AÇAÍ BOWL', 28.00, 'Basmati Rice is one of the most popular rice types that is used in Indian cuisine. It is famous because of its delectable taste and long slender length', 'admin@gmail.com', '2023-04-22 11:41:35', NULL, NULL),
(4, 4, 1, 1, 2, 5, 'Bagel & Cream Cheese', 65.00, 'The chicken (Gallus gallus domesticus) is a domesticated junglefowl species, with attributes of wild species such as the grey and the Ceylon junglefowl', 'admin@gmail.com', '2023-04-22 11:42:08', NULL, NULL),
(5, 4, 1, 1, 3, 6, 'TWO EGGS ANY STYLE', 5.00, 'Atta/Ata or chakki atta is a wholemeal wheat flour, originating from the Indian subcontinent, used to make flatbreads such as chapati, roti, naan, paratha and puri', 'admin@gmail.com', '2023-04-22 11:42:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_group`
--

CREATE TABLE `td_group` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `leader_name` varchar(100) DEFAULT NULL,
  `no_of_people` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_group`
--

INSERT INTO `td_group` (`id`, `hotel_id`, `group_name`, `leader_name`, `no_of_people`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Backstreet Boy', 'Nick Carter', 5, 'admin@gmail.com', '2023-03-01 10:19:49', 'admin@gmail.com', '2023-03-01 11:14:31'),
(2, 1, 'Westlife', 'Shane Filan', 5, 'admin@gmail.com', '2023-03-01 11:16:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_guest_user`
--

CREATE TABLE `td_guest_user` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_type` enum('N','G','V','E') NOT NULL COMMENT 'N-> Normal; G-> Group; V-> VIP; E-> Employee',
  `mobile_no` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `group_emp_id` int(11) DEFAULT NULL COMMENT 'td_group -> id',
  `group_leader_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `dept_id` int(11) DEFAULT NULL,
  `pref_lang` varchar(50) DEFAULT NULL,
  `email_title` varchar(100) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Revoke manager',
  `app_token_id` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_guest_user`
--

INSERT INTO `td_guest_user` (`id`, `hotel_id`, `user_name`, `user_type`, `mobile_no`, `email_id`, `password`, `group_emp_id`, `group_leader_flag`, `dept_id`, `pref_lang`, `email_title`, `email_body`, `active_flag`, `app_token_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Antu', 'V', NULL, NULL, NULL, NULL, 'N', NULL, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-04 08:56:04', NULL, NULL),
(2, 1, 'Sayantika Dida', 'V', NULL, NULL, NULL, NULL, 'N', NULL, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-04 08:56:04', NULL, NULL),
(3, 1, 'Antu', 'V', NULL, NULL, NULL, NULL, 'N', NULL, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-04 08:58:01', NULL, NULL),
(4, 1, 'Sayantika Dida', 'V', NULL, 'somnath@synergicsoftek.in', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', NULL, 'N', NULL, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-04 08:58:01', NULL, NULL),
(10, 1, 'Debdas Dadu', 'E', '(949) 494-1956', 'debdas@gmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', NULL, 'Y', 4, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-09 11:09:46', 'admin@gmail.com', '2023-02-20 11:03:35'),
(11, 1, 'Brian', 'E', '9836751294', 'brian@hotmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', NULL, 'Y', 2, 'en', NULL, NULL, 'Y', 'e_SPh6O4TwyP7YYJ84ZUT7:APA91bFRMrBrdsg0RpalUbZJ4YS3tW2IQGuf1j1SHfW7v42U0R6mCtatIsiv_T6YUWWdO6foz_XVrec3oNk3N3CpGsTh0pRjJN7Mq_0M1_2Cd6ElX5Cvfxee7M2FzPRoM-R8MsO6X4Af', 'admin@gmail.com', '2023-02-09 11:12:24', '9836751294', '2023-07-06 05:01:43'),
(12, 1, 'Tanmoy Mondal', 'E', '9999999', 'mondal.tanmoy@synergicsoftek.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', NULL, 'Y', 5, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-09 11:13:35', NULL, NULL),
(13, 1, 'Sayantika Chatterjee', 'E', '98367512941', 'sayantika@synergicsoftek.in', '$2b$10$8dntHIlNBTQn2wfkqo8s/e0HJLGbSy7r4vEjyZH8C9Z/.hpFynpz.', NULL, 'Y', 2, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-15 10:32:29', 'admin@gmail.com', '2023-02-15 12:18:42'),
(19, 1, 'Nabiganjer Daitya', 'E', '8118214212', 'somnath.thakur16@gmail.com', '$2b$10$2re8E3HQyEOHHE2KFHrTtO4CpjHZACGpCbPEGFW4lsw9TpnEG4Rhm', NULL, 'Y', 0, 'English', NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-02-21 11:34:25', NULL, NULL),
(20, 1, 'gewbham ghewmanta', 'E', '9834561720', 'gewbham@gmail.com', '$2b$10$7H/5XnF5WihFeS7FCkGzd.XjBcduGzFpNlxGi0k9fgJ/Ru9ITrUHW', NULL, 'N', 5, 'English', NULL, NULL, 'Y', NULL, 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:18:22', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 08:27:50'),
(22, 1, 'Nick Carter', 'G', '8240404524', 'sayantika.dhar04@gmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', 1, 'Y', NULL, 'English', 'Welcome Nick Carter', 'Hello Nick Carter,\n\nWe are excited to host your group on 2023-03-09.\n    \nFIRST, please REGISTER HERE The only way to actkate your PERSONAL CONCIERGE is to Register\nPlease log-in to your GROUP COMMUNICATION PLATFORM, enabling you to communicate with your entire group Backstreet Boys, or one-on-one with any of your group members via chat or voice/call\nIf you have any questions, please call 800-777-7777\n    \nThank you,\n    \nHotel Bahia\n    \n\nLogin Credentials:\n\nUser ID: 9831034523\nPassword: IJYKK\n', 'Y', NULL, 'admin@gmail.com', '2023-03-01 10:19:49', 'admin@gmail.com', '2023-05-15 13:23:29'),
(24, 1, 'Shane Filan', 'G', '78935467245', 'shane@gmail.com', '$2b$10$L9la3.MLOZsKihExLgbwsujgvPcwbTz3azYL9qQnI/wpIKbrT8EVq', 2, 'Y', NULL, 'English', 'Welcome Shane Filan', 'Hello Shane Filan,\n\nWe are excited to host your group on 2023-03-27.\n    \nFIRST, please REGISTER HERE The only way to actkate your PERSONAL CONCIERGE is to Register\nPlease log-in to your GROUP COMMUNICATION PLATFORM, enabling you to communicate with your entire group Westlife, or one-on-one with any of your group members via chat or voice/call\nIf you have any questions, please call 800-777-7777\n    \nThank you,\n    \nHotel Bahia\n    \n\nLogin Credentials:\n\nUser ID: 78935467245\nPassword: 0ItNf\n', 'Y', NULL, 'admin@gmail.com', '2023-03-01 11:16:12', NULL, NULL),
(29, 1, 'Shane Watson', 'G', '999999999', 'buddha@gmail.com', NULL, 1, 'N', NULL, 'English', NULL, NULL, 'Y', NULL, 'nick@gmail.com', '2023-03-03 12:08:30', 'nick@gmail.com', '2023-03-06 15:19:17'),
(33, 1, 'Justin Langer', 'G', '9836751292', 'justin@gmail.com', NULL, 1, 'N', NULL, 'English', NULL, NULL, 'Y', NULL, 'nick@gmail.com', '2023-03-06 15:19:50', NULL, NULL),
(34, 1, 'Sayantika Dhar', 'E', '8240404524', 'sayantika.dhar4@gmail.com', '$2b$10$lR0NGQ71Y7oD2MfPbooY.ObD3fhW40KDL9IhkLq0lq7pn/2OjVdJG', NULL, 'Y', 4, NULL, NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-05-15 06:19:09', NULL, NULL),
(35, 17, 'Shamim Azaz', 'V', NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-05-15 06:33:42', NULL, NULL),
(36, 17, 'Utsab Roy', 'V', NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-05-15 06:33:42', NULL, NULL),
(37, 1, 'Nick Carter', 'G', '9831034523', 'nick@gmail.com', '$2b$10$Ff.pgfrtUHdmDD9RWlBE1Ou6uUL5LQAVEE6H1xF5eRIJynwJ74.M6', 1, 'Y', NULL, NULL, 'Welcome Nick Carter', 'Hello Nick Carter,\n\nWe are excited to host your group on 2023-03-09.\n    \nFIRST, please REGISTER HERE The only way to actkate your PERSONAL CONCIERGE is to Register\nPlease log-in to your GROUP COMMUNICATION PLATFORM, enabling you to communicate with your entire group Backstreet Boys, or one-on-one with any of your group members via chat or voice/call\nIf you have any questions, please call 800-777-7777\n    \nThank you,\n    \nHotel Bahia\n    \n\nLogin Credentials:\n\nUser ID: 9831034523\nPassword: IJYKK\n', 'Y', NULL, 'admin@gmail.com', '2023-05-15 12:49:15', NULL, NULL),
(38, 1, 'Somnath', 'N', '9836751299', 'somnath.thakur16@gmail.com', NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'Somnath', '2023-06-09 13:24:40', NULL, NULL),
(39, 1, 'Somnath', 'G', '9836751299', 'somnath.thakur16@gmail.com', NULL, 1, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'Somnath', '2023-06-09 13:25:48', NULL, NULL),
(40, 1, 'Somnath', 'N', '09836751299', 'somnath.thakur16@gmail.com', NULL, NULL, 'N', NULL, 'en', NULL, NULL, 'Y', 'eaLeAteBR2ql6HRZxAoQMB:APA91bFomaD-WJ6Uy2Rx47P3w1bTBBF8ecaMWKJtEFEVrwFOGUnno2h3gIpyqbHHz-5T2YHkJMM1erlEo1PMC6ELTrks6QoZuFooTdycWeoiltfxxj6aMEaaWwcjurHH3iBJ9Yj-Jy0W', 'Somnath', '2023-06-09 13:26:39', '09836751299', '2023-07-01 04:16:54'),
(41, 1, 'Shubham', 'N', '', '', NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'Shubham', '2023-06-10 08:39:28', NULL, NULL),
(42, 1, 'Aniket Ghosh', 'N', '9836376151', '', NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'Aniket Ghosh', '2023-06-10 09:55:13', NULL, NULL),
(43, 1, 'Subham Samanta', 'N', '9051203118', '', NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', 'e_SPh6O4TwyP7YYJ84ZUT7:APA91bFRMrBrdsg0RpalUbZJ4YS3tW2IQGuf1j1SHfW7v42U0R6mCtatIsiv_T6YUWWdO6foz_XVrec3oNk3N3CpGsTh0pRjJN7Mq_0M1_2Cd6ElX5Cvfxee7M2FzPRoM-R8MsO6X4Af', 'Shubham Samanta', '2023-06-13 06:09:24', '9051203118', '2023-07-05 14:31:17'),
(44, 1, 'Suman Mitra', 'N', '8777528909', 'suman@synergicsoftek.in', NULL, NULL, 'N', NULL, 'en', NULL, NULL, 'Y', 'dywt4aZ0THmSMwjxR-Ru6F:APA91bFfLtBIHTKbOTDm7N1AET3s1NQJahT8mBzYH89LyR-JW_wYUoxfjYolNnCZxsEtr-qirjT2ZSFMZs0q4ihbnZOlmjXLA42sx57COUVZdicNuO0QkbXWq7P7mL2cTdAxBp4LkZY4', 'Shubham Samanta', '2023-06-13 06:19:48', '8777528909', '2023-07-03 13:25:16'),
(45, 1, 'Steven Rogers', 'N', '9830327803', '', NULL, NULL, 'N', NULL, 'en', NULL, NULL, 'Y', NULL, 'Steven Rogers', '2023-06-19 12:32:30', 'Steven Rogers', '2023-06-19 13:32:37'),
(46, 1, 'Tonmoy Mondal', 'N', '9831887194', 'mondal.tanmoy@synergicsoftek.com', NULL, NULL, 'N', NULL, 'en', NULL, NULL, 'Y', 'flVIPHmsQzKK5TabRb-l7G:APA91bGGTKCOja8V8_f7zLvWLXMWMjKc6DM2Xpfi_YGdpCFN3h2i9c0ijgxhh7ayZMxrcAenXM28pPg1JZk1H33JVPkmFB6mE03yqJFJFdCyqJ0eIs_eCuTRJKTLO1c0mx63kZcBvbDY', 'Suvrajit', '2023-06-22 17:13:12', 'Tonmoy Mondal', '2023-07-01 04:43:33'),
(47, 1, 'Lucy', 'V', NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', NULL, 'admin@gmail.com', '2023-06-27 07:04:30', NULL, NULL),
(48, 1, 'Brian Foster ', 'N', '07970292203', '', NULL, NULL, 'N', NULL, 'en', NULL, NULL, 'Y', 'e20kPbk0SoqrswownJxcV5:APA91bGofDufSnMgGEB9KrBrw8TnEKGvDY5oMB_Cu47lkPTjHGqFhG7eh700DI43pXrtGO0vt5bnE5po1UbqibtBaxERBBcdAp2YQsZ-oka5kaNINWiXDTpE-JSj_71_sVMoZ2SK9Yo_', 'Brian Foster ', '2023-07-05 14:21:24', 'Brian Foster ', '2023-07-05 14:22:03'),
(50, 1, 'Steve Smith', 'N', '9836451246', '', NULL, NULL, 'N', NULL, 'en', NULL, NULL, 'Y', 'e_SPh6O4TwyP7YYJ84ZUT7:APA91bFRMrBrdsg0RpalUbZJ4YS3tW2IQGuf1j1SHfW7v42U0R6mCtatIsiv_T6YUWWdO6foz_XVrec3oNk3N3CpGsTh0pRjJN7Mq_0M1_2Cd6ElX5Cvfxee7M2FzPRoM-R8MsO6X4Af', 'Steve Smith', '2023-07-05 14:43:44', '9836451246', '2023-07-05 15:06:10'),
(51, 1, 'Roger Ebert', 'N', '9836451247', '', NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'Y', 'e_SPh6O4TwyP7YYJ84ZUT7:APA91bFRMrBrdsg0RpalUbZJ4YS3tW2IQGuf1j1SHfW7v42U0R6mCtatIsiv_T6YUWWdO6foz_XVrec3oNk3N3CpGsTh0pRjJN7Mq_0M1_2Cd6ElX5Cvfxee7M2FzPRoM-R8MsO6X4Af', 'Roger Ebert', '2023-07-05 15:04:19', '9836451247', '2023-07-05 15:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `td_guest_user_email`
--

CREATE TABLE `td_guest_user_email` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_body` text NOT NULL,
  `email_title` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_guest_user_email`
--

INSERT INTO `td_guest_user_email` (`id`, `hotel_id`, `user_id`, `email_body`, `email_title`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 13, 'Hello Sayantika Chatterjee,\n    \nPlease log in to your Housekeeping department enabling to communicate with your department  employees, 24/7, or one-on-one with any employee in your department via char or voice call.\n\nThank You  \n\nCindy Ferguson\n\nLink: https://customapi.shoplocal-lagunabeach.com/main/admin/deptlogin\n\nLogin Credentials:\n\nUser ID: 98367512941\nPassword: 0055b\n', 'Welcome Sayantika Chatterjee', 'admin@gmail.com', '2023-02-15 11:40:04', NULL, NULL),
(2, 1, 13, 'Hello Sayantika Chatterjee,\n    \nPlease log in to your  department enabling to communicate with your department  employees, 24/7, or one-on-one with any employee in your department via char or voice call.\n\nThank You  \n\nCindy Ferguson\n\nLink: https://customapi.shoplocal-lagunabeach.com/main/admin/deptlogin\n\nLogin Credentials:\n\nUser ID: 98367512941\nPassword: TMbBa\n', 'Welcome Sayantika Chatterjee', 'admin@gmail.com', '2023-02-15 12:18:42', NULL, NULL),
(3, 1, 19, 'Hello Nabiganjer Daitya,\n    \nPlease log in to your department(s) enabling to communicate with your department  employees, 24/7, or one-on-one with any employee in your department via chat or voice call.\n\nThank You  \n\nCindy Ferguson\n\nLink: https://customapi.shoplocal-lagunabeach.com/main/admin/deptlogin\n\nLogin Credentials:\n\nUser ID: 8118214212\nPassword: MPqFQ\n', 'Welcome Nabiganjer Daitya', 'admin@gmail.com', '2023-02-21 11:34:25', NULL, NULL),
(4, 1, 20, 'Hello gewbham ghewmanta,\n    \nPlease log in to communicate, 24/7, or one-on-one via chat or voice call.\nThank You  \nCindy Ferguson\n  \nHere are your credentials:\nURL: https://https://custom.shoplocal-lagunabeach.com/#/\nUser ID: 9834561720,\nPassword: kx0B9\n  ', 'Account Invitation', 'mondal.tanmoy@synergicsoftek.com', '2023-02-28 07:18:22', NULL, NULL),
(5, 1, 34, 'Hello Sayantika Dhar,\n    \nPlease log in to your department(s) enabling to communicate with your department  employees, 24/7, or one-on-one with any employee in your department via chat or voice call.\n\nThank You  \n\nCindy Ferguson\n\nLink: https://custom.shoplocal-lagunabeach.com/#/main/admin/deptlogin\n\nLogin Credentials:\n\nUser ID: 8240404524\nPassword: 5eQYe\n', 'Welcome Sayantika Dhar', 'admin@gmail.com', '2023-05-15 06:19:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_lodgging`
--

CREATE TABLE `td_lodgging` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `room_no` int(11) NOT NULL,
  `status_flag` enum('A','D') NOT NULL COMMENT 'A-> Active; D-> Deactive',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_lodgging`
--

INSERT INTO `td_lodgging` (`id`, `hotel_id`, `guest_id`, `check_in`, `check_out`, `room_no`, `status_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 3, '2023-02-04 10:25:00', '2023-05-21 14:29:00', 0, 'A', 'admin@gmail.com', '2023-02-04 08:58:01', NULL, NULL),
(2, 1, 4, '2023-02-04 10:25:00', '2023-05-25 14:29:00', 0, 'A', 'admin@gmail.com', '2023-02-04 08:58:01', NULL, NULL),
(3, 1, 1, '2023-02-04 10:25:00', '2023-05-21 14:29:00', 0, 'A', 'admin@gmail.com', '2023-02-04 08:58:01', NULL, NULL),
(4, 1, 2, '2023-02-04 10:25:00', '2023-02-25 14:29:00', 0, 'A', 'admin@gmail.com', '2023-02-04 08:58:01', NULL, NULL),
(5, 1, 22, '2023-03-01 00:00:00', '2023-06-30 00:00:00', 6, 'A', 'admin@gmail.com', '2023-03-01 10:19:49', NULL, NULL),
(6, 1, 24, '2023-03-01 00:00:00', '2023-05-31 00:00:00', 7, 'A', 'admin@gmail.com', '2023-03-01 11:16:12', NULL, NULL),
(10, 1, 29, '2023-03-01 20:48:00', '2023-05-30 20:48:00', 8, 'A', 'nick@gmail.com', '2023-03-03 12:08:30', 'nick@gmail.com', '2023-03-06 15:19:17'),
(11, 1, 31, '2023-03-16 18:15:00', '2023-05-30 18:15:00', 9, 'A', 'nick@gmail.com', '2023-03-03 12:45:18', NULL, NULL),
(12, 1, 32, '2023-03-02 18:15:00', '2023-05-25 18:15:00', 10, 'A', 'nick@gmail.com', '2023-03-03 12:45:46', NULL, NULL),
(13, 1, 33, '2023-03-15 20:49:00', '2023-05-25 20:49:00', 5, 'A', 'nick@gmail.com', '2023-03-06 15:19:50', NULL, NULL),
(14, 17, 35, '2023-05-16 12:02:00', '2023-05-27 12:02:00', 0, 'A', 'admin@gmail.com', '2023-05-15 06:33:42', NULL, NULL),
(15, 17, 36, '2023-05-17 12:03:00', '2023-05-30 12:03:00', 0, 'A', 'admin@gmail.com', '2023-05-15 06:33:42', NULL, NULL),
(16, 1, 39, '2023-05-01 00:00:00', '2023-07-05 00:00:00', 0, 'A', 'admin@gmail.com', '2023-05-15 12:49:15', NULL, NULL),
(17, 1, 40, '2023-06-09 18:56:00', '2023-06-18 18:56:00', 45, 'A', 'Somnath', '2023-06-09 13:26:39', 'Somnath', '2023-06-19 05:32:00'),
(18, 1, 41, '2023-06-17 00:00:00', '2023-06-24 00:00:00', 121, 'A', 'Shubham', '2023-06-10 08:39:28', NULL, NULL),
(19, 1, 42, '2023-06-01 00:00:00', '2023-06-09 00:00:00', 34, 'A', 'Aniket Ghosh', '2023-06-10 09:55:13', NULL, NULL),
(20, 1, 44, '2023-03-01 00:00:00', '2023-05-31 00:00:00', 0, 'A', 'Shubham Samanta', '2023-06-13 06:19:48', NULL, NULL),
(21, 1, 40, '2023-05-01 18:56:00', '2023-05-23 18:56:00', 6, 'A', 'Somnath', '2023-06-09 13:26:39', NULL, NULL),
(22, 1, 40, '2023-06-19 15:57:00', '2023-06-24 21:58:00', 56, 'A', 'Somnath', '2023-06-19 10:28:20', NULL, NULL),
(24, 1, 45, '2023-06-19 00:00:00', '2023-06-30 00:00:00', 54, 'A', 'Steven Rogers', '2023-06-19 12:32:30', NULL, NULL),
(25, 1, 42, '2023-06-22 22:30:00', '2023-06-23 20:30:00', 20, 'A', 'Aniket Ghosh', '2023-06-22 17:01:49', NULL, NULL),
(26, 1, 46, '2023-06-22 15:42:00', '2023-06-30 16:43:00', 3, 'A', 'Tonmoy Mondal', '2023-06-22 17:13:12', NULL, NULL),
(27, 1, 43, '2023-06-22 22:30:00', '2023-06-30 20:30:00', 1, 'A', 'Subham Samanta', '2023-06-22 17:01:49', NULL, NULL),
(28, 1, 44, '2023-06-22 22:30:00', '2023-06-30 20:30:00', 2, 'A', 'Suman Mitra', '2023-06-22 17:01:49', NULL, NULL),
(29, 1, 47, '2023-06-27 00:34:00', '2023-06-30 12:34:00', 0, 'A', 'admin@gmail.com', '2023-06-27 07:04:30', NULL, NULL),
(30, 1, 40, '2023-05-30 23:29:00', '2023-08-30 23:29:00', 102, 'A', 'Somnath', '2023-06-30 17:59:27', NULL, NULL),
(31, 1, 44, '2023-07-01 08:54:00', '2023-07-01 08:54:00', 301, 'A', 'Suman Mitra', '2023-07-01 03:24:08', NULL, NULL),
(32, 1, 46, '2023-07-01 10:12:00', '2023-07-31 10:13:00', 301, 'A', 'Tonmoy Mondal', '2023-07-01 04:43:24', NULL, NULL),
(33, 1, 43, '2023-07-03 18:19:00', '2023-07-01 18:19:00', 78, 'A', 'undefined', '2023-07-03 12:49:33', 'undefined', '2023-07-03 12:54:03'),
(34, 1, 48, '2023-07-05 00:00:00', '2023-07-19 00:00:00', 0, 'A', 'Brian Foster ', '2023-07-05 14:21:24', NULL, NULL),
(35, 1, 0, '2023-05-05 19:53:00', '2023-07-05 19:53:00', 34, 'A', 'undefined', '2023-07-05 14:23:40', NULL, NULL),
(37, 1, 50, '2023-07-05 00:00:00', '2023-07-29 00:00:00', 36, 'A', 'Steve Smith', '2023-07-05 14:43:44', NULL, NULL),
(38, 1, 51, '2023-07-05 00:00:00', '2023-07-29 00:00:00', 54, 'A', 'Roger Ebert', '2023-07-05 15:04:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_logo`
--

CREATE TABLE `td_logo` (
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R','H') NOT NULL COMMENT 'S :Service\r\nR :Restaurant\r\nH :Hotel',
  `srv_res_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Service (S):td_quest_service\r\nRestaurant (R) :td_quest_res_bars\r\nHotel (H) : 0',
  `logo_url` text NOT NULL,
  `logo_path` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_logo`
--

INSERT INTO `td_logo` (`hotel_id`, `srv_res_flag`, `srv_res_id`, `logo_url`, `logo_path`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(0, 'S', 9, '', '9_19_logo_kfc_logo.jpeg', '4', '2022-01-21 11:17:45', '4', '2022-01-25 06:24:40'),
(0, 'S', 10, '', '9_19_logo_kfc_logo.jpeg', '4', '2022-01-21 11:18:37', NULL, NULL),
(0, 'S', 17, '', '34_logo_logo.png', '34', '2021-11-01 10:42:42', '34', '2021-12-10 08:45:31'),
(0, 'S', 18, '', '', '5', '2023-01-04 11:47:38', '5', '2023-01-04 12:01:52'),
(1, 'R', 1, '', 'undefined_1_logo_8.jpg', '1', '2023-01-14 07:48:35', '1', '2023-06-30 12:07:50'),
(1, 'R', 2, '', 'undefined_2_logo_logo_name', '1', '2023-01-14 08:10:21', NULL, NULL),
(1, 'R', 3, '', 'undefined_3_logo_2.jpg', '1', '2023-01-14 08:00:36', '1', '2023-06-28 08:17:28'),
(26, 'R', 62, 'null', '26_62_logo_726057.jpg', '26', '2023-07-01 09:51:40', '26', '2023-07-03 05:17:55'),
(26, 'R', 63, 'null', '26_63_logo_california-california-baby.jpg', '26', '2023-07-05 07:48:38', NULL, NULL),
(26, 'R', 64, 'null', '26_64_logo_kfc_logo.jpeg', '26', '2023-07-02 11:52:54', NULL, NULL),
(27, 'R', 70, 'null', '27_70_logo_Alicia Souza (2).jpg', '27', '2023-07-05 06:13:10', '27', '2023-07-05 07:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `td_lost_found`
--

CREATE TABLE `td_lost_found` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `saved_by` enum('A','U') NOT NULL COMMENT 'A-> Admin; U-> User',
  `user_id` int(11) NOT NULL COMMENT 'td_guest_user -> id',
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `lf_flag` enum('L','F') NOT NULL COMMENT 'L-> Lost; F-> Found',
  `lf_date` date NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_desc` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `approval_flag` enum('Y','N','P') NOT NULL DEFAULT 'P',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_lost_found`
--

INSERT INTO `td_lost_found` (`id`, `hotel_id`, `saved_by`, `user_id`, `user_name`, `user_email`, `lf_flag`, `lf_date`, `item_name`, `item_desc`, `remarks`, `approval_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'A', 0, 'admin', 'admin@gmail.com', 'L', '2023-03-01', 'Watch', 'Watch made of gold.', 'It has not been found yet.', 'Y', 'undefined', '2023-03-09 07:06:33', 'undefined', '2023-05-08 05:54:11'),
(2, 1, 'A', 0, 'Admin', 'admin@gmail.com', 'L', '2023-03-04', 'Purse', 'Black coloured purse.', 'Not found.', 'Y', 'undefined', '2023-03-09 07:08:24', NULL, NULL),
(3, 1, 'A', 0, 'Admin', 'admin@gmail.com', 'F', '2023-03-08', 'Cricket Bat', 'Wooden Bat', 'Found atlast.', 'Y', 'undefined', '2023-03-09 07:09:19', NULL, NULL),
(4, 1, 'A', 0, 'Admin', 'admin@gmail.com', 'F', '2023-03-02', 'Kukaburra Ball', 'It was a red ball.', 'Found!', 'Y', 'undefined', '2023-03-09 07:09:42', NULL, NULL),
(5, 12, 'A', 0, 'admin', 'admin@gmail.com', 'L', '2023-03-09', 'Mobile', 'Black color Samsung Galaxy A23,with steel plated back cover. Front screen a little scratch.  ', 'One of our guest lost her mobile as described in the respective section.If found please inform to Lost & Found section of the Hotel by calling at +918240574105.\nThanks.', 'Y', 'undefined', '2023-03-09 10:00:53', NULL, NULL),
(6, 12, 'A', 0, 'admin', 'admin@gmail.com', 'F', '2023-03-09', 'Credit Card', 'City Bank Credit Card.Blue Colored.', 'We found a City Bank Credit Card. To claim your card please contact the Lost & Found cell of the Hotel with proper proof.\nThanks ', 'Y', 'undefined', '2023-03-09 10:03:38', NULL, NULL),
(7, 1, 'U', 22, 'Nick Carter', 'nick@gmail.com', 'L', '2023-03-08', 'Mobile Phone', 'OnePlus Nord CE', 'Great Phone', 'P', 'undefined', '2023-03-10 10:58:02', NULL, NULL),
(8, 1, 'U', 22, 'Nick Carter', 'nick@gmail.com', 'F', '2023-03-08', 'Pen', 'Marker', 'No Ink', 'P', 'undefined', '2023-03-10 11:01:24', NULL, NULL),
(9, 1, 'U', 22, 'Nick Carter', 'nick@gmail.com', 'F', '2023-03-09', 'Rose', 'Flowers', 'Good Smell', 'P', 'undefined', '2023-03-10 11:04:09', NULL, NULL),
(10, 1, 'A', 0, 'admin', 'admin@gmail.com', 'L', '2023-06-26', 'Laptop', 'HP compamy', '', 'Y', 'undefined', '2023-06-26 05:10:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_menu_image`
--

CREATE TABLE `td_menu_image` (
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('R','S') NOT NULL COMMENT 'S :Service R :Restaurant	',
  `srv_res_id` int(10) NOT NULL COMMENT 'Service (S):td_quest_service Restaurant (R) :td_quest_res_bars	',
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast\r\nL:Lunch\r\nD:Dinner\r\nR:Brunch\r\nS:Special\r\nA:Bar\r\nV:Menu Service',
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `menu_url` text DEFAULT NULL,
  `menu_img` text NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dt` datetime NOT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_menu_image`
--

INSERT INTO `td_menu_image` (`hotel_id`, `srv_res_flag`, `srv_res_id`, `menu_id`, `active_flag`, `menu_url`, `menu_img`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'R', 1, 'B', 'Y', '', '34_2_menu_3_little-people-daily-dec-2.pdf', '1', '2023-01-13 18:20:19', '1', '2023-01-13 18:20:19'),
(1, 'R', 1, 'B', 'Y', '', '34_2_menu_4_mm-menu-august-2021.pdf', '1', '2023-01-13 18:20:19', '1', '2023-01-13 18:20:19'),
(26, 'R', 62, 'A', 'Y', '', '26_R_62_A_menu_1_Remote Desktop Redirected Printer Doc.pdf', '26', '2023-07-03 05:29:35', '26', '2023-07-03 05:29:35'),
(26, 'R', 62, 'A', 'Y', '', '26_R_62_A_menu_2_Latest Payment Status _ CESC.pdf', '26', '2023-07-03 05:29:35', '26', '2023-07-03 05:29:35'),
(26, 'R', 64, 'D', 'Y', '', '26_R_64_D_menu_1_MAR 2023.pdf', '26', '2023-07-02 14:16:12', '26', '2023-07-02 14:16:12'),
(26, 'R', 64, 'D', 'Y', '', '26_R_64_D_menu_2_Note Sheet.pdf', '26', '2023-07-02 14:16:12', '26', '2023-07-02 14:16:12'),
(26, 'R', 66, 'D', 'Y', '', '26_R_66_D_menu_.pdf', '26', '2023-07-03 06:04:34', '26', '2023-07-03 06:04:34'),
(27, 'R', 70, 'B', 'Y', '', '27_R_70_B_menu_Alicia Souza (2).jpg', '27', '2023-07-05 10:29:10', '27', '2023-07-05 11:44:18'),
(27, 'R', 70, 'B', 'Y', '', '27_R_70_B_menu_Breakfast-Menu.jpg', '27', '2023-07-05 10:24:46', '27', '2023-07-05 11:44:18'),
(27, 'R', 70, 'D', 'Y', '', '27_R_70_D_menu_Breakfast-Menu.jpg', '27', '2023-07-05 11:50:33', '27', '2023-07-05 11:50:51'),
(27, 'R', 70, 'D', 'Y', '', '27_R_70_D_menu_Dinner-Menu.jpg', '27', '2023-07-05 11:50:51', '27', '2023-07-05 11:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `td_menu_notice`
--

CREATE TABLE `td_menu_notice` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast L:Lunch D:Dinner R:Brunch S:Special A:Bar V:Menu Service',
  `notice_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `position_id` int(11) NOT NULL,
  `header_title` varchar(200) NOT NULL,
  `font_color` varchar(50) NOT NULL,
  `back_color` varchar(50) NOT NULL,
  `notice_content` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_menu_notice`
--

INSERT INTO `td_menu_notice` (`id`, `hotel_id`, `restaurant_id`, `menu_id`, `notice_flag`, `position_id`, `header_title`, `font_color`, `back_color`, `notice_content`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 1, 'B', 'Y', 1, 'dsf', '#4d3232', '#c05959', 'notice breakfastdhdgjhdf', '1', '2023-01-14 10:47:16', '1', '2023-01-15 08:44:02'),
(2, 1, 1, 'L', 'Y', 2, 'dsfdgsgdsgds', '#ff0000', '#c05959', 'notice lunch', '1', '2023-01-14 10:48:20', '1', '2023-01-15 08:45:06'),
(3, 1, 3, 'B', 'Y', 2, 'dgsdgsdgf', '#8e3e3e', '#757575', 'fsdaafsd', '3', '2023-01-14 10:49:13', NULL, NULL),
(4, 26, 62, 'A', 'Y', 1, 'Lorem Ipsum is simply dummy', '#0f0f0f', '#6fcdec', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ', '62', '2023-07-05 05:42:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_notification`
--

CREATE TABLE `td_notification` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `message_center_type` enum('H','E','V','G','M','P','C','R','O') NOT NULL COMMENT 'H-> Hotel; E-> Emergency; V-> VIP; G-> Group; M-> Employee; P-> Promotions; C-> Custom; R-> Promotion; O-> Photo OPS',
  `audience` varchar(50) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `img_name` varchar(100) DEFAULT NULL,
  `img_path` varchar(100) DEFAULT NULL,
  `msg_title` varchar(100) DEFAULT NULL,
  `msg_subtitle` varchar(100) NOT NULL,
  `msg_body` text DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  `dept_link` varchar(100) DEFAULT NULL,
  `time_period_msg` enum('Y','N') NOT NULL,
  `msg_snt_frm_time` time DEFAULT NULL,
  `msg_snt_to_time` time DEFAULT NULL,
  `msg_snt_type` enum('O','D','W','M') DEFAULT NULL COMMENT 'O-> Once; D-> Daily; W-> W; M-> Monthly',
  `msg_snt_dt` date DEFAULT NULL,
  `msg_snt_day` varchar(50) DEFAULT NULL,
  `msg_snt_time` time DEFAULT NULL,
  `msg_lifetime` enum('D','I') DEFAULT NULL COMMENT 'D->90 Days; I->Indefinite',
  `send_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `extended_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_notification`
--

INSERT INTO `td_notification` (`id`, `hotel_id`, `message_center_type`, `audience`, `language`, `img_name`, `img_path`, `msg_title`, `msg_subtitle`, `msg_body`, `dept_id`, `dept_link`, `time_period_msg`, `msg_snt_frm_time`, `msg_snt_to_time`, `msg_snt_type`, `msg_snt_dt`, `msg_snt_day`, `msg_snt_time`, `msg_lifetime`, `send_flag`, `extended_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'H', '1', 'E', 'undefined', '1_H_msgImg_0.7156617380173327.jpg', 'Hey, this is the THA', 'Always at your service', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s. ', NULL, 'D', 'Y', '08:00:00', '18:39:00', 'O', '2023-01-12', '', '13:11:00', 'I', 'N', 'N', 'undefined', '2023-01-18 12:33:44', 'admin@gmail.com', '2023-01-23 08:44:26'),
(2, 1, 'H', 'NaN', 'E', 'undefined', '1_H_msgImg_0.5069300878116987.jpg', 'Hey, how is the weather?', 'Rain might play spoilsport', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ', NULL, 'E', 'Y', '19:54:00', '22:54:00', 'D', '0000-00-00', '', '00:00:00', 'D', 'N', 'N', 'undefined', '2023-01-18 17:56:11', 'admin@gmail.com', '2023-01-23 08:51:54'),
(3, 1, 'H', 'NaN', 'E', NULL, '1_H_msgImg_0.20039144153328547.jpg', 'Hey, look out for the lost object', 'Lost & Found Section', 'Our lost & Found section keeps your lost things safely until someone reports for it. We have it safe and sound.', NULL, '', 'Y', '00:38:00', '16:43:00', 'W', '0000-00-00', 'Thursday', '16:39:00', 'D', 'N', 'N', 'undefined', '2023-01-19 11:39:45', 'admin@gmail.com', '2023-01-23 08:52:47'),
(4, 1, 'H', 'NaN', 'E', NULL, '1_H_msgImg_0.33311425397671157.jpg', 'Missing Person Alert!', 'Please report if you find him', 'A man named Shubham Samanta was reported to be missing last night. He was last seen near his room (139) in Baranagar. He was wearing nothing.', NULL, 'E', 'Y', '01:48:00', '11:54:00', 'M', '2023-01-22', '', '05:48:00', 'I', 'N', 'N', 'undefined', '2023-01-19 11:48:29', 'admin@gmail.com', '2023-01-23 08:55:36'),
(5, 1, 'V', '4', 'E', NULL, 'SHAWN_MENDES.jpg', 'SHAWN MENDES', ' Royal Arena, København, Denmark. Royal Stadium.', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ', NULL, 'https://bit.ly/3HO97yM', 'Y', '00:50:00', '03:51:00', 'D', '0000-00-00', '', '04:51:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-02-06 11:59:32', 'admin@gmail.com', '2023-02-13 09:41:35'),
(6, 1, 'V', '3', 'E', NULL, '1_V_video.mp4', 'Hey, let us take a tour of the hotel?', 'We have made a customized tour for you.', 'Hello, we will take you on a tour during your stay.', NULL, '4', 'Y', '14:51:00', '18:51:00', 'O', '2023-02-12', '', '16:51:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-02-10 13:51:30', NULL, NULL),
(7, 1, 'V', '3', 'E', NULL, '1_V_msgImg_0.029965063232505473.jpg', 'Do you have a minute to talk?', 'We have custom made chat bots at your service.', 'Heard of chatbots? We make sure that the guests are never lonely. The chatbots are always at your disposal.', NULL, 'https://bit.ly/40V0N91', 'Y', '15:55:00', '17:55:00', 'W', '0000-00-00', 'Tuesday', '17:55:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-02-10 13:55:26', NULL, NULL),
(8, 1, 'E', 'OD', 'E', NULL, 'Christmas-Wishes-Feature.jpg', 'buytt', 'bslmbkb', 'lkc', NULL, 'https://bit.ly/40V0N91', 'Y', '19:17:00', '17:22:00', 'D', NULL, '', '20:18:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-02-28 11:51:33', NULL, NULL),
(11, 1, 'G', '22', 'E', NULL, 'Christmas-Wishes-Feature.jpg', 'buytt', 'bslmbkb', 'lkc', NULL, 'https://bit.ly/40V0N91', 'Y', '19:17:00', '17:22:00', 'D', NULL, '', '20:18:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-02-28 11:51:33', NULL, NULL),
(12, 1, 'R', '1', 'E', NULL, 'stock/birthday.jpg', 'Newsjack Natural Phenomenons', 'Natural wonders of the earth only come around every couple of years.', 'For planners who have events booked at your hotel during peak viewing times, offer their guests a complimentary beverage on the rooftop bar for a stellar, out of this world experience.', NULL, 'https://bit.ly/40V0N91', 'N', '00:00:00', '00:00:00', 'D', NULL, '', '15:28:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-03-08 08:07:06', NULL, NULL),
(13, 1, 'R', '3', 'E', NULL, 'stock/thanksgiving.jpeg', 'Move stayover service to on-demand', 'Inform guests of this change via hotel text message', 'Welcome to Island Hotel! In order to protect you and our valued employees during this time, we are offering housekeeping service on an on-demand basis. Kindly text this number when you would like your room serviced, and we will accommodate your request at a time that is convenient for you. ', NULL, 'https://bit.ly/40V0N91', 'N', '00:00:00', '00:00:00', 'W', NULL, 'Tuesday', '15:38:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-03-08 08:09:07', NULL, NULL),
(14, 1, 'O', '1', 'E', NULL, 'stock/79947294.png', 'Professional Camera Work', 'Camera Work', 'We provide a professional photographer utilizing a high-end DLSR camera to ensure you receive great photos.', NULL, 'https://bit.ly/40V0N91', 'N', '00:00:00', '00:00:00', 'W', NULL, 'Thursday', '16:40:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-03-08 08:10:18', NULL, NULL),
(15, 1, 'O', '3', 'E', NULL, 'stock/birthday.jpg', 'Choice of Booth or Backdrop', 'Enclosed full booth or open backdrop design', 'Tell us the space you’re working with and we can give you ideas for what will work best. We have velvet drapes in a variety of colors to provide an elegant background for your photos. Or we can use your venue backdrop, step and repeat, or any other arrangement you’d like!', NULL, 'https://bit.ly/40V0N91', 'N', '00:00:00', '00:00:00', 'M', '2023-03-06', 'Thursday', '17:40:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-03-08 08:10:52', NULL, NULL),
(16, 12, 'R', '1', 'E', NULL, '12_R_msgImg_0.9051166430171911.jpg', 'Free Appetizer!!!!!!!', 'Hurry before offer ends!!!', 'Enjoy a Free appetizer of choice when you order at the Trigger Fish for delivery and take out! Use code 5BBC3X at check out.\r\nT&Cs apply.\r\nOrder now : https://www.mifrends.com/hotel-lucia-mv/directory.php', NULL, '1', 'N', '00:00:00', '00:00:00', NULL, NULL, '', '00:00:00', NULL, 'N', 'N', 'admin@gmail.com', '2023-03-09 06:01:44', NULL, NULL),
(17, 17, 'H', '1', 'Abkhaz', NULL, '17_H_msgImg_0.9289425330648857.jpg', 'This is a sample title', 'This is a sample subtitle', 'This is a sample message body and we need to add this text to test whether we are able to save the data.', NULL, '1', 'Y', '02:00:00', '04:00:00', 'O', '2023-05-16', '', '16:39:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-05-15 07:09:14', 'admin@gmail.com', '2023-05-16 11:20:00'),
(18, 17, 'E', '2', 'Afar', NULL, '17_E_msgImg_0.13522824466981076.jpg', 'This is a sample title for the second message ', 'This is a sample subtitle for the second message ', 'This is the sample body for the message to be composed for the second time.', NULL, '2', 'Y', '00:00:00', '00:00:00', 'M', '2023-05-15', '', '13:37:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-05-15 07:27:09', 'admin@gmail.com', '2023-05-16 11:20:14'),
(19, 17, 'V', '3', 'Akan', NULL, 'anniversary.jpg', 'this is a sample vip message title', 'this is a sample vip message subtitle', 'this is a sample message body for vip messages because I want to add something large so that I can test whether the ellipsis has been added or not.', NULL, '3', 'Y', '00:00:00', '00:00:00', 'M', '2023-05-17', '', '20:05:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-05-15 08:35:48', 'admin@gmail.com', '2023-05-16 11:20:28'),
(20, 17, 'E', '2', 'Aymara', NULL, 'birthday.jpg', 'This is an emergency message meant for all of you', 'This is a subtitle meant for all of you', 'This is a message body for emergency message', NULL, '4', 'Y', '00:00:00', '00:00:00', 'M', '2023-05-16', '', '17:53:00', 'I', 'N', 'N', 'admin@gmail.com', '2023-05-15 10:23:49', 'admin@gmail.com', '2023-05-16 11:20:41'),
(21, 1, 'E', '', 'E', NULL, 'HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'Newsjack Natural Phenomenons', 'Natural wonders of the earth only come around ever', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p', NULL, '1', 'N', '00:00:00', '00:00:00', 'O', '2023-05-16', '', '10:00:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-05-15 10:25:42', NULL, NULL),
(22, 17, 'M', '7', 'Azerbaijani', NULL, '17_M_msgImg_0.6400630013114263.jpg', 'This is a sample title', 'This is a subtitle meant for all of you', 'ehhdfRWHWRERHAdfhsdfhdfhdfhdfhdfbsdfb', NULL, '2', 'Y', '00:00:00', '00:00:00', 'M', '2023-05-26', '', '18:57:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-05-15 10:27:45', 'admin@gmail.com', '2023-05-16 11:20:59'),
(23, 1, 'H', '22', 'E', NULL, '1_H_msgImg_0.7156617380173327.jpg', 'FlipBook', 'Your FlipBook is ready to share.', 'To view your FlipBook please <a href=\"https://flipbook.shoplocal-lagunabeach.com/#/flip/34\">Click Here</a>.', NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N', 'Nick Carter', '2023-06-06 12:49:00', NULL, NULL),
(24, 1, 'H', '1S', 'English', NULL, 'Christmas-Wishes-Feature.jpg', 'Test Message for single guest', 'Single text message', 'This is a test message send from hotel admin to single guest.', NULL, '1', 'Y', '11:21:00', '14:24:00', 'O', '2023-06-27', '', '11:22:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 05:52:40', NULL, NULL),
(25, 1, 'H', '1S', 'English', NULL, 'HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'Lets watch Naruto', 'Watching Naruto Anime', 'Itachi is not a treater for konoha, but he joined akatsuki to protect konoha from enimies.', NULL, '1', 'Y', '11:27:00', '12:29:00', 'O', '2023-06-27', '', '11:28:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 05:58:51', NULL, NULL),
(26, 1, 'H', '1A', 'English', NULL, '79947294.png', 'Merry Christmas', 'Christmas Eve', 'Cherry Tree', NULL, '2', 'Y', '11:39:00', '12:39:00', 'O', '2023-06-27', '', '11:39:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 06:09:30', NULL, NULL),
(27, 1, 'E', '1S', 'English', NULL, '79947294.png', 'Merry Christmas', 'Christmas Eve', 'Merry Christmas', NULL, '2', 'Y', '11:54:00', '12:54:00', 'O', '2023-06-27', '', '12:54:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 06:24:39', NULL, NULL),
(28, 1, 'E', '2', 'English', NULL, 'icons_color/happy-sun.png', 'Sunny Day', 'Lemon Juce', 'Enjoy the sunny day', NULL, '3', 'Y', '11:57:00', '12:57:00', 'D', NULL, '', '11:57:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 06:27:33', NULL, NULL),
(29, 1, 'E', '2', 'English', NULL, 'birthday.jpg', 'Happy Birthday', 'Birthday Celebration', 'Welcome to our Birthday party', NULL, '4', 'Y', '12:10:00', '13:10:00', 'O', '2023-06-27', '', '14:11:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 06:41:31', NULL, NULL),
(30, 1, 'V', '4', 'Bengali', NULL, 'icons_color/ice-cream.png', 'Ice cream', 'Cream Cream', 'Ice Cream stuffed with chocolate.', NULL, '1', 'Y', '13:05:00', '14:05:00', 'O', '2023-06-27', '', '14:06:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 07:36:13', NULL, NULL),
(31, 1, 'V', '3', 'Bengali', NULL, 'icons_color/enter-win.png', 'Lucky Draw', 'Lottery', 'We are arranging a Lucky Draw event. Interested guests can feel free to join our event.', NULL, '4', 'Y', '13:10:00', '14:10:00', 'O', '2023-06-27', '', '14:11:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 07:42:12', NULL, NULL),
(32, 1, 'M', '7', 'Akan', NULL, 'icons_color/drinks.png', 'Mocktail Party', 'Lemon and Strawberry', 'Mocktail Party', NULL, '2', 'Y', '14:18:00', '15:18:00', 'O', '2023-06-28', '', '16:19:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 07:49:52', NULL, NULL),
(33, 1, 'G', '5', 'Abkhaz', NULL, 'mothers_day.jpg', 'Happy Mothers Day', 'Love you mom', 'Happy mothers day', NULL, '1', 'Y', '14:25:00', '18:25:00', 'O', '2023-07-04', '', '15:25:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 07:55:54', NULL, NULL),
(34, 1, 'G', '6', 'Basque', NULL, 'icons_color/island.png', 'Laguna Beach', 'Sun Bath', 'Sun Bath', NULL, '2', 'Y', '14:34:00', '15:34:00', 'O', '2023-06-27', '', '16:34:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-27 08:04:42', NULL, NULL),
(35, 1, 'H', '1A', 'English', NULL, 'icons_color/happy-sun.png', '4th July offer!!!!!!!!', 'Hey Happy Hours!!!!', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 15', NULL, '1', 'Y', '11:00:00', '17:30:00', 'O', '2023-06-28', '', '11:02:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-28 10:51:54', NULL, NULL),
(36, 1, 'H', '1S', 'Bengali', NULL, '79947294.png', 'This is a sample title', 'tweaetwrqvqwrt', 'wy4eerywetawtv3twv', NULL, '1', 'Y', '00:00:00', '00:00:00', 'O', '2023-06-30', '', '23:40:00', 'D', 'N', 'N', 'admin@gmail.com', '2023-06-30 18:00:24', 'admin@gmail.com', '2023-06-30 18:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `td_notification_audience`
--

CREATE TABLE `td_notification_audience` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL COMMENT 'td_notification -> id',
  `guest_user_id` int(11) NOT NULL COMMENT 'td_guest_user -> id',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_notification_audience`
--

INSERT INTO `td_notification_audience` (`id`, `notification_id`, `guest_user_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 15, 3, 'admin@gmail.com', '2023-02-06 11:59:32', NULL, NULL),
(2, 15, 4, 'admin@gmail.com', '2023-02-06 11:59:32', NULL, NULL),
(3, 11, 22, 'admin@gmail.com', '2023-02-06 11:59:32', NULL, NULL),
(4, 30, 47, 'admin@gmail.com', '2023-06-27 07:36:13', NULL, NULL),
(5, 33, 1, 'admin@gmail.com', '2023-06-27 07:55:54', NULL, NULL),
(6, 34, 39, 'admin@gmail.com', '2023-06-27 08:04:42', NULL, NULL),
(7, 36, 22, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(8, 36, 39, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(9, 36, 45, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(10, 36, 46, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(11, 36, 43, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(12, 36, 44, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(13, 36, 47, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL),
(14, 36, 40, 'admin@gmail.com', '2023-06-30 18:08:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_notification_dtls`
--

CREATE TABLE `td_notification_dtls` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `msg_id` int(11) NOT NULL,
  `send_by` varchar(50) NOT NULL,
  `send_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_notification_dtls`
--

INSERT INTO `td_notification_dtls` (`id`, `hotel_id`, `msg_id`, `send_by`, `send_at`) VALUES
(1, 1, 1, 'admin@gmail.com', '2023-01-23 15:20:00'),
(2, 1, 2, 'admin@gmail.com', '2023-01-23 15:20:00'),
(3, 1, 3, 'admin@gmail.com', '2023-01-23 15:20:00'),
(4, 1, 4, 'admin@gmail.com', '2023-02-01 15:20:00'),
(5, 1, 16, 'admin@gmail.com', '2023-02-10 15:20:00'),
(6, 1, 17, 'admin@gmail.com', '2023-02-10 15:20:00'),
(10, 1, 5, 'admin@gmail.com', '2023-02-13 08:05:44'),
(11, 1, 6, 'admin@gmail.com', '2023-02-13 08:06:59'),
(16, 1, 1, 'admin@gmail.com', '2023-02-13 11:20:27'),
(17, 1, 2, 'admin@gmail.com', '2023-02-13 11:20:31'),
(18, 1, 1, 'admin@gmail.com', '2023-02-13 11:53:17'),
(19, 1, 6, 'admin@gmail.com', '2023-02-13 11:53:30'),
(20, 1, 11, 'admin@gmail.com', '2023-02-13 11:53:30'),
(21, 1, 12, 'admin@gmail.com', '2023-03-09 10:20:31'),
(22, 1, 13, 'admin@gmail.com', '2023-03-09 10:53:17'),
(23, 1, 14, 'admin@gmail.com', '2023-03-09 10:53:30'),
(24, 1, 15, 'admin@gmail.com', '2023-03-08 10:53:30'),
(25, 1, 1, 'admin@gmail.com', '2023-06-28 06:09:21'),
(26, 1, 25, 'admin@gmail.com', '2023-06-28 07:59:01'),
(27, 1, 35, 'admin@gmail.com', '2023-06-28 11:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `td_other_image`
--

CREATE TABLE `td_other_image` (
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') NOT NULL COMMENT 'S :Service R :Restaurant',
  `srv_res_id` int(10) NOT NULL COMMENT 'Service (S):td_quest_service Restaurant (R) :td_quest_res_bars',
  `menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast\r\nL:Lunch\r\nD:Dinner\r\nR:Brunch\r\nS:Special\r\nA:Bar\r\nV:Menu Service',
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `cover_page_img` text DEFAULT NULL,
  `cover_page_url` text DEFAULT NULL,
  `top_image_img` text DEFAULT NULL,
  `top_img_url` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_other_image`
--

INSERT INTO `td_other_image` (`hotel_id`, `srv_res_flag`, `srv_res_id`, `menu_id`, `active_flag`, `cover_page_img`, `cover_page_url`, `top_image_img`, `top_img_url`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 'R', 1, 'B', 'Y', '1_1_3_cover_rest_logo.jpg', '', '34_3_top_top-dinner.jpg', '', '1', '2023-01-13 17:52:10', '1', '2023-01-13 18:41:04'),
(1, 'R', 1, 'L', 'Y', '1_1_3_cover_rest_logo.jpg', '', '34_3_top_top-dinner.jpg', '', '1', '2023-01-13 17:52:10', '1', '2023-01-13 18:41:04'),
(26, 'R', 62, 'A', 'Y', '26_R_62_A_cover_download.jpg', 'null', '26_R_62_A_top_images (2).jpg', 'null', 'undefined', '2023-07-04 12:08:11', 'undefined', '2023-07-04 12:08:25'),
(26, 'R', 63, 'A', 'Y', '26_R_63_A_cover_cycling.jpg', 'null', '26_R_63_A_top_airs.art-api.jpeg', 'null', 'undefined', '2023-07-05 07:48:41', 'undefined', '2023-07-05 08:10:34'),
(26, 'R', 64, 'D', 'Y', '26_R_64_D_cover_kfc_top.jpeg', 'null', '26_R_64_D_top_kfc_cov_1.jpeg', 'null', 'undefined', '2023-07-02 10:35:33', 'undefined', '2023-07-02 11:54:41'),
(26, 'R', 65, 'B', 'Y', '26_R_65_B_cover_croissants.jfif', 'null', NULL, NULL, 'undefined', '2023-07-02 11:57:42', NULL, NULL),
(27, 'R', 70, 'B', 'Y', '27_R_70_B_cover_Alicia Souza (2).jpg', 'null', '27_R_70_B_top_Breakfast-Menu.jpg', 'null', 'undefined', '2023-07-04 12:45:55', 'undefined', '2023-07-05 07:42:25'),
(27, 'R', 70, 'L', 'Y', '27_R_70_L_cover_Lunch Menu.jpeg', 'null', '27_R_70_L_top_Lunch Menu.jpeg', 'null', 'undefined', '2023-07-05 07:32:52', 'undefined', '2023-07-05 10:17:52'),
(27, 'R', 70, 'D', 'Y', '27_R_70_D_cover_Dinner-Menu.jpg', 'null', '27_R_70_D_top_Dinner-Menu.jpg', 'null', 'undefined', '2023-07-05 07:16:10', 'undefined', '2023-07-05 07:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `td_payment`
--

CREATE TABLE `td_payment` (
  `id` int(11) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `payment_through` varchar(20) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `amount` float(10,2) NOT NULL DEFAULT 0.00,
  `payment_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `payment_dt` datetime NOT NULL,
  `payment_by` varchar(50) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_pc_avatar`
--

CREATE TABLE `td_pc_avatar` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `avt_name` varchar(100) NOT NULL,
  `img_path` varchar(100) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_pc_avatar`
--

INSERT INTO `td_pc_avatar` (`id`, `hotel_id`, `avt_name`, `img_path`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Tyler Durden', 'stock/PNG_black/cutlery.png', 'admin@gmail.com', '2023-01-24 14:15:52', 'admin@gmail.com', '2023-06-25 08:04:54'),
(2, 9, 'Luca', '9_avatar_avImg_0.7864681343114077.jpg', 'admin@gmail.com', '2023-01-30 10:51:38', NULL, NULL),
(3, 12, 'Kuttus', '12_avatar_avImg_0.3928150569769566.jpg', 'admin@gmail.com', '2023-03-13 06:42:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_pc_voice`
--

CREATE TABLE `td_pc_voice` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('R','S') DEFAULT NULL,
  `srv_res_id` int(11) NOT NULL,
  `voice_id` varchar(50) DEFAULT NULL,
  `voice_speed` int(11) DEFAULT 0,
  `use_premium` tinyint(1) NOT NULL DEFAULT 0,
  `voice_path` text DEFAULT NULL,
  `sound_path` text DEFAULT NULL,
  `old_sound_path` text DEFAULT NULL,
  `sound_flag` enum('Y','N') NOT NULL DEFAULT 'Y',
  `msg_text` text DEFAULT NULL,
  `msg_active_flag` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_pc_voice`
--

INSERT INTO `td_pc_voice` (`id`, `hotel_id`, `srv_res_flag`, `srv_res_id`, `voice_id`, `voice_speed`, `use_premium`, `voice_path`, `sound_path`, `old_sound_path`, `sound_flag`, `msg_text`, `msg_active_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'R', 1, 'Mia', 100, 1, 'https://www.texttovoice.online/audios/v_A_es-MX_63dcdfcf5a285.mp3', 'audio/v_A_es-MX_63dcdfcf5a285.mp3', NULL, 'Y', 'Hello this is samata1', 'N', 'undefined', '2023-02-03 13:28:46', 'undefined', '2023-02-03 15:50:30'),
(2, 1, 'R', 3, 'Enrique', 100, 1, 'https://www.texttovoice.online/audios/v_A_es-ES_63dcc09244e81.mp3', 'audio/v_A_es-ES_63dcc09244e81.mp3', NULL, 'Y', 'The Trigger Fish Restaurant serves fresh locally caught fish, salads and fresh baked breads.\n\nWe are located by the Pool and the attire is casual.\n\nWe are open every day from 11 oclock in the morning until 10 oclock at night.\n\nBe sure to use the tabs above to view our menus, check todays specials and for any changes to the menus.\n\nEnjoy your meal!', 'Y', 'undefined', '2023-02-03 13:38:44', NULL, NULL),
(3, 1, NULL, 0, 'Naja', 100, 1, 'https://www.texttovoice.online/audios/v_A_da-DK_64a2b84b1de15.mp3', 'v_A_da-DK_64a2b84b1de15.mp3', NULL, 'N', 'Utsab da antibiotic kheye durbol hoye porechhe', 'Y', 'admin@gmail.com', '2023-02-03 15:55:59', 'admin@gmail.com', '2023-07-03 12:57:57'),
(4, 1, 'R', 3, 'Brian', 100, 1, 'https://www.texttovoice.online/audios/v_A_en-GB_63dcea102610e.mp3', 'audio/v_A_en-GB_63dcea102610e.mp3', NULL, 'Y', 'To order from the POOL MENU, simply scroll through the items, then select those that you would like to order.\nADD YOUR LOUNGE NUMBER to the order form.\nYour order will then be prepared and delivered to you, normally within 20 minutes.\nIf there is a delay or a menu change, we will contact you with an update here on the Directory.', 'Y', 'undefined', '2023-02-03 16:34:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_promotions_custom`
--

CREATE TABLE `td_promotions_custom` (
  `id` bigint(22) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_dt` date DEFAULT NULL,
  `anniversary_dt` date DEFAULT NULL,
  `authorization` enum('Y','N') NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `questions1` text NOT NULL,
  `questions2` text NOT NULL,
  `questions3` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_promotions_custom`
--

INSERT INTO `td_promotions_custom` (`id`, `restaurant_id`, `venue_id`, `first_name`, `last_name`, `email`, `birth_dt`, `anniversary_dt`, `authorization`, `mobile_no`, `questions1`, `questions2`, `questions3`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 9, 19, 'Subham', 'Samanta', 'samantasubham9804@gmail.com', '1996-05-29', '2022-02-04', 'Y', '9051203118', 'a', 'a', 'a', 'samantasubham9804@gmail.com', '2022-02-04 06:48:52', NULL, NULL),
(2, 9, 19, 'Chitto', 'Maity', 'meettan@gmail.com', '1994-02-09', '2019-03-08', 'Y', '8240378957', 'Sports', 'Football', 'Darjeeling', 'meettan@gmail.com', '2022-02-04 06:49:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_proposal`
--

CREATE TABLE `td_proposal` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `greeting` text DEFAULT NULL,
  `send_dt` date DEFAULT NULL,
  `dev_dtls` text DEFAULT NULL,
  `resend_dt` date DEFAULT NULL,
  `receive_dt` date DEFAULT NULL,
  `status` enum('D','P','A') NOT NULL DEFAULT 'P' COMMENT 'D: Decline,\r\nP: Pending,\r\nA: Accept',
  `status_dt` date DEFAULT NULL,
  `decline_dt` datetime DEFAULT NULL,
  `hotel_remarks` text DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_proposal`
--

INSERT INTO `td_proposal` (`id`, `hotel_id`, `greeting`, `send_dt`, `dev_dtls`, `resend_dt`, `receive_dt`, `status`, `status_dt`, `decline_dt`, `hotel_remarks`, `admin_notes`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Hello', '2023-02-07', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, '2023-05-11', 'A', '2023-05-11', NULL, '', '', 'admin@gmail.com', '2023-01-11 17:07:24', 'null', '2023-05-11 13:49:04'),
(2, 15, 'Hi Sayantika Pagli', '2023-05-11', 'You have no IQ', NULL, '2023-05-11', 'A', '2023-05-11', NULL, 'ghgdkuhgdukgcfwu', 'Admin Remarks', 'admin@gmail.com', '2023-05-10 07:03:39', 'null', '2023-05-11 11:56:54'),
(4, 17, 'Hi Sir,', '2023-05-13', 'We have reviewed your questionnaire form and sending you an estimate quote. Please review. Further any question please feal free for discussion', NULL, '2023-05-13', 'A', '2023-05-13', '2023-05-13 10:19:32', 'accept', 'I am very happy that you are decline our proposal', 'admin@gmail.com', '2023-05-13 09:23:04', 'null', '2023-05-13 10:42:59'),
(5, 20, '', NULL, '', NULL, '2023-06-09', 'A', '2023-06-09', NULL, '', NULL, 'admin@gmail.com', '2023-06-09 08:02:29', 'null', '2023-06-09 08:04:53'),
(6, 20, 'Hello', NULL, 'needed', NULL, NULL, 'P', NULL, NULL, NULL, NULL, 'admin@gmail.com', '2023-06-09 08:04:11', NULL, NULL),
(7, 26, 'Hello,\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.', '2023-07-01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, '2023-07-01', 'A', '2023-07-01', NULL, '', NULL, 'admin@gmail.com', '2023-07-01 06:02:34', 'null', '2023-07-01 06:15:19'),
(8, 25, 'Poulomi', '2023-07-03', 'Dear The Asian Santaroni,\n\nI am writing to submit a proposal for the development of a dynamic and engaging website for your business. As a seasoned web developer, I understand the critical role a well-designed website plays in enhancing your online presence and attracting potential customers. I am excited to offer my expertise and collaborate with you to create a website that meets your business needs and goals.\n\nI. Project Overview:\n\nThe objective of this project is to design and develop a user-friendly, mobile-responsive website for The Asian Santaroni. The website will serve as an interactive platform to showcase your products/services, share relevant information, and enable potential customers to contact you effortlessly. The website will be built with modern web technologies to ensure optimal performance, security, and scalability.\n\nII. Scope of Work:\n\n1. Discovery Phase:\n        \nConduct initial meetings to gather requirements and understand your business goals.\nPerform a competitive analysis to identify opportunities for differentiation.\n\n2. Website Design:\n\nCreate a custom, modern, and visually appealing website design tailored to your brand identity.\nDesign wireframes and mockups to demonstrate the layout and user experience.\n\n3. Website Development:\n\nDevelop the website using HTML5, CSS3, JavaScript, and other relevant technologies.\nEnsure the website is fully responsive across various devices and browsers.\nImplement essential features such as contact forms, social media integration, and a blog section.\n\n4. Content Management System (CMS):\n\nIntegrate a user-friendly CMS, such as WordPress, to enable easy content updates.\nProvide training on how to use the CMS effectively.\n\n5. Search Engine Optimization (SEO):\n\nOptimize the websites structure and content to enhance its visibility on search engines.\nImplement best SEO practices to improve organic traffic.\n\n6. Testing and Quality Assurance:\n\nThoroughly test the websites functionality, performance, and compatibility.\nFix any bugs or issues that may arise during the testing phase.\n\n7. Deployment and Launch:\n\nDeploy the website on your chosen hosting platform.\nAssist with the websites launch and monitor its performance post-launch.\n\nV. Terms and Conditions:\n\nThis proposal is valid until this Year. Prices and terms are subject to change after this date. Any additional features or functionalities requested beyond the scope of this proposal will be discussed separately and may incur additional costs. Both parties will sign a formal agreement detailing the project scope, timelines, and payment terms before commencing work.\n\nVI. Contact:\n\nPlease do not hesitate to contact me for any questions or clarifications regarding this proposal. I am eager to discuss your vision and objectives further and explore the opportunity to work together.\n\nThank you for considering this proposal. I look forward to the possibility of contributing to the success of The Asian Santaroni.', NULL, '2023-07-03', 'A', '2023-07-03', NULL, 'Thank you. ', NULL, 'admin@gmail.com', '2023-07-03 06:11:59', 'null', '2023-07-03 06:36:10'),
(9, 27, 'Jason Wine', '2023-07-04', 'Include an executive summary\n\nThe executive summary is the first and most important part of your project proposal and should be written last. If it fails to capture the attention of your readers and make a compelling point, it may doom your proposal right then and there. Think of it as the elevator pitch for your project and focus on describing what success would look like.\n\nHere are some guiding questions to help you get started:\n\n    What problem does your project aim to solve?\n\n    Why is it important to solve it?\n\n    How will it help solve it?\n\nInclude the project background\n\nInclude a section where you go into more detail about the problem you are solving. Prove to your readers why they should care about this project and back your claims with relevant references and statistics.\n\nConsider providing answers to the following questions:\n\n    What is the history of the problem? How long has it existed?\n\n    How is solving it related to the business goals of your organization?\n\nExplain your solution\n\nAfter you have described the problem, its time to lay out the proposed solution:\n\n    How will you solve the problem you described?\n\n    Why will the proposed solution be effective?\n\n    Why is the proposed solution better than alternatives?\n\n    What would it take to make it happen?\n\nDefine the deliverables and success criteria\n\nMake it clear how the success of your proposed project will be measured:\n\n    What will be the project deliverables?\n\n    What are the SMART (specific, measurable, achievable, realistic, and time-bound) objectives of the project?\n\nList the required resources\n\nBe realistic and detailed when you estimate your project budget requirements. Include the supplies, tools, ad spend including cost per click, salaries, and whatever else would be required to successfully deliver the project.\n\nA detailed financial breakdown will signal to the stakeholders that youve done your research and assure them that there wouldnt be many unexpected costs down the road. If youre working on a project for an external client, a good way to avoid any surprises would be to provide them with a formal cost estimate and get their approval.\n\nYou may want to conclude the document with a brief conclusion. Reiterate the points you made and remind your audience why they should approve your proposal, without introducing any new information.', NULL, '2023-07-04', 'A', '2023-07-04', '2023-07-04 11:24:16', '', 'null', 'admin@gmail.com', '2023-07-04 10:12:01', 'null', '2023-07-04 11:25:26'),
(10, 27, '', NULL, '', NULL, NULL, 'P', NULL, NULL, NULL, NULL, 'admin@gmail.com', '2023-07-04 10:12:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_proposal_dtls`
--

CREATE TABLE `td_proposal_dtls` (
  `id` int(11) NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `fee_type` text DEFAULT NULL,
  `fee_amount` varchar(50) NOT NULL,
  `remarks` text DEFAULT NULL,
  `additional_remarks` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_proposal_dtls`
--

INSERT INTO `td_proposal_dtls` (`id`, `proposal_id`, `fee_type`, `fee_amount`, `remarks`, `additional_remarks`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Setup fee', '100.00', 'Sample note for setup fee. ', 'Sample additional notes for setup fee', 'admin@gmail.com', '2023-01-11 17:07:24', 'admin@gmail.com', '2023-01-16 10:35:04'),
(3, 1, 'Subscription fee', '756.00', 'Sample note for Subscription fee', 'Sample additional notes for Subscription fee', 'admin@gmail.com', '2023-01-12 11:04:18', 'admin@gmail.com', '2023-01-16 10:35:04'),
(6, 2, 'Signholder', '120.00', 'Per signholder 20', 'none', 'admin@gmail.com', '2023-05-10 07:05:49', NULL, NULL),
(7, 2, 'Table Top', '450.00', 'Per table top 45', 'none', 'admin@gmail.com', '2023-05-10 07:05:49', NULL, NULL),
(8, 3, 'Table Top', '160.00', '100/Item', 'none', 'admin@gmail.com', '2023-05-13 09:21:50', NULL, NULL),
(9, 3, 'Signage', '50.00', '10/Item', 'none', 'admin@gmail.com', '2023-05-13 09:21:50', NULL, NULL),
(10, 4, 'Table Top', '160.00', '100/Item', 'none', 'admin@gmail.com', '2023-05-13 09:23:04', NULL, NULL),
(11, 4, 'Signage', '50.00', '10/Item', 'none', 'admin@gmail.com', '2023-05-13 09:23:04', NULL, NULL),
(12, 6, 'Signholder', '240.00', 'special needed', '', 'admin@gmail.com', '2023-06-09 08:04:11', NULL, NULL),
(13, 6, 'Table Top', '160.00', 'urgent needed', '', 'admin@gmail.com', '2023-06-09 08:04:11', NULL, NULL),
(14, 7, 'Table Top', '500.00', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.', 'admin@gmail.com', '2023-07-01 06:02:34', NULL, NULL),
(15, 7, 'Signholder', '160.00', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.', 'admin@gmail.com', '2023-07-01 06:02:34', NULL, NULL),
(16, 9, '50% Advance to Start with', '20000 USD', 'There is probably a lot you can say about your project – you have likely been thinking about it a lot. But is all that information relevant to the point you are trying to make? Focus on what would strengthen your pitch and provide as much detail as needed, not as much as possible.', 'Avoid vague goals such as increase MRR or optimize a process. Make sure your proposal clearly defines the success criteria of your project and keeps it SMART (specific, measurable, achievable, realistic, and time-bound).', 'admin@gmail.com', '2023-07-04 11:02:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_quest_add_lang`
--

CREATE TABLE `td_quest_add_lang` (
  `id` bigint(22) NOT NULL,
  `hotel_id` bigint(22) NOT NULL,
  `lang_id` varchar(20) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_quest_add_lang`
--

INSERT INTO `td_quest_add_lang` (`id`, `hotel_id`, `lang_id`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'lo', 'The Cliff', '2023-01-11 11:28:02', NULL, NULL),
(2, 1, 'lo', 'The Cliff', '2023-01-12 15:07:21', NULL, NULL),
(3, 1, 'lo', 'The Cliff', '2023-01-12 15:07:29', NULL, NULL),
(4, 1, 'lo', 'The Cliff', '2023-01-12 15:08:47', NULL, NULL),
(5, 1, 'lo', 'The Cliff', '2023-01-12 15:09:41', NULL, NULL),
(6, 1, 'lo', 'The Cliff', '2023-01-12 15:25:08', NULL, NULL),
(7, 1, 'lo', 'The Cliff', '2023-01-12 15:25:42', NULL, NULL),
(8, 1, 'lo', 'The Cliff', '2023-01-16 07:50:57', NULL, NULL),
(9, 1, 'lo', 'The Cliff', '2023-01-16 08:07:10', NULL, NULL),
(10, 1, 'lo', 'The Cliff', '2023-01-16 08:12:45', NULL, NULL),
(11, 1, 'lo', 'The Cliff', '2023-01-16 08:24:15', NULL, NULL),
(12, 1, 'lo', 'The Cliff', '2023-01-16 08:28:45', NULL, NULL),
(13, 9, 'ms', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(14, 12, 'es', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(15, 1, 'lo', 'The Cliff', '2023-04-03 08:33:33', NULL, NULL),
(16, 13, 'lt', 'KFC', '2023-04-03 11:54:49', NULL, NULL),
(17, 13, 'lt', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(19, 15, 'es', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(20, 16, 'na', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(21, 16, 'gv', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(22, 17, 'th', 'The Mariott', '2023-05-13 08:16:21', NULL, NULL),
(23, 17, 'th', 'The Mariott', '2023-05-13 08:30:13', NULL, NULL),
(24, 20, 'es', 'Deja Brew', '2023-06-09 07:54:02', NULL, NULL),
(27, 24, 'es', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(28, 25, 'ro', 'The Asian Santaroni', '2023-06-30 11:06:07', NULL, NULL),
(29, 24, 'si', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(30, 25, 'ro', 'The Asian Santaroni', '2023-06-30 11:42:17', NULL, NULL),
(31, 26, 'es', 'Deja Brew', '2023-06-30 11:46:02', NULL, NULL),
(32, 26, 'es', 'Deja Brew', '2023-06-30 12:01:21', NULL, NULL),
(33, 26, 'es', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(34, 27, '', 'Beachside Getaway', '2023-07-04 07:00:52', NULL, NULL),
(35, 27, '', 'Beachside Getaway', '2023-07-04 07:14:04', NULL, NULL),
(36, 27, '', 'Beachside Getaway', '2023-07-04 07:18:03', NULL, NULL),
(37, 27, 'ml', 'Beachside Getaway', '2023-07-04 09:22:20', NULL, NULL),
(38, 27, 'ml', 'Beachside Getaway', '2023-07-04 09:30:04', NULL, NULL),
(39, 26, '', 'Deja Brew', '2023-07-04 09:52:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_quest_res_bars`
--

CREATE TABLE `td_quest_res_bars` (
  `id` bigint(22) NOT NULL,
  `hotel_id` bigint(22) NOT NULL,
  `hotel_type` enum('R','B') NOT NULL DEFAULT 'R' COMMENT 'R->Restaurant; B->Bars',
  `name` varchar(50) DEFAULT NULL,
  `breakfast` enum('Y','N') NOT NULL DEFAULT 'N',
  `lunch` enum('Y','N') NOT NULL DEFAULT 'N',
  `dinner` enum('Y','N') NOT NULL DEFAULT 'N',
  `brunch` enum('Y','N') NOT NULL DEFAULT 'N',
  `bar_menu` enum('Y','N') NOT NULL DEFAULT 'N',
  `special_menu` enum('Y','N') NOT NULL,
  `chat_option` enum('CO','CA','CB') DEFAULT NULL COMMENT 'CO-> Chat Only; CA-> Call; CB-> Chat Bot',
  `reservation` enum('Y','N') NOT NULL DEFAULT 'N',
  `reservation_paltform` enum('Y','N') NOT NULL DEFAULT 'N',
  `reservation_option` enum('CO','CA') DEFAULT NULL COMMENT 'CO-> Chat Only; CA-> Call',
  `live_dir_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_quest_res_bars`
--

INSERT INTO `td_quest_res_bars` (`id`, `hotel_id`, `hotel_type`, `name`, `breakfast`, `lunch`, `dinner`, `brunch`, `bar_menu`, `special_menu`, `chat_option`, `reservation`, `reservation_paltform`, `reservation_option`, `live_dir_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'R', 'Trigger Fish', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'The Cliff', '2023-01-11 11:28:02', 'undefined', '2023-06-30 05:30:02'),
(3, 1, 'B', 'Pool Bar', 'Y', 'N', 'N', 'N', 'N', 'N', 'CA', 'Y', 'Y', 'CO', 'N', 'The Cliff', '2023-01-12 15:25:42', NULL, NULL),
(4, 9, 'B', 'POOL BAR', 'N', 'N', 'N', 'N', 'Y', 'N', 'CA', 'Y', 'N', 'CO', 'N', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(5, 9, 'R', 'LAGOON', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CA', 'Y', 'Y', 'CO', 'N', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(6, 12, 'R', 'Ottimo', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'CA', 'Y', 'N', 'CO', 'N', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(7, 12, 'B', 'Gourmet Couch', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'Y', 'Y', 'CA', 'N', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(8, 13, 'R', 'Diamond Plaza', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'CO', 'N', 'N', NULL, 'N', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(9, 13, 'R', 'Kashba', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'CO', 'N', 'N', NULL, 'N', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(11, 15, 'B', 'Calcutta ', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(12, 15, 'R', 'Calcutta Bistro', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(13, 16, 'B', 'The Daily Bread ', 'Y', 'N', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(14, 16, 'R', 'The Blue Plate ', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(15, 16, 'R', 'The Golden Fork', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(16, 16, 'B', 'The Table', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(17, 16, 'R', 'The Spice Route', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(18, 16, 'R', 'The Golden Fork', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(19, 16, 'B', 'The Blue Plate ', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(20, 16, 'B', 'The Table ', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(21, 16, 'R', 'The Spice Route', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(24, 17, 'R', 'Dejongo', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'The Mariott', '2023-05-13 08:30:13', NULL, NULL),
(25, 17, 'B', 'Last metro', 'N', 'N', 'N', 'Y', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'The Mariott', '2023-05-13 08:30:13', NULL, NULL),
(26, 20, 'B', 'Last Metro', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-09 07:54:02', NULL, NULL),
(27, 20, 'R', 'Last Metro', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-09 07:54:02', NULL, NULL),
(32, 24, 'B', 'Lord Drinks', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(33, 24, 'B', 'Roxy', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(34, 24, 'R', 'Das Cabin', 'N', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(35, 24, 'R', 'Calcutta Bistro', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(36, 24, 'R', 'Dejongo', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(37, 24, 'B', 'Aqua', 'N', 'N', 'Y', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(38, 25, 'B', 'Ginger9076&$$#@\"{}1', 'N', 'N', 'N', 'N', 'Y', 'N', 'CA', 'N', 'N', NULL, 'N', 'The Asian Santaroni', '2023-06-30 11:06:07', NULL, NULL),
(39, 25, 'R', 'Raw Meat99;@)', 'Y', 'N', 'N', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'The Asian Santaroni', '2023-06-30 11:06:07', NULL, NULL),
(40, 24, 'B', 'Last Metro', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(41, 24, 'B', 'What the food', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(42, 24, 'R', 'Dejongo', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(43, 24, 'R', 'Calcutta Bistro', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(44, 25, 'R', 'Lunchy brunchy ', 'N', 'N', 'N', 'Y', 'N', 'N', 'CA', 'N', 'N', NULL, 'N', 'The Asian Santaroni', '2023-06-30 11:42:17', NULL, NULL),
(45, 25, 'B', 'Fulloffire90865e@\"{}', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CB', 'N', 'N', NULL, 'N', 'The Asian Santaroni', '2023-06-30 11:42:17', NULL, NULL),
(62, 26, 'B', 'Lord Drinks', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(63, 26, 'B', 'Monkey Bar', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(64, 26, 'B', 'Dejongo', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(65, 26, 'R', 'Shisha', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(66, 26, 'R', 'Calcutta Bistro', 'N', 'Y', 'Y', 'N', 'N', 'N', 'CB', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(67, 26, 'R', 'Last Metro', 'N', 'N', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(70, 27, 'R', 'Tikkaway', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'CO', 'N', 'N', NULL, 'N', 'Beachside Getaway', '2023-07-04 09:30:04', NULL, NULL),
(71, 27, 'B', 'Bakstage', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CO', 'N', 'N', NULL, 'N', 'Beachside Getaway', '2023-07-04 09:30:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_quest_service`
--

CREATE TABLE `td_quest_service` (
  `id` bigint(22) NOT NULL,
  `hotel_id` bigint(22) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `breakfast` enum('Y','N') NOT NULL DEFAULT 'N',
  `lunch` enum('Y','N') NOT NULL DEFAULT 'N',
  `dinner` enum('Y','N') NOT NULL DEFAULT 'N',
  `brunch` enum('Y','N') NOT NULL DEFAULT 'N',
  `special` enum('Y','N') NOT NULL DEFAULT 'N',
  `calendar` enum('Y','N') NOT NULL DEFAULT 'N',
  `menu_service_list` enum('Y','N') NOT NULL DEFAULT 'N',
  `chat_type` enum('CO','CA','CB') DEFAULT NULL COMMENT 'CO-> Chat Only; CA-> Call; CB-> Chat Bot',
  `comments` varchar(100) NOT NULL,
  `live_dir_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_quest_service`
--

INSERT INTO `td_quest_service` (`id`, `hotel_id`, `service_name`, `breakfast`, `lunch`, `dinner`, `brunch`, `special`, `calendar`, `menu_service_list`, `chat_type`, `comments`, `live_dir_flag`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'The Cliff', '2023-01-11 11:28:02', 'The Cliff', '2023-04-03 08:33:33'),
(2, 1, 'Room Service', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N', 'CB', 'null', 'N', 'The Cliff', '2023-01-11 11:28:02', 'The Cliff', '2023-04-03 08:33:33'),
(4, 1, 'Gym', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CA', 'Gym comments', 'N', 'The Cliff', '2023-01-11 11:28:02', 'undefined', '2023-06-13 06:56:37'),
(5, 1, 'Spa', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CO', 'Business Comments', 'N', 'The Cliff', '2023-01-12 15:25:08', 'The Cliff', '2023-04-03 08:33:33'),
(6, 9, 'GOLF', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'CA', '', 'Y', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(7, 9, 'SPA', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CA', '', 'Y', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(8, 9, 'Room Service', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'Y', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(9, 9, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'Y', 'Darao Pothik Bor', '2023-01-27 12:41:22', NULL, NULL),
(10, 12, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(11, 12, 'Swimming Pool', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CA', '', 'N', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(12, 12, 'SPA', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'CA', '', 'N', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(13, 12, 'Room Service', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'CO', 'null', 'N', 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(50, 13, 'Spa', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CO', 'Bollam to debo na', 'N', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(51, 13, 'Gym', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CO', 'Debo na', 'N', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(52, 13, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(53, 13, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'KFC', '2023-04-03 11:57:34', NULL, NULL),
(56, 15, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(57, 15, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(58, 15, 'Spa', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'special', 'N', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(59, 15, 'Gym', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'good', 'N', 'Calcutta Bistro', '2023-05-10 06:58:16', NULL, NULL),
(60, 16, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(61, 16, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Cafe De Luxe', '2023-05-11 11:21:30', NULL, NULL),
(62, 16, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(63, 16, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Cafe De Luxe', '2023-05-11 11:29:37', NULL, NULL),
(64, 17, 'Spa', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'CO', 'special', 'N', 'The Mariott', '2023-05-13 08:16:21', NULL, NULL),
(67, 17, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'The Mariott', '2023-05-13 08:30:13', NULL, NULL),
(68, 17, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'The Mariott', '2023-05-13 08:30:13', NULL, NULL),
(69, 20, 'Spa', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'special', 'N', 'Deja Brew', '2023-06-09 07:54:02', NULL, NULL),
(70, 20, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-06-09 07:54:02', NULL, NULL),
(71, 20, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-06-09 07:54:02', NULL, NULL),
(76, 24, 'Spa', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'special', 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(77, 24, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(78, 24, 'Gym', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CA', 'special', 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(79, 24, 'Room Service', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-06-30 11:03:09', NULL, NULL),
(80, 25, 'GYM', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CA', 'dhujdshhdejnd', 'N', 'The Asian Santaroni', '2023-06-30 11:06:07', NULL, NULL),
(81, 25, 'SPA', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CA', 'gdwgdegfifrgf', 'N', 'The Asian Santaroni', '2023-06-30 11:06:07', NULL, NULL),
(82, 25, 'Room Service', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CA', 'null', 'N', 'The Asian Santaroni', '2023-06-30 11:06:07', 'The Asian Santaroni', '2023-06-30 11:42:17'),
(83, 25, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CA', 'null', 'N', 'The Asian Santaroni', '2023-06-30 11:06:07', 'The Asian Santaroni', '2023-06-30 11:42:17'),
(84, 24, 'gym', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CO', 'special', 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(85, 24, 'Spa', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CO', 'special', 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(86, 24, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CA', 'null', 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(87, 24, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-06-30 11:28:13', NULL, NULL),
(95, 26, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(96, 26, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(97, 26, 'Makeover Room', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CO', 'test', 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(98, 26, 'Golf', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CA', 'special', 'N', 'Deja Brew', '2023-07-01 05:55:20', NULL, NULL),
(99, 27, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Beachside Getaway', '2023-07-04 09:22:20', NULL, NULL),
(100, 27, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CA', 'null', 'N', 'Beachside Getaway', '2023-07-04 09:22:20', NULL, NULL),
(101, 27, 'Room Service', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'CO', 'null', 'N', 'Beachside Getaway', '2023-07-04 09:30:04', NULL, NULL),
(102, 27, 'No Idea', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'CA', 'No Comments', 'N', 'Beachside Getaway', '2023-07-04 09:30:04', NULL, NULL),
(103, 27, 'Front Desk', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'CA', 'null', 'N', 'Beachside Getaway', '2023-07-04 09:30:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_qustionnaire`
--

CREATE TABLE `td_qustionnaire` (
  `id` int(11) NOT NULL,
  `hotel_id` bigint(22) DEFAULT NULL,
  `first_call_dt` date DEFAULT NULL,
  `num_of_rooms` int(11) DEFAULT NULL,
  `platform_lang` enum('Y','N') DEFAULT 'N',
  `primary_lang` varchar(20) DEFAULT NULL,
  `add_lang_platform` varchar(50) DEFAULT NULL,
  `num_of_res` int(11) DEFAULT NULL,
  `num_of_bars` int(11) DEFAULT NULL,
  `hotel_part_of_chain` enum('Y','N') DEFAULT 'N',
  `quote` enum('Y','N') DEFAULT 'N',
  `comments` text DEFAULT NULL,
  `send_dt` date DEFAULT NULL,
  `receive_dt` date DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `resend_flag` enum('Y','N') DEFAULT 'N',
  `last_resend_dt` date DEFAULT NULL,
  `resend_qts` text DEFAULT NULL,
  `reply_resend_qts` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_qustionnaire`
--

INSERT INTO `td_qustionnaire` (`id`, `hotel_id`, `first_call_dt`, `num_of_rooms`, `platform_lang`, `primary_lang`, `add_lang_platform`, `num_of_res`, `num_of_bars`, `hotel_part_of_chain`, `quote`, `comments`, `send_dt`, `receive_dt`, `admin_note`, `resend_flag`, `last_resend_dt`, `resend_qts`, `reply_resend_qts`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, '2022-12-25', 3, 'Y', 'sq', '2', 3, 1, 'Y', 'Y', '2023-04-03 08:33:33', '2023-02-06', '2023-04-03', 'Sample note', 'N', NULL, 'sample additional questions', '', 'admin@gmail.com', '2023-01-11 11:00:51', 'admin@gmail.com', '2023-04-03 08:31:18'),
(2, 9, '2023-01-27', 12, 'Y', 'en', 'null', 6, 6, 'N', 'N', '2023-01-27 12:41:22', '2023-01-27', '2023-01-27', 'First Note', 'N', NULL, '', '', 'admin@gmail.com', '2023-01-27 11:36:06', 'admin@gmail.com', '2023-01-27 12:41:22'),
(3, 12, '2023-03-03', NULL, 'N', NULL, NULL, NULL, NULL, 'N', 'N', NULL, NULL, '2023-03-13', 'The ITC Royal Kolkata contacted us for THA .So before sending them a Proposal we are sending them Questionnaire', 'N', NULL, '', '', 'admin@gmail.com', '2023-03-13 08:41:06', 'admin@gmail.com', '2023-03-13 08:45:36'),
(4, 12, NULL, 100, 'Y', 'en', 'no', 2, 2, 'Y', 'N', 'wdwdwdqwefqefefefef', '2023-04-03', NULL, NULL, 'N', NULL, NULL, NULL, 'ITC Royal Bengal', '2023-03-13 09:02:31', NULL, NULL),
(5, 13, '2023-04-03', 20, 'Y', 'en', 'No', 5, 5, 'N', 'N', '2023-04-03 11:57:34', NULL, NULL, 'Quest  Note', 'N', NULL, NULL, NULL, 'admin@gmail.com', '2023-04-03 10:18:04', NULL, NULL),
(6, 15, '2023-05-10', 2, 'Y', 'en', 'Bengali', 2, 1, 'N', 'N', 'I have no questions thank u', '2023-06-09', '2023-05-10', NULL, 'N', NULL, NULL, NULL, 'Calcutta Bistro', '2023-05-10 06:58:16', 'admin@gmail.com', '2023-06-09 07:54:02'),
(7, 16, '2023-05-11', 5, 'Y', 'ab', 'No', 3, 2, 'N', 'N', '', NULL, '2023-05-11', 'Sample note', 'N', NULL, NULL, NULL, 'admin@gmail.com', '2023-05-11 11:06:01', NULL, NULL),
(8, 17, '2023-05-13', 1, 'N', 'en', 'no', 1, 1, 'N', 'N', 'Thank you', '2023-05-13', '2023-05-13', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'N', NULL, '', '', 'admin@gmail.com', '2023-05-13 06:01:39', 'admin@gmail.com', '2023-05-13 08:09:49'),
(9, 18, NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, '', 'N', NULL, NULL, NULL, 'admin@gmail.com', '2023-06-09 07:40:42', NULL, NULL),
(10, 20, NULL, 4, 'N', 'en', '', 1, 1, 'N', 'N', '', NULL, '2023-06-09', '', 'N', NULL, NULL, NULL, 'admin@gmail.com', '2023-06-09 07:44:59', NULL, NULL),
(11, 25, '2023-06-30', 100, 'N', 'en', 'No', 3, 2, 'N', 'N', '', '2023-06-30', '2023-06-30', 'For your Information', 'N', NULL, 'Number of Restaurants - 3 & Number of Bars - 2\n\nHowever You have added details of only 1 from each. Kindly resend the details', 'null', 'admin@gmail.com', '2023-06-30 09:49:28', 'admin@gmail.com', '2023-06-30 11:37:07'),
(12, 10, NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'N', 'N', NULL, NULL, NULL, '', 'N', NULL, NULL, NULL, 'admin@gmail.com', '2023-06-30 09:57:15', NULL, NULL),
(13, 24, NULL, NULL, 'N', NULL, NULL, NULL, NULL, 'N', 'N', NULL, '2023-06-30', '2023-06-30', '', 'N', NULL, '', '', 'admin@gmail.com', '2023-06-30 09:57:58', 'admin@gmail.com', '2023-06-30 12:01:21'),
(14, 26, '2023-06-30', 5, 'Y', 'en', 'No', 3, 3, 'N', 'N', 'no', '2023-07-01', '2023-07-01', '', 'N', NULL, '', '', 'admin@gmail.com', '2023-06-30 11:41:50', 'admin@gmail.com', '2023-07-01 05:49:57'),
(15, 27, '2023-07-04', 1, 'Y', 'en', 'No', 1, 1, 'N', 'N', 'Check Questionnaire for any Update or Edit', '2023-07-04', '2023-07-04', 'Questionnaire Form Need to Send to Client once again for fresh checking', 'N', NULL, 'Questionnaire sending to Hotel', '', 'admin@gmail.com', '2023-07-04 06:59:23', 'admin@gmail.com', '2023-07-04 09:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `td_reserv_conf`
--

CREATE TABLE `td_reserv_conf` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') DEFAULT NULL,
  `srv_res_id` int(11) NOT NULL,
  `reserv_date` date NOT NULL,
  `reserv_time_slot` varchar(50) NOT NULL,
  `st_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `no_of_pax` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_phone` bigint(20) DEFAULT NULL,
  `occation` varchar(50) DEFAULT NULL,
  `special_req` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_reserv_conf`
--

INSERT INTO `td_reserv_conf` (`id`, `hotel_id`, `srv_res_flag`, `srv_res_id`, `reserv_date`, `reserv_time_slot`, `st_time`, `end_time`, `no_of_pax`, `user_id`, `user_name`, `user_email`, `user_phone`, `occation`, `special_req`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(5, 1, 'R', 1, '2023-05-26', '21:00-22:00', '21:00:00', '22:00:00', 4, 1, 'Steven Smith', 'smithsteven96@gmail.com', 8583949565, 'Birthday', 'balloons', 'undefined', '2023-05-26 12:31:23', NULL, NULL),
(6, 1, 'R', 1, '2023-05-29', '14:00-15:00', '14:00:00', '15:00:00', 10, 1, 'Steven Smith', 'smithsteven96@gmail.com', 8583949565, 'Birthday', 'one bed', 'undefined', '2023-05-29 06:52:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_reserv_setup`
--

CREATE TABLE `td_reserv_setup` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `srv_res_flag` enum('S','R') NOT NULL COMMENT 'S :Service R :Restaurant',
  `srv_res_id` int(11) NOT NULL COMMENT 'Service (S):td_quest_service Restaurant (R) :td_quest_res_bars',
  `catg_id` int(11) NOT NULL COMMENT 'md_reserv_category->id',
  `max_capacity` int(11) NOT NULL,
  `no_of_pax` int(11) NOT NULL,
  `max_date_limit` int(11) NOT NULL,
  `res_open_time` time NOT NULL,
  `res_close_time` time NOT NULL,
  `time_duration` int(11) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_reserv_setup`
--

INSERT INTO `td_reserv_setup` (`id`, `hotel_id`, `srv_res_flag`, `srv_res_id`, `catg_id`, `max_capacity`, `no_of_pax`, `max_date_limit`, `res_open_time`, `res_close_time`, `time_duration`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'R', 1, 1, 40, 10, 30, '08:00:00', '23:59:59', 1, 'admin@gmail.com', '2023-05-22 18:28:21', NULL, NULL),
(2, 1, 'R', 1, 2, 60, 10, 30, '08:00:00', '23:59:59', 1, 'admin@gmail.com', '2023-05-22 18:28:21', NULL, NULL),
(3, 1, 'R', 2, 3, 40, 10, 30, '08:00:00', '23:59:59', 1, 'admin@gmail.com', '2023-05-22 18:28:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_restaurant_update`
--

CREATE TABLE `td_restaurant_update` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(10) NOT NULL,
  `update_txt` text NOT NULL,
  `on_off_flag` enum('Y','N') NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_schedue`
--

CREATE TABLE `td_schedue` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `date_on_off` enum('Y','N') NOT NULL DEFAULT 'Y',
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_section_image_request`
--

CREATE TABLE `td_section_image_request` (
  `id` int(11) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `sec_img` text DEFAULT NULL,
  `sec_url` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_section_image_request`
--

INSERT INTO `td_section_image_request` (`id`, `restaurant_id`, `menu_id`, `active_flag`, `sec_img`, `sec_url`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 3, 1, 'Y', NULL, 'https://www.waterside-inn.co.uk/', '3', '2021-10-07 09:38:13', '3', '2021-10-07 09:41:39'),
(2, 3, 1, 'Y', '3_1_section_1_menu_1.pdf', 'https://www.waterside-inn.co.uk/', '3', '2021-10-07 09:41:39', '3', '2021-10-07 09:41:39'),
(3, 3, 1, 'Y', '3_1_section_2_menu_2.pdf', 'https://www.waterside-inn.co.uk/', '3', '2021-10-07 09:41:39', '3', '2021-10-07 09:41:39'),
(4, 3, 2, 'Y', '3_2_section_1_menu_1.pdf', 'https://www.waterside-inn.co.uk/', '3', '2021-10-07 09:44:26', '3', '2021-10-07 09:44:26'),
(5, 3, 2, 'Y', '3_2_section_2_menu_2.pdf', 'https://www.waterside-inn.co.uk/', '3', '2021-10-07 09:44:26', '3', '2021-10-07 09:44:26'),
(6, 4, 1, 'Y', '4_1_section_IndusInd Partner Onboarding Doc.pdf', 'dasdasd', '4', '2021-10-07 12:55:42', NULL, NULL),
(7, 4, 1, 'Y', NULL, 'dasdasd', '4', '2021-10-07 12:55:42', NULL, NULL),
(8, 5, 1, 'Y', NULL, '', '5', '2021-10-07 13:12:01', NULL, NULL),
(9, 5, 2, 'Y', NULL, '', '5', '2021-10-07 13:13:24', NULL, NULL),
(10, 6, 1, 'Y', '6_1_section_1_menu_1.pdf', '', '6', '2021-10-08 06:22:23', '6', '2021-10-08 06:22:23'),
(11, 6, 1, 'Y', '6_1_section_2_menu_2.pdf', '', '6', '2021-10-08 06:22:23', '6', '2021-10-08 06:22:23'),
(12, 7, 1, 'Y', '7_1_section_1_menu_1.pdf', '', '7', '2021-10-08 06:30:21', '7', '2021-10-08 06:30:21'),
(13, 7, 1, 'Y', '7_1_section_2_menu_2.pdf', '', '7', '2021-10-08 06:30:21', '7', '2021-10-08 06:30:21'),
(14, 8, 2, 'Y', '8_2_section_1_menu_1.pdf', '', '8', '2021-10-08 06:49:30', '8', '2021-10-08 07:01:03'),
(15, 8, 2, 'Y', '8_2_section_2_menu_2.pdf', '', '8', '2021-10-08 06:49:30', '8', '2021-10-08 07:01:03'),
(16, 8, 2, 'Y', '8_2_section_3_menu_1.pdf', '', '8', '2021-10-08 07:01:03', '8', '2021-10-08 07:01:03'),
(17, 8, 2, 'Y', '8_2_section_4_menu_2.pdf', '', '8', '2021-10-08 07:01:03', '8', '2021-10-08 07:01:03'),
(18, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:10:35', '11', '2021-10-08 13:54:35'),
(19, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:10:35', '11', '2021-10-08 13:54:35'),
(20, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:31:17', '11', '2021-10-08 13:54:35'),
(21, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:34:37', '11', '2021-10-08 13:54:35'),
(22, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:34:37', '11', '2021-10-08 13:54:35'),
(23, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:34:37', '11', '2021-10-08 13:54:35'),
(24, 11, 1, 'Y', '', 'section.com', '11', '2021-10-08 13:44:10', '11', '2021-10-08 13:54:35'),
(25, 13, 1, 'Y', NULL, 'https://www.thecliffresort.com.vn/events-wedding/wedding/', '13', '2021-10-11 06:09:08', NULL, NULL),
(26, 16, 1, 'Y', '', 'section.com', '16', '2021-10-11 14:02:37', '16', '2021-10-11 14:04:11'),
(27, 16, 1, 'Y', '', 'section.com', '16', '2021-10-11 14:02:37', '16', '2021-10-11 14:04:11'),
(28, 16, 2, 'Y', '', 'launchsection.com', '16', '2021-10-11 14:10:11', '16', '2021-10-11 14:11:51'),
(29, 16, 2, 'Y', '', 'launchsection.com', '16', '2021-10-11 14:10:11', '16', '2021-10-11 14:11:51'),
(30, 17, 1, 'Y', '17_1_section_sample.pdf', 'assad', '17', '2021-10-11 15:22:07', NULL, NULL),
(31, 17, 1, 'Y', NULL, 'assad', '17', '2021-10-11 15:22:07', NULL, NULL),
(32, 17, 2, 'Y', NULL, 'sadasd', '17', '2021-10-11 15:33:35', NULL, NULL),
(33, 18, 1, 'N', '', 'asdasdasd', '18', '2021-10-11 15:42:55', '18', '2021-10-11 15:49:48'),
(34, 18, 4, 'Y', NULL, 'wertyjhbv', '18', '2021-10-11 15:46:39', NULL, NULL),
(35, 19, 3, 'N', '', 'section.com', '19', '2021-10-11 16:14:38', '19', '2021-10-11 16:25:17'),
(36, 19, 3, 'N', '', 'section.com', '19', '2021-10-11 16:14:38', '19', '2021-10-11 16:25:17'),
(37, 19, 1, 'Y', '19_1_section_Administration-Platform.pdf', 'dsadasd', '19', '2021-10-11 16:29:32', '19', '2021-10-11 16:29:32'),
(38, 22, 1, 'Y', '22_1_section_1_menu_1.pdf', 'https://www.thecliffresort.com.vn/facilities/gym/', '22', '2021-10-13 06:05:47', '22', '2021-10-13 06:05:47'),
(39, 22, 1, 'Y', '22_1_section_2_menu_2.pdf', 'https://www.thecliffresort.com.vn/facilities/gym/', '22', '2021-10-13 06:05:47', '22', '2021-10-13 06:05:47'),
(40, 24, 1, 'Y', '24_1_section_sample.pdf', '', '24', '2021-10-16 04:49:03', NULL, NULL),
(41, 24, 1, 'Y', NULL, '', '24', '2021-10-16 04:49:03', NULL, NULL),
(42, 24, 3, 'Y', NULL, 'section.com', '24', '2021-10-16 04:58:14', NULL, NULL),
(44, 25, 1, 'Y', '25_1_section_Administration-Platform.pdf', 'https://royal_lala.com/break/section', '25', '2021-10-18 11:12:44', '25', '2021-10-18 11:12:44'),
(45, 25, 2, 'Y', '25_2_section_Administration-Platform.pdf', 'https://royal_lala.com/lun/section', '25', '2021-10-18 11:58:12', NULL, NULL),
(46, 25, 2, 'Y', NULL, 'https://royal_lala.com/lun/section', '25', '2021-10-18 11:58:12', NULL, NULL),
(47, 26, 1, 'Y', '26_1_section_1_menu_1.pdf', 'https://www.rediff.com/cricket/special/meet-indias-t20-world-cup-team/20211019.htm', '26', '2021-10-19 06:49:59', '26', '2021-10-19 06:49:59'),
(48, 26, 1, 'Y', '26_1_section_2_menu_2.pdf', 'https://www.rediff.com/cricket/special/meet-indias-t20-world-cup-team/20211019.htm', '26', '2021-10-19 06:49:59', '26', '2021-10-19 06:49:59'),
(49, 26, 2, 'Y', '26_2_section_menu_2.pdf', 'https://www.rediff.com/getahead/report/movie-legend-helens-sari-style/20211019.htm', '26', '2021-10-19 06:53:31', NULL, NULL),
(50, 26, 2, 'Y', NULL, 'https://www.rediff.com/getahead/report/movie-legend-helens-sari-style/20211019.htm', '26', '2021-10-19 06:53:31', NULL, NULL),
(51, 28, 1, 'Y', NULL, 'https://online.kfc.co.in/', '28', '2021-10-21 08:01:00', NULL, NULL),
(52, 30, 2, 'Y', NULL, 'https://online.kfc.co.in/', '30', '2021-10-21 10:12:20', NULL, NULL),
(53, 30, 3, 'N', '', 'https://online.kfc.co.in/', '30', '2021-10-21 10:15:16', '30', '2021-10-21 10:26:01'),
(54, 30, 1, 'Y', '', 'https://online.kfc.co.in/', '30', '2021-10-21 10:27:06', '30', '2021-10-21 11:37:45'),
(55, 31, 1, 'Y', '', 'https://online.kfc.co.in/', '31', '2021-10-22 09:44:48', '31', '2021-10-28 08:52:23'),
(56, 31, 2, 'Y', NULL, 'https://online.kfc.co.in/', '31', '2021-10-22 09:46:24', NULL, NULL),
(57, 41, 1, 'Y', NULL, 'www.synergicsoftek.in', '41', '2021-11-09 09:09:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_special_data`
--

CREATE TABLE `td_special_data` (
  `special_id` bigint(22) NOT NULL,
  `restaurant_id` int(10) NOT NULL,
  `menu_id` varchar(5) NOT NULL DEFAULT 'S',
  `menu_desc` text DEFAULT NULL,
  `img_catg` int(11) NOT NULL,
  `img_path` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` date DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_special_data`
--

INSERT INTO `td_special_data` (`special_id`, `restaurant_id`, `menu_id`, `menu_desc`, `img_catg`, `img_path`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 13, '5', NULL, 17, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/halloween.jpg', '13', '2021-10-11', '13', '2021-10-11'),
(2, 16, '5', 'null', 10, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/Book-cover-page-5-CRC.jpeg', '16', '2021-10-11', NULL, NULL),
(3, 17, '5', 'null', 10, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/Book-cover-page-5-CRC.jpeg', '17', '2021-10-11', NULL, NULL),
(4, 18, '5', 'null', 10, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/images (1).jpeg', '18', '2021-10-11', '18', '2021-10-11'),
(5, 19, '5', 'null', 7, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/user2.jpeg', '19', '2021-10-11', NULL, NULL),
(6, 22, '5', 'hghg\njvhgvhghghghg]\njvjdjvdjvdvdvdvd\nkjvndjknvdnvjdnvjnvdnv', 17, 'halloween.jpg', '22', '2021-10-13', '22', '2021-10-18'),
(7, 24, '5', 'null', 17, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/halloween.jpg', '24', '2021-10-16', NULL, NULL),
(8, 5, '5', '<font face=\"Arial\">kghjkhk</font>', 24, 'birthday.jpg', '5', '2021-10-18', '5', '2023-01-07'),
(9, 26, '5', '<span style=\"font-family: Arial;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the $150 Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of&nbsp;</span><i style=\"font-family: Arial;\"><u>classical Latin literature</u></i><span style=\"font-family: Arial;\">&nbsp;from&nbsp;</span><span style=\"font-weight: bolder; font-family: Arial;\">$200</span><span style=\"font-family: Arial;\">&nbsp;All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true <b>generator</b> on the Internet. It uses a&nbsp;</span><u style=\"font-family: Arial;\"><i>dictionary</i></u><span style=\"font-family: Arial;\">&nbsp;of over<b>&nbsp;</b></span><span style=\"font-family: Arial;\"><b>$300.50</b></span>', 20, '79947294.png', '26', '2021-10-19', '26', '2021-11-05'),
(10, 28, '5', 'The country house cafe delights\n33\nThe country house cafe specials\n66', 20, 'Christmas-Wishes-Feature.jpg', '28', '2021-10-21', '28', '2021-10-21'),
(11, 30, '5', '8th day cafe and bakery specials\n88\n', 20, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/79947294.png', '30', '2021-10-21', '30', '2021-10-21'),
(12, 31, '5', 'null', 20, 'https://lagunaapi.shoplocal-lagunabeach.com/stock/79947294.png', '31', '2021-10-22', NULL, NULL),
(13, 34, '5', 'TO SHARE\nMarinated Olives 3.50 (vegan)\nCrispy Meaty Bits - with Korean BBQ sauce, sesame, scallions 8\nVeggie Bits - with crispy garlic & chilli sauce, sesame, scallions 6 (vegan)\nAPPETISERS\nSoup of the Day, croutes, crusty bread 6\nChicken Liver Parfait , Heathers Harvest carrot pickle, artisan toast 7\nFishermans Cocktail, smoked salmon, crayfish & crab, lemon & lobster mayo, gem hearts, buttered granary bread 9\nMezze, mixed bean hummus, ful medames, olives, pomegranate molasses, warm pitta 6.50 (vegan)\nFalafel Kamikaze, harissa ketchup, seeds & spices 6.50 (vegan)\nBOWLS \n‘SAN FRAN’ - crispy duck, oyster sauce, Chinatown noodles, greens, crispy chilli, kochajang, sesame 15 \nVIETNAMESE ‘SREET BUN’ - tempura avocado, hot firecracker rice noodles with beansprouts, carrot pickle, nam \nprik dressing, cucumber & scallions Bao bun, hot sauce 11.50 (vegan)\nSANDWICHES \nserved until 5pm\n{served on White or Brown Bread}\n‘TRIPLE ROAST’ - Corbett\'s roast beef, pork & lamb, stuffing, gravy pot & roasties 14\n‘MATURE CHEDDAR & HEATHERS HARVEST CARROT PICKLE’ - 7.50*\n‘SMOKED SALMON & CRAYFISH COCKTAIL’ - lobster mayo, cucumber, lemon 10*\n‘MEDINA’ - chicken, harissa, halloumi, tomato, nuts & seeds 10*\nserved with French Fries *\nCLASSICS\nWild Mushroom Risotto, summer greens, pumpkin seeds - small 9 • large 14 (vegan)\n‘Caesar Salad’, Shropshire chicken, bacon, anchovies, croutons, gem, Caesar dressing, parmesan 14\nMiso Sesame Buttered Roast Salmon, firecracker rice noodles, cucumber, scallions, miso roasted cashews 15.50\nShropshire Ham, Hollowdene hens eggs, chips 14\nPlease advise us of any allergies or dietary requirements and our chefs will be pleased to help', 20, 'Christmas-Wishes-Feature.jpg', '34', '2021-11-01', '34', '2021-11-15'),
(14, 38, '5', 'View our online menu below or search to view and download a specific cafe\'s menu. Indulgences. Served with two eggs any style and choice of baked bacon, house', 17, 'halloween.jpg', '38', '2021-11-02', '38', '2021-11-02'),
(15, 44, '5', '<p><span><font color=\"#ff1414\"><b>Located on Boise restaurant row on Eighth Street, The Matador turns out a clever luncheon special called the Mix and Match Lunch. Choose two menu items for $8.50 or three for $12 a choice of three from tacos made from braised beef, carnitas, pork belly, house made chorizo, braised chicken thigh, house-made tortilla soup, and seasonal salad or romaine salad. You can find other Matador locations in Seattle, Denver, and Portland, <u>Ore.</u></b></font></span></p>', 24, 'birthday.jpg', '44', '2021-11-22', '44', '2021-11-23'),
(16, 48, '5', '<p><font color=\"#f26363\"><b>We have special menu on christmas</b></font></p><p><font face=\"Arial\" color=\"#f26363\"><b>Bacons $88</b></font></p><p><font face=\"Arial\" color=\"#f26363\"><b>Bagel $56</b></font></p><p><font face=\"Arial\" color=\"#f26363\"><b>Turkey $55</b></font></p>', 20, 'Christmas-Wishes-Feature.jpg', '48', '2021-11-26', '48', '2021-11-26'),
(24, 1, 'S', 'ghrsgsr', 19, 'thanksgiving.jpeg', '1', '2023-01-15', '1', '2023-01-15'),
(25, 62, 'S', 'null', 26, 'HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', '62', '2023-07-04', '62', '2023-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `td_special_date_time`
--

CREATE TABLE `td_special_date_time` (
  `special_id` bigint(22) NOT NULL,
  `active_flag` enum('Y','N') NOT NULL,
  `regular_menu_flag` enum('E','A') NOT NULL COMMENT 'E: Exclusively; A: In Addition',
  `day_flag` enum('E','S') NOT NULL COMMENT 'E: Every Week; S: Specific Date',
  `month_day` int(11) DEFAULT NULL,
  `menu_frm_dt` date DEFAULT NULL,
  `menu_to_dt` date DEFAULT NULL,
  `regular_menu_id` enum('B','L','D','R','S','A','V') NOT NULL COMMENT 'B:Breakfast L:Lunch D:Dinner R:Brunch S:Special A:Bar V:Menu Service',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_stock_image`
--

CREATE TABLE `td_stock_image` (
  `id` bigint(22) NOT NULL,
  `img_catg` int(11) NOT NULL COMMENT 'md_special_category -> id',
  `img_path` text NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `td_stock_image`
--

INSERT INTO `td_stock_image` (`id`, `img_catg`, `img_path`, `created_by`, `created_dt`) VALUES
(14, 20, '79947294.png', 'admin@gmail.com', '2021-10-18 12:04:35'),
(16, 20, 'Christmas-Wishes-Feature.jpg', 'admin@gmail.com', '2021-10-18 12:07:11'),
(19, 24, 'birthday.jpg', 'admin@gmail.com', '2021-10-27 06:40:37'),
(20, 25, 'anniversary.jpg', 'admin@gmail.com', '2021-10-27 06:41:42'),
(21, 9, 'mothers_day.jpg', 'admin@gmail.com', '2022-01-20 07:45:59'),
(22, 19, 'thanksgiving.jpeg', 'admin@gmail.com', '2022-01-20 07:47:11'),
(23, 26, 'HD-wallpaper-itachi-uchiha-sasuke-sasuke-uchiha-anime-kakashi-naruto-anime-naruto-uzumaki.jpeg', 'admin@gmail.com', '2023-05-03 10:01:16'),
(25, 27, 'abstract-g8376ce235_1280.png', 'admin@gmail.com', '2023-05-30 06:51:43'),
(26, 27, 'divider-g2fccff667_1280.png', 'admin@gmail.com', '2023-05-30 06:52:05'),
(27, 27, 'divider-g7d5556867_1280.png', 'admin@gmail.com', '2023-05-30 06:52:16'),
(28, 27, 'divider-g7e6663638_1280.png', 'admin@gmail.com', '2023-05-30 06:52:25'),
(29, 27, 'divider-g92d5b0122_1280.png', 'admin@gmail.com', '2023-05-30 06:52:32'),
(30, 27, 'divider-ged91b08b0_1280.png', 'admin@gmail.com', '2023-05-30 06:52:46'),
(31, 28, 'icons_color/enter-win.png', NULL, NULL),
(32, 28, 'icons_color/happy-sun.png', NULL, NULL),
(33, 28, 'icons_color/happy-sun-2.png', NULL, NULL),
(34, 28, 'icons_color/ice-cream.png', NULL, NULL),
(35, 28, 'icons_color/island.png', NULL, NULL),
(36, 28, 'icons_color/masks.png', NULL, NULL),
(37, 28, 'icons_color/music-notes.jpg', NULL, NULL),
(38, 28, 'icons_color/music-notes-2.png', NULL, NULL),
(39, 28, 'icons_color/pretzel.png', NULL, NULL),
(40, 28, 'icons_color/severe-weather.png', NULL, NULL),
(41, 28, 'icons_color/severe-weather-circle.png', NULL, NULL),
(42, 28, 'icons_color/tiki-bar.png', NULL, NULL),
(43, 28, 'icons_color/beacon.png', NULL, NULL),
(44, 28, 'icons_color/candy-shop.png', NULL, NULL),
(45, 28, 'icons_color/drinks.png', NULL, NULL),
(46, 29, 'PNG_black/beach-sun.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(47, 29, 'PNG_black/bellboy trolley.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(48, 29, 'PNG_black/burger.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(49, 29, 'PNG_black/camera-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(50, 29, 'PNG_black/camera.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(51, 29, 'PNG_black/car-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(52, 29, 'PNG_black/car-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(53, 29, 'PNG_black/car.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(54, 29, 'PNG_black/chef.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(55, 29, 'PNG_black/coke-n-burger.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(56, 29, 'PNG_black/concierge.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(57, 29, 'PNG_black/crab.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(58, 29, 'PNG_black/cup.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(59, 29, 'PNG_black/cutlery.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(60, 29, 'PNG_black/cyclists.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(61, 29, 'PNG_black/drink-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(62, 29, 'PNG_black/drink.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(63, 29, 'PNG_black/dry-cleaning.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(64, 29, 'PNG_black/fish-bones.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(65, 29, 'PNG_black/fries.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(66, 29, 'PNG_black/fun.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(67, 29, 'PNG_black/golf-kart.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(68, 29, 'PNG_black/golfer.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(69, 29, 'PNG_black/hair-dryer.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(70, 29, 'PNG_black/ice-cream-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(71, 29, 'PNG_black/ice-cream-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(72, 29, 'PNG_black/ice-cream.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(73, 29, 'PNG_black/lilly.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(74, 29, 'PNG_black/limo.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(75, 29, 'PNG_black/lost-found.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(76, 29, 'PNG_black/maid.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(77, 29, 'PNG_black/music-notes.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(78, 29, 'PNG_black/music.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(79, 29, 'PNG_black/nail-varnsih.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(80, 29, 'PNG_black/office-chair.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(81, 29, 'PNG_black/palm-tree.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(82, 29, 'PNG_black/presents.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(83, 29, 'PNG_black/question.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(84, 29, 'PNG_black/reception-bell.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(85, 29, 'PNG_black/receptionist-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(86, 29, 'PNG_black/receptionist.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(87, 29, 'PNG_black/restaurant-sign.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(88, 29, 'PNG_black/scissors.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(89, 29, 'PNG_black/shopper-1.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(90, 29, 'PNG_black/shopper-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(91, 29, 'PNG_black/shopping-bag.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(92, 29, 'PNG_black/skiing.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(93, 29, 'PNG_black/spa-studio.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(94, 29, 'PNG_black/suggestions.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(95, 29, 'PNG_black/sunbed-umbrella.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(96, 29, 'PNG_black/sunbed.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(97, 29, 'PNG_black/tea-bag.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(98, 29, 'PNG_black/trolley.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(99, 29, 'PNG_black/waiter-bow-tie.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(100, 29, 'PNG_black/waiter-drinks-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(101, 29, 'PNG_black/waiter-drinks-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(102, 29, 'PNG_black/waiter-drinks.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(103, 29, 'PNG_black/waiter-tray-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(104, 29, 'PNG_black/waiter-tray.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(105, 29, 'PNG_black/watch-face-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(106, 29, 'PNG_black/watch-face.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(107, 29, 'PNG_black/watchface-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(108, 29, 'PNG_black/weightlifter.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(109, 29, 'PNG_black/weights.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(110, 29, 'PNG_black/wine-glass.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(111, 30, 'PNG_white/beach-sun.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(112, 30, 'PNG_white/bellboy trolley.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(113, 30, 'PNG_white/burger.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(114, 30, 'PNG_white/camera-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(115, 30, 'PNG_white/camera.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(116, 30, 'PNG_white/car-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(117, 30, 'PNG_white/car-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(118, 30, 'PNG_white/car.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(119, 30, 'PNG_white/chef.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(120, 30, 'PNG_white/coke-n-burger.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(121, 30, 'PNG_white/concierge.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(122, 30, 'PNG_white/crab.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(123, 30, 'PNG_white/cup.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(124, 30, 'PNG_white/cutlery.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(125, 30, 'PNG_white/cyclists.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(126, 30, 'PNG_white/drink-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(127, 30, 'PNG_white/drink.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(128, 30, 'PNG_white/dry-cleaning.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(129, 30, 'PNG_white/fish-bones.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(130, 30, 'PNG_white/fries.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(131, 30, 'PNG_white/fun.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(132, 30, 'PNG_white/golf-kart.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(133, 30, 'PNG_white/golfer.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(134, 30, 'PNG_white/hair-dryer.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(135, 30, 'PNG_white/ice-cream-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(136, 30, 'PNG_white/ice-cream-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(137, 30, 'PNG_white/ice-cream.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(138, 30, 'PNG_white/lilly.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(139, 30, 'PNG_white/limo.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(140, 30, 'PNG_white/lost-found.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(141, 30, 'PNG_white/maid.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(142, 30, 'PNG_white/music-notes.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(143, 30, 'PNG_white/music.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(144, 30, 'PNG_white/nail-varnsih.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(145, 30, 'PNG_white/office-chair.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(146, 30, 'PNG_white/palm-tree.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(147, 30, 'PNG_white/presents.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(148, 30, 'PNG_white/question.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(149, 30, 'PNG_white/reception-bell.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(150, 30, 'PNG_white/receptionist-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(151, 30, 'PNG_white/receptionist.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(152, 30, 'PNG_white/restaurant-sign.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(153, 30, 'PNG_white/scissors.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(154, 30, 'PNG_white/Sheet of PNG icons - white.pub', 'admin@gmail.com', '2023-06-06 16:14:12'),
(155, 30, 'PNG_white/shopper-1.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(156, 30, 'PNG_white/shopper-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(157, 30, 'PNG_white/shopping-bag.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(158, 30, 'PNG_white/skier.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(159, 30, 'PNG_white/skiing.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(160, 30, 'PNG_white/spa-studio.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(161, 30, 'PNG_white/suggestions.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(162, 30, 'PNG_white/sunbed-umbrella.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(163, 30, 'PNG_white/sunbed.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(164, 30, 'PNG_white/tea-bag.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(165, 30, 'PNG_white/trolley.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(166, 30, 'PNG_white/waiter-bow-tie.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(167, 30, 'PNG_white/waiter-drinks-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(168, 30, 'PNG_white/waiter-drinks-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(169, 30, 'PNG_white/waiter-drinks.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(170, 30, 'PNG_white/waiter-tray-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(171, 30, 'PNG_white/waiter-tray.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(172, 30, 'PNG_white/watch-face-2.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(173, 30, 'PNG_white/watch-face.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(174, 30, 'PNG_white/watchface-3.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(175, 30, 'PNG_white/weightlifter.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(176, 30, 'PNG_white/weights.png', 'admin@gmail.com', '2023-06-06 16:14:12'),
(177, 30, 'PNG_white/wine-glass.png', 'admin@gmail.com', '2023-06-06 16:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `td_subscription`
--

CREATE TABLE `td_subscription` (
  `id` bigint(22) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `subscription_date` datetime NOT NULL,
  `package_id` bigint(22) NOT NULL,
  `dedcution_date` datetime NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_suggestion_box`
--

CREATE TABLE `td_suggestion_box` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sugg_date` date DEFAULT NULL,
  `sugg` text NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_suggestion_box`
--

INSERT INTO `td_suggestion_box` (`id`, `hotel_id`, `user_id`, `sugg_date`, `sugg`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(2, 1, 22, '2023-03-08', 'Room service can be better!', 'nick@gmail.com', '2023-03-08 09:38:53', NULL, NULL),
(4, 1, 22, '2023-03-08', 'There should be a provision for cleaning.', 'nick@gmail.com', '2023-03-08 10:10:08', NULL, NULL),
(5, 1, 22, '2023-03-09', 'Excellent hotel with excellent location located at the city center,extremely clean & comfortable . Upon arrival we were warmly welcomed by the friendly reception staff Ildiko ,she makes our trip more interesting with her advices & tips about the city ,supermarket ,shops,restaurants bars are within walking distance. Would definetely recommend this hotel to everybody! Its a true sample of excellent hospitality. Thank you again Ildico for going just that little step extra for the guests!!!More', 'nick@gmail.com', '2023-03-09 08:33:51', NULL, NULL),
(7, 1, 22, '2023-03-10', 'The kitchen is dirty. Clean it.', 'nick@gmail.com', '2023-03-10 10:00:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_support_log`
--

CREATE TABLE `td_support_log` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `tkt_date` datetime NOT NULL,
  `tkt_no` varchar(50) NOT NULL,
  `hotel_user_name` varchar(50) NOT NULL,
  `hotel_user_phone` varchar(20) NOT NULL,
  `hotel_user_email` varchar(50) NOT NULL,
  `hotel_user_desig` varchar(50) DEFAULT NULL,
  `issue` text NOT NULL,
  `file_path` text DEFAULT NULL,
  `tkt_attend_dt` datetime DEFAULT NULL,
  `tkt_solved_by` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `tkt_status` enum('P','I','S') NOT NULL DEFAULT 'P',
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_support_log`
--

INSERT INTO `td_support_log` (`id`, `hotel_id`, `tkt_date`, `tkt_no`, `hotel_user_name`, `hotel_user_phone`, `hotel_user_email`, `hotel_user_desig`, `issue`, `file_path`, `tkt_attend_dt`, `tkt_solved_by`, `remarks`, `tkt_status`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(2, 1, '2023-06-24 06:58:08', '2023-2', 'test1', '8240404524', 'sayantika.dhar04@gmail.com', 'test1', 'test1', 'support/1_room.jpg', '2023-06-24 07:11:41', 'Admin', 'test ', 'S', 'test1', '2023-06-24 06:58:08', 'test1', '2023-07-03 11:23:29'),
(3, 1, '2023-06-25 04:24:10', '2023-3', 'test2', '8240404524', 'sayantika.dhar04@gmail.com', 'test2', 'test2', 'support/1_concierge.jpg', NULL, NULL, NULL, 'P', 'test2', '2023-06-25 04:24:10', NULL, NULL),
(5, 26, '2023-07-04 05:06:45', '2023-4', 'test3', '8250422346', 'sayantika@synergicsoftek.in', 'test', 'test', 'support/26_5.jpg', NULL, NULL, NULL, 'P', 'test3', '2023-07-04 05:06:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_tip`
--

CREATE TABLE `td_tip` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `tip_type` enum('V') NOT NULL DEFAULT 'V' COMMENT 'V-> Vacation Tip',
  `tip_title` varchar(100) DEFAULT NULL,
  `tip_desc` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_tip`
--

INSERT INTO `td_tip` (`id`, `hotel_id`, `tip_type`, `tip_title`, `tip_desc`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, 'V', 'Title 1', 'Desc1', 'somnath.thakur16@gmail.com', '2023-03-08 12:32:19', 'somnath.thakur16@gmail.com', '2023-03-08 12:38:52'),
(2, 1, 'V', 'Title 2', 'Desc22', 'somnath.thakur16@gmail.com', '2023-03-08 12:32:19', 'somnath.thakur16@gmail.com', '2023-03-08 12:38:52'),
(3, 1, 'V', 'Title 3', 'Desc 3', 'somnath.thakur16@gmail.com', '2023-03-08 12:38:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_training`
--

CREATE TABLE `td_training` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `training_dt_1` date NOT NULL,
  `training_dt_2` date NOT NULL,
  `training_dt_3` date NOT NULL,
  `shedule_dt` date DEFAULT NULL,
  `accom_conf` text DEFAULT NULL,
  `ground_conf` text DEFAULT NULL,
  `conf_approve_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `air_conf` text DEFAULT NULL,
  `training_comp_dt` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_training`
--

INSERT INTO `td_training` (`id`, `hotel_id`, `training_dt_1`, `training_dt_2`, `training_dt_3`, `shedule_dt`, `accom_conf`, `ground_conf`, `conf_approve_flag`, `air_conf`, `training_comp_dt`, `note`, `created_by`, `created_dt`, `modified_by`, `modified_dt`) VALUES
(1, 1, '2023-04-18', '2023-04-20', '2023-04-22', NULL, NULL, NULL, 'N', NULL, NULL, 'These are our training dates.', 'somnath.thakur16@gmail.com', '2023-04-17 15:03:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_users`
--

CREATE TABLE `td_users` (
  `id` bigint(22) NOT NULL,
  `restaurant_id` bigint(22) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `active_flag` enum('Y','N') NOT NULL DEFAULT 'N',
  `user_type` enum('A','H','S','U') NOT NULL DEFAULT 'H' COMMENT 'A-> Admin; H-> Hotel; S-> Sales; U-> Sub-Sales',
  `last_login_dt` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `td_users`
--

INSERT INTO `td_users` (`id`, `restaurant_id`, `email_id`, `pwd`, `active_flag`, `user_type`, `last_login_dt`, `modified_by`, `modified_dt`) VALUES
(1, 0, 'admin@gmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', 'Y', 'A', '2023-07-06 05:13:31', NULL, NULL),
(2, 1, 'somnath.thakur16@gmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', 'Y', 'H', '2023-07-03 11:09:17', NULL, NULL),
(3, 2, 'ugolfmedia@gmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', 'Y', 'H', '2023-01-09 14:51:38', NULL, NULL),
(4, 5, 'somnath.thakur16+90@gmail.com', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', 'N', 'H', '2023-01-14 06:40:14', NULL, NULL),
(5, 0, '9836751294', '$2b$10$NSJqKDCR/2FO2XhPQhGh4uscI6tZFi2ZeAxE50MTiEbb/RuGzTTQa', 'Y', 'S', NULL, NULL, NULL),
(10, 0, '9831887194', '$2b$10$ZU2ES57rLLtVohpfR13UEOv8ChBu0OVxehIFPNFGrZxZDG9S2SgzS', 'Y', 'S', NULL, NULL, NULL),
(11, 0, '7890833920', '$2b$10$2ngvprJGC3pprUKhzSXZKO.dkXQROT0HjElmMUBhB7XRmHk6lvBpe', 'Y', 'S', NULL, NULL, NULL),
(14, 15, 'sayantika.dhar04@gmail.com', '$2b$10$dwV5wI8.zZ3F0xdmbi1JZe.ZYofGq7Q6qnTtpRxMIba6SfkT8ouGq', 'Y', 'H', '2023-05-18 09:38:39', NULL, NULL),
(15, 17, 'sayantika.dhar04+2@gmail.com', '$2b$10$qDntdRefOa913Zqaq0H3Ae0jPXTNb.5m4.i.rxy0chs8eosR4PhmW', 'Y', 'H', '2023-05-19 05:27:33', NULL, NULL),
(17, 20, 'sayantika@synergicsoftek.in', '$2b$10$3KA1/iJF8iXUXyc.8m6cKu8yXhXdk0eQ6oIrN1Tdb6YiLcUT.N79i', 'N', 'H', '2023-06-09 09:25:24', NULL, NULL),
(18, 26, 'sayantika.dhar04+4@gmail.com', '$2b$10$CCzH.fJ9F.gcZt14nQATn.iLyC0y6ObCmJDfS3FvmK/msmK6K7myC', 'Y', 'H', '2023-07-03 09:03:56', NULL, NULL),
(19, 25, 'poulomi@synergicsoftek.in', '$2b$10$mvFwPgBGvSgMCuUWSP.uNedd22Er6UeZxNMN.ahqq9lVn62utY5b2', 'Y', 'H', '2023-07-06 05:28:59', NULL, NULL),
(29, 27, 'shamim+1@synergicsoftek.in', '$2b$10$6DyNfjrqq6WmA4wlRAaah.txljMyVxnwNtQ9UCU96PhXJiAtNqFEW', 'Y', 'H', '2023-07-06 05:07:47', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `md_config_email`
--
ALTER TABLE `md_config_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_config_inst`
--
ALTER TABLE `md_config_inst`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_config_menu`
--
ALTER TABLE `md_config_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_country`
--
ALTER TABLE `md_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_department`
--
ALTER TABLE `md_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_email_type`
--
ALTER TABLE `md_email_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_employee`
--
ALTER TABLE `md_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_holder_cling`
--
ALTER TABLE `md_holder_cling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_menu`
--
ALTER TABLE `md_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_menu_info`
--
ALTER TABLE `md_menu_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_menu_section`
--
ALTER TABLE `md_menu_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_package_custom`
--
ALTER TABLE `md_package_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_parm_value`
--
ALTER TABLE `md_parm_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_promotion_admin_custom`
--
ALTER TABLE `md_promotion_admin_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_promotion_restaurant_custom`
--
ALTER TABLE `md_promotion_restaurant_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_promo_calander`
--
ALTER TABLE `md_promo_calander`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_reserv_category`
--
ALTER TABLE `md_reserv_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_restaurant_items`
--
ALTER TABLE `md_restaurant_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `md_restaurant_item_description`
--
ALTER TABLE `md_restaurant_item_description`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `md_sales_agent`
--
ALTER TABLE `md_sales_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_section`
--
ALTER TABLE `md_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `md_service_items`
--
ALTER TABLE `md_service_items`
  ADD PRIMARY KEY (`service_item_id`);

--
-- Indexes for table `md_service_item_description`
--
ALTER TABLE `md_service_item_description`
  ADD PRIMARY KEY (`service_item_id`);

--
-- Indexes for table `md_special_category`
--
ALTER TABLE `md_special_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_sub_sales_agent`
--
ALTER TABLE `md_sub_sales_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_time_zone`
--
ALTER TABLE `md_time_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_url`
--
ALTER TABLE `md_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_about`
--
ALTER TABLE `td_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_calendar`
--
ALTER TABLE `td_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_contacts_custom`
--
ALTER TABLE `td_contacts_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `phone_no` (`phone_no`);

--
-- Indexes for table `td_contact_us`
--
ALTER TABLE `td_contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_date_time`
--
ALTER TABLE `td_date_time`
  ADD PRIMARY KEY (`srv_res_flag`,`srv_res_id`,`menu_id`,`month_day`) USING BTREE;

--
-- Indexes for table `td_directory_live`
--
ALTER TABLE `td_directory_live`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_directory_setup`
--
ALTER TABLE `td_directory_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_directory_setup_img`
--
ALTER TABLE `td_directory_setup_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_emergency_rec_report`
--
ALTER TABLE `td_emergency_rec_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_emp_schedule`
--
ALTER TABLE `td_emp_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_faq`
--
ALTER TABLE `td_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_flipbook`
--
ALTER TABLE `td_flipbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_flipbook_caption`
--
ALTER TABLE `td_flipbook_caption`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_flipbook_img`
--
ALTER TABLE `td_flipbook_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_flipbook_user`
--
ALTER TABLE `td_flipbook_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory`
--
ALTER TABLE `td_fun_directory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_calendar`
--
ALTER TABLE `td_fun_directory_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_menu`
--
ALTER TABLE `td_fun_directory_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_menu_img`
--
ALTER TABLE `td_fun_directory_menu_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_menu_info`
--
ALTER TABLE `td_fun_directory_menu_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_menu_section`
--
ALTER TABLE `td_fun_directory_menu_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_menu_section_dtls`
--
ALTER TABLE `td_fun_directory_menu_section_dtls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_res_menu_catg`
--
ALTER TABLE `td_fun_directory_res_menu_catg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_res_menu_sec`
--
ALTER TABLE `td_fun_directory_res_menu_sec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_fun_directory_res_menu_sec_item`
--
ALTER TABLE `td_fun_directory_res_menu_sec_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_group`
--
ALTER TABLE `td_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_guest_user`
--
ALTER TABLE `td_guest_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_guest_user_email`
--
ALTER TABLE `td_guest_user_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_lodgging`
--
ALTER TABLE `td_lodgging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_logo`
--
ALTER TABLE `td_logo`
  ADD PRIMARY KEY (`srv_res_flag`,`srv_res_id`);

--
-- Indexes for table `td_lost_found`
--
ALTER TABLE `td_lost_found`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_menu_image`
--
ALTER TABLE `td_menu_image`
  ADD PRIMARY KEY (`srv_res_flag`,`srv_res_id`,`menu_id`,`menu_img`(100)) USING BTREE;

--
-- Indexes for table `td_menu_notice`
--
ALTER TABLE `td_menu_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_notification`
--
ALTER TABLE `td_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_notification_audience`
--
ALTER TABLE `td_notification_audience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_notification_dtls`
--
ALTER TABLE `td_notification_dtls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_other_image`
--
ALTER TABLE `td_other_image`
  ADD PRIMARY KEY (`srv_res_flag`,`srv_res_id`,`menu_id`) USING BTREE;

--
-- Indexes for table `td_payment`
--
ALTER TABLE `td_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_pc_avatar`
--
ALTER TABLE `td_pc_avatar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_pc_voice`
--
ALTER TABLE `td_pc_voice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_promotions_custom`
--
ALTER TABLE `td_promotions_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_proposal`
--
ALTER TABLE `td_proposal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_proposal_dtls`
--
ALTER TABLE `td_proposal_dtls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_quest_add_lang`
--
ALTER TABLE `td_quest_add_lang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_quest_res_bars`
--
ALTER TABLE `td_quest_res_bars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_quest_service`
--
ALTER TABLE `td_quest_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_qustionnaire`
--
ALTER TABLE `td_qustionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_reserv_conf`
--
ALTER TABLE `td_reserv_conf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_reserv_setup`
--
ALTER TABLE `td_reserv_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_restaurant_update`
--
ALTER TABLE `td_restaurant_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_schedue`
--
ALTER TABLE `td_schedue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_section_image_request`
--
ALTER TABLE `td_section_image_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_special_data`
--
ALTER TABLE `td_special_data`
  ADD PRIMARY KEY (`special_id`);

--
-- Indexes for table `td_special_date_time`
--
ALTER TABLE `td_special_date_time`
  ADD PRIMARY KEY (`special_id`);

--
-- Indexes for table `td_stock_image`
--
ALTER TABLE `td_stock_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_subscription`
--
ALTER TABLE `td_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_suggestion_box`
--
ALTER TABLE `td_suggestion_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_support_log`
--
ALTER TABLE `td_support_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_tip`
--
ALTER TABLE `td_tip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_training`
--
ALTER TABLE `td_training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_users`
--
ALTER TABLE `td_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `email_id` (`email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `md_config_email`
--
ALTER TABLE `md_config_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `md_config_inst`
--
ALTER TABLE `md_config_inst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `md_config_menu`
--
ALTER TABLE `md_config_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `md_department`
--
ALTER TABLE `md_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `md_email_type`
--
ALTER TABLE `md_email_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `md_employee`
--
ALTER TABLE `md_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `md_menu`
--
ALTER TABLE `md_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `md_menu_info`
--
ALTER TABLE `md_menu_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `md_menu_section`
--
ALTER TABLE `md_menu_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `md_package_custom`
--
ALTER TABLE `md_package_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `md_parm_value`
--
ALTER TABLE `md_parm_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `md_promotion_admin_custom`
--
ALTER TABLE `md_promotion_admin_custom`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `md_promotion_restaurant_custom`
--
ALTER TABLE `md_promotion_restaurant_custom`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `md_reserv_category`
--
ALTER TABLE `md_reserv_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `md_restaurant_items`
--
ALTER TABLE `md_restaurant_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_sales_agent`
--
ALTER TABLE `md_sales_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `md_section`
--
ALTER TABLE `md_section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `md_service_items`
--
ALTER TABLE `md_service_items`
  MODIFY `service_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `md_special_category`
--
ALTER TABLE `md_special_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `md_sub_sales_agent`
--
ALTER TABLE `md_sub_sales_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `md_time_zone`
--
ALTER TABLE `md_time_zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `md_url`
--
ALTER TABLE `md_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_about`
--
ALTER TABLE `td_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `td_calendar`
--
ALTER TABLE `td_calendar`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `td_contacts_custom`
--
ALTER TABLE `td_contacts_custom`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `td_contact_us`
--
ALTER TABLE `td_contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `td_directory_live`
--
ALTER TABLE `td_directory_live`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `td_directory_setup`
--
ALTER TABLE `td_directory_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `td_directory_setup_img`
--
ALTER TABLE `td_directory_setup_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `td_emergency_rec_report`
--
ALTER TABLE `td_emergency_rec_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `td_emp_schedule`
--
ALTER TABLE `td_emp_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `td_faq`
--
ALTER TABLE `td_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `td_flipbook`
--
ALTER TABLE `td_flipbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `td_flipbook_caption`
--
ALTER TABLE `td_flipbook_caption`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `td_flipbook_img`
--
ALTER TABLE `td_flipbook_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `td_flipbook_user`
--
ALTER TABLE `td_flipbook_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `td_fun_directory`
--
ALTER TABLE `td_fun_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `td_fun_directory_calendar`
--
ALTER TABLE `td_fun_directory_calendar`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `td_fun_directory_menu`
--
ALTER TABLE `td_fun_directory_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `td_fun_directory_menu_img`
--
ALTER TABLE `td_fun_directory_menu_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `td_fun_directory_menu_info`
--
ALTER TABLE `td_fun_directory_menu_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `td_fun_directory_menu_section`
--
ALTER TABLE `td_fun_directory_menu_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `td_fun_directory_menu_section_dtls`
--
ALTER TABLE `td_fun_directory_menu_section_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `td_fun_directory_res_menu_catg`
--
ALTER TABLE `td_fun_directory_res_menu_catg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `td_fun_directory_res_menu_sec`
--
ALTER TABLE `td_fun_directory_res_menu_sec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `td_fun_directory_res_menu_sec_item`
--
ALTER TABLE `td_fun_directory_res_menu_sec_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `td_group`
--
ALTER TABLE `td_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_guest_user`
--
ALTER TABLE `td_guest_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `td_guest_user_email`
--
ALTER TABLE `td_guest_user_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `td_lodgging`
--
ALTER TABLE `td_lodgging`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `td_lost_found`
--
ALTER TABLE `td_lost_found`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `td_menu_notice`
--
ALTER TABLE `td_menu_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `td_notification`
--
ALTER TABLE `td_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `td_notification_audience`
--
ALTER TABLE `td_notification_audience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `td_notification_dtls`
--
ALTER TABLE `td_notification_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `td_pc_avatar`
--
ALTER TABLE `td_pc_avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_pc_voice`
--
ALTER TABLE `td_pc_voice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `td_promotions_custom`
--
ALTER TABLE `td_promotions_custom`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `td_proposal`
--
ALTER TABLE `td_proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `td_proposal_dtls`
--
ALTER TABLE `td_proposal_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `td_quest_add_lang`
--
ALTER TABLE `td_quest_add_lang`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `td_quest_res_bars`
--
ALTER TABLE `td_quest_res_bars`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `td_quest_service`
--
ALTER TABLE `td_quest_service`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `td_qustionnaire`
--
ALTER TABLE `td_qustionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `td_reserv_conf`
--
ALTER TABLE `td_reserv_conf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `td_reserv_setup`
--
ALTER TABLE `td_reserv_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `td_restaurant_update`
--
ALTER TABLE `td_restaurant_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_schedue`
--
ALTER TABLE `td_schedue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_section_image_request`
--
ALTER TABLE `td_section_image_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `td_special_data`
--
ALTER TABLE `td_special_data`
  MODIFY `special_id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `td_stock_image`
--
ALTER TABLE `td_stock_image`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `td_suggestion_box`
--
ALTER TABLE `td_suggestion_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `td_support_log`
--
ALTER TABLE `td_support_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `td_tip`
--
ALTER TABLE `td_tip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `td_training`
--
ALTER TABLE `td_training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `td_users`
--
ALTER TABLE `td_users`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
