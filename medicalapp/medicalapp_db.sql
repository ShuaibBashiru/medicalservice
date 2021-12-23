-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Nov 17, 2021 at 01:07 PM
-- Server version: 8.0.24
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicalapp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_record`
--

CREATE TABLE `admin_record` (
  `id` int NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `othername` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email_one` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_two` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_one` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_two` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `countryCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `persional_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `account_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `pwd_auth_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `pwd_auth` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_record`
--

INSERT INTO `admin_record` (`id`, `surname`, `firstname`, `othername`, `email_one`, `email_two`, `phone_one`, `phone_two`, `countryCode`, `persional_id`, `account_type`, `user_role`, `pwd_auth_hash`, `pwd_auth`, `created_by`, `date_created`, `last_modified`) VALUES
(1, 'Musa', 'Oloyede', 'null', 'musa@gmail.com', '', '08172790181', '', '+234', 'null', '1', '', '', 'Musa', 1, '2021-03-29 10:26:26.316003', '2021-03-29 10:26:26.316008'),
(2, 'Nkechi', 'A', 'null', 'admin@gmail.com', '', '08172790181', '', '+234', 'null', '1', '', '', '1234', 1, '2021-03-29 10:26:50.027920', '2021-03-29 10:26:50.027926'),
(3, 'Nkechi', 'A', 'null', 'jerry@gmail.com', '', '07065273385', '', '+234', 'null', '1', '', '', 'Jerry', 2, '2021-03-29 16:41:39.997519', '2021-03-29 16:41:39.997525'),
(4, 'peter', 'Jay', 'null', 'peter@gmail.com', '', '8137631003', '', '+234', '001', '2', '', '', 'peter', 3, '2021-03-29 17:12:56.929030', '2021-03-29 17:12:56.929039');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-03-09 16:28:42.302653'),
(2, 'auth', '0001_initial', '2021-03-09 16:28:47.610617'),
(3, 'admin', '0001_initial', '2021-03-09 16:29:05.085030'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-03-09 16:29:08.959851'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-03-09 16:29:09.114936'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-03-09 16:29:12.221575'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-03-09 16:29:14.344439'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-03-09 16:29:14.763749'),
(9, 'auth', '0004_alter_user_username_opts', '2021-03-09 16:29:14.934267'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-03-09 16:29:16.712390'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-03-09 16:29:16.881717'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-03-09 16:29:17.051126'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-03-09 16:29:19.361225'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-03-09 16:29:21.616000'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-03-09 16:29:21.989844'),
(16, 'auth', '0011_update_proxy_permissions', '2021-03-09 16:29:22.193807'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-03-09 16:29:24.241801'),
(18, 'sessions', '0001_initial', '2021-03-09 16:29:25.391389');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('avvpbygvlt5k8fgdnr8xxghn1kjtz1ug', 'eyJ1c2VyZGF0YSI6WzIsIk5rZWNoaSIsIkEiLCJhZG1pbkBnbWFpbC5jb20iLCIwODE3Mjc5MDE4MSIsIjEiXX0:1ml6t5:Y_C8FbX3apPLzIahJDVoHBpMe92pX4TS7B7DzZ9YMtE', '2021-11-25 10:00:55.279216'),
('njlmehzef806qst5hor9eun4qgia0s1g', 'e30:1maE6j:qJc77n4LMxae-pQORRvywMD_XpKHu3d66dAB-Wz105E', '2021-10-26 09:30:01.196493'),
('qgq3rw135th1yf2j6mg6u7xbdsg4d5zb', 'eyJ1c2VyZGF0YSI6WzIsIkFkZXdhbGUiLCJPbG95ZWRlIiwiaW5zdHJ1Y3RzbWVAZ21haWwuY29tIiwiMDgxNzI3OTAxODEiLCIxIl19:1lRAJy:DevVzLwZzNZk0tS8k8V5WxGDgTBIp4PH-CAZu1bKZ2E', '2021-04-13 09:05:58.049736');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `service_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `list_id` int NOT NULL,
  `price` float NOT NULL,
  `qty` int NOT NULL,
  `vat` float DEFAULT '0',
  `amount` float NOT NULL,
  `user_id` int NOT NULL,
  `user_email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int NOT NULL,
  `comments` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `service_id`, `list_id`, `price`, `qty`, `vat`, `amount`, `user_id`, `user_email`, `created_by`, `comments`, `date_created`, `last_modified`) VALUES
(1, '1617029971383', 76, 50, 3, 0, 150, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:00:57.712476', '2021-03-29 15:00:57.712484'),
(2, '1617029971383', 79, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:01:07.926421', '2021-03-29 15:01:07.926434'),
(3, '1617029971383', 79, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:03:57.717909', '2021-03-29 15:03:57.717917'),
(4, '1617029971383', 79, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:04:55.943385', '2021-03-29 15:04:55.943394'),
(5, '1617029971383', 79, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:05:39.214382', '2021-03-29 15:05:39.214390'),
(6, '1617029971383', 79, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:06:21.525742', '2021-03-29 15:06:21.525749'),
(7, '1617029971383', 79, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:06:53.501808', '2021-03-29 15:06:53.501815'),
(8, '1617030526940', 73, 40, 3, 0, 120, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:08:54.953047', '2021-03-29 15:08:54.953055'),
(9, '1617030526940', 76, 50, 2, 0, 100, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:09:04.518530', '2021-03-29 15:09:04.518538'),
(10, '1617030526940', 34, 200, 2, 0, 400, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:43:26.623006', '2021-03-29 15:43:26.623013'),
(11, '1617030526940', 122, 200, 2, 0, 400, 1, 'adewaleme@gmail.com', 2, '', '2021-03-29 15:46:32.408850', '2021-03-29 15:46:32.408859'),
(12, '1617037049454', 70, 50, 5, 0, 250, 2, 'lawal@gmail.com', 3, '', '2021-03-29 17:00:33.731226', '2021-03-29 17:00:33.731240'),
(13, '1617037049454', 71, 50, 5, 0, 250, 2, 'lawal@gmail.com', 3, '', '2021-03-29 17:00:43.902368', '2021-03-29 17:00:43.902382'),
(14, '1617037049454', 177, 50, 3, 0, 150, 2, 'lawal@gmail.com', 3, '', '2021-03-29 17:02:03.361837', '2021-03-29 17:02:03.361851'),
(15, '1617037049454', 177, 50, 3, 0, 150, 2, 'lawal@gmail.com', 3, '', '2021-03-29 17:02:04.071608', '2021-03-29 17:02:04.071621'),
(16, '1617037049454', 172, 35, 3, 0, 105, 2, 'lawal@gmail.com', 3, '', '2021-03-29 17:02:41.294491', '2021-03-29 17:02:41.294504'),
(17, '1617041638535', 70, 60, 4, 0, 240, 2, 'lawal@gmail.com', 4, '', '2021-03-29 18:14:32.985196', '2021-03-29 18:14:32.985204'),
(18, '1617043989604', 70, 40, 3, 0, 120, 2, 'lawal@gmail.com', 4, '', '2021-03-29 18:53:21.700793', '2021-03-29 18:53:21.700799'),
(19, '1617043989604', 72, 40, 3, 0, 120, 2, 'lawal@gmail.com', 4, '', '2021-03-29 18:53:25.664798', '2021-03-29 18:53:25.664805'),
(20, '1617043989604', 76, 40, 3, 0, 120, 2, 'lawal@gmail.com', 4, '', '2021-03-29 18:53:28.951386', '2021-03-29 18:53:28.951392'),
(21, '1617089550236', 71, 35, 5, 0, 175, 2, 'lawal@gmail.com', 4, '', '2021-03-30 07:32:46.329543', '2021-03-30 07:32:46.329549'),
(22, '1617089550236', 73, 35, 5, 0, 175, 2, 'lawal@gmail.com', 4, '', '2021-03-30 07:32:52.910603', '2021-03-30 07:32:52.910610'),
(23, '1617089550236', 74, 35, 2, 0, 70, 2, 'lawal@gmail.com', 4, '', '2021-03-30 07:32:59.577803', '2021-03-30 07:32:59.577809'),
(24, '1617090871625', 70, 50, 3, 0, 150, 2, 'lawal@gmail.com', 4, '', '2021-03-30 07:54:54.525830', '2021-03-30 07:54:54.525836'),
(25, '1617090871625', 69, 36, 5, 0, 180, 2, 'lawal@gmail.com', 4, '', '2021-03-30 07:55:04.154145', '2021-03-30 07:55:04.154152'),
(26, '1617090871625', 73, 36, 5, 0, 180, 2, 'lawal@gmail.com', 4, '', '2021-03-30 07:55:08.680435', '2021-03-30 07:55:08.680442'),
(27, '1617096970893', 70, 50, 4, 0, 200, 3, 'lawrence@gmail.com', 2, '', '2021-03-30 09:36:28.842097', '2021-03-30 09:36:28.842104'),
(28, '1617096970893', 72, 37, 3, 0, 111, 3, 'lawrence@gmail.com', 2, '', '2021-03-30 09:36:39.831325', '2021-03-30 09:36:39.831331'),
(29, '1617096970893', 201, 120, 5, 0, 600, 3, 'lawrence@gmail.com', 2, '', '2021-03-30 09:36:55.219995', '2021-03-30 09:36:55.220002'),
(30, '1634026177754', 78, 100, 10, 0, 1000, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 08:10:33.492153', '2021-10-12 08:10:33.492161'),
(31, '1634026177754', 71, 36, 10, 0, 360, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:19:25.049896', '2021-10-12 09:19:25.049909'),
(32, '1634026177754', 124, 36, 3, 0, 108, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:19:40.132540', '2021-10-12 09:19:40.132547'),
(33, '1634026177754', 124, 100, 3, 0, 300, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:19:50.073526', '2021-10-12 09:19:50.073535'),
(34, '1634026177754', 16, 100, 3, 0, 300, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:20:02.382142', '2021-10-12 09:20:02.382152'),
(35, '1634026177754', 16, 100, 3, 0, 300, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:20:03.389509', '2021-10-12 09:20:03.389518'),
(36, '1634030511726', 72, 100, 3, 0, 300, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:24:45.304244', '2021-10-12 09:24:45.304252'),
(37, '1634030511726', 91, 30, 3, 0, 90, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:24:55.868722', '2021-10-12 09:24:55.868731'),
(38, '1634030511726', 91, 40, 3, 0, 120, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:25:02.246584', '2021-10-12 09:25:02.246594'),
(39, '1634030511726', 147, 100, 3, 0, 300, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:25:16.551583', '2021-10-12 09:25:16.551590'),
(40, '1634030511726', 147, 128, 3, 0, 384, 3, 'lawrence@gmail.com', 2, '', '2021-10-12 09:25:24.330806', '2021-10-12 09:25:24.330814');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int NOT NULL,
  `email_one` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resetCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_prices`
--

CREATE TABLE `sale_prices` (
  `id` int NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `itemName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `range_one` float NOT NULL,
  `range_two` float NOT NULL,
  `vat` float DEFAULT NULL,
  `comments` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_prices`
--

INSERT INTO `sale_prices` (`id`, `category`, `category_id`, `itemName`, `itemDescription`, `range_one`, `range_two`, `vat`, `comments`, `user_id`, `user_email`, `created_by`, `date_created`, `last_modified`) VALUES
(1, 'LEVOFLOXACIN', NULL, 'ARTAV 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:26.027081', '2021-03-27 20:26:26.027091'),
(2, 'LEVOFLOXACIN', NULL, 'ASPEN LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:26.380209', '2021-03-27 20:26:26.380220'),
(3, 'LEVOFLOXACIN', NULL, 'AUSTELL LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:26.541578', '2021-03-27 20:26:26.541588'),
(4, 'LEVOFLOXACIN', NULL, 'LEVOFLOXACIN-WINTHROP 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:26.658796', '2021-03-27 20:26:26.658806'),
(5, 'LEVOFLOXACIN', NULL, 'LINTRIP 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:26.869687', '2021-03-27 20:26:26.869706'),
(6, 'LEVOFLOXACIN', NULL, 'MACLEODS LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:26.958085', '2021-03-27 20:26:26.958095'),
(7, 'LEVOFLOXACIN', NULL, 'MYLAN LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:27.106215', '2021-03-27 20:26:27.106222'),
(8, 'LEVOFLOXACIN', NULL, 'SANDOZ LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:27.291332', '2021-03-27 20:26:27.291342'),
(9, 'LEVOFLOXACIN', NULL, 'TAVALOXX 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:27.535378', '2021-03-27 20:26:27.535389'),
(10, 'LEVOFLOXACIN', NULL, 'TAVANIC 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:27.768292', '2021-03-27 20:26:27.768302'),
(11, 'LEVOFLOXACIN', NULL, 'ZYBACT 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:27.925528', '2021-03-27 20:26:27.925536'),
(12, 'LEVOFLOXACIN', NULL, 'ARTAV 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:28.162435', '2021-03-27 20:26:28.162446'),
(13, 'LEVOFLOXACIN', NULL, 'ASPEN LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:28.413803', '2021-03-27 20:26:28.413813'),
(14, 'LEVOFLOXACIN', NULL, 'AUSTELL LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:28.655047', '2021-03-27 20:26:28.655058'),
(15, 'LEVOFLOXACIN', NULL, 'LEVOFLOXACIN-WINTHROP 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:28.833677', '2021-03-27 20:26:28.833688'),
(16, 'LEVOFLOXACIN', NULL, 'LEVOJUB', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:28.966585', '2021-03-27 20:26:28.966597'),
(17, 'LEVOFLOXACIN', NULL, 'LINTRIP 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.136376', '2021-03-27 20:26:29.136387'),
(18, 'LEVOFLOXACIN', NULL, 'MACLEODS LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.299173', '2021-03-27 20:26:29.299186'),
(19, 'LEVOFLOXACIN', NULL, 'MYLAN LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.376844', '2021-03-27 20:26:29.376855'),
(20, 'LEVOFLOXACIN', NULL, 'SANDOZ LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.454573', '2021-03-27 20:26:29.454585'),
(21, 'LEVOFLOXACIN', NULL, 'TAVALOXX 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.580590', '2021-03-27 20:26:29.580601'),
(22, 'LEVOFLOXACIN', NULL, 'TAVANIC 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.654405', '2021-03-27 20:26:29.654416'),
(23, 'LEVOFLOXACIN', NULL, 'ZYBACT 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.776439', '2021-03-27 20:26:29.776450'),
(24, 'CLARITHROMYCIN', NULL, 'CLACEE 250MG 250MG  TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.876479', '2021-03-27 20:26:29.876490'),
(25, 'CLARITHROMYCIN', NULL, 'KLARIBIN 250MG TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:29.998324', '2021-03-27 20:26:29.998334'),
(26, 'CLARITHROMYCIN', NULL, 'KLARIZON  250MG TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.080623', '2021-03-27 20:26:30.080634'),
(27, 'CLARITHROMYCIN', NULL, 'KLARYVID 250MG TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.153694', '2021-03-27 20:26:30.153704'),
(28, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACCORD PIOGLITAZONE 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.253659', '2021-03-27 20:26:30.253671'),
(29, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACTOS 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.353458', '2021-03-27 20:26:30.353468'),
(30, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'CIPLA-PIOGLITAZONE 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.475573', '2021-03-27 20:26:30.475583'),
(31, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'PIOGLITAZONE HYDROCHLORIDE MACLEODS 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.586617', '2021-03-27 20:26:30.586628'),
(32, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACCORD PIOGLITAZONE 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.664238', '2021-03-27 20:26:30.664250'),
(33, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACTOS 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.775193', '2021-03-27 20:26:30.775204'),
(34, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'CIPLA-PIOGLITAZONE 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.886094', '2021-03-27 20:26:30.886104'),
(35, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'PIOGLITAZONE HYDROCHLORIDE MACLEODS 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:30.974841', '2021-03-27 20:26:30.974851'),
(36, 'ISPAGHULA', NULL, 'AGIOGEL 3.5GM', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:31.108075', '2021-03-27 20:26:31.108086'),
(37, 'ISPAGHULA', NULL, 'DIS-CHEM ISPAGHULA HUSK', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:31.196912', '2021-03-27 20:26:31.196921'),
(38, 'ISPAGHULA', NULL, 'FYBOGEL ORANGE 3.5G', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:31.346105', '2021-03-27 20:26:31.346115'),
(39, 'ISPAGHULA', NULL, 'FYBOHUSK - ORANGE FLAVOUR (WAS FYBOGO)', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:31.486515', '2021-03-27 20:26:31.486525'),
(40, 'ISPAGHULA', NULL, 'ISPAGEL 3.5G', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:31.633880', '2021-03-27 20:26:31.633890'),
(41, 'ISPAGHULA', NULL, 'SENOKOT HI-FIBRE LEMON', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:31.774930', '2021-03-27 20:26:31.774940'),
(42, 'ISPAGHULA', NULL, 'SENOKOT HI-FIBRE ORANGE', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.106714', '2021-03-27 20:26:32.106725'),
(43, 'VALSARTAN', NULL, 'ADCO-VALSARTAN', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.306723', '2021-03-27 20:26:32.306733'),
(44, 'VALSARTAN', NULL, 'DIOLO 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.395531', '2021-03-27 20:26:32.395541'),
(45, 'VALSARTAN', NULL, 'DIOVAN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.484288', '2021-03-27 20:26:32.484298'),
(46, 'VALSARTAN', NULL, 'DYNAVAL 160MG TAB', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.628779', '2021-03-27 20:26:32.628789'),
(47, 'VALSARTAN', NULL, 'MIGROBEN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.729717', '2021-03-27 20:26:32.729726'),
(48, 'VALSARTAN', NULL, 'TAREG 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:32.872614', '2021-03-27 20:26:32.872623'),
(49, 'VALSARTAN', NULL, 'VALANT 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.016782', '2021-03-27 20:26:33.016792'),
(50, 'VALSARTAN', NULL, 'VALHEFT', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.183790', '2021-03-27 20:26:33.183800'),
(51, 'VALSARTAN', NULL, 'VALSARTAN UNICORN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.327308', '2021-03-27 20:26:33.327318'),
(52, 'VALSARTAN', NULL, 'VASOVAN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.460340', '2021-03-27 20:26:33.460350'),
(53, 'VALSARTAN', NULL, 'ZOMEVEK 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.615691', '2021-03-27 20:26:33.615701'),
(54, 'VALSARTAN', NULL, 'ADCO-VALSARTAN', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.773254', '2021-03-27 20:26:33.773268'),
(55, 'VALSARTAN', NULL, 'DIOLO 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:33.926653', '2021-03-27 20:26:33.926664'),
(56, 'VALSARTAN', NULL, 'DIOVAN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.048630', '2021-03-27 20:26:34.048640'),
(57, 'VALSARTAN', NULL, 'MIGROBEN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.170569', '2021-03-27 20:26:34.170579'),
(58, 'VALSARTAN', NULL, 'TAREG 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.270698', '2021-03-27 20:26:34.270708'),
(59, 'VALSARTAN', NULL, 'VALANT 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.370417', '2021-03-27 20:26:34.370427'),
(60, 'VALSARTAN', NULL, 'VALHEFT', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.470426', '2021-03-27 20:26:34.470437'),
(61, 'VALSARTAN', NULL, 'VALSARTAN UNICORN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.592304', '2021-03-27 20:26:34.592315'),
(62, 'VALSARTAN', NULL, 'VASOVAN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.670004', '2021-03-27 20:26:34.670013'),
(63, 'VALSARTAN', NULL, 'ZOMEVEK 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.792062', '2021-03-27 20:26:34.792070'),
(64, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-DIOVAN 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.869754', '2021-03-27 20:26:34.869764'),
(65, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-MIGROBEN 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:34.991885', '2021-03-27 20:26:34.991894'),
(66, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-TAREG 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.069680', '2021-03-27 20:26:35.069689'),
(67, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-ZOMEVEK 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.191639', '2021-03-27 20:26:35.191648'),
(68, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'DIOLO CO 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.269468', '2021-03-27 20:26:35.269479'),
(69, 'ATORVASTATIN', NULL, 'ADCO ATORVASTATIN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.402601', '2021-03-27 20:26:35.402612'),
(70, 'ATORVASTATIN', NULL, 'ASPAVOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.491350', '2021-03-27 20:26:35.491360'),
(71, 'ATORVASTATIN', NULL, 'ASTOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.580209', '2021-03-27 20:26:35.580219'),
(72, 'ATORVASTATIN', NULL, 'ATOLIP 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.690970', '2021-03-27 20:26:35.690980'),
(73, 'ATORVASTATIN', NULL, 'ATORVASTATIN LHC', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.791037', '2021-03-27 20:26:35.791048'),
(74, 'ATORVASTATIN', NULL, 'ATORVASTATIN UNICORN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:35.902288', '2021-03-27 20:26:35.902301'),
(75, 'ATORVASTATIN', NULL, 'ATORVASTATIN WINTHROP 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.039630', '2021-03-27 20:26:36.039639'),
(76, 'ATORVASTATIN', NULL, 'DYNATOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.178943', '2021-03-27 20:26:36.178952'),
(77, 'ATORVASTATIN', NULL, 'LESTAVOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.290893', '2021-03-27 20:26:36.290903'),
(78, 'ATORVASTATIN', NULL, 'LIPITOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.423406', '2021-03-27 20:26:36.423416'),
(79, 'ATORVASTATIN', NULL, 'LIPOGEN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.579739', '2021-03-27 20:26:36.579749'),
(80, 'ATORVASTATIN', NULL, 'RAN-ATORVASTATIN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.735169', '2021-03-27 20:26:36.735179'),
(81, 'ATORVASTATIN', NULL, 'VASTOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:36.890312', '2021-03-27 20:26:36.890322'),
(82, 'ATORVASTATIN', NULL, 'ADCO ATORVASTATIN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:37.001257', '2021-03-27 20:26:37.001266'),
(83, 'ATORVASTATIN', NULL, 'ASPAVOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:37.101017', '2021-03-27 20:26:37.101027'),
(84, 'ATORVASTATIN', NULL, 'ASTOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:37.355263', '2021-03-27 20:26:37.355274'),
(85, 'ATORVASTATIN', NULL, 'ATOLIP 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:37.589243', '2021-03-27 20:26:37.589255'),
(86, 'ATORVASTATIN', NULL, 'ATORVASTATIN LHC', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:37.721771', '2021-03-27 20:26:37.721780'),
(87, 'ATORVASTATIN', NULL, 'ATORVASTATIN UNICORN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:37.855332', '2021-03-27 20:26:37.855342'),
(88, 'ATORVASTATIN', NULL, 'ATORVASTATIN WINTHROP 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.021507', '2021-03-27 20:26:38.021518'),
(89, 'ATORVASTATIN', NULL, 'DYNATOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.154492', '2021-03-27 20:26:38.154500'),
(90, 'ATORVASTATIN', NULL, 'LESTAVOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.310782', '2021-03-27 20:26:38.310793'),
(91, 'ATORVASTATIN', NULL, 'LIPITOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.498522', '2021-03-27 20:26:38.498533'),
(92, 'ATORVASTATIN', NULL, 'LIPOGEN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.600234', '2021-03-27 20:26:38.600246'),
(93, 'ATORVASTATIN', NULL, 'RAN-ATORVASTATIN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.709429', '2021-03-27 20:26:38.709440'),
(94, 'ATORVASTATIN', NULL, 'VASTOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.809870', '2021-03-27 20:26:38.809880'),
(95, 'RISPERIDONE', NULL, 'ASPEN RISPERIDONE .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:38.964504', '2021-03-27 20:26:38.964514'),
(96, 'RISPERIDONE', NULL, 'AUROPERDAL .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.097724', '2021-03-27 20:26:39.097733'),
(97, 'RISPERIDONE', NULL, 'DRL RISPERIDONE .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.208700', '2021-03-27 20:26:39.208710'),
(98, 'RISPERIDONE', NULL, 'PERIDA .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.297571', '2021-03-27 20:26:39.297581'),
(99, 'RISPERIDONE', NULL, 'PERIZAL .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.408456', '2021-03-27 20:26:39.408466'),
(100, 'RISPERIDONE', NULL, 'RISNIA .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.497337', '2021-03-27 20:26:39.497348'),
(101, 'LEVOFLOXACIN', NULL, 'ARTAV 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.608146', '2021-03-27 20:26:39.608156'),
(102, 'LEVOFLOXACIN', NULL, 'ASPEN LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.696779', '2021-03-27 20:26:39.696789'),
(103, 'LEVOFLOXACIN', NULL, 'AUSTELL LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.808129', '2021-03-27 20:26:39.808141'),
(104, 'LEVOFLOXACIN', NULL, 'LEVOFLOXACIN-WINTHROP 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:39.896740', '2021-03-27 20:26:39.896762'),
(105, 'LEVOFLOXACIN', NULL, 'LINTRIP 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.007632', '2021-03-27 20:26:40.007643'),
(106, 'LEVOFLOXACIN', NULL, 'MACLEODS LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.096585', '2021-03-27 20:26:40.096596'),
(107, 'LEVOFLOXACIN', NULL, 'MYLAN LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.207239', '2021-03-27 20:26:40.207250'),
(108, 'LEVOFLOXACIN', NULL, 'SANDOZ LEVOFLOXACIN 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.296165', '2021-03-27 20:26:40.296176'),
(109, 'LEVOFLOXACIN', NULL, 'TAVALOXX 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.429364', '2021-03-27 20:26:40.429375'),
(110, 'LEVOFLOXACIN', NULL, 'TAVANIC 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.517951', '2021-03-27 20:26:40.517960'),
(111, 'LEVOFLOXACIN', NULL, 'ZYBACT 250MG', NULL, 125.92, 144.8, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.666957', '2021-03-27 20:26:40.666968'),
(112, 'LEVOFLOXACIN', NULL, 'ARTAV 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.806594', '2021-03-27 20:26:40.806606'),
(113, 'LEVOFLOXACIN', NULL, 'ASPEN LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:40.928660', '2021-03-27 20:26:40.928671'),
(114, 'LEVOFLOXACIN', NULL, 'AUSTELL LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.017299', '2021-03-27 20:26:41.017308'),
(115, 'LEVOFLOXACIN', NULL, 'LEVOFLOXACIN-WINTHROP 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.106165', '2021-03-27 20:26:41.106175'),
(116, 'LEVOFLOXACIN', NULL, 'LEVOJUB', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.217051', '2021-03-27 20:26:41.217063'),
(117, 'LEVOFLOXACIN', NULL, 'LINTRIP 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.307867', '2021-03-27 20:26:41.307879'),
(118, 'LEVOFLOXACIN', NULL, 'MACLEODS LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.427965', '2021-03-27 20:26:41.427974'),
(119, 'LEVOFLOXACIN', NULL, 'MYLAN LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.574902', '2021-03-27 20:26:41.574911'),
(120, 'LEVOFLOXACIN', NULL, 'SANDOZ LEVOFLOXACIN 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.717655', '2021-03-27 20:26:41.717664'),
(121, 'LEVOFLOXACIN', NULL, 'TAVALOXX 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.806297', '2021-03-27 20:26:41.806308'),
(122, 'LEVOFLOXACIN', NULL, 'TAVANIC 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:41.917119', '2021-03-27 20:26:41.917129'),
(123, 'LEVOFLOXACIN', NULL, 'ZYBACT 500MG', NULL, 91.6, 105.34, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.017375', '2021-03-27 20:26:42.017394'),
(124, 'CLARITHROMYCIN', NULL, 'CLACEE 250MG 250MG  TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.116842', '2021-03-27 20:26:42.116853'),
(125, 'CLARITHROMYCIN', NULL, 'KLARIBIN 250MG TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.216712', '2021-03-27 20:26:42.216722'),
(126, 'CLARITHROMYCIN', NULL, 'KLARIZON  250MG TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.316834', '2021-03-27 20:26:42.316845'),
(127, 'CLARITHROMYCIN', NULL, 'KLARYVID 250MG TAB', NULL, 74.8, 86.02, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.723770', '2021-03-27 20:26:42.723781'),
(128, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACCORD PIOGLITAZONE 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.860127', '2021-03-27 20:26:42.860138'),
(129, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACTOS 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:42.981816', '2021-03-27 20:26:42.981826'),
(130, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'CIPLA-PIOGLITAZONE 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.081795', '2021-03-27 20:26:43.081805'),
(131, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'PIOGLITAZONE HYDROCHLORIDE MACLEODS 15MG', NULL, 96.34, 110.79, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.204305', '2021-03-27 20:26:43.204313'),
(132, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACCORD PIOGLITAZONE 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.336875', '2021-03-27 20:26:43.336884'),
(133, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'ACTOS 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.436757', '2021-03-27 20:26:43.436766'),
(134, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'CIPLA-PIOGLITAZONE 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.592606', '2021-03-27 20:26:43.592618'),
(135, 'PIOGLITAZONE HYDROCHLORIDE', NULL, 'PIOGLITAZONE HYDROCHLORIDE MACLEODS 30MG', NULL, 161.84, 186.12, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.747780', '2021-03-27 20:26:43.747789'),
(136, 'ISPAGHULA', NULL, 'AGIOGEL 3.5GM', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:43.924897', '2021-03-27 20:26:43.924908'),
(137, 'ISPAGHULA', NULL, 'DIS-CHEM ISPAGHULA HUSK', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.013764', '2021-03-27 20:26:44.013774'),
(138, 'ISPAGHULA', NULL, 'FYBOGEL ORANGE 3.5G', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.146890', '2021-03-27 20:26:44.146900'),
(139, 'ISPAGHULA', NULL, 'FYBOHUSK - ORANGE FLAVOUR (WAS FYBOGO)', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.235697', '2021-03-27 20:26:44.235708'),
(140, 'ISPAGHULA', NULL, 'ISPAGEL 3.5G', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.386783', '2021-03-27 20:26:44.386793'),
(141, 'ISPAGHULA', NULL, 'SENOKOT HI-FIBRE LEMON', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.535259', '2021-03-27 20:26:44.535270'),
(142, 'ISPAGHULA', NULL, 'SENOKOT HI-FIBRE ORANGE', NULL, 76.55, 88.03, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.735131', '2021-03-27 20:26:44.735142'),
(143, 'VALSARTAN', NULL, 'ADCO-VALSARTAN', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:44.907089', '2021-03-27 20:26:44.907101'),
(144, 'VALSARTAN', NULL, 'DIOLO 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.040032', '2021-03-27 20:26:45.040043'),
(145, 'VALSARTAN', NULL, 'DIOVAN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.178988', '2021-03-27 20:26:45.179004'),
(146, 'VALSARTAN', NULL, 'DYNAVAL 160MG TAB', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.268174', '2021-03-27 20:26:45.268184'),
(147, 'VALSARTAN', NULL, 'MIGROBEN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.411783', '2021-03-27 20:26:45.411792'),
(148, 'VALSARTAN', NULL, 'TAREG 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.540049', '2021-03-27 20:26:45.540060'),
(149, 'VALSARTAN', NULL, 'VALANT 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.733428', '2021-03-27 20:26:45.733438'),
(150, 'VALSARTAN', NULL, 'VALHEFT', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.866578', '2021-03-27 20:26:45.866588'),
(151, 'VALSARTAN', NULL, 'VALSARTAN UNICORN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:45.977516', '2021-03-27 20:26:45.977527'),
(152, 'VALSARTAN', NULL, 'VASOVAN 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.066425', '2021-03-27 20:26:46.066435'),
(153, 'VALSARTAN', NULL, 'ZOMEVEK 160MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.177289', '2021-03-27 20:26:46.177299'),
(154, 'VALSARTAN', NULL, 'ADCO-VALSARTAN', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.266104', '2021-03-27 20:26:46.266115'),
(155, 'VALSARTAN', NULL, 'DIOLO 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.376930', '2021-03-27 20:26:46.376940'),
(156, 'VALSARTAN', NULL, 'DIOVAN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.465735', '2021-03-27 20:26:46.465744'),
(157, 'VALSARTAN', NULL, 'MIGROBEN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.577917', '2021-03-27 20:26:46.577928'),
(158, 'VALSARTAN', NULL, 'TAREG 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.744692', '2021-03-27 20:26:46.744703'),
(159, 'VALSARTAN', NULL, 'VALANT 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:46.899603', '2021-03-27 20:26:46.899615'),
(160, 'VALSARTAN', NULL, 'VALHEFT', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:47.043946', '2021-03-27 20:26:47.043956'),
(161, 'VALSARTAN', NULL, 'VALSARTAN UNICORN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:47.254575', '2021-03-27 20:26:47.254584'),
(162, 'VALSARTAN', NULL, 'VASOVAN 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:47.420877', '2021-03-27 20:26:47.420887'),
(163, 'VALSARTAN', NULL, 'ZOMEVEK 80MG', NULL, 127.29, 146.38, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:47.620686', '2021-03-27 20:26:47.620698'),
(164, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-DIOVAN 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:47.920045', '2021-03-27 20:26:47.920057'),
(165, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-MIGROBEN 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.039928', '2021-03-27 20:26:48.039940'),
(166, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-TAREG 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.197681', '2021-03-27 20:26:48.197691'),
(167, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'CO-ZOMEVEK 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.375185', '2021-03-27 20:26:48.375194'),
(168, 'VALSARTAN/HYDROCHLOROTHIAZIDE', NULL, 'DIOLO CO 80MG/12.5MG 80MG/12.5MG', NULL, 133.03, 152.98, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.530552', '2021-03-27 20:26:48.530564'),
(169, 'ATORVASTATIN', NULL, 'ADCO ATORVASTATIN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.637959', '2021-03-27 20:26:48.637969'),
(170, 'ATORVASTATIN', NULL, 'ASPAVOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.800740', '2021-03-27 20:26:48.800751'),
(171, 'ATORVASTATIN', NULL, 'ASTOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:48.937395', '2021-03-27 20:26:48.937406'),
(172, 'ATORVASTATIN', NULL, 'ATOLIP 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.085436', '2021-03-27 20:26:49.085450'),
(173, 'ATORVASTATIN', NULL, 'ATORVASTATIN LHC', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.174053', '2021-03-27 20:26:49.174063'),
(174, 'ATORVASTATIN', NULL, 'ATORVASTATIN UNICORN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.284964', '2021-03-27 20:26:49.284975'),
(175, 'ATORVASTATIN', NULL, 'ATORVASTATIN WINTHROP 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.384963', '2021-03-27 20:26:49.384974'),
(176, 'ATORVASTATIN', NULL, 'DYNATOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.473929', '2021-03-27 20:26:49.473940'),
(177, 'ATORVASTATIN', NULL, 'LESTAVOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.584792', '2021-03-27 20:26:49.584802'),
(178, 'ATORVASTATIN', NULL, 'LIPITOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.721447', '2021-03-27 20:26:49.721459'),
(179, 'ATORVASTATIN', NULL, 'LIPOGEN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:49.873297', '2021-03-27 20:26:49.873306'),
(180, 'ATORVASTATIN', NULL, 'RAN-ATORVASTATIN 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.006692', '2021-03-27 20:26:50.006702'),
(181, 'ATORVASTATIN', NULL, 'VASTOR 10MG', NULL, 34.29, 39.43, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.118002', '2021-03-27 20:26:50.118013'),
(182, 'ATORVASTATIN', NULL, 'ADCO ATORVASTATIN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.273333', '2021-03-27 20:26:50.273343'),
(183, 'ATORVASTATIN', NULL, 'ASPAVOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.384275', '2021-03-27 20:26:50.384285'),
(184, 'ATORVASTATIN', NULL, 'ASTOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.472881', '2021-03-27 20:26:50.472892'),
(185, 'ATORVASTATIN', NULL, 'ATOLIP 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.583947', '2021-03-27 20:26:50.583958'),
(186, 'ATORVASTATIN', NULL, 'ATORVASTATIN LHC', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.750215', '2021-03-27 20:26:50.750226'),
(187, 'ATORVASTATIN', NULL, 'ATORVASTATIN UNICORN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:50.883640', '2021-03-27 20:26:50.883650'),
(188, 'ATORVASTATIN', NULL, 'ATORVASTATIN WINTHROP 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.005633', '2021-03-27 20:26:51.005643'),
(189, 'ATORVASTATIN', NULL, 'DYNATOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.095478', '2021-03-27 20:26:51.095487'),
(190, 'ATORVASTATIN', NULL, 'LESTAVOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.195453', '2021-03-27 20:26:51.195462'),
(191, 'ATORVASTATIN', NULL, 'LIPITOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.373284', '2021-03-27 20:26:51.373294'),
(192, 'ATORVASTATIN', NULL, 'LIPOGEN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.484099', '2021-03-27 20:26:51.484109'),
(193, 'ATORVASTATIN', NULL, 'RAN-ATORVASTATIN 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.595080', '2021-03-27 20:26:51.595091'),
(194, 'ATORVASTATIN', NULL, 'VASTOR 20MG', NULL, 36.62, 42.11, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.772452', '2021-03-27 20:26:51.772462'),
(195, 'RISPERIDONE', NULL, 'ASPEN RISPERIDONE .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:51.883386', '2021-03-27 20:26:51.883396'),
(196, 'RISPERIDONE', NULL, 'AUROPERDAL .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:52.027718', '2021-03-27 20:26:52.027728'),
(197, 'RISPERIDONE', NULL, 'DRL RISPERIDONE .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:52.135770', '2021-03-27 20:26:52.135779'),
(198, 'RISPERIDONE', NULL, 'PERIDA .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:52.271798', '2021-03-27 20:26:52.271831'),
(199, 'RISPERIDONE', NULL, 'PERIZAL .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:52.382831', '2021-03-27 20:26:52.382841'),
(200, 'RISPERIDONE', NULL, 'RISNIA .5MG', NULL, 127.04, 146.1, NULL, NULL, 1, 'instructsme@gmail.com', 1, '2021-03-27 20:26:52.516036', '2021-03-27 20:26:52.516047'),
(201, 'others', NULL, 'Paracetamol', NULL, 100, 130, NULL, NULL, 4, 'peter@gmail.com', 4, '2021-03-29 17:20:06.885163', '2021-03-29 17:20:06.885171'),
(202, 'others', NULL, 'Ibucap', NULL, 100, 130, NULL, NULL, 4, 'peter@gmail.com', 4, '2021-03-29 17:20:07.078497', '2021-03-29 17:20:07.078509');

-- --------------------------------------------------------

--
-- Table structure for table `user_record`
--

CREATE TABLE `user_record` (
  `id` int NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `othername` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email_one` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_two` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_one` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_two` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `countryCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `persional_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `account_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `pwd_auth_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `pwd_auth` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_record`
--

INSERT INTO `user_record` (`id`, `surname`, `firstname`, `othername`, `email_one`, `email_two`, `phone_one`, `phone_two`, `countryCode`, `gender`, `age`, `persional_id`, `account_type`, `user_role`, `pwd_auth_hash`, `pwd_auth`, `created_by`, `date_created`, `last_modified`) VALUES
(1, 'Adewale', 'kudus', '', 'adewaleme@gmail.com', '', '08172790181', '', '+234', 'Male', 22, 'null', '1', '', '', 'Adewale', 1, '2021-03-29 10:25:30.117509', '2021-03-29 10:25:30.117516'),
(2, 'Lawal', 'Motunrayo', 'null', 'lawal@gmail.com', '', '08176767878', '', '+234', 'Female', 26, 'null', '1', '', '', 'Lawal', 3, '2021-03-29 16:53:31.363746', '2021-03-29 16:53:31.363758'),
(3, 'lawrence', 'opeyemi', 'null', 'lawrence@gmail.com', '', '08172790181', '', '+234', 'Female', 23, 'null', '1', '', '', 'lawrence', 2, '2021-03-30 09:25:17.099188', '2021-03-30 09:25:17.099203');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_record`
--
ALTER TABLE `admin_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_prices`
--
ALTER TABLE `sale_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_record`
--
ALTER TABLE `user_record`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_record`
--
ALTER TABLE `admin_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_prices`
--
ALTER TABLE `sale_prices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `user_record`
--
ALTER TABLE `user_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
