-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 02:28 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reference`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_admin`
--

CREATE TABLE `app_admin` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_admin`
--

INSERT INTO `app_admin` (`id`, `email`, `password`) VALUES
(1, 'Admin', 'ABCD!123');

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `recommended` varchar(255) NOT NULL,
  `referer_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`id`, `name`, `email`, `mobile`, `gender`, `password`, `recommended`, `referer_code`) VALUES
(57, 'Nikhil Patil', 'np01@gmail.com', '9876543210', 'm', 'pbkdf2_sha256$100000$EAT7e7JCWwJV$ZKfNmyL4PsQLMn+GgyZoT0fV84y+LjORH8ZHIfQktxE=', '', 'NPerDzuimlobv7l'),
(58, 'Roshani Chauhan', 'rc1@gmail.com', '9876445656', 'f', 'pbkdf2_sha256$100000$O8SpVwGOA5kS$AqD4DKflVf1rlReIeb3N+LRtos4I8DhdSqr3E3pb6UA=', 'Nikhil Patil', 'MT0rB2L34EVdJIu'),
(59, 'Nilesh Patil', 'nil@gmail.com', '9999999999', 'm', 'pbkdf2_sha256$100000$G7ePfdYkmm4C$8Q0+xOw6Usa7b/8VN3A/DfjxpKIm5PjVoNEy1AUXEOY=', 'Nikhil Patil', '7lv5w9LGlt8HhKv');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add admin', 7, 'add_admin'),
(20, 'Can change admin', 7, 'change_admin'),
(21, 'Can delete admin', 7, 'delete_admin'),
(22, 'Can add user', 8, 'add_user'),
(23, 'Can change user', 8, 'change_user'),
(24, 'Can delete user', 8, 'delete_user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$P0eNQgksqSTd$HrfCxNBKyquOphWouqBznS768dEkwNxIjKo8VHsarpQ=', '2021-10-27 05:13:15.024754', 1, 'Admin', '', '', 'np01@gmail.com', 1, 1, '2021-10-25 09:59:44.251181');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-10-25 10:00:48.675586', '1', 'Admin object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-10-26 07:31:00.553488', '37', 'Hardik Patel', 2, '[]', 8, 1),
(3, '2021-10-26 13:04:33.099849', '47', 'Akash Suthar', 2, '[]', 8, 1),
(4, '2021-10-27 05:13:26.566877', '52', 'Nilll', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 8, 1),
(5, '2021-10-27 05:15:16.538299', '52', 'Nilll', 2, '[]', 8, 1),
(6, '2021-10-27 05:15:29.558540', '52', 'Nilll', 2, '[]', 8, 1),
(7, '2021-10-27 05:35:25.500170', '52', 'Nilll', 3, '', 8, 1),
(8, '2021-10-27 05:35:25.500170', '51', 'Nilesh Patil', 3, '', 8, 1),
(9, '2021-10-27 05:35:25.500170', '50', 'Hardik Patel', 3, '', 8, 1),
(10, '2021-10-27 05:35:25.500170', '49', 'Hardik Patel', 3, '', 8, 1),
(11, '2021-10-27 05:35:25.500170', '48', 'Hardik Patel', 3, '', 8, 1),
(12, '2021-10-27 05:35:25.500170', '47', 'Akash Suthar', 3, '', 8, 1),
(13, '2021-10-27 05:35:25.500170', '46', 'Hardik Patel', 3, '', 8, 1),
(14, '2021-10-27 05:35:25.500170', '44', 'Hardik Patel', 3, '', 8, 1),
(15, '2021-10-27 05:35:25.500170', '42', 'Hardik Patel', 3, '', 8, 1),
(16, '2021-10-27 05:35:25.500170', '41', 'Kajal Rajput', 3, '', 8, 1),
(17, '2021-10-27 05:35:25.515790', '29', 'Jay Patidar', 3, '', 8, 1),
(18, '2021-10-27 05:35:25.515790', '27', 'Hardik Patel', 3, '', 8, 1),
(19, '2021-10-27 05:35:25.515790', '25', 'Khusi Raval', 3, '', 8, 1),
(20, '2021-10-27 05:35:25.515790', '23', 'Rajdeep Barot', 3, '', 8, 1),
(21, '2021-10-27 05:35:25.515790', '22', 'Kamya Prajapti', 3, '', 8, 1),
(22, '2021-10-27 05:35:25.515790', '21', 'Keval Bhanderi', 3, '', 8, 1),
(23, '2021-10-27 05:35:25.515790', '19', 'Bhuri ', 3, '', 8, 1),
(24, '2021-10-27 05:35:25.515790', '17', 'Khusi Raval', 3, '', 8, 1),
(25, '2021-10-27 05:35:25.515790', '16', 'Poonam Patil', 3, '', 8, 1),
(26, '2021-10-27 05:35:25.515790', '15', 'Roshani Chauhan', 3, '', 8, 1),
(27, '2021-10-27 05:35:25.515790', '14', 'Hardik Patel', 3, '', 8, 1),
(28, '2021-10-27 05:35:25.515790', '13', 'Nikhil Patil', 3, '', 8, 1),
(29, '2021-10-27 05:35:35.190700', '56', 'Nil', 3, '', 8, 1),
(30, '2021-10-27 05:35:35.190700', '55', 'qwww@gmail.com', 3, '', 8, 1),
(31, '2021-10-27 05:35:35.190700', '54', 'hdghg', 3, '', 8, 1),
(32, '2021-10-27 05:35:35.190700', '53', 'hjdfhgh', 3, '', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app', 'admin'),
(8, 'app', 'user'),
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
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-25 09:56:03.299119'),
(2, 'auth', '0001_initial', '2021-10-25 09:56:03.483738'),
(3, 'admin', '0001_initial', '2021-10-25 09:56:03.540682'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-25 09:56:03.540682'),
(5, 'app', '0001_initial', '2021-10-25 09:56:03.556306'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-25 09:56:03.603170'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-25 09:56:03.621797'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-25 09:56:03.637422'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-25 09:56:03.653045'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-25 09:56:03.668665'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-25 09:56:03.668665'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-25 09:56:03.684287'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-25 09:56:03.715529'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-25 09:56:03.722034'),
(15, 'sessions', '0001_initial', '2021-10-25 09:56:03.737660'),
(16, 'app', '0002_auto_20211026_1124', '2021-10-26 05:54:15.755943');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('46gnbx66vzq7m2svpi6xnnfig0f3hh85', 'MGQwOWI2ZmE2ZTc4YTNhNTUwZDZhMDU4OGE2MjM2OWUyOGIxNmJjNDp7InVpZCI6NTcsInVuYW1lIjoiTmlraGlsIFBhdGlsIn0=', '2021-11-10 11:13:23.762505'),
('a8mbmnsukdtpq4lhzb56opin3nbldlb5', 'MjM4MGZkZGE1OGYzODVmZTExYjQ5OTBhNzJjYjQ2MjhkNmEyOTQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZjgzMTcyNDYzZWVlZmE5MTQyZmRkNmVlOGRhMjgxZjBhMzhjNTZjIiwiaWQiOjEsInVpZCI6NTcsInVuYW1lIjoiTmlraGlsIFBhdGlsIn0=', '2021-11-10 06:50:33.956455'),
('juj1v7qbygcahnsxfxa3opujqcflm4dr', 'MzYwMTZkYTE4ODk4MTNhNTQwMGFhOTJiYTZjZGViN2YzODM5NzQ5Yjp7InVpZCI6MjEsInVuYW1lIjoiS2V2YWwgQmhhbmRlcmkifQ==', '2021-11-09 13:55:15.749871'),
('o7j7rsq94s65fsn4sja11v2vusfq5wqc', 'MjM4MGZkZGE1OGYzODVmZTExYjQ5OTBhNzJjYjQ2MjhkNmEyOTQxZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZjgzMTcyNDYzZWVlZmE5MTQyZmRkNmVlOGRhMjgxZjBhMzhjNTZjIiwiaWQiOjEsInVpZCI6NTcsInVuYW1lIjoiTmlraGlsIFBhdGlsIn0=', '2021-11-10 06:43:22.307685');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_admin`
--
ALTER TABLE `app_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_admin`
--
ALTER TABLE `app_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
