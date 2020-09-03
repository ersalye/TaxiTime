-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 10, 2020 at 11:35 AM
-- Server version: 10.1.44-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taxitime_taxi`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Alice', 'alice@gmail.com', '0725214032', '$2y$10$miN/pGCYgjOvK8/CPkaoQ.cSbYk8KPmP1dK.6SyimkRt.SuhHj8KO', NULL, '2020-03-07 20:25:10', '2020-03-07 20:25:10'),
(3, 'Manish Kumar', 'testmail@gmail.com', '8520852080', '$2y$10$1l/rF3NdEDPWEyFxWLKfLeVymqkGxNZvgSfNnHFDjrzsgqwXuxuAe', '2LSM9rA2cZmffyJXM4fpzYqiqb8q6diCNhYwJGPoUcokIcGeG5lKvfqTXIJw', '2020-03-05 17:18:07', '2020-03-09 14:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `account_password_resets`
--

CREATE TABLE `account_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `picture`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'TaxiTime', 'admin@taxitime.com', '$2y$10$mI9RahQcCx6VCEgEjBS2y.WOm1ATh4mt3rSLvYHiSQ2PvBSPL.ev2', '', 'bL0tF0Osq53COnFnu6umrK4TM3MBYacDbSNrRNQRz1NrXv1eezomEjh4FmWP', NULL, '2020-03-10 07:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `paypal_id` varchar(1000) NOT NULL,
  `upi_id` varchar(1000) NOT NULL,
  `account_name` varchar(1000) NOT NULL,
  `type` varchar(100) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `account_number` varchar(1000) NOT NULL,
  `IFSC_code` varchar(500) DEFAULT NULL,
  `MICR_code` varchar(500) DEFAULT NULL,
  `routing_number` int(100) DEFAULT NULL,
  `provider_id` int(100) NOT NULL,
  `status` enum('WAITING','APPROVED') NOT NULL DEFAULT 'WAITING',
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('up','pu') COLLATE utf8_unicode_ci NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'Any City');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `state_id`, `created_at`, `deleted_at`) VALUES
(1, 'Ahmedabad', 1, '2020-03-07 08:58:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text,
  `attachment` text,
  `type` varchar(50) DEFAULT NULL,
  `transfer` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pushes`
--

CREATE TABLE `custom_pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT') COLLATE utf8_unicode_ci NOT NULL,
  `condition_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `dispatchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_password_resets`
--

CREATE TABLE `dispatcher_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(10, 'Licence', 'DRIVER', '2020-02-18 13:02:32', '2020-02-29 09:23:58'),
(11, 'Log Book', 'VEHICLE', '2020-02-18 13:05:38', '2020-03-01 01:58:37'),
(12, 'Bank Passbook', 'DRIVER', '2020-02-18 13:05:51', '2020-02-18 13:05:51'),
(13, 'National ID', 'DRIVER', '2020-03-01 01:58:12', '2020-03-01 01:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_locations`
--

CREATE TABLE `favourite_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `type` enum('home','work','recent','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fleets`
--

CREATE TABLE `fleets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fleet_password_resets`
--

CREATE TABLE `fleet_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend`
--

CREATE TABLE `frontend` (
  `id` int(11) NOT NULL,
  `keycode` varchar(50) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(457, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(458, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(459, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(460, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(461, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(462, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(463, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(464, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(465, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(466, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(467, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(468, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(469, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(470, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(471, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(472, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(473, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(474, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(475, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(476, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(477, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(478, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(479, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(480, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(481, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(482, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(483, 0, 'en', 'validation', 'filled', 'The :attribute field is required.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(484, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(485, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(486, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(487, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(488, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(489, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(490, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(491, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(492, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(493, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(494, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(495, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(496, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(497, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(498, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(499, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(500, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(501, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(502, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(503, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(504, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(505, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(506, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(507, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(508, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(509, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(510, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(511, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(512, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(513, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(514, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(515, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(516, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(517, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(518, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(519, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(520, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(521, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(522, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(523, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(524, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(525, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(526, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(527, 0, 'en', 'user', 'profile.old_password', 'Old Password', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(528, 0, 'en', 'user', 'profile.password', 'Password', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(529, 0, 'en', 'user', 'profile.confirm_password', 'Confirm Password', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(530, 0, 'en', 'user', 'profile.first_name', 'First Name', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(531, 0, 'en', 'user', 'profile.last_name', 'Last Name', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(532, 0, 'en', 'user', 'profile.email', 'Email', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(533, 0, 'en', 'user', 'profile.mobile', 'Mobile', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(534, 0, 'en', 'user', 'profile.general_information', 'General Information', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(535, 0, 'en', 'user', 'profile.profile_picture', 'Profile Picture', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(536, 0, 'en', 'user', 'profile.wallet_balance', 'Wallet Balance', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(537, 0, 'en', 'user', 'profile.edit', 'Edit', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(538, 0, 'en', 'user', 'profile.save', 'Save', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(539, 0, 'en', 'user', 'profile.edit_information', 'Edit Information', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(540, 0, 'en', 'user', 'profile.change_password', 'Change Password', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(541, 0, 'en', 'user', 'profile.profile', 'Profile', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(542, 0, 'en', 'user', 'profile.logout', 'Logout', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(543, 0, 'en', 'user', 'profile.name', 'Name', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(544, 0, 'en', 'user', 'cash', 'CASH', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(545, 0, 'en', 'user', 'booking_id', 'Booking Id', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(546, 0, 'en', 'user', 'service_number', 'Car Number', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(547, 0, 'en', 'user', 'service_model', 'Car Model', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(548, 0, 'en', 'user', 'card.fullname', 'Full Name', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(549, 0, 'en', 'user', 'card.card_no', 'Card Number', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(550, 0, 'en', 'user', 'card.cvv', 'CVV', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(551, 0, 'en', 'user', 'card.add_card', 'Add Card', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(552, 0, 'en', 'user', 'card.delete', 'Delete', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(553, 0, 'en', 'user', 'card.month', 'Month', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(554, 0, 'en', 'user', 'card.year', 'Year', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(555, 0, 'en', 'user', 'card.default', 'Default', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(556, 0, 'en', 'user', 'fare_breakdown', 'FARE BREAKDOWN', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(557, 0, 'en', 'user', 'ride.finding_driver', 'Finding your Driver', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(558, 0, 'en', 'user', 'ride.accepted_ride', 'Accepted Your Ride', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(559, 0, 'en', 'user', 'ride.arrived_ride', 'Arrived At your Location', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(560, 0, 'en', 'user', 'ride.onride', 'Enjoy your Ride', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(561, 0, 'en', 'user', 'ride.waiting_payment', 'Waiting for Payment', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(562, 0, 'en', 'user', 'ride.rate_and_review', 'Rate and Review', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(563, 0, 'en', 'user', 'ride.ride_now', 'Ride Now', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(564, 0, 'en', 'user', 'ride.cancel_request', 'Cancel Request', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(565, 0, 'en', 'user', 'ride.ride_status', 'Ride Status', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(566, 0, 'en', 'user', 'ride.dropped_ride', 'Your Ride is Completed', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(567, 0, 'en', 'user', 'ride.ride_details', 'Ride Details', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(568, 0, 'en', 'user', 'ride.invoice', 'Invoice', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(569, 0, 'en', 'user', 'ride.base_price', 'Base Fare', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(570, 0, 'en', 'user', 'ride.tax_price', 'Tax Fare', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(571, 0, 'en', 'user', 'ride.distance_price', 'Distance Fare', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(572, 0, 'en', 'user', 'ride.comment', 'Comment', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(573, 0, 'en', 'user', 'ride.detection_wallet', 'Wallet Detection', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(574, 0, 'en', 'user', 'ride.rating', 'Rating', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(575, 0, 'en', 'user', 'ride.km', 'Kilometer', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(576, 0, 'en', 'user', 'ride.total', 'Total', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(577, 0, 'en', 'user', 'ride.amount_paid', 'Amount to be Paid', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(578, 0, 'en', 'user', 'ride.promotion_applied', 'Promotion Applied', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(579, 0, 'en', 'user', 'ride.request_inprogress', 'Ride Already in Progress', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(580, 0, 'en', 'user', 'ride.request_scheduled', 'Ride Already Scheduled on this time', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(581, 0, 'en', 'user', 'ride.cancel_reason', 'Cancel Reason', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(582, 0, 'en', 'user', 'ride.wallet_deduction', 'Wallet Deduction', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(583, 0, 'en', 'user', 'dashboard', 'Dashboard', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(584, 0, 'en', 'user', 'payment', 'Payment', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(585, 0, 'en', 'user', 'wallet', 'Wallet', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(586, 0, 'en', 'user', 'my_wallet', 'My Wallet', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(587, 0, 'en', 'user', 'my_trips', 'My Trips', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(588, 0, 'en', 'user', 'in_your_wallet', 'in your wallet', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(589, 0, 'en', 'user', 'status', 'Status', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(590, 0, 'en', 'user', 'driver_name', 'Driver Name', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(591, 0, 'en', 'user', 'driver_rating', 'Driver Rating', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(592, 0, 'en', 'user', 'payment_mode', 'Payment Mode', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(593, 0, 'en', 'user', 'add_money', 'Add Money', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(594, 0, 'en', 'user', 'date', 'Date', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(595, 0, 'en', 'user', 'schedule_date', 'Scheduled Date', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(596, 0, 'en', 'user', 'amount', 'Total Amount', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(597, 0, 'en', 'user', 'type', 'Type', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(598, 0, 'en', 'user', 'time', 'Time', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(599, 0, 'en', 'user', 'request_id', 'Request ID', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(600, 0, 'en', 'user', 'paid_via', 'PAID VIA', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(601, 0, 'en', 'user', 'from', 'From', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(602, 0, 'en', 'user', 'total_distance', 'Total Distance', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(603, 0, 'en', 'user', 'eta', 'ETA', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(604, 0, 'en', 'user', 'to', 'To', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(605, 0, 'en', 'user', 'use_wallet_balance', 'Use Wallet Balance', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(606, 0, 'en', 'user', 'available_wallet_balance', 'Available Wallet Balance', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(607, 0, 'en', 'user', 'estimated_fare', 'Estimated Fare', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(608, 0, 'en', 'user', 'charged', 'CHARGED', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(609, 0, 'en', 'user', 'payment_method', 'Payment Methods', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(610, 0, 'en', 'user', 'promotion', 'Promotions', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(611, 0, 'en', 'user', 'add_promocode', 'Add Promocode', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(612, 0, 'en', 'user', 'upcoming_trips', 'Upcoming trips', '2020-02-20 23:35:10', '2020-03-09 21:32:34'),
(613, 0, 'en', 'servicetypes', 'MIN', 'Per Minute Pricing', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(614, 0, 'en', 'servicetypes', 'HOUR', 'Per Hour Pricing', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(615, 0, 'en', 'servicetypes', 'DISTANCE', 'Distance Pricing', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(616, 0, 'en', 'servicetypes', 'DISTANCEMIN', 'Distance and Per Minute Pricing', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(617, 0, 'en', 'servicetypes', 'DISTANCEHOUR', 'Distance and Per Hour Pricing', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(618, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(619, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(620, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(621, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(622, 0, 'en', 'admin', 'name', 'Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(623, 0, 'en', 'admin', 'email', 'Email', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(624, 0, 'en', 'admin', 'first_name', 'First Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(625, 0, 'en', 'admin', 'last_name', 'Last Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(626, 0, 'en', 'admin', 'picture', 'Picture', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(627, 0, 'en', 'admin', 'password', 'Password ', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(628, 0, 'en', 'admin', 'mobile', 'Mobile', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(629, 0, 'en', 'admin', 'cancel', 'Cancel', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(630, 0, 'en', 'admin', 'back', 'Back', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(631, 0, 'en', 'admin', 'id', 'ID', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(632, 0, 'en', 'admin', 'edit', 'Edit', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(633, 0, 'en', 'admin', 'gender', 'Gender', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(634, 0, 'en', 'admin', 'address', 'Address', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(635, 0, 'en', 'admin', 'action', 'Action', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(636, 0, 'en', 'admin', 'Enable', 'Enable', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(637, 0, 'en', 'admin', 'Disable', 'Disable', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(638, 0, 'en', 'admin', 'type', 'Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(639, 0, 'en', 'admin', 'delete', 'Delete', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(640, 0, 'en', 'admin', 'help', 'Help', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(641, 0, 'en', 'admin', 'status', 'Status', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(642, 0, 'en', 'admin', 'message', 'Message', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(643, 0, 'en', 'admin', 'History', 'History', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(644, 0, 'en', 'admin', 'Statements', 'Statements', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(645, 0, 'en', 'admin', 'amount', 'Amount', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(646, 0, 'en', 'admin', 'account.change_password', 'Change Password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(647, 0, 'en', 'admin', 'account.old_password', 'Old Password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(648, 0, 'en', 'admin', 'account.password', 'Password ', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(649, 0, 'en', 'admin', 'account.password_confirmation', 'Password Confirmation', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(650, 0, 'en', 'admin', 'account.update_profile', 'Update Profile', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(651, 0, 'en', 'admin', 'account-manager.add_account_manager', 'Add Account Manager', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(652, 0, 'en', 'admin', 'account-manager.full_name', 'Full Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(653, 0, 'en', 'admin', 'account-manager.password_confirmation', 'Password Confirmation', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(654, 0, 'en', 'admin', 'account-manager.update_account_manager', 'Update Account Manager', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(655, 0, 'en', 'admin', 'account-manager.account_manager', 'Account Manager', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(656, 0, 'en', 'admin', 'account-manager.add_new_account_manager', 'Add New Account Manager', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(657, 0, 'en', 'admin', 'auth.reset_password', 'Reset Password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(658, 0, 'en', 'admin', 'auth.admin_login', 'Admin Login', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(659, 0, 'en', 'admin', 'auth.login_here', 'Login Here', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(660, 0, 'en', 'admin', 'auth.remember_me', 'Remember Me', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(661, 0, 'en', 'admin', 'auth.sign_in', 'Sign In', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(662, 0, 'en', 'admin', 'auth.forgot_your_password', 'Forgot Your Password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(663, 0, 'en', 'admin', 'auth.request_scheduled', 'Ride Scheduled', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(664, 0, 'en', 'admin', 'auth.request_already_scheduled', 'Ride Already Scheduled', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(665, 0, 'en', 'admin', 'dispatcher.add_dispatcher', 'Add Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(666, 0, 'en', 'admin', 'dispatcher.update_dispatcher', 'Update Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(667, 0, 'en', 'admin', 'dispatcher.dispatcher', 'Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(668, 0, 'en', 'admin', 'dispatcher.add_new_dispatcher', 'Add New Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(669, 0, 'en', 'admin', 'document.add_Document', 'Add Document', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(670, 0, 'en', 'admin', 'document.document_name', 'Document Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(671, 0, 'en', 'admin', 'document.document_type', 'Document Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(672, 0, 'en', 'admin', 'document.driver_review', 'Driver Review', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(673, 0, 'en', 'admin', 'document.vehicle_review', 'Vehicle Review', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(674, 0, 'en', 'admin', 'document.update_document', 'Update Document', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(675, 0, 'en', 'admin', 'document.document', 'Document', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(676, 0, 'en', 'admin', 'fleet.add_fleet_owner', 'Add Fleet Owner', '2020-02-20 23:35:10', '2020-02-20 23:35:10'),
(677, 0, 'en', 'admin', 'fleet.company_name', 'Company Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(678, 0, 'en', 'admin', 'fleet.company_logo', 'Company Logo', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(679, 0, 'en', 'admin', 'fleet.update_fleet_owner', 'Update Fleet Owner', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(680, 0, 'en', 'admin', 'fleet.update_fleet', 'Update Fleet', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(681, 0, 'en', 'admin', 'fleet.fleet_owners', 'Fleet Owners', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(682, 0, 'en', 'admin', 'fleet.add_new_fleet_owner', 'Add New Fleet Owner', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(683, 0, 'en', 'admin', 'fleet.show_provider', 'Show Provider', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(684, 0, 'en', 'admin', 'include.profile', 'Profile', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(685, 0, 'en', 'admin', 'include.sign_out', 'Sign out', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(686, 0, 'en', 'admin', 'include.admin_dashboard', 'Admin Dashboard', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(687, 0, 'en', 'admin', 'include.dashboard', 'Dashboard', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(688, 0, 'en', 'admin', 'include.dispatcher_panel', 'Dispatcher Panel', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(689, 0, 'en', 'admin', 'include.heat_map', 'Heat Map', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(690, 0, 'en', 'admin', 'include.members', 'Members', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(691, 0, 'en', 'admin', 'include.users', 'Users', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(692, 0, 'en', 'admin', 'include.list_users', 'List Users', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(693, 0, 'en', 'admin', 'include.add_new_user', 'Add New User', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(694, 0, 'en', 'admin', 'include.providers', 'Providers', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(695, 0, 'en', 'admin', 'include.list_providers', 'List Providers', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(696, 0, 'en', 'admin', 'include.add_new_provider', 'Add New Provider', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(697, 0, 'en', 'admin', 'include.dispatcher', 'Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(698, 0, 'en', 'admin', 'include.list_dispatcher', 'List Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(699, 0, 'en', 'admin', 'include.add_new_dispatcher', 'Add New Dispatcher', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(700, 0, 'en', 'admin', 'include.fleet_owner', 'Fleet Owner', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(701, 0, 'en', 'admin', 'include.list_fleets', 'List Fleets', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(702, 0, 'en', 'admin', 'include.add_new_fleet_owner', 'Add New Fleet Owner', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(703, 0, 'en', 'admin', 'include.account_manager', 'Account Manager', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(704, 0, 'en', 'admin', 'include.list_account_managers', 'List Account Managers', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(705, 0, 'en', 'admin', 'include.add_new_account_manager', 'Add New Account Manager', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(706, 0, 'en', 'admin', 'include.accounts', 'Accounts', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(707, 0, 'en', 'admin', 'include.statements', 'Statements', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(708, 0, 'en', 'admin', 'include.overall_ride_statments', 'Overall Ride Statments', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(709, 0, 'en', 'admin', 'include.provider_statement', 'Provider Statement', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(710, 0, 'en', 'admin', 'include.daily_statement', 'Daily Statement', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(711, 0, 'en', 'admin', 'include.monthly_statement', 'Monthly Statement', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(712, 0, 'en', 'admin', 'include.yearly_statement', 'Yearly Statement', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(713, 0, 'en', 'admin', 'include.details', 'Details', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(714, 0, 'en', 'admin', 'include.map', 'Map', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(715, 0, 'en', 'admin', 'include.ratings', 'Ratings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(716, 0, 'en', 'admin', 'include.reviews', 'Reviews', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(717, 0, 'en', 'admin', 'include.user_ratings', 'User Ratings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(718, 0, 'en', 'admin', 'include.provider_ratings', 'Provider Ratings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(719, 0, 'en', 'admin', 'include.requests', 'Requests', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(720, 0, 'en', 'admin', 'include.request_history', 'Request History', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(721, 0, 'en', 'admin', 'include.scheduled_rides', 'Scheduled Rides', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(722, 0, 'en', 'admin', 'include.general', 'General', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(723, 0, 'en', 'admin', 'include.service_types', 'Service Types', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(724, 0, 'en', 'admin', 'include.list_service_types', 'List Service Types', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(725, 0, 'en', 'admin', 'include.add_new_service_type', 'Add New Service Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(726, 0, 'en', 'admin', 'include.documents', 'Documents', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(727, 0, 'en', 'admin', 'include.list_documents', 'List Documents', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(728, 0, 'en', 'admin', 'include.add_new_document', 'Add New Document', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(729, 0, 'en', 'admin', 'include.promocodes', 'Promocodes', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(730, 0, 'en', 'admin', 'include.list_promocodes', 'List Promocodes', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(731, 0, 'en', 'admin', 'include.add_new_promocode', 'Add New Promocode', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(732, 0, 'en', 'admin', 'include.payment_details', 'Payment Details', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(733, 0, 'en', 'admin', 'include.payment_history', 'Payment History', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(734, 0, 'en', 'admin', 'include.payment_settings', 'Payment Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(735, 0, 'en', 'admin', 'include.settings', 'Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(736, 0, 'en', 'admin', 'include.site_settings', 'Site Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(737, 0, 'en', 'admin', 'include.others', 'Others', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(738, 0, 'en', 'admin', 'include.privacy_policy', 'Privacy Policy', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(739, 0, 'en', 'admin', 'include.help', 'Help', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(740, 0, 'en', 'admin', 'include.custom_push', 'Custom Push', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(741, 0, 'en', 'admin', 'include.translations', 'Translations', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(742, 0, 'en', 'admin', 'include.account', 'Account', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(743, 0, 'en', 'admin', 'include.account_settings', 'Account Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(744, 0, 'en', 'admin', 'include.change_password', 'Change Password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(745, 0, 'en', 'admin', 'include.logout', 'Logout', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(746, 0, 'en', 'admin', 'pages.pages', 'Pages', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(747, 0, 'en', 'admin', 'payment.payment_history', 'Payment History', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(748, 0, 'en', 'admin', 'payment.request_id', 'Request ID', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(749, 0, 'en', 'admin', 'payment.transaction_id', 'Transaction ID', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(750, 0, 'en', 'admin', 'payment.from', 'From', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(751, 0, 'en', 'admin', 'payment.to', 'To', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(752, 0, 'en', 'admin', 'payment.total_amount', 'Total Amount', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(753, 0, 'en', 'admin', 'payment.provider_amount', 'Provider Amount', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(754, 0, 'en', 'admin', 'payment.payment_mode', 'Payment Mode', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(755, 0, 'en', 'admin', 'payment.payment_status', 'Payment Status', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(756, 0, 'en', 'admin', 'payment.payment_modes', 'Payment Modes', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(757, 0, 'en', 'admin', 'payment.card_payments', 'Stripe (Card Payments)', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(758, 0, 'en', 'admin', 'payment.stripe_secret_key', 'Stripe Secret key', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(759, 0, 'en', 'admin', 'payment.stripe_publishable_key', 'Stripe Publishable key', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(760, 0, 'en', 'admin', 'payment.cash_payments', 'Cash Payments', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(761, 0, 'en', 'admin', 'payment.payment_settings', 'Payment Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(762, 0, 'en', 'admin', 'payment.daily_target', 'Daily Target', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(763, 0, 'en', 'admin', 'payment.tax_percentage', 'Tax percentage(%)', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(764, 0, 'en', 'admin', 'payment.surge_trigger_point', 'Surge Trigger Point', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(765, 0, 'en', 'admin', 'payment.surge_percentage', 'Surge Percentage(%)', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(766, 0, 'en', 'admin', 'payment.commission_percentage', 'Commission Percentage(%)', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(767, 0, 'en', 'admin', 'payment.provider_commission_percentage', 'Provider Commission Percentage(%)', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(768, 0, 'en', 'admin', 'payment.booking_id_prefix', 'Booking ID Prefix', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(769, 0, 'en', 'admin', 'payment.currency', 'Currency', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(770, 0, 'en', 'admin', 'payment.update_site_settings', 'Update Site Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(771, 0, 'en', 'admin', 'promocode.add_promocode', 'Add Promocode', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(772, 0, 'en', 'admin', 'promocode.discount', 'Discount', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(773, 0, 'en', 'admin', 'promocode.expiration', 'Expiration', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(774, 0, 'en', 'admin', 'promocode.promocode', 'Promocode', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(775, 0, 'en', 'admin', 'promocode.update_promocode', 'Update Promocode', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(776, 0, 'en', 'admin', 'promocode.used_count', 'Used Count', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(777, 0, 'en', 'admin', 'promocode.promocodes', 'Promocodes', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(778, 0, 'en', 'admin', 'promocode.discount_type', 'Promocode Use ', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(779, 0, 'en', 'admin', 'provides.provider_name', 'Provider Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(780, 0, 'en', 'admin', 'provides.approve', 'Approve', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(781, 0, 'en', 'admin', 'provides.delete', 'Delete', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(782, 0, 'en', 'admin', 'provides.add_provider', 'Add Provider', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(783, 0, 'en', 'admin', 'provides.password_confirmation', 'Password Confirmation', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(784, 0, 'en', 'admin', 'provides.update_provider', 'Update Provider', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(785, 0, 'en', 'admin', 'provides.type_allocation', 'Provider Service Type Allocation', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(786, 0, 'en', 'admin', 'provides.service_name', 'Service Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(787, 0, 'en', 'admin', 'provides.service_number', 'Service Number', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(788, 0, 'en', 'admin', 'provides.service_model', 'Service Model', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(789, 0, 'en', 'admin', 'provides.provider_documents', 'Provider Documents', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(790, 0, 'en', 'admin', 'provides.document_type', 'Document Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(791, 0, 'en', 'admin', 'provides.providers', 'Providers', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(792, 0, 'en', 'admin', 'provides.add_new_provider', 'add New Provider', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(793, 0, 'en', 'admin', 'provides.total_requests', 'Total Requests', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(794, 0, 'en', 'admin', 'provides.full_name', 'Full Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(795, 0, 'en', 'admin', 'provides.accepted_requests', 'Accepted Requests', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(796, 0, 'en', 'admin', 'provides.cancelled_requests', 'Cancelled Requests', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(797, 0, 'en', 'admin', 'provides.service_type', 'Documents / Service Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(798, 0, 'en', 'admin', 'provides.online', 'Online', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(799, 0, 'en', 'admin', 'provides.Provider_Details', 'Provider Details', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(800, 0, 'en', 'admin', 'provides.Approved', 'Approved', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(801, 0, 'en', 'admin', 'provides.Not_Approved', 'Not Approved', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(802, 0, 'en', 'admin', 'provides.Total_Rides', 'Total Rides', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(803, 0, 'en', 'admin', 'provides.Total_Earning', 'Total Earning', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(804, 0, 'en', 'admin', 'provides.Commission', 'Commission', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(805, 0, 'en', 'admin', 'provides.Joined_at', 'Joined at', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(806, 0, 'en', 'admin', 'provides.Details', 'Details', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(807, 0, 'en', 'admin', 'request.Booking_ID', 'Booking ID', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(808, 0, 'en', 'admin', 'request.User_Name', 'User Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(809, 0, 'en', 'admin', 'request.Date_Time', 'Date &amp; Time', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(810, 0, 'en', 'admin', 'request.Provider_Name', 'Provider Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(811, 0, 'en', 'admin', 'request.Payment_Mode', 'Payment Mode', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(812, 0, 'en', 'admin', 'request.Payment_Status', 'Payment Status', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(813, 0, 'en', 'admin', 'request.Request_Id', 'Request Id', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(814, 0, 'en', 'admin', 'request.Scheduled_Date_Time', 'Scheduled Date & Time', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(815, 0, 'en', 'admin', 'review.Request_ID', 'Request ID', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(816, 0, 'en', 'admin', 'review.Rating', 'Rating', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(817, 0, 'en', 'admin', 'review.Comments', 'Comments', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(818, 0, 'en', 'admin', 'review.Provider_Reviews', 'Provider Reviews', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(819, 0, 'en', 'admin', 'review.User_Reviews', 'User Reviews', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(820, 0, 'en', 'admin', 'service.Add_Service_Type', 'Add Service Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(821, 0, 'en', 'admin', 'service.Service_Name', 'Service Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(822, 0, 'en', 'admin', 'service.Provider_Name', 'Provider Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(823, 0, 'en', 'admin', 'service.Service_Image', 'Service Image', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(824, 0, 'en', 'admin', 'service.Base_Price', 'Base Price', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(825, 0, 'en', 'admin', 'service.Base_Distance', 'Base Distance', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(826, 0, 'en', 'admin', 'service.unit_time', 'Unit Time Pricing (For Rental amount per hour / 60) ', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(827, 0, 'en', 'admin', 'service.unit', 'Unit Distance Price', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(828, 0, 'en', 'admin', 'service.Seat_Capacity', 'Seat Capacity', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(829, 0, 'en', 'admin', 'service.Pricing_Logic', 'Pricing Logic', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(830, 0, 'en', 'admin', 'service.Description', 'Description', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(831, 0, 'en', 'admin', 'service.Update_User', 'Update User', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(832, 0, 'en', 'admin', 'service.Update_Service_Type', 'Update Service Type', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(833, 0, 'en', 'admin', 'setting.Site_Settings', 'Site Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(834, 0, 'en', 'admin', 'setting.Site_Name', 'Site Name', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(835, 0, 'en', 'admin', 'setting.Site_Logo', 'Site Logo', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(836, 0, 'en', 'admin', 'setting.Site_Icon', 'Site Icon', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(837, 0, 'en', 'admin', 'setting.Copyright_Content', 'Copyright Content', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(838, 0, 'en', 'admin', 'setting.Playstore_link', 'Playstore link', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(839, 0, 'en', 'admin', 'setting.Appstore_Link', 'Appstore Link', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(840, 0, 'en', 'admin', 'setting.Provider_Accept_Timeout', 'Provider Accept Timeout', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(841, 0, 'en', 'admin', 'setting.Provider_Search_Radius', 'Provider Search Radius', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(842, 0, 'en', 'admin', 'setting.SOS_Number', 'SOS Number', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(843, 0, 'en', 'admin', 'setting.Contact_Number', 'Contact Number', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(844, 0, 'en', 'admin', 'setting.Contact_Email', 'Contact Email', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(845, 0, 'en', 'admin', 'setting.Social_Login', 'Social Login', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(846, 0, 'en', 'admin', 'setting.Update_Site_Settings', 'Update Site Settings', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(847, 0, 'en', 'admin', 'setting.map_key', 'Google Map Key', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(848, 0, 'en', 'admin', 'setting.fb_app_version', 'FB App Version', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(849, 0, 'en', 'admin', 'setting.fb_app_id', 'FB App ID', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(850, 0, 'en', 'admin', 'setting.fb_app_secret', 'FB App Secret', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(851, 0, 'en', 'admin', 'users.Add_User', 'Add User', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(852, 0, 'en', 'admin', 'users.Update_User', 'Update User', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(853, 0, 'en', 'admin', 'users.Users', 'Users', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(854, 0, 'en', 'admin', 'users.Rating', 'Rating', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(855, 0, 'en', 'admin', 'users.Wallet_Amount', 'Wallet Amount', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(856, 0, 'en', 'admin', 'users.User_Details', 'User Details', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(857, 0, 'en', 'admin', 'users.Wallet_Balance', 'Wallet Balance', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(858, 1, 'en', 'admin', 'dashboard.Rides', 'Total Cancelled Rides', '2020-02-20 23:35:10', '2020-03-07 18:25:03'),
(859, 0, 'en', 'admin', 'dashboard.Revenue', 'Revenue', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(860, 0, 'en', 'admin', 'dashboard.service', 'No. of Service Types', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(861, 0, 'en', 'admin', 'dashboard.cancel_count', 'User Cancelled Count', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(862, 0, 'en', 'admin', 'dashboard.provider_cancel_count', 'Provider Cancelled Count', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(863, 0, 'en', 'admin', 'dashboard.fleets', 'No. of Fleets', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(864, 0, 'en', 'admin', 'dashboard.scheduled', 'No. of Scheduled Rides', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(865, 0, 'en', 'admin', 'dashboard.Recent_Rides', 'Recent Rides', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(866, 0, 'en', 'admin', 'dashboard.View_Ride_Details', 'View Ride Details', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(867, 0, 'en', 'admin', 'dashboard.No_Details_Found', 'No Details Found', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(868, 0, 'en', 'admin', 'heatmap.Ride_Heatmap', 'Ride Heatmap', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(869, 0, 'en', 'admin', 'push.Push_Notification', 'Push Notification', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(870, 0, 'en', 'admin', 'push.Sent_to', 'Sent to', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(871, 0, 'en', 'admin', 'push.Push_Now', 'Push Now', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(872, 0, 'en', 'admin', 'push.Schedule_Push', 'Schedule Push', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(873, 0, 'en', 'admin', 'push.Condition', 'Condition', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(874, 0, 'en', 'admin', 'push.Notification_History', 'Notification History', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(875, 0, 'en', 'admin', 'push.Sent_on', 'Sent on', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(876, 0, 'en', 'api', 'user.incorrect_password', 'Incorrect Password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(877, 0, 'en', 'api', 'user.change_password', 'Required is new password should \nnot be same as old password', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(878, 0, 'en', 'api', 'user.password_updated', 'Password Updated', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(879, 0, 'en', 'api', 'user.location_updated', 'Location Updated', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(880, 0, 'en', 'api', 'user.profile_updated', 'Profile Updated', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(881, 0, 'en', 'api', 'user.user_not_found', 'User Not Found', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(882, 0, 'en', 'api', 'user.not_paid', 'User Not Paid', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(883, 0, 'en', 'api', 'ride.request_inprogress', 'Already Request in Progress', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(884, 0, 'en', 'api', 'ride.no_providers_found', 'No Drivers Found', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(885, 0, 'en', 'api', 'ride.request_cancelled', 'Your Ride Cancelled', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(886, 0, 'en', 'api', 'ride.already_cancelled', 'Already Ride Cancelled', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(887, 0, 'en', 'api', 'ride.already_onride', 'Already You are Onride', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(888, 0, 'en', 'api', 'ride.provider_rated', 'Driver Rated', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(889, 0, 'en', 'api', 'ride.request_scheduled', 'Ride Scheduled', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(890, 0, 'en', 'api', 'ride.request_already_scheduled', 'Ride Already Scheduled', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(891, 0, 'en', 'api', 'ride.request_modify_location', 'User Changed Destination Address', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(892, 0, 'en', 'api', 'something_went_wrong', 'Something Went Wrong', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(893, 0, 'en', 'api', 'logout_success', 'Logged out Successfully', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(894, 0, 'en', 'api', 'email_available', 'Email Available', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(895, 0, 'en', 'api', 'services_not_found', 'Services Not Found', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(896, 0, 'en', 'api', 'promocode_applied', 'Promocode Applied', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(897, 0, 'en', 'api', 'promocode_expired', 'Promocode Expired', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(898, 0, 'en', 'api', 'promocode_already_in_use', 'Promocode Already in Use', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(899, 0, 'en', 'api', 'paid', 'Paid', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(900, 0, 'en', 'api', 'added_to_your_wallet', 'Added to your Wallet', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(901, 0, 'en', 'api', 'push.request_accepted', 'Your Ride Accepted by a Driver', '2020-02-20 23:35:10', '2020-03-01 20:44:23');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(902, 0, 'en', 'api', 'push.arrived', 'Driver Arrived at your Location', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(903, 0, 'en', 'api', 'push.dropped', 'Your ride is completed successfully. you have to pay', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(904, 0, 'en', 'api', 'push.incoming_request', 'New Incoming Ride', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(905, 0, 'en', 'api', 'push.added_money_to_wallet', ' Added to your Wallet', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(906, 0, 'en', 'api', 'push.charged_from_wallet', ' Charged from your Wallet', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(907, 0, 'en', 'api', 'push.document_verfied', 'Your Documents are verified, Now you are ready to Start your Business', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(908, 0, 'en', 'api', 'push.provider_not_available', 'Sorry for inconvience time, Our partner or busy. Please try after some time', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(909, 0, 'en', 'api', 'push.user_cancelled', 'User Cancelled the Ride', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(910, 0, 'en', 'api', 'push.provider_cancelled', 'Driver Cancelled the Ride', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(911, 0, 'en', 'api', 'push.schedule_start', 'Your schedule ride has been started', '2020-02-20 23:35:10', '2020-03-01 20:44:23'),
(912, 0, 'en', 'api', 'ride.ride_cancelled', NULL, '2020-02-20 23:35:19', '2020-02-20 23:35:19'),
(913, 0, 'en', 'user', 'k', NULL, '2020-03-09 21:32:15', '2020-03-09 21:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2015_08_25_172600_create_settings_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2017_01_11_180503_create_admins_table', 1),
(11, '2017_01_11_180511_create_providers_table', 1),
(12, '2017_01_11_181312_create_cards_table', 1),
(13, '2017_01_11_181357_create_chats_table', 1),
(14, '2017_01_11_181558_create_promocodes_table', 1),
(15, '2017_01_11_182454_create_provider_documents_table', 1),
(16, '2017_01_11_182536_create_provider_services_table', 1),
(17, '2017_01_11_182649_create_user_requests_table', 1),
(18, '2017_01_11_182717_create_request_filters_table', 1),
(19, '2017_01_11_182738_create_service_types_table', 1),
(20, '2017_01_25_172422_create_documents_table', 1),
(21, '2017_01_31_122021_create_provider_devices_table', 1),
(22, '2017_02_02_192703_create_user_request_ratings_table', 1),
(23, '2017_02_06_080124_create_user_request_payments_table', 1),
(24, '2017_02_14_135859_create_provider_profiles_table', 1),
(25, '2017_02_21_131429_create_promocode_usages_table', 1),
(26, '2017_06_07_045207_add_social_login_to_providers_tables', 1),
(27, '2017_06_17_151030_create_dispatchers_table', 1),
(28, '2017_06_17_151031_create_dispatcher_password_resets_table', 1),
(29, '2017_06_17_151145_create_fleets_table', 1),
(30, '2017_06_17_151146_create_fleet_password_resets_table', 1),
(31, '2017_06_17_151150_add_fleet_to_providers_table', 1),
(32, '2017_06_19_130022_add_booking_id_to_user_request', 1),
(33, '2017_06_19_155736_add_cancel_reason_to_user_request', 1),
(34, '2017_06_20_154148_create_accounts_table', 1),
(35, '2017_06_20_154149_create_account_password_resets_table', 1),
(36, '2017_08_03_194354_create_custom_pushes_table', 1),
(37, '2017_09_01_190333_create_wallet_passbooks_table', 1),
(38, '2017_09_01_190355_create_promocode_passbooks_table', 1),
(39, '2017_09_15_145235_add_travel_tracking_distance_to_user_requests_table', 1),
(40, '2017_09_15_152718_add_provider_payments_to_user_request_payments_table', 1),
(41, '2017_09_19_104042_add_genders_to_providers_table', 1),
(42, '2017_09_19_104042_add_genders_to_users_table', 1),
(43, '2017_09_26_144027_add_travel_time_to_user_requests_table', 1),
(44, '2017_09_26_160101_create_favourite_locations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('d5a7c3cfc01401826388f27cc0751e65f23ae5bb112f29f46f733d5934fb497b73afa8a2c7d56d7e', 111, 2, NULL, '[]', 0, '2019-10-04 10:10:23', '2019-10-04 10:10:23', '2019-10-19 10:10:23'),
('c3f2cf468015f7504a6992c1b35bba20009f3e37fbece4fa637ba0cbde7143aac7a004709e5ffdde', 111, 2, NULL, '[]', 1, '2019-10-04 10:15:33', '2019-10-04 10:15:33', '2019-10-19 10:15:33'),
('2ad4b028581865733ff11423371c97bcf174045c62b315fa2170d6c329442dcd4218180f6b434920', 111, 2, NULL, '[]', 1, '2019-10-04 14:33:42', '2019-10-04 14:33:42', '2019-10-19 14:33:42'),
('6bef2bb28dd86e766400b4683d090c24d2aaa0a5689f90f0d635c4fb85dfa1b599842c6ec170e0d0', 111, 2, NULL, '[]', 1, '2019-10-04 14:33:44', '2019-10-04 14:33:44', '2019-10-19 14:33:44'),
('2c03e95c2fc6d10cda0f72094a9c7ce7f685ce1a1d70f545d6e7fcaeba914aa37fd6570fae49d8f8', 111, 2, NULL, '[]', 1, '2019-10-04 14:33:47', '2019-10-04 14:33:47', '2019-10-19 14:33:47'),
('17baa68540ab0d8d41ccc0f9c01da125c5437038881713b706b70699022c848f3e6124d28b09d1ba', 111, 2, NULL, '[]', 0, '2019-10-04 14:33:50', '2019-10-04 14:33:50', '2019-10-19 14:33:50'),
('9aa6c2321b59f5288ca058dfd28e1a887d271d945e35104963e5098051b3bdcd91f78e8248b79edc', 112, 2, NULL, '[]', 0, '2019-10-07 01:02:18', '2019-10-07 01:02:18', '2019-10-22 01:02:18'),
('86c39eb95321c4e37b6ad62ea826b2ec5e2eac53c13f02593170540f272294c05f4b13118750776c', 112, 2, NULL, '[]', 0, '2019-10-07 10:54:14', '2019-10-07 10:54:14', '2019-10-22 10:54:14'),
('263cb2bbeaafd3dfefb32c81276c70d9966c62e3789c88012a6ced0b392d35d303fd471653e1a5d3', 112, 2, NULL, '[]', 0, '2019-10-07 12:05:38', '2019-10-07 12:05:38', '2019-10-22 12:05:38'),
('830ca5d719ff17f5de500797f738ff63a83d40fffcb757cb7ba37b6374fc3981e458b6fcd15a33ff', 112, 2, NULL, '[]', 0, '2019-10-07 18:35:43', '2019-10-07 18:35:43', '2019-10-22 18:35:43'),
('9ae284d732c9e13599fcca34d30278df59df1f936a1d166090da11d101072e1b69cbb5119d8797b8', 112, 2, NULL, '[]', 0, '2019-10-07 18:45:55', '2019-10-07 18:45:55', '2019-10-22 18:45:55'),
('653276d5b135248fe6bb01e2f3b9ccb32a7ebe1b502802511850445eaad0de60f87d8055490fb38f', 112, 2, NULL, '[]', 0, '2019-10-07 19:58:02', '2019-10-07 19:58:02', '2019-10-22 19:58:02'),
('465c99a5b7c2556124122399bc80e5608acf7e4e63531d5617e6e676f08a2a04b0941f793a44a90d', 113, 2, NULL, '[]', 0, '2019-10-07 22:45:36', '2019-10-07 22:45:36', '2019-10-22 22:45:36'),
('59d748b20ab6930e5514edb20ba87d5cb6de34439c03196e57a385573eb7363c923aec79e555a440', 113, 2, NULL, '[]', 1, '2019-10-08 17:34:51', '2019-10-08 17:34:51', '2019-10-23 17:34:51'),
('995bd9a445b639da8ecc5c8d7689e9049339ae9dd3068a247c09854224da6bebdc6d029d3dd17e66', 113, 2, NULL, '[]', 1, '2019-10-08 17:34:52', '2019-10-08 17:34:52', '2019-10-23 17:34:52'),
('0a0b98ae83a78c0e0f5d68733f36bfc871708de1747d3c25a2a4b5a70fa59aba6181bc53e4dd3a35', 113, 2, NULL, '[]', 0, '2019-10-08 17:34:55', '2019-10-08 17:34:55', '2019-10-23 17:34:55'),
('fe524d320e72c8c77db50d68211d4924001fd23c4c10954754435df434adced79c05026aa89a0cb3', 114, 2, NULL, '[]', 0, '2019-10-08 20:22:09', '2019-10-08 20:22:09', '2019-10-23 20:22:09'),
('38d5ccb44754bcc3e668e90bddce71517aba6f7b7c5339a884210835ef3becb485f6f29539f93de6', 114, 2, NULL, '[]', 0, '2019-10-08 20:12:50', '2019-10-08 20:12:50', '2019-10-23 20:12:50'),
('285e10b115710ad713e5bae85fa9642062507c4e32f1df9bd53d823cacb502c0e938824973b9df9b', 114, 2, NULL, '[]', 0, '2019-10-08 20:45:49', '2019-10-08 20:45:49', '2019-10-23 20:45:48'),
('d1ddb89d1a5628a870ded8b44f9036513fcfb2c12242d039b71a4a64705bd9fd5bd0325af432cec8', 115, 2, NULL, '[]', 0, '2019-10-21 18:44:04', '2019-10-21 18:44:04', '2019-11-05 21:44:04'),
('307cde093d81d2b33600baedc4839784f288d8b9e0d2e1f75512b6aad5463adf274633d523fdce90', 116, 2, NULL, '[]', 0, '2019-10-22 13:28:37', '2019-10-22 13:28:37', '2019-11-06 16:28:37'),
('fb43638b0a6d543632f58142c9a623971e6a3d16b3a672ed0eea1d7a84d894b8ef9f76e08f51233b', 117, 2, NULL, '[]', 1, '2019-10-22 13:48:16', '2019-10-22 13:48:16', '2019-11-06 16:48:16'),
('ed82eaa0059f84b5bc219607449c69643e39413040d5dc1c32545c32452aa35e5ca0f4eef078c8fe', 119, 2, NULL, '[]', 0, '2019-10-22 15:02:41', '2019-10-22 15:02:41', '2019-11-06 18:02:41'),
('35410425dde652af7070ca8bb887d9fc20bacc011d6257d39d494a83d941310736c797a35f0f4a1e', 115, 2, NULL, '[]', 0, '2019-10-27 10:40:14', '2019-10-27 10:40:14', '2019-11-11 12:40:14'),
('08013cc68991f6a733d3ce5112318fac51e82377dcf8757dd634e2f5349369738a6cf05d37919cac', 1660, 2, NULL, '[]', 0, '2019-10-28 06:39:51', '2019-10-28 06:39:51', '2019-11-12 08:39:51'),
('f9c1f32970041bd6cf011544151614f25c116238e82b85e3232e5baf7da811bde619cf738333adb1', 1870, 2, NULL, '[]', 0, '2019-10-28 06:46:49', '2019-10-28 06:46:49', '2019-11-12 08:46:49'),
('ab18526e470e6d94bad5d1a11fde0b4316166d8a2706e5b1e10c905326e5616907ae4637abace96d', 1871, 2, NULL, '[]', 0, '2019-10-28 09:08:22', '2019-10-28 09:08:22', '2019-11-12 11:08:22'),
('da4a7bfaf55d7b9dcc3e9edafb29c15205ae65efdb3f8cbc6dce49bffb632766405900aac08484c3', 1872, 2, NULL, '[]', 0, '2019-10-28 12:05:40', '2019-10-28 12:05:40', '2019-11-12 14:05:40'),
('4d7a6d1aca76743a38c0122ac3a3e43219b51b46eff7eec954455a1646aa821bd4138ffb974bdc40', 1873, 2, NULL, '[]', 0, '2019-10-28 14:07:30', '2019-10-28 14:07:30', '2019-11-12 16:07:30'),
('54d0ba0cf268e4b305ee4ca28b5698f06bc227913a31e47019d9a99540712ef3b4728e1dfe282ec1', 1874, 2, NULL, '[]', 0, '2019-10-28 15:14:59', '2019-10-28 15:14:59', '2019-11-12 17:14:59'),
('fe2e2fd4dbe7c1cbfe07480a9d190023f8b54faf04dd6a650918b93251e21aa8ecad75ac2817985f', 1875, 2, NULL, '[]', 0, '2019-10-28 15:57:58', '2019-10-28 15:57:58', '2019-11-12 17:57:58'),
('91e2de2bb3ba1c2f0863da91ca2296e735bc00b91aa33d001c223ab529971007c1704044e84f7610', 1876, 2, NULL, '[]', 0, '2019-10-28 16:17:27', '2019-10-28 16:17:27', '2019-11-12 18:17:27'),
('44be47e83a844794dad48d7788d7df41319f01b3ff0c080f51b8b4b613ede82389575fc600451ba8', 1877, 2, NULL, '[]', 0, '2019-10-28 19:20:41', '2019-10-28 19:20:41', '2019-11-12 21:20:41'),
('62f2ba7005598195c2a41dd68c492e937c3ef2e7e319839f0c0b6bf7afea4181c7bf923c570a9dde', 1878, 2, NULL, '[]', 0, '2019-10-28 19:29:14', '2019-10-28 19:29:14', '2019-11-12 21:29:14'),
('4c902eb4a109433530924f98a0eceba62bbc784a932143256a5c5a5fe8c740b87c14a662ee18e2df', 1879, 2, NULL, '[]', 0, '2019-10-28 19:36:37', '2019-10-28 19:36:37', '2019-11-12 21:36:37'),
('f3a1f59c40195ff9227f5e6f3726e96cc3a2fa604a7ad5aed83373b6d0657a3cd78514f312e233f0', 1880, 2, NULL, '[]', 0, '2019-10-28 21:07:57', '2019-10-28 21:07:57', '2019-11-12 23:07:56'),
('5dca1a54fd2837679753fe98775cb93dff756fb3a235736a3fb4a8427d17e139a4a13fadb01e63e1', 1881, 2, NULL, '[]', 0, '2019-10-28 21:08:22', '2019-10-28 21:08:22', '2019-11-12 23:08:22'),
('dac5ab21b6cec80eb323a6eebac500ccebf5045e1f80f206609a38360e181da33f4b7c293d304b8a', 1882, 2, NULL, '[]', 0, '2019-10-29 06:55:36', '2019-10-29 06:55:36', '2019-11-13 08:55:36'),
('053b7c5a39acf5e3959147cdf8b4a6c0f98a2f5bfc622bbbef121ea963ac9ab119bd113822e72ef8', 1167, 2, NULL, '[]', 0, '2019-10-29 07:02:21', '2019-10-29 07:02:21', '2019-11-13 09:02:21'),
('6050e686fad583525b3ee801b5b562cf4bc159bfc5c3d89750695b9835824c92e3910027beafb5e2', 1883, 2, NULL, '[]', 0, '2019-10-29 08:03:00', '2019-10-29 08:03:00', '2019-11-13 10:03:00'),
('5431c6d777984e787182ea95c9746a63061ad53b845395c7d5802b003f2d721e7098ba2c719aa3fb', 1884, 2, NULL, '[]', 0, '2019-10-29 08:42:33', '2019-10-29 08:42:33', '2019-11-13 10:42:33'),
('cff49dfd2dccc3332a568b6f4d75d73281cec03a7043149066af552fa8ca1bdfabfb9ea8f4e1f28c', 1885, 2, NULL, '[]', 0, '2019-10-29 11:32:41', '2019-10-29 11:32:41', '2019-11-13 13:32:41'),
('aedde3c24d422f6ac41a94d11b3ed25648e0a87a051c6ef21932c67d53c2f9a477f90741abd783b5', 1886, 2, NULL, '[]', 0, '2019-10-29 11:36:23', '2019-10-29 11:36:23', '2019-11-13 13:36:23'),
('3851602ff0eda58715e1318b9a8c1ffc9987a7bfb7e1b392b1b423208ebf69f51878b3d7704d8bbf', 1887, 2, NULL, '[]', 0, '2019-10-29 11:44:58', '2019-10-29 11:44:58', '2019-11-13 13:44:58'),
('6ff5c5fac7a1bb71e97f8a964bb003b5be2529a55237730ee6af6288de99dda0e992d00b96f654e9', 615, 2, NULL, '[]', 0, '2019-10-29 13:01:20', '2019-10-29 13:01:20', '2019-11-13 15:01:20'),
('e193858bdca7bd4c571d62718b07b7d5adb7841c3cd811d951e242f6cb954e000607804bdcce22b9', 1888, 2, NULL, '[]', 0, '2019-10-29 13:02:55', '2019-10-29 13:02:55', '2019-11-13 15:02:55'),
('8423c446bd1f56f4673b80d5daf42df7e0e610baed2718cae8315355014f5be9953de278e12c23c5', 1888, 2, NULL, '[]', 0, '2019-10-29 13:02:57', '2019-10-29 13:02:57', '2019-11-13 15:02:57'),
('19d293c1c8913b1f1f53f5bc4c5a8712222498c39167a94a756de28281e7a00bd80faca22e6b79aa', 1889, 2, NULL, '[]', 0, '2019-10-29 14:22:19', '2019-10-29 14:22:19', '2019-11-13 16:22:19'),
('d66506a0c035ccef98f027c59663efbc09c069f6d48fe80c8b40e4fa468248321b05028b862be1cc', 1890, 2, NULL, '[]', 0, '2019-10-29 14:35:04', '2019-10-29 14:35:04', '2019-11-13 16:35:04'),
('7c53b23be9f72d758a384c75f79fdd87fe543e0d6cde5a15a67a06cb5a88870b2b7e85e99e7dfea1', 1891, 2, NULL, '[]', 0, '2019-10-29 19:10:09', '2019-10-29 19:10:09', '2019-11-13 21:10:09'),
('dc4457c155da484af68053c4c00dde9f1621ce02a64d3e2e5e52e81891cf3abd71743326088f4761', 1892, 2, NULL, '[]', 0, '2019-10-29 19:36:19', '2019-10-29 19:36:19', '2019-11-13 21:36:19'),
('99871151073d28c0fd865316f5d2bba0153094b0a0d8fbcc43833571bb9583ac6cf61db3d22572c7', 1893, 2, NULL, '[]', 0, '2019-10-29 23:00:00', '2019-10-29 23:00:00', '2019-11-14 01:00:00'),
('288076c11415ed9f56b90ba245037853d4ca2a1914cc26172ad718d32e3ed86d9b1cd1423a6d3184', 1894, 2, NULL, '[]', 0, '2019-10-30 05:52:32', '2019-10-30 05:52:32', '2019-11-14 07:52:32'),
('5e4de355e16d604f7eabf5f955cc65d189b57f3eff7e472ca97134e75abac686860d36ec4b10c395', 1895, 2, NULL, '[]', 0, '2019-10-30 06:43:02', '2019-10-30 06:43:02', '2019-11-14 08:43:02'),
('daac5bf68468cba342a91a6f8ddf1fc3df8126faf74196fc4d32c437d385ffb1a9c5f917cffff081', 1896, 2, NULL, '[]', 0, '2019-10-30 07:49:11', '2019-10-30 07:49:11', '2019-11-14 09:49:10'),
('87e5ef87a97ac539fea44cfb31ff392762901b5b8d19262a593725e58243c194f7d6ec191aa76bec', 1897, 2, NULL, '[]', 0, '2019-10-30 08:57:29', '2019-10-30 08:57:29', '2019-11-14 10:57:29'),
('d2674af1979e3c27f83fe7270e87ddb2bc3a907291c32adec799dc25df0ec09f4d3811d7afd9f20a', 1898, 2, NULL, '[]', 0, '2019-10-30 09:23:59', '2019-10-30 09:23:59', '2019-11-14 11:23:59'),
('fae6c9f60d187f77f6109d593648a31e8085c688218151ebb7d8c56d56194969cf92960195ac9d25', 1899, 2, NULL, '[]', 0, '2019-10-30 09:31:37', '2019-10-30 09:31:37', '2019-11-14 11:31:37'),
('7bd542c7980a1c65b572d0704ee6411b29f8a8de30f079cdc8f86d012f7ad091773941ef6882907c', 183, 2, NULL, '[]', 1, '2019-10-30 09:36:15', '2019-10-30 09:36:15', '2019-11-14 11:36:15'),
('66d8f3aca00e0b80d236b7444710aaa919fbcda0bf946b1c80f49f25ab6f6ec69e3d24ffc7f6dbfa', 1900, 2, NULL, '[]', 0, '2019-10-30 09:56:58', '2019-10-30 09:56:58', '2019-11-14 11:56:58'),
('c57dfed7e8de84f92037cf41653408315fa6131b0e6101a8843dc60a932b3a3554885b90ca243edf', 1901, 2, NULL, '[]', 0, '2019-10-30 10:12:37', '2019-10-30 10:12:37', '2019-11-14 12:12:37'),
('43d96c5ffc24d672866708aac56e081e2c356a73151a2f5904be2ac40dd3929fb71c85092ae78b63', 1902, 2, NULL, '[]', 0, '2019-10-30 10:18:57', '2019-10-30 10:18:57', '2019-11-14 12:18:57'),
('74ab2a6de01000492694c171685cc6c5b83cc2032137a6117cdccefaf7e87208ef38bbec8cfd9393', 1903, 2, NULL, '[]', 0, '2019-10-30 12:21:48', '2019-10-30 12:21:48', '2019-11-14 14:21:48'),
('384d3a1080c566e284d24cdbbdddbd55025b51a199ed6bc205ab30607f3aedfbf7e1fe8bdc047944', 1904, 2, NULL, '[]', 0, '2019-10-30 13:17:05', '2019-10-30 13:17:05', '2019-11-14 15:17:05'),
('4f4031bb6f51c3b15067727f4a6dd4f0ffcae7dea1049892385effa210140376dc888f43afdcb63d', 1905, 2, NULL, '[]', 0, '2019-10-30 14:22:02', '2019-10-30 14:22:02', '2019-11-14 16:22:02'),
('c40db50e4dcacb0b39f9117c0e2e3fca0acb394839a56db8cc0811eb142c269aa05e17847668f3f2', 1906, 2, NULL, '[]', 0, '2019-10-30 15:29:40', '2019-10-30 15:29:40', '2019-11-14 17:29:40'),
('1670c120cab0b51a79e43a01c402c86f00869f2faf548a1224a86f5c98afb8fe28fe50d892211015', 1660, 2, NULL, '[]', 1, '2019-10-30 15:30:40', '2019-10-30 15:30:40', '2019-11-14 17:30:40'),
('29937c9d4b14198ecea7a3437ff618a74cc76c3d6c00afabee58a08c34d93ceba568e29a7eaf5a7b', 1660, 2, NULL, '[]', 1, '2019-10-30 15:32:57', '2019-10-30 15:32:57', '2019-11-14 17:32:57'),
('8f0fc53f278481c305c540ea1c8f1b72ba1bf45acc88acc3c0123748302f830d8c86b5b010a9ca52', 1660, 2, NULL, '[]', 1, '2019-10-30 15:33:01', '2019-10-30 15:33:01', '2019-11-14 17:33:01'),
('d122294279330c8affea8804dc7903ebbf29ae0f3fa81cdc01cc0d1d679cffa99434a34517d389bf', 1660, 2, NULL, '[]', 1, '2019-10-30 15:33:05', '2019-10-30 15:33:05', '2019-11-14 17:33:05'),
('664b8253cc3962af42e692a1f0cb9888ba677815cd2927afdf8181db1bbef8c6ecf2594f68c2d597', 1660, 2, NULL, '[]', 1, '2019-10-30 15:33:08', '2019-10-30 15:33:08', '2019-11-14 17:33:08'),
('bad7099ef513518f80d5849a7304787f0a58e1ff7a429a33df167a93b821b15ba2e5b8d7d37f4211', 1660, 2, NULL, '[]', 0, '2019-10-30 15:33:11', '2019-10-30 15:33:11', '2019-11-14 17:33:11'),
('7317ed2226115d16c40d6d146d9ba03a1d487abfbc7fb7d82d1b83c1ae8b5b7ed917ab1bf95f7415', 1907, 2, NULL, '[]', 0, '2019-10-30 15:33:57', '2019-10-30 15:33:57', '2019-11-14 17:33:57'),
('375cba8e521982157f6b5c6fda5b8610343c67a02a0e8cdddd23440d3e473cbdbd7d452fc89ded32', 1908, 2, NULL, '[]', 0, '2019-10-30 16:04:18', '2019-10-30 16:04:18', '2019-11-14 18:04:18'),
('6437a09ba03f8c223ae7bf2d62163504071eee9ba09d3f1e960eec809df25721c385f7a5a3040d87', 1907, 2, NULL, '[]', 0, '2019-10-30 16:21:05', '2019-10-30 16:21:05', '2019-11-14 18:21:05'),
('10ad577f6559a07129e06c72acf0f8d36bec5a57a358e9246bad9f4ef5efb531af1e870661366f70', 1909, 2, NULL, '[]', 0, '2019-10-30 16:22:32', '2019-10-30 16:22:32', '2019-11-14 18:22:32'),
('def272dac66ea75b87178b941a4a3b6326b6fe161ad8fb202cccda7f00b954bdcfb6bb59fe520dcf', 1910, 2, NULL, '[]', 0, '2019-10-30 16:54:37', '2019-10-30 16:54:37', '2019-11-14 18:54:36'),
('fc53768e4e8da6d1fbe7d1ba4f55949743ab164cf29708af7208d39baa086e06712d8da96723441b', 1911, 2, NULL, '[]', 0, '2019-10-30 18:14:53', '2019-10-30 18:14:53', '2019-11-14 20:14:53'),
('3276657b1e795a22d5e12bf04f2438e00ab3e7cc3e800e0859904a06048eb7639fc92adea9b4f3de', 1912, 2, NULL, '[]', 0, '2019-10-30 19:04:50', '2019-10-30 19:04:50', '2019-11-14 21:04:50'),
('3c0157b6c0a446936a3229167b609f41bfafa2e26b53a593e6e6b280a32a2a31dda3623e0ba30575', 1913, 2, NULL, '[]', 0, '2019-10-30 19:40:31', '2019-10-30 19:40:31', '2019-11-14 21:40:31'),
('9b181d41f576452ceba8aa64e50e295f1349806c03af185abe643cb1a33cf6aad240e299bf9cfbb6', 1914, 2, NULL, '[]', 0, '2019-10-30 20:51:19', '2019-10-30 20:51:19', '2019-11-14 22:51:19'),
('743e62aa75160fe67a0958d7018ef4e8a1dd390ec81ca819d23ab7217d263be9573c64b02ae6f724', 1915, 2, NULL, '[]', 0, '2019-10-30 21:54:43', '2019-10-30 21:54:43', '2019-11-14 23:54:43'),
('fe14a3ebf005130e684957afbc2e25252116c5d0cd738413779b642c72c26c239127d4c9075c4139', 1916, 2, NULL, '[]', 0, '2019-10-31 03:07:55', '2019-10-31 03:07:55', '2019-11-15 05:07:54'),
('d2fa886a787026c4b7d42e61be7e707303dfa6c6323dc918e9b57da35ddab50ea8744917f7223c68', 1917, 2, NULL, '[]', 0, '2019-10-31 05:02:39', '2019-10-31 05:02:39', '2019-11-15 07:02:39'),
('48e4e7aa8e71e71b7f997cc6c8b7cea1f1e2c8dcee1c6b6bd2ff289b30e5cc7885c798ba5c5fe2ea', 1918, 2, NULL, '[]', 0, '2019-10-31 07:42:01', '2019-10-31 07:42:01', '2019-11-15 09:42:00'),
('c304ae59dbb95f6efb81d5f5c90f2b9cdae15be2af0cb7018ce043483a7270b85c37eb1e62ca3ab1', 1919, 2, NULL, '[]', 0, '2019-10-31 08:29:23', '2019-10-31 08:29:23', '2019-11-15 10:29:23'),
('88d58321fa3300c6335b417e6f38a951b108e5752012e5d5f62f6352c6ffc520a6f5481b9c9cba88', 1920, 2, NULL, '[]', 0, '2019-10-31 09:03:56', '2019-10-31 09:03:56', '2019-11-15 11:03:56'),
('c7677fe31bee77c567cd084bfe22f60279793e59dd81a1ee5b3d7e5537888353e0f15690da128fb5', 1921, 2, NULL, '[]', 0, '2019-10-31 10:40:04', '2019-10-31 10:40:04', '2019-11-15 12:40:04'),
('52d6fa5651a9523d7617972f6ce326d8be10494a3673d713f52b33eba8649755decfd5a4f00b17d3', 1922, 2, NULL, '[]', 0, '2019-10-31 11:31:58', '2019-10-31 11:31:58', '2019-11-15 13:31:58'),
('df8888695d697eaebe9bf987df2fbd93b7a4f4d2b3dc499241086263f39492afe465adfe755f66b7', 1923, 2, NULL, '[]', 0, '2019-10-31 11:38:49', '2019-10-31 11:38:49', '2019-11-15 13:38:49'),
('1a04bb240f4adf7fd59a1d0ec044136f7c5353c98a24dfb7fcf8cdd7982529c7caaac6f7bc4079ab', 1924, 2, NULL, '[]', 0, '2019-10-31 11:59:22', '2019-10-31 11:59:22', '2019-11-15 13:59:22'),
('738f5c8f997d0d2093b5f4c3c67e3ad8037dd19caf616f2468a5e066823c9f333c9b8922af32878a', 1925, 2, NULL, '[]', 0, '2019-10-31 12:01:28', '2019-10-31 12:01:28', '2019-11-15 14:01:28'),
('7b6429db19d8cd641df130603c4027158ab7f746984929d7f9c600e130d2f63f48406a9fa1dfd2a7', 1926, 2, NULL, '[]', 0, '2019-10-31 12:09:32', '2019-10-31 12:09:32', '2019-11-15 14:09:32'),
('14c0cb89a787df35fa5e8a51b9a1a3cee16b1930d8564a301520afb22a8674507028a5016450a772', 1927, 2, NULL, '[]', 0, '2019-10-31 12:10:57', '2019-10-31 12:10:57', '2019-11-15 14:10:57'),
('19b28a12ac7785fa77018ff7b0c71caabc6e7b6ea93022399097f47d11677df119342b67870be068', 1928, 2, NULL, '[]', 0, '2019-10-31 12:20:04', '2019-10-31 12:20:04', '2019-11-15 14:20:04'),
('f675832364ffc4279509b29f0eeed5cbbc0f7c892a315094672c865be61febaaf7456f1af7f5ad7e', 1929, 2, NULL, '[]', 0, '2019-10-31 13:20:21', '2019-10-31 13:20:21', '2019-11-15 15:20:21'),
('9b7ffba88440856aeaa8c3eb7db9f04070f3695e4a582ed05bffeaf1a8f07630636f5f8b8bc6db71', 842, 2, NULL, '[]', 0, '2019-10-31 13:47:10', '2019-10-31 13:47:10', '2019-11-15 15:47:10'),
('896ba6dabf46bf392c249a2bcc3fb09536b1aeb9e3e23dde262682ccc5aaf4d0539696889c7ce620', 1930, 2, NULL, '[]', 0, '2019-10-31 15:55:50', '2019-10-31 15:55:50', '2019-11-15 17:55:49'),
('7dc8f7ef66625ac4f9cb6f5daf27ce1d8b65250396f63b94ecc6e789687e84597ade21f264b429bc', 1931, 2, NULL, '[]', 0, '2019-10-31 16:11:08', '2019-10-31 16:11:08', '2019-11-15 18:11:08'),
('93d361510f5b6cb954e2710a763b31b370912947f6189a4b9b1666c432374f9fb1316c4446b760d3', 1932, 2, NULL, '[]', 0, '2019-10-31 18:09:22', '2019-10-31 18:09:22', '2019-11-15 20:09:22'),
('faac24e354ede450d77375783369fce3782c4f09a5a0a03871104eadc0eb142b44a2c228d7cfa983', 1933, 2, NULL, '[]', 0, '2019-10-31 18:32:34', '2019-10-31 18:32:34', '2019-11-15 20:32:33'),
('3c8397c0020b941366a3ea2b9dccd995b35f945ad991824fb3108cbc279c2e8c3727547a818a809a', 1934, 2, NULL, '[]', 0, '2019-10-31 19:25:39', '2019-10-31 19:25:39', '2019-11-15 21:25:39'),
('3087d7e044f11d344e7658f934dd81c16100a36392c32424f8c55db1575578e8efc7592351c1e559', 1935, 2, NULL, '[]', 0, '2019-10-31 19:27:54', '2019-10-31 19:27:54', '2019-11-15 21:27:54'),
('0aae13b301e0daeb9ab105c06689469b6926add19e7f7ef2ea2feb47bd81445d4539e084e003869c', 1936, 2, NULL, '[]', 0, '2019-10-31 19:44:50', '2019-10-31 19:44:50', '2019-11-15 21:44:50'),
('96499f4ac47dc832f737450f22e07ee62704cad8e2a0170d1fe2e7883736d389bbdc6eaa0b425d10', 1937, 2, NULL, '[]', 0, '2019-10-31 21:33:03', '2019-10-31 21:33:03', '2019-11-15 23:33:03'),
('638ea4f53ecd358e3ed47cb7779cd0732b6f4ded091a2f1f834117a8842ddcfa133e1b150f1f1b55', 1938, 2, NULL, '[]', 0, '2019-11-01 05:26:39', '2019-11-01 05:26:39', '2019-11-16 07:26:39'),
('23dd038b28b127d71fae66bead1be99b7afe75f7cefcbf0fdb03b7fc82a0577ce6253d37fec98f4b', 1939, 2, NULL, '[]', 0, '2019-11-01 07:00:18', '2019-11-01 07:00:18', '2019-11-16 09:00:18'),
('0ba3a1ed916b33b3ade8b2975eaebd86cef3a8800b51fb2571f65a066cf09de8ddeafbf691210137', 1705, 2, NULL, '[]', 0, '2019-11-01 08:36:04', '2019-11-01 08:36:04', '2019-11-16 10:36:04'),
('564aafd6aa35e70f9cfd8bbabffbcd6c206280a320eeb386a60144c7dd91fb0018eb29c64abff1fd', 1940, 2, NULL, '[]', 0, '2019-11-01 09:31:12', '2019-11-01 09:31:12', '2019-11-16 11:31:12'),
('5c65adf104acd8572b721c698dab80f2df9d1e67b5b84c607533bdb809393b8755d8c7d517a711fe', 1941, 2, NULL, '[]', 0, '2019-11-01 10:22:31', '2019-11-01 10:22:31', '2019-11-16 12:22:31'),
('dfad2cd8a95322d9819dc701b87b22d11e14f3504f4a7da2b170d3fea3337952bf844fa7f0cc3474', 1942, 2, NULL, '[]', 0, '2019-11-01 10:31:17', '2019-11-01 10:31:17', '2019-11-16 12:31:17'),
('c596e48059bc6773ed98a69c1d9076a4961bc0d3e0f164ff09ee3d565fac64f79ac0af5414f3c81b', 1943, 2, NULL, '[]', 0, '2019-11-01 10:50:36', '2019-11-01 10:50:36', '2019-11-16 12:50:36'),
('25d10ff2b3cbc8b8bb821c15522e75f50c3fd8a1365bc684e2b69ee48c289938a13e0d4333c13960', 1944, 2, NULL, '[]', 0, '2019-11-01 12:59:16', '2019-11-01 12:59:16', '2019-11-16 14:59:16'),
('5341eb83d385ea524a7230ab6dcd5213f4c729cf59f644734738209c19027ad704fa551f621fa13f', 1915, 2, NULL, '[]', 0, '2019-11-01 13:02:03', '2019-11-01 13:02:03', '2019-11-16 15:02:03'),
('f10a732125557ed76438ef829309de26670666170a6d4ab1504ea3dfa8737ca0cb95a629521b0625', 1945, 2, NULL, '[]', 0, '2019-11-01 14:57:27', '2019-11-01 14:57:27', '2019-11-16 16:57:27'),
('8c2804484e6ed97657a8c16da9954a891a0bf088e2f863a864833b39bc7668c1ae964297dd485198', 1946, 2, NULL, '[]', 0, '2019-11-01 17:43:05', '2019-11-01 17:43:05', '2019-11-16 19:43:05'),
('51d440be496de9ceec4069023c9ec91da3274a7480cbdf1c7c1034d02d059d432c10d3170130226d', 1947, 2, NULL, '[]', 0, '2019-11-02 02:44:21', '2019-11-02 02:44:21', '2019-11-17 04:44:21'),
('7c9b4328fffa00e0bfcfcfcc87d70f2119e600fc492a8ba95fa20a4e3b4b9972a8ed635c5f0d1333', 1949, 2, NULL, '[]', 0, '2019-11-02 05:20:34', '2019-11-02 05:20:34', '2019-11-17 07:20:34'),
('db92ef7f3ef1f97c6e3c9e52b703696a119892a42a0fd5a0a7bd2590bda7055a2397382dbbf1977e', 1950, 2, NULL, '[]', 0, '2019-11-02 07:22:58', '2019-11-02 07:22:58', '2019-11-17 09:22:58'),
('192d6e3a5ecd69dae1f72f34f5ec847a074052430a739871a6f0761e71f787438fe70ff7062f8b6b', 1951, 2, NULL, '[]', 0, '2019-11-02 08:19:47', '2019-11-02 08:19:47', '2019-11-17 10:19:47'),
('46a3e2332eb23517784904686948564d656d622a26807013236856d9735c522035bc438c9fbd8e1e', 1952, 2, NULL, '[]', 0, '2019-11-02 09:42:43', '2019-11-02 09:42:43', '2019-11-17 11:42:43'),
('573ba29b270161570da7add65f516155c945b55b2da16b8ed5ba8017a232046d8455662f87987ed2', 1953, 2, NULL, '[]', 0, '2019-11-02 10:00:03', '2019-11-02 10:00:03', '2019-11-17 12:00:03'),
('4aaf7044fc5365d10f9577441928b69a0d7a915b4bfafd5ef1ef5e9fc7d835835eb213056839f7df', 1954, 2, NULL, '[]', 0, '2019-11-02 10:39:12', '2019-11-02 10:39:12', '2019-11-17 12:39:12'),
('7cfe98221c3a6775a7e2a2a1176004613d6e94a842a22fd8cbea09c8d7af5bbcc0a02dcaa4b521ed', 1955, 2, NULL, '[]', 0, '2019-11-02 11:40:19', '2019-11-02 11:40:19', '2019-11-17 13:40:19'),
('b7a78996446e92092a4d4ae5d28f7c5dae0f5e95b73e618c47732970fa5652caacf8d8474d59a248', 1956, 2, NULL, '[]', 0, '2019-11-02 11:42:00', '2019-11-02 11:42:00', '2019-11-17 13:42:00'),
('98977eca632e56335bcaaa638a49139a82ac2d090749ff7c368c82090cbef6a85f941c97b1729e05', 1957, 2, NULL, '[]', 0, '2019-11-02 11:50:55', '2019-11-02 11:50:55', '2019-11-17 13:50:55'),
('8ed4ac2f3df161fd0b02cc55913ce0756b1a67c8cb980e74f041bce230b7c68f9a22d161dee78c4d', 1958, 2, NULL, '[]', 0, '2019-11-02 11:52:22', '2019-11-02 11:52:22', '2019-11-17 13:52:22'),
('1b68489fc7b0baee6cff13f2e11dc8234949fb26c53ee9119470bc06d37c0b7defd7ce75ad6ea389', 1959, 2, NULL, '[]', 0, '2019-11-02 12:07:54', '2019-11-02 12:07:54', '2019-11-17 14:07:54'),
('9e0142880e1f5e918bb87aac1960a16927542c62a7c1c936aa07bb3deadec4bdee8f52cb286b8a24', 1960, 2, NULL, '[]', 0, '2019-11-02 12:23:40', '2019-11-02 12:23:40', '2019-11-17 14:23:40'),
('9e9e0fcd458dddd6f47b454fad0c0f39504790c29f31fed43b8129b30d4a84b67168720319966e6f', 1961, 2, NULL, '[]', 0, '2019-11-02 13:08:27', '2019-11-02 13:08:27', '2019-11-17 15:08:27'),
('3744143af3fd1104e5d3c9356511325bc1236abb4fc91abc3a9184dc298abfa154068cad0df67b51', 1962, 2, NULL, '[]', 0, '2019-11-02 13:19:04', '2019-11-02 13:19:04', '2019-11-17 15:19:04'),
('eba9cc4c22a68d8e381b0ae92a7627b81d07070313807d8754d6f75adb509c5b96fcaedf5b243a9c', 1963, 2, NULL, '[]', 0, '2019-11-02 15:16:53', '2019-11-02 15:16:53', '2019-11-17 17:16:53'),
('e169cf96063b8db0dae571529e8084ca71323b6c4ae5f904cb6e9db29beb163d97ef92d023511037', 1964, 2, NULL, '[]', 0, '2019-11-02 15:40:35', '2019-11-02 15:40:35', '2019-11-17 17:40:35'),
('ecb3ebd91087193970b9e142a6d3ce0ed57a59644924af6c0f8d9d2a66f3128af36cd73a387e7332', 1965, 2, NULL, '[]', 0, '2019-11-02 17:03:38', '2019-11-02 17:03:38', '2019-11-17 19:03:38'),
('2ee72ea22888eb4b4fc05e7e5cb4a3ef3e51725bf170c27529d9ecfb38fb00bd73aeb3967f85cc43', 1966, 2, NULL, '[]', 0, '2019-11-02 18:33:45', '2019-11-02 18:33:45', '2019-11-17 20:33:45'),
('6fa79825a32297f43fea31d5b63233281f48d39fa3acb886c9938d5f88237ca172ce21cf2baf3ebe', 1967, 2, NULL, '[]', 0, '2019-11-02 20:01:37', '2019-11-02 20:01:37', '2019-11-17 22:01:37'),
('4c90aa5f32821cb2f8d735cce4681f8964594e6fa7674c3392a675a995dcb9b2709d74c0b29bbeec', 1968, 2, NULL, '[]', 0, '2019-11-02 21:07:17', '2019-11-02 21:07:17', '2019-11-17 23:07:17'),
('54fca381228493f10e5a4c4f5ada9bd5292a7f156ec18d26c96c260e1e26e7072022addf852b53f4', 1969, 2, NULL, '[]', 0, '2019-11-02 21:45:40', '2019-11-02 21:45:40', '2019-11-17 23:45:40'),
('8ca1f20a0a7b5b3063e6a6c565dfef910dba11460e2a9638dd81b4eb7030f256fa84916c508dc81c', 1970, 2, NULL, '[]', 0, '2019-11-02 22:24:10', '2019-11-02 22:24:10', '2019-11-18 00:24:10'),
('541ec6ba49b08170221c941dc4c576ff14eeb13ede9da0d1e6f5cf18d79faf50515170df97f8fb1f', 1971, 2, NULL, '[]', 0, '2019-11-03 00:24:37', '2019-11-03 00:24:37', '2019-11-18 02:24:37'),
('7ce599c7909cabf1deaa9fccc575bbc08236025c5a54d4bd9301889e5282a726be3a55afa1e96a80', 1972, 2, NULL, '[]', 0, '2019-11-03 02:27:05', '2019-11-03 02:27:05', '2019-11-18 04:27:05'),
('715ba878568aae84bd52d8b3ae938eb6941060cebaf2724ad939d6547eba992abae2a1a70925573b', 1973, 2, NULL, '[]', 0, '2019-11-03 02:47:43', '2019-11-03 02:47:43', '2019-11-18 04:47:43'),
('cc2d40b012966516dbcfba10f1e87e12392de68b0b38387119df3dd41fc6e248fe29e1466bc622f5', 1974, 2, NULL, '[]', 0, '2019-11-03 08:29:13', '2019-11-03 08:29:13', '2019-11-18 10:29:13'),
('c47af29d06da6546b8e8919270a5cff264dff0ab7e53ee6bcc3ae669b588206f2daf2faa26ed22d6', 1975, 2, NULL, '[]', 0, '2019-11-03 08:39:26', '2019-11-03 08:39:26', '2019-11-18 10:39:26'),
('432cbc2ee0e7b22e4a7e30b7ffad6f29f0d4d0d8bbf748451eb3f6a4b46a3f1a23bca22a74b83c43', 1976, 2, NULL, '[]', 0, '2019-11-03 09:13:18', '2019-11-03 09:13:18', '2019-11-18 11:13:18'),
('9c14afbe4e8097d5718dce7449cdc71370a05f7c8832bc8efd193d614e742e08259f0d006869b1e2', 1977, 2, NULL, '[]', 0, '2019-11-03 09:22:26', '2019-11-03 09:22:26', '2019-11-18 11:22:26'),
('130677551011e9944b2b1a6341f0409d7dbbcd3fc8878ba4e8ba659ae51c8c7e5badedcd8c46ea4b', 1978, 2, NULL, '[]', 0, '2019-11-03 09:42:02', '2019-11-03 09:42:02', '2019-11-18 11:42:02'),
('a5535c787b1705b5e511a12e7b155effb1d05091cf180cfa5fd227f5f38afac8092b4e24f7abda71', 1979, 2, NULL, '[]', 0, '2019-11-03 10:08:13', '2019-11-03 10:08:13', '2019-11-18 12:08:13'),
('c8ac9a3b819816d1de5bbe8c3a1ca2b3efd54ba387489ebcdd7d573c052c075d2e96f1fa58394e8c', 1980, 2, NULL, '[]', 0, '2019-11-03 11:09:42', '2019-11-03 11:09:42', '2019-11-18 13:09:42'),
('85a2022cef00522ad66f0e8dccd241453a9135f4e4d7e14fc32df047620eb7dbe3cd6398fcd4254d', 1981, 2, NULL, '[]', 0, '2019-11-03 11:25:18', '2019-11-03 11:25:18', '2019-11-18 13:25:18'),
('6997fbc3f1a7993a61bc482b2506dfb515585bb6944d7fe4630a93a23e2c3b6ed9d343b0179f0139', 1982, 2, NULL, '[]', 0, '2019-11-03 12:35:52', '2019-11-03 12:35:52', '2019-11-18 14:35:52'),
('072c6b5bb7ddf57be8868f1244462774dd580d648f32de020643faadbd812e3f8b6ac21d36dc818c', 1983, 2, NULL, '[]', 0, '2019-11-03 12:38:34', '2019-11-03 12:38:34', '2019-11-18 14:38:34'),
('a5707ef8d6da5a68a297dd85702310ad84450a5774f6c52e2d01f7a25527675df8e7c3bfc929b89b', 1984, 2, NULL, '[]', 0, '2019-11-03 13:10:28', '2019-11-03 13:10:28', '2019-11-18 15:10:28'),
('f1d2fe67af0d4d822fdaf3b6d1a890cb890ae4376a4e43c1c226fe04b0e6ddb4fdf1220d1468900c', 1985, 2, NULL, '[]', 0, '2019-11-03 13:30:11', '2019-11-03 13:30:11', '2019-11-18 15:30:11'),
('7a3e9ac7c993c7253fbc2a50944cb6d65096fcbe9a61924784e44660f71d1b63a0709cc035dd0c61', 1986, 2, NULL, '[]', 0, '2019-11-03 13:43:03', '2019-11-03 13:43:03', '2019-11-18 15:43:03'),
('915376b27f75f5272005182ed9fd23bdeb44bb075dfbab7bdc14f3eab8aecc35efcf5c75401deb9c', 1987, 2, NULL, '[]', 0, '2019-11-03 14:03:12', '2019-11-03 14:03:12', '2019-11-18 16:03:11'),
('21a09ce762054c2cf9cbb3248520edd034f37d4433c04f2cf97e1a0c50094e4b8125d463a21561b6', 1988, 2, NULL, '[]', 0, '2019-11-03 14:04:27', '2019-11-03 14:04:27', '2019-11-18 16:04:26'),
('f6d21dba0342851f489ad0b27e537b2e9835c47ebab349b85f869058cd33e5ae950e369a5ba779c8', 1989, 2, NULL, '[]', 0, '2019-11-03 14:32:00', '2019-11-03 14:32:00', '2019-11-18 16:31:59'),
('22b6e92f0d6ea5b5bf8bdef9e744698f645758a8cc0cfab58aea3ee4b6ffcb98d8e6d4dcbecd0a8f', 1668, 2, NULL, '[]', 0, '2019-11-03 14:47:34', '2019-11-03 14:47:34', '2019-11-18 16:47:34'),
('0526a1f9ac81e3223bc5ed326413f1f2696dc376385718dbfe455a648ba43cc1f43d123a46f56b83', 1990, 2, NULL, '[]', 0, '2019-11-03 16:38:47', '2019-11-03 16:38:47', '2019-11-18 18:38:47'),
('3e21c884c3d1a1dcfea728b26c1e9f4ec5cdd80c12304251a686ecba38ac74d9b1c4f96163e026af', 1991, 2, NULL, '[]', 0, '2019-11-03 23:03:06', '2019-11-03 23:03:06', '2019-11-19 01:03:06'),
('a283c4bee3c00a379d63b43314042153d9a8e3846e6f2942f7222c63a78f4f20ec1842ffea626253', 1992, 2, NULL, '[]', 0, '2019-11-04 07:39:01', '2019-11-04 07:39:01', '2019-11-19 09:39:01'),
('c0c08c420a88ed7fd4fd4d6b343a6db6cb1f9085c747a7c7c33f493f0bd623af7c22c420aa6cac6c', 1993, 2, NULL, '[]', 0, '2019-11-04 09:14:51', '2019-11-04 09:14:51', '2019-11-19 11:14:50'),
('78e72ac943e725498350ed9e497b464c84d60096833c7d61f6dd19e86b225cf0a28de5ddbd80adac', 1994, 2, NULL, '[]', 0, '2019-11-04 09:48:40', '2019-11-04 09:48:40', '2019-11-19 11:48:40'),
('e862464617c741616309e06ae9f8d3b720d0451e1ace0503f9a045472ddd1a40d4cbf1dc660c4624', 1995, 2, NULL, '[]', 0, '2019-11-04 09:56:14', '2019-11-04 09:56:14', '2019-11-19 11:56:14'),
('2d2c3b2b25d78aa4b97f104e6187ec1bab4adc57a4c04f0edc0ec733f5c41077a472ce2355fa495a', 1587, 2, NULL, '[]', 0, '2019-11-04 09:59:20', '2019-11-04 09:59:20', '2019-11-19 11:59:20'),
('47261398577e165d2768ab080ec1cf725ecc745dbe68008790d67c7e195ef0e21144eadd5ea8f678', 1996, 2, NULL, '[]', 0, '2019-11-04 11:25:08', '2019-11-04 11:25:08', '2019-11-19 13:25:08'),
('9d8f8832b1cae5074c7b9b501b22c8a87bb8f5624feb156e542dbc390eb68e64dd982356aed20b6c', 1997, 2, NULL, '[]', 0, '2019-11-04 11:28:12', '2019-11-04 11:28:12', '2019-11-19 13:28:12'),
('f9ca7b1f5f6a711024799bd07e58928a03ecff49f7de3563b0843d42a86a46bae9720a53eb0d6fe0', 1998, 2, NULL, '[]', 0, '2019-11-04 11:52:26', '2019-11-04 11:52:26', '2019-11-19 13:52:26'),
('afdf6e76ae03eeedec939ab4f2c1731f2b6d5615b48cd29fc25a0f7fc0617cdb68314d0eb7784b54', 1999, 2, NULL, '[]', 0, '2019-11-04 12:55:52', '2019-11-04 12:55:52', '2019-11-19 14:55:51'),
('087c9c4921f07482eec121e2e00b0679c807667caa0fdafc6ce9e890a3ce77235f4405777a01501c', 2000, 2, NULL, '[]', 0, '2019-11-04 12:56:36', '2019-11-04 12:56:36', '2019-11-19 14:56:36'),
('5fd8e644dd37362eb10e5a510894e85c88f5ad3e4569d32c1070cf37f9bd805f1e79960da88600f8', 2001, 2, NULL, '[]', 0, '2019-11-04 15:37:53', '2019-11-04 15:37:53', '2019-11-19 17:37:53'),
('eeb880cd43d2e7f1106f60b7373c74b9e0132d235b989e27496946dad538cf515b1c4d3b14faa6e1', 1751, 2, NULL, '[]', 0, '2019-11-04 15:50:48', '2019-11-04 15:50:48', '2019-11-19 17:50:48'),
('bf82ee03397895113e382cc02153f24a8fe0a80dc7c2eb6e5955cad49a2a6b247017e75f2c640456', 615, 2, NULL, '[]', 0, '2019-11-04 16:53:51', '2019-11-04 16:53:51', '2019-11-19 18:53:51'),
('aa54029ffb59b4299e04fa4dbb341fc1e29726d15264b542212bb6481c38b4c07a9abe796c3bb4b3', 2002, 2, NULL, '[]', 0, '2019-11-04 19:16:15', '2019-11-04 19:16:15', '2019-11-19 21:16:15'),
('f8a7f4eef77ef8d4f151251ed0d19cfa74fa34b5cdb84f832ffc0edc829e35c1a1e8253c761ca4b5', 2003, 2, NULL, '[]', 0, '2019-11-04 22:12:25', '2019-11-04 22:12:25', '2019-11-20 00:12:25'),
('41eb347ebde244cb904c8f2435a5a621ac6159ff659a507bfa28da491a76167f8f8620376503c525', 2004, 2, NULL, '[]', 0, '2019-11-04 22:16:36', '2019-11-04 22:16:36', '2019-11-20 00:16:36'),
('5d96b49cad8edd5b0a8dddc689209cdd949b36e26fb5c0fa9f03ef568bb9dfd33d825a5a97762dd9', 2005, 2, NULL, '[]', 0, '2019-11-05 01:11:23', '2019-11-05 01:11:23', '2019-11-20 03:11:23'),
('31288df31878571a4e622bb4c67d6b8335ee57b0ddaaef62cc82d81a7313575e2d45c6342552e729', 2006, 2, NULL, '[]', 0, '2019-11-05 04:46:35', '2019-11-05 04:46:35', '2019-11-20 06:46:34'),
('4885773589bac9d112b284d19069aebab9cd32aef0201e2c93c437026f904754a0598ff83b531844', 2007, 2, NULL, '[]', 0, '2019-11-05 06:21:20', '2019-11-05 06:21:20', '2019-11-20 08:21:20'),
('02ff6cd37a0616e3b8c1cef7c42244748bd3b2aadd3a44e76eeadd154023f6f3d0a51d6055c20d5f', 2008, 2, NULL, '[]', 0, '2019-11-05 08:11:23', '2019-11-05 08:11:23', '2019-11-20 10:11:23'),
('733800728d3455d350a40846e10cf85f007f0c630d085c78038f33a352102ff9b7ce2a08d346b948', 2009, 2, NULL, '[]', 0, '2019-11-05 09:32:33', '2019-11-05 09:32:33', '2019-11-20 11:32:33'),
('c4b6f8716e77ad25025fa3fdb7f04fdf8a442b11e9201df215b477a3bd0f2cdaef389ea6a84d8b95', 2010, 2, NULL, '[]', 0, '2019-11-05 09:33:14', '2019-11-05 09:33:14', '2019-11-20 11:33:14'),
('224a887bcb091788c77f2ef9e739feb8dc601ba24d57c8495c76d75fc445d0b71c3ff5a63e0fe97b', 2011, 2, NULL, '[]', 0, '2019-11-05 09:38:08', '2019-11-05 09:38:08', '2019-11-20 11:38:08'),
('c16ab96bac2cb451e84634c33be0487db5870148917f5a833614b647ea33dfe849660e5e744b0269', 2012, 2, NULL, '[]', 0, '2019-11-05 09:51:37', '2019-11-05 09:51:37', '2019-11-20 11:51:37'),
('4b33bf28e37e24d72c8a85f106137fab3b73e3654824f6036a77c3582c5b4f993042fb11426dabb7', 1907, 2, NULL, '[]', 0, '2019-11-05 18:55:45', '2019-11-05 18:55:45', '2019-11-20 20:55:44'),
('9c2f56210d7cf5007b31ac7f59ceb28317471f96e36c96a79fc859b03e693be057645c2032f32423', 2013, 2, NULL, '[]', 0, '2019-11-05 18:59:51', '2019-11-05 18:59:51', '2019-11-20 20:59:51'),
('da9d0c723b2b5f6e9a051b6902b9fc8ff89860b1f85cf8a6eadfdd51ec9dc1c72231b0d30fa4c96c', 1870, 2, NULL, '[]', 0, '2019-11-05 19:17:48', '2019-11-05 19:17:48', '2019-11-20 21:17:48'),
('e93546f0c15ff7ca89c97d942f6c7b3c083682456b1ef282342235324d4ba402873911909692f5ea', 2014, 2, NULL, '[]', 0, '2019-11-05 22:02:05', '2019-11-05 22:02:05', '2019-11-21 00:02:05'),
('c3ddcb4352cdfdc3c86ccab37ec48f45586fb2242756454edf00c05c05f82084d78caaa3c8ac478a', 2015, 2, NULL, '[]', 0, '2019-11-05 22:20:10', '2019-11-05 22:20:10', '2019-11-21 00:20:10'),
('79bcc2b592bbee6b78af69c690eaf47dbefdcb6fca43d229b40a1b592f941f7d5a1c70144e59e713', 2016, 2, NULL, '[]', 0, '2019-11-05 23:02:25', '2019-11-05 23:02:25', '2019-11-21 01:02:25'),
('69f95987bf8dd18452d2fa0c855691e855484c1b6003494b79cdb1854c3caaceafe68eb2d6e9bedd', 2017, 2, NULL, '[]', 0, '2019-11-06 09:06:45', '2019-11-06 09:06:45', '2019-11-21 11:06:45'),
('3de3fa12aa41d34c904fbe52067e28625d81c002a21f04842853e44ee3bb3758be1e12fd46c820d0', 2018, 2, NULL, '[]', 0, '2019-11-06 09:11:47', '2019-11-06 09:11:47', '2019-11-21 11:11:47'),
('902578f9fa5ab70e4624c7cbb7ca0c598c4f55143ae626a1b9523b2f403894d655020c7c1a25a4fa', 2019, 2, NULL, '[]', 0, '2019-11-06 09:40:04', '2019-11-06 09:40:04', '2019-11-21 11:40:04'),
('3ce7c387de32e3db2469367bfab0bc5cafa854c0141cfaecb4aaaee3e95fdc719311cc4ee91e5109', 2020, 2, NULL, '[]', 0, '2019-11-06 09:53:47', '2019-11-06 09:53:47', '2019-11-21 11:53:47'),
('57be1a27bc56451f7f1c77d39dc72dd95a0f4741d2255614599eb57a2d347e24ab2aa910485c621c', 2021, 2, NULL, '[]', 0, '2019-11-06 10:04:39', '2019-11-06 10:04:39', '2019-11-21 12:04:39'),
('55a753b09020548e77037590e91e7ad24332b100f9914ede615a86728d62e657490be291c67cd6e3', 2022, 2, NULL, '[]', 0, '2019-11-06 10:37:08', '2019-11-06 10:37:08', '2019-11-21 12:37:08'),
('c4fd14e69911e2fa649a16a235ebb9a179af45e7d07205b87266a279dabb3c216d69d93dd86c0e11', 2023, 2, NULL, '[]', 0, '2019-11-06 10:48:52', '2019-11-06 10:48:52', '2019-11-21 12:48:52'),
('133fb5bce353f1079e9e070dde1631d038839b5c3e55333079f488042eab4b79b6c10f2f41bf3156', 2024, 2, NULL, '[]', 0, '2019-11-06 11:16:45', '2019-11-06 11:16:45', '2019-11-21 13:16:45'),
('51fb0d8b0d9c8995be1523f0f7b26fed7b76f1bfeeb432315063072b493f223ba41520a658e55668', 2025, 2, NULL, '[]', 0, '2019-11-06 11:36:18', '2019-11-06 11:36:18', '2019-11-21 13:36:18'),
('c7cc628434ecfcd2e96e5f1f1139198cf172e95a418689ef0eecda01e56b09affa77ffab957be0d1', 2026, 2, NULL, '[]', 0, '2019-11-06 12:42:04', '2019-11-06 12:42:04', '2019-11-21 14:42:04'),
('f363801ddd957990ad9784046aec089b359e88ebc2365245fa31d81eab347717c1217e54745459d6', 2027, 2, NULL, '[]', 0, '2019-11-06 14:08:35', '2019-11-06 14:08:35', '2019-11-21 16:08:35'),
('2c86df71b54e995def4dbcbd075f0847c7ffd0701fb37598e727adc63c572e002b20d760587362d3', 2028, 2, NULL, '[]', 0, '2019-11-06 14:18:50', '2019-11-06 14:18:50', '2019-11-21 16:18:50'),
('3d4134bafb2b9431ea9bbf5ae84cc8ad172e8381cd84aa8405dc68ddb8d10882b3e9bf64c938462c', 2029, 2, NULL, '[]', 0, '2019-11-06 15:18:35', '2019-11-06 15:18:35', '2019-11-21 17:18:35'),
('ba219857dd5c01837f1f437238e6297b3c4bb07d42a1d98a3027839df4d92389db4134622a5ab82e', 2030, 2, NULL, '[]', 0, '2019-11-06 17:22:59', '2019-11-06 17:22:59', '2019-11-21 19:22:59'),
('be85af2908b4ab9ac6d9cfb246fa7f0c1fb155552349c905d7628bc721f81e9a9766958378c90276', 1488, 2, NULL, '[]', 0, '2019-11-06 18:12:56', '2019-11-06 18:12:56', '2019-11-21 20:12:56'),
('4eec1ae3ec7f19f11e1cfd1aa267346843a585ad3d866248e4b2ca0a3b80f363853eed9da4ade2bc', 2031, 2, NULL, '[]', 0, '2019-11-06 20:47:00', '2019-11-06 20:47:00', '2019-11-21 22:47:00'),
('194415969487c4355afa96810e1ab75e44a23f4b73a72ef8bc5d3644c2e9f165dbad6999e4492954', 2032, 2, NULL, '[]', 0, '2019-11-06 21:39:46', '2019-11-06 21:39:46', '2019-11-21 23:39:46'),
('b1a690ef75bf27b20feae645c7ecafa431abfb16f36a5c0ed9181e98fffacb90d96fa3816ba19a96', 2033, 2, NULL, '[]', 0, '2019-11-06 23:23:06', '2019-11-06 23:23:06', '2019-11-22 01:23:06'),
('7193aebb8ba6f3682ac3542b18482fd706bd7294e5e23559d7f5716581380e1dcf847e08b7c174c7', 2034, 2, NULL, '[]', 0, '2019-11-07 07:44:47', '2019-11-07 07:44:47', '2019-11-22 09:44:47'),
('df53f4ce34a034b867d8ea627bf51da0df97296054f52244889ab5b216385e5391fe7415376cb389', 2035, 2, NULL, '[]', 0, '2019-11-07 07:56:56', '2019-11-07 07:56:56', '2019-11-22 09:56:56'),
('d8d763b8bac53c0c8a961a0e5e0fafa93ec89239750abbdf8a120461460256cd33ddf08bf80fe842', 2036, 2, NULL, '[]', 0, '2019-11-07 08:35:54', '2019-11-07 08:35:54', '2019-11-22 10:35:54'),
('4721470928903ecc871c342f39ba21c19bf6a3285482032fc044492b33c081af593790d14fcd5f6a', 2037, 2, NULL, '[]', 0, '2019-11-07 09:54:46', '2019-11-07 09:54:46', '2019-11-22 11:54:46'),
('c750cc3e927d5e36599256785bb9233254e2a02cd609326f674e7da009d8f1c0e8ec29d494ac707d', 2038, 2, NULL, '[]', 0, '2019-11-07 10:32:40', '2019-11-07 10:32:40', '2019-11-22 12:32:40'),
('ca8f14a5193cd20e2bd44468c3f1719a7be64af409aa8f248710a5674072772d6e607abed1b04209', 2039, 2, NULL, '[]', 0, '2019-11-07 11:26:28', '2019-11-07 11:26:28', '2019-11-22 13:26:28'),
('0232df3f3501ebdcfc59694449a423024bc0fd2ae00149cbb58857fb8f9c7f0b6f0bd825caa6b366', 2040, 2, NULL, '[]', 0, '2019-11-07 12:11:58', '2019-11-07 12:11:58', '2019-11-22 14:11:58'),
('9d1cf1bb4bd5fe2ac2642bafc1568abf0ce5d1e5e1ab1280169efbdc79d86d14c8bf936cb3289066', 2041, 2, NULL, '[]', 0, '2019-11-07 13:37:51', '2019-11-07 13:37:51', '2019-11-22 15:37:51'),
('78c73c9349696cbf859258e44f81faa8868593288f32310e7ac57f21671237f768a77e78092cc119', 2042, 2, NULL, '[]', 0, '2019-11-07 14:06:57', '2019-11-07 14:06:57', '2019-11-22 16:06:57'),
('40a4e1389c33ffa015020235c0cd624d83fab55f93033d6eb5985f92a98b87066ef414be8e072979', 2043, 2, NULL, '[]', 0, '2019-11-07 14:30:18', '2019-11-07 14:30:18', '2019-11-22 16:30:18'),
('8ba3f992fd2ac1c3a98783d717acd3c80fbc3b1ee2a15839ad625a3d23509b1b9ce80eb1d2fb646c', 2044, 2, NULL, '[]', 0, '2019-11-07 14:59:51', '2019-11-07 14:59:51', '2019-11-22 16:59:51'),
('ca206e92b2a24ad75f1a94f6454e3ba728043bf47bd7fff10445adc65a25d66bbac5fe1344ef55af', 2045, 2, NULL, '[]', 0, '2019-11-07 15:47:12', '2019-11-07 15:47:12', '2019-11-22 17:47:12'),
('60e88a337cd8cb1128663ee3c44cbff0dbcbb3a04d1924ceca90980a7af84b166f06e18a8007bc19', 2046, 2, NULL, '[]', 0, '2019-11-07 15:48:54', '2019-11-07 15:48:54', '2019-11-22 17:48:54'),
('19b2f7c1f164ce0ac802c44bfc9505e2da18c06effccce0b61409ebc35d961e3ba33c3c8db7389c7', 2047, 2, NULL, '[]', 0, '2019-11-07 16:45:23', '2019-11-07 16:45:23', '2019-11-22 18:45:23'),
('775a2fe8294cf22405ac05995a6c13c5fc947cc00acb5c0700e5689f362d4f52843ca4bdd258cff8', 2048, 2, NULL, '[]', 0, '2019-11-07 17:28:17', '2019-11-07 17:28:17', '2019-11-22 19:28:17'),
('6da5927fc76e14feec890b68ea079381aaf9689e2a88f5bff19c8eb94b287a699a91cb80459d8a67', 2049, 2, NULL, '[]', 0, '2019-11-07 18:16:45', '2019-11-07 18:16:45', '2019-11-22 20:16:45'),
('77bc6a1a645df1e7a20fd754bc24d1da77cfa5e683f8ac1481ec17cc9ba34bbae2ac76650458f938', 2050, 2, NULL, '[]', 0, '2019-11-08 02:17:36', '2019-11-08 02:17:36', '2019-11-23 04:17:36'),
('2bbe07e47bd07d38e93559c04ce1f3423c9936ccd6f5fc193f8e8aba3cedcbe54f5014f8193db15c', 2051, 2, NULL, '[]', 0, '2019-11-08 09:20:21', '2019-11-08 09:20:21', '2019-11-23 11:20:21'),
('1884be54404fbf31897cf8675384720c5c7024f5f0158c0ff04e7e1f73405074fc815fcb87da3f77', 210, 2, NULL, '[]', 0, '2019-11-08 10:46:21', '2019-11-08 10:46:21', '2019-11-23 12:46:21'),
('43349c6d92b6b934fbdec3128787fb99e1a32d2a5a5843231453dd14812ec2f5fbecefa3c649f8f7', 2052, 2, NULL, '[]', 0, '2019-11-08 13:42:29', '2019-11-08 13:42:29', '2019-11-23 15:42:29'),
('1ae97f1888026d4e7b1edcf616a34e9425bf064f729e2d3ad6ff4bf0ea47c850af6df207549ad712', 2053, 2, NULL, '[]', 0, '2019-11-08 13:44:53', '2019-11-08 13:44:53', '2019-11-23 15:44:53'),
('b86b033013e426f9d17c69fbe65020a4ef454b175a60202405bb69d4c14a2ade0faeb3f7101105be', 1253, 2, NULL, '[]', 0, '2019-11-08 15:55:51', '2019-11-08 15:55:51', '2019-11-23 17:55:51'),
('f26d49c496d7895852a3eed477702a51add52033290205919c74419c8679b4b1452f18cd00fd976d', 2054, 2, NULL, '[]', 0, '2019-11-08 16:15:13', '2019-11-08 16:15:13', '2019-11-23 18:15:13'),
('7dc359c459155ad62597a7de0a5d39c861456c0ccbf4eb3f7763a7d8d09c784ac04391eee123d2ce', 2055, 2, NULL, '[]', 0, '2019-11-08 18:34:09', '2019-11-08 18:34:09', '2019-11-23 20:34:09'),
('4554da9234d0bb72e9eaebdfb1c3540e8aff59ac9e71c9bcb68a84725f237435d1dc9df49d1a6784', 2056, 2, NULL, '[]', 0, '2019-11-08 18:34:35', '2019-11-08 18:34:35', '2019-11-23 20:34:35'),
('fb6b037c93d86ba8b51e0e2353513e1c514a2b0d8ccf8e66383dc31c4cf7f243c2234cdec2172a85', 2057, 2, NULL, '[]', 0, '2019-11-08 20:17:37', '2019-11-08 20:17:37', '2019-11-23 22:17:37'),
('3cadd4173e9f952fed053136c3d0923fcd47d114bf8816258874c59b68f5b540b9e3a983738194e5', 2058, 2, NULL, '[]', 0, '2019-11-08 20:53:34', '2019-11-08 20:53:34', '2019-11-23 22:53:34'),
('d3f26ac347200dd723d8d9caa1995d7e76c075653999fb4f4506b3739aeca52fc832b97cf5420c2e', 2059, 2, NULL, '[]', 0, '2019-11-08 21:46:30', '2019-11-08 21:46:30', '2019-11-23 23:46:30'),
('5ad9a0e2eb156c1e0da0060f08ce60fbc8b00eee98d5a53a99d6759b94cd782bd95ecf8baac7651c', 2060, 2, NULL, '[]', 0, '2019-11-08 21:48:50', '2019-11-08 21:48:50', '2019-11-23 23:48:50'),
('6e2af1b7eaf424d9afc4fa1f4a92708200dd855eb00d7daa6c8f8d814c997592dd2600f6b2b88596', 2061, 2, NULL, '[]', 0, '2019-11-08 23:16:05', '2019-11-08 23:16:05', '2019-11-24 01:16:05'),
('054c0a9b41e9dca0aaf5cfc1ee993b8c8f0d36abc126c54ccb26e4cd7a1972b07faa205334a1164e', 2061, 2, NULL, '[]', 0, '2019-11-08 23:20:25', '2019-11-08 23:20:25', '2019-11-24 01:20:25'),
('6892e11e7acc524afaf11693bf4b2936e37887747e065393d1f15d131c86e908c1c46c6a3a613a77', 2062, 2, NULL, '[]', 0, '2019-11-09 01:06:33', '2019-11-09 01:06:33', '2019-11-24 03:06:33'),
('c8e1b429364acf3fa4c8e2d730771bf03f7db3744eb2f601c222bbaeb302569c19c9db498dd29e40', 2063, 2, NULL, '[]', 0, '2019-11-09 06:15:31', '2019-11-09 06:15:31', '2019-11-24 08:15:31'),
('09825296c4f9ba1986c6c3094bf8316485c70bbf67623d785e9c773c2572f4c5a611b3b87bc605b1', 2064, 2, NULL, '[]', 0, '2019-11-09 07:48:45', '2019-11-09 07:48:45', '2019-11-24 09:48:44'),
('8cf354cc4e7583605ed1df7befaa43cef844a37b288612a60d33b1e75b4a0d62f36465df6decc766', 2065, 2, NULL, '[]', 0, '2019-11-09 07:55:03', '2019-11-09 07:55:03', '2019-11-24 09:55:03'),
('ddbe6c1f5367a3773cbbcf44377305bbd0672da64805f2ae0e55376a18bd226368169b3445856255', 2066, 2, NULL, '[]', 0, '2019-11-09 08:00:38', '2019-11-09 08:00:38', '2019-11-24 10:00:38'),
('eda8863ec4a851689923b24f089c8b4661728c06ab131ddb82790d2fba50c508cf123889dbbb5032', 2067, 2, NULL, '[]', 0, '2019-11-09 08:33:46', '2019-11-09 08:33:46', '2019-11-24 10:33:46'),
('dcd06decf465485312d02a485503789c556f400f303965e71b8de7b8b5c59103f1856bbf7fb33db1', 2068, 2, NULL, '[]', 0, '2019-11-09 10:04:56', '2019-11-09 10:04:56', '2019-11-24 12:04:56'),
('edd27e73b55d0e6358665848112af76852026d8dccbed2b0d70bf7f52404cd125103403331cf8c95', 2069, 2, NULL, '[]', 0, '2019-11-09 10:16:44', '2019-11-09 10:16:44', '2019-11-24 12:16:43'),
('4a0fa68ac56e62e603fead2c0ab4de5a0f59fde5989a0d2fa18686fbfaa0e5ee739b6651da47abd2', 2070, 2, NULL, '[]', 0, '2019-11-09 10:25:18', '2019-11-09 10:25:18', '2019-11-24 12:25:18'),
('cb9e15dc719914be00fa1aba93aab35aa2bc266a743a600235e97e8b5e865284ae68fd66f1f921d4', 2071, 2, NULL, '[]', 0, '2019-11-09 10:52:55', '2019-11-09 10:52:55', '2019-11-24 12:52:55'),
('07aa537d2adee204d32961f923d4e083afbe33f853aee384b8abd12a274687e36216b317e0fa76c3', 2072, 2, NULL, '[]', 0, '2019-11-09 12:08:13', '2019-11-09 12:08:13', '2019-11-24 14:08:13'),
('8424674b299ec7d6168ef5a070f21b013a7468f739619001be2cc4c2c6de8dd2e1b5dbde309d58dd', 2072, 2, NULL, '[]', 0, '2019-11-09 12:10:56', '2019-11-09 12:10:56', '2019-11-24 14:10:56'),
('deaf6c4b20ce1864a00f2146ba6aca90d8ab14729f5ed15821fa4646937ed94e0f3735cb8e97ea45', 2073, 2, NULL, '[]', 0, '2019-11-09 12:15:09', '2019-11-09 12:15:09', '2019-11-24 14:15:09'),
('ec1ddd2d3689f89c5564673dd8f93f4779adc26861565982e135de4d9ba4191962f8c0bd0068cd1d', 2074, 2, NULL, '[]', 0, '2019-11-09 12:18:17', '2019-11-09 12:18:17', '2019-11-24 14:18:17'),
('3222c43b1be3a03422ab9656a6100597ae66b66bf9acc08460abf58303c4631b21adb5c8a487514c', 2075, 2, NULL, '[]', 0, '2019-11-09 12:47:09', '2019-11-09 12:47:09', '2019-11-24 14:47:09'),
('86d1ceff597c20d80b21a0352aefcece65062b8bf79925b52ba722d9e9b73ba61e3638b1714f3df7', 2076, 2, NULL, '[]', 0, '2019-11-09 13:01:10', '2019-11-09 13:01:10', '2019-11-24 15:01:10'),
('bff110da2cc4c2ed7c8fb12ee371814ab6cfb441fa5e663597bd5215b9d35a4b1825b2d84d67547e', 2077, 2, NULL, '[]', 0, '2019-11-09 14:40:47', '2019-11-09 14:40:47', '2019-11-24 16:40:47'),
('b0e9841994a0fcce754ca882161dd4aa289cfcbb55a38cca25ee1511f2244841e9851793e2837734', 1390, 2, NULL, '[]', 0, '2019-11-09 15:00:11', '2019-11-09 15:00:11', '2019-11-24 17:00:11'),
('66a35f00012aebe838025ffa9c69233b219620727b405d80051aef4e344bcd3c1459e60a9ff53813', 2078, 2, NULL, '[]', 0, '2019-11-09 16:43:09', '2019-11-09 16:43:09', '2019-11-24 18:43:09'),
('2cab72aa8db16d8c4ad014a78e2a9e649a2786770d5faacd2acf2029ed95a31dfd46bc29334edbc8', 2079, 2, NULL, '[]', 0, '2019-11-09 16:46:56', '2019-11-09 16:46:56', '2019-11-24 18:46:56'),
('984c3f173ed7bc6dca76b6c3acf5058f1fcd8484f0da5c8e3a856566248de2755645c341b34b167a', 2080, 2, NULL, '[]', 0, '2019-11-09 16:50:03', '2019-11-09 16:50:03', '2019-11-24 18:50:03'),
('adc8a48815649d2ea7d5936f649d39f5746c5181e42ee0af2d08e330eb144312b0f76780fb6e8b4b', 2081, 2, NULL, '[]', 0, '2019-11-09 18:24:58', '2019-11-09 18:24:58', '2019-11-24 20:24:58'),
('23d4cdb0c9c4b90baa9d310f5c829df2f7e9aa64d675da563d18ff8270c9ef65d025843dae4c504b', 2082, 2, NULL, '[]', 0, '2019-11-09 18:39:35', '2019-11-09 18:39:35', '2019-11-24 20:39:35'),
('8e4ac367fab4d11ee7a1daa41fde4d6e056c2dc12e3162e839dd40b4b634d1f941f37fc0f7c287dc', 2082, 2, NULL, '[]', 0, '2019-11-09 18:39:37', '2019-11-09 18:39:37', '2019-11-24 20:39:37'),
('03b75139f19dd45cc591886c24e433c3e8670682f0119ad9e1368f7b04ed4c596f92e7e909624f8b', 2083, 2, NULL, '[]', 0, '2019-11-09 19:03:47', '2019-11-09 19:03:47', '2019-11-24 21:03:47'),
('d1b87a083336de7f1357237c6240a1a8d771bcadb7b5e6ee38a644584716eb9a5743b603f1e7f5d5', 2084, 2, NULL, '[]', 0, '2019-11-09 19:05:35', '2019-11-09 19:05:35', '2019-11-24 21:05:34'),
('7f153a233fb7a23c201c0e7cff122504907e23a2a3abd750b3e9adf4c63ab7e839a071d2d5c4ce6e', 2085, 2, NULL, '[]', 0, '2019-11-09 21:42:02', '2019-11-09 21:42:02', '2019-11-24 23:42:02'),
('087e2b8a600f7747300c7fe88ca2b0dbf2ae5df56e0696684f7ac121f60f4241475fe8ec8762cc94', 2086, 2, NULL, '[]', 0, '2019-11-09 22:22:04', '2019-11-09 22:22:04', '2019-11-25 00:22:04'),
('726d40e1856093c1c39950e4786e4a70d32288d53c77f46ddfe86de8d55d063304e381933ad6a8fb', 2061, 2, NULL, '[]', 0, '2019-11-09 22:37:49', '2019-11-09 22:37:49', '2019-11-25 00:37:49'),
('16697d4b1186adcdaf04cede6f0632bdcfc3458e540ff533c52a6da141137c8125f25efeefe01a51', 2087, 2, NULL, '[]', 0, '2019-11-10 05:05:41', '2019-11-10 05:05:41', '2019-11-25 07:05:41'),
('05f7c346910dfc50e6a16de3656945ad4076937f7bae0c2e7069c332235a1f3ed768e57f86664064', 2088, 2, NULL, '[]', 0, '2019-11-10 05:44:32', '2019-11-10 05:44:32', '2019-11-25 07:44:32'),
('37b9809f82e789e647021beb0608a90df6af9f675da63adba3f1d337a9148eed3c20431e963dfbb3', 2089, 2, NULL, '[]', 0, '2019-11-10 06:41:59', '2019-11-10 06:41:59', '2019-11-25 08:41:59'),
('dedd672dfed3241c5e362335c929a92cdb667caf6ce2594b0d2d2100616d748c06c5a86b2dcd7c86', 2090, 2, NULL, '[]', 0, '2019-11-10 09:16:39', '2019-11-10 09:16:39', '2019-11-25 11:16:39'),
('17634d5906952c722fcb03a14947987a5d60928b6cbb89e1fadd4a57a4990a0b957d4c98d49d7e5f', 2091, 2, NULL, '[]', 0, '2019-11-10 09:26:46', '2019-11-10 09:26:46', '2019-11-25 11:26:46'),
('bd8d8e35996b9e8876ffb0a7649536740f178a3d514e27673945bec0f20b39f3e8b2d64243c15faa', 2070, 2, NULL, '[]', 0, '2019-11-10 10:00:04', '2019-11-10 10:00:04', '2019-11-25 12:00:04'),
('7007982d67fc09a3a79e9ee36572f2811419f2ca6d42117121368c57d12b4a2fd31b7f084640a2bf', 2092, 2, NULL, '[]', 0, '2019-11-10 10:06:30', '2019-11-10 10:06:30', '2019-11-25 12:06:30'),
('a5ff38228f0348fd39774544b5c499cfafcc9dc40f70665a421572d204f16695777589a99526089d', 2093, 2, NULL, '[]', 0, '2019-11-10 10:39:52', '2019-11-10 10:39:52', '2019-11-25 12:39:52'),
('9b0c454a5922bd9c4da41359f6c40f8bafbb54905b4d1854cf180d394931a16ecd50b6c6b1d9c523', 2094, 2, NULL, '[]', 0, '2019-11-10 12:27:32', '2019-11-10 12:27:32', '2019-11-25 14:27:32'),
('9c3e446e42ef68d05fbe48f9e743560805c3c7f08082542df0ec73e35f3041f16c657d40a5606ed1', 2095, 2, NULL, '[]', 0, '2019-11-10 12:38:00', '2019-11-10 12:38:00', '2019-11-25 14:38:00'),
('d048dd682250d27774f9b18e02daab0363561653fb78696d9134470bdf691fb6c17846cb6e319a41', 2096, 2, NULL, '[]', 0, '2019-11-10 15:02:23', '2019-11-10 15:02:23', '2019-11-25 17:02:23'),
('abe1d3dd90c99859f86e2c3732bc189cadbd4943425e6d20679e980223a24d93808837e40ef25cba', 2097, 2, NULL, '[]', 0, '2019-11-10 15:03:20', '2019-11-10 15:03:20', '2019-11-25 17:03:20');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ba82f8d39ef362ba3f45267495af6a249c9326d0d41b67625eb4e1cf890f78235e36648bfa1b8ff7', 2098, 2, NULL, '[]', 0, '2019-11-10 15:10:04', '2019-11-10 15:10:04', '2019-11-25 17:10:04'),
('6eaa268b055fe511f62e0e6a18f16b6985607d756215e71e480203a1b188ae6caadee3a063aa6882', 2099, 2, NULL, '[]', 0, '2019-11-10 15:52:28', '2019-11-10 15:52:28', '2019-11-25 17:52:28'),
('241bfe98791d73ec665a7d28f7e4080fa46e5fef6cc20f4eda241784e8d6c214d22daaba209a403d', 2100, 2, NULL, '[]', 0, '2019-11-10 16:48:55', '2019-11-10 16:48:55', '2019-11-25 18:48:55'),
('590645a1a3db14c18d26b6a741a7c42f846fead58ea0181752352ef4fd4d3a940657eb6faf01661d', 2101, 2, NULL, '[]', 0, '2019-11-10 17:04:01', '2019-11-10 17:04:01', '2019-11-25 19:04:01'),
('87d2128acda35e9f20939a03948079f606e26d05b8345864a250b293a36c5cc4d3cf5a98cc1167be', 2102, 2, NULL, '[]', 0, '2019-11-10 17:26:40', '2019-11-10 17:26:40', '2019-11-25 19:26:40'),
('c22f6e46309c87ef182cd22224301cac39c87671fba93cd8bdc39c305d3967fb88a01ca5a4543b98', 222, 2, NULL, '[]', 0, '2019-11-10 19:20:22', '2019-11-10 19:20:22', '2019-11-25 21:20:22'),
('efdc5d72f043e73507f23eca238b1b85eca223ccb1d77d5c0b20f8f5de2d212b91ef26cc9be389c9', 2103, 2, NULL, '[]', 0, '2019-11-10 19:26:08', '2019-11-10 19:26:08', '2019-11-25 21:26:08'),
('0734b4cb9b90dc99de9eb7b86b8b9ea425fc53ff50894c7dc526f479bcdf704e36138ade09310487', 2104, 2, NULL, '[]', 0, '2019-11-10 19:28:02', '2019-11-10 19:28:02', '2019-11-25 21:28:02'),
('4351cb6ad1507c9c450bc680fc4b0dfc76fac71d8271e704e471d731cbc10937a9b5eeddd9e7d038', 2105, 2, NULL, '[]', 0, '2019-11-11 00:34:32', '2019-11-11 00:34:32', '2019-11-26 02:34:32'),
('3928b46cadab5dc318b2d9189fabd0df29cb3c81883f1a49b77f2fd8ee9fc0e4d1dac639326fa3ec', 2106, 2, NULL, '[]', 0, '2019-11-11 05:14:46', '2019-11-11 05:14:46', '2019-11-26 07:14:46'),
('906be468a6b3f89e94d7100c627333462d2996376c837260690c5d3c51893564991c80dcf77e4c79', 2107, 2, NULL, '[]', 0, '2019-11-11 10:41:55', '2019-11-11 10:41:55', '2019-11-26 12:41:54'),
('000dd4e1de257eb0083d01770b25f82745a834ed1018a9bf47082a7f9d8990403e08441ba15da194', 2108, 2, NULL, '[]', 0, '2019-11-11 10:59:27', '2019-11-11 10:59:27', '2019-11-26 12:59:27'),
('9034cb275630499e8416fd9142ac47e6afe48fa5d8a28b1f8f3adc1c8ac81cce030e7e7237381c53', 2109, 2, NULL, '[]', 0, '2019-11-11 11:29:51', '2019-11-11 11:29:51', '2019-11-26 13:29:51'),
('e13b9c26aab79e93ef94f0b4d2e6a5d893f239d3d594b5e008c8862777a51bb080fe6a2835107bb1', 2110, 2, NULL, '[]', 0, '2019-11-11 11:32:52', '2019-11-11 11:32:52', '2019-11-26 13:32:52'),
('11a35c5753ab1d0e1653a2615bc9b20e68b65209bbdfb780a01bef498a43a20268e84c15e3b61ab2', 2111, 2, NULL, '[]', 0, '2019-11-11 11:46:30', '2019-11-11 11:46:30', '2019-11-26 13:46:30'),
('aca659fd6f93ae4ac597ccfdde42654f1e72a7ca21427b5e298b7a5363e71fb43136821d7410dee5', 2112, 2, NULL, '[]', 0, '2019-11-11 11:48:47', '2019-11-11 11:48:47', '2019-11-26 13:48:47'),
('12a2d1be530d75a6045ff5de21f202ce7e07d11bb36adc4354c1911af42a76232d1fb1849d3ec6a4', 2113, 2, NULL, '[]', 0, '2019-11-11 11:49:44', '2019-11-11 11:49:44', '2019-11-26 13:49:44'),
('e830b7b5225a52cbf49a8e3c34f64f7025e74c1ce8d3eafb827e484f27ff0f20de51fa36e78275ed', 2114, 2, NULL, '[]', 0, '2019-11-11 13:28:00', '2019-11-11 13:28:00', '2019-11-26 15:28:00'),
('a419ba161e69464a1c56cbcf2955ee5c98df07b97f7b75daf0fb995f3cf4e07aff1399a253b5345a', 2116, 2, NULL, '[]', 0, '2019-11-11 14:07:50', '2019-11-11 14:07:50', '2019-11-26 16:07:50'),
('8769773cb35bccc96bf579ed8ee4e46cb89fb3500b49d504ee277f5739392ff664d62ed14b6fd7a5', 2117, 2, NULL, '[]', 0, '2019-11-11 14:30:20', '2019-11-11 14:30:20', '2019-11-26 16:30:20'),
('0ea5b67c15aea174f71934d1fd512b25f9258416c7a4aefd680d71325f27dd2f69481ed3cb5f05fc', 2118, 2, NULL, '[]', 0, '2019-11-11 14:59:51', '2019-11-11 14:59:51', '2019-11-26 16:59:51'),
('2e7b81b2ef07b19b3098997493d4d70562b48d599bb6e17adea34fd7ccba37ad2e0fc85f140bef55', 2119, 2, NULL, '[]', 0, '2019-11-11 17:10:55', '2019-11-11 17:10:55', '2019-11-26 19:10:55'),
('5348f411bf430fbbd802b1fb632f5ed1fe0806d0e852edd278f2384ccdfce4c2fae590fa45717821', 2120, 2, NULL, '[]', 0, '2019-11-11 17:22:22', '2019-11-11 17:22:22', '2019-11-26 19:22:22'),
('928c4a449385e336ec04674fb46a03ee551b6d795a61e323c7c388d5db8738a4574496514e1b3c4f', 562, 2, NULL, '[]', 0, '2019-11-11 17:48:58', '2019-11-11 17:48:58', '2019-11-26 19:48:58'),
('2ab4b641339c15bb4f9dd9e42f3d5f7be4293df35444246cd41e9956669adc7ba84b8bc8ef272da7', 2121, 2, NULL, '[]', 0, '2019-11-11 18:12:37', '2019-11-11 18:12:37', '2019-11-26 20:12:37'),
('752727fd6a011e102af64b3749868c54db32323baa67635fc21ba41304fd59f0dbcb9ffda986fad4', 2122, 2, NULL, '[]', 0, '2019-11-11 20:30:35', '2019-11-11 20:30:35', '2019-11-26 22:30:35'),
('49c72bdf6500e0d56cd6b64612412ed1d7896e08a512ff2a0789481391f2cad9da8e97533b810969', 2123, 2, NULL, '[]', 0, '2019-11-11 20:45:14', '2019-11-11 20:45:14', '2019-11-26 22:45:14'),
('3e50994652886809da9761790662ad67bc49421a1e15162e4bafaa7d0e5abd7f695e1c3df3e7a4a0', 2124, 2, NULL, '[]', 0, '2019-11-11 21:51:52', '2019-11-11 21:51:52', '2019-11-26 23:51:52'),
('6d493ccff75e93d156757ecc9decf83395aa69ee44af938de00d6e47fd976729e45f149ac9a7ce38', 2125, 2, NULL, '[]', 0, '2019-11-12 07:02:03', '2019-11-12 07:02:03', '2019-11-27 09:02:03'),
('9793bb782dae370687b025e39e2a1de22dc781bd322135c90666cf16552f916f181470373137a99f', 2126, 2, NULL, '[]', 0, '2019-11-12 09:11:59', '2019-11-12 09:11:59', '2019-11-27 11:11:59'),
('ac8a9baff7844ac21063ad1ed9a02a00c2a8bb78f87ade163a0b1f2bba53fa0b3599805d2f889dfa', 2127, 2, NULL, '[]', 0, '2019-11-12 10:13:43', '2019-11-12 10:13:43', '2019-11-27 12:13:43'),
('1f13456b44d7ce70a52f405520a753bfdf8a1d62b8c8ec0ba98e97b19072040896b8940e89c6795a', 2128, 2, NULL, '[]', 0, '2019-11-12 10:38:34', '2019-11-12 10:38:34', '2019-11-27 12:38:34'),
('0594455e576a6c1c3772c14f7ab10c22496999ea08ed006e690e869bd9dace040d8737fb074f0360', 2129, 2, NULL, '[]', 0, '2019-11-12 13:33:17', '2019-11-12 13:33:17', '2019-11-27 15:33:17'),
('3fca51350e3aefe005776d415b2486824c8b012e14a9f4ebd71aa2007e21226765c55e7eceb7d03c', 2130, 2, NULL, '[]', 0, '2019-11-12 13:43:03', '2019-11-12 13:43:03', '2019-11-27 15:43:03'),
('9f1ec3065bcfb3fb2960fbb19ef99ac612ac2847d3159df36a94ce10b83f7d9a945ee67214b61946', 2131, 2, NULL, '[]', 0, '2019-11-12 13:49:04', '2019-11-12 13:49:04', '2019-11-27 15:49:04'),
('4ccd71d1858576e70dbe33ebcca6a1067d8cf89e62cca9399ba37a0da0bdd485c141306d42a8dd05', 2132, 2, NULL, '[]', 0, '2019-11-12 13:52:11', '2019-11-12 13:52:11', '2019-11-27 15:52:11'),
('770c5b48ef9c7d1f228cd2329784e56d0317cfaebbd53857874bfa730f2182eb132884128d42775d', 2133, 2, NULL, '[]', 0, '2019-11-12 14:38:53', '2019-11-12 14:38:53', '2019-11-27 16:38:53'),
('1622782014e764fd89d561192df26fce60f49373693c3c3359ef69fda7d8d91801fd21ea013a65b7', 2134, 2, NULL, '[]', 0, '2019-11-12 14:40:52', '2019-11-12 14:40:52', '2019-11-27 16:40:52'),
('d5482c5021dbacf83668b1e8efbfab7f6825f3b8e85466021a12a7de39847c78d972de75c334616d', 2135, 2, NULL, '[]', 0, '2019-11-12 15:35:04', '2019-11-12 15:35:04', '2019-11-27 17:35:04'),
('2387133a312a831a4d20beb779ba8afb8b801934466e077be8a4a66e83dc5cfe3b5e5d17a6cb8cf9', 2136, 2, NULL, '[]', 0, '2019-11-12 15:51:43', '2019-11-12 15:51:43', '2019-11-27 17:51:43'),
('17e314ab22ffae4df12e9e937d03c0b2fd53f36b7397eb133ce87ab59fc46ed4b6d0d79a8764135d', 2137, 2, NULL, '[]', 0, '2019-11-12 16:35:20', '2019-11-12 16:35:20', '2019-11-27 18:35:20'),
('4ef316e075b4fdb3dec7ee42a81f75e184363a43e881cf0ba290fb88c4d7fd75006749566b537c4e', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:22', '2019-11-12 16:44:22', '2019-11-27 18:44:22'),
('42fb4cacad567de36681c0b0ae7a94abab7b6df84df15624cf2b6c00909af7fec8b1794784162c25', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:25', '2019-11-12 16:44:25', '2019-11-27 18:44:25'),
('cbf75de16b740b1a5c03d03634f5c14121fce95d0df0654b03c10a342020219020c0d19ccf804a7d', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:29', '2019-11-12 16:44:29', '2019-11-27 18:44:29'),
('fb05b3d19443acb6be139f2456d433203f81b0268e351f4b25e53cb82c1fb777b5c05f3d23ccd9b0', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:32', '2019-11-12 16:44:32', '2019-11-27 18:44:32'),
('8bf7f0e341dd5d6409e3655dc8ffa5672e47772931e96ddce1a824d8eb5e807e5ed416c86c468819', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:35', '2019-11-12 16:44:35', '2019-11-27 18:44:35'),
('94fb6b2de15b27ade982bd7a1cb2bef3565f5b3fac4880bc828bd19343d50f659152842a898299a3', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:37', '2019-11-12 16:44:37', '2019-11-27 18:44:37'),
('8c13599c357aba51ad9dc1b9d573175a8b18986efcf301be359936c586321c790b7f7cd44855e5fc', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:40', '2019-11-12 16:44:40', '2019-11-27 18:44:40'),
('362477e219aa42de36bd8f03360cf295798b28d7e5e3852b6794b2927fc11e383cba8ddee6344133', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:43', '2019-11-12 16:44:43', '2019-11-27 18:44:43'),
('a74d75f348d97a862206e13c583aa6c5d6c58c95b9e5dd9dc2a3b1543b1de269768c844392a8b899', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:45', '2019-11-12 16:44:45', '2019-11-27 18:44:45'),
('3ae0d0a135eadb22aeb6ba5aecfbb0f92f06823aeeb1273912f65eaefaeade7173e377be1bbe1a44', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:48', '2019-11-12 16:44:48', '2019-11-27 18:44:48'),
('bca525a19ac51d567f3614c5b920421bb9b916b87953f291e289dc4ea65f4d58c674f01c49d7a992', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:50', '2019-11-12 16:44:50', '2019-11-27 18:44:50'),
('f5b1da91370d014add7a3c41d37e4545e5bad577ad57201f4b614915e9448277e3e431d1313bcbdc', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:53', '2019-11-12 16:44:53', '2019-11-27 18:44:53'),
('361d344a8ba8e25c32ba2c30272324c294dc4e0b04c62415e2684178b458c4042100e4403ce63b1b', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:55', '2019-11-12 16:44:55', '2019-11-27 18:44:55'),
('4ee06dcd36a24a216a2e55054fe744c90e3fc752ceadc1362aaf71a9da1a7b21ff4c83b373240a36', 117, 2, NULL, '[]', 1, '2019-11-12 16:44:58', '2019-11-12 16:44:58', '2019-11-27 18:44:58'),
('befb5fdeea199b62b03a5346d53dc026c327203b4ceca0f5eb1c0dbba4bd274dcfffb218f8944426', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:01', '2019-11-12 16:45:01', '2019-11-27 18:45:01'),
('e2cfa7b2148eae1e0f599e5437efd749616dbc8449c65fbf66945aa8802da39a6bdcc9aa95d7bdd1', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:05', '2019-11-12 16:45:05', '2019-11-27 18:45:05'),
('886d0898a96a43ac071d1a67d384f2a3f8cb1fd80d5d487335f10e880d0666d689b958aebcb1628c', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:07', '2019-11-12 16:45:07', '2019-11-27 18:45:07'),
('ad2f3c716ef939447aaafc95aa7f08e572c56cbf04eda4898d86e5d98d77105eba9fd32bcac0a39d', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:10', '2019-11-12 16:45:10', '2019-11-27 18:45:10'),
('f594a39df39d615c7186998f67ec9334dacf1a09d4ba78b41543418b0ef81d3c85f98ec5037ac9e1', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:12', '2019-11-12 16:45:12', '2019-11-27 18:45:12'),
('5f3ab93f259ceb4d5c53031edb7300faa3c83ce1fd1b85ffe5ce04db642c5ef828461258b8501011', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:15', '2019-11-12 16:45:15', '2019-11-27 18:45:15'),
('d0f64634e0030e7ffde2c00c36f4cda973290472be248f9f95a5045ddff7c1aa5d552c8b053d0a89', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:18', '2019-11-12 16:45:18', '2019-11-27 18:45:18'),
('5b74eca514867e07445166b9533922f36fa196c8553b688cfc378f6d4722e5e6a6403c55705a94fc', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:21', '2019-11-12 16:45:21', '2019-11-27 18:45:21'),
('9441c49e2b75d86b634e4cbd6e5802ee8a02fab9c7534a438b6ee9f366e88bcc039e8902b9343df7', 117, 2, NULL, '[]', 1, '2019-11-12 16:45:24', '2019-11-12 16:45:24', '2019-11-27 18:45:23'),
('2cfd8c59f9716468e7cd4ae2f4151826937e10a5acc109f1cb88b82e2862644bfd8f7fb16dd1f6e4', 117, 2, NULL, '[]', 0, '2019-11-12 16:45:27', '2019-11-12 16:45:27', '2019-11-27 18:45:27'),
('648e140d3dca5ff0c13dc2765b116b0297c491f44e75a6268722d5c7fd269eb1ddb700245356e50b', 2138, 2, NULL, '[]', 0, '2019-11-12 17:22:19', '2019-11-12 17:22:19', '2019-11-27 19:22:19'),
('551bce6cd319549d0ef5b6ab53fb5f157b9d9b28791493c0e301d7d4d910d11809ce24a7533e94cf', 185, 2, NULL, '[]', 0, '2019-11-12 17:35:50', '2019-11-12 17:35:50', '2019-11-27 19:35:50'),
('73b3fa94c79b1e4f6e8c697113ebd546b2d6590622a8b1abc592a124da3fd117828fd818d4effde4', 185, 2, NULL, '[]', 0, '2019-11-12 17:35:54', '2019-11-12 17:35:54', '2019-11-27 19:35:54'),
('bb6a60a88e33674742188cef3b46b724504d6a3b391342c68b3c510227ab0438304c6c0f906cf79b', 185, 2, NULL, '[]', 0, '2019-11-12 17:36:07', '2019-11-12 17:36:07', '2019-11-27 19:36:07'),
('e1fc309c792fc2c9e8b41c90805810253ef735ab0a8eaa7a9ce18dd7b590d3b9ffa918e1662dfcec', 185, 2, NULL, '[]', 0, '2019-11-12 17:36:08', '2019-11-12 17:36:08', '2019-11-27 19:36:08'),
('dd4a8860d634a020af26dfc3f157eb6a07d16daf62623f6c45cf637d53116dbffe8a8f1ada7036b0', 1907, 2, NULL, '[]', 0, '2019-11-12 17:38:11', '2019-11-12 17:38:11', '2019-11-27 19:38:11'),
('78b6a9f93dc393bb34ec2fd9cfdcdf856c09effe2bba696fdd746a0685b1cbf414bfede47eb2f921', 1907, 2, NULL, '[]', 0, '2019-11-12 17:39:23', '2019-11-12 17:39:23', '2019-11-27 19:39:23'),
('b38e55b7a11ec20f775dc22c5e2c99f82e7f9c1da433a2c3e6816e4b169c70864a7d2677f456388a', 2135, 2, NULL, '[]', 0, '2019-11-12 17:40:11', '2019-11-12 17:40:11', '2019-11-27 19:40:11'),
('a4cbfe7034e28cc6739898526e52c551b925850dfb18cc3a03aa36cee385389c406e55c40a8aa602', 2139, 2, NULL, '[]', 0, '2019-11-12 17:44:30', '2019-11-12 17:44:30', '2019-11-27 19:44:30'),
('e0eec6bc90c44b28f080825473bb50bf7f5f71e26615726d892645f497b8f0f9a9efeb920c479e54', 1907, 2, NULL, '[]', 0, '2019-11-12 17:45:24', '2019-11-12 17:45:24', '2019-11-27 19:45:24'),
('401f1dfc522b029d1a452cbc43e75613b73dc911989e45503a852c98fa1b5011ad81cf9ab834c32b', 2139, 2, NULL, '[]', 0, '2019-11-12 17:47:19', '2019-11-12 17:47:19', '2019-11-27 19:47:19'),
('bc05b7f4dd9545f7178010389168e52d9bbaee638939401e3a2b4b884ac5976a0ba9e6d871f84b17', 2140, 2, NULL, '[]', 0, '2019-11-12 18:09:00', '2019-11-12 18:09:00', '2019-11-27 20:09:00'),
('7b9ea9d9a942554f160fe85cc848e1df48aa42326218f3866caadb7432f93f9ac303ed4287fe901c', 2141, 2, NULL, '[]', 0, '2019-11-12 19:23:21', '2019-11-12 19:23:21', '2019-11-27 21:23:21'),
('e4d4f1d37dc38095d6fe7fc44e1f1c39c28a5e31e706bcb401b7e6cea52606130da68b7fc05fbf0c', 2142, 2, NULL, '[]', 0, '2019-11-12 20:48:38', '2019-11-12 20:48:38', '2019-11-27 22:48:38'),
('34563ed9970a8d85af45469f9ae30fe307face7362041f940fc05f69dd8cb0753b0cc3f761d64b01', 2143, 2, NULL, '[]', 0, '2019-11-12 21:53:09', '2019-11-12 21:53:09', '2019-11-27 23:53:09'),
('21d70225178a35fb69f7b2faa11889bc769ab6fa912c37a0a3ba4e6f837e8789488d86fbc0935121', 2144, 2, NULL, '[]', 0, '2019-11-12 23:05:41', '2019-11-12 23:05:41', '2019-11-28 01:05:41'),
('cec8d9d11909ab1fbfc2130a08944bcce69024836531dc780b8475c801556379a2c35c657366d1bc', 2144, 2, NULL, '[]', 0, '2019-11-12 23:05:43', '2019-11-12 23:05:43', '2019-11-28 01:05:43'),
('9e7f2dcc695104d8514424c3327a7eff400de5c00c96de9597167e6f0392bd10c6aa86fa59accbb5', 2145, 2, NULL, '[]', 0, '2019-11-13 05:43:33', '2019-11-13 05:43:33', '2019-11-28 07:43:33'),
('f1fcd93b2d37d3a477b95c848028a83a1f0c026d27433089c2597242665c6f862ab495b77e054942', 2145, 2, NULL, '[]', 0, '2019-11-13 05:46:10', '2019-11-13 05:46:10', '2019-11-28 07:46:10'),
('e946b12135b6c8d4d7f723f6742d3cf58e50d06a2e5b51657fd3b2dda9ce66e3e0976349a1d4d6aa', 2146, 2, NULL, '[]', 0, '2019-11-13 06:30:58', '2019-11-13 06:30:58', '2019-11-28 08:30:58'),
('d1972561194415d60c4837f2dc51e826e8b38e2b00536b54b615dbbb362ec431db2de283d449b5cc', 2147, 2, NULL, '[]', 0, '2019-11-13 07:50:03', '2019-11-13 07:50:03', '2019-11-28 09:50:03'),
('59383264d3b8d76a211460a8f31bd90db9a1a616867e31a506abd1bb7c1200247148e7f2d13ac3b9', 2148, 2, NULL, '[]', 0, '2019-11-13 07:58:06', '2019-11-13 07:58:06', '2019-11-28 09:58:06'),
('dca282e8380d62f10e7dadfd69c2bd5680f2b309a08b4e83e7bd65dacb46b296a944a74ca51c02a5', 2149, 2, NULL, '[]', 0, '2019-11-13 08:06:54', '2019-11-13 08:06:54', '2019-11-28 10:06:54'),
('fae46260bea3111b687bca739c0bda871c5f62d77201d3b3fe7111ff850975a7e8e0b803d5784862', 2150, 2, NULL, '[]', 0, '2019-11-13 08:40:46', '2019-11-13 08:40:46', '2019-11-28 10:40:46'),
('be2c2bf2e3fd2aa090bf87cecd85513c81a8e8213d130cd50002a110875ee7fcd120a08d2623f977', 2151, 2, NULL, '[]', 0, '2019-11-13 09:15:58', '2019-11-13 09:15:58', '2019-11-28 11:15:58'),
('0542bab65560e0e4dde4d9303f135509aab122a4702a24648d40a06ee64f68f10688c31c47532e93', 2152, 2, NULL, '[]', 0, '2019-11-13 10:33:23', '2019-11-13 10:33:23', '2019-11-28 12:33:23'),
('66997867c561834c5818beadfbff0adf929e3695b3c9babb2f5fcfe8e8c69f41eedabcbefe8bbb34', 2153, 2, NULL, '[]', 0, '2019-11-13 10:48:54', '2019-11-13 10:48:54', '2019-11-28 12:48:54'),
('672b95089f7692c8e4548d5dc1b0c02db49f0f5d178e9c6f6623321903921610bb7555abbc949abc', 2154, 2, NULL, '[]', 0, '2019-11-13 10:53:41', '2019-11-13 10:53:41', '2019-11-28 12:53:41'),
('698410685990c5305de14178be5d138c69ce03857fa81a56dff8d285085662c2ab8a800ed4652215', 1907, 2, NULL, '[]', 0, '2019-11-13 11:05:08', '2019-11-13 11:05:08', '2019-11-28 13:05:08'),
('31517a10d849a34ab5fb63dc34dc4574283d76ff2980684f98dc19fa58fcf91008c701c302f453fb', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:19', '2019-11-13 11:06:19', '2019-11-28 13:06:19'),
('bc836b109f15961815540d58874d630220eba40cea73fec75bfab0c10b299647ad9b598758b3fecc', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:21', '2019-11-13 11:06:21', '2019-11-28 13:06:20'),
('3ffec638d448355dc43751cad454c991b6083be686c40b223428a942ce7b66cd05a3a1fbfc68fa14', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:24', '2019-11-13 11:06:24', '2019-11-28 13:06:23'),
('05d3ccac96dbd3247a302147f96ddc22b2a01110c66b32dfa7c2d190ef42ed14da974ffa412ed76a', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:27', '2019-11-13 11:06:27', '2019-11-28 13:06:26'),
('848e4c30fe79fb9312672ce1a64048a1212a27bf6da81aac78405d807df9c0b7d833c2d481de6b2a', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:31', '2019-11-13 11:06:31', '2019-11-28 13:06:30'),
('974d4e35c2ea4bc0918d3a755abcdb68b84906821ab8114f82787bd07097b4bc6ca236eb08be4067', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:34', '2019-11-13 11:06:34', '2019-11-28 13:06:34'),
('7a7539f70deb61975272018b9260e10327766d7a1c4767a6cfd4b928239288a88fba184d80457440', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:37', '2019-11-13 11:06:37', '2019-11-28 13:06:37'),
('19a45627999af8aa800c6f58a4d2da720302a90f62701334673717c7eb1587f660231015873c22a5', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:40', '2019-11-13 11:06:40', '2019-11-28 13:06:40'),
('7653b14f1afa4b5ca5a571bb5305b74c069dc570d77c5aff9ef7829f2f08f5b154e7bd71fa74130e', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:43', '2019-11-13 11:06:43', '2019-11-28 13:06:42'),
('a28b432f2e2a389c0baf5d31f9e1bf101d6253bc871e5d4fafbf051ccaf39eccb3c04eda8ded896d', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:45', '2019-11-13 11:06:45', '2019-11-28 13:06:45'),
('18ec589cd4789b19dd1b3523d4975f1c57dbedd12cd7e447fce968fb377b16b03b1b5e4548143aaa', 183, 2, NULL, '[]', 1, '2019-11-13 11:06:48', '2019-11-13 11:06:48', '2019-11-28 13:06:48'),
('30aee8a410a598ec32f3ac2a9b18d3320b58210e4249184504bc8adca13b805c13630fee6690da31', 183, 2, NULL, '[]', 0, '2019-11-13 11:06:51', '2019-11-13 11:06:51', '2019-11-28 13:06:51'),
('40b10f4abfffcc62fe35e21f48f817fc25c9e46e36f2d3c19bb2cad8cb73bdaeb3f74521ceb7216c', 2155, 2, NULL, '[]', 0, '2019-11-13 11:18:06', '2019-11-13 11:18:06', '2019-11-28 13:18:05'),
('9c428654d83c5bdcea03ead6f180c55372e658bda37c70359c56027ca11721e5d50a6ff9e710c6f5', 2156, 2, NULL, '[]', 0, '2019-11-13 11:39:53', '2019-11-13 11:39:53', '2019-11-28 13:39:53'),
('46cd1329aadcc0c2da2d6337d6c2ebd7f04256cb1ca3693827c4dd51f24849cf4d0fb80e5a05afbc', 2157, 2, NULL, '[]', 0, '2019-11-13 13:38:56', '2019-11-13 13:38:56', '2019-11-28 15:38:56'),
('46a41bf7804ae00fcb6419bc30ddebd53f9dde8fb9c43c91d42cfcf3f58c91a17af6c4152d03d47d', 2158, 2, NULL, '[]', 0, '2019-11-13 15:07:16', '2019-11-13 15:07:16', '2019-11-28 17:07:16'),
('ee58504da897c771202af83522296f4d6551f7b45db75573d6a59929e4af426239ba26c39bca46d1', 2159, 2, NULL, '[]', 0, '2019-11-13 15:24:20', '2019-11-13 15:24:20', '2019-11-28 17:24:20'),
('22370dc25ce3d7fae8b314ee56264f6b8538320d9056cb49ed09c79c4f41f7b674006e22e46538d1', 2160, 2, NULL, '[]', 0, '2019-11-13 15:41:26', '2019-11-13 15:41:26', '2019-11-28 17:41:26'),
('5a775509928bc1820d477a37a2a4ce05e4fa078cd25887613fec317e6f870c616747c02630e6bea6', 2161, 2, NULL, '[]', 0, '2019-11-13 15:59:33', '2019-11-13 15:59:33', '2019-11-28 17:59:33'),
('a23029894531a7343ca2f99371fcfce9ef63524c8d43bd65a1e7ac415f9f39d91e365c5be0ad0b9f', 2162, 2, NULL, '[]', 0, '2019-11-13 16:51:33', '2019-11-13 16:51:33', '2019-11-28 18:51:33'),
('0c7f13d1680e70f07ab2f738acc7884bc63129ad910a524b261e3f851345d5df9ca1beb542e7d7fc', 2163, 2, NULL, '[]', 0, '2019-11-13 17:34:18', '2019-11-13 17:34:18', '2019-11-28 19:34:18'),
('6a90f8c05e14f602158edfb37e31e81390f3b2f902c7a498d066f27155fc981d373c7187e89ae9b9', 2164, 2, NULL, '[]', 0, '2019-11-13 18:07:48', '2019-11-13 18:07:48', '2019-11-28 20:07:48'),
('4e914d11c37c8ba5f008c8a1bc1eb4d9bdd24666e091ae830d17bbfee9a32d724bb6718c5a50862f', 2165, 2, NULL, '[]', 0, '2019-11-13 18:13:43', '2019-11-13 18:13:43', '2019-11-28 20:13:43'),
('d0ff780f6ab880de0414688facedb00de4a2867474b46b46407bd392d0e749ab8668cef2660d2f8f', 2166, 2, NULL, '[]', 0, '2019-11-13 18:17:11', '2019-11-13 18:17:11', '2019-11-28 20:17:11'),
('67f2369cf59494ed88b30d728fb92ea697e98350b75b5f36b0e3c456e7111c747427d11734e79bb3', 1907, 2, NULL, '[]', 0, '2019-11-13 18:26:16', '2019-11-13 18:26:16', '2019-11-28 20:26:16'),
('a663b5158a220fdbb3243bc2e2207eaf39ad79637f2ced56b0043a606c7e4a4ef553396daae60567', 2167, 2, NULL, '[]', 0, '2019-11-13 18:32:43', '2019-11-13 18:32:43', '2019-11-28 20:32:43'),
('88813e667ec4a936dd44fa0ccfe2e926ec92e9d112d282ef44294aa6e09ababca44ba50cef99e18b', 2168, 2, NULL, '[]', 0, '2019-11-13 18:47:49', '2019-11-13 18:47:49', '2019-11-28 20:47:49'),
('8864b11eaa8717b3c3ade4f7ac4cb1f385d0cf42680a07c3aa168293cef3c3f5e1704ec6027c4607', 2169, 2, NULL, '[]', 0, '2019-11-13 19:20:42', '2019-11-13 19:20:42', '2019-11-28 21:20:42'),
('4e6a956319c06e69ff62e349d8d9b27620e6394b4d502419cac8692cfb4a5d495a9e46a163078bfd', 2170, 2, NULL, '[]', 0, '2019-11-13 20:52:05', '2019-11-13 20:52:05', '2019-11-28 22:52:05'),
('a06843a913cd0c8050e8f51848b3934acd560fb21f2351ee6288dc3840499d6a21b15152c2801ad2', 2171, 2, NULL, '[]', 0, '2019-11-13 20:52:35', '2019-11-13 20:52:35', '2019-11-28 22:52:34'),
('0bc844acba9f444ed03a0aca1a63a9b92f29a5dc015df58884d8a77df24024d74f609bf5605942cd', 2172, 2, NULL, '[]', 0, '2019-11-13 21:10:26', '2019-11-13 21:10:26', '2019-11-28 23:10:26'),
('583837f9cb8e81de95856897898baf2becd67681da4f608720c317efe282dc554bc16aa60c9f81c7', 2173, 2, NULL, '[]', 0, '2019-11-13 22:40:28', '2019-11-13 22:40:28', '2019-11-29 00:40:28'),
('d4796fceb1fbb0cc4472cb0f63e161518fad5dfd65649917bf374c426afb1cd522e71ffa468bd1d5', 615, 2, NULL, '[]', 0, '2019-11-14 07:42:01', '2019-11-14 07:42:01', '2019-11-29 09:42:00'),
('2e0ced15e6e25245d1c3fbeac2be9affd4d8fce0f454f1fb44865b69b35f5a1f5d95a2a8ef98bb7f', 615, 2, NULL, '[]', 0, '2019-11-14 07:42:04', '2019-11-14 07:42:04', '2019-11-29 09:42:04'),
('4142670c1fc1d8bb6711275a193a11d87d12c97092185cab3be68929a42477b4694205901401d451', 2174, 2, NULL, '[]', 0, '2019-11-14 09:01:10', '2019-11-14 09:01:10', '2019-11-29 11:01:10'),
('abd8cc12c89a695ef6fa35c8705a16609fd4b61cd7ea5c4508ec394d5cee23f617cb62a88eec4552', 2175, 2, NULL, '[]', 0, '2019-11-14 10:23:16', '2019-11-14 10:23:16', '2019-11-29 12:23:16'),
('9ae35399cfa84115662c37817e94a93a73a2e26a22ab0afba82960ed81d35911c644ede123f0382f', 2176, 2, NULL, '[]', 0, '2019-11-14 10:43:45', '2019-11-14 10:43:45', '2019-11-29 12:43:45'),
('1c49d675b651f0d818be63799c3229580d7f1b8f8e488df6e4089c541ddaa46c87007fcb81d9cb0c', 2177, 2, NULL, '[]', 0, '2019-11-14 10:55:16', '2019-11-14 10:55:16', '2019-11-29 12:55:16'),
('f57bb53909da9d8c1715f540ce5d3d2053b2c63feeb479a7554dc0cb53ab4770bcb585ab70a426d9', 2179, 2, NULL, '[]', 0, '2019-11-14 11:31:29', '2019-11-14 11:31:29', '2019-11-29 13:31:29'),
('c14e2e908be77237b60f03a1ae43edd8e3560fe6360ea5bcd13c863358e2ac125691ee27115ad17e', 2132, 2, NULL, '[]', 0, '2019-11-14 12:33:34', '2019-11-14 12:33:34', '2019-11-29 14:33:34'),
('bc44f48c407b918f823df1fa39db6ccc9011799f325590cd1435962e749224a1963133c0f0002519', 2180, 2, NULL, '[]', 0, '2019-11-14 12:38:43', '2019-11-14 12:38:43', '2019-11-29 14:38:43'),
('3d0cb5836135e2dbdac5b294c07c1098a793820638c13178cc04c990370f4cb24fcebd921f8185fb', 2181, 2, NULL, '[]', 0, '2019-11-14 12:52:26', '2019-11-14 12:52:26', '2019-11-29 14:52:26'),
('acbe942cee5758f9311bd053e00a770c6bfed0a70de4f0434476b24b467e609f4146954742dc692f', 2182, 2, NULL, '[]', 0, '2019-11-14 13:14:25', '2019-11-14 13:14:25', '2019-11-29 15:14:25'),
('827d43fcfd70fbb7d0b73249cc323da0e9314f95fa8d3eb06ea6edeb2fcbb85f5d09fa64af6d8a2c', 2183, 2, NULL, '[]', 0, '2019-11-14 13:40:59', '2019-11-14 13:40:59', '2019-11-29 15:40:59'),
('43595677e07fd91cb5390622892df6e65917e7fa41e172d99a856adbf754d1caaefb714d061eba67', 2184, 2, NULL, '[]', 0, '2019-11-14 14:07:52', '2019-11-14 14:07:52', '2019-11-29 16:07:52'),
('72327da32d147767ccb35c2474438f23c9e632840b03861aaf6e865dea9ceb1133fdbac4b6401ed2', 2185, 2, NULL, '[]', 0, '2019-11-14 14:34:05', '2019-11-14 14:34:05', '2019-11-29 16:34:05'),
('07961290a23080cd8cea104de477094036940988a759a186b973a84b8708387f4c4725ff686226a2', 2095, 2, NULL, '[]', 0, '2019-11-14 14:34:27', '2019-11-14 14:34:27', '2019-11-29 16:34:27'),
('ea097c828d8ac48298e8f7430ff76f22ef8e22220b0fa83db14d991ec8ed8547a3cb1bb64e02dd42', 2185, 2, NULL, '[]', 0, '2019-11-14 14:52:44', '2019-11-14 14:52:44', '2019-11-29 16:52:44'),
('d4e64340274910d3ba1ca7da0f18d19dbcc7185846bc1c3c1f82dee09a09e0c410394d988b9d9e6d', 2185, 2, NULL, '[]', 0, '2019-11-14 14:54:27', '2019-11-14 14:54:27', '2019-11-29 16:54:27'),
('f7d2d9dfb11020c19d2cf27f95120c5e4cf2697f8c048d2a89a772fe2462378d7ac6316e81043738', 2185, 2, NULL, '[]', 0, '2019-11-14 14:56:32', '2019-11-14 14:56:32', '2019-11-29 16:56:32'),
('b83c858ea90648f7ff016e567c8e940c733b0f63f99f213345dcca329f011093f87433ea4cc0c701', 2186, 2, NULL, '[]', 0, '2019-11-14 16:11:59', '2019-11-14 16:11:59', '2019-11-29 18:11:59'),
('31741fbe6f29af9e310df2c51377f29a821393b7cb2afb1ab93a77c235d9954baaff7659d843b9ac', 2187, 2, NULL, '[]', 0, '2019-11-14 16:41:23', '2019-11-14 16:41:23', '2019-11-29 18:41:23'),
('87f91ba1d1e75ea943327a736081d84ef87048962b0f0d1b8ea4f593865bc8eade58343b81f68733', 2188, 2, NULL, '[]', 0, '2019-11-14 17:45:38', '2019-11-14 17:45:38', '2019-11-29 19:45:38'),
('c8fcdf387cc5d62063e8b8069f176a67cd17e2dfc77a5e026c1859580985755e971cc3cc8fc17ad3', 2189, 2, NULL, '[]', 0, '2019-11-14 18:08:45', '2019-11-14 18:08:45', '2019-11-29 20:08:45'),
('46f9088190f4f14a7678121ecc2d9068962c4c65540ed7cd1dc7ada7dcc016d65de0ed8527fa8324', 2190, 2, NULL, '[]', 0, '2019-11-14 18:33:23', '2019-11-14 18:33:23', '2019-11-29 20:33:23'),
('4c09da8a2a2e4497a748daa49254ee7d9055c7dbf4f5f9820b5d6450ba0b2dc240cfdba17c73a1c0', 2191, 2, NULL, '[]', 0, '2019-11-14 19:47:09', '2019-11-14 19:47:09', '2019-11-29 21:47:09'),
('b03981a384f97bc572f19b344fc78008ce40dc1cd6b0a4ba6a43183b32f34c1607814322541d2ff5', 2192, 2, NULL, '[]', 0, '2019-11-14 20:36:03', '2019-11-14 20:36:03', '2019-11-29 22:36:03'),
('3c8f383130f187c2a254b10493c2eaa8c649ca2aabb28771827e1a320e4be84e82d241f985457ccf', 2193, 2, NULL, '[]', 0, '2019-11-14 21:10:59', '2019-11-14 21:10:59', '2019-11-29 23:10:59'),
('83826ebb5f81b8fee7f45f4d33a2917e09426c1e2d87816b2f49a7d6592a14d92d254b072c366469', 2194, 2, NULL, '[]', 0, '2019-11-14 21:27:21', '2019-11-14 21:27:21', '2019-11-29 23:27:21'),
('6b1304e0b148b143b51ab10b1a572717724ceb276b3ca674e916b8148dd78cff68e4146bb42d42c0', 2195, 2, NULL, '[]', 0, '2019-11-14 22:41:21', '2019-11-14 22:41:21', '2019-11-30 00:41:20'),
('1a98ca273b3547f43921ddadf3bbc4c9bd28cdf60d03f45d1f053e5ea3567733c8c59f6081c73243', 2196, 2, NULL, '[]', 0, '2019-11-15 09:08:47', '2019-11-15 09:08:47', '2019-11-30 11:08:47'),
('525298bc2f8a6f4757b93ba390ea6ce01a2cd495bfe1775fc76b354cebb440393c088fb60f6402d0', 2197, 2, NULL, '[]', 0, '2019-11-15 14:55:29', '2019-11-15 14:55:29', '2019-11-30 16:55:29'),
('ffd4e78489aae8892b2e04cf78d50391e2375d3f168637982ff38f7a70a23d7226bc03016ffafd23', 2198, 2, NULL, '[]', 0, '2019-11-15 16:13:17', '2019-11-15 16:13:17', '2019-11-30 18:13:17'),
('8fda2851490cba06c19af2964e2bdfd0238cc8682732a8df5b19d91d1ccf9b8d6415a0501bb34b79', 2199, 2, NULL, '[]', 0, '2019-11-15 19:22:45', '2019-11-15 19:22:45', '2019-11-30 21:22:45'),
('f353f3c0a227544e2129bcadaa6595d63c27d68e84d6459b1bfd95000bd5f42f54413b3a0ad721a2', 2200, 2, NULL, '[]', 0, '2019-11-16 09:14:07', '2019-11-16 09:14:07', '2019-12-01 11:14:07'),
('ec2efc83073cc33f6f0baf9480ee4700f2fb11f04b233911db85658dd7a15625ade31e1e8d4f267f', 2201, 2, NULL, '[]', 0, '2019-11-16 11:43:32', '2019-11-16 11:43:32', '2019-12-01 13:43:32'),
('6bc97efd2e3de2f39df9cf597851d6978d8c8be395595a7629cabbe642c2db18d4ea7eb7ab54bb19', 2202, 2, NULL, '[]', 1, '2019-11-16 15:06:03', '2019-11-16 15:06:03', '2019-12-01 17:06:03'),
('6881a9a9736026494cea261344de0869638555b360f7006869ab36ae109ac460861576e0c9c52b2e', 2203, 2, NULL, '[]', 0, '2019-11-16 15:46:32', '2019-11-16 15:46:32', '2019-12-01 17:46:32'),
('9e5205c540f86a3666a42998482cb7001034e6caaece3350a515a42467bb5eddd8930ec899b73854', 2204, 2, NULL, '[]', 0, '2019-11-16 18:58:49', '2019-11-16 18:58:49', '2019-12-01 20:58:49'),
('fbf6f99b9a654c5f364a749426b99b06f44eccaaf3604c4b2faa0e36c00a5e4774ac09a7856daf2e', 2199, 2, NULL, '[]', 0, '2019-11-17 09:52:52', '2019-11-17 09:52:52', '2019-12-02 11:52:51'),
('7f3eac47b3cedaef54d1d1c66dd184f1d070e962bd6762a6e107198b6e51e8e38dea08ee869d8e36', 2205, 2, NULL, '[]', 0, '2019-11-17 14:24:18', '2019-11-17 14:24:18', '2019-12-02 16:24:18'),
('d08366512b6283f5c6bda4197bef60dc9e2b941f219eae0d304e6f67267142d4495a13d8f9cd5c5a', 2206, 2, NULL, '[]', 0, '2019-11-19 01:22:29', '2019-11-19 01:22:29', '2019-12-04 03:22:29'),
('279b47bae04ae940bcb7421db052c99d506309f10f7b64fd442058de0d5fcc79e5391e89f6cc5b7e', 2207, 2, NULL, '[]', 0, '2019-11-19 16:34:55', '2019-11-19 16:34:55', '2019-12-04 18:34:55'),
('93a05a1dff52d2d18fad86125932f88503de022ee8f901abb2df4bd14fc8fd704fc09223c1235724', 2202, 2, NULL, '[]', 1, '2019-11-20 09:23:59', '2019-11-20 09:23:59', '2019-12-05 11:23:59'),
('80543583ccdba5e1e16707885864fd08846efa9320e55623c235c3d04ec673b601575fdb7a4acc81', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:03', '2019-11-20 09:24:03', '2019-12-05 11:24:03'),
('d3d3ec09167dfeebbb8d95f58a6db04ffbd16ff63059041157372c70faba01a7b890715eec968d6c', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:07', '2019-11-20 09:24:07', '2019-12-05 11:24:07'),
('d192fc48a64e3eeb63caf8f314601677ea52c3b8318e4c4bb1317fb1352a8cb081a8e6488087fee5', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:11', '2019-11-20 09:24:11', '2019-12-05 11:24:11'),
('f3ce9cff9e3c0b57785c7ac93406b4ccad6163dd1dd2d37d61fb56bd51ce7a50d274023d1e826495', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:13', '2019-11-20 09:24:13', '2019-12-05 11:24:13'),
('3a2a5dc91d1727fa3255cc40e194cd64bd410c60377d3c0dbd9b2b44236ba23e7a2a0062b8790340', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:14', '2019-11-20 09:24:14', '2019-12-05 11:24:14'),
('378497b32760837c6d7eed22afd15c08e7a23a01c9aca7d6c57b0fa00b0a1915d1b484fdf5157bea', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:15', '2019-11-20 09:24:15', '2019-12-05 11:24:15'),
('85c3b24fcb92d829604aabb8750a4e7e2992d2941a4247ea6e12f83a8b6ae436fef49b66a3d66fdc', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:17', '2019-11-20 09:24:17', '2019-12-05 11:24:17'),
('21daf3f2659583e51ce29478a4a83821c678faca091f3f0d1bd6941366b1ab7a9676c6802a7a235b', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:18', '2019-11-20 09:24:18', '2019-12-05 11:24:18'),
('5ee989eb82a0a596bdf5e6a0c3ef16f6887217d67c5b574529eedd1a536fdadbdbba6a7256de3a7f', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:20', '2019-11-20 09:24:20', '2019-12-05 11:24:20'),
('534d0b355e06c690a27bbcdef8693b9e182af191c290402b75e7d7a04a131dfe4f05c22270c64b74', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:21', '2019-11-20 09:24:21', '2019-12-05 11:24:21'),
('85b0cfef60ac56849265822cda310c3ea9ba693e634e0515977543d539302d39bc428d2cc76b0a6c', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:22', '2019-11-20 09:24:22', '2019-12-05 11:24:22'),
('094f9ffc24311a40931eb5c57f2a3741b4dc6dc0ec00f4061ab4f8cf8b145cded9831fc690f9fa53', 2202, 2, NULL, '[]', 1, '2019-11-20 09:24:24', '2019-11-20 09:24:24', '2019-12-05 11:24:24'),
('6e8463814c81695c84c87374bc8613540b0d453c00f8cb34df86fc13e01082a7ea6188fd25a4d644', 2202, 2, NULL, '[]', 0, '2019-11-20 09:24:25', '2019-11-20 09:24:25', '2019-12-05 11:24:25'),
('05fb4d06255072f93a983f032f9f5ad44ad6fb01a212861dbc5e7b16b519b9e28e9c388f62164576', 2208, 2, NULL, '[]', 0, '2019-11-20 09:24:58', '2019-11-20 09:24:58', '2019-12-05 11:24:58'),
('a2371dd15c482ecf9691a8dff578b2fa7257c6474f6589afcc4746d218edc665e7e336721ad85527', 2197, 2, NULL, '[]', 0, '2019-11-26 20:08:18', '2019-11-26 20:08:18', '2019-12-11 22:08:18'),
('293b831ac90cbd952c3d645dd691cfbe19f9c075a07f5c266d49eb0b5cb392ae0a485894cbdb4e72', 2198, 2, NULL, '[]', 0, '2019-11-26 22:21:32', '2019-11-26 22:21:32', '2019-12-12 00:21:32'),
('efdd1d9f39abf047453769e6e4b213f6e6e804b12c4d4b1767677b1aa8352c65dc4570998548d61d', 2197, 2, NULL, '[]', 0, '2019-11-27 08:18:09', '2019-11-27 08:18:09', '2019-12-12 10:18:09'),
('68a479e11ba8cfe227857fa1d5631b77ad669920218847a2414f5c81e3abe40a7b2bea0c06e2711d', 2197, 2, NULL, '[]', 0, '2019-11-27 18:22:52', '2019-11-27 18:22:52', '2019-12-12 20:22:52'),
('710007804f8d54c1a70a1fafff81e69cf7c2f347270ef1ac083b73c1de2ee64e981c281fc9dc2638', 2198, 2, NULL, '[]', 0, '2019-11-27 19:08:41', '2019-11-27 19:08:41', '2019-12-12 21:08:41'),
('f84e7a20671e058c266670cd115a12e8cb9fa4792603111ed45ff99335e7df991dcf96f3940b39ab', 2210, 2, NULL, '[]', 0, '2019-12-01 21:20:28', '2019-12-01 21:20:28', '2019-12-16 23:20:28'),
('2a67fce241484388076ed92a5ed6acc60a87a474376d78ef1ddc98845a7ee51cf0d80283944a7df4', 2197, 2, NULL, '[]', 0, '2019-12-01 21:35:22', '2019-12-01 21:35:22', '2019-12-16 23:35:22'),
('d1d68de83c0d340fae769831a40ae0d3dfcd89c1b53c926c36d91309b6233b278c8d9859ef3d4ad9', 2197, 2, NULL, '[]', 0, '2019-12-01 21:36:33', '2019-12-01 21:36:33', '2019-12-16 23:36:33'),
('cd3cbf1e872154cd656334f627f1859a61eb27fe22f12ad6bcb78663a78fc353cff4c77282d4f85f', 2197, 2, NULL, '[]', 0, '2019-12-02 17:59:23', '2019-12-02 17:59:23', '2019-12-17 19:59:23'),
('29a5195b063a847ab3d65d2553bff56b415225939b0cf76946e64b1be29b87abbf81c1e39f264494', 2211, 2, NULL, '[]', 0, '2019-12-02 18:59:04', '2019-12-02 18:59:04', '2019-12-17 20:59:03'),
('01414d4270fd012aa80590b484d8b6d8334befb5dbb15d80c274c6bbfb9d6b61da70026b10819438', 2212, 2, NULL, '[]', 0, '2019-12-03 18:00:26', '2019-12-03 18:00:26', '2019-12-18 20:00:26'),
('4d5664b05807c8efd6045c04d5d9a61d8e5dd3c97ebab3f7b197601715c618aeb5ad917af9cdd44a', 2200, 2, NULL, '[]', 0, '2019-12-03 19:30:43', '2019-12-03 19:30:43', '2019-12-18 21:30:43'),
('840040bd691f5418b1bafa5bfbe7c7f96ffba1dcff787b1fdf2e5fa6675e158a732ce399949c56b1', 2212, 2, NULL, '[]', 0, '2019-12-03 19:49:41', '2019-12-03 19:49:41', '2019-12-18 21:49:41'),
('98fcee081ad7da104dd3ced27c0187e9c223dd5d06be9bc831fed7b56a5e6e72513ccf039fa1a4cc', 2197, 2, NULL, '[]', 0, '2019-12-05 20:42:02', '2019-12-05 20:42:02', '2019-12-20 22:42:02'),
('8b86e74d24bba8e74fb140c4d38514f03f8ab291aa9f693e5f3d2add5c8f64ffcb743595503b2029', 2197, 2, NULL, '[]', 0, '2019-12-06 11:10:34', '2019-12-06 11:10:34', '2019-12-21 13:10:34'),
('34dab46c2e1b876917f5ce0dfea3d778f4d68a6721607ffb85facc44d368f0a5f96269500771b8d6', 2197, 2, NULL, '[]', 0, '2019-12-06 11:20:13', '2019-12-06 11:20:13', '2019-12-21 13:20:13'),
('2a00bb714356ebe0d1d914189d1505c61dce9048b634da634e3b05d875cdd857b30dfda75b7aa70d', 2197, 2, NULL, '[]', 0, '2019-12-06 11:20:14', '2019-12-06 11:20:14', '2019-12-21 13:20:14'),
('babe0aa05af5340e13e271a2c8c02bba14a42e8b30835f6c45c4e713b6c57dcf46dd2bca2cc53375', 2197, 2, NULL, '[]', 0, '2019-12-07 02:44:55', '2019-12-07 02:44:55', '2019-12-22 04:44:55'),
('175cbf24f1b470e97c896e7244a6afd262ad49583df8b405bbd1e6d4cdef944afa7b66cbbec862d1', 2213, 2, NULL, '[]', 0, '2019-12-08 01:48:07', '2019-12-08 01:48:07', '2019-12-23 03:48:07'),
('638aad8f42cf0dde24fc173688892fb02487e91f3a79bb5459e0e1cd5228cb401d7272f253e4aec4', 2213, 2, NULL, '[]', 0, '2019-12-08 01:49:03', '2019-12-08 01:49:03', '2019-12-23 03:49:03'),
('3273dd04719006c8ee72da0122a649257e6aa0b0ae0d40595915ad5b9033cb17ccd5a0c31c43dfd8', 2214, 2, NULL, '[]', 0, '2019-12-08 02:54:30', '2019-12-08 02:54:30', '2019-12-23 04:54:30'),
('4f9801f82ea034c2a756979ac9d95ca3d6b8a8983e5876bbf14097a539840e64a59411c2a5c94c5b', 2213, 2, NULL, '[]', 0, '2019-12-10 22:54:50', '2019-12-10 22:54:50', '2019-12-26 00:54:50'),
('fe5ea2bc734d85e0fa3d335fe95bddc9f70c1cc511c554565992e5a32f89d7c2f2f69fcd96e9eb94', 2213, 2, NULL, '[]', 0, '2019-12-10 23:23:05', '2019-12-10 23:23:05', '2019-12-26 01:23:05'),
('de61667fdad7a00d28d3919bd115ba494a743615f33a4eb847be13d9b959dc56410e3dbd74d0fef2', 2213, 4, NULL, '[]', 0, '2019-12-11 14:31:00', '2019-12-11 14:31:00', '2019-12-26 16:31:00'),
('6dd47481342ca9d882aee9c0c214fb3c4c6d6f5a53e152dc1eb1f442393710b401cad15614738c84', 2, 4, NULL, '[]', 1, '2020-01-17 20:40:40', '2020-01-17 20:40:40', '2020-02-01 22:40:40'),
('4a93d3829ede405f4d2942333451437a5c93106a4f79431e43d456e33cfcdf01e19ea28cb56f0d7f', 2, 4, NULL, '[]', 0, '2020-02-15 13:52:44', '2020-02-15 13:52:44', '2020-03-01 15:52:43'),
('f0f7e0c0d965f7720380b87da88961a8d61422b816ee29804229bd61b4a4a250504f550e71c1ec73', 2, 4, NULL, '[]', 0, '2020-02-16 16:54:48', '2020-02-16 16:54:48', '2020-03-02 18:54:48'),
('d10f532188c992c47167334ac31de3c099534723f1684f212d1e8946152af8c24bb4891a96e0f15e', 3, 4, NULL, '[]', 0, '2020-02-16 18:33:23', '2020-02-16 18:33:23', '2020-03-02 20:33:23'),
('7654e03021e4ee4d63f78ec34bde78fcbd90a05f892cb8cb93d95e71d4091555f3ff8e7f40c2d95d', 2, 4, NULL, '[]', 0, '2020-02-17 05:35:17', '2020-02-17 05:35:17', '2020-03-03 07:35:17'),
('bbf5624b35e02d95686c6161179c49d5a89d3f935bc07ff7ddf6ab87ef44e364fd27e1e46404ab99', 4, 6, NULL, '[]', 0, '2020-02-18 12:06:00', '2020-02-18 12:06:00', '2020-03-04 14:06:00'),
('7c43820396c8c9d4e4e3c27c1b612da3aeefbeba1cc44f56ed5c2e002cfbf2aba6d0e57ba7fe6b1a', 4, 6, NULL, '[]', 0, '2020-02-18 12:38:52', '2020-02-18 12:38:52', '2020-03-04 14:38:52'),
('665a08a0e8e119eb7851b21047b75d927ff36338a3d36e3b12b4412a941ee95f1a36e9e049569dc1', 4, 6, NULL, '[]', 1, '2020-02-18 13:27:28', '2020-02-18 13:27:28', '2020-03-04 15:27:28'),
('73c1cc3ab069b8c0327b062851578ae9f8c98ed4d43df4c2f0b9b974d4b8d49065f29532206ba85a', 9, 6, NULL, '[]', 0, '2020-02-24 20:50:38', '2020-02-24 20:50:38', '2020-03-10 22:50:38'),
('37329fc50cd07f3a7894c2f5fd80f895bf497fe8a20e37a6a8e1c7ee2263ff5c4f63cb41f798a40a', 8, 6, NULL, '[]', 0, '2020-02-24 23:43:51', '2020-02-24 23:43:51', '2020-03-11 01:43:51'),
('cdd514a16f3603a6703050ec7fedcec7fb242ced2a89fd1249ed45c04905a8b9ecd5e9afbf6ff266', 10, 6, NULL, '[]', 0, '2020-02-25 02:41:06', '2020-02-25 02:41:06', '2020-03-11 04:41:06'),
('2fca9cc3291c17ad57a635dfba0e1a40574938f2f8867ace4a80b1d6b397b9d4fd2186564a4d7fb7', 8, 6, NULL, '[]', 0, '2020-02-25 03:43:18', '2020-02-25 03:43:18', '2020-03-11 05:43:18'),
('ab5dbf95ab27523f668849c129d30e0d22c148b0c22d44ea3256e66a55fab1b8aa3d76ab35e07ba4', 8, 6, NULL, '[]', 0, '2020-02-25 04:11:28', '2020-02-25 04:11:28', '2020-03-11 06:11:28'),
('50a135ff426613733fe0d3f552fcb49a7016a2305170f3665aefd53539788a1b561eddd470bdebbb', 11, 6, NULL, '[]', 0, '2020-02-25 06:25:36', '2020-02-25 06:25:36', '2020-03-11 08:25:36'),
('ba56ef20be68ba7b2a28bde623abf4e629ac3b3bd7710138b9ad1ec6c4ffe1f674b2b4dea6659c30', 8, 6, NULL, '[]', 0, '2020-02-25 06:48:25', '2020-02-25 06:48:25', '2020-03-11 08:48:25'),
('d5716cfa813af883cbb1340cd2fab99e9f81c2f5887ed41eca39aec666634c064c3b45e0322813b7', 8, 6, NULL, '[]', 0, '2020-02-25 08:39:26', '2020-02-25 08:39:26', '2020-03-11 10:39:26'),
('ea1af520249943228edcffbe58011e7037286cad1efc0bf50dbc49dd095b510128d08bdcfb033dfb', 12, 6, NULL, '[]', 0, '2020-02-25 19:08:54', '2020-02-25 19:08:54', '2020-03-11 21:08:54'),
('6ee6b3c1475f0c8886427d3c7befb110f2b1797a93d9a28ad6bf187cca6a440091ed7f9d58bf14c5', 8, 6, NULL, '[]', 0, '2020-02-25 20:07:02', '2020-02-25 20:07:02', '2020-03-11 22:07:02'),
('f30691953835a31e9eea42e606ce85c7e42e015eb190a6f19f6ab469dc994857ad2255ef941ce3b3', 8, 6, NULL, '[]', 0, '2020-02-25 20:12:47', '2020-02-25 20:12:47', '2020-03-11 22:12:47'),
('73030af9097a29bd3dcfbc55fd56096329ceef068a533b0ae95f9001ed73d70b8aa54eeade0a6885', 8, 6, NULL, '[]', 0, '2020-02-25 23:17:49', '2020-02-25 23:17:49', '2020-03-12 01:17:49'),
('51eaf91d4d2555ad3915b15adc785e22a2c456f7258c70de7b6a2c489eaae2579b2cb7c3e7956a41', 8, 6, NULL, '[]', 0, '2020-02-26 02:22:27', '2020-02-26 02:22:27', '2020-03-12 04:22:27'),
('8b75cf524e43d99c77ef399530dc9b082bac7b6b87e1fcea4c52d2536081f2145cbb20cfbd30759c', 8, 6, NULL, '[]', 0, '2020-02-26 23:22:00', '2020-02-26 23:22:00', '2020-03-13 01:22:00'),
('0ef8cfd8a6eb9932f044d1818c8224afc356c77fb18daf87dea79280a75e0b966a2019e602dd1e9d', 8, 6, NULL, '[]', 0, '2020-02-27 12:17:02', '2020-02-27 12:17:02', '2020-03-13 14:17:02'),
('c138e6aa5ca51458124a940fb924fd412d75e03fec83b5c7711e3bdc10e1cffbf4345a055fdb1304', 13, 6, NULL, '[]', 0, '2020-02-27 20:27:24', '2020-02-27 20:27:24', '2020-03-13 22:27:24'),
('9b8588a49905743bf1f4f0cc85b1a5ffe67718b3a0d00dd91feecf7e9a8d16559d97c0705e6304f6', 14, 6, NULL, '[]', 0, '2020-02-27 20:55:40', '2020-02-27 20:55:40', '2020-03-13 22:55:40'),
('342ab7c6dbeaada6bd0d314ea7da81460846379079d48d25a768516fff59326b3f12ef5bb0140bba', 15, 6, NULL, '[]', 0, '2020-02-28 13:00:51', '2020-02-28 13:00:51', '2020-03-14 15:00:51'),
('657e415e72f3fed7afc2708df283899f9636ed25eda3e57429876e8137e167eb1c3ee0b381f82139', 16, 6, NULL, '[]', 0, '2020-02-28 17:12:27', '2020-02-28 17:12:27', '2020-03-14 19:12:27'),
('baa5be6329fb3250f4e8dbfe4e608aa5a5b74e2bb8e6b47d76bc03cc3356e3274fe4f3553fa0ee09', 17, 6, NULL, '[]', 0, '2020-02-28 21:54:18', '2020-02-28 21:54:18', '2020-03-14 23:54:18'),
('5d498bb45011d4e7049b035b222e1c2c7bfb70ac4a1a79fdc77b79a0bf4bfee31658f145e6c3ea7b', 4, 6, NULL, '[]', 1, '2020-02-28 23:18:01', '2020-02-28 23:18:01', '2020-03-15 01:18:01'),
('0b99ce105ccc60cb9030c943fac0094147ddf9c191c7036eb2546a6f61e17abdba922fdb6602634c', 4, 6, NULL, '[]', 1, '2020-02-28 23:18:03', '2020-02-28 23:18:03', '2020-03-15 01:18:03'),
('6d6c86e1e1d0444aed82acea19a1d41ca29068179e126c9a1a624663dac0881abd5236feadfd1606', 4, 6, NULL, '[]', 1, '2020-02-28 23:18:04', '2020-02-28 23:18:04', '2020-03-15 01:18:04'),
('0ae926cccf0520ea81305059b95cde831698485d34ae202d3f743ac48873835a94505e599545f72a', 4, 6, NULL, '[]', 1, '2020-02-28 23:18:05', '2020-02-28 23:18:05', '2020-03-15 01:18:05'),
('75e4cbae64681122972c585849f3d20aee9688b30da5092272aeff41445d48bb4ffb55c0443756bf', 4, 6, NULL, '[]', 1, '2020-02-28 23:18:07', '2020-02-28 23:18:07', '2020-03-15 01:18:07'),
('5d13d6737fc2e89f9e1c3d8fc1d76228ce5a129e831f2973d0549171b0748be4a46f727e3ef749c6', 4, 6, NULL, '[]', 1, '2020-02-28 23:18:08', '2020-02-28 23:18:08', '2020-03-15 01:18:08'),
('65c071e35d1394e17b13ec3a70ee7a900e2b3863613812116a6e38d99a1cd0103c1da4965a6fe8f0', 4, 6, NULL, '[]', 0, '2020-02-28 23:18:10', '2020-02-28 23:18:10', '2020-03-15 01:18:10'),
('3ed8b545f5b6446c330a205cc8e9cddbd36d7a558f7b871260043c4a77bae5f540b847ea17542760', 18, 6, NULL, '[]', 1, '2020-02-28 23:19:19', '2020-02-28 23:19:19', '2020-03-15 01:19:19'),
('be522ca0fe1860fd3a01e165f6d06e30c4ad3fc98ed360014240240bc026d65507ae4fd0b2d39cac', 8, 6, NULL, '[]', 0, '2020-02-29 11:28:28', '2020-02-29 11:28:28', '2020-03-15 13:28:28'),
('39989ea6439651dd75ced7c0f3a9ab985ef6f6d25fd9ef9d0a2bcd22af6bae3da187e8854c56e252', 20, 6, NULL, '[]', 0, '2020-02-29 22:45:58', '2020-02-29 22:45:58', '2020-03-16 00:45:58'),
('47ffb381eeadb776e6eadf455a0170d5722c89896259c66f4a36980fa3043c175ff11a0486a6a273', 21, 6, NULL, '[]', 0, '2020-03-01 01:22:10', '2020-03-01 01:22:10', '2020-03-16 03:22:10'),
('b83b591e71f33d21fe8910b477b16245fa5ef3c338481159be145c1341305cf67c8e0968a4cf186f', 8, 6, NULL, '[]', 0, '2020-03-01 07:21:10', '2020-03-01 07:21:10', '2020-03-16 09:21:10'),
('4d0cbed2bf37fdc4e47e0f1c1fbb10f1b587d17879abdec3b8479b935e80cf7547e8393bcb55eaa3', 22, 6, NULL, '[]', 0, '2020-03-01 20:20:04', '2020-03-01 20:20:04', '2020-03-16 22:20:04'),
('110faef0b91fcddd2d53813610d9caf8280e6f7ea81a58cdd2264a4bc0aef16efef40d16b6e261a2', 8, 6, NULL, '[]', 0, '2020-03-01 23:06:07', '2020-03-01 23:06:07', '2020-03-17 01:06:07'),
('fdb6f0fa1393416081acae32d4b729fc6e0c894d4932de2a97dba9e3f00bca69580528217da8bf0f', 8, 6, NULL, '[]', 0, '2020-03-01 23:07:39', '2020-03-01 23:07:39', '2020-03-17 01:07:39'),
('0801030ecccbe3c7ce5e994913f1136250389b424151cdfa1b0ad8941352d2b146cfd32bd5f25352', 8, 6, NULL, '[]', 0, '2020-03-01 23:14:46', '2020-03-01 23:14:46', '2020-03-17 01:14:46'),
('4a88fb6df3feb9f027686ef0fd6566fa30398551fc86b7fd0ea918f8a695957bf1d44ba31b3052b9', 8, 6, NULL, '[]', 0, '2020-03-01 23:27:21', '2020-03-01 23:27:21', '2020-03-17 01:27:20'),
('e8e485fa46d54d41395dfa7944d9e1ed7ff60be98a5e246ac174da441ee83dd23c98685d617a6f8b', 8, 6, NULL, '[]', 0, '2020-03-02 01:01:35', '2020-03-02 01:01:35', '2020-03-17 03:01:35'),
('7b9c42b19531912cc6dc661564f42be6b9f893d9c7fe97cc8f4edcb4303c0b68a2a82814f2975f11', 8, 6, NULL, '[]', 0, '2020-03-02 03:02:41', '2020-03-02 03:02:41', '2020-03-17 05:02:41'),
('e989ebf2a5f8e809c061bda8fe789e068726b55df7bbfc677082161eef4ec54c887d111f8981fedb', 23, 6, NULL, '[]', 0, '2020-03-02 04:54:11', '2020-03-02 04:54:11', '2020-03-17 06:54:11'),
('4c288ba5161f53e446732c625b94e25ab219da4fe77e4f80ddc5da80696fad5c3dcfad33f0ed7419', 8, 6, NULL, '[]', 0, '2020-03-02 04:56:25', '2020-03-02 04:56:25', '2020-03-17 06:56:25'),
('90d4d91cfee8785b2910a71498605d1daaeea3776198eb00b91f726e11d640a4c634b1d9dfabc878', 8, 6, NULL, '[]', 0, '2020-03-02 08:00:08', '2020-03-02 08:00:08', '2020-03-17 10:00:08'),
('da870db110d0b5058de29a0d284ae00980844bfa0f2c5dfb8d74f8b0e7785ba813eb16d506370ebd', 24, 6, NULL, '[]', 0, '2020-03-02 11:04:48', '2020-03-02 11:04:48', '2020-03-17 13:04:48'),
('d97006eb7405a54a63f9b253231449071b820563de5a3a06a36b3a36428eb7233fe66bbcfa743021', 8, 6, NULL, '[]', 0, '2020-03-02 11:32:19', '2020-03-02 11:32:19', '2020-03-17 13:32:19'),
('5fe9b46dd6d4b4f0ffec185e57d3323b7405c9b3662db34d5ad5fea0989c8b22ab8b6347d8434938', 8, 6, NULL, '[]', 0, '2020-03-02 15:28:07', '2020-03-02 15:28:07', '2020-03-17 17:28:07'),
('50d6e1f9b2e086dd005719920ceedeac881f0421f4ab6b80a5db09d7d4b13a590bac1e61c2559ad5', 32, 6, NULL, '[]', 0, '2020-03-02 15:38:57', '2020-03-02 15:38:57', '2020-03-17 17:38:57'),
('7406b25068bfecbb61f824e12dcae6862cf4a30c35fd8190dba82c2daa01ad890ad5d93ab3c5ae9a', 33, 6, NULL, '[]', 0, '2020-03-02 20:29:32', '2020-03-02 20:29:32', '2020-03-17 22:29:32'),
('dfc4b3b4df89e414ae7951a19d0c7c35ae1908edb6e3c9159158af72a13f55c3fc28a8c4a39f84bc', 8, 6, NULL, '[]', 0, '2020-03-02 20:47:47', '2020-03-02 20:47:47', '2020-03-17 22:47:47'),
('4a4164a0bd863bd69e1f0bd90d2050a423604af69fc2b0370a207b88e3fc06f713090cb293245704', 34, 6, NULL, '[]', 0, '2020-03-03 01:26:47', '2020-03-03 01:26:47', '2020-03-18 03:26:47'),
('ae10d869d9f18c3aa2a505a5a041f0504cd52ce08c2583ed7307bdaa62be95beac4bf4978102f75f', 35, 6, NULL, '[]', 0, '2020-03-03 06:44:05', '2020-03-03 06:44:05', '2020-03-18 08:44:05'),
('e49a0d39acbb43c85927611966a748b8701f0b2d9e548037c1fbd1d7ca10bd87dabe877861131b37', 8, 6, NULL, '[]', 0, '2020-03-03 14:49:23', '2020-03-03 14:49:23', '2020-03-18 16:49:23'),
('e33c79a8795d9c3c796defea16129ada17c53238da613250fe1e18df68bb516e8c4c0ca65c7040f2', 8, 6, NULL, '[]', 0, '2020-03-04 07:09:40', '2020-03-04 07:09:40', '2020-03-19 09:09:40'),
('88e3ad9bb099eedeb1b9cdad7c895448fc339126b482392a56e9536d963d50799dcb3b8784c1ca0e', 37, 6, NULL, '[]', 0, '2020-03-04 14:58:57', '2020-03-04 14:58:57', '2020-03-19 16:58:57'),
('c4aac8eaf22e0154ecf0f717fde39036be7e569ec363d958bfd970346d421130784c05e3e1a9d6c0', 38, 6, NULL, '[]', 0, '2020-03-04 18:23:46', '2020-03-04 18:23:46', '2020-03-19 20:23:46'),
('95c897636ffec421a529f8c634e2e37f2c828fe2b0ef972a8cab3a26aaeb44d1af70411eab566ddc', 39, 6, NULL, '[]', 0, '2020-03-05 14:43:34', '2020-03-05 14:43:34', '2020-03-20 16:43:34'),
('5c8548c18560d113aa8e975735566848badacfe7649961dd2ee42b362e6cf5123314babdac8a2125', 40, 6, NULL, '[]', 0, '2020-03-05 20:19:06', '2020-03-05 20:19:06', '2020-03-20 22:19:06'),
('4be8e09338cab9f22c18c26a806c25b1395a2528367774296dcce032e687cfc30a051172e14b98de', 41, 6, NULL, '[]', 0, '2020-03-05 23:47:02', '2020-03-05 23:47:02', '2020-03-21 01:47:02'),
('3dc33959fb26c5da1c0eccfdff84bd3827b4ed3a6b1ccdaff20d2bc68d4ae7d0dc77f3867f0985a2', 42, 6, NULL, '[]', 0, '2020-03-06 03:52:50', '2020-03-06 03:52:50', '2020-03-21 05:52:50'),
('1deb5770d448b51809e61f1774b123e1dc9d306e0d5f9b3a922dd810a74514194b04839373dee1c4', 43, 6, NULL, '[]', 0, '2020-03-06 11:57:42', '2020-03-06 11:57:42', '2020-03-21 13:57:42'),
('08fb314ff2ca18709526f54387508f1bd8cb45312abdccb0e268fa3a5ad8cfedf379a2541e33ff59', 44, 6, NULL, '[]', 0, '2020-03-06 13:20:11', '2020-03-06 13:20:11', '2020-03-21 15:20:11'),
('dda995feb8baf9ca2eecf9db999ee05fb720d35aa4db219ac811a96e60bce7a447ffe4d4e55e05c6', 45, 6, NULL, '[]', 0, '2020-03-06 13:33:37', '2020-03-06 13:33:37', '2020-03-21 15:33:37'),
('25b04e99244be69d5d487d180d1aacf084971e6a95c2aa12ee659a80a342536f104274af5d62c7af', 45, 6, NULL, '[]', 0, '2020-03-06 14:35:49', '2020-03-06 14:35:49', '2020-03-21 16:35:49'),
('2366ee7ebcc7198d63668746b8f36b7f40b6114c0a400d64e991864ee41594a89b5d6f1035b0d037', 46, 6, NULL, '[]', 0, '2020-03-06 15:15:20', '2020-03-06 15:15:20', '2020-03-21 17:15:20'),
('a729bc6502e62fcb92776a6a6cfb0de3cf1c6974265db7b9afe6ccf1d9facbdba50d5b71151138e1', 46, 6, NULL, '[]', 0, '2020-03-06 15:31:00', '2020-03-06 15:31:00', '2020-03-21 17:31:00'),
('79ddf8a85679a93d6d9dacf79ff598fd1a5cc49fda1139488c34badaf174e67095f65a68e1fff1bb', 45, 6, NULL, '[]', 0, '2020-03-06 15:32:49', '2020-03-06 15:32:49', '2020-03-21 17:32:49'),
('3f1649b8fc4753ef305a51906057d2d501dbad8a78567c1f695875a17721f7020f2fb3d901523aa0', 47, 6, NULL, '[]', 0, '2020-03-06 16:36:43', '2020-03-06 16:36:43', '2020-03-21 18:36:43'),
('2798f4b3ed0883d84cc9aa26c03e365a04c4053eee4f6c848041f02aee61a0273998f64a537afa68', 47, 6, NULL, '[]', 0, '2020-03-06 16:40:15', '2020-03-06 16:40:15', '2020-03-21 18:40:15'),
('6cd57d2a5f5a80df0913dba931e8e1018f5411f0f3da3681e661d5d644de690c047da7dd83edc61f', 45, 6, NULL, '[]', 0, '2020-03-06 17:19:56', '2020-03-06 17:19:56', '2020-03-21 19:19:56'),
('dabe2df5dcc82217de8e628887ad08acd2b5014f283b98b3ab31d4f921e5ca6992e374c1ce7c45e8', 48, 6, NULL, '[]', 0, '2020-03-06 19:23:35', '2020-03-06 19:23:35', '2020-03-21 21:23:35');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('05fe95eff3ac04ae2de79f90a0aed5fd17c23d6f714983bf9139482bc215c6951c6f1e3f4d92fc41', 49, 6, NULL, '[]', 0, '2020-03-06 19:47:45', '2020-03-06 19:47:45', '2020-03-21 21:47:45'),
('10a341b225b886679ef1e748baf77b3eb5ba3a14b540ab36577cb5ab4c6ff5427a90ead5e4c6298c', 47, 6, NULL, '[]', 0, '2020-03-06 22:28:55', '2020-03-06 22:28:55', '2020-03-22 00:28:54'),
('aa0a407f26b6ea81c283d9a938deb729f6e06aac5da936a618302f01b54fb57db371552c61288fd6', 50, 6, NULL, '[]', 0, '2020-03-07 05:25:35', '2020-03-07 05:25:35', '2020-03-22 07:25:35'),
('20b47b7db83a3c5ae081e13ac7b7b407246af91f6f7d23e8f85fe9c46536139ae8e84f3be0902198', 51, 6, NULL, '[]', 0, '2020-03-07 08:02:05', '2020-03-07 08:02:05', '2020-03-22 10:02:05'),
('4059ad5b6c610917edf4815a4efc7d2d4b8d8c1f1604f61888fa6ffa35f5115a3bf3241483c1d3c9', 8, 6, NULL, '[]', 0, '2020-03-07 12:10:05', '2020-03-07 12:10:05', '2020-03-22 14:10:05'),
('e5a372c1696ea85b1e5eb6c09ee90f97c710a2a552d594a01dc5359b6d25cf4970200438c708fd28', 53, 6, NULL, '[]', 0, '2020-03-07 12:25:46', '2020-03-07 12:25:46', '2020-03-22 14:25:46'),
('ff242be136b35edff1a2d88843e987792b2d20a4202f082aa269ee653f6682648a47b5067c899c4f', 54, 6, NULL, '[]', 0, '2020-03-07 13:42:40', '2020-03-07 13:42:40', '2020-03-22 15:42:40'),
('ab96348d5842da7e8db90a79187a4e6473a99a7c3f925554945f7f5458f53fa33a21a46f9fc21641', 8, 6, NULL, '[]', 0, '2020-03-07 15:41:36', '2020-03-07 15:41:36', '2020-03-22 17:41:36'),
('ea1965214775c5199b2f5dfa9cf1e1be21b5296aa556a4e2e5e49b8881032d589abcff94acd6a165', 8, 6, NULL, '[]', 0, '2020-03-07 15:44:52', '2020-03-07 15:44:52', '2020-03-22 17:44:52'),
('e44037ea1c898135f57ce19f7ea3ec619c2bbb02e65f434aa097a9b2f4e4e1827817c01d9632a10c', 55, 6, NULL, '[]', 0, '2020-03-07 16:09:08', '2020-03-07 16:09:08', '2020-03-22 18:09:08'),
('e887d4ac00af7b35272811ffc71b417bcdd8180b4db677125eccaae8e21e6b39f4f3b8395967f2fd', 42, 6, NULL, '[]', 0, '2020-03-07 16:11:19', '2020-03-07 16:11:19', '2020-03-22 18:11:19'),
('323d6bfefc38b15958668275184a29f92b53618e975c4e46bab7149675a17f12c28fa87ba1a740de', 56, 6, NULL, '[]', 0, '2020-03-07 20:08:53', '2020-03-07 20:08:53', '2020-03-22 22:08:53'),
('037f1d09010706996b006d1573cd9b3d0cdc714cc96e0482416a56ecc299794e5645972121773b54', 56, 6, NULL, '[]', 0, '2020-03-07 20:40:06', '2020-03-07 20:40:06', '2020-03-22 22:40:06'),
('1a837c0a1037d2dce5ee8f10fa585e0b551b8da2a3b15c6ab11186043b81933e93932b021d1f7464', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:09', '2020-03-09 00:24:09', '2020-03-24 02:24:09'),
('62452b7753edda1bcbbb6c3f41a5ec131016b80a837d900a8d3be04765e4209a1db5ea4488c99bc3', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:10', '2020-03-09 00:24:10', '2020-03-24 02:24:10'),
('e2432aa79427354e6e9d01920c34bd537bea2758390e7b7e3f1ce41b6019c3f79761397a1d661457', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:11', '2020-03-09 00:24:11', '2020-03-24 02:24:11'),
('33bd01a23367414eea196331a313177eafbad2c5afccf1d906db1ebe6dfca5f9066ea527c948584c', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:12', '2020-03-09 00:24:12', '2020-03-24 02:24:12'),
('39c563470f6165d00ab165eeb87d37c4a0786363bae50e56b675130882ca6ee7f3055c8151a61c9d', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:14', '2020-03-09 00:24:14', '2020-03-24 02:24:14'),
('4251100eecc12a082e207d8f5a7349fce211d2b6bff55bcad8dcf1d6980503148136034f9d2a6423', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:16', '2020-03-09 00:24:16', '2020-03-24 02:24:16'),
('d22bdc8aa7133dd49b820290862efb5577ffb2012cad4116d4b9effdcd57ddc7b5ea007127071800', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:18', '2020-03-09 00:24:18', '2020-03-24 02:24:18'),
('2b830925af25d9742f64abc0b080d5a3a26eda6270a54b99b7d565cf94528c6dc0af849fbeffd0cf', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:20', '2020-03-09 00:24:20', '2020-03-24 02:24:20'),
('459b5ae1c9b82922d2f6eb45a6a38c072d80e7269f54e1f7cf8f07cf79ea911e5b4031d0396dd994', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:21', '2020-03-09 00:24:21', '2020-03-24 02:24:21'),
('781f13595ab4ca427ecb1787b8b9b1f3b8f2aa8ed6f034f94e6e6a5c87397bd310cebc240cc21865', 58, 6, NULL, '[]', 1, '2020-03-09 00:24:24', '2020-03-09 00:24:24', '2020-03-24 02:24:24'),
('c7ca60057ac7320211ff02b3f03e8a67cb91d6a57701254d27b020dc0fe61365e7d3d92ad5dd58b1', 58, 6, NULL, '[]', 0, '2020-03-09 00:24:26', '2020-03-09 00:24:26', '2020-03-24 02:24:26'),
('16863845bcd7e31a8374b2ff62166ebb3bfa7785372b23d537cffdea9f2cb46549950ad1a178d3f5', 57, 6, NULL, '[]', 0, '2020-03-09 00:25:21', '2020-03-09 00:25:21', '2020-03-24 02:25:21'),
('bd2141d635dcf0a332750ee5ae343771f18aed4658cc973577807370100e958b6cd0827efdc3ec7e', 58, 6, NULL, '[]', 0, '2020-03-09 01:02:44', '2020-03-09 01:02:44', '2020-03-24 03:02:44'),
('57e94bd016b68b5cf766ad8882368b80a8e8580ec399064f3084f90cd6bab4af4a1d480a118bd935', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:15', '2020-03-09 01:32:15', '2020-03-24 03:32:15'),
('fe5572d89e0633af2ab4dac91d40ccdb04404bc343327c0b56a3a315f76c50430a09bd4de2414ac9', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:17', '2020-03-09 01:32:17', '2020-03-24 03:32:17'),
('f959cda7942bc8455b922395037a35f2b0b0cc6d4a75e86dd09743a76e8781819e4a4e145bc469e6', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:21', '2020-03-09 01:32:21', '2020-03-24 03:32:21'),
('17d95eb07f41382448c18b6532f69fe0bf737a461b7d0e586c1e7a8123260b4857bd64b30a744b8a', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:23', '2020-03-09 01:32:23', '2020-03-24 03:32:23'),
('449f194accf1faf0848867a8f6801438b459b7e8d2b6caed3dd2d417a388d8c819a9e8ecfd8a6bac', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:25', '2020-03-09 01:32:25', '2020-03-24 03:32:25'),
('5a5b0f8563bdfab1ebab25f6e6e1411a091c22ac44eca82ba161897c3be6913106ccaa31dd6da9a9', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:27', '2020-03-09 01:32:27', '2020-03-24 03:32:27'),
('27db3e1387bba2b62538c4ddf64c71312584247fa2e2c822722da865352619957907f25089e3bf6b', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:28', '2020-03-09 01:32:28', '2020-03-24 03:32:28'),
('0f562a8c64b8fd3a9f7b0bf44e3c8c62a77a9ac29365545c39c84af3b94ff4b2ef387ec96a16e4b6', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:29', '2020-03-09 01:32:29', '2020-03-24 03:32:29'),
('e212e65e8a0a8b3f1c2ccea8f2b4a090dc9c1e3855cc917b22dac2ba0b33775a85e0e9858d27c0d4', 18, 6, NULL, '[]', 1, '2020-03-09 01:32:31', '2020-03-09 01:32:31', '2020-03-24 03:32:31'),
('51f9cd4d3fcd4d2c18dda1ef018ed6ba54bff48266236f3325e22ab5f19089f14dda4e07cf3ad095', 18, 6, NULL, '[]', 0, '2020-03-09 01:32:32', '2020-03-09 01:32:32', '2020-03-24 03:32:32'),
('41be45539eb1d9db09a125df087fd112f32fcdd54ee26f47c34e3d33e26c07d6e983f15edc5e0940', 61, 6, NULL, '[]', 0, '2020-03-09 10:00:26', '2020-03-09 10:00:26', '2020-03-24 12:00:26'),
('3a9ce2137aa388d4c7bdc8dfe477d3e092675b8d13090bd9373557b1763e6f930b76150da40e686d', 62, 6, NULL, '[]', 0, '2020-03-09 10:20:44', '2020-03-09 10:20:44', '2020-03-24 12:20:44'),
('0689dc76d8fabb7386ead8d740aadefe8163427f7fe07d65d2ded5d1386041c6d8cdab9e67bec9f1', 61, 6, NULL, '[]', 0, '2020-03-09 10:49:57', '2020-03-09 10:49:57', '2020-03-24 12:49:57'),
('e5eaa19a4bcfe9302a723021fbb708b532437b0447b5825a613c63fbc4fd3114637fe98477c71499', 64, 6, NULL, '[]', 0, '2020-03-09 19:59:59', '2020-03-09 19:59:59', '2020-03-24 21:59:59'),
('d83f172166999637b37df14787630e3e0c6c40179c0a5db882f0a343b8432536b4f30dadc0bfac05', 65, 6, NULL, '[]', 0, '2020-03-10 00:57:31', '2020-03-10 00:57:31', '2020-03-25 02:57:31'),
('debf8d595e074e2098f1656ff6aeb314d17b4fb54937d3ed2412b8ef08717de83574239510c694bf', 8, 6, NULL, '[]', 0, '2020-03-10 08:35:39', '2020-03-10 08:35:39', '2020-03-25 10:35:39'),
('4d4a0c319dc8c31d91897d7534f12632fc0f3e37ff2758e927101adb6d4b0e6cf379b883fb255ccc', 66, 6, NULL, '[]', 0, '2020-03-10 09:00:36', '2020-03-10 09:00:36', '2020-03-25 11:00:36'),
('bb2b2537e8170eb35b642b6fb56cd034ab1bf559b467203f7d07d10b1a8c73bd1ad6933f84b87490', 67, 6, NULL, '[]', 0, '2020-03-10 10:28:08', '2020-03-10 10:28:08', '2020-03-25 12:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(3, NULL, 'METAXI Personal Access Client', 'wbSypNsNk4aOkmWgIrP5URb57QkWapP2QshcDcSK', 'http://localhost', 1, 0, 0, '2019-12-11 14:13:55', '2019-12-11 14:13:55'),
(4, NULL, 'METAXI Password Grant Client', 'CTyIhyiWZbq5j4wdIrulkdQHkfvcjB41hcQGxElG', 'http://localhost', 0, 1, 0, '2019-12-11 14:13:55', '2019-12-11 14:13:55'),
(5, NULL, 'TaxiTime Personal Access Client', 'AqU3VORwlV0xUYt36SrFhBEwP6FiJIxw3565offu', 'http://localhost', 1, 0, 0, '2020-02-18 12:03:56', '2020-02-18 12:03:56'),
(6, NULL, 'TaxiTime Password Grant Client', '9eja2rfJrVUgO1ofNlmfjeYKzxU6abKE8zAmlQLI', 'http://localhost', 0, 1, 0, '2020-02-18 12:03:56', '2020-02-18 12:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-10-04 10:08:04', '2019-10-04 10:08:04'),
(2, 3, '2019-12-11 14:13:55', '2019-12-11 14:13:55'),
(3, 5, '2020-02-18 12:03:56', '2020-02-18 12:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('e52e3d2aa1db38cada573b6ebe0ff48a21ccdc325a31a78107a22f525cbf80cc974276757a8cf274', 'd5a7c3cfc01401826388f27cc0751e65f23ae5bb112f29f46f733d5934fb497b73afa8a2c7d56d7e', 0, '2020-01-02 10:10:23'),
('19261ba12823e9b8225952143e20acd281e8a5886aa4ffd7e662f92b76b79d3dcd3308e163f2acdb', 'c3f2cf468015f7504a6992c1b35bba20009f3e37fbece4fa637ba0cbde7143aac7a004709e5ffdde', 1, '2020-01-02 10:15:33'),
('c29f8735515ff486a5554ecf5d1713a7235d423f89a57c1055276eff12909082e7a6dc1ca00e2ce1', '2ad4b028581865733ff11423371c97bcf174045c62b315fa2170d6c329442dcd4218180f6b434920', 1, '2020-01-02 14:33:42'),
('f4d8bb11d1afa91f6c1f6ad5cef8df7fe49c92af83d2f8ead8cf78be97f206493714f956e5641da1', '6bef2bb28dd86e766400b4683d090c24d2aaa0a5689f90f0d635c4fb85dfa1b599842c6ec170e0d0', 1, '2020-01-02 14:33:44'),
('413cf866d0ac7d99f2a686ab86a8dd8e3cbbba75f136bad7e622b4c5d5272ada25018c65610ebb36', '2c03e95c2fc6d10cda0f72094a9c7ce7f685ce1a1d70f545d6e7fcaeba914aa37fd6570fae49d8f8', 1, '2020-01-02 14:33:47'),
('c25319c0aa3d1d4af3f14c016339cdf00ed879e104a4c63d7886fbf584f1cb6a0be79c989c700197', '17baa68540ab0d8d41ccc0f9c01da125c5437038881713b706b70699022c848f3e6124d28b09d1ba', 0, '2020-01-02 14:33:50'),
('65edb39460e72d40e85d42fbbb1c67b9cedf1eaec8634d0c441879ad14fff669ec0bf88795defc18', '9aa6c2321b59f5288ca058dfd28e1a887d271d945e35104963e5098051b3bdcd91f78e8248b79edc', 0, '2020-01-05 01:02:18'),
('0aa9d8ce4c9c3d169910bf90a937d4a4080c485640b112b4e25f56ec7c6a5a9709491fdf2aff570a', '86c39eb95321c4e37b6ad62ea826b2ec5e2eac53c13f02593170540f272294c05f4b13118750776c', 0, '2020-01-05 10:54:14'),
('5ec2f18e3aef783ec6a7f9e88038a16d69a5aee17cd7894a28eb642c81d5c0c33b77dd390f2e099e', '263cb2bbeaafd3dfefb32c81276c70d9966c62e3789c88012a6ced0b392d35d303fd471653e1a5d3', 0, '2020-01-05 12:05:38'),
('995f806a14e1caf4be9921c1e24afc4ecadf38ec5be32347f1ac805a680d38c9b1513fa48d5dfc74', '830ca5d719ff17f5de500797f738ff63a83d40fffcb757cb7ba37b6374fc3981e458b6fcd15a33ff', 0, '2020-01-05 18:35:43'),
('956e97245f6aa25eefcd0f9db72fd6b5fd67457e7d7188f8308ef7efb8a3a3a3a0ad22f960f3ba8f', '9ae284d732c9e13599fcca34d30278df59df1f936a1d166090da11d101072e1b69cbb5119d8797b8', 0, '2020-01-05 18:45:55'),
('4d41bab046dba9c9a7894b1e8ee8ca35866bb9d702b10cc3ff44ff9e4c02dcf7f0b4cb1b5c3f8a1f', '653276d5b135248fe6bb01e2f3b9ccb32a7ebe1b502802511850445eaad0de60f87d8055490fb38f', 0, '2020-01-05 19:58:02'),
('ae80a496489559ea04e78f4c2d21ff30e1116e2eb615155bb1ca8f8c9f7bcf148ae12bbf21d4af75', '465c99a5b7c2556124122399bc80e5608acf7e4e63531d5617e6e676f08a2a04b0941f793a44a90d', 0, '2020-01-05 22:45:36'),
('42dc48b8d67f7faca6bccce1f15467978e350c21f6e70f8739300efdbe4732e2840faf63da3c5075', '59d748b20ab6930e5514edb20ba87d5cb6de34439c03196e57a385573eb7363c923aec79e555a440', 1, '2020-01-06 17:34:51'),
('7020faf27284c433a8f305ba60a79d6d150a43a75ab26fcd91827295dd62ca3b1a67db99535f30d2', '995bd9a445b639da8ecc5c8d7689e9049339ae9dd3068a247c09854224da6bebdc6d029d3dd17e66', 1, '2020-01-06 17:34:52'),
('be2daf443b02eec522cd5909b023dcc5bf0cb09718ec84ba0a3a5512e746a03683fbd28f89a420d5', '0a0b98ae83a78c0e0f5d68733f36bfc871708de1747d3c25a2a4b5a70fa59aba6181bc53e4dd3a35', 0, '2020-01-06 17:34:55'),
('ff52aca0669f17f0b455f8ecf6aba3b82931bbb4fb01cf94fd04ce450fef907b34cfbe92df3898cc', 'fe524d320e72c8c77db50d68211d4924001fd23c4c10954754435df434adced79c05026aa89a0cb3', 0, '2020-01-06 20:22:09'),
('91e12cee8ed42faa79853f27974313acf59f339374adbe0103e078999d92cab6026ded43fd0d6b8c', '38d5ccb44754bcc3e668e90bddce71517aba6f7b7c5339a884210835ef3becb485f6f29539f93de6', 0, '2020-01-06 20:12:50'),
('bc20fefba22e895a3fe6d0656af296117be1dd0f5851d053fd2bf2b62b7289312978dbc70cfb9294', '285e10b115710ad713e5bae85fa9642062507c4e32f1df9bd53d823cacb502c0e938824973b9df9b', 0, '2020-01-06 20:45:48'),
('f88887482379a6a026d5a4140492ffd730f245f12cf805adc7835542aa249f8d193bb888c2272191', 'd1ddb89d1a5628a870ded8b44f9036513fcfb2c12242d039b71a4a64705bd9fd5bd0325af432cec8', 0, '2020-01-19 21:44:04'),
('2d3364c673db04986f6287742ef73e2afee843301d14112bcf1ad29670243036165c2245bd15e916', '307cde093d81d2b33600baedc4839784f288d8b9e0d2e1f75512b6aad5463adf274633d523fdce90', 0, '2020-01-20 16:28:37'),
('2a4ab8924a6ab4477a3f689fc741f0aa9ae45a265f2d4c55de4824783af7696027064c4e483164bf', 'fb43638b0a6d543632f58142c9a623971e6a3d16b3a672ed0eea1d7a84d894b8ef9f76e08f51233b', 1, '2020-01-20 16:48:16'),
('03f74bb5d9fc1cc5b76607c7f73c9641f45c7726d13e8b90586c0dc3479a1de016112852740658a6', 'ed82eaa0059f84b5bc219607449c69643e39413040d5dc1c32545c32452aa35e5ca0f4eef078c8fe', 0, '2020-01-20 18:02:41'),
('27964f5ab55ac26d7163c66a9fb0535939c5b5172b224b32ae59cadd932d34276f490d4e8b1fd6c5', '35410425dde652af7070ca8bb887d9fc20bacc011d6257d39d494a83d941310736c797a35f0f4a1e', 0, '2020-01-25 12:40:14'),
('5e03492e54595ab5383a8e04a61b4117dfc69013cff259c99a782ae0017e3ac8339314071a2bed6a', '08013cc68991f6a733d3ce5112318fac51e82377dcf8757dd634e2f5349369738a6cf05d37919cac', 0, '2020-01-26 08:39:51'),
('c26469696ad6d3a8b0279e73ee6d3969562f735a9b7f4ec49a86a34d3268827b5c9d83a259295a58', 'f9c1f32970041bd6cf011544151614f25c116238e82b85e3232e5baf7da811bde619cf738333adb1', 0, '2020-01-26 08:46:49'),
('63f9280e44b8653364f7c06eb5241145328344a3e334185c4368bce6fcd78f81a3b135d39ca0372f', 'ab18526e470e6d94bad5d1a11fde0b4316166d8a2706e5b1e10c905326e5616907ae4637abace96d', 0, '2020-01-26 11:08:22'),
('56b6dfcaa67d42c3a6c0ba88a72ec26d71e418bfc767f69cad2194722beff2dc1b32e75bb547b2cd', 'da4a7bfaf55d7b9dcc3e9edafb29c15205ae65efdb3f8cbc6dce49bffb632766405900aac08484c3', 0, '2020-01-26 14:05:40'),
('32eac1a71ed5b5501c5ffcff1ef55262c320ffb179367011655f6b9348e9bb0a70303841f0424eb2', '4d7a6d1aca76743a38c0122ac3a3e43219b51b46eff7eec954455a1646aa821bd4138ffb974bdc40', 0, '2020-01-26 16:07:30'),
('487ad4c3409fec86d9b9ec439624f259a7a9acd1b2f6fce12d95e9979421719a44a26294f1733459', '54d0ba0cf268e4b305ee4ca28b5698f06bc227913a31e47019d9a99540712ef3b4728e1dfe282ec1', 0, '2020-01-26 17:14:59'),
('967108a07a61903e14b873505f232075c0a76941fac19eb31badb045628e52f52637be6141428f70', 'fe2e2fd4dbe7c1cbfe07480a9d190023f8b54faf04dd6a650918b93251e21aa8ecad75ac2817985f', 0, '2020-01-26 17:57:58'),
('7f63ac455eaff148d87cd85a2acdde085e6212a2d688c97f518b71e95d6d60e0ab31c7f4cb589d9a', '91e2de2bb3ba1c2f0863da91ca2296e735bc00b91aa33d001c223ab529971007c1704044e84f7610', 0, '2020-01-26 18:17:27'),
('c850e56cf688b935ee1c9a307884de9d5b0a7b633e2069872741f5954233c7745027d526d12c6d3f', '44be47e83a844794dad48d7788d7df41319f01b3ff0c080f51b8b4b613ede82389575fc600451ba8', 0, '2020-01-26 21:20:41'),
('6c00b5d3bf593cf54432c443772a06e0973b3f12e9af8371e2400e67ffa17e8725d247b701e10721', '62f2ba7005598195c2a41dd68c492e937c3ef2e7e319839f0c0b6bf7afea4181c7bf923c570a9dde', 0, '2020-01-26 21:29:14'),
('1daceb2d4954f40351f5ab51a30a1f246800e9ac2d3d35969e4c3c47904cc5521d6f21f816915838', '4c902eb4a109433530924f98a0eceba62bbc784a932143256a5c5a5fe8c740b87c14a662ee18e2df', 0, '2020-01-26 21:36:37'),
('839b0f84977faa699d30886265495bdee864f013ce93a8ca67cdf1aeffe8d52b388f733ed8cd1e9d', 'f3a1f59c40195ff9227f5e6f3726e96cc3a2fa604a7ad5aed83373b6d0657a3cd78514f312e233f0', 0, '2020-01-26 23:07:56'),
('59ca7f3bca29deb454fa9ccddcd8e3bf79ab876624d713d4063f811a2d3fdee474a5a784d4a38711', '5dca1a54fd2837679753fe98775cb93dff756fb3a235736a3fb4a8427d17e139a4a13fadb01e63e1', 0, '2020-01-26 23:08:22'),
('2cc11b400d329f07926004b0a5e5e507a76c93b4e7555eecd90c25412f71e7f5034712d6faa6efc3', 'dac5ab21b6cec80eb323a6eebac500ccebf5045e1f80f206609a38360e181da33f4b7c293d304b8a', 0, '2020-01-27 08:55:36'),
('ce631eb2b323ad0b98712b29f266256e87d08eea3f1d752b9e9aaf105a751cd91200477c3ff2ca19', '053b7c5a39acf5e3959147cdf8b4a6c0f98a2f5bfc622bbbef121ea963ac9ab119bd113822e72ef8', 0, '2020-01-27 09:02:21'),
('4db2815b404af3d687afe498146b4795a400ce5202468587702ff2a7bee141114f712cb824d21714', '6050e686fad583525b3ee801b5b562cf4bc159bfc5c3d89750695b9835824c92e3910027beafb5e2', 0, '2020-01-27 10:03:00'),
('a02be2db156c870f9bd244b6aeacd884c16f23856e58c15f89c6bdfc122f2fa0d48bd0b99ad8ed07', '5431c6d777984e787182ea95c9746a63061ad53b845395c7d5802b003f2d721e7098ba2c719aa3fb', 0, '2020-01-27 10:42:33'),
('9295c84e7919678f0f2230955c706ffb2e4e8b713f341eb5be4d9093bdac0dbf9511481312a4d2af', 'cff49dfd2dccc3332a568b6f4d75d73281cec03a7043149066af552fa8ca1bdfabfb9ea8f4e1f28c', 0, '2020-01-27 13:32:41'),
('36f974ad40c893c2270d5fadbfb69fc11ee0c7b54e517970dd372268e9fa62326f53d7d3dd24e6ad', 'aedde3c24d422f6ac41a94d11b3ed25648e0a87a051c6ef21932c67d53c2f9a477f90741abd783b5', 0, '2020-01-27 13:36:23'),
('1fc77126bb8ed63c1523489e37f40f7c16cf15d91a04505199e0b85d525bed434ea8bdedcbec3946', '3851602ff0eda58715e1318b9a8c1ffc9987a7bfb7e1b392b1b423208ebf69f51878b3d7704d8bbf', 0, '2020-01-27 13:44:58'),
('7c683229d2bc98c955f5de7ad6eb15e9915ff3ee7c2a00fe1e1b009b0b881b13060a99e95adca46b', '6ff5c5fac7a1bb71e97f8a964bb003b5be2529a55237730ee6af6288de99dda0e992d00b96f654e9', 0, '2020-01-27 15:01:20'),
('439b2390751ccc68207c18839662d0338287b7eba2bbac3fa5a25436ee36725227641c9eb7b90ed2', 'e193858bdca7bd4c571d62718b07b7d5adb7841c3cd811d951e242f6cb954e000607804bdcce22b9', 0, '2020-01-27 15:02:55'),
('9ec00e80b347362398f4ed1e25501ecd98faf86d96005f0f99fb657f620c82afad160ef43d6ca660', '8423c446bd1f56f4673b80d5daf42df7e0e610baed2718cae8315355014f5be9953de278e12c23c5', 0, '2020-01-27 15:02:57'),
('d26224796db34ef7b769714cb3f1d88c04ef43bd98260f51444ca8df4efbdf82da322341b09e5dec', '19d293c1c8913b1f1f53f5bc4c5a8712222498c39167a94a756de28281e7a00bd80faca22e6b79aa', 0, '2020-01-27 16:22:19'),
('8fe79717b0931e941f76793c6ef4d0e44cb44ca8c0bb320b0ff43dfce8815b69cbd07e6ad7ea1709', 'd66506a0c035ccef98f027c59663efbc09c069f6d48fe80c8b40e4fa468248321b05028b862be1cc', 0, '2020-01-27 16:35:04'),
('ce3307b61a7d7c04beac36cbe13ae307300c5faaf7974b5eaeb53fc60dafb910d987d8518df49b55', '7c53b23be9f72d758a384c75f79fdd87fe543e0d6cde5a15a67a06cb5a88870b2b7e85e99e7dfea1', 0, '2020-01-27 21:10:09'),
('7716d3f6b8bb830fdc13422ac2f6e0fa82374af5bd260ac92d20de8051f4f87745a74b1ead075840', 'dc4457c155da484af68053c4c00dde9f1621ce02a64d3e2e5e52e81891cf3abd71743326088f4761', 0, '2020-01-27 21:36:19'),
('710e9ba1a745c9f81ab721413d4d54220b0d671b8152ab1db3ebdf205d1a77d12c41009a0a7c1486', '99871151073d28c0fd865316f5d2bba0153094b0a0d8fbcc43833571bb9583ac6cf61db3d22572c7', 0, '2020-01-28 01:00:00'),
('e99828af7daeecf3f88b9e98438725090a109f9bea1b87dba2774e393735fe03e3a8df036e7f9697', '288076c11415ed9f56b90ba245037853d4ca2a1914cc26172ad718d32e3ed86d9b1cd1423a6d3184', 0, '2020-01-28 07:52:32'),
('d6298698b0ea27e96d16f2c3acca0413c73c4d84860735a4ae2232019c415da4c615d5ba91b40c52', '5e4de355e16d604f7eabf5f955cc65d189b57f3eff7e472ca97134e75abac686860d36ec4b10c395', 0, '2020-01-28 08:43:02'),
('c892ac15dd7c943d8c0322261227e96394fd29249007951acf998bfa45a9f0fff39cc30082c96e19', 'daac5bf68468cba342a91a6f8ddf1fc3df8126faf74196fc4d32c437d385ffb1a9c5f917cffff081', 0, '2020-01-28 09:49:10'),
('2e8c224616485a28650837d96e91f39bddd8ae80f471364d712b1d4b7a4945d40c89061a360399ba', '87e5ef87a97ac539fea44cfb31ff392762901b5b8d19262a593725e58243c194f7d6ec191aa76bec', 0, '2020-01-28 10:57:29'),
('8bc186e80acce4a40894a8052d569e6f223d7ad6937feb49400b03a1c7519fd24fd110821510d180', 'd2674af1979e3c27f83fe7270e87ddb2bc3a907291c32adec799dc25df0ec09f4d3811d7afd9f20a', 0, '2020-01-28 11:23:59'),
('013ff99366456d9dcbabb79ddaba68e56379d2b401826b3986c173a22e07bf71ac90e0b4c7dc0053', 'fae6c9f60d187f77f6109d593648a31e8085c688218151ebb7d8c56d56194969cf92960195ac9d25', 0, '2020-01-28 11:31:37'),
('cd339ee248e232dc1ea4065f2aefc582838eb1897f526e01fd4a4a943d7ebe760e75c0691f1d753f', '7bd542c7980a1c65b572d0704ee6411b29f8a8de30f079cdc8f86d012f7ad091773941ef6882907c', 1, '2020-01-28 11:36:15'),
('1c1bf28b0b00b5560c05bc6571a57bda6a3012fc794400fbcc6f38c26fd88dd66e3db57f55ac81a9', '66d8f3aca00e0b80d236b7444710aaa919fbcda0bf946b1c80f49f25ab6f6ec69e3d24ffc7f6dbfa', 0, '2020-01-28 11:56:58'),
('e18475c0fbd5200e44b64d2872f5f46e3e07d2e43d1051be9a1c79cd0bc49efbed73f14d90fac6ba', 'c57dfed7e8de84f92037cf41653408315fa6131b0e6101a8843dc60a932b3a3554885b90ca243edf', 0, '2020-01-28 12:12:37'),
('fb037147ed629684cd2a7aaabd67db9007b67afca691944383e1e6330cbf18a4a14924c7d1f77ed4', '43d96c5ffc24d672866708aac56e081e2c356a73151a2f5904be2ac40dd3929fb71c85092ae78b63', 0, '2020-01-28 12:18:57'),
('d7d15eeff864012ed5ed3850cad17fb1db7b6bf643dfc6943415bf26e6b90fc6cd3de3035a63e8d4', '74ab2a6de01000492694c171685cc6c5b83cc2032137a6117cdccefaf7e87208ef38bbec8cfd9393', 0, '2020-01-28 14:21:48'),
('13f64f0e107908f76b51f8601681b58bc39891cbd2d22c122fc5a68f86e98c24340bf7899469459c', '384d3a1080c566e284d24cdbbdddbd55025b51a199ed6bc205ab30607f3aedfbf7e1fe8bdc047944', 0, '2020-01-28 15:17:05'),
('05782a67c77a7ecfc6f94ac0e752966367e72026b494062cd1a21e1ff55d2427a78d33df79c96856', '4f4031bb6f51c3b15067727f4a6dd4f0ffcae7dea1049892385effa210140376dc888f43afdcb63d', 0, '2020-01-28 16:22:02'),
('78b7ae439634a5f2a9e04666498119a70c122bc71647d76a8f3791632e07dd23f595eee1e99eec65', 'c40db50e4dcacb0b39f9117c0e2e3fca0acb394839a56db8cc0811eb142c269aa05e17847668f3f2', 0, '2020-01-28 17:29:40'),
('550627983f4075eaabe7a5d031bcee593b5aafe51fb360b445ada5475972f73af53a0daaf4d65e0c', '1670c120cab0b51a79e43a01c402c86f00869f2faf548a1224a86f5c98afb8fe28fe50d892211015', 1, '2020-01-28 17:30:40'),
('217e842393db3a0e5d61ba8045e42b402675f8f780da5983d5889bf58e491d06f32c502732d2cbfa', '29937c9d4b14198ecea7a3437ff618a74cc76c3d6c00afabee58a08c34d93ceba568e29a7eaf5a7b', 1, '2020-01-28 17:32:57'),
('d92cc13aa5a6e604c5ce15b4609e533370eb5f0fa6a7591bbc07013db3be8f243eb3f3dd2b2331c9', '8f0fc53f278481c305c540ea1c8f1b72ba1bf45acc88acc3c0123748302f830d8c86b5b010a9ca52', 1, '2020-01-28 17:33:01'),
('74010496d753ef37589290b9c556ec69d042af13f739c9e0136d9880255fb4212f2154ae27fa28fd', 'd122294279330c8affea8804dc7903ebbf29ae0f3fa81cdc01cc0d1d679cffa99434a34517d389bf', 1, '2020-01-28 17:33:05'),
('007e5b1bfba9f0b66a2aeabc4e441cae78f854f69610baba508d10044cb2bb6547cd69669237f9a9', '664b8253cc3962af42e692a1f0cb9888ba677815cd2927afdf8181db1bbef8c6ecf2594f68c2d597', 1, '2020-01-28 17:33:08'),
('171c2fff0c4b2023f116477d5f0baa0e2d760b5955ebd96898fc9bc45b68cd9a4e5449f271f68cee', 'bad7099ef513518f80d5849a7304787f0a58e1ff7a429a33df167a93b821b15ba2e5b8d7d37f4211', 0, '2020-01-28 17:33:11'),
('59ba4ca5be87b1c9a965eeaa1f6338e17d3069d97a80803805a198552ab9a322c0b39f1bc2410507', '7317ed2226115d16c40d6d146d9ba03a1d487abfbc7fb7d82d1b83c1ae8b5b7ed917ab1bf95f7415', 0, '2020-01-28 17:33:57'),
('b925fe7ac30435d2ba144be4c824310500861ac076521adac7a4b588afc97cffbe800a7508379053', '375cba8e521982157f6b5c6fda5b8610343c67a02a0e8cdddd23440d3e473cbdbd7d452fc89ded32', 0, '2020-01-28 18:04:18'),
('2e99f58153cfc70585fe10e20d8f3a6572bb07f1750248c0ba2c9cbf714a0ea599172ea27114180d', '6437a09ba03f8c223ae7bf2d62163504071eee9ba09d3f1e960eec809df25721c385f7a5a3040d87', 0, '2020-01-28 18:21:05'),
('87762331266e054a0c2d74ec8314514338d0c0371a4fcd5b3453a0b78418a57fd9eb10504260d05d', '10ad577f6559a07129e06c72acf0f8d36bec5a57a358e9246bad9f4ef5efb531af1e870661366f70', 0, '2020-01-28 18:22:32'),
('a190cbc9de340834ccb156ce2e3179b0b9895d02579550d6070d7d41ecc6c551b12369c3e706c70a', 'def272dac66ea75b87178b941a4a3b6326b6fe161ad8fb202cccda7f00b954bdcfb6bb59fe520dcf', 0, '2020-01-28 18:54:36'),
('a2538c8ced9573480e4808d313ecf907bfa0ca10b042c3446a42470d085fcab9fdd257e0495db3ee', 'fc53768e4e8da6d1fbe7d1ba4f55949743ab164cf29708af7208d39baa086e06712d8da96723441b', 0, '2020-01-28 20:14:53'),
('6ca5c663d59304ad6d2d6484d0d48d2bf48178ab0f9ab11fb15c68827be9f9c39fc251d086a752ca', '3276657b1e795a22d5e12bf04f2438e00ab3e7cc3e800e0859904a06048eb7639fc92adea9b4f3de', 0, '2020-01-28 21:04:50'),
('c2e075b3a2bf0dc4c11e2507bddade27e1634f92667f1590b5c481d9c33aed346d0059718f247749', '3c0157b6c0a446936a3229167b609f41bfafa2e26b53a593e6e6b280a32a2a31dda3623e0ba30575', 0, '2020-01-28 21:40:31'),
('fe8cd60e2a344819a5a85697d139e0b9eb3a1b0a84edc89b7d3817496f59569ebfe44501dde227ae', '9b181d41f576452ceba8aa64e50e295f1349806c03af185abe643cb1a33cf6aad240e299bf9cfbb6', 0, '2020-01-28 22:51:19'),
('a59dff95a60ed7972bf0c9f037f0b123e6b471040402d76fee6b8a4231b7a4bf656b0254ff53d776', '743e62aa75160fe67a0958d7018ef4e8a1dd390ec81ca819d23ab7217d263be9573c64b02ae6f724', 0, '2020-01-28 23:54:43'),
('5260c43d12001603a8240d2eca6a61cf794c85d066a3b2e02426b6406be542ffad330b200250ec35', 'fe14a3ebf005130e684957afbc2e25252116c5d0cd738413779b642c72c26c239127d4c9075c4139', 0, '2020-01-29 05:07:54'),
('f6c8db0d990c51a1d79e1aca6510482a7d957e00146d58ca6230951a05f246e7a116b42ba74e955c', 'd2fa886a787026c4b7d42e61be7e707303dfa6c6323dc918e9b57da35ddab50ea8744917f7223c68', 0, '2020-01-29 07:02:39'),
('b5e12768055d683358e2e0cdca652e52010a0d6a303810160912f363cc651c7a444c022d85d3ae5d', '48e4e7aa8e71e71b7f997cc6c8b7cea1f1e2c8dcee1c6b6bd2ff289b30e5cc7885c798ba5c5fe2ea', 0, '2020-01-29 09:42:00'),
('0cc071d5e3f021380a235d12b7cc0050224ab55bcacdf8c189719a369bc419d6caf636bd774cde7b', 'c304ae59dbb95f6efb81d5f5c90f2b9cdae15be2af0cb7018ce043483a7270b85c37eb1e62ca3ab1', 0, '2020-01-29 10:29:23'),
('6ab82f8855ebd3c46cd7e919ae0c5c12f24b0e8dd9d3abfe7c7cc682b0261cb1696fb5f0ffda2eb2', '88d58321fa3300c6335b417e6f38a951b108e5752012e5d5f62f6352c6ffc520a6f5481b9c9cba88', 0, '2020-01-29 11:03:56'),
('81a6b0069978cdc757f7904bb1c569ce87221a780561ed64c99739ab3019f4aab5ec6fde0157d8a6', 'c7677fe31bee77c567cd084bfe22f60279793e59dd81a1ee5b3d7e5537888353e0f15690da128fb5', 0, '2020-01-29 12:40:04'),
('fc2d3f0c5c3eacdd8400646aad1328815578af0a7405267a254bf1197af7496dffbfef3d065046ca', '52d6fa5651a9523d7617972f6ce326d8be10494a3673d713f52b33eba8649755decfd5a4f00b17d3', 0, '2020-01-29 13:31:58'),
('ea3edcc95e6fddacbfd8596da9390928f0bf43c054a8b380215211f2a416a42e71d4669c9be0cc61', 'df8888695d697eaebe9bf987df2fbd93b7a4f4d2b3dc499241086263f39492afe465adfe755f66b7', 0, '2020-01-29 13:38:49'),
('fa81489d7d07c37c644da2db4b12354299777862e7e4ade947b42d58d53626e19cfbd5d92143340b', '1a04bb240f4adf7fd59a1d0ec044136f7c5353c98a24dfb7fcf8cdd7982529c7caaac6f7bc4079ab', 0, '2020-01-29 13:59:22'),
('d6a42505b8ff7a6ae27444eb7a888071b0fcdd008806e5c9a17702b5ceab2c519442c1731dcceb4b', '738f5c8f997d0d2093b5f4c3c67e3ad8037dd19caf616f2468a5e066823c9f333c9b8922af32878a', 0, '2020-01-29 14:01:28'),
('fac07052e327428ff47279283c5b94f181d8befd92f4dd1b2990448cc01dfbb22fd54099529114e0', '7b6429db19d8cd641df130603c4027158ab7f746984929d7f9c600e130d2f63f48406a9fa1dfd2a7', 0, '2020-01-29 14:09:32'),
('60c0d89ff68cd65dad57d372d984fcb2c1276963e6062489e39bd08206deefb9f99e0526745aa4cf', '14c0cb89a787df35fa5e8a51b9a1a3cee16b1930d8564a301520afb22a8674507028a5016450a772', 0, '2020-01-29 14:10:57'),
('48bd80ac2d84ef8935b22aa1e2b78b7b7a2c68bd5bf81475103d5e55691e4d8977f970f9121d3dc6', '19b28a12ac7785fa77018ff7b0c71caabc6e7b6ea93022399097f47d11677df119342b67870be068', 0, '2020-01-29 14:20:04'),
('a49ef515a80de16ad14090a94cd35077581de6127ca7fe743724ddceb36546f2e3cc6b448cd3fe75', 'f675832364ffc4279509b29f0eeed5cbbc0f7c892a315094672c865be61febaaf7456f1af7f5ad7e', 0, '2020-01-29 15:20:21'),
('a921d2e8adc57b2f812dab4d352208f0ca3d8b41a093608c691b723eac162c88907f88b1f9cb1a61', '9b7ffba88440856aeaa8c3eb7db9f04070f3695e4a582ed05bffeaf1a8f07630636f5f8b8bc6db71', 0, '2020-01-29 15:47:10'),
('694a97922eaf99cc01a5448325f60322f22565d553bdeb8f6897af042c65735f6f749a78cf30d6a1', '896ba6dabf46bf392c249a2bcc3fb09536b1aeb9e3e23dde262682ccc5aaf4d0539696889c7ce620', 0, '2020-01-29 17:55:49'),
('93134afc39a63e916f3e42fa534029276b443f5e050186a54afc918a709733cfe4b53ccf68a833c8', '7dc8f7ef66625ac4f9cb6f5daf27ce1d8b65250396f63b94ecc6e789687e84597ade21f264b429bc', 0, '2020-01-29 18:11:08'),
('b17fd2ebb86d2266c23d4143831ffc4778b042a8e8a36f1a913332456cce6a0a977b7ef2eec22947', '93d361510f5b6cb954e2710a763b31b370912947f6189a4b9b1666c432374f9fb1316c4446b760d3', 0, '2020-01-29 20:09:22'),
('494f053eafab8add2d4a37a5e062054f6f2c92d52fc2b6091e4c634f0cae5ac9e68d9e6db1017a5f', 'faac24e354ede450d77375783369fce3782c4f09a5a0a03871104eadc0eb142b44a2c228d7cfa983', 0, '2020-01-29 20:32:33'),
('f6d62e35db1e92a93c4b527600cf4f58eacb649153cab93d0d4fe340da13d22efc91d31590c4e131', '3c8397c0020b941366a3ea2b9dccd995b35f945ad991824fb3108cbc279c2e8c3727547a818a809a', 0, '2020-01-29 21:25:39'),
('2b92d06a13b9d2b1b4b8d9f04abce869485c18e3cca70ff33b43df0402fce01383b8df430f283e7c', '3087d7e044f11d344e7658f934dd81c16100a36392c32424f8c55db1575578e8efc7592351c1e559', 0, '2020-01-29 21:27:54'),
('70aff570f565a5e56ce6b82c8b6c67b16dfea9fec3915f4189bead3bd34458101b5c773c6d2342de', '0aae13b301e0daeb9ab105c06689469b6926add19e7f7ef2ea2feb47bd81445d4539e084e003869c', 0, '2020-01-29 21:44:50'),
('4e955737fcbbe9aebd288aaf4ccce532c7c951cbb6daffe93eb9795b410095fbdeb483d50565164e', '96499f4ac47dc832f737450f22e07ee62704cad8e2a0170d1fe2e7883736d389bbdc6eaa0b425d10', 0, '2020-01-29 23:33:03'),
('fd954033ab6ccc622ff288f4f1cb4f571cdd603d398f13fd774a5c7569b99039f8e684146b8e1db6', '638ea4f53ecd358e3ed47cb7779cd0732b6f4ded091a2f1f834117a8842ddcfa133e1b150f1f1b55', 0, '2020-01-30 07:26:39'),
('a5aecc6a5ac111cc96b6a04c8d871e9d471ee942408cdfb32698c0dce7e6a0982855f82a2a82cb89', '23dd038b28b127d71fae66bead1be99b7afe75f7cefcbf0fdb03b7fc82a0577ce6253d37fec98f4b', 0, '2020-01-30 09:00:18'),
('5f1079fc3a11f4040ce5c53b696c491c081845915c295add36a8a4fde059c99ee98ccc74d8fd24ce', '0ba3a1ed916b33b3ade8b2975eaebd86cef3a8800b51fb2571f65a066cf09de8ddeafbf691210137', 0, '2020-01-30 10:36:04'),
('9d207c8f01a1bab49a7b8e701ebb4c1b3052adab61080c750f5cda0ed3ecd3fdbad00f1d24d54232', '564aafd6aa35e70f9cfd8bbabffbcd6c206280a320eeb386a60144c7dd91fb0018eb29c64abff1fd', 0, '2020-01-30 11:31:12'),
('17da3ef50d73ce3ab5364fa1ba3a82ebb01295418ac8a1d8258d60a23e02ae771af7b5205f0895d2', '5c65adf104acd8572b721c698dab80f2df9d1e67b5b84c607533bdb809393b8755d8c7d517a711fe', 0, '2020-01-30 12:22:31'),
('2959dbdd285a63428af9996d72f25cc19e3a628a79f5c6f357484895c32dc5989e5fde73b434fe4c', 'dfad2cd8a95322d9819dc701b87b22d11e14f3504f4a7da2b170d3fea3337952bf844fa7f0cc3474', 0, '2020-01-30 12:31:17'),
('54ff46356be6892638e438a7bbef9a558ad3326d998f4ccf99558288b6183aa2669606ce531106f5', 'c596e48059bc6773ed98a69c1d9076a4961bc0d3e0f164ff09ee3d565fac64f79ac0af5414f3c81b', 0, '2020-01-30 12:50:36'),
('31f7813a1f3aa9b94218bcab842407d6a033a0d3837272e5206075d7e95498ca6fd9def6c57ac5fb', '25d10ff2b3cbc8b8bb821c15522e75f50c3fd8a1365bc684e2b69ee48c289938a13e0d4333c13960', 0, '2020-01-30 14:59:16'),
('0d0e9d8adcfe671371099c84702839713a50d4da1bcde11a8310a7899494e5ccb9b652ed73380c5a', '5341eb83d385ea524a7230ab6dcd5213f4c729cf59f644734738209c19027ad704fa551f621fa13f', 0, '2020-01-30 15:02:03'),
('fa26c210ea51b64f9daf8a5f47ae85b07e4d6412d11fb374cceabc2eb2d8da60a91dc3f87560eb4b', 'f10a732125557ed76438ef829309de26670666170a6d4ab1504ea3dfa8737ca0cb95a629521b0625', 0, '2020-01-30 16:57:27'),
('82d7fd5ab21004b5b1324dc334a91e50f05cd988b034d767fbebb30d2f2124a829e00bf1666033fe', '8c2804484e6ed97657a8c16da9954a891a0bf088e2f863a864833b39bc7668c1ae964297dd485198', 0, '2020-01-30 19:43:05'),
('1c1d939fb92d8eba83bfd8cbbe75ec2d9dedef91e55762cecfccc1d7e3c8a036ab86254073857f15', '51d440be496de9ceec4069023c9ec91da3274a7480cbdf1c7c1034d02d059d432c10d3170130226d', 0, '2020-01-31 04:44:21'),
('17225f2214c3c3d5e50ec13088486b6f67e1eaddced6c50fd13aa4ca8fe33635faac6f2198dcb9f7', '7c9b4328fffa00e0bfcfcfcc87d70f2119e600fc492a8ba95fa20a4e3b4b9972a8ed635c5f0d1333', 0, '2020-01-31 07:20:34'),
('80caaf0123e175a3f8c19bc24d1904c13123e6e8d7e6d327e7efa257add69cf77b691ebce1c2b193', 'db92ef7f3ef1f97c6e3c9e52b703696a119892a42a0fd5a0a7bd2590bda7055a2397382dbbf1977e', 0, '2020-01-31 09:22:58'),
('80db87a149f3767c553db2858e0913e8a8d1a659735b947cec1f83310800f4c67e294fb661aa8d61', '192d6e3a5ecd69dae1f72f34f5ec847a074052430a739871a6f0761e71f787438fe70ff7062f8b6b', 0, '2020-01-31 10:19:47'),
('f08913b198457cc33e3d8ac68fef488cc1ee2ea21fcf3960154add68e6bb14d59836eda3ca96ca46', '46a3e2332eb23517784904686948564d656d622a26807013236856d9735c522035bc438c9fbd8e1e', 0, '2020-01-31 11:42:43'),
('614481fbab364810c850321d2fa1cc445778b58a18ca6fbbd9fb5abbbe0118c7fc2b4bb1f94296c0', '573ba29b270161570da7add65f516155c945b55b2da16b8ed5ba8017a232046d8455662f87987ed2', 0, '2020-01-31 12:00:03'),
('69f694d13eec84ac683b9a6853c11654a91339724f3807e54552e51e487f141bd2e8428f75316e23', '4aaf7044fc5365d10f9577441928b69a0d7a915b4bfafd5ef1ef5e9fc7d835835eb213056839f7df', 0, '2020-01-31 12:39:12'),
('78e12a30e57968440e03a248c6ba6f87a987882e57c728af709890e6983fbf94082f44470e28919d', '7cfe98221c3a6775a7e2a2a1176004613d6e94a842a22fd8cbea09c8d7af5bbcc0a02dcaa4b521ed', 0, '2020-01-31 13:40:19'),
('e526d76e057568b49a7ab42e03febf0b1703882dfba5e68ffc80b3a8527c2e85616b7b7196b48413', 'b7a78996446e92092a4d4ae5d28f7c5dae0f5e95b73e618c47732970fa5652caacf8d8474d59a248', 0, '2020-01-31 13:42:00'),
('71eddc3c21c08d8a687086d633e5519546c8663ca25fa9223da866a6e294cd66cdea1fa84542abac', '98977eca632e56335bcaaa638a49139a82ac2d090749ff7c368c82090cbef6a85f941c97b1729e05', 0, '2020-01-31 13:50:55'),
('bd15d9afccfab6209b1df65ca233d45eb9a0cc34dc67c925104a1b321db7cd9c313840d1b5a00f25', '8ed4ac2f3df161fd0b02cc55913ce0756b1a67c8cb980e74f041bce230b7c68f9a22d161dee78c4d', 0, '2020-01-31 13:52:22'),
('fdc7f9f78c3549f6d46ae7eeb3d5cb5a760bd14a825bdf132ead781a0071131ff56498d8ccda1c96', '1b68489fc7b0baee6cff13f2e11dc8234949fb26c53ee9119470bc06d37c0b7defd7ce75ad6ea389', 0, '2020-01-31 14:07:54'),
('563214476261375ff211d26aaf0901ea8c9087b7ed68badfd4213d1ffd86fb0d464de7cfd24842bc', '9e0142880e1f5e918bb87aac1960a16927542c62a7c1c936aa07bb3deadec4bdee8f52cb286b8a24', 0, '2020-01-31 14:23:40'),
('b449b83545c17a32b06d1a1acf3cfd2e18711f42fabfe3f08bf01aabe9d232fccd95a159206b6a95', '9e9e0fcd458dddd6f47b454fad0c0f39504790c29f31fed43b8129b30d4a84b67168720319966e6f', 0, '2020-01-31 15:08:27'),
('7e6bd73fb9586d9f7a435fd340305f8f84b4f54d0acd699569bbbdd886759405bb0a58cfb06dc278', '3744143af3fd1104e5d3c9356511325bc1236abb4fc91abc3a9184dc298abfa154068cad0df67b51', 0, '2020-01-31 15:19:04'),
('ebf6c64e313c017981ea6b775f4ebe2b03f773ee2e7e8581a05cfaf1c51458f5c6a84b8d5429ffa0', 'eba9cc4c22a68d8e381b0ae92a7627b81d07070313807d8754d6f75adb509c5b96fcaedf5b243a9c', 0, '2020-01-31 17:16:53'),
('1f7b3212f1fe201850f4001c0ae277cc1701fa6f62c129ebca0c31321b4722b7a786e8f8e581337b', 'e169cf96063b8db0dae571529e8084ca71323b6c4ae5f904cb6e9db29beb163d97ef92d023511037', 0, '2020-01-31 17:40:35'),
('65bdb677568eecab6c9568c82a837b060d260402c11cbd8aacba3bddcde0c47d9482c7c0ce816c82', 'ecb3ebd91087193970b9e142a6d3ce0ed57a59644924af6c0f8d9d2a66f3128af36cd73a387e7332', 0, '2020-01-31 19:03:38'),
('be2517d8ced395540488c7c2186b5d1a81af569cb7fc3763eb12f6de0e1bf23bca9a614141cb81df', '2ee72ea22888eb4b4fc05e7e5cb4a3ef3e51725bf170c27529d9ecfb38fb00bd73aeb3967f85cc43', 0, '2020-01-31 20:33:45'),
('96a59a893bbeda8b047c7fe9aaf3cb1d0560d0b3afced3f66cfc5199521325c6ad2f91e884ca7298', '6fa79825a32297f43fea31d5b63233281f48d39fa3acb886c9938d5f88237ca172ce21cf2baf3ebe', 0, '2020-01-31 22:01:37'),
('9574e79771a53c0c49773a4c8e7a7aaf75b866cf06ea3ffa983d8fb4938da03d99cccf1197fe241d', '4c90aa5f32821cb2f8d735cce4681f8964594e6fa7674c3392a675a995dcb9b2709d74c0b29bbeec', 0, '2020-01-31 23:07:17'),
('e954e50a6138ea9ac3b9fdcf759cbb04d350469e50aa8483baeb9ac48b416add77ae40ae2ea021ab', '54fca381228493f10e5a4c4f5ada9bd5292a7f156ec18d26c96c260e1e26e7072022addf852b53f4', 0, '2020-01-31 23:45:40'),
('7986985735a7d0e953cbfb090972310e417900c37110a4ca06c268295fa64b1e4abe49d400c3c721', '8ca1f20a0a7b5b3063e6a6c565dfef910dba11460e2a9638dd81b4eb7030f256fa84916c508dc81c', 0, '2020-02-01 00:24:10'),
('f84fdeb2c4e38befbbf2d186473e050e3e6aac3d206303ac41d002b0d8f65cc90a654bd0f5238b90', '541ec6ba49b08170221c941dc4c576ff14eeb13ede9da0d1e6f5cf18d79faf50515170df97f8fb1f', 0, '2020-02-01 02:24:37'),
('931fe7dd810d354a535dacb57127f10325c2223333fc0909e2b238323bf3315fccb5e023598573cc', '7ce599c7909cabf1deaa9fccc575bbc08236025c5a54d4bd9301889e5282a726be3a55afa1e96a80', 0, '2020-02-01 04:27:05'),
('e5c505e6e59fbfbdf3dbca580373b84032261a157fa39c949ca8458c9a1b2241aabebfa4cb7afee8', '715ba878568aae84bd52d8b3ae938eb6941060cebaf2724ad939d6547eba992abae2a1a70925573b', 0, '2020-02-01 04:47:43'),
('30de644fab6413f8a3b62c407c19d361966218dada710f37dab3980bea0e1072752c91f9287880b7', 'cc2d40b012966516dbcfba10f1e87e12392de68b0b38387119df3dd41fc6e248fe29e1466bc622f5', 0, '2020-02-01 10:29:13'),
('688cec345db43d7f3bb5c1ab1299da542be3dc3dee04efc257e82f39cad7e50c188b2fda1fc83caa', 'c47af29d06da6546b8e8919270a5cff264dff0ab7e53ee6bcc3ae669b588206f2daf2faa26ed22d6', 0, '2020-02-01 10:39:26'),
('02c93ba909fb0b0b260ee8cfe5b8e182ee4895dd2c756972979c758aacc903a2acf01637563ac84b', '432cbc2ee0e7b22e4a7e30b7ffad6f29f0d4d0d8bbf748451eb3f6a4b46a3f1a23bca22a74b83c43', 0, '2020-02-01 11:13:18'),
('1186bcb11cd302905ccdbdcfdcbf37017060806368ba74d0ac9e211f0037e550ba1a5936dc07a767', '9c14afbe4e8097d5718dce7449cdc71370a05f7c8832bc8efd193d614e742e08259f0d006869b1e2', 0, '2020-02-01 11:22:26'),
('365b6c85363b39a48b285b29198121606046c01607c58c8fc539cc3ed2e05df8c90ce8b2f052f536', '130677551011e9944b2b1a6341f0409d7dbbcd3fc8878ba4e8ba659ae51c8c7e5badedcd8c46ea4b', 0, '2020-02-01 11:42:02'),
('23839928d0e4224131b0c25b156ac15f36fd83df36b0f3976bc97b0ae80fcd28f747400e8215b82d', 'a5535c787b1705b5e511a12e7b155effb1d05091cf180cfa5fd227f5f38afac8092b4e24f7abda71', 0, '2020-02-01 12:08:13'),
('d7a607a0b66fb2b3e63430fd237e93e24014a870c35e067fcafb810f53b56c4df61822bb4ac7975d', 'c8ac9a3b819816d1de5bbe8c3a1ca2b3efd54ba387489ebcdd7d573c052c075d2e96f1fa58394e8c', 0, '2020-02-01 13:09:42'),
('beb1dc84d952d26ea9e54c4164cf4b853023bd327ae11120fa721f327f529f3b61cc8a477395bae7', '85a2022cef00522ad66f0e8dccd241453a9135f4e4d7e14fc32df047620eb7dbe3cd6398fcd4254d', 0, '2020-02-01 13:25:18'),
('66f0938576ea0c624460284d5229841f460831a63032c23e08d0afaf7ea1e301b024e7a8d2c5a39f', '6997fbc3f1a7993a61bc482b2506dfb515585bb6944d7fe4630a93a23e2c3b6ed9d343b0179f0139', 0, '2020-02-01 14:35:52'),
('7ab4c06b0e48b2fedb0f7f3fa27866ac99a0184a2a60e24c72ebb3da0ff0a227fec64a245a666883', '072c6b5bb7ddf57be8868f1244462774dd580d648f32de020643faadbd812e3f8b6ac21d36dc818c', 0, '2020-02-01 14:38:34'),
('f6994cbdabcaaecaa18b9130d78f7ce117ef563fb291e14f4decc2456cfc1f09f8a2bed50750c521', 'a5707ef8d6da5a68a297dd85702310ad84450a5774f6c52e2d01f7a25527675df8e7c3bfc929b89b', 0, '2020-02-01 15:10:28'),
('85d57acc1e2ffcf8a1374908513ab3cca3f6b04db2001d9a9cba3df470eeb664819f52d20ab9d36a', 'f1d2fe67af0d4d822fdaf3b6d1a890cb890ae4376a4e43c1c226fe04b0e6ddb4fdf1220d1468900c', 0, '2020-02-01 15:30:11'),
('e4fc0c900591653b08e12b18e9fd807a308acff1858b3df676497757f6866c63cbf87d4c166eaaef', '7a3e9ac7c993c7253fbc2a50944cb6d65096fcbe9a61924784e44660f71d1b63a0709cc035dd0c61', 0, '2020-02-01 15:43:03'),
('ee9a210b514f2454bd533d0d01d797be0a0497c21cac0f55466ce6068f48cbbf2a354882abf6f201', '915376b27f75f5272005182ed9fd23bdeb44bb075dfbab7bdc14f3eab8aecc35efcf5c75401deb9c', 0, '2020-02-01 16:03:11'),
('9d3619c6dae11191f0bc06966f8dc924541e4a87b4adaf1b62b65c8d55405faed661140e395f08d3', '21a09ce762054c2cf9cbb3248520edd034f37d4433c04f2cf97e1a0c50094e4b8125d463a21561b6', 0, '2020-02-01 16:04:26'),
('f1639134bedc72f8b07e0e2aa7cbbe1d1550206e7f9d3ecc9fbc0a41d6ef7901e72f6c479594cee5', 'f6d21dba0342851f489ad0b27e537b2e9835c47ebab349b85f869058cd33e5ae950e369a5ba779c8', 0, '2020-02-01 16:31:59'),
('0bfd881f6c0977705e617042acdf2c1c9e71e8521551e1e3c49cadb1639a922d2a0634ecf2baf7d7', '22b6e92f0d6ea5b5bf8bdef9e744698f645758a8cc0cfab58aea3ee4b6ffcb98d8e6d4dcbecd0a8f', 0, '2020-02-01 16:47:34'),
('afe40cdd698c467fa94cfeb58edacc7a152a5c8997b0d856a339b5e6bd81fd137c3fdfba3ffcff77', '0526a1f9ac81e3223bc5ed326413f1f2696dc376385718dbfe455a648ba43cc1f43d123a46f56b83', 0, '2020-02-01 18:38:47'),
('f868e4f471668e637b5282752d95f4b7812456bf0974c8b8fb65663c019416f5e60d89f976e12369', '3e21c884c3d1a1dcfea728b26c1e9f4ec5cdd80c12304251a686ecba38ac74d9b1c4f96163e026af', 0, '2020-02-02 01:03:06'),
('500b42cde9e4c60e7fc78858f25057db29d2a3ec49713e5194ea69259460b1f1a7ac780ce7c92d31', 'a283c4bee3c00a379d63b43314042153d9a8e3846e6f2942f7222c63a78f4f20ec1842ffea626253', 0, '2020-02-02 09:39:01'),
('be44592b22d9cbf03101d8fa9b4cdf2dc6acd6c93f987e2e8be0c79ddc2efb890c0f3b58a4724879', 'c0c08c420a88ed7fd4fd4d6b343a6db6cb1f9085c747a7c7c33f493f0bd623af7c22c420aa6cac6c', 0, '2020-02-02 11:14:50'),
('20ab5e019ec6ba7081fe987ea777a196b12bb6c19a20f5e95a1c331fde0d53955105c1ffae1f3c50', '78e72ac943e725498350ed9e497b464c84d60096833c7d61f6dd19e86b225cf0a28de5ddbd80adac', 0, '2020-02-02 11:48:40'),
('02b5617f85104305a94e44206adfb5a94124c63c7d58a3c5c44fdd5f018cc85be9eae165aaf67b84', 'e862464617c741616309e06ae9f8d3b720d0451e1ace0503f9a045472ddd1a40d4cbf1dc660c4624', 0, '2020-02-02 11:56:14'),
('77a4de107228b471dcfb87b2ae5b3ea53b6daf7199077d6e515de8c6787422a1f08d35260280fa9d', '2d2c3b2b25d78aa4b97f104e6187ec1bab4adc57a4c04f0edc0ec733f5c41077a472ce2355fa495a', 0, '2020-02-02 11:59:20'),
('ec9abccba78500adfbb9639f59843750416e46dde7bf64fa2f82423a488cbaa3a374b020301c654d', '47261398577e165d2768ab080ec1cf725ecc745dbe68008790d67c7e195ef0e21144eadd5ea8f678', 0, '2020-02-02 13:25:08'),
('eff5c0bf9197f89c39864bb83faa81970ec872f1229acec5f430d65a710b9cd06ee005cadf2bacd9', '9d8f8832b1cae5074c7b9b501b22c8a87bb8f5624feb156e542dbc390eb68e64dd982356aed20b6c', 0, '2020-02-02 13:28:12'),
('19c46f50172ef7b805342edcafe95a5bf9af5ee0fbde76df0ebddcd525e77b185eaa16534eb187c3', 'f9ca7b1f5f6a711024799bd07e58928a03ecff49f7de3563b0843d42a86a46bae9720a53eb0d6fe0', 0, '2020-02-02 13:52:26'),
('05c91c6b55029dff35ba824d1cb7171ba72fc833435263dd6784a3098494a9b88ad85d09c00848d3', 'afdf6e76ae03eeedec939ab4f2c1731f2b6d5615b48cd29fc25a0f7fc0617cdb68314d0eb7784b54', 0, '2020-02-02 14:55:51'),
('1bd79ea4179ed82bc79d70a1ff778a65d3e22b1a17123935160e73814962d1883da01ec58b69492e', '087c9c4921f07482eec121e2e00b0679c807667caa0fdafc6ce9e890a3ce77235f4405777a01501c', 0, '2020-02-02 14:56:36'),
('6d0c355bb26ed168d3916a6dce4ec3cc6bf6aab9eb58c970dcc8f288ff5d5af69d427cfac268d5d4', '5fd8e644dd37362eb10e5a510894e85c88f5ad3e4569d32c1070cf37f9bd805f1e79960da88600f8', 0, '2020-02-02 17:37:53'),
('88c6558fb27cd6f59e67aa48da63f514eb52f8d280bfce9e1fed891699a8c398a9c65cf6a7e0e442', 'eeb880cd43d2e7f1106f60b7373c74b9e0132d235b989e27496946dad538cf515b1c4d3b14faa6e1', 0, '2020-02-02 17:50:48'),
('c141316c5398fb0d6e9fbd636744f646aa62f089a39288c4379322a09a06c769bfb3c0a9293f370e', 'bf82ee03397895113e382cc02153f24a8fe0a80dc7c2eb6e5955cad49a2a6b247017e75f2c640456', 0, '2020-02-02 18:53:51'),
('f01f17b2c7f0528450016db7550b7622e7d41330a47506c21c9bacb8257e761dd12914079e271986', 'aa54029ffb59b4299e04fa4dbb341fc1e29726d15264b542212bb6481c38b4c07a9abe796c3bb4b3', 0, '2020-02-02 21:16:15'),
('77697d2d846a28197e67c536f060635ef9634826adc6b2dab7448914a2d45c2cf9f213fe5646f3a0', 'f8a7f4eef77ef8d4f151251ed0d19cfa74fa34b5cdb84f832ffc0edc829e35c1a1e8253c761ca4b5', 0, '2020-02-03 00:12:25'),
('8a2feac7d4adb362203ece82765d12ba2f042ee4ea73e70dd6648b80b967baeebe838c171f6097d0', '41eb347ebde244cb904c8f2435a5a621ac6159ff659a507bfa28da491a76167f8f8620376503c525', 0, '2020-02-03 00:16:36'),
('4fa06b504c4bc70cd4c897a09689dfc2d505afb8f0e24aaf3251fca45532289766c2d4541a37a42b', '5d96b49cad8edd5b0a8dddc689209cdd949b36e26fb5c0fa9f03ef568bb9dfd33d825a5a97762dd9', 0, '2020-02-03 03:11:23'),
('80a4c17e5d5529c733a029ef5e8934e20c0deceb46b76c1f287fe1cd2e1cafc01217849ce302a883', '31288df31878571a4e622bb4c67d6b8335ee57b0ddaaef62cc82d81a7313575e2d45c6342552e729', 0, '2020-02-03 06:46:34'),
('9ce07d15667a77a951362a0ad323bc1f99cc12e240273f2312919a3c56d870fada7cffe008593c83', '4885773589bac9d112b284d19069aebab9cd32aef0201e2c93c437026f904754a0598ff83b531844', 0, '2020-02-03 08:21:20'),
('47f3d496b884a0ca6cb9ebe58a4584978f0255b2eb7c6954507b13f1df69e231fee168d218e1caf1', '02ff6cd37a0616e3b8c1cef7c42244748bd3b2aadd3a44e76eeadd154023f6f3d0a51d6055c20d5f', 0, '2020-02-03 10:11:23'),
('3f9e6fe331e26f2c0948093c9674f512d7e93a8709124c4e2a06e6279b8bfa4666b81609f7f549bf', '733800728d3455d350a40846e10cf85f007f0c630d085c78038f33a352102ff9b7ce2a08d346b948', 0, '2020-02-03 11:32:33'),
('b64928693c2cf2877743544f13f7e30579e4f61345364966dc0e0774976857158eab47f6bd897b85', 'c4b6f8716e77ad25025fa3fdb7f04fdf8a442b11e9201df215b477a3bd0f2cdaef389ea6a84d8b95', 0, '2020-02-03 11:33:14'),
('0affcda787147fcd03d79d1e5cd503c31a3906e81620cfd2aec1112b72fc25f0ae35a25727c9ca9e', '224a887bcb091788c77f2ef9e739feb8dc601ba24d57c8495c76d75fc445d0b71c3ff5a63e0fe97b', 0, '2020-02-03 11:38:08'),
('bc08ed4df08a6a87847236732b18df79a998a97e8e19e6d17b10a258bfd2b123c9759f7c8fb16be0', 'c16ab96bac2cb451e84634c33be0487db5870148917f5a833614b647ea33dfe849660e5e744b0269', 0, '2020-02-03 11:51:37'),
('fd01d9c7e33b413877cb223235cb1a4f9acf82eaba67d45fecf898d9dbf538f646d76c55fd6243ad', '4b33bf28e37e24d72c8a85f106137fab3b73e3654824f6036a77c3582c5b4f993042fb11426dabb7', 0, '2020-02-03 20:55:44'),
('5f4578728ff6f3fb73a1804874416085b7814c01030028b75ea803bf70156efc3a4eb9f61c58a5c8', '9c2f56210d7cf5007b31ac7f59ceb28317471f96e36c96a79fc859b03e693be057645c2032f32423', 0, '2020-02-03 20:59:51'),
('d2eb7eca605ef66fe3075830b08fec4b3f3c292abc0a8f9a6610392c368dd37f420a821b6231b789', 'da9d0c723b2b5f6e9a051b6902b9fc8ff89860b1f85cf8a6eadfdd51ec9dc1c72231b0d30fa4c96c', 0, '2020-02-03 21:17:48'),
('46ed205be86d9a42c4ff5780d7bf51d8dfe2ca3d19f1e9a2fd0c891765b6c10a84bc17fec67ef6c1', 'e93546f0c15ff7ca89c97d942f6c7b3c083682456b1ef282342235324d4ba402873911909692f5ea', 0, '2020-02-04 00:02:05'),
('b6ce685525fba4cfbd6d692ae155a8f450b0ec85bb17472112e09aa3d841cc1465cd09d9560b7b53', 'c3ddcb4352cdfdc3c86ccab37ec48f45586fb2242756454edf00c05c05f82084d78caaa3c8ac478a', 0, '2020-02-04 00:20:10'),
('f1c1ff40cc0f13bd13f2d7b89edb240658c7783712eecb925c4affc4ad04cd56cbf1911cdf2a5872', '79bcc2b592bbee6b78af69c690eaf47dbefdcb6fca43d229b40a1b592f941f7d5a1c70144e59e713', 0, '2020-02-04 01:02:25'),
('ea70fdf58cdbfca9766edcfcbecbe5819ecb567be9b34a7ce9feb717b94f0ce3b055778f6a5a61df', '69f95987bf8dd18452d2fa0c855691e855484c1b6003494b79cdb1854c3caaceafe68eb2d6e9bedd', 0, '2020-02-04 11:06:45'),
('0fddcee7d4466808521621c4e7773ec05fc8667c90050e9f2b4c3bc0eb96c61e39b399ae742a4f28', '3de3fa12aa41d34c904fbe52067e28625d81c002a21f04842853e44ee3bb3758be1e12fd46c820d0', 0, '2020-02-04 11:11:47'),
('f5727b51916b0782b9cbe0932d25f27fd236dbc77340f2a7df4781263e25f6822111efc62b0c948b', '902578f9fa5ab70e4624c7cbb7ca0c598c4f55143ae626a1b9523b2f403894d655020c7c1a25a4fa', 0, '2020-02-04 11:40:04'),
('571b51e31c3748cc13a65739719f341cb8ee0c03f2d3cc69cf577bc94312e561393aa744d523ac8d', '3ce7c387de32e3db2469367bfab0bc5cafa854c0141cfaecb4aaaee3e95fdc719311cc4ee91e5109', 0, '2020-02-04 11:53:47'),
('aeb65d3aef9983f152561f5b53399328925d7f5d0554140aa47274a3f23706bfe7541aa58e0411ad', '57be1a27bc56451f7f1c77d39dc72dd95a0f4741d2255614599eb57a2d347e24ab2aa910485c621c', 0, '2020-02-04 12:04:39'),
('03d5241dc079e6814129ec1e34683fd716b04cb121828988e8dbe79bccf423899196e86b6e9d979e', '55a753b09020548e77037590e91e7ad24332b100f9914ede615a86728d62e657490be291c67cd6e3', 0, '2020-02-04 12:37:08'),
('81a9e395bb24b926e3c8d8592210948181f6754a796aa56449deba934a4f62400f8a7fc37a60fe2f', 'c4fd14e69911e2fa649a16a235ebb9a179af45e7d07205b87266a279dabb3c216d69d93dd86c0e11', 0, '2020-02-04 12:48:52'),
('cabb8bbbde1eeab3e9788680036be63df52edc5a014963ff54a9ffef7dc08db84f8460f03c25590e', '133fb5bce353f1079e9e070dde1631d038839b5c3e55333079f488042eab4b79b6c10f2f41bf3156', 0, '2020-02-04 13:16:45'),
('4b73d781ab4e9084016cb7b25d191fc27477da2905b34b217a8e1c771be66a556693b1b74f911d85', '51fb0d8b0d9c8995be1523f0f7b26fed7b76f1bfeeb432315063072b493f223ba41520a658e55668', 0, '2020-02-04 13:36:18'),
('ced0ed3922ee49f6b946a25e9d1903fe009216a687e5ba8c93924bd01a0e798f006faecf4c9858dc', 'c7cc628434ecfcd2e96e5f1f1139198cf172e95a418689ef0eecda01e56b09affa77ffab957be0d1', 0, '2020-02-04 14:42:04'),
('ad2a0ffb2feb2b9f7ed3f97d831aa334896175932b4cfe57a733b623655b1c4f8234c7154503e6ab', 'f363801ddd957990ad9784046aec089b359e88ebc2365245fa31d81eab347717c1217e54745459d6', 0, '2020-02-04 16:08:35'),
('9e4d22a04e0b57366c5f293e5c23e4003eb5de43e6f7c01eaef7d553ea7d16d65ab49b8a055d1500', '2c86df71b54e995def4dbcbd075f0847c7ffd0701fb37598e727adc63c572e002b20d760587362d3', 0, '2020-02-04 16:18:50'),
('723a169fe8b6bf1d3180538b67c4c5ce8588fff8e5ac48101886d2d76409c1e2b65b920c2ef02986', '3d4134bafb2b9431ea9bbf5ae84cc8ad172e8381cd84aa8405dc68ddb8d10882b3e9bf64c938462c', 0, '2020-02-04 17:18:35'),
('55978e935e236ecea085272b87c375db17dd3d493923110a2779b7b92a1bc31fb5d7fec8ec629d6a', 'ba219857dd5c01837f1f437238e6297b3c4bb07d42a1d98a3027839df4d92389db4134622a5ab82e', 0, '2020-02-04 19:22:59'),
('35a9a03b66ad52fced12772c4dde98518b2f2248078df856930c19d5792c86fc1f121e4580a3a4a5', 'be85af2908b4ab9ac6d9cfb246fa7f0c1fb155552349c905d7628bc721f81e9a9766958378c90276', 0, '2020-02-04 20:12:56'),
('4fb7a2579be05423d82eb7057b3a3f82274ead5cde6b1f427b30abe11822c40a72fd05cd759edcbb', '4eec1ae3ec7f19f11e1cfd1aa267346843a585ad3d866248e4b2ca0a3b80f363853eed9da4ade2bc', 0, '2020-02-04 22:47:01'),
('12ecd7b646f95a25edf5b92ccad45398c29a7ead53f6d7f44293c31034fca42221e0cac09037ae23', '194415969487c4355afa96810e1ab75e44a23f4b73a72ef8bc5d3644c2e9f165dbad6999e4492954', 0, '2020-02-04 23:39:46'),
('0870a469e3e8dbb5202840e76af455bb3a52538626292afdf7ecb3324f2789dc1bdfa42290bcd328', 'b1a690ef75bf27b20feae645c7ecafa431abfb16f36a5c0ed9181e98fffacb90d96fa3816ba19a96', 0, '2020-02-05 01:23:06'),
('c57076b18438ea97f631719e3cd4b4b68c09512bef3b1539ce3a9c357890ac7a3e526477f015f3e2', '7193aebb8ba6f3682ac3542b18482fd706bd7294e5e23559d7f5716581380e1dcf847e08b7c174c7', 0, '2020-02-05 09:44:47'),
('82c3744ea803fcf4219d0f32cd1f644985db4a118b396c026975cada69e72c0d09fbbd320b58ba55', 'df53f4ce34a034b867d8ea627bf51da0df97296054f52244889ab5b216385e5391fe7415376cb389', 0, '2020-02-05 09:56:56'),
('c9c85fa4258fe83693f195fe6c9c9228668913a6ff88343cf716ede4908a360f85da6b6faaece948', 'd8d763b8bac53c0c8a961a0e5e0fafa93ec89239750abbdf8a120461460256cd33ddf08bf80fe842', 0, '2020-02-05 10:35:54'),
('69902c0953ae813449030020e941e9b9ec184e6f353a8370b1440625f3622a2fb8214575d9f5a548', '4721470928903ecc871c342f39ba21c19bf6a3285482032fc044492b33c081af593790d14fcd5f6a', 0, '2020-02-05 11:54:46'),
('10268b0bbbbaf7d18bc57cc9ea849b3c46fb5192473fe4c6ab327fa805c1f2720e1f38568abdc1c1', 'c750cc3e927d5e36599256785bb9233254e2a02cd609326f674e7da009d8f1c0e8ec29d494ac707d', 0, '2020-02-05 12:32:40'),
('b128906fdc8ae5ff9d86e93f50a0462307a388735e2f28bf9184008226a6442e4423e9444a5284ea', 'ca8f14a5193cd20e2bd44468c3f1719a7be64af409aa8f248710a5674072772d6e607abed1b04209', 0, '2020-02-05 13:26:28'),
('efdad025f125dfaa736906cdd05d8ce9cfb508f5b02381b65905d10b0abb473783f7a93b49718106', '0232df3f3501ebdcfc59694449a423024bc0fd2ae00149cbb58857fb8f9c7f0b6f0bd825caa6b366', 0, '2020-02-05 14:11:58'),
('6562a305ec7d0257bbaf5d5fd9469a090517887dc2e34d154baac50feb821adb26234b9f18960032', '9d1cf1bb4bd5fe2ac2642bafc1568abf0ce5d1e5e1ab1280169efbdc79d86d14c8bf936cb3289066', 0, '2020-02-05 15:37:51'),
('b28aec381995e373121b3690f7efead59f3fc413ae4a269c435dec4567e097c5c05164ea9b6ba5ec', '78c73c9349696cbf859258e44f81faa8868593288f32310e7ac57f21671237f768a77e78092cc119', 0, '2020-02-05 16:06:57'),
('2c42ee28432b7482db5d4a5651a0c27e0efc9a84a72c4b7077d6c5e59eaf2c308855d9bd677f0f70', '40a4e1389c33ffa015020235c0cd624d83fab55f93033d6eb5985f92a98b87066ef414be8e072979', 0, '2020-02-05 16:30:18'),
('bd96686cf4d5987bdd2707b10ecd7d2ce27b93fec241d3f05631ce72aa7afc2da107dc14a6d54afb', '8ba3f992fd2ac1c3a98783d717acd3c80fbc3b1ee2a15839ad625a3d23509b1b9ce80eb1d2fb646c', 0, '2020-02-05 16:59:51'),
('157dc19d8d85d7d16693bc24ebe100c49a0a6b69b81a9def57327abab503896faee2c31e0439d3b2', 'ca206e92b2a24ad75f1a94f6454e3ba728043bf47bd7fff10445adc65a25d66bbac5fe1344ef55af', 0, '2020-02-05 17:47:12'),
('cda47f2c3ff4989bcb6aefb1e2a35943d6388259be30526f05879182a92c1674cd707479aa630ce3', '60e88a337cd8cb1128663ee3c44cbff0dbcbb3a04d1924ceca90980a7af84b166f06e18a8007bc19', 0, '2020-02-05 17:48:54'),
('de067c37e9716419218fbfac86a2325807b153c1572585cd8e40a942eefc9b51875214c03e4020a5', '19b2f7c1f164ce0ac802c44bfc9505e2da18c06effccce0b61409ebc35d961e3ba33c3c8db7389c7', 0, '2020-02-05 18:45:23'),
('ea07c973c248cb2599b4a9d64d3653592f672ae28f477f9dc8606185fa67ce5bc9aa64df82d49565', '775a2fe8294cf22405ac05995a6c13c5fc947cc00acb5c0700e5689f362d4f52843ca4bdd258cff8', 0, '2020-02-05 19:28:17'),
('8a49fc7b5fd114763c524d3effa4a887b8a082d7b3ccab1c0fe7a73c2eb703e5d9ecd7e6f4087f78', '6da5927fc76e14feec890b68ea079381aaf9689e2a88f5bff19c8eb94b287a699a91cb80459d8a67', 0, '2020-02-05 20:16:45'),
('d295e19f25c32958f8286395d704fcebabdd5e9658852ef0cde3b388403c8fcf8afcb6afee563bad', '77bc6a1a645df1e7a20fd754bc24d1da77cfa5e683f8ac1481ec17cc9ba34bbae2ac76650458f938', 0, '2020-02-06 04:17:36'),
('4a12a26611ceb5e0b62ba4dcafc33550051dbd8dec92b2d975c17df379af3ae200d349c27b77b14e', '2bbe07e47bd07d38e93559c04ce1f3423c9936ccd6f5fc193f8e8aba3cedcbe54f5014f8193db15c', 0, '2020-02-06 11:20:21'),
('8aa322213449c15f573d415c22d82ee65d3476d00917da69684669e218f2b94eeb53e54d04e181a7', '1884be54404fbf31897cf8675384720c5c7024f5f0158c0ff04e7e1f73405074fc815fcb87da3f77', 0, '2020-02-06 12:46:21'),
('dac7df334e081ef54cf2a904d98b2f4dc2ec0057db6de7e331019d36d5222477ff7004f51c930156', '43349c6d92b6b934fbdec3128787fb99e1a32d2a5a5843231453dd14812ec2f5fbecefa3c649f8f7', 0, '2020-02-06 15:42:29'),
('c5b9677db23b1224abc2f55a9220ab86b7cb7c5ddd30637a7bc477398236357f49285a9f25c12de5', '1ae97f1888026d4e7b1edcf616a34e9425bf064f729e2d3ad6ff4bf0ea47c850af6df207549ad712', 0, '2020-02-06 15:44:53'),
('1421516c9f5075152b1294289bde09a5282f374b6b2a87723471009dc03f1af4374f776b35d275dd', 'b86b033013e426f9d17c69fbe65020a4ef454b175a60202405bb69d4c14a2ade0faeb3f7101105be', 0, '2020-02-06 17:55:51'),
('afca303cd5254cae00268d54bef0ef7634d681826da6af3380224bf8933631f115b902be06674bfe', 'f26d49c496d7895852a3eed477702a51add52033290205919c74419c8679b4b1452f18cd00fd976d', 0, '2020-02-06 18:15:13'),
('01bb9f88955b0e915d3bf9cf5e2f62a6b2fb8b6dab30ffebb7bd4712dc49da32251649b7ce0b7492', '7dc359c459155ad62597a7de0a5d39c861456c0ccbf4eb3f7763a7d8d09c784ac04391eee123d2ce', 0, '2020-02-06 20:34:09'),
('e06b0670d0c19ea9aef100b642a85a65bfd6726b4434233bd1220dc08c825e19b40121d36a0c355d', '4554da9234d0bb72e9eaebdfb1c3540e8aff59ac9e71c9bcb68a84725f237435d1dc9df49d1a6784', 0, '2020-02-06 20:34:35'),
('1220657c420d2fe0ee4ec748cc14b0f9e05c799a8bff666dfc2a16d4b106db44f1c64e53ad773269', 'fb6b037c93d86ba8b51e0e2353513e1c514a2b0d8ccf8e66383dc31c4cf7f243c2234cdec2172a85', 0, '2020-02-06 22:17:37'),
('fd5e4494f67b46accaa943af4ad0fd5a5d92d929130417b7063aca1c1437befc9be602b63ef35e9d', '3cadd4173e9f952fed053136c3d0923fcd47d114bf8816258874c59b68f5b540b9e3a983738194e5', 0, '2020-02-06 22:53:34'),
('2471a0839e07afab0f70a941d66bcb71deeedbd9875aaba1111028e5100d04310cb351da559c6e15', 'd3f26ac347200dd723d8d9caa1995d7e76c075653999fb4f4506b3739aeca52fc832b97cf5420c2e', 0, '2020-02-06 23:46:30'),
('6bacafcc1f27f5097095ea1f4ac1c1d385172e3baeb88478f69d2060d92d950f1dcdbe03964a5b55', '5ad9a0e2eb156c1e0da0060f08ce60fbc8b00eee98d5a53a99d6759b94cd782bd95ecf8baac7651c', 0, '2020-02-06 23:48:50'),
('db39b3744bb10b13451ff79f94ab66f520ea57f795f5c9161c9e4daa13032de81297120dea87d20b', '6e2af1b7eaf424d9afc4fa1f4a92708200dd855eb00d7daa6c8f8d814c997592dd2600f6b2b88596', 0, '2020-02-07 01:16:05'),
('073d5891da6ce938559993359c05094bd172d9defa2da55332791fd681ddc2a515bf3ea9a485caeb', '054c0a9b41e9dca0aaf5cfc1ee993b8c8f0d36abc126c54ccb26e4cd7a1972b07faa205334a1164e', 0, '2020-02-07 01:20:25'),
('a386428c3f0935bc7b70454f34472d63c22ef48fbcb395cc1f7c394c9794756b66445e6a4e457aed', '6892e11e7acc524afaf11693bf4b2936e37887747e065393d1f15d131c86e908c1c46c6a3a613a77', 0, '2020-02-07 03:06:33'),
('be685fde42865e295f0373310ba38ac18c4f435ebed4acbf8a629e08246c177ac5a32d610ddab8e4', 'c8e1b429364acf3fa4c8e2d730771bf03f7db3744eb2f601c222bbaeb302569c19c9db498dd29e40', 0, '2020-02-07 08:15:31'),
('d0938377e5080f5888706ef2d03e6975247928c59cb8da37436a51e0a51d17d31c01b7be1fafa49a', '09825296c4f9ba1986c6c3094bf8316485c70bbf67623d785e9c773c2572f4c5a611b3b87bc605b1', 0, '2020-02-07 09:48:44'),
('eb9be37445ffd960fbd2e062dc1218cde79fff6135fa0cb564fafaa996b34d298f3eff3cf266165e', '8cf354cc4e7583605ed1df7befaa43cef844a37b288612a60d33b1e75b4a0d62f36465df6decc766', 0, '2020-02-07 09:55:03'),
('7887b7031ba83be2b6deedf2c00fe38e29dac6a2d4eb72f1f068153115caf9dd20bc70aa0992c056', 'ddbe6c1f5367a3773cbbcf44377305bbd0672da64805f2ae0e55376a18bd226368169b3445856255', 0, '2020-02-07 10:00:38'),
('2654b37945181495a00bbd0bc588be6d723764e82ab0cca97e9ed08cb40a528181d4ec04edbac63d', 'eda8863ec4a851689923b24f089c8b4661728c06ab131ddb82790d2fba50c508cf123889dbbb5032', 0, '2020-02-07 10:33:46'),
('bf3323f047f2dd966fd4078e9b54ff85f4083754494c736e86678a11264bde263cafcb23a71a6bef', 'dcd06decf465485312d02a485503789c556f400f303965e71b8de7b8b5c59103f1856bbf7fb33db1', 0, '2020-02-07 12:04:56'),
('c57840a01320a9f919ff72fb6793a4a1f007185317f19241d00ea7064e11b5cd713a930d7da71fc5', 'edd27e73b55d0e6358665848112af76852026d8dccbed2b0d70bf7f52404cd125103403331cf8c95', 0, '2020-02-07 12:16:43'),
('c73c2184e8e06a66d980046cc673c60f62937e69bcc9cad547af5bdaf6b5afee07cdf40b2675c413', '4a0fa68ac56e62e603fead2c0ab4de5a0f59fde5989a0d2fa18686fbfaa0e5ee739b6651da47abd2', 0, '2020-02-07 12:25:18'),
('8d06e866fe8db69c753dc25c2d3b3831de508d9e66ad7210f7324ba58b8faff60f7152a5665bbc8a', 'cb9e15dc719914be00fa1aba93aab35aa2bc266a743a600235e97e8b5e865284ae68fd66f1f921d4', 0, '2020-02-07 12:52:55'),
('55458bc3e297b6616cf12b72e840f8acb2e05cda050000f7726b80bc0d1c42260712be7d18485287', '07aa537d2adee204d32961f923d4e083afbe33f853aee384b8abd12a274687e36216b317e0fa76c3', 0, '2020-02-07 14:08:13'),
('4b154c989eb42d98179ada4fe91a821ad060cb453680327b391ca5e48c0715303a90c9d2660b936a', '8424674b299ec7d6168ef5a070f21b013a7468f739619001be2cc4c2c6de8dd2e1b5dbde309d58dd', 0, '2020-02-07 14:10:56'),
('59754f86a47e520520459682767e01fe335aa2d88351698379b38ec12e1320378a247a7566597703', 'deaf6c4b20ce1864a00f2146ba6aca90d8ab14729f5ed15821fa4646937ed94e0f3735cb8e97ea45', 0, '2020-02-07 14:15:09'),
('b2fa772f9ecb08826888839d3083576a1ebc660b2611454fd3f91894d90a9661fbe109991149ca79', 'ec1ddd2d3689f89c5564673dd8f93f4779adc26861565982e135de4d9ba4191962f8c0bd0068cd1d', 0, '2020-02-07 14:18:17'),
('45b76877b93d90afc9effe293a5aa319d66fab8fe25a41a853823e11e8ae0d36bbb61f8e01250c80', '3222c43b1be3a03422ab9656a6100597ae66b66bf9acc08460abf58303c4631b21adb5c8a487514c', 0, '2020-02-07 14:47:09'),
('43930782e7d25e82e950c55611ba0f96a7dd4bb99f48f721e8197d5021f051b292572a092f7d357d', '86d1ceff597c20d80b21a0352aefcece65062b8bf79925b52ba722d9e9b73ba61e3638b1714f3df7', 0, '2020-02-07 15:01:10'),
('9ac98db45ec70d9dd2ade9fa99e70218bd8116a0539bd988e8940222053477b60f1c32f3b197ad2f', 'bff110da2cc4c2ed7c8fb12ee371814ab6cfb441fa5e663597bd5215b9d35a4b1825b2d84d67547e', 0, '2020-02-07 16:40:47');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('1493d57a685cd5ee894099fd3c0287bd63660d81981897a2f2501fc68a539ad10872fb7dcd3c5def', 'b0e9841994a0fcce754ca882161dd4aa289cfcbb55a38cca25ee1511f2244841e9851793e2837734', 0, '2020-02-07 17:00:11'),
('8b47da633f56fb00019bf0d73dee1882f488bf346f990287bae5dbf7022aa711dda5d7b2b2aac45b', '66a35f00012aebe838025ffa9c69233b219620727b405d80051aef4e344bcd3c1459e60a9ff53813', 0, '2020-02-07 18:43:09'),
('bfa0343de66132adccc496fa8cd16181fb81d1520f47d384a2b18a496df1152480ee5e6bac7f3977', '2cab72aa8db16d8c4ad014a78e2a9e649a2786770d5faacd2acf2029ed95a31dfd46bc29334edbc8', 0, '2020-02-07 18:46:56'),
('a145ef77fb43f4e46482fca8ed330923e9ab35e0a2d1bf16069613163fecdd957f95df81424fd9b9', '984c3f173ed7bc6dca76b6c3acf5058f1fcd8484f0da5c8e3a856566248de2755645c341b34b167a', 0, '2020-02-07 18:50:03'),
('e4a170be8cba02abea91d912307bf4bdd8ddb8aa77c332bfda3b73a41c80b5fdf583fae4a14a9f8c', 'adc8a48815649d2ea7d5936f649d39f5746c5181e42ee0af2d08e330eb144312b0f76780fb6e8b4b', 0, '2020-02-07 20:24:58'),
('25ae0ec7ddc115a6982302856343da44d5f445f7037350fabb0badc5de5fb4e7c9f447cc454402ef', '23d4cdb0c9c4b90baa9d310f5c829df2f7e9aa64d675da563d18ff8270c9ef65d025843dae4c504b', 0, '2020-02-07 20:39:35'),
('b8015a5bd005d900cad306667ae3db1f7a827a5cafc82499de330fe596027e9118186980b7754b82', '8e4ac367fab4d11ee7a1daa41fde4d6e056c2dc12e3162e839dd40b4b634d1f941f37fc0f7c287dc', 0, '2020-02-07 20:39:37'),
('33dfb0de63cc73a2d7503f2eed01129397bc50d22f1b297edd02938e819d3ce145d687f3a0636f04', '03b75139f19dd45cc591886c24e433c3e8670682f0119ad9e1368f7b04ed4c596f92e7e909624f8b', 0, '2020-02-07 21:03:47'),
('84e9fbeec99d8fa066ce90a1b380d15e620465e6f23eb45e7e71d3dc28691e4ca1615de18cd601c6', 'd1b87a083336de7f1357237c6240a1a8d771bcadb7b5e6ee38a644584716eb9a5743b603f1e7f5d5', 0, '2020-02-07 21:05:34'),
('505e127dcc810e2c8703945cda9ab823cbc9d4a69d346616bbe91cb4f973ba33d63dd0d207b054c9', '7f153a233fb7a23c201c0e7cff122504907e23a2a3abd750b3e9adf4c63ab7e839a071d2d5c4ce6e', 0, '2020-02-07 23:42:02'),
('42d228bc6c3db37273bd98c5cc45be062bb1850a4bc2f2eed3b53dde15207ab5b3d01d10c5141f2e', '087e2b8a600f7747300c7fe88ca2b0dbf2ae5df56e0696684f7ac121f60f4241475fe8ec8762cc94', 0, '2020-02-08 00:22:04'),
('d18ce3d9b49687c88194799f24e2a55c693c60a107ebaa2cdf1f84dd99998ed7697ed293e6b0e143', '726d40e1856093c1c39950e4786e4a70d32288d53c77f46ddfe86de8d55d063304e381933ad6a8fb', 0, '2020-02-08 00:37:49'),
('02f763f7837d41a122e352e170e8436e3115473ceaef681696458eecd7234805a791dbdb640b1a6d', '16697d4b1186adcdaf04cede6f0632bdcfc3458e540ff533c52a6da141137c8125f25efeefe01a51', 0, '2020-02-08 07:05:41'),
('ca5cda7465a122499c9d69ff38dde29a6a17eccdd71cb406f671ca8fea717f6eaf6caa366dc67b6e', '05f7c346910dfc50e6a16de3656945ad4076937f7bae0c2e7069c332235a1f3ed768e57f86664064', 0, '2020-02-08 07:44:32'),
('6adea0bad7ee4068f2ece03392e3f76379b870c121e2c6cf9e2e3441922413e088a8907a51cccf6e', '37b9809f82e789e647021beb0608a90df6af9f675da63adba3f1d337a9148eed3c20431e963dfbb3', 0, '2020-02-08 08:41:59'),
('5f30bc65a9320357f8029679fc2cfcebb64fa3d74de18565a268c7ec3ba684e92b15d884c2038f58', 'dedd672dfed3241c5e362335c929a92cdb667caf6ce2594b0d2d2100616d748c06c5a86b2dcd7c86', 0, '2020-02-08 11:16:39'),
('0ae10bee2a02f8afccb5693b0399502a7d7711cca079684fb691cd9fcc9ba3d11ea19b7ed47d7c5b', '17634d5906952c722fcb03a14947987a5d60928b6cbb89e1fadd4a57a4990a0b957d4c98d49d7e5f', 0, '2020-02-08 11:26:46'),
('31173ff14a5e8988b9f9b24ddbff93df8b5e8d78159c086dce706e2d5c8ea9d415cad60c7e6a6402', 'bd8d8e35996b9e8876ffb0a7649536740f178a3d514e27673945bec0f20b39f3e8b2d64243c15faa', 0, '2020-02-08 12:00:04'),
('2500ad596eaefabf6e2f53d23d69bc159f97f40e1d31d96eb752e2938e62b169603798736f6b9dce', '7007982d67fc09a3a79e9ee36572f2811419f2ca6d42117121368c57d12b4a2fd31b7f084640a2bf', 0, '2020-02-08 12:06:30'),
('123078bb531491995b2d8af1bc592d0904d4eb5159b7ddc16222b8d9c7b1470e2a1a98f802ab5041', 'a5ff38228f0348fd39774544b5c499cfafcc9dc40f70665a421572d204f16695777589a99526089d', 0, '2020-02-08 12:39:52'),
('2a3ad00edeaaeebc52e2df3bd2fa5fd2bbcccba740e3384d195c25b6d5f50b1acdc41ebe8fd89661', '9b0c454a5922bd9c4da41359f6c40f8bafbb54905b4d1854cf180d394931a16ecd50b6c6b1d9c523', 0, '2020-02-08 14:27:32'),
('747724d87d1bb6fbefe40bbde22f0114313c50165021d5465bb33d698e025fb66d813faed6ab7756', '9c3e446e42ef68d05fbe48f9e743560805c3c7f08082542df0ec73e35f3041f16c657d40a5606ed1', 0, '2020-02-08 14:38:00'),
('81c592383d7a76397d3a730453fd3b61929c9cbd46882e813f2df7a021e5765ac238a0891daad0b1', 'd048dd682250d27774f9b18e02daab0363561653fb78696d9134470bdf691fb6c17846cb6e319a41', 0, '2020-02-08 17:02:23'),
('77d71f3dcdf9d0aa71098a5f9d849946424a2f7981d00c4ea513673a4505fbf651b03db7e17c1edd', 'abe1d3dd90c99859f86e2c3732bc189cadbd4943425e6d20679e980223a24d93808837e40ef25cba', 0, '2020-02-08 17:03:20'),
('7ea7e4f9e6cdd8521bb5396d067cafedc62862bf2974ea9c3c1dbe169979f0884d69cb07696a5064', 'ba82f8d39ef362ba3f45267495af6a249c9326d0d41b67625eb4e1cf890f78235e36648bfa1b8ff7', 0, '2020-02-08 17:10:04'),
('3d8100c22c37e140d931dba8a73258e00d9a2f64c4e144de3d61d601bbce35f1c338c8342a76572e', '6eaa268b055fe511f62e0e6a18f16b6985607d756215e71e480203a1b188ae6caadee3a063aa6882', 0, '2020-02-08 17:52:28'),
('1ea5e78157ca216e1a0e17fef30072d540e02ad751cec2603b34dfc26749d1560160c6eea0f9c84b', '241bfe98791d73ec665a7d28f7e4080fa46e5fef6cc20f4eda241784e8d6c214d22daaba209a403d', 0, '2020-02-08 18:48:55'),
('6f79ad6534925c2c542c0d51b92a3aa8bb02e8a34265a4ba7aa370de8da4e56e74b9906c46b077ca', '590645a1a3db14c18d26b6a741a7c42f846fead58ea0181752352ef4fd4d3a940657eb6faf01661d', 0, '2020-02-08 19:04:01'),
('548b9abb406999aa9274838db9197620b2702a4d3e2ac14391b57b7848618185ac5f0b3caac29ad2', '87d2128acda35e9f20939a03948079f606e26d05b8345864a250b293a36c5cc4d3cf5a98cc1167be', 0, '2020-02-08 19:26:40'),
('0ca88c12563ac24c3d49bc61387cbf870613c1818bef133bd8474e7b66bfaac7eb1e5efe4e0619a3', 'c22f6e46309c87ef182cd22224301cac39c87671fba93cd8bdc39c305d3967fb88a01ca5a4543b98', 0, '2020-02-08 21:20:22'),
('cec68b5bc4263f643d586748283cd110f9806001b4c7a423e03ff78f8665291913fb1c0d0267ddf3', 'efdc5d72f043e73507f23eca238b1b85eca223ccb1d77d5c0b20f8f5de2d212b91ef26cc9be389c9', 0, '2020-02-08 21:26:08'),
('7fd46056e4cf8c133d307bea51375ef6cea99bd38b92f0000a25894bcb8b74454d9495276e6eae38', '0734b4cb9b90dc99de9eb7b86b8b9ea425fc53ff50894c7dc526f479bcdf704e36138ade09310487', 0, '2020-02-08 21:28:02'),
('965f67e39b7cdd13fb39ba3f18fa58bdc9fa6bd339d9ee5af239af294ed0c9a93d5f46dda9878230', '4351cb6ad1507c9c450bc680fc4b0dfc76fac71d8271e704e471d731cbc10937a9b5eeddd9e7d038', 0, '2020-02-09 02:34:32'),
('b1fe8d768a6c64407e569121c02210c6ef6b43d32e3f840befa10eef908c06c2ac1e74f2f4ac8f1c', '3928b46cadab5dc318b2d9189fabd0df29cb3c81883f1a49b77f2fd8ee9fc0e4d1dac639326fa3ec', 0, '2020-02-09 07:14:46'),
('85d3e1b46b52c92483dc70431a45ca0d723fd07ea67a3e34a4c6e8c7408e7ab5a8ea5a988bf408c5', '906be468a6b3f89e94d7100c627333462d2996376c837260690c5d3c51893564991c80dcf77e4c79', 0, '2020-02-09 12:41:54'),
('cb184b6d9a368ebe33355562c5f4f74091bfc58c2467836b8f5a6c2c45fa240b5e08ef6cc2921cef', '000dd4e1de257eb0083d01770b25f82745a834ed1018a9bf47082a7f9d8990403e08441ba15da194', 0, '2020-02-09 12:59:27'),
('8447d88da0dd394e6eba4624a2a2f378af7c0e83c1464e8585a6cfe9d3fa50508c6fba5ca5b72ca4', '9034cb275630499e8416fd9142ac47e6afe48fa5d8a28b1f8f3adc1c8ac81cce030e7e7237381c53', 0, '2020-02-09 13:29:51'),
('d6897b6eee9f61a3f924f6ce1c197a79d222b401193595bf71ad27a4567162a96d5b6a71e4899428', 'e13b9c26aab79e93ef94f0b4d2e6a5d893f239d3d594b5e008c8862777a51bb080fe6a2835107bb1', 0, '2020-02-09 13:32:52'),
('2333820242316bbd8ccd74bb4f483b8bde2f3a09bf09431037289f7f5ab7df94b8694c4b14cb636c', '11a35c5753ab1d0e1653a2615bc9b20e68b65209bbdfb780a01bef498a43a20268e84c15e3b61ab2', 0, '2020-02-09 13:46:30'),
('5258e2a8fae55b27181cc43c312ff6386097c912bce243735881ec0ff86e164ef3de99ea6cc4cf4d', 'aca659fd6f93ae4ac597ccfdde42654f1e72a7ca21427b5e298b7a5363e71fb43136821d7410dee5', 0, '2020-02-09 13:48:47'),
('a44bdc8f81b3cc1359fee4aadb6e6199032cb0c68f6dbc2ea18b4bc7f05b8405b21815f2b2349923', '12a2d1be530d75a6045ff5de21f202ce7e07d11bb36adc4354c1911af42a76232d1fb1849d3ec6a4', 0, '2020-02-09 13:49:44'),
('ba87a533bc04af640379a737646d51081b60c54dfacb4e2b292632d5c18b92a319739c1a2e477f91', 'e830b7b5225a52cbf49a8e3c34f64f7025e74c1ce8d3eafb827e484f27ff0f20de51fa36e78275ed', 0, '2020-02-09 15:28:00'),
('2aa5ecbc53993cb25a10697f760458456425590c1a9b1931e539470c87f87af01ef60daad6ac21f7', 'a419ba161e69464a1c56cbcf2955ee5c98df07b97f7b75daf0fb995f3cf4e07aff1399a253b5345a', 0, '2020-02-09 16:07:50'),
('dc6eff363e036f5f70745a9ecae68620f8aedd968f5c6d0072294f0b6350c8fc48cf687f7e63c74a', '8769773cb35bccc96bf579ed8ee4e46cb89fb3500b49d504ee277f5739392ff664d62ed14b6fd7a5', 0, '2020-02-09 16:30:20'),
('b02dace9261bd422e3724136d08390948f382290e445dc318c12af15ea86225483cded66403724a2', '0ea5b67c15aea174f71934d1fd512b25f9258416c7a4aefd680d71325f27dd2f69481ed3cb5f05fc', 0, '2020-02-09 16:59:51'),
('1d26ef38fa63c33f1e953ee40a55a6f499bad85bdea79d5b668f5689e7744754ceacddd300782113', '2e7b81b2ef07b19b3098997493d4d70562b48d599bb6e17adea34fd7ccba37ad2e0fc85f140bef55', 0, '2020-02-09 19:10:55'),
('ec782746a71fdfdc3c4a372ac654c32dc9635e736d947590f076474a5ff635d0bec20ae4f78ab48f', '5348f411bf430fbbd802b1fb632f5ed1fe0806d0e852edd278f2384ccdfce4c2fae590fa45717821', 0, '2020-02-09 19:22:22'),
('73593218279766bc23327ae344226b835ce05bc326f7d7f34bcd0497d883143ebf0bccf7424d8215', '928c4a449385e336ec04674fb46a03ee551b6d795a61e323c7c388d5db8738a4574496514e1b3c4f', 0, '2020-02-09 19:48:58'),
('0f8ff1c8b3d8db41fb4755a1b414fc318432ae65923f76419c0aedee76c177c15600a5db5ecbff82', '2ab4b641339c15bb4f9dd9e42f3d5f7be4293df35444246cd41e9956669adc7ba84b8bc8ef272da7', 0, '2020-02-09 20:12:37'),
('71743ae1988562dd8e95b83c8b4d1c03dbe484b5e1e4271fa6e9125b0ca83e7590d1443a1e368e55', '752727fd6a011e102af64b3749868c54db32323baa67635fc21ba41304fd59f0dbcb9ffda986fad4', 0, '2020-02-09 22:30:35'),
('1a102c2cf9dab75f66d520d1bb13f843c190ab5d61bed7751d558b6c4300d0e49312276ccc325cf9', '49c72bdf6500e0d56cd6b64612412ed1d7896e08a512ff2a0789481391f2cad9da8e97533b810969', 0, '2020-02-09 22:45:14'),
('c2d839f62d1498b34421b424efd85335667a723dd848bb95d4dac0c0f61d7358d2d50bf1af898db7', '3e50994652886809da9761790662ad67bc49421a1e15162e4bafaa7d0e5abd7f695e1c3df3e7a4a0', 0, '2020-02-09 23:51:52'),
('6375bbd10512ca62e0877cc3ef5c13cf5f8bc7249d196a9ece99f40422b48f7b6491c165b0e6f6d1', '6d493ccff75e93d156757ecc9decf83395aa69ee44af938de00d6e47fd976729e45f149ac9a7ce38', 0, '2020-02-10 09:02:03'),
('5f2bda2ff245530bc7ffe477d991b437fb3483cde159554302137751dbd2bdb88997f28b025393b1', '9793bb782dae370687b025e39e2a1de22dc781bd322135c90666cf16552f916f181470373137a99f', 0, '2020-02-10 11:11:59'),
('924b5f3cfb6dccc69698871c3a9596e9856d126a8c4857f7ad6a65d32b25bd455905b5df25a2b1ad', 'ac8a9baff7844ac21063ad1ed9a02a00c2a8bb78f87ade163a0b1f2bba53fa0b3599805d2f889dfa', 0, '2020-02-10 12:13:43'),
('f5b7a2e902d6c70bbb081f7bd87b66f4bfd068882214d6fb62ca1397b0b9ff80ca10bfc039627f4a', '1f13456b44d7ce70a52f405520a753bfdf8a1d62b8c8ec0ba98e97b19072040896b8940e89c6795a', 0, '2020-02-10 12:38:34'),
('065d11fb7d735551ca398b2616f95fbdfaf264bbcbb475ae8a518dd8eacd688f6eb6e6ff56dd7b57', '0594455e576a6c1c3772c14f7ab10c22496999ea08ed006e690e869bd9dace040d8737fb074f0360', 0, '2020-02-10 15:33:17'),
('419e5b690e78047eb04304301c8cbe1c89b43fac8d5acb9d755faf0f7257ac838e9b03b6feee0689', '3fca51350e3aefe005776d415b2486824c8b012e14a9f4ebd71aa2007e21226765c55e7eceb7d03c', 0, '2020-02-10 15:43:03'),
('6fc362c475e32d78cecaceadadb294a7ff2598f4beb678c8d673f8135af2bc00573709ecd912d2ae', '9f1ec3065bcfb3fb2960fbb19ef99ac612ac2847d3159df36a94ce10b83f7d9a945ee67214b61946', 0, '2020-02-10 15:49:04'),
('bb8c513a7a707cbd2bb4e110120c06788e907fed84ee43236958e016b487158afc0857f7f316db6b', '4ccd71d1858576e70dbe33ebcca6a1067d8cf89e62cca9399ba37a0da0bdd485c141306d42a8dd05', 0, '2020-02-10 15:52:11'),
('8d06335db1050168142d5196dd3c240b4676d45c6666e940858c48a638100090d6f9a382541de307', '770c5b48ef9c7d1f228cd2329784e56d0317cfaebbd53857874bfa730f2182eb132884128d42775d', 0, '2020-02-10 16:38:53'),
('357a17424b2bc31a44dfdad59683eb1032f47016712a5e5f6c41bb0e8bc0ba6164afe0cd4ab0627a', '1622782014e764fd89d561192df26fce60f49373693c3c3359ef69fda7d8d91801fd21ea013a65b7', 0, '2020-02-10 16:40:52'),
('1cbf334f7b62c429630718d300217d6ea1569886cbf999b9584edcb4c6eb8a89b110f289bbe95153', 'd5482c5021dbacf83668b1e8efbfab7f6825f3b8e85466021a12a7de39847c78d972de75c334616d', 0, '2020-02-10 17:35:04'),
('406115f435d0c7aff33cbc53d62751d8ad4da6a832a89e72869ddf9a01b84d129f722b63f7c5581a', '2387133a312a831a4d20beb779ba8afb8b801934466e077be8a4a66e83dc5cfe3b5e5d17a6cb8cf9', 0, '2020-02-10 17:51:43'),
('a61007fc40a1a11281bd0dcb01bdb403cf406d757461f5e89a5cb4b056bc8c7a879f338eac64cc71', '17e314ab22ffae4df12e9e937d03c0b2fd53f36b7397eb133ce87ab59fc46ed4b6d0d79a8764135d', 0, '2020-02-10 18:35:20'),
('f8ac3b5ac2bad7eed368e4286330e9b804f39d44907e331b685573d09c2d6a7ac47f31f6579088d6', '4ef316e075b4fdb3dec7ee42a81f75e184363a43e881cf0ba290fb88c4d7fd75006749566b537c4e', 1, '2020-02-10 18:44:22'),
('d88363549e0f2b8ef01adf4e6f27d98bd3f1dcf56eb307fbf00380c0deb2dca6087afe7791c6ec68', '42fb4cacad567de36681c0b0ae7a94abab7b6df84df15624cf2b6c00909af7fec8b1794784162c25', 1, '2020-02-10 18:44:25'),
('11507d40eba80a4779f9ada5bb7d472001847333f11ed5ac2082883ff48d05d03c5c026569f05637', 'cbf75de16b740b1a5c03d03634f5c14121fce95d0df0654b03c10a342020219020c0d19ccf804a7d', 1, '2020-02-10 18:44:29'),
('d21cf5c1d0577183496b335f47b8d23c00a9100fa10eaf8135f1e7d1401d329ab2ffefa902eb07e7', 'fb05b3d19443acb6be139f2456d433203f81b0268e351f4b25e53cb82c1fb777b5c05f3d23ccd9b0', 1, '2020-02-10 18:44:32'),
('e377e3822bc838071fd8b997f2f7b887525e330285fe8279e86097e70f1634f41190ffaf82bfb617', '8bf7f0e341dd5d6409e3655dc8ffa5672e47772931e96ddce1a824d8eb5e807e5ed416c86c468819', 1, '2020-02-10 18:44:35'),
('f5690227a56edfe3254debf0f4e880a1a1312fed97e014801beb6163ac1fdc4af8b4eeec320e3c18', '94fb6b2de15b27ade982bd7a1cb2bef3565f5b3fac4880bc828bd19343d50f659152842a898299a3', 1, '2020-02-10 18:44:37'),
('cd09bf7ee0018d7a662a9882dee009ab6ba20c7bb0e51629577a0996c00ce8b93ead6edcdb30b779', '8c13599c357aba51ad9dc1b9d573175a8b18986efcf301be359936c586321c790b7f7cd44855e5fc', 1, '2020-02-10 18:44:40'),
('acd9182f435b1262ea6d3595476078b7539f2d7b79530ffdbef2ff7287b812f9d21c4662535ad008', '362477e219aa42de36bd8f03360cf295798b28d7e5e3852b6794b2927fc11e383cba8ddee6344133', 1, '2020-02-10 18:44:43'),
('3598b82db0e9768ddee5d64a3816bd8768fd38d526ee6473a4ded42ad6f5a08cbc32e214fb180b88', 'a74d75f348d97a862206e13c583aa6c5d6c58c95b9e5dd9dc2a3b1543b1de269768c844392a8b899', 1, '2020-02-10 18:44:45'),
('1cbfaccb920f255c688656505fa27665b35769b13c473695fde491393c38e368ee9360c2d1985c01', '3ae0d0a135eadb22aeb6ba5aecfbb0f92f06823aeeb1273912f65eaefaeade7173e377be1bbe1a44', 1, '2020-02-10 18:44:48'),
('80acf87864df7151b8e8b542a076f798ab8175b94286eaddc7d340ed576fad02c102c60345847d5a', 'bca525a19ac51d567f3614c5b920421bb9b916b87953f291e289dc4ea65f4d58c674f01c49d7a992', 1, '2020-02-10 18:44:50'),
('2847b1a99de978540e9b4cf6ec7c0bb56808357483b7b8084dc197925051a3f3a429187d4a2f5c9e', 'f5b1da91370d014add7a3c41d37e4545e5bad577ad57201f4b614915e9448277e3e431d1313bcbdc', 1, '2020-02-10 18:44:53'),
('a91529e9e07446d499e17c1ba387dbc29a62dacf609eb0dd95bb491dba36566bfad6b9be4be2a9ee', '361d344a8ba8e25c32ba2c30272324c294dc4e0b04c62415e2684178b458c4042100e4403ce63b1b', 1, '2020-02-10 18:44:55'),
('824c73fcd5fe2ba85fbc9607006941fcba069fe23f243f2b3ea92dddb026410e7fb21b2bea4fc673', '4ee06dcd36a24a216a2e55054fe744c90e3fc752ceadc1362aaf71a9da1a7b21ff4c83b373240a36', 1, '2020-02-10 18:44:58'),
('4b5619f9edadc630c6370e280a1eee465cc37e6a67d2589b9a53ca89c830343be18df95df06b5e89', 'befb5fdeea199b62b03a5346d53dc026c327203b4ceca0f5eb1c0dbba4bd274dcfffb218f8944426', 1, '2020-02-10 18:45:01'),
('3c7e3d96c4017fd71435855d9f31e869167df91a1f459f74f6c7a45572225bbad9f795581042562b', 'e2cfa7b2148eae1e0f599e5437efd749616dbc8449c65fbf66945aa8802da39a6bdcc9aa95d7bdd1', 1, '2020-02-10 18:45:05'),
('3ff1a404cdd35d77c2949bf87343c76843b54e4cb79ed08e97fea60fb0e8a253c431d0ff8a4544db', '886d0898a96a43ac071d1a67d384f2a3f8cb1fd80d5d487335f10e880d0666d689b958aebcb1628c', 1, '2020-02-10 18:45:07'),
('fff9055ee3d53636ab7146877d6ba89d8e5a681b2cccb0c7bd8b915a045187c80713557300d5712e', 'ad2f3c716ef939447aaafc95aa7f08e572c56cbf04eda4898d86e5d98d77105eba9fd32bcac0a39d', 1, '2020-02-10 18:45:10'),
('adb417262be77c1010cfdb6ea8ff65224c3502d34bb07aa039fb1a0152158acb8325c3047f8d3fcf', 'f594a39df39d615c7186998f67ec9334dacf1a09d4ba78b41543418b0ef81d3c85f98ec5037ac9e1', 1, '2020-02-10 18:45:12'),
('4b65e35220674461778801c6d8a308dd33d7babe9140c7782e71274f7a856adaf54954be7e309b2e', '5f3ab93f259ceb4d5c53031edb7300faa3c83ce1fd1b85ffe5ce04db642c5ef828461258b8501011', 1, '2020-02-10 18:45:15'),
('816e7cb5940fb7372081518e86f47ca694f21e0b2d2f729794380422670a0e9d0fb008d226735fe4', 'd0f64634e0030e7ffde2c00c36f4cda973290472be248f9f95a5045ddff7c1aa5d552c8b053d0a89', 1, '2020-02-10 18:45:18'),
('417089c931f000427d7f50e6f4e5cdf06a9281ebd53813b1b426f4f7eadd700d446c8eeb2be4c7f9', '5b74eca514867e07445166b9533922f36fa196c8553b688cfc378f6d4722e5e6a6403c55705a94fc', 1, '2020-02-10 18:45:21'),
('2c05cd5981e2b2426c577a7f52599190da10f32953796cf2dbed5b1a8efc91149c496efa103eb338', '9441c49e2b75d86b634e4cbd6e5802ee8a02fab9c7534a438b6ee9f366e88bcc039e8902b9343df7', 1, '2020-02-10 18:45:23'),
('1940cdb526fc9de7e7d158c3f06278b03b3e673b1d1c8cd720b2a7ea934df826c06311b032ed8efd', '2cfd8c59f9716468e7cd4ae2f4151826937e10a5acc109f1cb88b82e2862644bfd8f7fb16dd1f6e4', 0, '2020-02-10 18:45:27'),
('00507a4be1c5758fc460e70fbcf7c7f12c151f44792b53ab490556f90b1f441dea7cecfaf8b72eae', '648e140d3dca5ff0c13dc2765b116b0297c491f44e75a6268722d5c7fd269eb1ddb700245356e50b', 0, '2020-02-10 19:22:19'),
('dccdd47304b26c599a9442c57150b7d0585353ea84035dd3e9a68a3be28806cde9442209855944b0', '551bce6cd319549d0ef5b6ab53fb5f157b9d9b28791493c0e301d7d4d910d11809ce24a7533e94cf', 0, '2020-02-10 19:35:50'),
('34ef19f8fce38bf82bc9ebd042244472f4a4a958b12ab1d551f901f2a79afba2f6ac056293f38a0a', '73b3fa94c79b1e4f6e8c697113ebd546b2d6590622a8b1abc592a124da3fd117828fd818d4effde4', 0, '2020-02-10 19:35:54'),
('315663fa81a63ed61845a7192a38a32b5fa64acdc73c9208bc012f6d0476d977bf6e78feca9ff658', 'bb6a60a88e33674742188cef3b46b724504d6a3b391342c68b3c510227ab0438304c6c0f906cf79b', 0, '2020-02-10 19:36:07'),
('6494d3a16cf3dca52e06959f64e0ac4ebd6d7106a9ef9134652e20306a80594e22ef08add11d3bfe', 'e1fc309c792fc2c9e8b41c90805810253ef735ab0a8eaa7a9ce18dd7b590d3b9ffa918e1662dfcec', 0, '2020-02-10 19:36:08'),
('213230ca205ba140f49965bc53a0abdc485d93f4dfcc12de73a2f97608f9a38e53196d67cb74c1ff', 'dd4a8860d634a020af26dfc3f157eb6a07d16daf62623f6c45cf637d53116dbffe8a8f1ada7036b0', 0, '2020-02-10 19:38:11'),
('ea51b01e3b8685dfaccc0a4a456bb205e8cd02797b06c5f91d84323d4885a166f80eac4712354172', '78b6a9f93dc393bb34ec2fd9cfdcdf856c09effe2bba696fdd746a0685b1cbf414bfede47eb2f921', 0, '2020-02-10 19:39:23'),
('81452c4739ff47caca5f8b66edcf583311c661fd7642e3cf21fc95143462f8cca7d56e9afeb07a14', 'b38e55b7a11ec20f775dc22c5e2c99f82e7f9c1da433a2c3e6816e4b169c70864a7d2677f456388a', 0, '2020-02-10 19:40:11'),
('8797d14366002e46b9f6416bda808b08e070a555b0ad140fef66147f4fb326417eb671313c51287d', 'a4cbfe7034e28cc6739898526e52c551b925850dfb18cc3a03aa36cee385389c406e55c40a8aa602', 0, '2020-02-10 19:44:30'),
('f3cc339d2fdee289abb54ca5b557c761448dfa7639dcfddcbe06c5d45931022fa05e8dff2aaa7fc1', 'e0eec6bc90c44b28f080825473bb50bf7f5f71e26615726d892645f497b8f0f9a9efeb920c479e54', 0, '2020-02-10 19:45:25'),
('a33329d28bd04ed05b73d4742b581a8520779df7ce19fd0539bc59dd5f4bb7a47abee1f9d1efc075', '401f1dfc522b029d1a452cbc43e75613b73dc911989e45503a852c98fa1b5011ad81cf9ab834c32b', 0, '2020-02-10 19:47:19'),
('ce38a674896c47b76780343dad8342fad394295a1332a6aa5c5f680e94d1f3febb81e7289fee1b62', 'bc05b7f4dd9545f7178010389168e52d9bbaee638939401e3a2b4b884ac5976a0ba9e6d871f84b17', 0, '2020-02-10 20:09:00'),
('f413d867aafc869102e432dac13c277b2bb66b395043d6804d7d5a5f3a7ae05ee9f65e46c788adcb', '7b9ea9d9a942554f160fe85cc848e1df48aa42326218f3866caadb7432f93f9ac303ed4287fe901c', 0, '2020-02-10 21:23:21'),
('b1881da55f291317998027f814155de6d491bc99a199976b33caed602482eadef4c4863bd5131274', 'e4d4f1d37dc38095d6fe7fc44e1f1c39c28a5e31e706bcb401b7e6cea52606130da68b7fc05fbf0c', 0, '2020-02-10 22:48:38'),
('464030e9368b12f896f6bcf056cc351c7594123866df45656353de703dc95aa3a77862975e90635b', '34563ed9970a8d85af45469f9ae30fe307face7362041f940fc05f69dd8cb0753b0cc3f761d64b01', 0, '2020-02-10 23:53:09'),
('30c66dee113178d359f6190111d6ce72446d21351b0291ba4fccfb923d19e4a312db4aa787b3dd51', '21d70225178a35fb69f7b2faa11889bc769ab6fa912c37a0a3ba4e6f837e8789488d86fbc0935121', 0, '2020-02-11 01:05:41'),
('a0cbc82be1e397c7c5144013bb3806eca4c8e397fbef316ce689980ef0ab5a81224a5ace809f0297', 'cec8d9d11909ab1fbfc2130a08944bcce69024836531dc780b8475c801556379a2c35c657366d1bc', 0, '2020-02-11 01:05:43'),
('bdc13169debe7079fa035aef704699b82f54422036eab4f60a3bcf869d5cea6c68a25b7249913e12', '9e7f2dcc695104d8514424c3327a7eff400de5c00c96de9597167e6f0392bd10c6aa86fa59accbb5', 0, '2020-02-11 07:43:33'),
('34651de4011a03166b41b69872e4fc933307569cd6a29e15439e3cf338eaba94d32ef147983f8321', 'f1fcd93b2d37d3a477b95c848028a83a1f0c026d27433089c2597242665c6f862ab495b77e054942', 0, '2020-02-11 07:46:10'),
('bd722920f7b4d488218edfe72ee6871b97e5ae2aae94c0c27b594bf7fb62cd986deb7c6d65cf1da0', 'e946b12135b6c8d4d7f723f6742d3cf58e50d06a2e5b51657fd3b2dda9ce66e3e0976349a1d4d6aa', 0, '2020-02-11 08:30:58'),
('70cecc513d0041fa6483aca0fbc81a29d552156215c1928a14ce3198d6f94770993e823c12d3c97b', 'd1972561194415d60c4837f2dc51e826e8b38e2b00536b54b615dbbb362ec431db2de283d449b5cc', 0, '2020-02-11 09:50:03'),
('e74000d8e5cbde891269708c2a9f9f1fa6f9be697323f7b29b81928be51684e753f638d3b6470450', '59383264d3b8d76a211460a8f31bd90db9a1a616867e31a506abd1bb7c1200247148e7f2d13ac3b9', 0, '2020-02-11 09:58:06'),
('c6fa6d34b0af18bdcaf6ee56555de891571335ec3693e2bacdbcb0a6d98b68fd3a5570f7792360a7', 'dca282e8380d62f10e7dadfd69c2bd5680f2b309a08b4e83e7bd65dacb46b296a944a74ca51c02a5', 0, '2020-02-11 10:06:54'),
('1c3fd8e3a02baa688ed2435c3af56067933d7b5c65400c6da508c62eb04272c0fcf33abccd7c4863', 'fae46260bea3111b687bca739c0bda871c5f62d77201d3b3fe7111ff850975a7e8e0b803d5784862', 0, '2020-02-11 10:40:46'),
('df4ede4103b279613d3b8daa0a4c99c09e2b4b65f5c9ede03b488026584df6d7fbc465ac3cf41b8b', 'be2c2bf2e3fd2aa090bf87cecd85513c81a8e8213d130cd50002a110875ee7fcd120a08d2623f977', 0, '2020-02-11 11:15:58'),
('893df3b9e97f2f27dd284b3df69c6033aa17705706cb391d7973076bf5eab9ba6949f9e7c116d142', '0542bab65560e0e4dde4d9303f135509aab122a4702a24648d40a06ee64f68f10688c31c47532e93', 0, '2020-02-11 12:33:23'),
('a6e113f951a5f1b68aec4c4deb36361d6c14455306b9484574ebd988eeeb4835654100ed1504239e', '66997867c561834c5818beadfbff0adf929e3695b3c9babb2f5fcfe8e8c69f41eedabcbefe8bbb34', 0, '2020-02-11 12:48:54'),
('f3b270c2308080f3a13171d0eb370c521788d94d36dbb6e34c8e916ea0e2c22264d08b384817a49a', '672b95089f7692c8e4548d5dc1b0c02db49f0f5d178e9c6f6623321903921610bb7555abbc949abc', 0, '2020-02-11 12:53:41'),
('eae1aba69a22f36852266a0b3985ddaf00d794a1da56a137a59ab1f832316e7c4a69a294ac434d78', '698410685990c5305de14178be5d138c69ce03857fa81a56dff8d285085662c2ab8a800ed4652215', 0, '2020-02-11 13:05:08'),
('9ef468163244bf90f767b903aaca1fc7e0b742783ad6203bd7b37a0b19c6ff7bbf2360ee385d77f9', '31517a10d849a34ab5fb63dc34dc4574283d76ff2980684f98dc19fa58fcf91008c701c302f453fb', 1, '2020-02-11 13:06:19'),
('3ab439665a946cf0bfdff356c680320c8c19f8562ff0bc11fb8181730987a7d5cf81e1574957ac20', 'bc836b109f15961815540d58874d630220eba40cea73fec75bfab0c10b299647ad9b598758b3fecc', 1, '2020-02-11 13:06:20'),
('a4aa18a35cf9ee0bf50c8b08da91ed8e2696b4ef2de6105a5df782825920679321fe5dda17b38a73', '3ffec638d448355dc43751cad454c991b6083be686c40b223428a942ce7b66cd05a3a1fbfc68fa14', 1, '2020-02-11 13:06:23'),
('1b59ccc627831be41910ae042aed991291fd98b37cf8ee44907c2d66893d5435f81b74002a24d78d', '05d3ccac96dbd3247a302147f96ddc22b2a01110c66b32dfa7c2d190ef42ed14da974ffa412ed76a', 1, '2020-02-11 13:06:26'),
('c1ceba20a64f5e520a5612b65899ff0bc3646b5bfeb4250668885bd4e3050b4870c67e99f7a98824', '848e4c30fe79fb9312672ce1a64048a1212a27bf6da81aac78405d807df9c0b7d833c2d481de6b2a', 1, '2020-02-11 13:06:30'),
('877e43c18b94af10afdcb78bca2abf87f05069deaa88609ecb5bcb8a31cb4c76b4611c5066d27a62', '974d4e35c2ea4bc0918d3a755abcdb68b84906821ab8114f82787bd07097b4bc6ca236eb08be4067', 1, '2020-02-11 13:06:34'),
('243bdc6afca6c37c6e9d61f6227ee88979a711f3e840dc2e50872d31cc0be551f402e5b12ddbfda2', '7a7539f70deb61975272018b9260e10327766d7a1c4767a6cfd4b928239288a88fba184d80457440', 1, '2020-02-11 13:06:37'),
('00bb4220041adc177ec52c3bb1e07d7f3fdedaa61acb575ddc8c5fbeec9ef6e6ed4df1290252590f', '19a45627999af8aa800c6f58a4d2da720302a90f62701334673717c7eb1587f660231015873c22a5', 1, '2020-02-11 13:06:40'),
('e9dafbf9ebf224007e91856e5dbf407fb4855492b5abee8ddbeea6420d2c65e7888930aa4a67c3e5', '7653b14f1afa4b5ca5a571bb5305b74c069dc570d77c5aff9ef7829f2f08f5b154e7bd71fa74130e', 1, '2020-02-11 13:06:42'),
('13982cb488fdf849c55e21c85d0da2d4a10992a926e504e67c5e464885e0cbc84269bcea31235332', 'a28b432f2e2a389c0baf5d31f9e1bf101d6253bc871e5d4fafbf051ccaf39eccb3c04eda8ded896d', 1, '2020-02-11 13:06:45'),
('cfab722a999192a22579f9788fa857f9c64482ddd5addcf5d29088b29a5a39068f7efd771fa7c78d', '18ec589cd4789b19dd1b3523d4975f1c57dbedd12cd7e447fce968fb377b16b03b1b5e4548143aaa', 1, '2020-02-11 13:06:48'),
('0a9b62bba63bebffeef610ae702c7b70d927830d6e0edf981a4eed747233fdc143bac9d6a12ceed2', '30aee8a410a598ec32f3ac2a9b18d3320b58210e4249184504bc8adca13b805c13630fee6690da31', 0, '2020-02-11 13:06:51'),
('174a68141d15721ff00308452b4d13457761c23df91930d6375e9b099d020960b7dea1f1fc89dba6', '40b10f4abfffcc62fe35e21f48f817fc25c9e46e36f2d3c19bb2cad8cb73bdaeb3f74521ceb7216c', 0, '2020-02-11 13:18:05'),
('c8f96d7ce172b104374588ab55eda74f440deeaaed3f242370ae65f54e2d16448612089004b8f94f', '9c428654d83c5bdcea03ead6f180c55372e658bda37c70359c56027ca11721e5d50a6ff9e710c6f5', 0, '2020-02-11 13:39:53'),
('10104bae694fe08da8e8e96021f29d603bd47e33282938cad7520adafa9c421b8b2101ccc08776f7', '46cd1329aadcc0c2da2d6337d6c2ebd7f04256cb1ca3693827c4dd51f24849cf4d0fb80e5a05afbc', 0, '2020-02-11 15:38:56'),
('47b54f7bfd95c784e73ca7f3a323a59972a9d1fc53c8498721fe173b634fa0489c18540fac9a5f37', '46a41bf7804ae00fcb6419bc30ddebd53f9dde8fb9c43c91d42cfcf3f58c91a17af6c4152d03d47d', 0, '2020-02-11 17:07:16'),
('0466c984d9a6097ac673fa9f16fbf30881b64fa504d0195dada41c6cef2da58a8c24f058994a4029', 'ee58504da897c771202af83522296f4d6551f7b45db75573d6a59929e4af426239ba26c39bca46d1', 0, '2020-02-11 17:24:20'),
('044f24abb0c0c85938d8cc171c075aeb4e2b8df4716cb62ab840fb9fcbd3439d92ea2a1940f998f8', '22370dc25ce3d7fae8b314ee56264f6b8538320d9056cb49ed09c79c4f41f7b674006e22e46538d1', 0, '2020-02-11 17:41:26'),
('9c9a1d29b7a4bb68798e9d633b798af6b7ac3e949e3202f3118d002b9e21634b86f6ed441c02a969', '5a775509928bc1820d477a37a2a4ce05e4fa078cd25887613fec317e6f870c616747c02630e6bea6', 0, '2020-02-11 17:59:33'),
('9011ab474861b640d915f367315a5a6a45e252d91c4c52c8a74198d21092adb2b3d1333bb7be431a', 'a23029894531a7343ca2f99371fcfce9ef63524c8d43bd65a1e7ac415f9f39d91e365c5be0ad0b9f', 0, '2020-02-11 18:51:33'),
('5a2d549e759beb260c3cba47e63ede527c66a3bdb0dad8d1d55bfae9253ab12d5ed60863594abeff', '0c7f13d1680e70f07ab2f738acc7884bc63129ad910a524b261e3f851345d5df9ca1beb542e7d7fc', 0, '2020-02-11 19:34:18'),
('db34530f0d5320e3d56569219a242bc703ac9cfdde109b8a08ecc2b24ee5cb66638eee8e63635068', '6a90f8c05e14f602158edfb37e31e81390f3b2f902c7a498d066f27155fc981d373c7187e89ae9b9', 0, '2020-02-11 20:07:48'),
('f156c519e8f774d2854b1a0b4c321c503f8642bf288cb9ff1bc7125816a254431ebc9c8e8e03dd50', '4e914d11c37c8ba5f008c8a1bc1eb4d9bdd24666e091ae830d17bbfee9a32d724bb6718c5a50862f', 0, '2020-02-11 20:13:43'),
('96315cead8b1fa8eb5ab9dadbe3ee3fcd47cf1f8b137060be121229ed0714e8735f880dbe68f4558', 'd0ff780f6ab880de0414688facedb00de4a2867474b46b46407bd392d0e749ab8668cef2660d2f8f', 0, '2020-02-11 20:17:11'),
('ad489874d18029debcf2c7d99b4ae605c750d4a5c5b2b5b156282556e92368ac95af59cbb9efcc9f', '67f2369cf59494ed88b30d728fb92ea697e98350b75b5f36b0e3c456e7111c747427d11734e79bb3', 0, '2020-02-11 20:26:16'),
('dd90bc3892d32eb3ee0ca48d5475e26841c599f13a300faa4683a253b60f15f6d3300fca3d08bac2', 'a663b5158a220fdbb3243bc2e2207eaf39ad79637f2ced56b0043a606c7e4a4ef553396daae60567', 0, '2020-02-11 20:32:43'),
('ef8fc24af87656ce0ab201bbd12f27f68ed8a2db71883f357617b0a745178b515fd5a954cb485e26', '88813e667ec4a936dd44fa0ccfe2e926ec92e9d112d282ef44294aa6e09ababca44ba50cef99e18b', 0, '2020-02-11 20:47:49'),
('1d91748802e3447a42fb28abc0fa9cf4a590c31b5fc1439307be5620285b1c2a3d2d3c44507214ce', '8864b11eaa8717b3c3ade4f7ac4cb1f385d0cf42680a07c3aa168293cef3c3f5e1704ec6027c4607', 0, '2020-02-11 21:20:42'),
('d0af396e6ecfdcc2aa9459183cebc111b5f4304e1f424e6ae2b202e6bc0c43207616c4aa2f6cc20b', '4e6a956319c06e69ff62e349d8d9b27620e6394b4d502419cac8692cfb4a5d495a9e46a163078bfd', 0, '2020-02-11 22:52:05'),
('f05cfca53e101beb487aa45d970c47be63da744c36aaad02f3855e8fcafe8163430f2b92e6342367', 'a06843a913cd0c8050e8f51848b3934acd560fb21f2351ee6288dc3840499d6a21b15152c2801ad2', 0, '2020-02-11 22:52:34'),
('de69bd0f4c57da176ea86fe2cafb596ef5844dcdb0bf0bca01f4aa3d85de057c90dc489e3a487b78', '0bc844acba9f444ed03a0aca1a63a9b92f29a5dc015df58884d8a77df24024d74f609bf5605942cd', 0, '2020-02-11 23:10:26'),
('6ebe9a5d503fddc4030f89a8cf108e1f59716aab384bbd24d07bba67fc05466ab8a20e6a8abb4c0a', '583837f9cb8e81de95856897898baf2becd67681da4f608720c317efe282dc554bc16aa60c9f81c7', 0, '2020-02-12 00:40:28'),
('907afed3eb2b40c566f514567ee3ff97bf11180ccc514d56db9bdf9bc1dbe6f700cc1c79b6d1e1af', 'd4796fceb1fbb0cc4472cb0f63e161518fad5dfd65649917bf374c426afb1cd522e71ffa468bd1d5', 0, '2020-02-12 09:42:00'),
('c0c8ab964687d78dc40f25b76953cd5a7e813251a31929565381eff53bee2d076a5945ce83b6535b', '2e0ced15e6e25245d1c3fbeac2be9affd4d8fce0f454f1fb44865b69b35f5a1f5d95a2a8ef98bb7f', 0, '2020-02-12 09:42:04'),
('599583c29ddad7ce94f5f26dcdeec61cb9846f7e74a8538cfe6b9b6d614adf6fe9964d692df86061', '4142670c1fc1d8bb6711275a193a11d87d12c97092185cab3be68929a42477b4694205901401d451', 0, '2020-02-12 11:01:10'),
('f2ab503df13473651f43ecaea7354aee6f4d9f6fc55890a379f65874d3522275c3c24657fea8b866', 'abd8cc12c89a695ef6fa35c8705a16609fd4b61cd7ea5c4508ec394d5cee23f617cb62a88eec4552', 0, '2020-02-12 12:23:16'),
('202fbd118518014e1155d908639896c4f1572db2eea397b68f4836f3c6580025627cff8cd90cb4eb', '9ae35399cfa84115662c37817e94a93a73a2e26a22ab0afba82960ed81d35911c644ede123f0382f', 0, '2020-02-12 12:43:45'),
('d95fbbf7394ebf4a61a2baf8b4237348229b33baa183c126f95e8bb95f6a38a1e21af80c27c1b322', '1c49d675b651f0d818be63799c3229580d7f1b8f8e488df6e4089c541ddaa46c87007fcb81d9cb0c', 0, '2020-02-12 12:55:16'),
('40cb76b892eda40f88d07275156a2f347af33e273d969f83c3f707066eaee1de97c2892a71c04b28', 'f57bb53909da9d8c1715f540ce5d3d2053b2c63feeb479a7554dc0cb53ab4770bcb585ab70a426d9', 0, '2020-02-12 13:31:29'),
('9ac45724be643eb7ba87dd9ea1480321e6b586a7456fdac871756db11f03d958e1976be871e55a12', 'c14e2e908be77237b60f03a1ae43edd8e3560fe6360ea5bcd13c863358e2ac125691ee27115ad17e', 0, '2020-02-12 14:33:34'),
('d38485d1a93042c1e84b99f3541c5630e8c869a5759dedab9a2a9d6038de39eb63b7d4939448a4e5', 'bc44f48c407b918f823df1fa39db6ccc9011799f325590cd1435962e749224a1963133c0f0002519', 0, '2020-02-12 14:38:43'),
('951dff2da500f3b53c6a1965561c170ca5991c642835e969efd6a2666b074f5b51e4460b827c491e', '3d0cb5836135e2dbdac5b294c07c1098a793820638c13178cc04c990370f4cb24fcebd921f8185fb', 0, '2020-02-12 14:52:26'),
('830fffcadc10538bbcd145de0de95f403e812cc5ba56016d8e6b50ccad534ee23e83a40f79d64e1a', 'acbe942cee5758f9311bd053e00a770c6bfed0a70de4f0434476b24b467e609f4146954742dc692f', 0, '2020-02-12 15:14:25'),
('ae77bdc58f104ec488e346481ecd30163f5a341e5a0f2f21cf1d7a2d85691228cb697bca517316a8', '827d43fcfd70fbb7d0b73249cc323da0e9314f95fa8d3eb06ea6edeb2fcbb85f5d09fa64af6d8a2c', 0, '2020-02-12 15:40:59'),
('75e6984f1d0d9e4c06605e8cd9f0653d482df84354f002cd1c603cb84b76d96a52a448bf5873af87', '43595677e07fd91cb5390622892df6e65917e7fa41e172d99a856adbf754d1caaefb714d061eba67', 0, '2020-02-12 16:07:52'),
('414f4dee21c75f5c42d3232952d26699da5dba7405d1ee2ce67b554f5f0dada8f4b21570bae3d515', '72327da32d147767ccb35c2474438f23c9e632840b03861aaf6e865dea9ceb1133fdbac4b6401ed2', 0, '2020-02-12 16:34:05'),
('a24834857c2da6e25bd9185d17d38f2f76909f9e58656607dc142f46310de79755a4c3b2c8d6d579', '07961290a23080cd8cea104de477094036940988a759a186b973a84b8708387f4c4725ff686226a2', 0, '2020-02-12 16:34:27'),
('da7eef8df205787fea1db351fb64e727410325d213b761396dcdbf40f5a70b10b05ef74b2a3e0a96', 'ea097c828d8ac48298e8f7430ff76f22ef8e22220b0fa83db14d991ec8ed8547a3cb1bb64e02dd42', 0, '2020-02-12 16:52:44'),
('fd2cfe29d68ae7ee049be57774528980fc6dacf327324d3fb534a25e6f1af4ea51f00d0273f3c749', 'd4e64340274910d3ba1ca7da0f18d19dbcc7185846bc1c3c1f82dee09a09e0c410394d988b9d9e6d', 0, '2020-02-12 16:54:27'),
('c26e8a2d7ad9443583cdd4a95db9613ed91d8132e724465f2c3351669b1c5ce9e3814c65a430d071', 'f7d2d9dfb11020c19d2cf27f95120c5e4cf2697f8c048d2a89a772fe2462378d7ac6316e81043738', 0, '2020-02-12 16:56:32'),
('da72135f0efa5936dbcf09452b3f5ca5b435fc205797440b5ecb5b161cbaa5ac51226efb20f9b975', 'b83c858ea90648f7ff016e567c8e940c733b0f63f99f213345dcca329f011093f87433ea4cc0c701', 0, '2020-02-12 18:11:59'),
('85c2e44cb8288d0a1fe03b7110d6378b2932a1c4250274c2c7cacac62227392ee50c74b2ce8ccf9d', '31741fbe6f29af9e310df2c51377f29a821393b7cb2afb1ab93a77c235d9954baaff7659d843b9ac', 0, '2020-02-12 18:41:23'),
('dc32eabd87951c89d25c4b1ca56a14ace0cba0663527d128bfed20bcd16a61db296df11d9b03d55e', '87f91ba1d1e75ea943327a736081d84ef87048962b0f0d1b8ea4f593865bc8eade58343b81f68733', 0, '2020-02-12 19:45:38'),
('63b2f9374cb1e3bca305f0a551f2890b984add3b8bc9b5db4b7938af3ca3f4eda93ec22e5ac9a869', 'c8fcdf387cc5d62063e8b8069f176a67cd17e2dfc77a5e026c1859580985755e971cc3cc8fc17ad3', 0, '2020-02-12 20:08:45'),
('0f618dfb5d9c15101c60554bc29469f38917f1a02eb9ee9485addfc8d7492d10685948c3a48901be', '46f9088190f4f14a7678121ecc2d9068962c4c65540ed7cd1dc7ada7dcc016d65de0ed8527fa8324', 0, '2020-02-12 20:33:23'),
('8ab7855848a42be6292cacf765b7d993143b769ba4238ada0112a3f8364292c1b66226a281ebd2b8', '4c09da8a2a2e4497a748daa49254ee7d9055c7dbf4f5f9820b5d6450ba0b2dc240cfdba17c73a1c0', 0, '2020-02-12 21:47:09'),
('fa70a175b793663a4b4bbf435edb887a2e70c49ec0d1a97dcd001c76d871778b73d00150fc5dd7cf', 'b03981a384f97bc572f19b344fc78008ce40dc1cd6b0a4ba6a43183b32f34c1607814322541d2ff5', 0, '2020-02-12 22:36:03'),
('3bbfed918f32e98fd49aae4970b95309b4db141982f040fdcb9b314749862bad18ce8615bae47ffb', '3c8f383130f187c2a254b10493c2eaa8c649ca2aabb28771827e1a320e4be84e82d241f985457ccf', 0, '2020-02-12 23:10:59'),
('5d4824fd5f5413858c1bfd389adb11385c0995c59131ad59ddc306d964df6859b22438012ca48422', '83826ebb5f81b8fee7f45f4d33a2917e09426c1e2d87816b2f49a7d6592a14d92d254b072c366469', 0, '2020-02-12 23:27:21'),
('eb5a150fbea33e11305af4764caf404c42aee8b27ed307eb1ff64786061445b9611e0df8628dfdf6', '6b1304e0b148b143b51ab10b1a572717724ceb276b3ca674e916b8148dd78cff68e4146bb42d42c0', 0, '2020-02-13 00:41:20'),
('7dfb5cfe56843fdab43f14a9994f654744a4d4116a07b1520958d8a50ef64a6939be44b5538d4b30', '1a98ca273b3547f43921ddadf3bbc4c9bd28cdf60d03f45d1f053e5ea3567733c8c59f6081c73243', 0, '2020-02-13 11:08:47'),
('4a76d582a49b1b158d97bc83b40201baca85accadbc86589d49b1216bc1f842431c6e9e996e66fae', '525298bc2f8a6f4757b93ba390ea6ce01a2cd495bfe1775fc76b354cebb440393c088fb60f6402d0', 0, '2020-02-13 16:55:29'),
('d1d55b4ecf2f78e50e74cc4ab120fdf1300f52d5ec0cf21316357b4795143d0b997128b547ea9b0c', 'ffd4e78489aae8892b2e04cf78d50391e2375d3f168637982ff38f7a70a23d7226bc03016ffafd23', 0, '2020-02-13 18:13:17'),
('f77c129b46a0bec9b91fa370a1cb871894c8fb4cee8bcc5ac138259cd54f0184d000d40c8875d112', '8fda2851490cba06c19af2964e2bdfd0238cc8682732a8df5b19d91d1ccf9b8d6415a0501bb34b79', 0, '2020-02-13 21:22:45'),
('fd88e16d3d15afa9cb7742c523d954e189d92ea581bf2df370ad47484015a4bb513de652d5ebd3e4', 'f353f3c0a227544e2129bcadaa6595d63c27d68e84d6459b1bfd95000bd5f42f54413b3a0ad721a2', 0, '2020-02-14 11:14:07'),
('c1f0d0786a76c7198e732dedf0ed217346a312ecff69bdec08dfa90d72953af77ccf8d33b6b14dad', 'ec2efc83073cc33f6f0baf9480ee4700f2fb11f04b233911db85658dd7a15625ade31e1e8d4f267f', 0, '2020-02-14 13:43:32'),
('77531f249f24a65896cfb12776fdc08d2e62208f91ea9006885af15ebff2e783135c7e6a1d081e5c', '6bc97efd2e3de2f39df9cf597851d6978d8c8be395595a7629cabbe642c2db18d4ea7eb7ab54bb19', 1, '2020-02-14 17:06:03'),
('0d6adfbb544bdc2b7b793c13afbbd6f5c3cf68a13a045c52c56841974dacf604355de2980c20844b', '6881a9a9736026494cea261344de0869638555b360f7006869ab36ae109ac460861576e0c9c52b2e', 0, '2020-02-14 17:46:32'),
('e8950a365c3726cc99f6e38abb3e08572b3e84031bb2604b1b7827b316b41bba90dd112d84d16ba0', '9e5205c540f86a3666a42998482cb7001034e6caaece3350a515a42467bb5eddd8930ec899b73854', 0, '2020-02-14 20:58:49'),
('b1810b093188c3d32fceb15e841faabf81a7930c12929517c2575948c7ee93ec17e11b671857cf76', 'fbf6f99b9a654c5f364a749426b99b06f44eccaaf3604c4b2faa0e36c00a5e4774ac09a7856daf2e', 0, '2020-02-15 11:52:51'),
('e65e945308e0d7ad93c7c39257f9939ba23feb0ae65a2aee76c79a81f8259bafd0fdad717112d2d9', '7f3eac47b3cedaef54d1d1c66dd184f1d070e962bd6762a6e107198b6e51e8e38dea08ee869d8e36', 0, '2020-02-15 16:24:18'),
('ad416cbdf65cb92ac75f9bc0f4742273c23ff94d9c20c5c4d1e545dfb53dd8106eed2f9f738a5242', 'd08366512b6283f5c6bda4197bef60dc9e2b941f219eae0d304e6f67267142d4495a13d8f9cd5c5a', 0, '2020-02-17 03:22:29'),
('9453e175dc2991382245985015bb651174cca8c3b3c0a4d187ece4b04e3a98d86b2e3110ea467487', '279b47bae04ae940bcb7421db052c99d506309f10f7b64fd442058de0d5fcc79e5391e89f6cc5b7e', 0, '2020-02-17 18:34:55'),
('a82ca85f5b12ed55f92b54733a0001884ee80778e9abed7da1cd64804a4e593e3da68a97076acea8', '93a05a1dff52d2d18fad86125932f88503de022ee8f901abb2df4bd14fc8fd704fc09223c1235724', 1, '2020-02-18 11:23:59'),
('3622fccaac900b8a01a3a6d7b723babc6079982a9b690029b579d527972546fd22f45df55acee148', '80543583ccdba5e1e16707885864fd08846efa9320e55623c235c3d04ec673b601575fdb7a4acc81', 1, '2020-02-18 11:24:03'),
('e150ce73cad6e05cf8093e9c987b18e7234faf20c77cf13f29a7a5ef8704ff76ad22170a7a394572', 'd3d3ec09167dfeebbb8d95f58a6db04ffbd16ff63059041157372c70faba01a7b890715eec968d6c', 1, '2020-02-18 11:24:07'),
('5fcf5548a991ef2f0108aef83f39cb5492e51fd70cadf1693e169057e905689330b18239d00abccc', 'd192fc48a64e3eeb63caf8f314601677ea52c3b8318e4c4bb1317fb1352a8cb081a8e6488087fee5', 1, '2020-02-18 11:24:11'),
('1d30477231c4cd8ea3a0f198c8fc1ebeccc1bd1a387786efd8fcef16de0d25aec3af5de6a2a05eb1', 'f3ce9cff9e3c0b57785c7ac93406b4ccad6163dd1dd2d37d61fb56bd51ce7a50d274023d1e826495', 1, '2020-02-18 11:24:13'),
('88b38228b457c9eed610683cb1eaa087fbf4b9c04354c44f2dccea25df49818034ebe37f195b5950', '3a2a5dc91d1727fa3255cc40e194cd64bd410c60377d3c0dbd9b2b44236ba23e7a2a0062b8790340', 1, '2020-02-18 11:24:14'),
('1b6f80f3fc905221737d4d057ca3595e77ad00b9e23003d203e049fe548421d28ef0fe72f5dc81d1', '378497b32760837c6d7eed22afd15c08e7a23a01c9aca7d6c57b0fa00b0a1915d1b484fdf5157bea', 1, '2020-02-18 11:24:15'),
('a41e66e350c7206c643249465398bacbb5b03343ba6527de0485b41421cf5c8f3bb4564a6468ab0a', '85c3b24fcb92d829604aabb8750a4e7e2992d2941a4247ea6e12f83a8b6ae436fef49b66a3d66fdc', 1, '2020-02-18 11:24:17'),
('c38d7aa85e5c2c79b40729f382097cc5f119790a66ce27a2bd8aa3ec8a701f5d604c1322a19b3a93', '21daf3f2659583e51ce29478a4a83821c678faca091f3f0d1bd6941366b1ab7a9676c6802a7a235b', 1, '2020-02-18 11:24:18'),
('c3c83fa163fb5ef0ab6e52c67a7c2784dbac53b63b7fe0e9ebc8c9113d2b68d060c34c3eec0de56f', '5ee989eb82a0a596bdf5e6a0c3ef16f6887217d67c5b574529eedd1a536fdadbdbba6a7256de3a7f', 1, '2020-02-18 11:24:20'),
('b280729f3c9f38fa9542672f74aaac7cf0779b253ffc8861c754263c573fce1e9557b645ccfe2098', '534d0b355e06c690a27bbcdef8693b9e182af191c290402b75e7d7a04a131dfe4f05c22270c64b74', 1, '2020-02-18 11:24:21'),
('948537206105cf62b25b9009df607fd699449ca13ff8e8158362502f49bd59d66e495c8a45337d69', '85b0cfef60ac56849265822cda310c3ea9ba693e634e0515977543d539302d39bc428d2cc76b0a6c', 1, '2020-02-18 11:24:22'),
('7db458679eaf05f5b084532ba8c40df4a35fa5dd1851614f63f896e34fdb211df9cdbb2f834515d4', '094f9ffc24311a40931eb5c57f2a3741b4dc6dc0ec00f4061ab4f8cf8b145cded9831fc690f9fa53', 1, '2020-02-18 11:24:24'),
('e181a456a2f1d8b4ccededcdbe530fddb41c2148642635ed2b3c0d74571b6a932a1b865ec4edfe11', '6e8463814c81695c84c87374bc8613540b0d453c00f8cb34df86fc13e01082a7ea6188fd25a4d644', 0, '2020-02-18 11:24:25'),
('4376cbea92537653f9e1163907362fe83793d4df285b477bc3aeb7842890890d6fa7facc976f2c44', '05fb4d06255072f93a983f032f9f5ad44ad6fb01a212861dbc5e7b16b519b9e28e9c388f62164576', 0, '2020-02-18 11:24:58'),
('3020fe9ae8bfec0e1a1fde6a51f974ea0148ff916ef1da2cca47d3178308717acf133f5115b0fdd4', 'a2371dd15c482ecf9691a8dff578b2fa7257c6474f6589afcc4746d218edc665e7e336721ad85527', 0, '2020-02-24 22:08:18'),
('7097116f3e48c6adb714e7eb400ffa6684d556b0823f0294fdb0f3e436ee47eb0a9cfa9fd3c47512', '293b831ac90cbd952c3d645dd691cfbe19f9c075a07f5c266d49eb0b5cb392ae0a485894cbdb4e72', 0, '2020-02-25 00:21:32'),
('16ba4e56d4efaa3fdbfbc97d64ce710e5eb1825b4ad4e10a6bfde560f1b5ec2f4a5d8e8ba8b7f5dd', 'efdd1d9f39abf047453769e6e4b213f6e6e804b12c4d4b1767677b1aa8352c65dc4570998548d61d', 0, '2020-02-25 10:18:09'),
('f8f6250687470abe49ab1df85cd1153498c2737f77113c8c23447106b58edf07ba04d1cf7b00c2eb', '68a479e11ba8cfe227857fa1d5631b77ad669920218847a2414f5c81e3abe40a7b2bea0c06e2711d', 0, '2020-02-25 20:22:52'),
('31812f75475666492319e6962d81cdec3cdb7a04288bc7153c7f84c0b42eef0403d449f192bb8394', '710007804f8d54c1a70a1fafff81e69cf7c2f347270ef1ac083b73c1de2ee64e981c281fc9dc2638', 0, '2020-02-25 21:08:41'),
('400539ad8c7dd304646dfdcd85443eadaf7e18c2a7e7b26a07c505a1cac5a9316611da309922b2e8', 'f84e7a20671e058c266670cd115a12e8cb9fa4792603111ed45ff99335e7df991dcf96f3940b39ab', 0, '2020-02-29 23:20:28'),
('0369f76deba92375715e04f2c7f6ae09bd2edc5bfbc659a9599eb6cb9dc212cd060ece6e005a29e4', '2a67fce241484388076ed92a5ed6acc60a87a474376d78ef1ddc98845a7ee51cf0d80283944a7df4', 0, '2020-02-29 23:35:22'),
('a88f6a83487d168923844fd09324bd7dba3e0f171f689c1c93bd8988df4f4d752cf0f5e80fb63be4', 'd1d68de83c0d340fae769831a40ae0d3dfcd89c1b53c926c36d91309b6233b278c8d9859ef3d4ad9', 0, '2020-02-29 23:36:33'),
('3ad20981cd265ae18ce945502a694ecd71d4543ff2d765264b026ee7c10ac0e8d9053aa490adde5a', 'cd3cbf1e872154cd656334f627f1859a61eb27fe22f12ad6bcb78663a78fc353cff4c77282d4f85f', 0, '2020-03-01 19:59:23'),
('90e495abaf3eb09e308de9d3bdebbb0a1409c1a156f563ca076836b5dd9c985b17a4233c6a1b3fa4', '29a5195b063a847ab3d65d2553bff56b415225939b0cf76946e64b1be29b87abbf81c1e39f264494', 0, '2020-03-01 20:59:03'),
('289da3351f42b78d829b58c6976e24d4bb39da983e7aaa812590cfbd9e8fffef2200b8fad2f3358e', '01414d4270fd012aa80590b484d8b6d8334befb5dbb15d80c274c6bbfb9d6b61da70026b10819438', 0, '2020-03-02 20:00:26'),
('ee0661f093e3429cf2cd4ab0780bdbf30fe3b469c7ff1b7728c5cafeccb654eee92d54a54f3012ff', '4d5664b05807c8efd6045c04d5d9a61d8e5dd3c97ebab3f7b197601715c618aeb5ad917af9cdd44a', 0, '2020-03-02 21:30:43'),
('5a62bf5cb281517452ec1ec5afcdd2889bf7aef12e7962763a64e37242bed7abca2f52c6bd054e9a', '840040bd691f5418b1bafa5bfbe7c7f96ffba1dcff787b1fdf2e5fa6675e158a732ce399949c56b1', 0, '2020-03-02 21:49:41'),
('62c6c876e486ecdc6fb11728cadd8d6add0a2c87caec52f3817c0cba10b41ce45cde0bee992aeed8', '98fcee081ad7da104dd3ced27c0187e9c223dd5d06be9bc831fed7b56a5e6e72513ccf039fa1a4cc', 0, '2020-03-04 22:42:02'),
('9280b3ab6ce1140f61ec1a94eb838a60cfb599d99323c1a38389a4fbb6449f53646e2601f53d532e', '8b86e74d24bba8e74fb140c4d38514f03f8ab291aa9f693e5f3d2add5c8f64ffcb743595503b2029', 0, '2020-03-05 13:10:34'),
('0e41c6d950b1233d5b9c42eb4873031d96f8816bbc03a9f7f1bbf3e52267f8cf238ce50947a66f2e', '34dab46c2e1b876917f5ce0dfea3d778f4d68a6721607ffb85facc44d368f0a5f96269500771b8d6', 0, '2020-03-05 13:20:13'),
('c0a851801be0e3ef9d1d90c7633056c62228ef2009f6697d5b8be8f71410e84c71117753ebb441b2', '2a00bb714356ebe0d1d914189d1505c61dce9048b634da634e3b05d875cdd857b30dfda75b7aa70d', 0, '2020-03-05 13:20:14'),
('c22dd0419d68038a6ed60c93b2b35a9eb2aa780cfbeb81ec14ee69bba3df605a985ceaf726d9d872', 'babe0aa05af5340e13e271a2c8c02bba14a42e8b30835f6c45c4e713b6c57dcf46dd2bca2cc53375', 0, '2020-03-06 04:44:55'),
('6cc3d133af461906d8701ad6763a282874a150b0049634ae2e59af6ee2f87a2a5953dfd2bfd9dfbb', '175cbf24f1b470e97c896e7244a6afd262ad49583df8b405bbd1e6d4cdef944afa7b66cbbec862d1', 0, '2020-03-07 03:48:07'),
('9e4f807070bc6f0eedbf3847dfc60f4b681fd5ac5a767d5d86cb45dd1094847bf719b45c5b48fe66', '638aad8f42cf0dde24fc173688892fb02487e91f3a79bb5459e0e1cd5228cb401d7272f253e4aec4', 0, '2020-03-07 03:49:03'),
('2c123fb540561a8f0b6f050209d769c2b5aedf00b880266ab8def8b417241e93225f11b46b36419d', '3273dd04719006c8ee72da0122a649257e6aa0b0ae0d40595915ad5b9033cb17ccd5a0c31c43dfd8', 0, '2020-03-07 04:54:30'),
('a856bf9b4fbf3b89febd17b5a7befc72754a7de29876c1eb82f0bbeca35ca3abec57320e46ff3dd2', '4f9801f82ea034c2a756979ac9d95ca3d6b8a8983e5876bbf14097a539840e64a59411c2a5c94c5b', 0, '2020-03-10 00:54:50'),
('4e744749528408b657c801d8a066b905e2e76a4f3ca6f50ba11a695001fd0a12397453920111525b', 'fe5ea2bc734d85e0fa3d335fe95bddc9f70c1cc511c554565992e5a32f89d7c2f2f69fcd96e9eb94', 0, '2020-03-10 01:23:05'),
('d48abc09dadaf93cbe78033cf42e35da9d09dc59ca515af3cdb5b37cc108ddb8dd5c2bd0db1ca09b', 'de61667fdad7a00d28d3919bd115ba494a743615f33a4eb847be13d9b959dc56410e3dbd74d0fef2', 0, '2020-03-10 16:31:00'),
('17d7263938892b912f2dd734582f2cf1aa9820df7660a72407a302b3788251fe4639bbee83890253', '6dd47481342ca9d882aee9c0c214fb3c4c6d6f5a53e152dc1eb1f442393710b401cad15614738c84', 1, '2020-04-16 22:40:40'),
('24927eb35586eb99bc502b0efe26216e6c3bc2dfd95ffbd2d9af3cd4fab9f2ccc8acd89f6ada797e', '4a93d3829ede405f4d2942333451437a5c93106a4f79431e43d456e33cfcdf01e19ea28cb56f0d7f', 0, '2020-05-15 15:52:43'),
('511b810e244176cfcfe3863a49f1f02c764b300a894a3209ce41fa4fdc7c4cc52560a33ec10c2ff4', 'f0f7e0c0d965f7720380b87da88961a8d61422b816ee29804229bd61b4a4a250504f550e71c1ec73', 0, '2020-05-16 18:54:48'),
('8e789adc55459f7aab0775bfb482ca5112a875ce5b563af2d2cec4c892ccf2631a6e9d504487b2e4', 'd10f532188c992c47167334ac31de3c099534723f1684f212d1e8946152af8c24bb4891a96e0f15e', 0, '2020-05-16 20:33:23'),
('b4710d35874df4e023d862f6ede05a9497f5ff0f08f16879f03c42e24f4dac5c4f45db0c4df0ef1d', '7654e03021e4ee4d63f78ec34bde78fcbd90a05f892cb8cb93d95e71d4091555f3ff8e7f40c2d95d', 0, '2020-05-17 07:35:17'),
('094072575593ef4b0fb585dbaea9e03157f5e64a2c9bec04e9d81cb5a79d9f6b99ba68cd8e93f5b4', 'bbf5624b35e02d95686c6161179c49d5a89d3f935bc07ff7ddf6ab87ef44e364fd27e1e46404ab99', 0, '2020-05-18 14:06:00'),
('1e3d4c60c9b80612a0db73762a81f480347487e86103c06e1ae7eeb054326dab01b023cf9334a67e', '7c43820396c8c9d4e4e3c27c1b612da3aeefbeba1cc44f56ed5c2e002cfbf2aba6d0e57ba7fe6b1a', 0, '2020-05-18 14:38:52'),
('005abee12fc2dc8c98225895a3ee3850bf5c238182160d5ad56a55a6b942c80e284f8af6cbdfaa11', '665a08a0e8e119eb7851b21047b75d927ff36338a3d36e3b12b4412a941ee95f1a36e9e049569dc1', 1, '2020-05-18 15:27:28'),
('0f25918ba05642fbcfa054b482b431610878c66095b724a50b9c15c9b2de0c5317be01d70456e99d', '73c1cc3ab069b8c0327b062851578ae9f8c98ed4d43df4c2f0b9b974d4b8d49065f29532206ba85a', 0, '2020-05-24 22:50:38'),
('06c6a767814b50c8d5e853a16ecd5fc3fb4599eccaf956590b7d62e77b8bd65a5a8a20de60317de0', '37329fc50cd07f3a7894c2f5fd80f895bf497fe8a20e37a6a8e1c7ee2263ff5c4f63cb41f798a40a', 0, '2020-05-25 01:43:51'),
('dc08e195fbbdef19e3b4cc0e1ad02c17acfcc9ce06b3930cd5f55a4133d89d2fff68faede2d95cd0', 'cdd514a16f3603a6703050ec7fedcec7fb242ced2a89fd1249ed45c04905a8b9ecd5e9afbf6ff266', 0, '2020-05-25 04:41:06'),
('f2def78e6a46a0804597424526d196d198799e918966b331a75bcf62312c5df57949c4dff95ac8a6', '2fca9cc3291c17ad57a635dfba0e1a40574938f2f8867ace4a80b1d6b397b9d4fd2186564a4d7fb7', 0, '2020-05-25 05:43:18'),
('26f937c848f4393724d1b95250b1ef81d707e95938bf6da91da00d080a33c4b00181bacc48a234e5', 'ab5dbf95ab27523f668849c129d30e0d22c148b0c22d44ea3256e66a55fab1b8aa3d76ab35e07ba4', 0, '2020-05-25 06:11:28'),
('51f6bb5ddfefabdf9b0acbe07f1955d4872aecdd4b0e6096fe81e457ceec5bf9fc815d6797e89615', '50a135ff426613733fe0d3f552fcb49a7016a2305170f3665aefd53539788a1b561eddd470bdebbb', 0, '2020-05-25 08:25:36'),
('2ab2858ecfaa283b7a4e2bd4e50de28f9e77dd2d3ab6012ffeeca4ae7d5606339212696ec8843fd7', 'ba56ef20be68ba7b2a28bde623abf4e629ac3b3bd7710138b9ad1ec6c4ffe1f674b2b4dea6659c30', 0, '2020-05-25 08:48:25'),
('56b8989348b2c8d894a8c55ce57397b4ebe1beca5509a66d1b66852399b29fbf152e4b75ea501186', 'd5716cfa813af883cbb1340cd2fab99e9f81c2f5887ed41eca39aec666634c064c3b45e0322813b7', 0, '2020-05-25 10:39:26'),
('53d29c673bbeb7c50dad70bb1095a9422d316b239a410d8f9c551786f6a7ecd6c7b6bc0d63e1e7f4', 'ea1af520249943228edcffbe58011e7037286cad1efc0bf50dbc49dd095b510128d08bdcfb033dfb', 0, '2020-05-25 21:08:54'),
('9ddaf66d24f9b3d3b1d0b96e485881b0ca44e5af0d102a42b182dba9b23aad70b337afc431efca39', '6ee6b3c1475f0c8886427d3c7befb110f2b1797a93d9a28ad6bf187cca6a440091ed7f9d58bf14c5', 0, '2020-05-25 22:07:02'),
('f561f088f0bed6cc46d7d72b235613ddacb8456d6108d3813c1a6e3651af3e8eda85e6b311210f98', 'f30691953835a31e9eea42e606ce85c7e42e015eb190a6f19f6ab469dc994857ad2255ef941ce3b3', 0, '2020-05-25 22:12:47'),
('d283822dda306e230f024a320907dc78c73a2175ba9129d10a837f28470ed2859a01ad32f16f4a21', '73030af9097a29bd3dcfbc55fd56096329ceef068a533b0ae95f9001ed73d70b8aa54eeade0a6885', 0, '2020-05-26 01:17:49'),
('476a121ba84ffb68f8ac582a90e432454a9b2a9e184eb9c72f244812f460a3d935f1bdd4b7b7cdf1', '51eaf91d4d2555ad3915b15adc785e22a2c456f7258c70de7b6a2c489eaae2579b2cb7c3e7956a41', 0, '2020-05-26 04:22:27'),
('76f510e122674ee264f0560440664098377d15a125ca416ad4254dce36c221be72b63acc20c2d8b7', '8b75cf524e43d99c77ef399530dc9b082bac7b6b87e1fcea4c52d2536081f2145cbb20cfbd30759c', 0, '2020-05-27 01:22:00'),
('8c9f251578b4fcc19466c0632b65a416beb218c7b461fc77807acaefa43fb89b507bc3844e57c6af', '0ef8cfd8a6eb9932f044d1818c8224afc356c77fb18daf87dea79280a75e0b966a2019e602dd1e9d', 0, '2020-05-27 14:17:02'),
('a920d038407b40ae6960de03ab6f3f4a6fb563bb9fd6dd27e104155abbb7b8826cdf21b17234596e', 'c138e6aa5ca51458124a940fb924fd412d75e03fec83b5c7711e3bdc10e1cffbf4345a055fdb1304', 0, '2020-05-27 22:27:24'),
('ff6b12d2ed01f35b8cf29cbc24a57f70c8d717872202f4f44dfa5281f3f31547106ec6dea01254cc', '9b8588a49905743bf1f4f0cc85b1a5ffe67718b3a0d00dd91feecf7e9a8d16559d97c0705e6304f6', 0, '2020-05-27 22:55:40'),
('ce09f69937efdff9f1a701da5f4108064521e03ede40e5234782439359bdc53ca575d6761a2c432d', '342ab7c6dbeaada6bd0d314ea7da81460846379079d48d25a768516fff59326b3f12ef5bb0140bba', 0, '2020-05-28 15:00:51'),
('df39b24ac81e576eb657bf1ddcc8cab336bcc16fef9681ca4cc41ed147014826d8c47609bf0e674f', '657e415e72f3fed7afc2708df283899f9636ed25eda3e57429876e8137e167eb1c3ee0b381f82139', 0, '2020-05-28 19:12:27');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('34dc2a7d27b7c85b217bbbaf2a3bbd5f7b501a4c549b56efd7582dd119a299472fd48c2e6ead13c5', 'baa5be6329fb3250f4e8dbfe4e608aa5a5b74e2bb8e6b47d76bc03cc3356e3274fe4f3553fa0ee09', 0, '2020-05-28 23:54:18'),
('688961204b8eedb0baa799a1afe7dcb967d90c0d98f74282b257765ec87a32a910ac3f825219f291', '5d498bb45011d4e7049b035b222e1c2c7bfb70ac4a1a79fdc77b79a0bf4bfee31658f145e6c3ea7b', 1, '2020-05-29 01:18:01'),
('7cb28c0267154d089d439882378359f00dd5b8b7c54265787cf121e0aac294a040b4c1472ea9f4e2', '0b99ce105ccc60cb9030c943fac0094147ddf9c191c7036eb2546a6f61e17abdba922fdb6602634c', 1, '2020-05-29 01:18:03'),
('84fd7cedbb6f96ba40226d037f43400005ae07ba57caa46f9a663c6c4c51d9442ad3275e25726e4d', '6d6c86e1e1d0444aed82acea19a1d41ca29068179e126c9a1a624663dac0881abd5236feadfd1606', 1, '2020-05-29 01:18:04'),
('27b4c2937cdd4cd855f027a8c2c7d71fee0dce3f3b4998e5351e2088a4ed9cf3ae14132b582c90e0', '0ae926cccf0520ea81305059b95cde831698485d34ae202d3f743ac48873835a94505e599545f72a', 1, '2020-05-29 01:18:05'),
('a2b7dee127020a14d6132a594e45b5808c4225cd3f0b5cc85206c5fdc2f57e54df734df9cad7d14d', '75e4cbae64681122972c585849f3d20aee9688b30da5092272aeff41445d48bb4ffb55c0443756bf', 1, '2020-05-29 01:18:07'),
('9217e9346a6550eef725e9a8f68f045990c79d1a0fd5649001a894caafb83e25837cad5f0b10fded', '5d13d6737fc2e89f9e1c3d8fc1d76228ce5a129e831f2973d0549171b0748be4a46f727e3ef749c6', 1, '2020-05-29 01:18:08'),
('4d3d642f6847cdcba5158f3161d5159d1f060aef4cb35941e055f946f62cd9fe63b04572b15f6a8a', '65c071e35d1394e17b13ec3a70ee7a900e2b3863613812116a6e38d99a1cd0103c1da4965a6fe8f0', 0, '2020-05-29 01:18:10'),
('ef0661991fa06edacc2a49430fca13baf3e5446cdda15a59bff4ae19327ab98f3b97777297f477d3', '3ed8b545f5b6446c330a205cc8e9cddbd36d7a558f7b871260043c4a77bae5f540b847ea17542760', 1, '2020-05-29 01:19:19'),
('cae33014a48c661088ef09b0c1ef6d0d30105d3a4c60af1ff566835733143bb50eb830d2bcf5822f', 'be522ca0fe1860fd3a01e165f6d06e30c4ad3fc98ed360014240240bc026d65507ae4fd0b2d39cac', 0, '2020-05-29 13:28:28'),
('62f9a975eaec5b387e42289487d1d9f0979d9c193fcef58f6dc53aaf0c7fcfd7e35fba4ce385052d', '39989ea6439651dd75ced7c0f3a9ab985ef6f6d25fd9ef9d0a2bcd22af6bae3da187e8854c56e252', 0, '2020-06-01 00:45:58'),
('88b7f25931186ef40acfa17630064c0547f3af6df3fae3daaa847fb2875c6d25ee2228b57cb37449', '47ffb381eeadb776e6eadf455a0170d5722c89896259c66f4a36980fa3043c175ff11a0486a6a273', 0, '2020-06-01 03:22:10'),
('eb35cc8c4833da93c340ded76465e2764f884cb1b61f0663149480932a6049d5aeb19fa2ecbe6f4f', 'b83b591e71f33d21fe8910b477b16245fa5ef3c338481159be145c1341305cf67c8e0968a4cf186f', 0, '2020-05-30 09:21:10'),
('830c2b0f797eed2cfa96c17ef43641b2f24e1afd484dbd60265a6850c281a3b695a5b0afdd0c96f9', '4d0cbed2bf37fdc4e47e0f1c1fbb10f1b587d17879abdec3b8479b935e80cf7547e8393bcb55eaa3', 0, '2020-05-30 22:20:04'),
('3c30a6615819156d9b7dd3704fbc5160db39dd613a486bddd91692f86272e2b0a2bd6e357420a863', '110faef0b91fcddd2d53813610d9caf8280e6f7ea81a58cdd2264a4bc0aef16efef40d16b6e261a2', 0, '2020-05-31 01:06:07'),
('49a9d0e6a4e0cb6c2d4fa213511baec923aff806d032b9dea747aa8cdd10dece174f29e53b5d9f2d', 'fdb6f0fa1393416081acae32d4b729fc6e0c894d4932de2a97dba9e3f00bca69580528217da8bf0f', 0, '2020-05-31 01:07:39'),
('97b446c742ae897a2bd4b39c6b599cc997f490486c53d92d73e92c87215a187cfe7d68f838fb28ec', '0801030ecccbe3c7ce5e994913f1136250389b424151cdfa1b0ad8941352d2b146cfd32bd5f25352', 0, '2020-05-31 01:14:46'),
('21aee644a82512139ef5b83ac72c5197582d64e5cec1f71c90dab55e8de1c2f7699210370873c821', '4a88fb6df3feb9f027686ef0fd6566fa30398551fc86b7fd0ea918f8a695957bf1d44ba31b3052b9', 0, '2020-05-31 01:27:20'),
('3a6595b06ca9a2bdee00f40a94c9cf93561f88109a0f5c2b7321ead5350c9238ed7e30a49667dc1f', 'e8e485fa46d54d41395dfa7944d9e1ed7ff60be98a5e246ac174da441ee83dd23c98685d617a6f8b', 0, '2020-05-31 03:01:35'),
('93dd725c1749a69ed662c3be9583a7fb55f2f25dd9fbcefc012fd2a3335f01943bc119569c1a38e7', '7b9c42b19531912cc6dc661564f42be6b9f893d9c7fe97cc8f4edcb4303c0b68a2a82814f2975f11', 0, '2020-05-31 05:02:41'),
('64887a9b3a0880996ee79dd1acf06622ef466d046fb5d74fef347159fdc35457a74fdbc936cacb09', 'e989ebf2a5f8e809c061bda8fe789e068726b55df7bbfc677082161eef4ec54c887d111f8981fedb', 0, '2020-05-31 06:54:11'),
('f521223ed71830158ae03d6ce6c711a7742bee6050f332ff981159a5901252dd1226bde95c96b586', '4c288ba5161f53e446732c625b94e25ab219da4fe77e4f80ddc5da80696fad5c3dcfad33f0ed7419', 0, '2020-05-31 06:56:25'),
('c8e865a656d4fdfd3ab126bfaf561d3ebf096ef6018fcb77c4ae69f2dda43f4817ef00185eae042c', '90d4d91cfee8785b2910a71498605d1daaeea3776198eb00b91f726e11d640a4c634b1d9dfabc878', 0, '2020-05-31 10:00:08'),
('784b7b54c239621f2eaafc34c2c79e77f3ff5b3be5c6f8e0dd60a3e6a87c4b1aaf0101b8aaf9a251', 'da870db110d0b5058de29a0d284ae00980844bfa0f2c5dfb8d74f8b0e7785ba813eb16d506370ebd', 0, '2020-05-31 13:04:48'),
('4fb08aed21bbb04856ce41923e8dad09dc50b4e52bf9f0578c77e7b301d2c848706a32a1b85f300a', 'd97006eb7405a54a63f9b253231449071b820563de5a3a06a36b3a36428eb7233fe66bbcfa743021', 0, '2020-05-31 13:32:19'),
('534516c789cb14c9feeeb19e044a965a63545d264f17b2b12325eb2475a9eb7f37928295d90bf8ee', '5fe9b46dd6d4b4f0ffec185e57d3323b7405c9b3662db34d5ad5fea0989c8b22ab8b6347d8434938', 0, '2020-05-31 17:28:07'),
('374eb9e065571813920e2af5b1d8584024bc6205f19f255995ce5648fca0fb7feccaa3a513179d04', '50d6e1f9b2e086dd005719920ceedeac881f0421f4ab6b80a5db09d7d4b13a590bac1e61c2559ad5', 0, '2020-05-31 17:38:57'),
('d2d65a2f3d475998308af8bbd77ae848d642138c83b4f6b7cb6e5cc365657c30aef881c76b95ccf9', '7406b25068bfecbb61f824e12dcae6862cf4a30c35fd8190dba82c2daa01ad890ad5d93ab3c5ae9a', 0, '2020-05-31 22:29:32'),
('01e1594696fd92929273bf8ebd230420ad08538a2dba71e1f3eb95f392df4cc11ecba1078c24cd36', 'dfc4b3b4df89e414ae7951a19d0c7c35ae1908edb6e3c9159158af72a13f55c3fc28a8c4a39f84bc', 0, '2020-05-31 22:47:47'),
('efdae8df15a236ea5fc813928f18810e6ed49ef64de706d133861e34bd2a5c5cba379da0e757163b', '4a4164a0bd863bd69e1f0bd90d2050a423604af69fc2b0370a207b88e3fc06f713090cb293245704', 0, '2020-06-01 03:26:47'),
('c016c1fafce48ab4a2d820179d07c15fe0497e8678c0bba12c04c2fb895ae883e316583c95a9f7c7', 'ae10d869d9f18c3aa2a505a5a041f0504cd52ce08c2583ed7307bdaa62be95beac4bf4978102f75f', 0, '2020-06-01 08:44:05'),
('c6009ff713da1a9bd7d0cbd9884baac4b9dc2d6c48b613ae9b31406aa25e1a4b5a068a5b414415bb', 'e49a0d39acbb43c85927611966a748b8701f0b2d9e548037c1fbd1d7ca10bd87dabe877861131b37', 0, '2020-06-01 16:49:23'),
('b0dbf469596fda6f65a7bed0f90399c26dee1213a4e36f100b2f6c8db8a5a2d4e1c2279e92b61d3c', 'e33c79a8795d9c3c796defea16129ada17c53238da613250fe1e18df68bb516e8c4c0ca65c7040f2', 0, '2020-06-02 09:09:40'),
('0ba3f16abc3f9df3eee568bf746c2558ea7a56d3787a5760365123c465f14a034a6e38b6fd07dc14', '88e3ad9bb099eedeb1b9cdad7c895448fc339126b482392a56e9536d963d50799dcb3b8784c1ca0e', 0, '2020-06-02 16:58:57'),
('14c9adabbbc5bbd6dd02ac1230f69643ac45e3695446bccd67e1db28b911bba9a31acae0df1611e4', 'c4aac8eaf22e0154ecf0f717fde39036be7e569ec363d958bfd970346d421130784c05e3e1a9d6c0', 0, '2020-06-02 20:23:46'),
('83fe7260dfa485d279bb6e3f05361d5fa1c034856dcf5de6b500569af852d63022475d1f243b0565', '95c897636ffec421a529f8c634e2e37f2c828fe2b0ef972a8cab3a26aaeb44d1af70411eab566ddc', 0, '2020-06-03 16:43:34'),
('1ff19f37bdc8424523e82f3a69420b58983ba5b679a313e4eb6709a8168bc75907eaf2d795028b07', '5c8548c18560d113aa8e975735566848badacfe7649961dd2ee42b362e6cf5123314babdac8a2125', 0, '2020-06-03 22:19:06'),
('b82e35916201614d6d16f9e0894367ce8faa0f226eb06fffa14b0607b9f34225e54672ea3f1b531a', '4be8e09338cab9f22c18c26a806c25b1395a2528367774296dcce032e687cfc30a051172e14b98de', 0, '2020-06-04 01:47:02'),
('f54c866265ad6ca4b93a3dede11a0bbc46523ed42cb3a5f9676eabf744b9df2cedc84fb04bafb05d', '3dc33959fb26c5da1c0eccfdff84bd3827b4ed3a6b1ccdaff20d2bc68d4ae7d0dc77f3867f0985a2', 0, '2020-06-04 05:52:50'),
('eb903419f3c70073c655cc5320d6009197c64e886290b9b7d9275f2829666c676ad4b0f960646691', '1deb5770d448b51809e61f1774b123e1dc9d306e0d5f9b3a922dd810a74514194b04839373dee1c4', 0, '2020-06-04 13:57:42'),
('f3256b5d94874e9c341ee09f91d54daf9836fefd62ad95f06dbb5b9eeb8f76650642eb6350799c7b', '08fb314ff2ca18709526f54387508f1bd8cb45312abdccb0e268fa3a5ad8cfedf379a2541e33ff59', 0, '2020-06-04 15:20:11'),
('caa56ac8e0245110966eb803274817cfc1fa478a0790319b682e0d5e3128de763209911d97111805', 'dda995feb8baf9ca2eecf9db999ee05fb720d35aa4db219ac811a96e60bce7a447ffe4d4e55e05c6', 0, '2020-06-04 15:33:37'),
('5fcdb1cd9bed53917c1c529a35585103dc5a0e5af3f36231105fd4319af28b7a8ee7da058782cf22', '25b04e99244be69d5d487d180d1aacf084971e6a95c2aa12ee659a80a342536f104274af5d62c7af', 0, '2020-06-04 16:35:49'),
('133fee1aa6b09db24a85d8c88ea04461cdedaf95d59b257d64e941f73e6db96dec268fe4dc9c7a3c', '2366ee7ebcc7198d63668746b8f36b7f40b6114c0a400d64e991864ee41594a89b5d6f1035b0d037', 0, '2020-06-04 17:15:20'),
('01e8afb7bb29d7c3b5428690c2c8cd410c71386a7fee3b578d5d924ace3644da17603ff36d035490', 'a729bc6502e62fcb92776a6a6cfb0de3cf1c6974265db7b9afe6ccf1d9facbdba50d5b71151138e1', 0, '2020-06-04 17:31:00'),
('8a6e51cccea53ac9b3a4d23382d8532f0aa40f62066ab9aeac6339c0ad96ae3f27c6493f852bc08f', '79ddf8a85679a93d6d9dacf79ff598fd1a5cc49fda1139488c34badaf174e67095f65a68e1fff1bb', 0, '2020-06-04 17:32:49'),
('dd10a97efc2111688b6a53cc886aa9dbeef68d737c4dd5fb1e46e893553ecac8e0cf8a41a3fd4870', '3f1649b8fc4753ef305a51906057d2d501dbad8a78567c1f695875a17721f7020f2fb3d901523aa0', 0, '2020-06-04 18:36:43'),
('dc8a9c36ce950b23ca655e0a73d551774ba748b588f71cbaf6633ac53eb18f1dd2106fb404227783', '2798f4b3ed0883d84cc9aa26c03e365a04c4053eee4f6c848041f02aee61a0273998f64a537afa68', 0, '2020-06-04 18:40:15'),
('bcd0497774db71d96622722f36f2da82fb4d6aa38ea7b7d60414be9015301364de2bacc32de4805f', '6cd57d2a5f5a80df0913dba931e8e1018f5411f0f3da3681e661d5d644de690c047da7dd83edc61f', 0, '2020-06-04 19:19:56'),
('856d42edf999ac8f940341bace023b196fe30ab11dbbe553e0300bca83ce6a294683f3dcd889f0c6', 'dabe2df5dcc82217de8e628887ad08acd2b5014f283b98b3ab31d4f921e5ca6992e374c1ce7c45e8', 0, '2020-06-04 21:23:35'),
('4ca496aba43f5b722d8efbc76ae1fe07c65e69a49cfdb4d78113217c49751e5a7d1cfc4e36d1dcdf', '05fe95eff3ac04ae2de79f90a0aed5fd17c23d6f714983bf9139482bc215c6951c6f1e3f4d92fc41', 0, '2020-06-04 21:47:45'),
('d35d9ade0f5e0fe49193cd1f2262f127dc0d4d98aa18dc4d596c557df654dfe91ba9a8db1560fae3', '10a341b225b886679ef1e748baf77b3eb5ba3a14b540ab36577cb5ab4c6ff5427a90ead5e4c6298c', 0, '2020-06-05 00:28:54'),
('b62029b7775ac7182be1584eee3f9843d20e28ade1ca6c7b9dfb9af41d7f1e0cbfb8ffc4dd3ad701', 'aa0a407f26b6ea81c283d9a938deb729f6e06aac5da936a618302f01b54fb57db371552c61288fd6', 0, '2020-06-05 07:25:35'),
('4177945d54ffbd03f92e6cecff44478af1954fbe1d02bbbf8b47b7d18d1426412b00b49ef1e194fd', '20b47b7db83a3c5ae081e13ac7b7b407246af91f6f7d23e8f85fe9c46536139ae8e84f3be0902198', 0, '2020-06-05 10:02:05'),
('0a9840d82a7b660bb8f9c43310d15c4c0876f4386079e34521b819f05e121c0f8ae1817628faae1d', '4059ad5b6c610917edf4815a4efc7d2d4b8d8c1f1604f61888fa6ffa35f5115a3bf3241483c1d3c9', 0, '2020-06-05 14:10:05'),
('b79f4de05b8b2d8f54d1d0e7f4520f19c6ec461884f89b6c3c3b6a443b607f6325411d12d1ba41ff', 'e5a372c1696ea85b1e5eb6c09ee90f97c710a2a552d594a01dc5359b6d25cf4970200438c708fd28', 0, '2020-06-05 14:25:46'),
('57a79f948b4a2a0055c638ecb5134f9a56a93d284c257c4663c8f954682c26ca711f03da9597b7cd', 'ff242be136b35edff1a2d88843e987792b2d20a4202f082aa269ee653f6682648a47b5067c899c4f', 0, '2020-06-05 15:42:40'),
('b4beb899c38a4294a769570e74d48b2cc28f27ac5f88425d3dd4a8158d3783416f9d2f2a1ff502b3', 'ab96348d5842da7e8db90a79187a4e6473a99a7c3f925554945f7f5458f53fa33a21a46f9fc21641', 0, '2020-06-05 17:41:36'),
('065c7bb86bcff9be8be6c505eec0e4ab9a5fe45451cb8f693b74db1e48b6d82040620841221d0485', 'ea1965214775c5199b2f5dfa9cf1e1be21b5296aa556a4e2e5e49b8881032d589abcff94acd6a165', 0, '2020-06-05 17:44:52'),
('22777885646ae7c2c211953e0e2cfc66dc7c901cc4b21dd45600f9562889728ca4b4f7704cc9971b', 'e44037ea1c898135f57ce19f7ea3ec619c2bbb02e65f434aa097a9b2f4e4e1827817c01d9632a10c', 0, '2020-06-05 18:09:08'),
('80d13d02999549bd73a6839cc1f9a2ac77c9edf83615937d1fd644bc3c63a27b36cbb4335f03fb0c', 'e887d4ac00af7b35272811ffc71b417bcdd8180b4db677125eccaae8e21e6b39f4f3b8395967f2fd', 0, '2020-06-05 18:11:19'),
('630e9318c033d3ddef7935323188eb6ec12f476328e60471fc7d534d873cc925aa3defe7b62fb7cc', '323d6bfefc38b15958668275184a29f92b53618e975c4e46bab7149675a17f12c28fa87ba1a740de', 0, '2020-06-05 22:08:53'),
('eefd97c1caac342cdabdd5e535a35804b392b79941d198fd63000934038111e6e4d04b10efcd42bc', '037f1d09010706996b006d1573cd9b3d0cdc714cc96e0482416a56ecc299794e5645972121773b54', 0, '2020-06-05 22:40:06'),
('a5f4737bf2e56e3b9b705ea4d2bc23811c0f786723c3b87527dd038de0b74f1e5f6a09a59e4f1b88', '1a837c0a1037d2dce5ee8f10fa585e0b551b8da2a3b15c6ab11186043b81933e93932b021d1f7464', 1, '2020-06-07 02:24:09'),
('633ef0dc3a0bd6969f467891b95150554bbecefceb8964f13bd5d0a58da77461d84c738032e6cc2f', '62452b7753edda1bcbbb6c3f41a5ec131016b80a837d900a8d3be04765e4209a1db5ea4488c99bc3', 1, '2020-06-07 02:24:10'),
('3a5c31baeb56a65a14547a6e2bbf6b26c574a8228893ecfcc09e7c2609b4ca6c1fe507d0b67fb18d', 'e2432aa79427354e6e9d01920c34bd537bea2758390e7b7e3f1ce41b6019c3f79761397a1d661457', 1, '2020-06-07 02:24:11'),
('0b3bf2b00b5fb5806a8ec86ecc4abc88346f2cb4a86e48a0d91f5b2662836dfe364764f3198088b8', '33bd01a23367414eea196331a313177eafbad2c5afccf1d906db1ebe6dfca5f9066ea527c948584c', 1, '2020-06-07 02:24:12'),
('e943e9dd54d8aa7140612b3839bbbcbf2534e91992103639ba1b539b9a58bd8f15ddc84f0c48cc48', '39c563470f6165d00ab165eeb87d37c4a0786363bae50e56b675130882ca6ee7f3055c8151a61c9d', 1, '2020-06-07 02:24:14'),
('b7cef7e733cf0606db3fa8c39373b1fc775463657f7de949e2c71ef6d317187a1185cf208587d4f2', '4251100eecc12a082e207d8f5a7349fce211d2b6bff55bcad8dcf1d6980503148136034f9d2a6423', 1, '2020-06-07 02:24:16'),
('d97ecc2c4a2f76bab6f25b83a34df27aef83e6f69008f609b58c8046b2593f68b17abdb48b9421a2', 'd22bdc8aa7133dd49b820290862efb5577ffb2012cad4116d4b9effdcd57ddc7b5ea007127071800', 1, '2020-06-07 02:24:18'),
('a0600e7f2db4dbbda2327631fc65376bef017e1bf7e6f2ae9f0174acba903a5eed918999dc7d3105', '2b830925af25d9742f64abc0b080d5a3a26eda6270a54b99b7d565cf94528c6dc0af849fbeffd0cf', 1, '2020-06-07 02:24:20'),
('8d260375ae8e6748f3245da7118ae2b59fbe9c9962e6ab87d38e4fe2faa3391b6477224fb968f852', '459b5ae1c9b82922d2f6eb45a6a38c072d80e7269f54e1f7cf8f07cf79ea911e5b4031d0396dd994', 1, '2020-06-07 02:24:21'),
('430c2dd7a075033120955d81b854db15d82770185a9b479c9709d88d0c8e681a765c76ff4050fd10', '781f13595ab4ca427ecb1787b8b9b1f3b8f2aa8ed6f034f94e6e6a5c87397bd310cebc240cc21865', 1, '2020-06-07 02:24:24'),
('51ed0f2d689fd70c625bdfb1a214f747e68935041547c9f3542cdd3c2dcb5ba82553cba38449898e', 'c7ca60057ac7320211ff02b3f03e8a67cb91d6a57701254d27b020dc0fe61365e7d3d92ad5dd58b1', 0, '2020-06-07 02:24:26'),
('77acbeed3baecdee64db7548d0c0bfa581b4d4d546ef5f6076b8f25413f68854f14748b504e3fb15', '16863845bcd7e31a8374b2ff62166ebb3bfa7785372b23d537cffdea9f2cb46549950ad1a178d3f5', 0, '2020-06-07 02:25:21'),
('d06e08c344598c5ee92831dbad196dbf6f2eb581b5eaa56fa58da1b02aaa9bb6dd0692183ed16639', 'bd2141d635dcf0a332750ee5ae343771f18aed4658cc973577807370100e958b6cd0827efdc3ec7e', 0, '2020-06-07 03:02:44'),
('ff3a316e6a6a10ccf77d19584ba11fa06919feb977df1bcc61c635c779815c4d774d631eea944192', '57e94bd016b68b5cf766ad8882368b80a8e8580ec399064f3084f90cd6bab4af4a1d480a118bd935', 1, '2020-06-07 03:32:15'),
('9b768137c04cb38c5738210d8d3430647b3abc1bdea36a0ff611dc89d99082e3183dbaa154dd2804', 'fe5572d89e0633af2ab4dac91d40ccdb04404bc343327c0b56a3a315f76c50430a09bd4de2414ac9', 1, '2020-06-07 03:32:17'),
('364949938efe6c220dc283a2f7efb642643cef462dc6e8b5dbfc6515b395192b100cc497cceb7dd7', 'f959cda7942bc8455b922395037a35f2b0b0cc6d4a75e86dd09743a76e8781819e4a4e145bc469e6', 1, '2020-06-07 03:32:21'),
('06a1e91b3f47ea582c82df95dff25bbcfcbbfb0c924971c280633b5ad3d5d17dedbda09fd8d5c88c', '17d95eb07f41382448c18b6532f69fe0bf737a461b7d0e586c1e7a8123260b4857bd64b30a744b8a', 1, '2020-06-07 03:32:23'),
('fa8b6583e5a1b9a41eb5f02741c793f08b6e771830afa545116deb7ac455f7dc467ac22cec7e51a8', '449f194accf1faf0848867a8f6801438b459b7e8d2b6caed3dd2d417a388d8c819a9e8ecfd8a6bac', 1, '2020-06-07 03:32:25'),
('9f67f1e0a0352c62c058fd71e22e5e9cbc104cd8048807b2cb0ad1a85d563ad8e9c35f0e8ca25b3a', '5a5b0f8563bdfab1ebab25f6e6e1411a091c22ac44eca82ba161897c3be6913106ccaa31dd6da9a9', 1, '2020-06-07 03:32:27'),
('6616024385966978d751ac1c2f943e0702c8de58b7c317ac0f04e7e33cbd2661598c476a8c74d6cc', '27db3e1387bba2b62538c4ddf64c71312584247fa2e2c822722da865352619957907f25089e3bf6b', 1, '2020-06-07 03:32:28'),
('46c156d344dd159a7c1789e243003a3f0d582fcd935752fe3fca98eb663e80b780295af508deea72', '0f562a8c64b8fd3a9f7b0bf44e3c8c62a77a9ac29365545c39c84af3b94ff4b2ef387ec96a16e4b6', 1, '2020-06-07 03:32:29'),
('f306cfe8fd3272044afbc033e4133eeeaec8e1b84f8bf7ecf5303bd28665adee7450adccd63397d9', 'e212e65e8a0a8b3f1c2ccea8f2b4a090dc9c1e3855cc917b22dac2ba0b33775a85e0e9858d27c0d4', 1, '2020-06-07 03:32:31'),
('909e5f8963e35e5d7e278daa4390464d0fd79476c1849069e8a16809e037fe7f4cdaa710c9a2c359', '51f9cd4d3fcd4d2c18dda1ef018ed6ba54bff48266236f3325e22ab5f19089f14dda4e07cf3ad095', 0, '2020-06-07 03:32:32'),
('333dfb0ce882a4aec737f39ee9f950aeaea667df881eafdfb12f55528de99c67639657ffefd754e1', '41be45539eb1d9db09a125df087fd112f32fcdd54ee26f47c34e3d33e26c07d6e983f15edc5e0940', 0, '2020-06-07 12:00:26'),
('5fb3d1ec12a79897d4853aff26455ec457cf288f0330195d9a37da63bc1ad8e599f37abb411280d5', '3a9ce2137aa388d4c7bdc8dfe477d3e092675b8d13090bd9373557b1763e6f930b76150da40e686d', 0, '2020-06-07 12:20:44'),
('3442931b82eff2ecf861e7129fc7c04dd4612780ecdb71479dd0690542fdf57d85bd0ad1add1b959', '0689dc76d8fabb7386ead8d740aadefe8163427f7fe07d65d2ded5d1386041c6d8cdab9e67bec9f1', 0, '2020-06-07 12:49:57'),
('9dd31b20fbc6e1216658cf413c0a0c3c7ec45ef857c48e2bc1eea38dc026396d5c4ffe3d2d600d21', 'e5eaa19a4bcfe9302a723021fbb708b532437b0447b5825a613c63fbc4fd3114637fe98477c71499', 0, '2020-06-07 21:59:59'),
('8f42d6e9d5dbf43cf3368a42240ab4e73dcdf65ece4df0103644d9d3d866c595214582bf5e20be88', 'd83f172166999637b37df14787630e3e0c6c40179c0a5db882f0a343b8432536b4f30dadc0bfac05', 0, '2020-06-08 02:57:31'),
('2953a7bd8757d41516a11ddc2695614293adb336b41833c1b7cc482841a88404455d9ef508522846', 'debf8d595e074e2098f1656ff6aeb314d17b4fb54937d3ed2412b8ef08717de83574239510c694bf', 0, '2020-06-08 10:35:39'),
('fdb6d2eff399335f99358b084a5419283711e2acd8f77c8174127d0dc9cd0e6049cb6d9d6c94388b', '4d4a0c319dc8c31d91897d7534f12632fc0f3e37ff2758e927101adb6d4b0e6cf379b883fb255ccc', 0, '2020-06-08 11:00:36'),
('226142787b8d021a683006d83ed40635330b27c8504ea99f96b5e577e717720e2387b69c0699f275', 'bb2b2537e8170eb35b642b6fb56cd034ab1bf559b467203f7d07d10b1a8c73bd1ad6933f84b87490', 0, '2020-06-08 12:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('percent','amount') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_passbooks`
--

CREATE TABLE `promocode_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `status` enum('onboarding','approved','banned') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'onboarding',
  `fleet` int(11) NOT NULL DEFAULT '0',
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_devices`
--

CREATE TABLE `provider_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `udid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sns_arn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_documents`
--

CREATE TABLE `provider_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `document_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_profiles`
--

CREATE TABLE `provider_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_secondary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_services`
--

CREATE TABLE `provider_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `status` enum('active','offline','riding') COLLATE utf8_unicode_ci NOT NULL,
  `service_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_filters`
--

INSERT INTO `request_filters` (`id`, `request_id`, `provider_id`, `status`, `created_at`, `updated_at`) VALUES
(274, 35, 7, 0, '2020-02-29 09:45:15', '2020-02-29 09:45:15'),
(302, 59, 21, 0, '2020-03-02 15:45:22', '2020-03-02 15:45:22'),
(304, 61, 22, 0, '2020-03-03 07:18:50', '2020-03-03 07:18:50'),
(320, 72, 30, 0, '2020-03-06 13:21:09', '2020-03-06 13:21:09'),
(313, 66, 24, 0, '2020-03-04 20:10:48', '2020-03-04 20:10:48'),
(307, 63, 23, 0, '2020-03-04 15:08:24', '2020-03-04 15:08:24'),
(358, 21, 7, 0, '2020-03-07 21:20:13', '2020-03-07 21:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('daily','outstation') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'daily',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `fixed` int(11) NOT NULL,
  `price` float NOT NULL,
  `minute` float NOT NULL,
  `distance` float NOT NULL,
  `calculator` enum('MIN','HOUR','DISTANCE','DISTANCEMIN','DISTANCEHOUR') COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `type`, `name`, `provider_name`, `image`, `capacity`, `fixed`, `price`, `minute`, `distance`, `calculator`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'daily', 'Micro', 'TaxiTime', 'https://taxitime.co.in/public/uploads/4c9b1095817193f1ae08440a84a0b61b6baba202.png', '3', 45, 0.89, 0.55, 3.5, 'DISTANCE', 'Size(LxBxH): 7ftx4.5ftx5.5ft\n\n Capacity: 800kg', 1, '2017-12-08 20:12:27', '2020-03-09 13:04:48'),
(2, 'daily', 'Mini', 'TaxiTime', 'https://taxitime.co.in/public/uploads/d501e3d5b5741eecbd732f1b6843bd8480605aed.png', '4', 40, 3, 0.15, 3, 'DISTANCE', 'Size(LxBxH): 8ftx4.5ftx5.5ft\r\n\r\n Capacity: 1000kg', 1, '2017-12-08 20:12:27', '2020-03-09 13:05:31'),
(3, 'daily', 'Sedan', 'TaxiTime', 'https://taxitime.co.in/public/uploads/d9128d7d4edf4dbf8f81d05ff5384b54bc810af5.png', '2', 300, 15, 3, 4, 'DISTANCE', 'Size(LxBxH): 9ftx5.5ftx6.5ft\r\n\r\n Capacity: 2500kg', 1, '2017-12-08 20:12:27', '2020-03-09 13:06:00'),
(13, 'outstation', 'OutStation', 'TaxiTime', 'https://taxitime.co.in/public/uploads/0ac2ca7001f4bd515c01477d035cffa3b0ffdd0d.png', '5', 50, 0, 10, 50, 'DISTANCEHOUR', 'OutStation Taxi: Max Seat Capacity 5', 0, '2020-03-09 13:06:52', '2020-03-09 13:06:52');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_title', 'TaxiTime'),
(2, 'site_logo', 'https://taxitime.easycode.in/public/uploads/66f2e763864a829e5b3eeb111c98019fbad03aa5.png'),
(3, 'site_email_logo', ''),
(4, 'site_icon', 'https://taxitime.easycode.in/public/uploads/9d9c6ee71fa81cb28c6b31d881a6195afa3a4cc5.png'),
(5, 'site_copyright', 'Copyright 2019 TaxiTime'),
(92, 'sos_number', '911'),
(85, 'contact_number', '98989890'),
(8, 'base_price', '50'),
(9, 'price_per_minute', '50'),
(10, 'tax_percentage', '0'),
(11, 'stripe_secret_key', 'dsahjyrskdsid7uk'),
(12, 'stripe_publishable_key', 'rsykjutkjutkutkdu'),
(13, 'CASH', '1'),
(14, 'CARD', '1'),
(15, 'manual_request', '0'),
(16, 'default_lang', 'en'),
(17, 'currency', '$'),
(18, 'distance', 'Km'),
(19, 'scheduled_cancel_time_exceed', '10'),
(20, 'price_per_kilometer', '10'),
(21, 'commission_percentage', '20'),
(91, 'provider_search_radius', '50'),
(24, 'daily_target', '0'),
(25, 'surge_percentage', '0'),
(26, 'surge_trigger', '0'),
(27, 'demo_mode', '0'),
(28, 'booking_prefix', 'TTIME'),
(88, 'store_link_android', ''),
(89, 'store_link_ios', ''),
(90, 'provider_select_timeout', '60'),
(34, 'fb_app_version', ''),
(35, 'fb_app_id', ''),
(36, 'fb_app_secret', ''),
(37, 'f_email', 'admin@contact.com'),
(38, 'f_mobile', '+178945789'),
(39, 'f_mainBanner', 'https://images.unsplash.com/photo-1490650404312-a2175773bbf5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(40, 'f_text1', 'More recently with desktop publishing software ncluding versions'),
(41, 'f_text2', 'Upto 25% off on first booking through your app'),
(42, 'f_text3', ''),
(43, 'f_text4', ''),
(44, 'f_text5', ''),
(45, 'f_u_url', ''),
(46, 'f_p_url', ''),
(47, 'f_text6', 'Best Price Guaranteed'),
(48, 'f_text7', 'A more recently with desktop softy like aldus page maker.'),
(49, 'f_text8', '24/7 Customer Care'),
(50, 'f_text9', 'A more recently with desktop softy like aldus page maker.'),
(51, 'f_text10', 'Home Pickups'),
(52, 'f_text11', 'A more recently with desktop softy like aldus page maker.'),
(53, 'f_text12', 'Easy Bookings'),
(54, 'f_text13', 'A more recently with desktop softy like aldus page maker.'),
(55, 'f_text14', 'Who We Are'),
(56, 'f_text15', 'Lorem Ipsum passages, and more recently with desktop publishing software like aldus pageMaker including versions of all the Lorem Ipsum generators on thet Internet tends to repeat predefined chunks as necessary, making this an web evolved over the years, sometimes by accident.'),
(57, 'f_img2', 'https://taxitime.co.in/public/uploads/023561ae0c4fd6ca963192c765f8c082b6305c28.png'),
(58, 'f_text16', 'We have recently ventured into outstation services. We provide one way drop, round trip and multi city trip across India, over 1000 cities.'),
(59, 'f_text17', 'Price Transparency'),
(60, 'f_text18', 'We make all charges clear to you upfront. No extra charges or hidden fees'),
(61, 'f_text19', 'Zero Cancellation*'),
(62, 'f_text20', 'Enjoy zero cancellation benefit subject to Cab Bathinda terms;'),
(63, 'f_text21', 'Ease Of Access'),
(64, 'f_text22', 'On Double Cab models this ease of access is carried over to the rear of the vehicle.'),
(65, 'f_text23', 'One-way travel'),
(66, 'f_text24', 'Why pay for round-trip when all you want is a drop at your destination'),
(67, 'f_text25', 'Updates & Security'),
(68, 'f_text26', 'As Our Technology Enables Us To Focus On Both The Drivers and Riders.'),
(69, 'f_text27', 'Search for will uncover many web sites variables onto of passages of lorem ipsum available but the majority the words all predefined humour to met chunks recently with desktop.'),
(70, 'f_f_link', 'https://facebook.com'),
(96, 'f_t_link', '#'),
(72, 'f_l_link', '#'),
(73, 'f_i_link', '#'),
(75, 'contact_address', '10A, PrimeCab, San Andreno, United States.'),
(76, 'contact_message', 'Lorem Ipsum passages, and more recently with desktop publishing software like aldus pageMaker including versions of all the Lorem Ipsum generators'),
(77, 'contact_city', 'United States'),
(94, 'map_key', 'AIzaSyALblVQFpwxYcfUfNlmkjZ9Wx_ukblPAiU'),
(78, 'android_user_fcm_key', 'AIzaSyCzrv1cR01f4EdbfqAc8Iqqbwis90K5PKk'),
(79, 'android_user_driver_key', 'AIzaSyCzrv1cR01f4EdbfqAc8Iqqbwis90K5PKk'),
(86, 'contact_email', 'contact@taxitime.com'),
(93, 'social_login', '0'),
(95, 'site_link', 'https://taxitime.co.in'),
(97, 'verification', '1');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `current_provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `status` enum('SEARCHING','CANCELLED','ACCEPTED','STARTED','ARRIVED','PICKEDUP','DROPPED','COMPLETED','SCHEDULED') COLLATE utf8_unicode_ci NOT NULL,
  `cancelled_by` enum('NONE','USER','PROVIDER') COLLATE utf8_unicode_ci NOT NULL,
  `cancel_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL','WALLET') COLLATE utf8_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `distance` double(15,8) DEFAULT NULL,
  `s_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_latitude` double(15,8) NOT NULL,
  `s_longitude` double(15,8) NOT NULL,
  `d_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_latitude` double(15,8) NOT NULL,
  `d_longitude` double(15,8) NOT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `user_rated` tinyint(1) NOT NULL DEFAULT '0',
  `provider_rated` tinyint(1) NOT NULL DEFAULT '0',
  `use_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `surge` tinyint(1) NOT NULL DEFAULT '0',
  `route_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_track` enum('YES','NO') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NO',
  `travel_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `track_distance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_latitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_longitude` double(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_payments`
--

CREATE TABLE `user_request_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed` double(10,2) NOT NULL DEFAULT '0.00',
  `distance` double(10,2) NOT NULL DEFAULT '0.00',
  `commision` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet` double(10,2) NOT NULL DEFAULT '0.00',
  `surge` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payable` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_commission` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_pay` double(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_ratings`
--

CREATE TABLE `user_request_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL DEFAULT '0',
  `provider_rating` int(11) NOT NULL DEFAULT '0',
  `user_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_passbooks`
--

CREATE TABLE `wallet_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8_unicode_ci NOT NULL,
  `via` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_moneys`
--

CREATE TABLE `withdrawal_moneys` (
  `id` int(11) NOT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `status` enum('WAITING','APPROVED','DISAPPROVED') DEFAULT 'WAITING',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `coordinate` varchar(500) DEFAULT NULL,
  `background` varchar(500) DEFAULT NULL,
  `draw_lines` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Indexes for table `account_password_resets`
--
ALTER TABLE `account_password_resets`
  ADD KEY `account_password_resets_email_index` (`email`),
  ADD KEY `account_password_resets_token_index` (`token`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatchers`
--
ALTER TABLE `dispatchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispatchers_email_unique` (`email`);

--
-- Indexes for table `dispatcher_password_resets`
--
ALTER TABLE `dispatcher_password_resets`
  ADD KEY `dispatcher_password_resets_email_index` (`email`),
  ADD KEY `dispatcher_password_resets_token_index` (`token`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleets`
--
ALTER TABLE `fleets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fleets_email_unique` (`email`);

--
-- Indexes for table `fleet_password_resets`
--
ALTER TABLE `fleet_password_resets`
  ADD KEY `fleet_password_resets_email_index` (`email`),
  ADD KEY `fleet_password_resets_token_index` (`token`);

--
-- Indexes for table `frontend`
--
ALTER TABLE `frontend`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keycode` (`keycode`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`),
  ADD KEY `oauth_access_tokens_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`);

--
-- Indexes for table `provider_devices`
--
ALTER TABLE `provider_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_documents`
--
ALTER TABLE `provider_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_moneys`
--
ALTER TABLE `withdrawal_moneys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatchers`
--
ALTER TABLE `dispatchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `fleets`
--
ALTER TABLE `fleets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `frontend`
--
ALTER TABLE `frontend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=914;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `provider_devices`
--
ALTER TABLE `provider_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `provider_documents`
--
ALTER TABLE `provider_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `provider_services`
--
ALTER TABLE `provider_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_moneys`
--
ALTER TABLE `withdrawal_moneys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
