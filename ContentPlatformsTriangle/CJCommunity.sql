-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2014 at 04:16 AM
-- Server version: 5.5.37-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CJCommunity`
--

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_acl_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_acl_groups`
--

INSERT INTO `phpbb_acl_groups` (`group_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`) VALUES
(1, 0, 85, 0, 1),
(1, 0, 93, 0, 1),
(1, 0, 111, 0, 1),
(5, 0, 0, 5, 0),
(5, 0, 0, 1, 0),
(2, 0, 0, 6, 0),
(3, 0, 0, 6, 0),
(4, 0, 0, 5, 0),
(4, 0, 0, 10, 0),
(1, 1, 0, 17, 0),
(2, 1, 0, 17, 0),
(3, 1, 0, 17, 0),
(6, 1, 0, 17, 0),
(1, 2, 0, 17, 0),
(2, 2, 0, 15, 0),
(3, 2, 0, 15, 0),
(4, 2, 0, 21, 0),
(5, 2, 0, 14, 0),
(5, 2, 0, 10, 0),
(6, 2, 0, 19, 0),
(7, 0, 0, 23, 0),
(7, 2, 0, 24, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_acl_options`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auth_option` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_local` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `founder_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=118 ;

--
-- Dumping data for table `phpbb_acl_options`
--

INSERT INTO `phpbb_acl_options` (`auth_option_id`, `auth_option`, `is_global`, `is_local`, `founder_only`) VALUES
(1, 'f_', 0, 1, 0),
(2, 'f_announce', 0, 1, 0),
(3, 'f_attach', 0, 1, 0),
(4, 'f_bbcode', 0, 1, 0),
(5, 'f_bump', 0, 1, 0),
(6, 'f_delete', 0, 1, 0),
(7, 'f_download', 0, 1, 0),
(8, 'f_edit', 0, 1, 0),
(9, 'f_email', 0, 1, 0),
(10, 'f_flash', 0, 1, 0),
(11, 'f_icons', 0, 1, 0),
(12, 'f_ignoreflood', 0, 1, 0),
(13, 'f_img', 0, 1, 0),
(14, 'f_list', 0, 1, 0),
(15, 'f_noapprove', 0, 1, 0),
(16, 'f_poll', 0, 1, 0),
(17, 'f_post', 0, 1, 0),
(18, 'f_postcount', 0, 1, 0),
(19, 'f_print', 0, 1, 0),
(20, 'f_read', 0, 1, 0),
(21, 'f_reply', 0, 1, 0),
(22, 'f_report', 0, 1, 0),
(23, 'f_search', 0, 1, 0),
(24, 'f_sigs', 0, 1, 0),
(25, 'f_smilies', 0, 1, 0),
(26, 'f_sticky', 0, 1, 0),
(27, 'f_subscribe', 0, 1, 0),
(28, 'f_user_lock', 0, 1, 0),
(29, 'f_vote', 0, 1, 0),
(30, 'f_votechg', 0, 1, 0),
(31, 'm_', 1, 1, 0),
(32, 'm_approve', 1, 1, 0),
(33, 'm_chgposter', 1, 1, 0),
(34, 'm_delete', 1, 1, 0),
(35, 'm_edit', 1, 1, 0),
(36, 'm_info', 1, 1, 0),
(37, 'm_lock', 1, 1, 0),
(38, 'm_merge', 1, 1, 0),
(39, 'm_move', 1, 1, 0),
(40, 'm_report', 1, 1, 0),
(41, 'm_split', 1, 1, 0),
(42, 'm_ban', 1, 0, 0),
(43, 'm_warn', 1, 0, 0),
(44, 'a_', 1, 0, 0),
(45, 'a_aauth', 1, 0, 0),
(46, 'a_attach', 1, 0, 0),
(47, 'a_authgroups', 1, 0, 0),
(48, 'a_authusers', 1, 0, 0),
(49, 'a_backup', 1, 0, 0),
(50, 'a_ban', 1, 0, 0),
(51, 'a_bbcode', 1, 0, 0),
(52, 'a_board', 1, 0, 0),
(53, 'a_bots', 1, 0, 0),
(54, 'a_clearlogs', 1, 0, 0),
(55, 'a_email', 1, 0, 0),
(56, 'a_fauth', 1, 0, 0),
(57, 'a_forum', 1, 0, 0),
(58, 'a_forumadd', 1, 0, 0),
(59, 'a_forumdel', 1, 0, 0),
(60, 'a_group', 1, 0, 0),
(61, 'a_groupadd', 1, 0, 0),
(62, 'a_groupdel', 1, 0, 0),
(63, 'a_icons', 1, 0, 0),
(64, 'a_jabber', 1, 0, 0),
(65, 'a_language', 1, 0, 0),
(66, 'a_mauth', 1, 0, 0),
(67, 'a_modules', 1, 0, 0),
(68, 'a_names', 1, 0, 0),
(69, 'a_phpinfo', 1, 0, 0),
(70, 'a_profile', 1, 0, 0),
(71, 'a_prune', 1, 0, 0),
(72, 'a_ranks', 1, 0, 0),
(73, 'a_reasons', 1, 0, 0),
(74, 'a_roles', 1, 0, 0),
(75, 'a_search', 1, 0, 0),
(76, 'a_server', 1, 0, 0),
(77, 'a_styles', 1, 0, 0),
(78, 'a_switchperm', 1, 0, 0),
(79, 'a_uauth', 1, 0, 0),
(80, 'a_user', 1, 0, 0),
(81, 'a_userdel', 1, 0, 0),
(82, 'a_viewauth', 1, 0, 0),
(83, 'a_viewlogs', 1, 0, 0),
(84, 'a_words', 1, 0, 0),
(85, 'u_', 1, 0, 0),
(86, 'u_attach', 1, 0, 0),
(87, 'u_chgavatar', 1, 0, 0),
(88, 'u_chgcensors', 1, 0, 0),
(89, 'u_chgemail', 1, 0, 0),
(90, 'u_chggrp', 1, 0, 0),
(91, 'u_chgname', 1, 0, 0),
(92, 'u_chgpasswd', 1, 0, 0),
(93, 'u_download', 1, 0, 0),
(94, 'u_hideonline', 1, 0, 0),
(95, 'u_ignoreflood', 1, 0, 0),
(96, 'u_masspm', 1, 0, 0),
(97, 'u_masspm_group', 1, 0, 0),
(98, 'u_pm_attach', 1, 0, 0),
(99, 'u_pm_bbcode', 1, 0, 0),
(100, 'u_pm_delete', 1, 0, 0),
(101, 'u_pm_download', 1, 0, 0),
(102, 'u_pm_edit', 1, 0, 0),
(103, 'u_pm_emailpm', 1, 0, 0),
(104, 'u_pm_flash', 1, 0, 0),
(105, 'u_pm_forward', 1, 0, 0),
(106, 'u_pm_img', 1, 0, 0),
(107, 'u_pm_printpm', 1, 0, 0),
(108, 'u_pm_smilies', 1, 0, 0),
(109, 'u_readpm', 1, 0, 0),
(110, 'u_savedrafts', 1, 0, 0),
(111, 'u_search', 1, 0, 0),
(112, 'u_sendemail', 1, 0, 0),
(113, 'u_sendim', 1, 0, 0),
(114, 'u_sendpm', 1, 0, 0),
(115, 'u_sig', 1, 0, 0),
(116, 'u_viewonline', 1, 0, 0),
(117, 'u_viewprofile', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_acl_roles`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_bin NOT NULL,
  `role_type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Dumping data for table `phpbb_acl_roles`
--

INSERT INTO `phpbb_acl_roles` (`role_id`, `role_name`, `role_description`, `role_type`, `role_order`) VALUES
(1, 'ROLE_ADMIN_STANDARD', 'ROLE_DESCRIPTION_ADMIN_STANDARD', 'a_', 1),
(2, 'ROLE_ADMIN_FORUM', 'ROLE_DESCRIPTION_ADMIN_FORUM', 'a_', 3),
(3, 'ROLE_ADMIN_USERGROUP', 'ROLE_DESCRIPTION_ADMIN_USERGROUP', 'a_', 4),
(4, 'ROLE_ADMIN_FULL', 'ROLE_DESCRIPTION_ADMIN_FULL', 'a_', 2),
(5, 'ROLE_USER_FULL', 'ROLE_DESCRIPTION_USER_FULL', 'u_', 3),
(6, 'ROLE_USER_STANDARD', 'ROLE_DESCRIPTION_USER_STANDARD', 'u_', 1),
(7, 'ROLE_USER_LIMITED', 'ROLE_DESCRIPTION_USER_LIMITED', 'u_', 2),
(8, 'ROLE_USER_NOPM', 'ROLE_DESCRIPTION_USER_NOPM', 'u_', 4),
(9, 'ROLE_USER_NOAVATAR', 'ROLE_DESCRIPTION_USER_NOAVATAR', 'u_', 5),
(10, 'ROLE_MOD_FULL', 'ROLE_DESCRIPTION_MOD_FULL', 'm_', 3),
(11, 'ROLE_MOD_STANDARD', 'ROLE_DESCRIPTION_MOD_STANDARD', 'm_', 1),
(12, 'ROLE_MOD_SIMPLE', 'ROLE_DESCRIPTION_MOD_SIMPLE', 'm_', 2),
(13, 'ROLE_MOD_QUEUE', 'ROLE_DESCRIPTION_MOD_QUEUE', 'm_', 4),
(14, 'ROLE_FORUM_FULL', 'ROLE_DESCRIPTION_FORUM_FULL', 'f_', 7),
(15, 'ROLE_FORUM_STANDARD', 'ROLE_DESCRIPTION_FORUM_STANDARD', 'f_', 5),
(16, 'ROLE_FORUM_NOACCESS', 'ROLE_DESCRIPTION_FORUM_NOACCESS', 'f_', 1),
(17, 'ROLE_FORUM_READONLY', 'ROLE_DESCRIPTION_FORUM_READONLY', 'f_', 2),
(18, 'ROLE_FORUM_LIMITED', 'ROLE_DESCRIPTION_FORUM_LIMITED', 'f_', 3),
(19, 'ROLE_FORUM_BOT', 'ROLE_DESCRIPTION_FORUM_BOT', 'f_', 9),
(20, 'ROLE_FORUM_ONQUEUE', 'ROLE_DESCRIPTION_FORUM_ONQUEUE', 'f_', 8),
(21, 'ROLE_FORUM_POLLS', 'ROLE_DESCRIPTION_FORUM_POLLS', 'f_', 6),
(22, 'ROLE_FORUM_LIMITED_POLLS', 'ROLE_DESCRIPTION_FORUM_LIMITED_POLLS', 'f_', 4),
(23, 'ROLE_USER_NEW_MEMBER', 'ROLE_DESCRIPTION_USER_NEW_MEMBER', 'u_', 6),
(24, 'ROLE_FORUM_NEW_MEMBER', 'ROLE_DESCRIPTION_FORUM_NEW_MEMBER', 'f_', 10);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_acl_roles_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_acl_roles_data`
--

INSERT INTO `phpbb_acl_roles_data` (`role_id`, `auth_option_id`, `auth_setting`) VALUES
(1, 44, 1),
(1, 46, 1),
(1, 47, 1),
(1, 48, 1),
(1, 50, 1),
(1, 51, 1),
(1, 52, 1),
(1, 56, 1),
(1, 57, 1),
(1, 58, 1),
(1, 59, 1),
(1, 60, 1),
(1, 61, 1),
(1, 62, 1),
(1, 63, 1),
(1, 66, 1),
(1, 68, 1),
(1, 70, 1),
(1, 71, 1),
(1, 72, 1),
(1, 73, 1),
(1, 79, 1),
(1, 80, 1),
(1, 81, 1),
(1, 82, 1),
(1, 83, 1),
(1, 84, 1),
(2, 44, 1),
(2, 47, 1),
(2, 48, 1),
(2, 56, 1),
(2, 57, 1),
(2, 58, 1),
(2, 59, 1),
(2, 66, 1),
(2, 71, 1),
(2, 79, 1),
(2, 82, 1),
(2, 83, 1),
(3, 44, 1),
(3, 47, 1),
(3, 48, 1),
(3, 50, 1),
(3, 60, 1),
(3, 61, 1),
(3, 62, 1),
(3, 72, 1),
(3, 79, 1),
(3, 80, 1),
(3, 82, 1),
(3, 83, 1),
(4, 44, 1),
(4, 45, 1),
(4, 46, 1),
(4, 47, 1),
(4, 48, 1),
(4, 49, 1),
(4, 50, 1),
(4, 51, 1),
(4, 52, 1),
(4, 53, 1),
(4, 54, 1),
(4, 55, 1),
(4, 56, 1),
(4, 57, 1),
(4, 58, 1),
(4, 59, 1),
(4, 60, 1),
(4, 61, 1),
(4, 62, 1),
(4, 63, 1),
(4, 64, 1),
(4, 65, 1),
(4, 66, 1),
(4, 67, 1),
(4, 68, 1),
(4, 69, 1),
(4, 70, 1),
(4, 71, 1),
(4, 72, 1),
(4, 73, 1),
(4, 74, 1),
(4, 75, 1),
(4, 76, 1),
(4, 77, 1),
(4, 78, 1),
(4, 79, 1),
(4, 80, 1),
(4, 81, 1),
(4, 82, 1),
(4, 83, 1),
(4, 84, 1),
(5, 85, 1),
(5, 86, 1),
(5, 87, 1),
(5, 88, 1),
(5, 89, 1),
(5, 90, 1),
(5, 91, 1),
(5, 92, 1),
(5, 93, 1),
(5, 94, 1),
(5, 95, 1),
(5, 96, 1),
(5, 97, 1),
(5, 98, 1),
(5, 99, 1),
(5, 100, 1),
(5, 101, 1),
(5, 102, 1),
(5, 103, 1),
(5, 104, 1),
(5, 105, 1),
(5, 106, 1),
(5, 107, 1),
(5, 108, 1),
(5, 109, 1),
(5, 110, 1),
(5, 111, 1),
(5, 112, 1),
(5, 113, 1),
(5, 114, 1),
(5, 115, 1),
(5, 116, 1),
(5, 117, 1),
(6, 85, 1),
(6, 86, 1),
(6, 87, 1),
(6, 88, 1),
(6, 89, 1),
(6, 92, 1),
(6, 93, 1),
(6, 94, 1),
(6, 96, 1),
(6, 97, 1),
(6, 98, 1),
(6, 99, 1),
(6, 100, 1),
(6, 101, 1),
(6, 102, 1),
(6, 103, 1),
(6, 106, 1),
(6, 107, 1),
(6, 108, 1),
(6, 109, 1),
(6, 110, 1),
(6, 111, 1),
(6, 112, 1),
(6, 113, 1),
(6, 114, 1),
(6, 115, 1),
(6, 117, 1),
(7, 85, 1),
(7, 87, 1),
(7, 88, 1),
(7, 89, 1),
(7, 92, 1),
(7, 93, 1),
(7, 94, 1),
(7, 99, 1),
(7, 100, 1),
(7, 101, 1),
(7, 102, 1),
(7, 105, 1),
(7, 106, 1),
(7, 107, 1),
(7, 108, 1),
(7, 109, 1),
(7, 114, 1),
(7, 115, 1),
(7, 117, 1),
(8, 85, 1),
(8, 87, 1),
(8, 88, 1),
(8, 89, 1),
(8, 92, 1),
(8, 93, 1),
(8, 94, 1),
(8, 96, 0),
(8, 97, 0),
(8, 109, 0),
(8, 114, 0),
(8, 115, 1),
(8, 117, 1),
(9, 85, 1),
(9, 87, 0),
(9, 88, 1),
(9, 89, 1),
(9, 92, 1),
(9, 93, 1),
(9, 94, 1),
(9, 99, 1),
(9, 100, 1),
(9, 101, 1),
(9, 102, 1),
(9, 105, 1),
(9, 106, 1),
(9, 107, 1),
(9, 108, 1),
(9, 109, 1),
(9, 114, 1),
(9, 115, 1),
(9, 117, 1),
(10, 31, 1),
(10, 32, 1),
(10, 33, 1),
(10, 34, 1),
(10, 35, 1),
(10, 36, 1),
(10, 37, 1),
(10, 38, 1),
(10, 39, 1),
(10, 40, 1),
(10, 41, 1),
(10, 42, 1),
(10, 43, 1),
(11, 31, 1),
(11, 32, 1),
(11, 34, 1),
(11, 35, 1),
(11, 36, 1),
(11, 37, 1),
(11, 38, 1),
(11, 39, 1),
(11, 40, 1),
(11, 41, 1),
(11, 43, 1),
(12, 31, 1),
(12, 34, 1),
(12, 35, 1),
(12, 36, 1),
(12, 40, 1),
(13, 31, 1),
(13, 32, 1),
(13, 35, 1),
(14, 1, 1),
(14, 2, 1),
(14, 3, 1),
(14, 4, 1),
(14, 5, 1),
(14, 6, 1),
(14, 7, 1),
(14, 8, 1),
(14, 9, 1),
(14, 10, 1),
(14, 11, 1),
(14, 12, 1),
(14, 13, 1),
(14, 14, 1),
(14, 15, 1),
(14, 16, 1),
(14, 17, 1),
(14, 18, 1),
(14, 19, 1),
(14, 20, 1),
(14, 21, 1),
(14, 22, 1),
(14, 23, 1),
(14, 24, 1),
(14, 25, 1),
(14, 26, 1),
(14, 27, 1),
(14, 28, 1),
(14, 29, 1),
(14, 30, 1),
(15, 1, 1),
(15, 3, 1),
(15, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(15, 9, 1),
(15, 11, 1),
(15, 13, 1),
(15, 14, 1),
(15, 15, 1),
(15, 17, 1),
(15, 18, 1),
(15, 19, 1),
(15, 20, 1),
(15, 21, 1),
(15, 22, 1),
(15, 23, 1),
(15, 24, 1),
(15, 25, 1),
(15, 27, 1),
(15, 29, 1),
(15, 30, 1),
(16, 1, 0),
(17, 1, 1),
(17, 7, 1),
(17, 14, 1),
(17, 19, 1),
(17, 20, 1),
(17, 23, 1),
(17, 27, 1),
(18, 1, 1),
(18, 4, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(18, 13, 1),
(18, 14, 1),
(18, 15, 1),
(18, 17, 1),
(18, 18, 1),
(18, 19, 1),
(18, 20, 1),
(18, 21, 1),
(18, 22, 1),
(18, 23, 1),
(18, 24, 1),
(18, 25, 1),
(18, 27, 1),
(18, 29, 1),
(19, 1, 1),
(19, 7, 1),
(19, 14, 1),
(19, 19, 1),
(19, 20, 1),
(20, 1, 1),
(20, 3, 1),
(20, 4, 1),
(20, 7, 1),
(20, 8, 1),
(20, 9, 1),
(20, 13, 1),
(20, 14, 1),
(20, 15, 0),
(20, 17, 1),
(20, 18, 1),
(20, 19, 1),
(20, 20, 1),
(20, 21, 1),
(20, 22, 1),
(20, 23, 1),
(20, 24, 1),
(20, 25, 1),
(20, 27, 1),
(20, 29, 1),
(21, 1, 1),
(21, 3, 1),
(21, 4, 1),
(21, 5, 1),
(21, 6, 1),
(21, 7, 1),
(21, 8, 1),
(21, 9, 1),
(21, 11, 1),
(21, 13, 1),
(21, 14, 1),
(21, 15, 1),
(21, 16, 1),
(21, 17, 1),
(21, 18, 1),
(21, 19, 1),
(21, 20, 1),
(21, 21, 1),
(21, 22, 1),
(21, 23, 1),
(21, 24, 1),
(21, 25, 1),
(21, 27, 1),
(21, 29, 1),
(21, 30, 1),
(22, 1, 1),
(22, 4, 1),
(22, 7, 1),
(22, 8, 1),
(22, 9, 1),
(22, 13, 1),
(22, 14, 1),
(22, 15, 1),
(22, 16, 1),
(22, 17, 1),
(22, 18, 1),
(22, 19, 1),
(22, 20, 1),
(22, 21, 1),
(22, 22, 1),
(22, 23, 1),
(22, 24, 1),
(22, 25, 1),
(22, 27, 1),
(22, 29, 1),
(23, 96, 0),
(23, 97, 0),
(23, 114, 0),
(24, 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_acl_users`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_acl_users`
--

INSERT INTO `phpbb_acl_users` (`user_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`) VALUES
(2, 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_attachments`
--

CREATE TABLE IF NOT EXISTS `phpbb_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `in_message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_orphan` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `physical_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `real_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_comment` text COLLATE utf8_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mimetype` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `filetime` int(11) unsigned NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_banlist`
--

CREATE TABLE IF NOT EXISTS `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ban_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_end` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_give_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_bbcodes`
--

CREATE TABLE IF NOT EXISTS `phpbb_bbcodes` (
  `bbcode_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bbcode_tag` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_helpline` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_match` text COLLATE utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_bookmarks`
--

CREATE TABLE IF NOT EXISTS `phpbb_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_bots`
--

CREATE TABLE IF NOT EXISTS `phpbb_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bot_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `bot_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bot_agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bot_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46 ;

--
-- Dumping data for table `phpbb_bots`
--

INSERT INTO `phpbb_bots` (`bot_id`, `bot_active`, `bot_name`, `user_id`, `bot_agent`, `bot_ip`) VALUES
(1, 1, 'AdsBot [Google]', 3, 'AdsBot-Google', ''),
(2, 1, 'Alexa [Bot]', 4, 'ia_archiver', ''),
(3, 1, 'Alta Vista [Bot]', 5, 'Scooter/', ''),
(4, 1, 'Ask Jeeves [Bot]', 6, 'Ask Jeeves', ''),
(5, 1, 'Baidu [Spider]', 7, 'Baiduspider', ''),
(6, 1, 'Bing [Bot]', 8, 'bingbot/', ''),
(7, 1, 'Exabot [Bot]', 9, 'Exabot', ''),
(8, 1, 'FAST Enterprise [Crawler]', 10, 'FAST Enterprise Crawler', ''),
(9, 1, 'FAST WebCrawler [Crawler]', 11, 'FAST-WebCrawler/', ''),
(10, 1, 'Francis [Bot]', 12, 'http://www.neomo.de/', ''),
(11, 1, 'Gigabot [Bot]', 13, 'Gigabot/', ''),
(12, 1, 'Google Adsense [Bot]', 14, 'Mediapartners-Google', ''),
(13, 1, 'Google Desktop', 15, 'Google Desktop', ''),
(14, 1, 'Google Feedfetcher', 16, 'Feedfetcher-Google', ''),
(15, 1, 'Google [Bot]', 17, 'Googlebot', ''),
(16, 1, 'Heise IT-Markt [Crawler]', 18, 'heise-IT-Markt-Crawler', ''),
(17, 1, 'Heritrix [Crawler]', 19, 'heritrix/1.', ''),
(18, 1, 'IBM Research [Bot]', 20, 'ibm.com/cs/crawler', ''),
(19, 1, 'ICCrawler - ICjobs', 21, 'ICCrawler - ICjobs', ''),
(20, 1, 'ichiro [Crawler]', 22, 'ichiro/', ''),
(21, 1, 'Majestic-12 [Bot]', 23, 'MJ12bot/', ''),
(22, 1, 'Metager [Bot]', 24, 'MetagerBot/', ''),
(23, 1, 'MSN NewsBlogs', 25, 'msnbot-NewsBlogs/', ''),
(24, 1, 'MSN [Bot]', 26, 'msnbot/', ''),
(25, 1, 'MSNbot Media', 27, 'msnbot-media/', ''),
(26, 1, 'Nutch [Bot]', 28, 'http://lucene.apache.org/nutch/', ''),
(27, 1, 'Online link [Validator]', 29, 'online link validator', ''),
(28, 1, 'psbot [Picsearch]', 30, 'psbot/0', ''),
(29, 1, 'Sensis [Crawler]', 31, 'Sensis Web Crawler', ''),
(30, 1, 'SEO Crawler', 32, 'SEO search Crawler/', ''),
(31, 1, 'Seoma [Crawler]', 33, 'Seoma [SEO Crawler]', ''),
(32, 1, 'SEOSearch [Crawler]', 34, 'SEOsearch/', ''),
(33, 1, 'Snappy [Bot]', 35, 'Snappy/1.1 ( http://www.urltrends.com/ )', ''),
(34, 1, 'Steeler [Crawler]', 36, 'http://www.tkl.iis.u-tokyo.ac.jp/~crawler/', ''),
(35, 1, 'Telekom [Bot]', 37, 'crawleradmin.t-info@telekom.de', ''),
(36, 1, 'TurnitinBot [Bot]', 38, 'TurnitinBot/', ''),
(37, 1, 'Voyager [Bot]', 39, 'voyager/', ''),
(38, 1, 'W3 [Sitesearch]', 40, 'W3 SiteSearch Crawler', ''),
(39, 1, 'W3C [Linkcheck]', 41, 'W3C-checklink/', ''),
(40, 1, 'W3C [Validator]', 42, 'W3C_Validator', ''),
(41, 1, 'YaCy [Bot]', 43, 'yacybot', ''),
(42, 1, 'Yahoo MMCrawler [Bot]', 44, 'Yahoo-MMCrawler/', ''),
(43, 1, 'Yahoo Slurp [Bot]', 45, 'Yahoo! DE Slurp', ''),
(44, 1, 'Yahoo [Bot]', 46, 'Yahoo! Slurp', ''),
(45, 1, 'YahooSeeker [Bot]', 47, 'YahooSeeker/', '');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_config`
--

CREATE TABLE IF NOT EXISTS `phpbb_config` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_config`
--

INSERT INTO `phpbb_config` (`config_name`, `config_value`, `is_dynamic`) VALUES
('active_sessions', '0', 0),
('allow_attachments', '1', 0),
('allow_autologin', '1', 0),
('allow_avatar', '1', 0),
('allow_avatar_local', '0', 0),
('allow_avatar_remote', '0', 0),
('allow_avatar_remote_upload', '0', 0),
('allow_avatar_upload', '1', 0),
('allow_bbcode', '1', 0),
('allow_birthdays', '1', 0),
('allow_bookmarks', '1', 0),
('allow_emailreuse', '0', 0),
('allow_forum_notify', '1', 0),
('allow_mass_pm', '1', 0),
('allow_name_chars', 'USERNAME_CHARS_ANY', 0),
('allow_namechange', '0', 0),
('allow_nocensors', '0', 0),
('allow_pm_attach', '0', 0),
('allow_pm_report', '1', 0),
('allow_post_flash', '1', 0),
('allow_post_links', '1', 0),
('allow_privmsg', '1', 0),
('allow_quick_reply', '1', 0),
('allow_sig', '1', 0),
('allow_sig_bbcode', '1', 0),
('allow_sig_flash', '0', 0),
('allow_sig_img', '1', 0),
('allow_sig_links', '1', 0),
('allow_sig_pm', '1', 0),
('allow_sig_smilies', '1', 0),
('allow_smilies', '1', 0),
('allow_topic_notify', '1', 0),
('attachment_quota', '52428800', 0),
('auth_bbcode_pm', '1', 0),
('auth_flash_pm', '0', 0),
('auth_img_pm', '1', 0),
('auth_method', 'db', 0),
('auth_smilies_pm', '1', 0),
('avatar_filesize', '6144', 0),
('avatar_gallery_path', 'images/avatars/gallery', 0),
('avatar_max_height', '90', 0),
('avatar_max_width', '90', 0),
('avatar_min_height', '20', 0),
('avatar_min_width', '20', 0),
('avatar_path', 'images/avatars/upload', 0),
('avatar_salt', 'b7c704461c79e58508dc628c5fbf43a9', 0),
('board_contact', 'nav@unlicrea.com', 0),
('board_disable', '0', 0),
('board_disable_msg', '', 0),
('board_dst', '0', 0),
('board_email', 'nav@unlicrea.com', 0),
('board_email_form', '0', 0),
('board_email_sig', 'Thanks, The Management', 0),
('board_hide_emails', '1', 0),
('board_startdate', '1387582309', 0),
('board_timezone', '0', 0),
('browser_check', '1', 0),
('bump_interval', '10', 0),
('bump_type', 'd', 0),
('cache_gc', '7200', 0),
('cache_last_gc', '1405033720', 1),
('captcha_gd', '1', 0),
('captcha_gd_3d_noise', '1', 0),
('captcha_gd_fonts', '1', 0),
('captcha_gd_foreground_noise', '0', 0),
('captcha_gd_wave', '0', 0),
('captcha_gd_x_grid', '25', 0),
('captcha_gd_y_grid', '25', 0),
('captcha_plugin', 'phpbb_captcha_gd', 0),
('check_attachment_content', '1', 0),
('check_dnsbl', '0', 0),
('chg_passforce', '0', 0),
('confirm_refresh', '1', 0),
('cookie_domain', 'localhost', 0),
('cookie_name', 'phpbb3_3p8om', 0),
('cookie_path', '/', 0),
('cookie_secure', '0', 0),
('coppa_enable', '0', 0),
('coppa_fax', '', 0),
('coppa_mail', '', 0),
('cron_lock', '0', 1),
('database_gc', '604800', 0),
('database_last_gc', '1405033735', 1),
('dbms_version', '5.5.34-0ubuntu0.13.10.1', 0),
('default_dateformat', 'D M d, Y g:i a', 0),
('default_lang', 'en', 0),
('default_style', '6', 0),
('delete_time', '0', 0),
('display_last_edited', '1', 0),
('display_order', '0', 0),
('edit_time', '0', 0),
('email_check_mx', '1', 0),
('email_enable', '1', 0),
('email_function_name', 'mail', 0),
('email_max_chunk_size', '50', 0),
('email_package_size', '20', 0),
('enable_confirm', '1', 0),
('enable_pm_icons', '1', 0),
('enable_post_confirm', '1', 0),
('feed_enable', '1', 0),
('feed_forum', '1', 0),
('feed_http_auth', '0', 0),
('feed_item_statistics', '1', 0),
('feed_limit_post', '15', 0),
('feed_limit_topic', '10', 0),
('feed_overall', '1', 0),
('feed_overall_forums', '0', 0),
('feed_topic', '1', 0),
('feed_topics_active', '0', 0),
('feed_topics_new', '1', 0),
('flood_interval', '15', 0),
('force_server_vars', '0', 0),
('form_token_lifetime', '7200', 0),
('form_token_mintime', '0', 0),
('form_token_sid_guests', '1', 0),
('forward_pm', '1', 0),
('forwarded_for_check', '0', 0),
('full_folder_action', '2', 0),
('fulltext_mysql_max_word_len', '254', 0),
('fulltext_mysql_min_word_len', '4', 0),
('fulltext_native_common_thres', '5', 0),
('fulltext_native_load_upd', '1', 0),
('fulltext_native_max_chars', '14', 0),
('fulltext_native_min_chars', '3', 0),
('gzip_compress', '0', 0),
('hot_threshold', '25', 0),
('icons_path', 'images/icons', 0),
('img_create_thumbnail', '0', 0),
('img_display_inlined', '1', 0),
('img_imagick', '/usr/bin/', 0),
('img_link_height', '0', 0),
('img_link_width', '0', 0),
('img_max_height', '0', 0),
('img_max_thumb_width', '400', 0),
('img_max_width', '0', 0),
('img_min_thumb_filesize', '12000', 0),
('ip_check', '3', 0),
('ip_login_limit_max', '50', 0),
('ip_login_limit_time', '21600', 0),
('ip_login_limit_use_forwarded', '0', 0),
('jab_enable', '0', 0),
('jab_host', '', 0),
('jab_package_size', '20', 0),
('jab_password', '', 0),
('jab_port', '5222', 0),
('jab_use_ssl', '0', 0),
('jab_username', '', 0),
('last_queue_run', '1388113334', 1),
('ldap_base_dn', '', 0),
('ldap_email', '', 0),
('ldap_password', '', 0),
('ldap_port', '', 0),
('ldap_server', '', 0),
('ldap_uid', '', 0),
('ldap_user', '', 0),
('ldap_user_filter', '', 0),
('limit_load', '0', 0),
('limit_search_load', '0', 0),
('load_anon_lastread', '0', 0),
('load_birthdays', '1', 0),
('load_cpf_memberlist', '0', 0),
('load_cpf_viewprofile', '1', 0),
('load_cpf_viewtopic', '0', 0),
('load_db_lastread', '1', 0),
('load_db_track', '1', 0),
('load_jumpbox', '1', 0),
('load_moderators', '1', 0),
('load_online', '1', 0),
('load_online_guests', '1', 0),
('load_online_time', '5', 0),
('load_onlinetrack', '1', 0),
('load_search', '1', 0),
('load_tplcompile', '0', 0),
('load_unreads_search', '1', 0),
('load_user_activity', '1', 0),
('max_attachments', '3', 0),
('max_attachments_pm', '1', 0),
('max_autologin_time', '0', 0),
('max_filesize', '262144', 0),
('max_filesize_pm', '262144', 0),
('max_login_attempts', '3', 0),
('max_name_chars', '20', 0),
('max_num_search_keywords', '10', 0),
('max_pass_chars', '100', 0),
('max_poll_options', '10', 0),
('max_post_chars', '60000', 0),
('max_post_font_size', '200', 0),
('max_post_img_height', '0', 0),
('max_post_img_width', '0', 0),
('max_post_smilies', '0', 0),
('max_post_urls', '0', 0),
('max_quote_depth', '3', 0),
('max_reg_attempts', '5', 0),
('max_sig_chars', '255', 0),
('max_sig_font_size', '200', 0),
('max_sig_img_height', '0', 0),
('max_sig_img_width', '0', 0),
('max_sig_smilies', '0', 0),
('max_sig_urls', '5', 0),
('mime_triggers', 'body|head|html|img|plaintext|a href|pre|script|table|title', 0),
('min_name_chars', '3', 0),
('min_pass_chars', '6', 0),
('min_post_chars', '1', 0),
('min_search_author_chars', '3', 0),
('new_member_group_default', '0', 0),
('new_member_post_limit', '3', 0),
('newest_user_colour', '', 1),
('newest_user_id', '66', 1),
('newest_username', 'testuser', 1),
('num_files', '0', 1),
('num_posts', '6', 1),
('num_topics', '2', 1),
('num_users', '20', 1),
('override_user_style', '0', 0),
('pass_complex', 'PASS_TYPE_ANY', 0),
('pm_edit_time', '0', 0),
('pm_max_boxes', '4', 0),
('pm_max_msgs', '50', 0),
('pm_max_recipients', '0', 0),
('posts_per_page', '10', 0),
('print_pm', '1', 0),
('questionnaire_unique_id', '09fab614a8919cd6', 0),
('queue_interval', '60', 0),
('rand_seed', 'ed1113c0ed3bc2ea5557fec9ff07e0c4', 1),
('rand_seed_last_update', '1405037352', 1),
('ranks_path', 'images/ranks', 0),
('record_online_date', '1387896604', 1),
('record_online_users', '3', 1),
('referer_validation', '1', 0),
('require_activation', '0', 0),
('script_path', '/~nav/cj/community', 0),
('search_anonymous_interval', '0', 0),
('search_block_size', '250', 0),
('search_gc', '7200', 0),
('search_indexing_state', '', 1),
('search_interval', '0', 0),
('search_last_gc', '1405034626', 1),
('search_store_results', '1800', 0),
('search_type', 'fulltext_native', 0),
('secure_allow_deny', '1', 0),
('secure_allow_empty_referer', '1', 0),
('secure_downloads', '0', 0),
('server_name', 'localhost', 0),
('server_port', '80', 0),
('server_protocol', 'http://', 0),
('session_gc', '3600', 0),
('session_last_gc', '1405034633', 1),
('session_length', '3600', 0),
('site_desc', 'A short text to describe your forum', 0),
('sitename', 'yourdomain.com', 0),
('smilies_path', 'images/smilies', 0),
('smilies_per_page', '50', 0),
('smtp_auth_method', 'PLAIN', 0),
('smtp_delivery', '0', 0),
('smtp_host', '', 0),
('smtp_password', '', 0),
('smtp_port', '25', 0),
('smtp_username', '', 0),
('topics_per_page', '25', 0),
('tpl_allow_php', '1', 0),
('upload_dir_size', '0', 1),
('upload_icons_path', 'images/upload_icons', 0),
('upload_path', 'files', 0),
('version', '3.0.12', 0),
('warnings_expire_days', '90', 0),
('warnings_gc', '14400', 0),
('warnings_last_gc', '1405033723', 1);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_confirm`
--

CREATE TABLE IF NOT EXISTS `phpbb_confirm` (
  `confirm_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `confirm_type` tinyint(3) NOT NULL DEFAULT '0',
  `code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seed` int(10) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_disallow`
--

CREATE TABLE IF NOT EXISTS `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_drafts`
--

CREATE TABLE IF NOT EXISTS `phpbb_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `save_time` int(11) unsigned NOT NULL DEFAULT '0',
  `draft_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `draft_message` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_extensions`
--

CREATE TABLE IF NOT EXISTS `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

--
-- Dumping data for table `phpbb_extensions`
--

INSERT INTO `phpbb_extensions` (`extension_id`, `group_id`, `extension`) VALUES
(1, 1, 'gif'),
(2, 1, 'png'),
(3, 1, 'jpeg'),
(4, 1, 'jpg'),
(5, 1, 'tif'),
(6, 1, 'tiff'),
(7, 1, 'tga'),
(8, 2, 'gtar'),
(9, 2, 'gz'),
(10, 2, 'tar'),
(11, 2, 'zip'),
(12, 2, 'rar'),
(13, 2, 'ace'),
(14, 2, 'torrent'),
(15, 2, 'tgz'),
(16, 2, 'bz2'),
(17, 2, '7z'),
(18, 3, 'txt'),
(19, 3, 'c'),
(20, 3, 'h'),
(21, 3, 'cpp'),
(22, 3, 'hpp'),
(23, 3, 'diz'),
(24, 3, 'csv'),
(25, 3, 'ini'),
(26, 3, 'log'),
(27, 3, 'js'),
(28, 3, 'xml'),
(29, 4, 'xls'),
(30, 4, 'xlsx'),
(31, 4, 'xlsm'),
(32, 4, 'xlsb'),
(33, 4, 'doc'),
(34, 4, 'docx'),
(35, 4, 'docm'),
(36, 4, 'dot'),
(37, 4, 'dotx'),
(38, 4, 'dotm'),
(39, 4, 'pdf'),
(40, 4, 'ai'),
(41, 4, 'ps'),
(42, 4, 'ppt'),
(43, 4, 'pptx'),
(44, 4, 'pptm'),
(45, 4, 'odg'),
(46, 4, 'odp'),
(47, 4, 'ods'),
(48, 4, 'odt'),
(49, 4, 'rtf'),
(50, 5, 'rm'),
(51, 5, 'ram'),
(52, 6, 'wma'),
(53, 6, 'wmv'),
(54, 7, 'swf'),
(55, 8, 'mov'),
(56, 8, 'm4v'),
(57, 8, 'm4a'),
(58, 8, 'mp4'),
(59, 8, '3gp'),
(60, 8, '3g2'),
(61, 8, 'qt'),
(62, 9, 'mpeg'),
(63, 9, 'mpg'),
(64, 9, 'mp3'),
(65, 9, 'ogg'),
(66, 9, 'ogm');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_extension_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `allowed_forums` text COLLATE utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data for table `phpbb_extension_groups`
--

INSERT INTO `phpbb_extension_groups` (`group_id`, `group_name`, `cat_id`, `allow_group`, `download_mode`, `upload_icon`, `max_filesize`, `allowed_forums`, `allow_in_pm`) VALUES
(1, 'IMAGES', 1, 1, 1, '', 0, '', 0),
(2, 'ARCHIVES', 0, 1, 1, '', 0, '', 0),
(3, 'PLAIN_TEXT', 0, 0, 1, '', 0, '', 0),
(4, 'DOCUMENTS', 0, 0, 1, '', 0, '', 0),
(5, 'REAL_MEDIA', 3, 0, 1, '', 0, '', 0),
(6, 'WINDOWS_MEDIA', 2, 0, 1, '', 0, '', 0),
(7, 'FLASH_FILES', 5, 0, 1, '', 0, '', 0),
(8, 'QUICKTIME_MEDIA', 6, 0, 1, '', 0, '', 0),
(9, 'DOWNLOADABLE_FILES', 0, 0, 1, '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_forums`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_parents` mediumtext COLLATE utf8_bin NOT NULL,
  `forum_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc` text COLLATE utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules` text COLLATE utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_rules_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_topics_per_page` tinyint(4) NOT NULL DEFAULT '0',
  `forum_type` tinyint(4) NOT NULL DEFAULT '0',
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_flags` tinyint(4) NOT NULL DEFAULT '32',
  `forum_options` int(20) unsigned NOT NULL DEFAULT '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_icons` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) unsigned NOT NULL DEFAULT '0',
  `prune_days` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_freq` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `phpbb_forums`
--

INSERT INTO `phpbb_forums` (`forum_id`, `parent_id`, `left_id`, `right_id`, `forum_parents`, `forum_name`, `forum_desc`, `forum_desc_bitfield`, `forum_desc_options`, `forum_desc_uid`, `forum_link`, `forum_password`, `forum_style`, `forum_image`, `forum_rules`, `forum_rules_link`, `forum_rules_bitfield`, `forum_rules_options`, `forum_rules_uid`, `forum_topics_per_page`, `forum_type`, `forum_status`, `forum_posts`, `forum_topics`, `forum_topics_real`, `forum_last_post_id`, `forum_last_poster_id`, `forum_last_post_subject`, `forum_last_post_time`, `forum_last_poster_name`, `forum_last_poster_colour`, `forum_flags`, `forum_options`, `display_subforum_list`, `display_on_index`, `enable_indexing`, `enable_icons`, `enable_prune`, `prune_next`, `prune_days`, `prune_viewed`, `prune_freq`) VALUES
(1, 0, 1, 4, '', 'Your first category', '', '', 7, '', '', '', 0, '', '', '', '', 7, '', 0, 0, 0, 1, 1, 1, 1, 2, '', 1387582309, 'TheNavigator', 'AA0000', 32, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(2, 1, 2, 3, 'a:1:{i:1;a:2:{i:0;s:19:"Your first category";i:1;i:0;}}', 'Your first forum', 'Description of your first forum.', '', 7, '', '', '', 0, '', '', '', '', 7, '', 0, 1, 0, 6, 2, 2, 6, 2, 'Re: test', 1389069769, 'TheNavigator', 'AA0000', 112, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_forums_access`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`forum_id`,`user_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_forums_track`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_forums_track`
--

INSERT INTO `phpbb_forums_track` (`user_id`, `forum_id`, `mark_time`) VALUES
(2, 2, 1389069769),
(61, 2, 1388096914);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_forums_watch`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `group_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_legend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Dumping data for table `phpbb_groups`
--

INSERT INTO `phpbb_groups` (`group_id`, `group_type`, `group_founder_manage`, `group_skip_auth`, `group_name`, `group_desc`, `group_desc_bitfield`, `group_desc_options`, `group_desc_uid`, `group_display`, `group_avatar`, `group_avatar_type`, `group_avatar_width`, `group_avatar_height`, `group_rank`, `group_colour`, `group_sig_chars`, `group_receive_pm`, `group_message_limit`, `group_max_recipients`, `group_legend`) VALUES
(1, 3, 0, 0, 'GUESTS', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(2, 3, 0, 0, 'REGISTERED', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(3, 3, 0, 0, 'REGISTERED_COPPA', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(6, 3, 0, 0, 'BOTS', '', '', 7, '', 0, '', 0, 0, 0, 0, '9E8DA7', 0, 0, 0, 5, 0),
(8, 1, 1, 0, 'Admin', '', '', 7, '', 0, '', 0, 0, 0, 1, '0033CC', 0, 0, 0, 0, 0),
(10, 1, 0, 0, 'Early Access', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_icons`
--

CREATE TABLE IF NOT EXISTS `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icons_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_width` tinyint(4) NOT NULL DEFAULT '0',
  `icons_height` tinyint(4) NOT NULL DEFAULT '0',
  `icons_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Dumping data for table `phpbb_icons`
--

INSERT INTO `phpbb_icons` (`icons_id`, `icons_url`, `icons_width`, `icons_height`, `icons_order`, `display_on_posting`) VALUES
(1, 'misc/fire.gif', 16, 16, 1, 1),
(2, 'smile/redface.gif', 16, 16, 9, 1),
(3, 'smile/mrgreen.gif', 16, 16, 10, 1),
(4, 'misc/heart.gif', 16, 16, 4, 1),
(5, 'misc/star.gif', 16, 16, 2, 1),
(6, 'misc/radioactive.gif', 16, 16, 3, 1),
(7, 'misc/thinking.gif', 16, 16, 5, 1),
(8, 'smile/info.gif', 16, 16, 8, 1),
(9, 'smile/question.gif', 16, 16, 6, 1),
(10, 'smile/alert.gif', 16, 16, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_dir` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_english_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_local_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_author` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phpbb_lang`
--

INSERT INTO `phpbb_lang` (`lang_id`, `lang_iso`, `lang_dir`, `lang_english_name`, `lang_local_name`, `lang_author`) VALUES
(1, 'en', 'en', 'British English', 'British English', 'phpBB Group');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_log`
--

CREATE TABLE IF NOT EXISTS `phpbb_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reportee_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_operation` text COLLATE utf8_bin NOT NULL,
  `log_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=219 ;

--
-- Dumping data for table `phpbb_log`
--

INSERT INTO `phpbb_log` (`log_id`, `log_type`, `user_id`, `forum_id`, `topic_id`, `reportee_id`, `log_ip`, `log_time`, `log_operation`, `log_data`) VALUES
(1, 2, 2, 0, 0, 0, '127.0.0.1', 1387582313, 'LOG_ERROR_EMAIL', 'a:1:{i:0;s:102:"<strong>EMAIL/PHP/mail()</strong><br /><em>/~nav/cj/community/install/index.php</em><br /><br /><br />";}'),
(2, 0, 2, 0, 0, 0, '127.0.0.1', 1387582313, 'LOG_INSTALL_INSTALLED', 'a:1:{i:0;s:6:"3.0.12";}'),
(3, 0, 2, 0, 0, 0, '127.0.0.1', 1387582499, 'LOG_STYLE_ADD', 'a:1:{i:0;s:12:"concernedjoe";}'),
(4, 0, 2, 0, 0, 0, '127.0.0.1', 1387582711, 'LOG_STYLE_DELETE', 'a:1:{i:0;s:12:"concernedjoe";}'),
(5, 0, 2, 0, 0, 0, '127.0.0.1', 1387582721, 'LOG_TEMPLATE_ADD_FS', 'a:1:{i:0;s:12:"concernedjoe";}'),
(6, 0, 2, 0, 0, 0, '127.0.0.1', 1387582721, 'LOG_THEME_ADD_DB', 'a:1:{i:0;s:12:"concernedjoe";}'),
(7, 0, 2, 0, 0, 0, '127.0.0.1', 1387582721, 'LOG_IMAGESET_ADD_FS', 'a:1:{i:0;s:12:"concernedjoe";}'),
(8, 0, 2, 0, 0, 0, '127.0.0.1', 1387582721, 'LOG_STYLE_ADD', 'a:1:{i:0;s:12:"concernedjoe";}'),
(9, 0, 2, 0, 0, 0, '127.0.0.1', 1387582726, 'LOG_STYLE_DELETE', 'a:1:{i:0;s:12:"concernedjoe";}'),
(10, 0, 2, 0, 0, 0, '127.0.0.1', 1387582958, 'LOG_TEMPLATE_ADD_FS', 'a:1:{i:0;s:12:"concernedjoe";}'),
(11, 0, 2, 0, 0, 0, '127.0.0.1', 1387582958, 'LOG_THEME_ADD_DB', 'a:1:{i:0;s:12:"concernedjoe";}'),
(12, 0, 2, 0, 0, 0, '127.0.0.1', 1387582958, 'LOG_IMAGESET_ADD_FS', 'a:1:{i:0;s:12:"concernedjoe";}'),
(13, 0, 2, 0, 0, 0, '127.0.0.1', 1387582958, 'LOG_STYLE_ADD', 'a:1:{i:0;s:12:"concernedjoe";}'),
(14, 0, 2, 0, 0, 0, '127.0.0.1', 1387680950, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(15, 0, 2, 0, 0, 0, '127.0.0.1', 1387681591, 'LOG_TEMPLATE_ADD_FS', 'a:1:{i:0;s:5:"Alpha";}'),
(16, 0, 2, 0, 0, 0, '127.0.0.1', 1387681591, 'LOG_THEME_ADD_DB', 'a:1:{i:0;s:5:"Alpha";}'),
(17, 0, 2, 0, 0, 0, '127.0.0.1', 1387681591, 'LOG_IMAGESET_ADD_FS', 'a:1:{i:0;s:5:"Alpha";}'),
(18, 0, 2, 0, 0, 0, '127.0.0.1', 1387681591, 'LOG_STYLE_ADD', 'a:1:{i:0;s:5:"Alpha";}'),
(19, 0, 2, 0, 0, 0, '127.0.0.1', 1387746352, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(20, 2, 1, 0, 0, 0, '127.0.0.1', 1387759970, 'LOG_ERROR_EMAIL', 'a:1:{i:0;s:92:"<strong>EMAIL/PHP/mail()</strong><br /><em>/~nav/cj/community/ucp.php</em><br /><br /><br />";}'),
(21, 0, 2, 0, 0, 0, '127.0.0.1', 1387985574, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(22, 0, 2, 0, 0, 0, '127.0.0.1', 1387985649, 'LOG_STYLE_DELETE', 'a:1:{i:0;s:5:"Alpha";}'),
(23, 0, 2, 0, 0, 0, '127.0.0.1', 1387985708, 'LOG_TEMPLATE_ADD_FS', 'a:1:{i:0;s:5:"Alpha";}'),
(24, 0, 2, 0, 0, 0, '127.0.0.1', 1387985708, 'LOG_THEME_ADD_DB', 'a:1:{i:0;s:5:"Alpha";}'),
(25, 0, 2, 0, 0, 0, '127.0.0.1', 1387985708, 'LOG_IMAGESET_ADD_FS', 'a:1:{i:0;s:5:"Alpha";}'),
(26, 0, 2, 0, 0, 0, '127.0.0.1', 1387985708, 'LOG_STYLE_ADD', 'a:1:{i:0;s:5:"Alpha";}'),
(27, 0, 2, 0, 0, 0, '127.0.0.1', 1387986504, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(28, 0, 2, 0, 0, 0, '127.0.0.1', 1387986556, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(29, 0, 2, 0, 0, 0, '127.0.0.1', 1387990080, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(30, 0, 2, 0, 0, 0, '127.0.0.1', 1387990710, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(31, 0, 2, 0, 0, 0, '127.0.0.1', 1387990717, 'LOG_STYLE_DELETE', 'a:1:{i:0;s:12:"concernedjoe";}'),
(32, 0, 2, 0, 0, 0, '127.0.0.1', 1387990762, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(33, 0, 2, 0, 0, 0, '127.0.0.1', 1387990767, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(34, 0, 2, 0, 0, 0, '127.0.0.1', 1387990963, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(35, 0, 2, 0, 0, 0, '127.0.0.1', 1387990966, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(36, 0, 2, 0, 0, 0, '127.0.0.1', 1387991188, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(37, 0, 2, 0, 0, 0, '127.0.0.1', 1387991191, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(38, 0, 2, 0, 0, 0, '127.0.0.1', 1387991194, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(39, 0, 2, 0, 0, 0, '127.0.0.1', 1387991197, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(40, 0, 2, 0, 0, 0, '127.0.0.1', 1387991234, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(41, 0, 2, 0, 0, 0, '127.0.0.1', 1387991237, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(42, 0, 2, 0, 0, 0, '127.0.0.1', 1387991240, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(43, 0, 2, 0, 0, 0, '127.0.0.1', 1387991244, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(44, 0, 2, 0, 0, 0, '127.0.0.1', 1387991246, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(45, 0, 2, 0, 0, 0, '127.0.0.1', 1387991301, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(46, 0, 2, 0, 0, 0, '127.0.0.1', 1387991320, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(47, 0, 2, 0, 0, 0, '127.0.0.1', 1387991323, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(48, 0, 2, 0, 0, 0, '127.0.0.1', 1387991362, 'LOG_STYLE_EDIT_DETAILS', 'a:1:{i:0;s:9:"prosilver";}'),
(49, 0, 2, 0, 0, 0, '127.0.0.1', 1387991389, 'LOG_STYLE_EDIT_DETAILS', 'a:1:{i:0;s:5:"Alpha";}'),
(50, 0, 2, 0, 0, 0, '127.0.0.1', 1387991403, 'LOG_STYLE_EDIT_DETAILS', 'a:1:{i:0;s:9:"prosilver";}'),
(51, 0, 2, 0, 0, 0, '127.0.0.1', 1387991414, 'LOG_STYLE_EDIT_DETAILS', 'a:1:{i:0;s:5:"Alpha";}'),
(52, 0, 2, 0, 0, 0, '127.0.0.1', 1387991574, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(53, 0, 2, 0, 0, 0, '127.0.0.1', 1387991638, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(54, 0, 2, 0, 0, 0, '127.0.0.1', 1387991854, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(55, 0, 2, 0, 0, 0, '127.0.0.1', 1387991864, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(56, 0, 2, 0, 0, 0, '127.0.0.1', 1387992222, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(57, 0, 2, 0, 0, 0, '127.0.0.1', 1387992229, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(58, 0, 2, 0, 0, 0, '127.0.0.1', 1387992277, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(59, 0, 2, 0, 0, 0, '127.0.0.1', 1387992292, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(60, 0, 2, 0, 0, 0, '127.0.0.1', 1387993288, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(61, 0, 2, 0, 0, 0, '127.0.0.1', 1387993307, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(62, 0, 2, 0, 0, 0, '127.0.0.1', 1388011507, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(63, 0, 2, 0, 0, 0, '127.0.0.1', 1388011515, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(64, 0, 2, 0, 0, 0, '127.0.0.1', 1388011784, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(65, 0, 2, 0, 0, 0, '127.0.0.1', 1388011791, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(66, 0, 2, 0, 0, 0, '127.0.0.1', 1388011841, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(67, 0, 2, 0, 0, 0, '127.0.0.1', 1388011844, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(68, 0, 2, 0, 0, 0, '127.0.0.1', 1388011944, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(69, 0, 2, 0, 0, 0, '127.0.0.1', 1388012584, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(70, 0, 2, 0, 0, 0, '127.0.0.1', 1388012677, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(71, 0, 2, 0, 0, 0, '127.0.0.1', 1388012708, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(72, 0, 2, 0, 0, 0, '127.0.0.1', 1388012924, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(73, 0, 2, 0, 0, 0, '127.0.0.1', 1388013038, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(74, 0, 2, 0, 0, 0, '127.0.0.1', 1388013151, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(75, 0, 2, 0, 0, 0, '127.0.0.1', 1388013159, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(76, 0, 2, 0, 0, 0, '127.0.0.1', 1388013181, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(77, 0, 2, 0, 0, 0, '127.0.0.1', 1388013506, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(78, 0, 2, 0, 0, 0, '127.0.0.1', 1388098907, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(79, 0, 2, 0, 0, 0, '127.0.0.1', 1388098927, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(80, 0, 2, 0, 0, 0, '127.0.0.1', 1388099488, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(81, 2, 61, 0, 0, 0, '127.0.0.1', 1388104167, 'LOG_ERROR_EMAIL', 'a:1:{i:0;s:93:"<strong>EMAIL/PHP/mail()</strong><br /><em>/~nav/cj/community/cron.php</em><br /><br /><br />";}'),
(82, 2, 2, 0, 0, 0, '127.0.0.1', 1388104588, 'LOG_ERROR_EMAIL', 'a:1:{i:0;s:93:"<strong>EMAIL/PHP/mail()</strong><br /><em>/~nav/cj/community/cron.php</em><br /><br /><br />";}'),
(83, 2, 61, 0, 0, 0, '127.0.0.1', 1388113334, 'LOG_ERROR_EMAIL', 'a:1:{i:0;s:93:"<strong>EMAIL/PHP/mail()</strong><br /><em>/~nav/cj/community/cron.php</em><br /><br /><br />";}'),
(84, 0, 2, 0, 0, 0, '127.0.0.1', 1388113829, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(85, 0, 2, 0, 0, 0, '127.0.0.1', 1388113837, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(86, 0, 2, 0, 0, 0, '127.0.0.1', 1388113840, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(87, 0, 2, 0, 0, 0, '127.0.0.1', 1388113904, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(88, 0, 2, 0, 0, 0, '127.0.0.1', 1388119641, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(89, 0, 2, 0, 0, 0, '127.0.0.1', 1388119674, 'LOG_CONFIG_SECURITY', ''),
(90, 0, 2, 0, 0, 0, '127.0.0.1', 1388119682, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(91, 0, 2, 0, 0, 0, '127.0.0.1', 1388119786, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(92, 0, 2, 0, 0, 0, '127.0.0.1', 1388119816, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(93, 0, 2, 0, 0, 0, '127.0.0.1', 1388119855, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(94, 0, 2, 0, 0, 0, '127.0.0.1', 1388120230, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(95, 0, 2, 0, 0, 0, '127.0.0.1', 1388120248, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(96, 0, 2, 0, 0, 0, '127.0.0.1', 1388120384, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(97, 0, 2, 0, 0, 0, '127.0.0.1', 1388120556, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(98, 0, 2, 0, 0, 0, '127.0.0.1', 1388120711, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(99, 0, 2, 0, 0, 0, '127.0.0.1', 1388120764, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(100, 0, 2, 0, 0, 0, '127.0.0.1', 1388120792, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(101, 0, 2, 0, 0, 0, '127.0.0.1', 1388120807, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(102, 0, 2, 0, 0, 0, '127.0.0.1', 1388146945, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(103, 0, 2, 0, 0, 0, '127.0.0.1', 1388147057, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(104, 0, 2, 0, 0, 0, '127.0.0.1', 1388147086, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(105, 0, 2, 0, 0, 0, '127.0.0.1', 1388147109, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(106, 0, 2, 0, 0, 0, '127.0.0.1', 1388147134, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(107, 0, 2, 0, 0, 0, '127.0.0.1', 1388147527, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(108, 0, 2, 0, 0, 0, '127.0.0.1', 1388147554, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(109, 0, 2, 0, 0, 0, '127.0.0.1', 1388147576, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(110, 0, 2, 0, 0, 0, '127.0.0.1', 1388147646, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(111, 0, 2, 0, 0, 0, '127.0.0.1', 1388148360, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(112, 0, 2, 0, 0, 0, '127.0.0.1', 1388148400, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(113, 0, 2, 0, 0, 0, '127.0.0.1', 1388148438, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(114, 0, 2, 0, 0, 0, '127.0.0.1', 1388150983, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(115, 0, 2, 0, 0, 0, '127.0.0.1', 1388152737, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(116, 0, 2, 0, 0, 0, '127.0.0.1', 1388152749, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(117, 0, 2, 0, 0, 0, '127.0.0.1', 1389055442, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(118, 0, 2, 0, 0, 0, '127.0.0.1', 1389055452, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(119, 0, 2, 0, 0, 0, '127.0.0.1', 1389055484, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(120, 0, 2, 0, 0, 0, '127.0.0.1', 1389055505, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(121, 0, 2, 0, 0, 0, '127.0.0.1', 1389055638, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(122, 0, 2, 0, 0, 0, '127.0.0.1', 1389063302, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(123, 0, 2, 0, 0, 0, '127.0.0.1', 1389063466, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(124, 0, 2, 0, 0, 0, '127.0.0.1', 1389063482, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(125, 0, 2, 0, 0, 0, '127.0.0.1', 1389063899, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(126, 0, 2, 0, 0, 0, '127.0.0.1', 1389064297, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(127, 0, 2, 0, 0, 0, '127.0.0.1', 1389064300, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(128, 0, 2, 0, 0, 0, '127.0.0.1', 1389064484, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(129, 0, 2, 0, 0, 0, '127.0.0.1', 1389064552, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(130, 0, 2, 0, 0, 0, '127.0.0.1', 1389064619, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(131, 0, 2, 0, 0, 0, '127.0.0.1', 1389064702, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(132, 0, 2, 0, 0, 0, '127.0.0.1', 1389064742, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(133, 0, 2, 0, 0, 0, '127.0.0.1', 1389064751, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(134, 0, 2, 0, 0, 0, '127.0.0.1', 1389064798, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(135, 0, 2, 0, 0, 0, '127.0.0.1', 1389064816, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(136, 0, 2, 0, 0, 0, '127.0.0.1', 1389064879, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(137, 0, 2, 0, 0, 0, '127.0.0.1', 1389064976, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(138, 0, 2, 0, 0, 0, '127.0.0.1', 1389064982, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(139, 0, 2, 0, 0, 0, '127.0.0.1', 1389065005, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(140, 0, 2, 0, 0, 0, '127.0.0.1', 1389065424, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(141, 0, 2, 0, 0, 0, '127.0.0.1', 1389065490, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(142, 0, 2, 0, 0, 0, '127.0.0.1', 1389065506, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(143, 0, 2, 0, 0, 0, '127.0.0.1', 1389065522, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(144, 0, 2, 0, 0, 0, '127.0.0.1', 1389065575, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(145, 0, 2, 0, 0, 0, '127.0.0.1', 1389065618, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(146, 0, 2, 0, 0, 0, '127.0.0.1', 1389065664, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(147, 0, 2, 0, 0, 0, '127.0.0.1', 1389065736, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(148, 0, 2, 0, 0, 0, '127.0.0.1', 1389065772, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(149, 0, 2, 0, 0, 0, '127.0.0.1', 1389065792, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(150, 0, 2, 0, 0, 0, '127.0.0.1', 1389065816, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(151, 0, 2, 0, 0, 0, '127.0.0.1', 1389066274, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(152, 0, 2, 0, 0, 0, '127.0.0.1', 1389066317, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(153, 0, 2, 0, 0, 0, '127.0.0.1', 1389066330, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(154, 0, 2, 0, 0, 0, '127.0.0.1', 1389066403, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(155, 0, 2, 0, 0, 0, '127.0.0.1', 1389066411, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(156, 0, 2, 0, 0, 0, '127.0.0.1', 1389066427, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(157, 0, 2, 0, 0, 0, '127.0.0.1', 1389066430, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(158, 0, 2, 0, 0, 0, '127.0.0.1', 1389066535, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(159, 0, 2, 0, 0, 0, '127.0.0.1', 1389067347, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(160, 0, 2, 0, 0, 0, '127.0.0.1', 1389067664, 'LOG_MODULE_DISABLE', 'a:1:{i:0;s:18:"Friends &amp; Foes";}'),
(161, 0, 2, 0, 0, 0, '127.0.0.1', 1389067673, 'LOG_MODULE_ENABLE', 'a:1:{i:0;s:18:"Friends &amp; Foes";}'),
(162, 0, 2, 0, 0, 0, '127.0.0.1', 1389067677, 'LOG_MODULE_DISABLE', 'a:1:{i:0;s:29:"Rules, folders &amp; settings";}'),
(163, 0, 2, 0, 0, 0, '127.0.0.1', 1389067696, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(164, 0, 2, 0, 0, 0, '127.0.0.1', 1389067867, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(165, 0, 2, 0, 0, 0, '127.0.0.1', 1389067873, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(166, 0, 2, 0, 0, 0, '127.0.0.1', 1389067911, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(167, 0, 2, 0, 0, 0, '127.0.0.1', 1389068177, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(168, 0, 2, 0, 0, 0, '127.0.0.1', 1389068205, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(169, 0, 2, 0, 0, 0, '127.0.0.1', 1389068751, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(170, 0, 2, 0, 0, 0, '127.0.0.1', 1389068758, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(171, 0, 2, 0, 0, 0, '127.0.0.1', 1389068770, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(172, 0, 2, 0, 0, 0, '127.0.0.1', 1389068772, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(173, 0, 2, 0, 0, 0, '127.0.0.1', 1389068829, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(174, 0, 2, 0, 0, 0, '127.0.0.1', 1389068831, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:9:"prosilver";}'),
(175, 0, 2, 0, 0, 0, '127.0.0.1', 1389068850, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(176, 0, 2, 0, 0, 0, '127.0.0.1', 1389068990, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(177, 0, 2, 0, 0, 0, '127.0.0.1', 1389069177, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(178, 0, 2, 0, 0, 0, '127.0.0.1', 1389069275, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(179, 0, 2, 0, 0, 0, '127.0.0.1', 1389069419, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(180, 0, 2, 0, 0, 0, '127.0.0.1', 1389069487, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(181, 0, 2, 0, 0, 0, '127.0.0.1', 1389069744, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(182, 0, 2, 0, 0, 0, '127.0.0.1', 1389069977, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(183, 0, 2, 0, 0, 0, '127.0.0.1', 1389069990, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(184, 0, 2, 0, 0, 0, '127.0.0.1', 1389070027, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(185, 0, 2, 0, 0, 0, '127.0.0.1', 1389070066, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(186, 0, 2, 0, 0, 0, '127.0.0.1', 1389070084, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(187, 0, 2, 0, 0, 0, '127.0.0.1', 1389070118, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(188, 0, 2, 0, 0, 0, '127.0.0.1', 1389070143, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(189, 0, 2, 0, 0, 0, '127.0.0.1', 1389070223, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(190, 0, 2, 0, 0, 0, '127.0.0.1', 1389070226, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(191, 0, 2, 0, 0, 0, '127.0.0.1', 1389070255, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(192, 0, 2, 0, 0, 0, '127.0.0.1', 1389070302, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(193, 0, 2, 0, 0, 0, '127.0.0.1', 1389070616, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(194, 0, 2, 0, 0, 0, '127.0.0.1', 1389070628, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(195, 0, 2, 0, 0, 0, '127.0.0.1', 1389070661, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(196, 0, 2, 0, 0, 0, '127.0.0.1', 1389070672, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(197, 0, 2, 0, 0, 0, '127.0.0.1', 1389070727, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(198, 0, 2, 0, 0, 0, '127.0.0.1', 1389070733, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(199, 0, 2, 0, 0, 0, '127.0.0.1', 1389070782, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(200, 0, 2, 0, 0, 0, '127.0.0.1', 1389070789, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(201, 0, 2, 0, 0, 0, '127.0.0.1', 1389070864, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(202, 0, 2, 0, 0, 0, '127.0.0.1', 1389071149, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(203, 0, 2, 0, 0, 0, '127.0.0.1', 1389071168, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(204, 0, 2, 0, 0, 0, '127.0.0.1', 1389071182, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(205, 0, 2, 0, 0, 0, '127.0.0.1', 1389071373, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(206, 0, 2, 0, 0, 0, '127.0.0.1', 1389071376, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(207, 0, 2, 0, 0, 0, '127.0.0.1', 1389071408, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:9:"prosilver";i:1;s:9:"All files";}'),
(208, 0, 2, 0, 0, 0, '127.0.0.1', 1389071410, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:5:"Alpha";i:1;s:9:"All files";}'),
(209, 0, 2, 0, 0, 0, '127.0.0.1', 1389071540, 'LOG_FORUM_EDIT', 'a:1:{i:0;s:16:"Your first forum";}'),
(210, 0, 2, 0, 0, 0, '127.0.0.1', 1389074723, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(211, 0, 2, 0, 0, 0, '127.0.0.1', 1389075281, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(212, 0, 2, 0, 0, 0, '127.0.0.1', 1389075316, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(213, 0, 2, 0, 0, 0, '127.0.0.1', 1389075549, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:5:"Alpha";}'),
(214, 0, 2, 0, 0, 0, '127.0.0.1', 1389149364, 'LOG_USERS_ADDED', 'a:2:{i:0;s:12:"Early Access";i:1;s:4:"qqqq";}'),
(215, 0, 2, 0, 0, 0, '127.0.0.1', 1389150042, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(216, 0, 2, 0, 0, 0, '127.0.0.1', 1389240729, 'LOG_USERS_ADDED', 'a:2:{i:0;s:12:"Early Access";i:1;s:12:"TheNavigator";}'),
(217, 0, 2, 0, 0, 0, '127.0.0.1', 1389588726, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(218, 0, 2, 0, 0, 0, '120.144.35.47', 1405037277, 'LOG_ADMIN_AUTH_FAIL', '');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_login_attempts`
--

CREATE TABLE IF NOT EXISTS `phpbb_login_attempts` (
  `attempt_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  KEY `att_ip` (`attempt_ip`,`attempt_time`),
  KEY `att_for` (`attempt_forwarded_for`,`attempt_time`),
  KEY `att_time` (`attempt_time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_login_attempts`
--

INSERT INTO `phpbb_login_attempts` (`attempt_ip`, `attempt_browser`, `attempt_forwarded_for`, `attempt_time`, `user_id`, `username`, `username_clean`) VALUES
('120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', 1405037277, 2, 'TheNavigator', 'thenavigator');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_moderator_cache`
--

CREATE TABLE IF NOT EXISTS `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_modules`
--

CREATE TABLE IF NOT EXISTS `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_basename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_class` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_langname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_mode` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_auth` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=199 ;

--
-- Dumping data for table `phpbb_modules`
--

INSERT INTO `phpbb_modules` (`module_id`, `module_enabled`, `module_display`, `module_basename`, `module_class`, `parent_id`, `left_id`, `right_id`, `module_langname`, `module_mode`, `module_auth`) VALUES
(1, 1, 1, '', 'acp', 0, 1, 64, 'ACP_CAT_GENERAL', '', ''),
(2, 1, 1, '', 'acp', 1, 4, 17, 'ACP_QUICK_ACCESS', '', ''),
(3, 1, 1, '', 'acp', 1, 18, 41, 'ACP_BOARD_CONFIGURATION', '', ''),
(4, 1, 1, '', 'acp', 1, 42, 49, 'ACP_CLIENT_COMMUNICATION', '', ''),
(5, 1, 1, '', 'acp', 1, 50, 63, 'ACP_SERVER_CONFIGURATION', '', ''),
(6, 1, 1, '', 'acp', 0, 65, 84, 'ACP_CAT_FORUMS', '', ''),
(7, 1, 1, '', 'acp', 6, 66, 71, 'ACP_MANAGE_FORUMS', '', ''),
(8, 1, 1, '', 'acp', 6, 72, 83, 'ACP_FORUM_BASED_PERMISSIONS', '', ''),
(9, 1, 1, '', 'acp', 0, 85, 110, 'ACP_CAT_POSTING', '', ''),
(10, 1, 1, '', 'acp', 9, 86, 99, 'ACP_MESSAGES', '', ''),
(11, 1, 1, '', 'acp', 9, 100, 109, 'ACP_ATTACHMENTS', '', ''),
(12, 1, 1, '', 'acp', 0, 111, 166, 'ACP_CAT_USERGROUP', '', ''),
(13, 1, 1, '', 'acp', 12, 112, 145, 'ACP_CAT_USERS', '', ''),
(14, 1, 1, '', 'acp', 12, 146, 153, 'ACP_GROUPS', '', ''),
(15, 1, 1, '', 'acp', 12, 154, 165, 'ACP_USER_SECURITY', '', ''),
(16, 1, 1, '', 'acp', 0, 167, 216, 'ACP_CAT_PERMISSIONS', '', ''),
(17, 1, 1, '', 'acp', 16, 170, 179, 'ACP_GLOBAL_PERMISSIONS', '', ''),
(18, 1, 1, '', 'acp', 16, 180, 191, 'ACP_FORUM_BASED_PERMISSIONS', '', ''),
(19, 1, 1, '', 'acp', 16, 192, 201, 'ACP_PERMISSION_ROLES', '', ''),
(20, 1, 1, '', 'acp', 16, 202, 215, 'ACP_PERMISSION_MASKS', '', ''),
(21, 1, 1, '', 'acp', 0, 217, 230, 'ACP_CAT_STYLES', '', ''),
(22, 1, 1, '', 'acp', 21, 218, 221, 'ACP_STYLE_MANAGEMENT', '', ''),
(23, 1, 1, '', 'acp', 21, 222, 229, 'ACP_STYLE_COMPONENTS', '', ''),
(24, 1, 1, '', 'acp', 0, 231, 250, 'ACP_CAT_MAINTENANCE', '', ''),
(25, 1, 1, '', 'acp', 24, 232, 241, 'ACP_FORUM_LOGS', '', ''),
(26, 1, 1, '', 'acp', 24, 242, 249, 'ACP_CAT_DATABASE', '', ''),
(27, 1, 1, '', 'acp', 0, 251, 276, 'ACP_CAT_SYSTEM', '', ''),
(28, 1, 1, '', 'acp', 27, 252, 255, 'ACP_AUTOMATION', '', ''),
(29, 1, 1, '', 'acp', 27, 256, 267, 'ACP_GENERAL_TASKS', '', ''),
(30, 1, 1, '', 'acp', 27, 268, 275, 'ACP_MODULE_MANAGEMENT', '', ''),
(31, 1, 1, '', 'acp', 0, 277, 278, 'ACP_CAT_DOT_MODS', '', ''),
(32, 1, 1, 'attachments', 'acp', 3, 19, 20, 'ACP_ATTACHMENT_SETTINGS', 'attach', 'acl_a_attach'),
(33, 1, 1, 'attachments', 'acp', 11, 101, 102, 'ACP_ATTACHMENT_SETTINGS', 'attach', 'acl_a_attach'),
(34, 1, 1, 'attachments', 'acp', 11, 103, 104, 'ACP_MANAGE_EXTENSIONS', 'extensions', 'acl_a_attach'),
(35, 1, 1, 'attachments', 'acp', 11, 105, 106, 'ACP_EXTENSION_GROUPS', 'ext_groups', 'acl_a_attach'),
(36, 1, 1, 'attachments', 'acp', 11, 107, 108, 'ACP_ORPHAN_ATTACHMENTS', 'orphan', 'acl_a_attach'),
(37, 1, 1, 'ban', 'acp', 15, 155, 156, 'ACP_BAN_EMAILS', 'email', 'acl_a_ban'),
(38, 1, 1, 'ban', 'acp', 15, 157, 158, 'ACP_BAN_IPS', 'ip', 'acl_a_ban'),
(39, 1, 1, 'ban', 'acp', 15, 159, 160, 'ACP_BAN_USERNAMES', 'user', 'acl_a_ban'),
(40, 1, 1, 'bbcodes', 'acp', 10, 87, 88, 'ACP_BBCODES', 'bbcodes', 'acl_a_bbcode'),
(41, 1, 1, 'board', 'acp', 3, 21, 22, 'ACP_BOARD_SETTINGS', 'settings', 'acl_a_board'),
(42, 1, 1, 'board', 'acp', 3, 23, 24, 'ACP_BOARD_FEATURES', 'features', 'acl_a_board'),
(43, 1, 1, 'board', 'acp', 3, 25, 26, 'ACP_AVATAR_SETTINGS', 'avatar', 'acl_a_board'),
(44, 1, 1, 'board', 'acp', 3, 27, 28, 'ACP_MESSAGE_SETTINGS', 'message', 'acl_a_board'),
(45, 1, 1, 'board', 'acp', 10, 89, 90, 'ACP_MESSAGE_SETTINGS', 'message', 'acl_a_board'),
(46, 1, 1, 'board', 'acp', 3, 29, 30, 'ACP_POST_SETTINGS', 'post', 'acl_a_board'),
(47, 1, 1, 'board', 'acp', 10, 91, 92, 'ACP_POST_SETTINGS', 'post', 'acl_a_board'),
(48, 1, 1, 'board', 'acp', 3, 31, 32, 'ACP_SIGNATURE_SETTINGS', 'signature', 'acl_a_board'),
(49, 1, 1, 'board', 'acp', 3, 33, 34, 'ACP_FEED_SETTINGS', 'feed', 'acl_a_board'),
(50, 1, 1, 'board', 'acp', 3, 35, 36, 'ACP_REGISTER_SETTINGS', 'registration', 'acl_a_board'),
(51, 1, 1, 'board', 'acp', 4, 43, 44, 'ACP_AUTH_SETTINGS', 'auth', 'acl_a_server'),
(52, 1, 1, 'board', 'acp', 4, 45, 46, 'ACP_EMAIL_SETTINGS', 'email', 'acl_a_server'),
(53, 1, 1, 'board', 'acp', 5, 51, 52, 'ACP_COOKIE_SETTINGS', 'cookie', 'acl_a_server'),
(54, 1, 1, 'board', 'acp', 5, 53, 54, 'ACP_SERVER_SETTINGS', 'server', 'acl_a_server'),
(55, 1, 1, 'board', 'acp', 5, 55, 56, 'ACP_SECURITY_SETTINGS', 'security', 'acl_a_server'),
(56, 1, 1, 'board', 'acp', 5, 57, 58, 'ACP_LOAD_SETTINGS', 'load', 'acl_a_server'),
(57, 1, 1, 'bots', 'acp', 29, 257, 258, 'ACP_BOTS', 'bots', 'acl_a_bots'),
(58, 1, 1, 'captcha', 'acp', 3, 37, 38, 'ACP_VC_SETTINGS', 'visual', 'acl_a_board'),
(59, 1, 0, 'captcha', 'acp', 3, 39, 40, 'ACP_VC_CAPTCHA_DISPLAY', 'img', 'acl_a_board'),
(60, 1, 1, 'database', 'acp', 26, 243, 244, 'ACP_BACKUP', 'backup', 'acl_a_backup'),
(61, 1, 1, 'database', 'acp', 26, 245, 246, 'ACP_RESTORE', 'restore', 'acl_a_backup'),
(62, 1, 1, 'disallow', 'acp', 15, 161, 162, 'ACP_DISALLOW_USERNAMES', 'usernames', 'acl_a_names'),
(63, 1, 1, 'email', 'acp', 29, 259, 260, 'ACP_MASS_EMAIL', 'email', 'acl_a_email && cfg_email_enable'),
(64, 1, 1, 'forums', 'acp', 7, 67, 68, 'ACP_MANAGE_FORUMS', 'manage', 'acl_a_forum'),
(65, 1, 1, 'groups', 'acp', 14, 147, 148, 'ACP_GROUPS_MANAGE', 'manage', 'acl_a_group'),
(66, 1, 1, 'icons', 'acp', 10, 93, 94, 'ACP_ICONS', 'icons', 'acl_a_icons'),
(67, 1, 1, 'icons', 'acp', 10, 95, 96, 'ACP_SMILIES', 'smilies', 'acl_a_icons'),
(68, 1, 1, 'inactive', 'acp', 13, 115, 116, 'ACP_INACTIVE_USERS', 'list', 'acl_a_user'),
(69, 1, 1, 'jabber', 'acp', 4, 47, 48, 'ACP_JABBER_SETTINGS', 'settings', 'acl_a_jabber'),
(70, 1, 1, 'language', 'acp', 29, 261, 262, 'ACP_LANGUAGE_PACKS', 'lang_packs', 'acl_a_language'),
(71, 1, 1, 'logs', 'acp', 25, 233, 234, 'ACP_ADMIN_LOGS', 'admin', 'acl_a_viewlogs'),
(72, 1, 1, 'logs', 'acp', 25, 235, 236, 'ACP_MOD_LOGS', 'mod', 'acl_a_viewlogs'),
(73, 1, 1, 'logs', 'acp', 25, 237, 238, 'ACP_USERS_LOGS', 'users', 'acl_a_viewlogs'),
(74, 1, 1, 'logs', 'acp', 25, 239, 240, 'ACP_CRITICAL_LOGS', 'critical', 'acl_a_viewlogs'),
(75, 1, 1, 'main', 'acp', 1, 2, 3, 'ACP_INDEX', 'main', ''),
(76, 1, 1, 'modules', 'acp', 30, 269, 270, 'ACP', 'acp', 'acl_a_modules'),
(77, 1, 1, 'modules', 'acp', 30, 271, 272, 'UCP', 'ucp', 'acl_a_modules'),
(78, 1, 1, 'modules', 'acp', 30, 273, 274, 'MCP', 'mcp', 'acl_a_modules'),
(79, 1, 1, 'permission_roles', 'acp', 19, 193, 194, 'ACP_ADMIN_ROLES', 'admin_roles', 'acl_a_roles && acl_a_aauth'),
(80, 1, 1, 'permission_roles', 'acp', 19, 195, 196, 'ACP_USER_ROLES', 'user_roles', 'acl_a_roles && acl_a_uauth'),
(81, 1, 1, 'permission_roles', 'acp', 19, 197, 198, 'ACP_MOD_ROLES', 'mod_roles', 'acl_a_roles && acl_a_mauth'),
(82, 1, 1, 'permission_roles', 'acp', 19, 199, 200, 'ACP_FORUM_ROLES', 'forum_roles', 'acl_a_roles && acl_a_fauth'),
(83, 1, 1, 'permissions', 'acp', 16, 168, 169, 'ACP_PERMISSIONS', 'intro', 'acl_a_authusers || acl_a_authgroups || acl_a_viewauth'),
(84, 1, 0, 'permissions', 'acp', 20, 203, 204, 'ACP_PERMISSION_TRACE', 'trace', 'acl_a_viewauth'),
(85, 1, 1, 'permissions', 'acp', 18, 181, 182, 'ACP_FORUM_PERMISSIONS', 'setting_forum_local', 'acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),
(86, 1, 1, 'permissions', 'acp', 18, 183, 184, 'ACP_FORUM_PERMISSIONS_COPY', 'setting_forum_copy', 'acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),
(87, 1, 1, 'permissions', 'acp', 18, 185, 186, 'ACP_FORUM_MODERATORS', 'setting_mod_local', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(88, 1, 1, 'permissions', 'acp', 17, 171, 172, 'ACP_USERS_PERMISSIONS', 'setting_user_global', 'acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(89, 1, 1, 'permissions', 'acp', 13, 117, 118, 'ACP_USERS_PERMISSIONS', 'setting_user_global', 'acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(90, 1, 1, 'permissions', 'acp', 18, 187, 188, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(91, 1, 1, 'permissions', 'acp', 13, 119, 120, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(92, 1, 1, 'permissions', 'acp', 17, 173, 174, 'ACP_GROUPS_PERMISSIONS', 'setting_group_global', 'acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(93, 1, 1, 'permissions', 'acp', 14, 149, 150, 'ACP_GROUPS_PERMISSIONS', 'setting_group_global', 'acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(94, 1, 1, 'permissions', 'acp', 18, 189, 190, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(95, 1, 1, 'permissions', 'acp', 14, 151, 152, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(96, 1, 1, 'permissions', 'acp', 17, 175, 176, 'ACP_ADMINISTRATORS', 'setting_admin_global', 'acl_a_aauth && (acl_a_authusers || acl_a_authgroups)'),
(97, 1, 1, 'permissions', 'acp', 17, 177, 178, 'ACP_GLOBAL_MODERATORS', 'setting_mod_global', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(98, 1, 1, 'permissions', 'acp', 20, 205, 206, 'ACP_VIEW_ADMIN_PERMISSIONS', 'view_admin_global', 'acl_a_viewauth'),
(99, 1, 1, 'permissions', 'acp', 20, 207, 208, 'ACP_VIEW_USER_PERMISSIONS', 'view_user_global', 'acl_a_viewauth'),
(100, 1, 1, 'permissions', 'acp', 20, 209, 210, 'ACP_VIEW_GLOBAL_MOD_PERMISSIONS', 'view_mod_global', 'acl_a_viewauth'),
(101, 1, 1, 'permissions', 'acp', 20, 211, 212, 'ACP_VIEW_FORUM_MOD_PERMISSIONS', 'view_mod_local', 'acl_a_viewauth'),
(102, 1, 1, 'permissions', 'acp', 20, 213, 214, 'ACP_VIEW_FORUM_PERMISSIONS', 'view_forum_local', 'acl_a_viewauth'),
(103, 1, 1, 'php_info', 'acp', 29, 263, 264, 'ACP_PHP_INFO', 'info', 'acl_a_phpinfo'),
(104, 1, 1, 'profile', 'acp', 13, 121, 122, 'ACP_CUSTOM_PROFILE_FIELDS', 'profile', 'acl_a_profile'),
(105, 1, 1, 'prune', 'acp', 7, 69, 70, 'ACP_PRUNE_FORUMS', 'forums', 'acl_a_prune'),
(106, 1, 1, 'prune', 'acp', 15, 163, 164, 'ACP_PRUNE_USERS', 'users', 'acl_a_userdel'),
(107, 1, 1, 'ranks', 'acp', 13, 123, 124, 'ACP_MANAGE_RANKS', 'ranks', 'acl_a_ranks'),
(108, 1, 1, 'reasons', 'acp', 29, 265, 266, 'ACP_MANAGE_REASONS', 'main', 'acl_a_reasons'),
(109, 1, 1, 'search', 'acp', 5, 59, 60, 'ACP_SEARCH_SETTINGS', 'settings', 'acl_a_search'),
(110, 1, 1, 'search', 'acp', 26, 247, 248, 'ACP_SEARCH_INDEX', 'index', 'acl_a_search'),
(111, 1, 1, 'send_statistics', 'acp', 5, 61, 62, 'ACP_SEND_STATISTICS', 'send_statistics', 'acl_a_server'),
(112, 1, 1, 'styles', 'acp', 22, 219, 220, 'ACP_STYLES', 'style', 'acl_a_styles'),
(113, 1, 1, 'styles', 'acp', 23, 223, 224, 'ACP_TEMPLATES', 'template', 'acl_a_styles'),
(114, 1, 1, 'styles', 'acp', 23, 225, 226, 'ACP_THEMES', 'theme', 'acl_a_styles'),
(115, 1, 1, 'styles', 'acp', 23, 227, 228, 'ACP_IMAGESETS', 'imageset', 'acl_a_styles'),
(116, 1, 1, 'update', 'acp', 28, 253, 254, 'ACP_VERSION_CHECK', 'version_check', 'acl_a_board'),
(117, 1, 1, 'users', 'acp', 13, 113, 114, 'ACP_MANAGE_USERS', 'overview', 'acl_a_user'),
(118, 1, 0, 'users', 'acp', 13, 125, 126, 'ACP_USER_FEEDBACK', 'feedback', 'acl_a_user'),
(119, 1, 0, 'users', 'acp', 13, 127, 128, 'ACP_USER_WARNINGS', 'warnings', 'acl_a_user'),
(120, 1, 0, 'users', 'acp', 13, 129, 130, 'ACP_USER_PROFILE', 'profile', 'acl_a_user'),
(121, 1, 0, 'users', 'acp', 13, 131, 132, 'ACP_USER_PREFS', 'prefs', 'acl_a_user'),
(122, 1, 0, 'users', 'acp', 13, 133, 134, 'ACP_USER_AVATAR', 'avatar', 'acl_a_user'),
(123, 1, 0, 'users', 'acp', 13, 135, 136, 'ACP_USER_RANK', 'rank', 'acl_a_user'),
(124, 1, 0, 'users', 'acp', 13, 137, 138, 'ACP_USER_SIG', 'sig', 'acl_a_user'),
(125, 1, 0, 'users', 'acp', 13, 139, 140, 'ACP_USER_GROUPS', 'groups', 'acl_a_user && acl_a_group'),
(126, 1, 0, 'users', 'acp', 13, 141, 142, 'ACP_USER_PERM', 'perm', 'acl_a_user && acl_a_viewauth'),
(127, 1, 0, 'users', 'acp', 13, 143, 144, 'ACP_USER_ATTACH', 'attach', 'acl_a_user'),
(128, 1, 1, 'words', 'acp', 10, 97, 98, 'ACP_WORDS', 'words', 'acl_a_words'),
(129, 1, 1, 'users', 'acp', 2, 5, 6, 'ACP_MANAGE_USERS', 'overview', 'acl_a_user'),
(130, 1, 1, 'groups', 'acp', 2, 7, 8, 'ACP_GROUPS_MANAGE', 'manage', 'acl_a_group'),
(131, 1, 1, 'forums', 'acp', 2, 9, 10, 'ACP_MANAGE_FORUMS', 'manage', 'acl_a_forum'),
(132, 1, 1, 'logs', 'acp', 2, 11, 12, 'ACP_MOD_LOGS', 'mod', 'acl_a_viewlogs'),
(133, 1, 1, 'bots', 'acp', 2, 13, 14, 'ACP_BOTS', 'bots', 'acl_a_bots'),
(134, 1, 1, 'php_info', 'acp', 2, 15, 16, 'ACP_PHP_INFO', 'info', 'acl_a_phpinfo'),
(135, 1, 1, 'permissions', 'acp', 8, 73, 74, 'ACP_FORUM_PERMISSIONS', 'setting_forum_local', 'acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),
(136, 1, 1, 'permissions', 'acp', 8, 75, 76, 'ACP_FORUM_PERMISSIONS_COPY', 'setting_forum_copy', 'acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),
(137, 1, 1, 'permissions', 'acp', 8, 77, 78, 'ACP_FORUM_MODERATORS', 'setting_mod_local', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(138, 1, 1, 'permissions', 'acp', 8, 79, 80, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(139, 1, 1, 'permissions', 'acp', 8, 81, 82, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(140, 1, 1, '', 'mcp', 0, 1, 10, 'MCP_MAIN', '', ''),
(141, 1, 1, '', 'mcp', 0, 11, 18, 'MCP_QUEUE', '', ''),
(142, 1, 1, '', 'mcp', 0, 19, 32, 'MCP_REPORTS', '', ''),
(143, 1, 1, '', 'mcp', 0, 33, 38, 'MCP_NOTES', '', ''),
(144, 1, 1, '', 'mcp', 0, 39, 48, 'MCP_WARN', '', ''),
(145, 1, 1, '', 'mcp', 0, 49, 56, 'MCP_LOGS', '', ''),
(146, 1, 1, '', 'mcp', 0, 57, 64, 'MCP_BAN', '', ''),
(147, 1, 1, 'ban', 'mcp', 146, 58, 59, 'MCP_BAN_USERNAMES', 'user', 'acl_m_ban'),
(148, 1, 1, 'ban', 'mcp', 146, 60, 61, 'MCP_BAN_IPS', 'ip', 'acl_m_ban'),
(149, 1, 1, 'ban', 'mcp', 146, 62, 63, 'MCP_BAN_EMAILS', 'email', 'acl_m_ban'),
(150, 1, 1, 'logs', 'mcp', 145, 50, 51, 'MCP_LOGS_FRONT', 'front', 'acl_m_ || aclf_m_'),
(151, 1, 1, 'logs', 'mcp', 145, 52, 53, 'MCP_LOGS_FORUM_VIEW', 'forum_logs', 'acl_m_,$id'),
(152, 1, 1, 'logs', 'mcp', 145, 54, 55, 'MCP_LOGS_TOPIC_VIEW', 'topic_logs', 'acl_m_,$id'),
(153, 1, 1, 'main', 'mcp', 140, 2, 3, 'MCP_MAIN_FRONT', 'front', ''),
(154, 1, 1, 'main', 'mcp', 140, 4, 5, 'MCP_MAIN_FORUM_VIEW', 'forum_view', 'acl_m_,$id'),
(155, 1, 1, 'main', 'mcp', 140, 6, 7, 'MCP_MAIN_TOPIC_VIEW', 'topic_view', 'acl_m_,$id'),
(156, 1, 1, 'main', 'mcp', 140, 8, 9, 'MCP_MAIN_POST_DETAILS', 'post_details', 'acl_m_,$id || (!$id && aclf_m_)'),
(157, 1, 1, 'notes', 'mcp', 143, 34, 35, 'MCP_NOTES_FRONT', 'front', ''),
(158, 1, 1, 'notes', 'mcp', 143, 36, 37, 'MCP_NOTES_USER', 'user_notes', ''),
(159, 1, 1, 'pm_reports', 'mcp', 142, 20, 21, 'MCP_PM_REPORTS_OPEN', 'pm_reports', 'aclf_m_report'),
(160, 1, 1, 'pm_reports', 'mcp', 142, 22, 23, 'MCP_PM_REPORTS_CLOSED', 'pm_reports_closed', 'aclf_m_report'),
(161, 1, 1, 'pm_reports', 'mcp', 142, 24, 25, 'MCP_PM_REPORT_DETAILS', 'pm_report_details', 'aclf_m_report'),
(162, 1, 1, 'queue', 'mcp', 141, 12, 13, 'MCP_QUEUE_UNAPPROVED_TOPICS', 'unapproved_topics', 'aclf_m_approve'),
(163, 1, 1, 'queue', 'mcp', 141, 14, 15, 'MCP_QUEUE_UNAPPROVED_POSTS', 'unapproved_posts', 'aclf_m_approve'),
(164, 1, 1, 'queue', 'mcp', 141, 16, 17, 'MCP_QUEUE_APPROVE_DETAILS', 'approve_details', 'acl_m_approve,$id || (!$id && aclf_m_approve)'),
(165, 1, 1, 'reports', 'mcp', 142, 26, 27, 'MCP_REPORTS_OPEN', 'reports', 'aclf_m_report'),
(166, 1, 1, 'reports', 'mcp', 142, 28, 29, 'MCP_REPORTS_CLOSED', 'reports_closed', 'aclf_m_report'),
(167, 1, 1, 'reports', 'mcp', 142, 30, 31, 'MCP_REPORT_DETAILS', 'report_details', 'acl_m_report,$id || (!$id && aclf_m_report)'),
(168, 1, 1, 'warn', 'mcp', 144, 40, 41, 'MCP_WARN_FRONT', 'front', 'aclf_m_warn'),
(169, 1, 1, 'warn', 'mcp', 144, 42, 43, 'MCP_WARN_LIST', 'list', 'aclf_m_warn'),
(170, 1, 1, 'warn', 'mcp', 144, 44, 45, 'MCP_WARN_USER', 'warn_user', 'aclf_m_warn'),
(171, 1, 1, 'warn', 'mcp', 144, 46, 47, 'MCP_WARN_POST', 'warn_post', 'acl_m_warn && acl_f_read,$id'),
(172, 1, 1, '', 'ucp', 0, 1, 12, 'UCP_MAIN', '', ''),
(173, 1, 1, '', 'ucp', 0, 13, 22, 'UCP_PROFILE', '', ''),
(174, 1, 1, '', 'ucp', 0, 23, 30, 'UCP_PREFS', '', ''),
(175, 1, 1, '', 'ucp', 0, 31, 42, 'UCP_PM', '', ''),
(176, 1, 1, '', 'ucp', 0, 43, 48, 'UCP_USERGROUPS', '', ''),
(177, 1, 1, '', 'ucp', 0, 49, 54, 'UCP_ZEBRA', '', ''),
(178, 1, 1, 'attachments', 'ucp', 172, 10, 11, 'UCP_MAIN_ATTACHMENTS', 'attachments', 'acl_u_attach'),
(179, 1, 1, 'groups', 'ucp', 176, 44, 45, 'UCP_USERGROUPS_MEMBER', 'membership', ''),
(180, 1, 1, 'groups', 'ucp', 176, 46, 47, 'UCP_USERGROUPS_MANAGE', 'manage', ''),
(181, 1, 1, 'main', 'ucp', 172, 2, 3, 'UCP_MAIN_FRONT', 'front', ''),
(182, 1, 1, 'main', 'ucp', 172, 4, 5, 'UCP_MAIN_SUBSCRIBED', 'subscribed', ''),
(183, 1, 1, 'main', 'ucp', 172, 6, 7, 'UCP_MAIN_BOOKMARKS', 'bookmarks', 'cfg_allow_bookmarks'),
(184, 1, 1, 'main', 'ucp', 172, 8, 9, 'UCP_MAIN_DRAFTS', 'drafts', ''),
(185, 1, 0, 'pm', 'ucp', 175, 32, 33, 'UCP_PM_VIEW', 'view', 'cfg_allow_privmsg'),
(186, 1, 1, 'pm', 'ucp', 175, 34, 35, 'UCP_PM_COMPOSE', 'compose', 'cfg_allow_privmsg'),
(187, 1, 1, 'pm', 'ucp', 175, 36, 37, 'UCP_PM_DRAFTS', 'drafts', 'cfg_allow_privmsg'),
(188, 0, 1, 'pm', 'ucp', 175, 38, 39, 'UCP_PM_OPTIONS', 'options', 'cfg_allow_privmsg'),
(189, 1, 0, 'pm', 'ucp', 175, 40, 41, 'UCP_PM_POPUP_TITLE', 'popup', 'cfg_allow_privmsg'),
(190, 1, 1, 'prefs', 'ucp', 174, 24, 25, 'UCP_PREFS_PERSONAL', 'personal', ''),
(191, 1, 1, 'prefs', 'ucp', 174, 26, 27, 'UCP_PREFS_POST', 'post', ''),
(192, 1, 1, 'prefs', 'ucp', 174, 28, 29, 'UCP_PREFS_VIEW', 'view', ''),
(193, 1, 1, 'profile', 'ucp', 173, 14, 15, 'UCP_PROFILE_PROFILE_INFO', 'profile_info', ''),
(194, 1, 1, 'profile', 'ucp', 173, 16, 17, 'UCP_PROFILE_SIGNATURE', 'signature', 'acl_u_sig'),
(195, 1, 1, 'profile', 'ucp', 173, 18, 19, 'UCP_PROFILE_AVATAR', 'avatar', 'cfg_allow_avatar && (cfg_allow_avatar_local || cfg_allow_avatar_remote || cfg_allow_avatar_upload || cfg_allow_avatar_remote_upload)'),
(196, 1, 1, 'profile', 'ucp', 173, 20, 21, 'UCP_PROFILE_REG_DETAILS', 'reg_details', ''),
(197, 1, 1, 'zebra', 'ucp', 177, 50, 51, 'UCP_ZEBRA_FRIENDS', 'friends', ''),
(198, 1, 1, 'zebra', 'ucp', 177, 52, 53, 'UCP_ZEBRA_FOES', 'foes', '');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_poll_options`
--

CREATE TABLE IF NOT EXISTS `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_text` text COLLATE utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_poll_votes`
--

CREATE TABLE IF NOT EXISTS `phpbb_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_posts`
--

CREATE TABLE IF NOT EXISTS `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `post_checksum` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_postcount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `post_username` (`post_username`),
  KEY `tid_post_time` (`topic_id`,`post_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `phpbb_posts`
--

INSERT INTO `phpbb_posts` (`post_id`, `topic_id`, `forum_id`, `poster_id`, `icon_id`, `poster_ip`, `post_time`, `post_approved`, `post_reported`, `enable_bbcode`, `enable_smilies`, `enable_magic_url`, `enable_sig`, `post_username`, `post_subject`, `post_text`, `post_checksum`, `post_attachment`, `bbcode_bitfield`, `bbcode_uid`, `post_postcount`, `post_edit_time`, `post_edit_reason`, `post_edit_user`, `post_edit_count`, `post_edit_locked`) VALUES
(1, 1, 2, 2, 0, '127.0.0.1', 1387582309, 1, 0, 1, 1, 1, 1, '', 'Welcome to phpBB3', 'This is an example post in your phpBB3 installation. Everything seems to be working. You may delete this post if you like and continue to set up your board. During the installation process your first category and your first forum are assigned an appropriate set of permissions for the predefined usergroups administrators, bots, global moderators, guests, registered users and registered COPPA users. If you also choose to delete your first category and your first forum, do not forget to assign permissions for all these usergroups for all new categories and forums you create. It is recommended to rename your first category and your first forum and copy permissions from these while creating new categories and forums. Have fun!', '5dd683b17f641daf84c040bfefc58ce9', 0, '', '', 1, 0, '', 0, 0, 0),
(2, 1, 2, 2, 0, '127.0.0.1', 1387991216, 1, 0, 1, 1, 1, 1, '', 'Re: Welcome to phpBB3', 'test', '098f6bcd4621d373cade4e832627b4f6', 0, '', 'xxlw7jg3', 1, 0, '', 0, 0, 0),
(3, 2, 2, 2, 0, '127.0.0.1', 1389069041, 1, 0, 1, 1, 1, 1, '', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', 0, '', '1r0bkuam', 1, 0, '', 0, 0, 0),
(4, 2, 2, 2, 0, '127.0.0.1', 1389069046, 1, 0, 1, 1, 1, 1, '', 'Re: test', 'test', '098f6bcd4621d373cade4e832627b4f6', 0, '', '3vuvwqbi', 1, 0, '', 0, 0, 0),
(5, 2, 2, 2, 0, '127.0.0.1', 1389069052, 1, 0, 1, 1, 1, 1, '', 'Re: test', 'test', '098f6bcd4621d373cade4e832627b4f6', 0, '', '2ors6l0h', 1, 0, '', 0, 0, 0),
(6, 2, 2, 2, 0, '127.0.0.1', 1389069769, 1, 0, 1, 1, 1, 1, '', 'Re: test', 'testasd', 'f39c5d80f3716060853a860ff673984b', 0, '', '1pht5pi5', 1, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_privmsgs`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root_level` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_time` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_text` mediumtext COLLATE utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `message_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `to_address` text COLLATE utf8_bin NOT NULL,
  `bcc_address` text COLLATE utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `phpbb_privmsgs`
--

INSERT INTO `phpbb_privmsgs` (`msg_id`, `root_level`, `author_id`, `icon_id`, `author_ip`, `message_time`, `enable_bbcode`, `enable_smilies`, `enable_magic_url`, `enable_sig`, `message_subject`, `message_text`, `message_edit_reason`, `message_edit_user`, `message_attachment`, `bbcode_bitfield`, `bbcode_uid`, `message_edit_time`, `message_edit_count`, `to_address`, `bcc_address`, `message_reported`) VALUES
(1, 0, 61, 0, '127.0.0.1', 1388104164, 1, 1, 1, 1, 'Test', 'test', '', 0, 0, '', '36u6nvqe', 0, 0, 'u_2', '', 0),
(2, 0, 2, 0, '127.0.0.1', 1388104586, 1, 1, 1, 1, 'etett', 'teqt', '', 0, 0, '', '1fhf4enk', 0, 0, 'u_61', '', 0),
(3, 0, 61, 0, '127.0.0.1', 1388113333, 1, 1, 1, 1, 'avarv', 'avwrv', '', 0, 0, '', '3lzayf9j', 0, 0, 'u_2', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_privmsgs_folder`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pm_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_privmsgs_rules`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_check` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_connection` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_string` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rule_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_folder_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_privmsgs_to`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_replied` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_marked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_privmsgs_to`
--

INSERT INTO `phpbb_privmsgs_to` (`msg_id`, `user_id`, `author_id`, `pm_deleted`, `pm_new`, `pm_unread`, `pm_replied`, `pm_marked`, `pm_forwarded`, `folder_id`) VALUES
(1, 2, 61, 0, 0, 1, 0, 0, 0, 0),
(1, 61, 61, 0, 0, 0, 0, 0, 0, -1),
(2, 61, 2, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 2, 0, 0, 0, 0, 0, 0, -1),
(3, 2, 61, 0, 0, 0, 0, 0, 0, 0),
(3, 61, 61, 0, 0, 0, 0, 0, 0, -1);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_profile_fields`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_type` tinyint(4) NOT NULL DEFAULT '0',
  `field_ident` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_length` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_minlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_maxlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_novalue` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_validation` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_novalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_no_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_profile_fields_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_profile_fields_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_type` tinyint(4) NOT NULL DEFAULT '0',
  `lang_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_profile_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_explain` text COLLATE utf8_bin NOT NULL,
  `lang_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_ranks`
--

CREATE TABLE IF NOT EXISTS `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phpbb_ranks`
--

INSERT INTO `phpbb_ranks` (`rank_id`, `rank_title`, `rank_min`, `rank_special`, `rank_image`) VALUES
(1, 'Site Admin', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_reports`
--

CREATE TABLE IF NOT EXISTS `phpbb_reports` (
  `report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_time` int(11) unsigned NOT NULL DEFAULT '0',
  `report_text` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_reports_reasons`
--

CREATE TABLE IF NOT EXISTS `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reason_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reason_description` mediumtext COLLATE utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `phpbb_reports_reasons`
--

INSERT INTO `phpbb_reports_reasons` (`reason_id`, `reason_title`, `reason_description`, `reason_order`) VALUES
(1, 'warez', 'The post contains links to illegal or pirated software.', 1),
(2, 'spam', 'The reported post has the only purpose to advertise for a website or another product.', 2),
(3, 'off_topic', 'The reported post is off topic.', 3),
(4, 'other', 'The reported post does not fit into any other category, please use the further information field.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_search_results`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_results` (
  `search_key` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) unsigned NOT NULL DEFAULT '0',
  `search_keywords` mediumtext COLLATE utf8_bin NOT NULL,
  `search_authors` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`search_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_search_wordlist`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `word_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=61 ;

--
-- Dumping data for table `phpbb_search_wordlist`
--

INSERT INTO `phpbb_search_wordlist` (`word_id`, `word_text`, `word_common`, `word_count`) VALUES
(1, 'this', 0, 1),
(2, 'example', 0, 1),
(3, 'post', 0, 1),
(4, 'your', 0, 1),
(5, 'phpbb3', 0, 3),
(6, 'installation', 0, 1),
(7, 'everything', 0, 1),
(8, 'seems', 0, 1),
(9, 'working', 0, 1),
(10, 'you', 0, 1),
(11, 'may', 0, 1),
(12, 'delete', 0, 1),
(13, 'like', 0, 1),
(14, 'and', 0, 1),
(15, 'continue', 0, 1),
(16, 'set', 0, 1),
(17, 'board', 0, 1),
(18, 'during', 0, 1),
(19, 'the', 0, 1),
(20, 'process', 0, 1),
(21, 'first', 0, 1),
(22, 'category', 0, 1),
(23, 'forum', 0, 1),
(24, 'are', 0, 1),
(25, 'assigned', 0, 1),
(26, 'appropriate', 0, 1),
(27, 'permissions', 0, 1),
(28, 'for', 0, 1),
(29, 'predefined', 0, 1),
(30, 'usergroups', 0, 1),
(31, 'administrators', 0, 1),
(32, 'bots', 0, 1),
(33, 'global', 0, 1),
(34, 'moderators', 0, 1),
(35, 'guests', 0, 1),
(36, 'registered', 0, 1),
(37, 'users', 0, 1),
(38, 'coppa', 0, 1),
(39, 'also', 0, 1),
(40, 'choose', 0, 1),
(41, 'not', 0, 1),
(42, 'forget', 0, 1),
(43, 'assign', 0, 1),
(44, 'all', 0, 1),
(45, 'these', 0, 1),
(46, 'new', 0, 1),
(47, 'categories', 0, 1),
(48, 'forums', 0, 1),
(49, 'create', 0, 1),
(50, 'recommended', 0, 1),
(51, 'rename', 0, 1),
(52, 'copy', 0, 1),
(53, 'from', 0, 1),
(54, 'while', 0, 1),
(55, 'creating', 0, 1),
(56, 'have', 0, 1),
(57, 'fun', 0, 1),
(58, 'welcome', 0, 2),
(59, 'test', 0, 8),
(60, 'testasd', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_search_wordmatch`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_search_wordmatch`
--

INSERT INTO `phpbb_search_wordmatch` (`post_id`, `word_id`, `title_match`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 5, 1),
(2, 5, 1),
(1, 6, 0),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(1, 11, 0),
(1, 12, 0),
(1, 13, 0),
(1, 14, 0),
(1, 15, 0),
(1, 16, 0),
(1, 17, 0),
(1, 18, 0),
(1, 19, 0),
(1, 20, 0),
(1, 21, 0),
(1, 22, 0),
(1, 23, 0),
(1, 24, 0),
(1, 25, 0),
(1, 26, 0),
(1, 27, 0),
(1, 28, 0),
(1, 29, 0),
(1, 30, 0),
(1, 31, 0),
(1, 32, 0),
(1, 33, 0),
(1, 34, 0),
(1, 35, 0),
(1, 36, 0),
(1, 37, 0),
(1, 38, 0),
(1, 39, 0),
(1, 40, 0),
(1, 41, 0),
(1, 42, 0),
(1, 43, 0),
(1, 44, 0),
(1, 45, 0),
(1, 46, 0),
(1, 47, 0),
(1, 48, 0),
(1, 49, 0),
(1, 50, 0),
(1, 51, 0),
(1, 52, 0),
(1, 53, 0),
(1, 54, 0),
(1, 55, 0),
(1, 56, 0),
(1, 57, 0),
(1, 58, 1),
(2, 58, 1),
(2, 59, 0),
(3, 59, 0),
(3, 59, 1),
(4, 59, 0),
(4, 59, 1),
(5, 59, 0),
(5, 59, 1),
(6, 59, 1),
(6, 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_sessions`
--

CREATE TABLE IF NOT EXISTS `phpbb_sessions` (
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_last_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `session_start` int(11) unsigned NOT NULL DEFAULT '0',
  `session_time` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_page` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_sessions`
--

INSERT INTO `phpbb_sessions` (`session_id`, `session_user_id`, `session_forum_id`, `session_last_visit`, `session_start`, `session_time`, `session_ip`, `session_browser`, `session_forwarded_for`, `session_page`, `session_viewonline`, `session_autologin`, `session_admin`) VALUES
('1028fb7c31734b572b5664954a99be26', 64, 0, 1404962172, 1405035983, 1405036612, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 1, 0),
('585e592095e16750111f3a38b374130c', 1, 0, 1405037307, 1405037307, 1405037307, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 0, 0),
('5ebd90fc3d871c64d46edee84d62cf36', 2, 0, 1389796312, 1405037248, 1405037280, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 1, 0),
('769f0b703a35118445afdd66788cf35c', 1, 0, 1405031479, 1405031479, 1405031479, '37.58.100.229', 'Mozilla/5.0 (compatible; AhrefsBot/5.0; +http://ahrefs.com/robot/)', '', '../index.php', 1, 0, 0),
('77cc72628582f5cc59a3a2fc8ac466a6', 1, 0, 1405035981, 1405035981, 1405035981, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 0, 0),
('a2e83a0ae63be397443980b153d5a282', 1, 0, 1405034402, 1405034402, 1405034402, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 0, 0),
('a3b4cc75ca78afa11eb96cf8cde4f33d', 1, 0, 1405031739, 1405031739, 1405031739, '37.58.100.229', 'Mozilla/5.0 (compatible; AhrefsBot/5.0; +http://ahrefs.com/robot/)', '', '../index.php', 1, 0, 0),
('a6240617ac50b5e6eb4bbb284888cab1', 64, 0, 1404538467, 1405034424, 1405034641, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 1, 0),
('bd99e56d5d97e5639825ae1a5ea40f3d', 1, 0, 1405031077, 1405031077, 1405031077, '37.58.100.181', 'Mozilla/5.0 (compatible; AhrefsBot/5.0; +http://ahrefs.com/robot/)', '', '../index.php', 1, 0, 0),
('c8231653d7d08dc2754a0d025a5236ee', 1, 0, 1405037246, 1405037246, 1405037246, '120.144.35.47', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0', '', '../index.php', 1, 0, 0),
('caacf86ca2f51da8a3a1a6a91247e0d9', 1, 0, 1405033927, 1405033927, 1405033927, '42.156.139.5', 'YisouSpider', '', '../index.php', 1, 0, 0),
('edcdfd65fec6948b66d144198458d65d', 1, 0, 1405037224, 1405037224, 1405037227, '197.38.71.150', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/34.0.1847.116 Chrome/34.0.1847.116 Safari/537.36', '', '../index.php', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_sessions_keys`
--

CREATE TABLE IF NOT EXISTS `phpbb_sessions_keys` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_sessions_keys`
--

INSERT INTO `phpbb_sessions_keys` (`key_id`, `user_id`, `last_ip`, `last_login`) VALUES
('0028a8c0229422f6534cca04aed26802', 61, '127.0.0.1', 1388105138),
('003b9873b083aacd30ceec1ef850ff22', 61, '127.0.0.1', 1389149955),
('00e56bf4abace894a2853549d4542492', 2, '120.144.35.47', 1405037249),
('012818c603b340ff9c8625b0fc843ae2', 61, '127.0.0.1', 1388105844),
('02714af6c97a71d26f3984f184fa92a9', 61, '127.0.0.1', 1388106068),
('027eabe81204c15a08a17d4711186ed7', 2, '127.0.0.1', 1388112547),
('063f77be611e86efb8e59a3dc1b9d2f3', 61, '127.0.0.1', 1388105553),
('0664af98b2e397f7de4e5f87fd79dd34', 61, '127.0.0.1', 1388107920),
('0667a3ba7d9dc5bf3115f86dde4181ac', 61, '127.0.0.1', 1388104645),
('06f9991041538379d5e9d795f5e3c7f6', 61, '127.0.0.1', 1388104144),
('0759c2017f65d3d25a2f7d6900b92b0b', 61, '127.0.0.1', 1389584742),
('0963239d0819fd1aa48ed193145edc78', 61, '127.0.0.1', 1388104624),
('0b5b32686f934a4a14ec9315e3764a7e', 61, '127.0.0.1', 1388111970),
('0c82f2b07a8aedfcf5b8ac8deed8186a', 61, '127.0.0.1', 1388106010),
('0ca21077f6a055bce12a56919b72376c', 2, '127.0.0.1', 1389050527),
('0effed40263503a30ad04611497364ee', 2, '127.0.0.1', 1388098296),
('10ec6409ddaf6d8fe300a1602f7af90b', 2, '127.0.0.1', 1388098907),
('13572fac532570e7ea262353ae018067', 61, '127.0.0.1', 1388104599),
('13f3b093b6dcb2324e37164bb1a5424a', 2, '127.0.0.1', 1389508945),
('172f881fa7c03e2a5cb2d94826cbfec2', 2, '127.0.0.1', 1389054877),
('1973931699c821af44285acd6e590a49', 64, '1.123.143.129', 1404524114),
('1bc4bd9825c06565d0d13c1df1badb8b', 2, '127.0.0.1', 1389070616),
('1cf0403c78f938cb2f43bcc211f666a9', 2, '127.0.0.1', 1388868018),
('1d8e90a967153364b1623cd1405f5a10', 2, '127.0.0.1', 1388152607),
('208846703d67af8bdfef524b60a3f682', 2, '127.0.0.1', 1389352265),
('20b68fb8c6ecc4d3410465d65e56950d', 2, '127.0.0.1', 1388112484),
('211c9827dcad31a68d1c9dca854affa0', 2, '127.0.0.1', 1388152656),
('2241d7861efdaf19780f44a831771f36', 61, '127.0.0.1', 1388106181),
('273b450633785923e0086dc381088496', 61, '127.0.0.1', 1388106074),
('2a277864b5a17af4e4b50f6df765c534', 61, '127.0.0.1', 1388104643),
('2c61e1625b9c9b553c0f8ef63a92a448', 2, '127.0.0.1', 1389149170),
('3212e7a3deea1ee46012f99ddb589e2f', 61, '127.0.0.1', 1389041682),
('35a4d87de04038aab81ebf5597a0ea84', 61, '127.0.0.1', 1388105104),
('3698132c730b58840404987065c89c5e', 64, '1.123.143.129', 1404525383),
('37f7cda6a2dee299e5e6a4284ef16307', 61, '127.0.0.1', 1388104644),
('3ccc5fade6981285e5c4e9020cf9849c', 2, '127.0.0.1', 1388152737),
('3fe7637ef83196faff12701bf74ff490', 2, '127.0.0.1', 1389506022),
('4778bdb5c5bbdd0d8a854769402e2557', 2, '127.0.0.1', 1388107627),
('4a1a2aadf9ac764f4f57aa108aef8f2c', 61, '127.0.0.1', 1388871102),
('4d419b763cf6677682f644df4e80ea6e', 61, '127.0.0.1', 1388105225),
('4dfe19593c316fb666ed082f00c114ec', 2, '127.0.0.1', 1389050662),
('4e1bc3443d84c83fbbd7734720e7a838', 2, '127.0.0.1', 1389632029),
('50829a04174c5ef2f915466dae0cbf69', 61, '127.0.0.1', 1388116984),
('5117f43b14cd3864570eb0afab497e23', 2, '', 1387746725),
('5324ed1a2208fe1ac0ce2066780dca83', 61, '127.0.0.1', 1388106370),
('536918b3b646a0761e90cc911a203bae', 2, '127.0.0.1', 1389150042),
('566715d102f7bbb2013417dcb6f7c10e', 2, '127.0.0.1', 1388152375),
('574fc60bab64319c6d7cd94246220ae0', 61, '127.0.0.1', 1388105677),
('5909a5dc19bf091d15257f9d859a7c9e', 2, '127.0.0.1', 1389240625),
('5df019e5d2f0a71ffcad973264889a2c', 61, '127.0.0.1', 1388113320),
('5e26cba5cb3351b17abb87e96d7d24b3', 61, '127.0.0.1', 1388105204),
('619c19ad4835666129dd00ae5214b9d0', 2, '127.0.0.1', 1388113354),
('61b376338e5638f1a6dc3eb6b2980c7b', 2, '127.0.0.1', 1388152461),
('62bd15b23c6c3c52db796a1cb796d893', 2, '127.0.0.1', 1388150983),
('65b83cc07d314b0f23303720513accc8', 2, '127.0.0.1', 1388104182),
('6696051fdcbd039f3342251da155ed0d', 2, '127.0.0.1', 1389453857),
('67926f6c3393a4db748750d2a3d16b41', 2, '127.0.0.1', 1388152299),
('68241deec26f3c6c77a413e3e4998486', 2, '127.0.0.1', 1388114563),
('6838ad7d766816c027a51a51c81a4fff', 61, '127.0.0.1', 1388105359),
('6c0d71fbb93310448728d7c68a3558e2', 2, '127.0.0.1', 1388152707),
('707c9b682e68d22d1e198113a84df9bf', 61, '127.0.0.1', 1388106156),
('72098ab2b4d5eac5a00156d902cf30d4', 2, '127.0.0.1', 1388112452),
('7520b02bd56204315face743cced73b3', 61, '127.0.0.1', 1389795749),
('7880b41e3735791e46d80778cff143de', 61, '127.0.0.1', 1388114552),
('7bb2e33155c8f01073ebb0e309682cbf', 2, '127.0.0.1', 1388152427),
('7bfda86d748683dcd591db196448af2a', 64, '1.123.161.135', 1404619114),
('7c19b4e1b2e73d7d4c95c661617620ac', 2, '127.0.0.1', 1388867010),
('7d2ba1d08b138ef50affa87865077fc8', 2, '127.0.0.1', 1389453851),
('8012331e80033f5b0ac61b45f9d73ae6', 61, '127.0.0.1', 1388110051),
('80605e355a3aae7f7e56f100720b7168', 61, '127.0.0.1', 1388105126),
('81dfb68e58f89aecec04567a13c0527b', 2, '127.0.0.1', 1388113829),
('82ee01880ece285209510c7e53cfaea9', 2, '127.0.0.1', 1389050494),
('83be03a044040d14a2a15496a6428ca9', 2, '127.0.0.1', 1388097263),
('881f879ef8217ab849cd0287fcd7f21c', 2, '127.0.0.1', 1389066403),
('8a334a90fb89aa2b41c6313bef607738', 61, '127.0.0.1', 1388105126),
('90388b6dfbada64b322ae73a2d68fe3b', 2, '', 1387746750),
('91ed1c652864098badaae87490a6df4a', 61, '127.0.0.1', 1388105125),
('9477e31cb0113f21d783036129a9d10c', 61, '127.0.0.1', 1388105888),
('99c99f937860b94cf32cb10a30dbc759', 61, '127.0.0.1', 1388105146),
('9ae4dd223bbedd5b2a0e0a52bfda5fd7', 61, '127.0.0.1', 1388105745),
('9bd1b77ed9e7509b1aea3a18d000f7c4', 2, '127.0.0.1', 1388152699),
('9e61f4c0e542b145ef01ee0c8f5e5d89', 61, '127.0.0.1', 1388104747),
('9eb52e5b2a62cf1647c2a50a50fea024', 64, '120.144.35.47', 1405035983),
('a3bbc94c85b55ab03517ae6457fc73d0', 2, '127.0.0.1', 1389508198),
('a9202e415fdec7c08176d097f154a619', 61, '127.0.0.1', 1388106245),
('a98d04e18d6be30a2852e121f5a8f0bd', 61, '127.0.0.1', 1388105175),
('aa05f17f1783de6905430b0b0d6151cd', 61, '127.0.0.1', 1388097220),
('ae34d1c096d89216dfb6542cbd9ef166', 61, '127.0.0.1', 1388113512),
('b0207a5ae350479093613a3f4a6e178f', 2, '127.0.0.1', 1389070727),
('b2b634b5d557f895503d8c2123af338e', 2, '127.0.0.1', 1388110842),
('b343e8f9afcd10a094721355eba29b1d', 61, '127.0.0.1', 1388113609),
('b39bf86ead1ae44b149a813a516b13b7', 2, '', 1387746708),
('b5039ddb29c2db2bb3e13c8e1e167a6c', 61, '127.0.0.1', 1388105717),
('b7a135825cc4349456485b5f5c343e0b', 61, '127.0.0.1', 1388106107),
('bcaa5b47c6a2b1127aaece16b08f3057', 2, '127.0.0.1', 1389795327),
('bce8111820fc87e7a43868282b2d4bb2', 61, '127.0.0.1', 1388112512),
('bd09b4b0e2d6bc9f7ab8d7ca288fd416', 64, '1.123.143.129', 1404532911),
('bf15857871c174c8cfe283c653da82d5', 61, '127.0.0.1', 1388105236),
('bfaacd4e7af5a4a33bdd4b3df2c88e64', 2, '', 1387746716),
('c062f35880003f965c61c64b8344ba0b', 2, '127.0.0.1', 1388103500),
('c41d81449555509213eaf71ece8763d2', 2, '127.0.0.1', 1389241156),
('c837c3ba42fe49857200347dad42ef42', 61, '127.0.0.1', 1388107952),
('cb91465c494e415591f6b3f4ef553a11', 61, '127.0.0.1', 1388105476),
('cbcffda9bb9efa0754b542d22a141055', 61, '127.0.0.1', 1388105660),
('cd1d1bc5a54dd637caf88764f9911146', 2, '127.0.0.1', 1389070661),
('cdbf981a82b780ca298077aeddfc17aa', 2, '127.0.0.1', 1389240747),
('d2f26a5c34df9d5844d6f309390677bb', 2, '127.0.0.1', 1389796312),
('d5670d5e97dd43642699d4c7762c55e2', 61, '127.0.0.1', 1388105889),
('d5b86922babeebd3c3cc9b94571ca25c', 2, '127.0.0.1', 1388117139),
('d90f9caa483097cb41ac50a906d1a9b1', 2, '127.0.0.1', 1389149947),
('daeb5d2d5249d51b9cb8f31a57819e33', 61, '127.0.0.1', 1388105789),
('dbff5dfb3efe995391e232dc22a21c84', 64, '120.144.35.47', 1405034426),
('dc47bce47531c895ef78fba375fbf205', 2, '127.0.0.1', 1388868147),
('dcd6564ab671d9f406077f3a7f593ab5', 2, '127.0.0.1', 1388152469),
('dee1d525483f7f4e81ef1108bf3f9a02', 2, '127.0.0.1', 1388113565),
('e0c7fe7abcae6bbf2bb0b357dad9a832', 61, '127.0.0.1', 1388112473),
('e2bc509e291acda5b0740e6497007588', 61, '127.0.0.1', 1388105689),
('e36d3ed97635004a5ccc533930eae9de', 61, '127.0.0.1', 1388105124),
('e532d85c1d0dc4a16dc28fcd188891fe', 61, '127.0.0.1', 1389584761),
('e66eee5cf29c588b6262b65c9aa46f94', 61, '127.0.0.1', 1388951438),
('e8622b831d1b81f1444e77a15dfed3a7', 61, '127.0.0.1', 1388105962),
('ea1d33c268f80a7cfc7dc60eedefbdef', 2, '127.0.0.1', 1388152453),
('f01433c322e721009a6040e6ef366b32', 2, '127.0.0.1', 1388866977),
('f177dd5da8918551eee738d0db0d7d72', 61, '127.0.0.1', 1388105226),
('f43049fbb98cdbf6e56f2bfe6401e8c9', 64, '110.149.198.219', 1404957797),
('f43c1da2f555ec1a1d62a98e14cd443d', 2, '127.0.0.1', 1388112641),
('f85f22c3117da6d7d27e5f3f450d176d', 61, '127.0.0.1', 1388112627),
('f99219374294b0777903025d5c94c4ea', 2, '127.0.0.1', 1388097292),
('fafeefb923e1e1e459e1f8185447da57', 61, '127.0.0.1', 1388104645),
('fcfc5280c17ce49009578d312656ab0d', 2, '127.0.0.1', 1388152690);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_sitelist`
--

CREATE TABLE IF NOT EXISTS `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_hostname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_smilies`
--

CREATE TABLE IF NOT EXISTS `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `emotion` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_url` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

--
-- Dumping data for table `phpbb_smilies`
--

INSERT INTO `phpbb_smilies` (`smiley_id`, `code`, `emotion`, `smiley_url`, `smiley_width`, `smiley_height`, `smiley_order`, `display_on_posting`) VALUES
(1, ':D', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 1, 1),
(2, ':-D', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 2, 1),
(3, ':grin:', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 3, 1),
(4, ':)', 'Smile', 'icon_e_smile.gif', 15, 17, 4, 1),
(5, ':-)', 'Smile', 'icon_e_smile.gif', 15, 17, 5, 1),
(6, ':smile:', 'Smile', 'icon_e_smile.gif', 15, 17, 6, 1),
(7, ';)', 'Wink', 'icon_e_wink.gif', 15, 17, 7, 1),
(8, ';-)', 'Wink', 'icon_e_wink.gif', 15, 17, 8, 1),
(9, ':wink:', 'Wink', 'icon_e_wink.gif', 15, 17, 9, 1),
(10, ':(', 'Sad', 'icon_e_sad.gif', 15, 17, 10, 1),
(11, ':-(', 'Sad', 'icon_e_sad.gif', 15, 17, 11, 1),
(12, ':sad:', 'Sad', 'icon_e_sad.gif', 15, 17, 12, 1),
(13, ':o', 'Surprised', 'icon_e_surprised.gif', 15, 17, 13, 1),
(14, ':-o', 'Surprised', 'icon_e_surprised.gif', 15, 17, 14, 1),
(15, ':eek:', 'Surprised', 'icon_e_surprised.gif', 15, 17, 15, 1),
(16, ':shock:', 'Shocked', 'icon_eek.gif', 15, 17, 16, 1),
(17, ':?', 'Confused', 'icon_e_confused.gif', 15, 17, 17, 1),
(18, ':-?', 'Confused', 'icon_e_confused.gif', 15, 17, 18, 1),
(19, ':???:', 'Confused', 'icon_e_confused.gif', 15, 17, 19, 1),
(20, '8-)', 'Cool', 'icon_cool.gif', 15, 17, 20, 1),
(21, ':cool:', 'Cool', 'icon_cool.gif', 15, 17, 21, 1),
(22, ':lol:', 'Laughing', 'icon_lol.gif', 15, 17, 22, 1),
(23, ':x', 'Mad', 'icon_mad.gif', 15, 17, 23, 1),
(24, ':-x', 'Mad', 'icon_mad.gif', 15, 17, 24, 1),
(25, ':mad:', 'Mad', 'icon_mad.gif', 15, 17, 25, 1),
(26, ':P', 'Razz', 'icon_razz.gif', 15, 17, 26, 1),
(27, ':-P', 'Razz', 'icon_razz.gif', 15, 17, 27, 1),
(28, ':razz:', 'Razz', 'icon_razz.gif', 15, 17, 28, 1),
(29, ':oops:', 'Embarrassed', 'icon_redface.gif', 15, 17, 29, 1),
(30, ':cry:', 'Crying or Very Sad', 'icon_cry.gif', 15, 17, 30, 1),
(31, ':evil:', 'Evil or Very Mad', 'icon_evil.gif', 15, 17, 31, 1),
(32, ':twisted:', 'Twisted Evil', 'icon_twisted.gif', 15, 17, 32, 1),
(33, ':roll:', 'Rolling Eyes', 'icon_rolleyes.gif', 15, 17, 33, 1),
(34, ':!:', 'Exclamation', 'icon_exclaim.gif', 15, 17, 34, 1),
(35, ':?:', 'Question', 'icon_question.gif', 15, 17, 35, 1),
(36, ':idea:', 'Idea', 'icon_idea.gif', 15, 17, 36, 1),
(37, ':arrow:', 'Arrow', 'icon_arrow.gif', 15, 17, 37, 1),
(38, ':|', 'Neutral', 'icon_neutral.gif', 15, 17, 38, 1),
(39, ':-|', 'Neutral', 'icon_neutral.gif', 15, 17, 39, 1),
(40, ':mrgreen:', 'Mr. Green', 'icon_mrgreen.gif', 15, 17, 40, 1),
(41, ':geek:', 'Geek', 'icon_e_geek.gif', 17, 17, 41, 1),
(42, ':ugeek:', 'Uber Geek', 'icon_e_ugeek.gif', 17, 18, 42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_styles`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `theme_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `imageset_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `phpbb_styles`
--

INSERT INTO `phpbb_styles` (`style_id`, `style_name`, `style_copyright`, `style_active`, `template_id`, `theme_id`, `imageset_id`) VALUES
(1, 'prosilver', '© phpBB Group', 0, 1, 1, 1),
(6, 'Alpha', '© 2013 Lacey Sutton (http://www.dinosaurfact.net)', 1, 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_styles_imageset`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `imageset_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `imageset_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `imageset_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data for table `phpbb_styles_imageset`
--

INSERT INTO `phpbb_styles_imageset` (`imageset_id`, `imageset_name`, `imageset_copyright`, `imageset_path`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver'),
(5, 'Alpha', '&copy; 2013 Lacey Sutton (http://www.dinosaurfact.net)', 'Alpha');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_styles_imageset_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_filename` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `image_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `imageset_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=391 ;

--
-- Dumping data for table `phpbb_styles_imageset_data`
--

INSERT INTO `phpbb_styles_imageset_data` (`image_id`, `image_name`, `image_filename`, `image_lang`, `image_height`, `image_width`, `imageset_id`) VALUES
(1, 'site_logo', 'site_logo.gif', '', 52, 139, 1),
(2, 'forum_link', 'forum_link.gif', '', 27, 27, 1),
(3, 'forum_read', 'forum_read.gif', '', 27, 27, 1),
(4, 'forum_read_locked', 'forum_read_locked.gif', '', 27, 27, 1),
(5, 'forum_read_subforum', 'forum_read_subforum.gif', '', 27, 27, 1),
(6, 'forum_unread', 'forum_unread.gif', '', 27, 27, 1),
(7, 'forum_unread_locked', 'forum_unread_locked.gif', '', 27, 27, 1),
(8, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 27, 27, 1),
(9, 'topic_moved', 'topic_moved.gif', '', 27, 27, 1),
(10, 'topic_read', 'topic_read.gif', '', 27, 27, 1),
(11, 'topic_read_mine', 'topic_read_mine.gif', '', 27, 27, 1),
(12, 'topic_read_hot', 'topic_read_hot.gif', '', 27, 27, 1),
(13, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 27, 27, 1),
(14, 'topic_read_locked', 'topic_read_locked.gif', '', 27, 27, 1),
(15, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 27, 27, 1),
(16, 'topic_unread', 'topic_unread.gif', '', 27, 27, 1),
(17, 'topic_unread_mine', 'topic_unread_mine.gif', '', 27, 27, 1),
(18, 'topic_unread_hot', 'topic_unread_hot.gif', '', 27, 27, 1),
(19, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 27, 27, 1),
(20, 'topic_unread_locked', 'topic_unread_locked.gif', '', 27, 27, 1),
(21, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 27, 27, 1),
(22, 'sticky_read', 'sticky_read.gif', '', 27, 27, 1),
(23, 'sticky_read_mine', 'sticky_read_mine.gif', '', 27, 27, 1),
(24, 'sticky_read_locked', 'sticky_read_locked.gif', '', 27, 27, 1),
(25, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 27, 27, 1),
(26, 'sticky_unread', 'sticky_unread.gif', '', 27, 27, 1),
(27, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 27, 27, 1),
(28, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 27, 27, 1),
(29, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 27, 27, 1),
(30, 'announce_read', 'announce_read.gif', '', 27, 27, 1),
(31, 'announce_read_mine', 'announce_read_mine.gif', '', 27, 27, 1),
(32, 'announce_read_locked', 'announce_read_locked.gif', '', 27, 27, 1),
(33, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 1),
(34, 'announce_unread', 'announce_unread.gif', '', 27, 27, 1),
(35, 'announce_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 1),
(36, 'announce_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 1),
(37, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 1),
(38, 'global_read', 'announce_read.gif', '', 27, 27, 1),
(39, 'global_read_mine', 'announce_read_mine.gif', '', 27, 27, 1),
(40, 'global_read_locked', 'announce_read_locked.gif', '', 27, 27, 1),
(41, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 1),
(42, 'global_unread', 'announce_unread.gif', '', 27, 27, 1),
(43, 'global_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 1),
(44, 'global_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 1),
(45, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 1),
(46, 'pm_read', 'topic_read.gif', '', 27, 27, 1),
(47, 'pm_unread', 'topic_unread.gif', '', 27, 27, 1),
(48, 'icon_back_top', 'icon_back_top.gif', '', 11, 11, 1),
(49, 'icon_contact_aim', 'icon_contact_aim.gif', '', 20, 20, 1),
(50, 'icon_contact_email', 'icon_contact_email.gif', '', 20, 20, 1),
(51, 'icon_contact_icq', 'icon_contact_icq.gif', '', 20, 20, 1),
(52, 'icon_contact_jabber', 'icon_contact_jabber.gif', '', 20, 20, 1),
(53, 'icon_contact_msnm', 'icon_contact_msnm.gif', '', 20, 20, 1),
(54, 'icon_contact_www', 'icon_contact_www.gif', '', 20, 20, 1),
(55, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', '', 20, 20, 1),
(56, 'icon_post_delete', 'icon_post_delete.gif', '', 20, 20, 1),
(57, 'icon_post_info', 'icon_post_info.gif', '', 20, 20, 1),
(58, 'icon_post_report', 'icon_post_report.gif', '', 20, 20, 1),
(59, 'icon_post_target', 'icon_post_target.gif', '', 9, 11, 1),
(60, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 11, 1),
(61, 'icon_topic_attach', 'icon_topic_attach.gif', '', 10, 7, 1),
(62, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 11, 1),
(63, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 11, 1),
(64, 'icon_topic_reported', 'icon_topic_reported.gif', '', 14, 16, 1),
(65, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 14, 16, 1),
(66, 'icon_user_warn', 'icon_user_warn.gif', '', 20, 20, 1),
(67, 'subforum_read', 'subforum_read.gif', '', 9, 11, 1),
(68, 'subforum_unread', 'subforum_unread.gif', '', 9, 11, 1),
(69, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 20, 28, 1),
(70, 'icon_post_edit', 'icon_post_edit.gif', 'en', 20, 42, 1),
(71, 'icon_post_quote', 'icon_post_quote.gif', 'en', 20, 54, 1),
(72, 'icon_user_online', 'icon_user_online.gif', 'en', 58, 58, 1),
(73, 'button_pm_forward', 'button_pm_forward.gif', 'en', 25, 96, 1),
(74, 'button_pm_new', 'button_pm_new.gif', 'en', 25, 84, 1),
(75, 'button_pm_reply', 'button_pm_reply.gif', 'en', 25, 96, 1),
(76, 'button_topic_locked', 'button_topic_locked.gif', 'en', 25, 88, 1),
(77, 'button_topic_new', 'button_topic_new.gif', 'en', 25, 96, 1),
(78, 'button_topic_reply', 'button_topic_reply.gif', 'en', 25, 96, 1),
(313, 'site_logo', 'logo.png', '', 0, 0, 5),
(314, 'forum_link', 'forum_link.gif', '', 27, 27, 5),
(315, 'forum_read', 'forum_read.gif', '', 27, 27, 5),
(316, 'forum_read_locked', 'forum_read_locked.gif', '', 27, 27, 5),
(317, 'forum_read_subforum', 'forum_read_subforum.gif', '', 27, 27, 5),
(318, 'forum_unread', 'forum_unread.gif', '', 27, 27, 5),
(319, 'forum_unread_locked', 'forum_unread_locked.gif', '', 27, 27, 5),
(320, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 27, 27, 5),
(321, 'topic_moved', 'topic_moved.gif', '', 27, 27, 5),
(322, 'topic_read', 'topic_read.gif', '', 27, 27, 5),
(323, 'topic_read_mine', 'topic_read_mine.gif', '', 27, 27, 5),
(324, 'topic_read_hot', 'topic_read_hot.gif', '', 27, 27, 5),
(325, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 27, 27, 5),
(326, 'topic_read_locked', 'topic_read_locked.gif', '', 27, 27, 5),
(327, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 27, 27, 5),
(328, 'topic_unread', 'topic_unread.gif', '', 27, 27, 5),
(329, 'topic_unread_mine', 'topic_unread_mine.gif', '', 27, 27, 5),
(330, 'topic_unread_hot', 'topic_unread_hot.gif', '', 27, 27, 5),
(331, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 27, 27, 5),
(332, 'topic_unread_locked', 'topic_unread_locked.gif', '', 27, 27, 5),
(333, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 27, 27, 5),
(334, 'sticky_read', 'sticky_read.gif', '', 27, 27, 5),
(335, 'sticky_read_mine', 'sticky_read_mine.gif', '', 27, 27, 5),
(336, 'sticky_read_locked', 'sticky_read_locked.gif', '', 27, 27, 5),
(337, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 27, 27, 5),
(338, 'sticky_unread', 'sticky_unread.gif', '', 27, 27, 5),
(339, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 27, 27, 5),
(340, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 27, 27, 5),
(341, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 27, 27, 5),
(342, 'announce_read', 'announce_read.gif', '', 27, 27, 5),
(343, 'announce_read_mine', 'announce_read_mine.gif', '', 27, 27, 5),
(344, 'announce_read_locked', 'announce_read_locked.gif', '', 27, 27, 5),
(345, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 5),
(346, 'announce_unread', 'announce_unread.gif', '', 27, 27, 5),
(347, 'announce_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 5),
(348, 'announce_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 5),
(349, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 5),
(350, 'global_read', 'announce_read.gif', '', 27, 27, 5),
(351, 'global_read_mine', 'announce_read_mine.gif', '', 27, 27, 5),
(352, 'global_read_locked', 'announce_read_locked.gif', '', 27, 27, 5),
(353, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 5),
(354, 'global_unread', 'announce_unread.gif', '', 27, 27, 5),
(355, 'global_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 5),
(356, 'global_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 5),
(357, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 5),
(358, 'subforum_read', 'subforum_read.gif', '', 9, 11, 5),
(359, 'subforum_unread', 'subforum_unread.gif', '', 9, 11, 5),
(360, 'pm_read', 'topic_read.gif', '', 27, 27, 5),
(361, 'pm_unread', 'topic_unread.gif', '', 27, 27, 5),
(362, 'icon_back_top', 'icon_back_top.gif', '', 11, 11, 5),
(363, 'icon_contact_aim', 'icon_contact_aim.gif', '', 20, 20, 5),
(364, 'icon_contact_email', 'icon_contact_email.gif', '', 20, 20, 5),
(365, 'icon_contact_icq', 'icon_contact_icq.gif', '', 20, 20, 5),
(366, 'icon_contact_jabber', 'icon_contact_jabber.gif', '', 20, 20, 5),
(367, 'icon_contact_msnm', 'icon_contact_msnm.gif', '', 20, 20, 5),
(368, 'icon_contact_www', 'icon_contact_www.gif', '', 20, 20, 5),
(369, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', '', 20, 20, 5),
(370, 'icon_post_delete', 'icon_post_delete.gif', '', 20, 20, 5),
(371, 'icon_post_info', 'icon_post_info.gif', '', 20, 20, 5),
(372, 'icon_post_report', 'icon_post_report.gif', '', 20, 20, 5),
(373, 'icon_post_target', 'icon_post_target.gif', '', 9, 11, 5),
(374, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 11, 5),
(375, 'icon_topic_attach', 'icon_topic_attach.gif', '', 10, 7, 5),
(376, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 11, 5),
(377, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 11, 5),
(378, 'icon_topic_reported', 'icon_topic_reported.gif', '', 14, 16, 5),
(379, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 14, 16, 5),
(380, 'icon_user_warn', 'icon_user_warn.gif', '', 20, 20, 5),
(381, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 20, 28, 5),
(382, 'icon_post_edit', 'icon_post_edit.gif', 'en', 20, 42, 5),
(383, 'icon_post_quote', 'icon_post_quote.gif', 'en', 20, 54, 5),
(384, 'icon_user_online', 'icon_user_online.gif', 'en', 58, 58, 5),
(385, 'button_pm_forward', 'button_pm_forward.gif', 'en', 25, 96, 5),
(386, 'button_pm_new', 'button_pm_new.gif', 'en', 25, 96, 5),
(387, 'button_pm_reply', 'button_pm_reply.gif', 'en', 25, 96, 5),
(388, 'button_topic_locked', 'button_topic_locked.gif', 'en', 25, 96, 5),
(389, 'button_topic_new', 'button_topic_new.gif', 'en', 25, 96, 5),
(390, 'button_topic_reply', 'button_topic_reply.gif', 'en', 25, 96, 5);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_styles_template`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_inherits_id` int(4) unsigned NOT NULL DEFAULT '0',
  `template_inherit_path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data for table `phpbb_styles_template`
--

INSERT INTO `phpbb_styles_template` (`template_id`, `template_name`, `template_copyright`, `template_path`, `bbcode_bitfield`, `template_storedb`, `template_inherits_id`, `template_inherit_path`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver', 'lNg=', 0, 0, ''),
(5, 'Alpha', '&copy; 2013 Lacey Sutton (http://www.dinosaurfact.net)', 'Alpha', 'lNg=', 0, 1, 'prosilver');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_styles_template_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template_filename` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_included` text COLLATE utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `template_data` mediumtext COLLATE utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_styles_theme`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_storedb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `theme_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data for table `phpbb_styles_theme`
--

INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver', 1, 1388055954, '/*  phpBB3 Style Sheet\n    --------------------------------------------------------------\n	Style name:			prosilver (the default phpBB 3.0.x style)\n	Based on style:		\n	Original author:	Tom Beddard ( http://www.subblue.com/ )\n	Modified by:		phpBB Group ( https://www.phpbb.com/ )\n    --------------------------------------------------------------\n*/\n\n/* General Markup Styles\n---------------------------------------- */\n\n* {\n	/* Reset browsers default margin, padding and font sizes */\n	margin: 0;\n	padding: 0;\n}\n\nhtml {\n	font-size: 100%;\n	/* Always show a scrollbar for short pages - stops the jump when the scrollbar appears. non-IE browsers */\n	height: 101%;\n}\n\nbody {\n	/* Text-Sizing with ems: http://www.clagnut.com/blog/348/ */\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	color: #828282;\n	background-color: #FFFFFF;\n	/*font-size: 62.5%;			 This sets the default font size to be equivalent to 10px */\n	font-size: 10px;\n	margin: 0;\n	padding: 12px 0;\n}\n\nh1 {\n	/* Forum name */\n	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;\n	margin-right: 200px;\n	color: #FFFFFF;\n	margin-top: 15px;\n	font-weight: bold;\n	font-size: 2em;\n}\n\nh2 {\n	/* Forum header titles */\n	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;\n	font-weight: normal;\n	color: #3f3f3f;\n	font-size: 2em;\n	margin: 0.8em 0 0.2em 0;\n}\n\nh2.solo {\n	margin-bottom: 1em;\n}\n\nh3 {\n	/* Sub-headers (also used as post headers, but defined later) */\n	font-family: Arial, Helvetica, sans-serif;\n	font-weight: bold;\n	text-transform: uppercase;\n	border-bottom: 1px solid #CCCCCC;\n	margin-bottom: 3px;\n	padding-bottom: 2px;\n	font-size: 1.05em;\n	color: #989898;\n	margin-top: 20px;\n}\n\nh4 {\n	/* Forum and topic list titles */\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, Sans-serif;\n	font-size: 1.3em;\n}\n\np {\n	line-height: 1.3em;\n	font-size: 1.1em;\n	margin-bottom: 1.5em;\n}\n\nimg {\n	border-width: 0;\n}\n\nhr {\n	/* Also see tweaks.css */\n	border: 0 none #FFFFFF;\n	border-top: 1px solid #CCCCCC;\n	height: 1px;\n	margin: 5px 0;\n	display: block;\n	clear: both;\n}\n\nhr.dashed {\n	border-top: 1px dashed #CCCCCC;\n	margin: 10px 0;\n}\n\nhr.divider {\n	display: none;\n}\n\np.right {\n	text-align: right;\n}\n\n/* Main blocks\n---------------------------------------- */\n#wrap {\n	padding: 0 20px;\n	min-width: 650px;\n}\n\n#simple-wrap {\n	padding: 6px 10px;\n}\n\n#page-body {\n	margin: 4px 0;\n	clear: both;\n}\n\n#page-footer {\n	clear: both;\n}\n\n#page-footer h3 {\n	margin-top: 20px;\n}\n\n#logo {\n	float: left;\n	width: auto;\n	padding: 10px 13px 0 10px;\n}\n\na#logo:hover {\n	text-decoration: none;\n}\n\n/* Search box\n--------------------------------------------- */\n#search-box {\n	color: #FFFFFF;\n	position: relative;\n	margin-top: 30px;\n	margin-right: 5px;\n	display: block;\n	float: right;\n	text-align: right;\n	white-space: nowrap; /* For Opera */\n}\n\n#search-box #keywords {\n	width: 95px;\n	background-color: #FFF;\n}\n\n#search-box input {\n	border: 1px solid #b0b0b0;\n}\n\n/* .button1 style defined later, just a few tweaks for the search button version */\n#search-box input.button1 {\n	padding: 1px 5px;\n}\n\n#search-box li {\n	text-align: right;\n	margin-top: 4px;\n}\n\n#search-box img {\n	vertical-align: middle;\n	margin-right: 3px;\n}\n\n/* Site description and logo */\n#site-description {\n	float: left;\n	width: 70%;\n}\n\n#site-description h1 {\n	margin-right: 0;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background: #ebebeb none repeat-x 0 0;\n	color: #FFFFFF;\n	margin-bottom: 4px;\n	padding: 0 5px;\n}\n\n.navbar {\n	background-color: #ebebeb;\n	padding: 0 10px;\n}\n\n.forabg {\n	background: #b1b1b1 none repeat-x 0 0;\n	margin-bottom: 4px;\n	padding: 0 5px;\n	clear: both;\n}\n\n.forumbg {\n	background: #ebebeb none repeat-x 0 0;\n	margin-bottom: 4px;\n	padding: 0 5px;\n	clear: both;\n}\n\n.panel {\n	margin-bottom: 4px;\n	padding: 0 10px;\n	background-color: #f3f3f3;\n	color: #3f3f3f;\n}\n\n.post {\n	padding: 0 10px;\n	margin-bottom: 4px;\n	background-repeat: no-repeat;\n	background-position: 100% 0;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #f7f7f7;}\n.bg2	{ background-color: #f2f2f2; }\n.bg3	{ background-color: #ebebeb; }\n\n.rowbg {\n	margin: 5px 5px 2px 5px;\n}\n\n.ucprowbg {\n	background-color: #e2e2e2;\n}\n\n.fieldsbg {\n	/*border: 1px #DBDEE2 solid;*/\n	background-color: #eaeaea;\n}\n\nspan.corners-top, span.corners-bottom, span.corners-top span, span.corners-bottom span {\n	font-size: 1px;\n	line-height: 1px;\n	display: block;\n	height: 5px;\n	background-repeat: no-repeat;\n}\n\nspan.corners-top {\n	background-image: none;\n	background-position: 0 0;\n	margin: 0 -5px;\n}\n\nspan.corners-top span {\n	background-image: none;\n	background-position: 100% 0;\n}\n\nspan.corners-bottom {\n	background-image: none;\n	background-position: 0 100%;\n	margin: 0 -5px;\n	clear: both;\n}\n\nspan.corners-bottom span {\n	background-image: none;\n	background-position: 100% 100%;\n}\n\n.headbg span.corners-bottom {\n	margin-bottom: -1px;\n}\n\n.post span.corners-top, .post span.corners-bottom, .panel span.corners-top, .panel span.corners-bottom, .navbar span.corners-top, .navbar span.corners-bottom {\n	margin: 0 -10px;\n}\n\n.rules span.corners-top {\n	margin: 0 -10px 5px -10px;\n}\n\n.rules span.corners-bottom {\n	margin: 5px -10px 0 -10px;\n}\n\n/* Horizontal lists\n----------------------------------------*/\nul.linklist {\n	display: block;\n	margin: 0;\n}\n\nul.linklist li {\n	display: block;\n	list-style-type: none;\n	float: left;\n	width: auto;\n	margin-right: 5px;\n	font-size: 1.1em;\n	line-height: 2.2em;\n}\n\nul.linklist li.rightside, p.rightside {\n	float: right;\n	margin-right: 0;\n	margin-left: 5px;\n	text-align: right;\n}\n\nul.navlinks {\n	padding-bottom: 1px;\n	margin-bottom: 1px;\n	border-bottom: 1px solid #FFFFFF;\n	font-weight: bold;\n}\n\nul.leftside {\n	float: left;\n	margin-left: 0;\n	margin-right: 5px;\n	text-align: left;\n}\n\nul.rightside {\n	float: right;\n	margin-left: 5px;\n	margin-right: -5px;\n	text-align: right;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 {\n	/* See tweaks.css */\n}\n\n#ucp-main table.table1 {\n	padding: 2px;\n}\n\ntable.table1 thead th {\n	font-weight: normal;\n	text-transform: uppercase;\n	color: #FFFFFF;\n	line-height: 1.3em;\n	font-size: 1em;\n	padding: 0 0 4px 3px;\n}\n\ntable.table1 thead th span {\n	padding-left: 7px;\n}\n\ntable.table1 tbody tr {\n	border: 1px solid #cfcfcf;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #f6f6f6;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #6a6a6a;\n	font-size: 1.1em;\n}\n\ntable.table1 tbody td {\n	padding: 5px;\n	border-top: 1px solid #FAFAFA;\n}\n\ntable.table1 tbody th {\n	padding: 5px;\n	border-bottom: 1px solid #000000;\n	text-align: left;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\n/* Specific column styles */\ntable.table1 .name		{ text-align: left; }\ntable.table1 .posts		{ text-align: center !important; width: 7%; }\ntable.table1 .joined	{ text-align: left; width: 15%; }\ntable.table1 .active	{ text-align: left; width: 15%; }\ntable.table1 .mark		{ text-align: center; width: 7%; }\ntable.table1 .info		{ text-align: left; width: 30%; }\ntable.table1 .info div	{ width: 100%; white-space: normal; overflow: hidden; }\ntable.table1 .autocol	{ line-height: 2em; white-space: nowrap; }\ntable.table1 thead .autocol { padding-left: 1em; }\n\ntable.table1 span.rank-img {\n	float: right;\n	width: auto;\n}\n\ntable.info td {\n	padding: 3px;\n}\n\ntable.info tbody th {\n	padding: 3px;\n	text-align: right;\n	vertical-align: top;\n	color: #000000;\n	font-weight: normal;\n}\n\n.forumbg table.table1 {\n	margin: 0;\n}\n\n.forumbg-table > .inner {\n	margin: 0 -1px;\n}\n\n.forumbg-table > .inner > span.corners-top {\n	margin: 0 -4px -1px -4px;\n}\n\n.forumbg-table > .inner > span.corners-bottom {\n	margin: -1px -4px 0 -4px;\n}\n\n/* Misc layout styles\n---------------------------------------- */\n/* column[1-2] styles are containers for two column layouts \n   Also see tweaks.css */\n.column1 {\n	float: left;\n	clear: left;\n	width: 49%;\n}\n\n.column2 {\n	float: right;\n	clear: right;\n	width: 49%;\n}\n\n/* General classes for placing floating blocks */\n.left-box {\n	float: left;\n	width: auto;\n	text-align: left;\n}\n\n.right-box {\n	float: right;\n	width: auto;\n	text-align: right;\n}\n\ndl.details {\n	/*font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;*/\n	font-size: 1.1em;\n}\n\ndl.details dt {\n	float: left;\n	clear: left;\n	width: 30%;\n	text-align: right;\n	color: #000000;\n	display: block;\n}\n\ndl.details dd {\n	margin-left: 0;\n	padding-left: 5px;\n	margin-bottom: 5px;\n	color: #828282;\n	float: left;\n	width: 65%;\n}\n\n/* Pagination\n---------------------------------------- */\n.pagination {\n	height: 1%; /* IE tweak (holly hack) */\n	width: auto;\n	text-align: right;\n	margin-top: 5px;\n	float: right;\n}\n\n.pagination span.page-sep {\n	display: none;\n}\n\nli.pagination {\n	margin-top: 0;\n}\n\n.pagination strong, .pagination b {\n	font-weight: normal;\n}\n\n.pagination span strong {\n	padding: 0 2px;\n	margin: 0 2px;\n	font-weight: normal;\n	color: #FFFFFF;\n	background-color: #bfbfbf;\n	border: 1px solid #bfbfbf;\n	font-size: 0.9em;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\n	font-weight: normal;\n	text-decoration: none;\n	color: #747474;\n	margin: 0 2px;\n	padding: 0 2px;\n	background-color: #eeeeee;\n	border: 1px solid #bababa;\n	font-size: 0.9em;\n	line-height: 1.5em;\n}\n\n.pagination span a:hover {\n	border-color: #d2d2d2;\n	background-color: #d2d2d2;\n	color: #FFF;\n	text-decoration: none;\n}\n\n.pagination img {\n	vertical-align: middle;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	display: block;\n	float: right;\n	width: auto;\n	margin-top: 0;\n	padding: 1px 0 1px 15px;\n	font-size: 0.9em;\n	background: none 0 50% no-repeat;\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #d2d2d2;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n#forum-permissions {\n	float: right;\n	width: auto;\n	padding-left: 5px;\n	margin-left: 5px;\n	margin-top: 10px;\n	text-align: right;\n}\n\n.copyright {\n	padding: 5px;\n	text-align: center;\n	color: #555555;\n}\n\n.small {\n	font-size: 0.9em !important;\n}\n\n.titlespace {\n	margin-bottom: 15px;\n}\n\n.headerspace {\n	margin-top: 20px;\n}\n\n.error {\n	color: #bcbcbc;\n	font-weight: bold;\n	font-size: 1em;\n}\n\n.reported {\n	background-color: #f7f7f7;\n}\n\nli.reported:hover {\n	background-color: #ececec;\n}\n\ndiv.rules {\n	background-color: #ececec;\n	color: #bcbcbc;\n	padding: 0 10px;\n	margin: 10px 0;\n	font-size: 1.1em;\n}\n\ndiv.rules ul, div.rules ol {\n	margin-left: 20px;\n}\n\np.rules {\n	background-color: #ececec;\n	background-image: none;\n	padding: 5px;\n}\n\np.rules img {\n	vertical-align: middle;\n	padding-top: 5px;\n}\n\np.rules a {\n	vertical-align: middle;\n	clear: both;\n}\n\n#top {\n	position: absolute;\n	top: -20px;\n}\n\n.clear {\n	display: block;\n	clear: both;\n	font-size: 1px;\n	line-height: 1px;\n	background: transparent;\n}\n/* Link Styles\n---------------------------------------- */\n\n/* Links adjustment to correctly display an order of rtl/ltr mixed content */\na {\n	direction: ltr;\n	unicode-bidi: embed;\n}\n\na:link	{ color: #898989; text-decoration: none; }\na:visited	{ color: #898989; text-decoration: none; }\na:hover	{ color: #d3d3d3; text-decoration: underline; }\na:active	{ color: #d2d2d2; text-decoration: none; }\n\n/* Coloured usernames */\n.username-coloured {\n	font-weight: bold;\n	display: inline !important;\n	padding: 0 !important;\n}\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n	text-decoration: none;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n	text-decoration: none;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #ffffff;\n	text-decoration: underline;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #ffffff;\n	text-decoration: none;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	font-family: "Trebuchet MS", Helvetica, Arial, Sans-serif;\n	font-size: 1.2em;\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n/* a.forumtitle:visited { color: #898989; } */\n\na.forumtitle:hover {\n	color: #bcbcbc;\n	text-decoration: underline;\n}\n\na.forumtitle:active {\n	color: #898989;\n}\n\na.topictitle {\n	font-family: "Trebuchet MS", Helvetica, Arial, Sans-serif;\n	font-size: 1.2em;\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n/* a.topictitle:visited { color: #d2d2d2; } */\n\na.topictitle:hover {\n	color: #bcbcbc;\n	text-decoration: underline;\n}\n\na.topictitle:active {\n	color: #898989;\n}\n\n/* Post body links */\n.postlink {\n	text-decoration: none;\n	color: #d2d2d2;\n	border-bottom: 1px solid #d2d2d2;\n	padding-bottom: 0;\n}\n\n/* .postlink:visited { color: #bdbdbd; } */\n\n.postlink:active {\n	color: #d2d2d2;\n}\n\n.postlink:hover {\n	background-color: #f6f6f6;\n	text-decoration: none;\n	color: #404040;\n}\n\n.signature a, .signature a:visited, .signature a:hover, .signature a:active {\n	border: none;\n	text-decoration: underline;\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:visited, .postprofile dt.author a {\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	text-decoration: underline;\n	color: #d3d3d3;\n}\n\n/* CSS spec requires a:link, a:visited, a:hover and a:active rules to be specified in this order. */\n/* See http://www.phpbb.com/bugs/phpbb3/59685 */\n.postprofile a:active {\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #898989;\n	text-decoration: none; \n	font-weight: normal;\n}\n\n.search .postprofile a:hover {\n	color: #d3d3d3;\n	text-decoration: underline; \n}\n\n/* Back to top of page */\n.back2top {\n	clear: both;\n	height: 11px;\n	text-align: right;\n}\n\na.top {\n	background: none no-repeat top left;\n	text-decoration: none;\n	width: {IMG_ICON_BACK_TOP_WIDTH}px;\n	height: {IMG_ICON_BACK_TOP_HEIGHT}px;\n	display: block;\n	float: right;\n	overflow: hidden;\n	letter-spacing: 1000px;\n	text-indent: 11px;\n}\n\na.top2 {\n	background: none no-repeat 0 50%;\n	text-decoration: none;\n	padding-left: 15px;\n}\n\n/* Arrow links  */\na.up		{ background: none no-repeat left center; }\na.down		{ background: none no-repeat right center; }\na.left		{ background: none no-repeat 3px 60%; }\na.right		{ background: none no-repeat 95% 60%; }\n\na.up, a.up:link, a.up:active, a.up:visited {\n	padding-left: 10px;\n	text-decoration: none;\n	border-bottom-width: 0;\n}\n\na.up:hover {\n	background-position: left top;\n	background-color: transparent;\n}\n\na.down, a.down:link, a.down:active, a.down:visited {\n	padding-right: 10px;\n}\n\na.down:hover {\n	background-position: right bottom;\n	text-decoration: none;\n}\n\na.left, a.left:active, a.left:visited {\n	padding-left: 12px;\n}\n\na.left:hover {\n	color: #d2d2d2;\n	text-decoration: none;\n	background-position: 0 60%;\n}\n\na.right, a.right:active, a.right:visited {\n	padding-right: 12px;\n}\n\na.right:hover {\n	color: #d2d2d2;\n	text-decoration: none;\n	background-position: 100% 60%;\n}\n\n/* invisible skip link, used for accessibility  */\n.skiplink {\n	position: absolute;\n	left: -999px;\n	width: 990px;\n}\n\n/* Feed icon in forumlist_body.html */\na.feed-icon-forum {\n	float: right;\n	margin: 3px;\n}\n/* Content Styles\n---------------------------------------- */\n\nul.topiclist {\n	display: block;\n	list-style-type: none;\n	margin: 0;\n}\n\nul.forums {\n	background: #f9f9f9 none repeat-x 0 0;\n}\n\nul.topiclist li {\n	display: block;\n	list-style-type: none;\n	color: #777777;\n	margin: 0;\n}\n\nul.topiclist dl {\n	position: relative;\n}\n\nul.topiclist li.row dl {\n	padding: 2px 0;\n}\n\nul.topiclist dt {\n	display: block;\n	float: left;\n	width: 50%;\n	font-size: 1.1em;\n	padding-left: 5px;\n	padding-right: 5px;\n}\n\nul.topiclist dd {\n	display: block;\n	float: left;\n	border-left: 1px solid #FFFFFF;\n	padding: 4px 0;\n}\n\nul.topiclist dfn {\n	/* Labels for post/view counts */\n	position: absolute;\n	left: -999px;\n	width: 990px;\n}\n\nul.topiclist li.row dt a.subforum {\n	background-image: none;\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	position: relative;\n	white-space: nowrap;\n	padding: 0 0 0 12px;\n}\n\n.forum-image {\n	float: left;\n	padding-top: 5px;\n	margin-right: 5px;\n}\n\nli.row {\n	border-top: 1px solid #FFFFFF;\n	border-bottom: 1px solid #8f8f8f;\n}\n\nli.row strong {\n	font-weight: normal;\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #f6f6f6;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\nli.header dt, li.header dd {\n	line-height: 1em;\n	border-left-width: 0;\n	margin: 2px 0 4px 0;\n	color: #FFFFFF;\n	padding-top: 2px;\n	padding-bottom: 2px;\n	font-size: 1em;\n	font-family: Arial, Helvetica, sans-serif;\n	text-transform: uppercase;\n}\n\nli.header dt {\n	font-weight: bold;\n}\n\nli.header dd {\n	margin-left: 1px;\n}\n\nli.header dl.icon {\n	min-height: 0;\n}\n\nli.header dl.icon dt {\n	/* Tweak for headers alignment when folder icon used */\n	padding-left: 0;\n	padding-right: 50px;\n}\n\n/* Forum list column styles */\ndl.icon {\n	min-height: 35px;\n	background-position: 10px 50%;		/* Position of folder icon */\n	background-repeat: no-repeat;\n}\n\ndl.icon dt {\n	padding-left: 45px;					/* Space for folder icon */\n	background-repeat: no-repeat;\n	background-position: 5px 95%;		/* Position of topic icon */\n}\n\ndd.posts, dd.topics, dd.views {\n	width: 8%;\n	text-align: center;\n	line-height: 2.2em;\n	font-size: 1.2em;\n}\n\n/* List in forum description */\ndl.icon dt ol,\ndl.icon dt ul {\n	list-style-position: inside;\n	margin-left: 1em;\n}\n\ndl.icon dt li {\n	display: list-item;\n	list-style-type: inherit;\n}\n\ndd.lastpost {\n	width: 25%;\n	font-size: 1.1em;\n}\n\ndd.redirect {\n	font-size: 1.1em;\n	line-height: 2.5em;\n}\n\ndd.moderation {\n	font-size: 1.1em;\n}\n\ndd.lastpost span, ul.topiclist dd.searchby span, ul.topiclist dd.info span, ul.topiclist dd.time span, dd.redirect span, dd.moderation span {\n	display: block;\n	padding-left: 5px;\n}\n\ndd.time {\n	width: auto;\n	line-height: 200%;\n	font-size: 1.1em;\n}\n\ndd.extra {\n	width: 12%;\n	line-height: 200%;\n	text-align: center;\n	font-size: 1.1em;\n}\n\ndd.mark {\n	float: right !important;\n	width: 9%;\n	text-align: center;\n	line-height: 200%;\n	font-size: 1.2em;\n}\n\ndd.info {\n	width: 30%;\n}\n\ndd.option {\n	width: 15%;\n	line-height: 200%;\n	text-align: center;\n	font-size: 1.1em;\n}\n\ndd.searchby {\n	width: 47%;\n	font-size: 1.1em;\n	line-height: 1em;\n}\n\nul.topiclist dd.searchextra {\n	margin-left: 5px;\n	padding: 0.2em 0;\n	font-size: 1.1em;\n	color: #333333;\n	border-left: none;\n	clear: both;\n	width: 98%;\n	overflow: hidden;\n}\n\n/* Container for post/reply buttons and pagination */\n.topic-actions {\n	margin-bottom: 3px;\n	font-size: 1.1em;\n	height: 28px;\n	min-height: 28px;\n}\ndiv[class].topic-actions {\n	height: auto;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	padding: 0;\n	line-height: 1.48em;\n	color: #333333;\n	width: 76%;\n	float: right;\n	clear: both;\n}\n\n.postbody .ignore {\n	font-size: 1.1em;\n}\n\n.postbody h3.first {\n	/* The first post on the page uses this */\n	font-size: 1.7em;\n}\n\n.postbody h3 {\n	/* Postbody requires a different h3 format - so change it here */\n	font-size: 1.5em;\n	padding: 2px 0 0 0;\n	margin: 0 0 0.3em 0 !important;\n	text-transform: none;\n	border: none;\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	line-height: 125%;\n}\n\n.postbody h3 img {\n	/* Also see tweaks.css */\n	vertical-align: bottom;\n}\n\n.postbody .content {\n	font-size: 1.3em;\n}\n\n.search .postbody {\n	width: 68%\n}\n\n/* Topic review panel\n----------------------------------------*/\n#review {\n	margin-top: 2em;\n}\n\n#topicreview {\n	padding-right: 5px;\n	overflow: auto;\n	height: 300px;\n}\n\n#topicreview .postbody {\n	width: auto;\n	float: none;\n	margin: 0;\n	height: auto;\n}\n\n#topicreview .post {\n	height: auto;\n}\n\n#topicreview h2 {\n	border-bottom-width: 0;\n}\n\n.post-ignore .postbody {\n	display: none;\n}\n\n/* MCP Post details\n----------------------------------------*/\n#post_details\n{\n	/* This will only work in IE7+, plus the others */\n	overflow: auto;\n	max-height: 300px;\n}\n\n#expand\n{\n	clear: both;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	min-height: 3em;\n	overflow: hidden;\n	line-height: 1.4em;\n	font-family: "Lucida Grande", "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1em;\n	color: #333333;\n	padding-bottom: 1px;\n}\n\n.content h2, .panel h2 {\n	font-weight: normal;\n	color: #989898;\n	border-bottom: 1px solid #CCCCCC;\n	font-size: 1.6em;\n	margin-top: 0.5em;\n	margin-bottom: 0.5em;\n	padding-bottom: 0.5em;\n}\n\n.panel h3 {\n	margin: 0.5em 0;\n}\n\n.panel p {\n	font-size: 1.2em;\n	margin-bottom: 1em;\n	line-height: 1.4em;\n}\n\n.content p {\n	font-family: "Lucida Grande", "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.2em;\n	margin-bottom: 1em;\n	line-height: 1.4em;\n}\n\ndl.faq {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n	margin-top: 1em;\n	margin-bottom: 2em;\n	line-height: 1.4em;\n}\n\ndl.faq dt {\n	font-weight: bold;\n	color: #333333;\n}\n\n.content dl.faq {\n	font-size: 1.2em;\n	margin-bottom: 0.5em;\n}\n\n.content li {\n	list-style-type: inherit;\n}\n\n.content ul, .content ol {\n	margin-bottom: 1em;\n	margin-left: 3em;\n}\n\n.posthilit {\n	background-color: #f3f3f3;\n	color: #BCBCBC;\n	padding: 0 2px 1px 2px;\n}\n\n.announce, .unreadpost {\n	/* Highlight the announcements & unread posts box */\n	border-left-color: #BCBCBC;\n	border-right-color: #BCBCBC;\n}\n\n/* Post author */\np.author {\n	margin: 0 15em 0.6em 0;\n	padding: 0 0 5px 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1em;\n	line-height: 1.2em;\n}\n\n/* Post signature */\n.signature {\n	margin-top: 1.5em;\n	padding-top: 0.2em;\n	font-size: 1.1em;\n	border-top: 1px solid #CCCCCC;\n	clear: left;\n	line-height: 140%;\n	overflow: hidden;\n	width: 100%;\n}\n\ndd .signature {\n	margin: 0;\n	padding: 0;\n	clear: none;\n	border: none;\n}\n\n.signature li {\n	list-style-type: inherit;\n}\n\n.signature ul, .signature ol {\n	margin-bottom: 1em;\n	margin-left: 3em;\n}\n\n/* Post noticies */\n.notice {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	width: auto;\n	margin-top: 1.5em;\n	padding-top: 0.2em;\n	font-size: 1em;\n	border-top: 1px dashed #CCCCCC;\n	clear: left;\n	line-height: 130%;\n}\n\n/* Jump to post link for now */\nul.searchresults {\n	list-style: none;\n	text-align: right;\n	clear: both;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background: #ebebeb none 6px 8px no-repeat;\n	border: 1px solid #dbdbdb;\n	font-size: 0.95em;\n	margin: 0.5em 1px 0 25px;\n	overflow: hidden;\n	padding: 5px;\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color: #bababa;\n	font-size: 1em;\n	margin: 0.5em 1px 0 15px;	\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #e4e4e4;\n}\n\nblockquote cite {\n	/* Username/source of quoter */\n	font-style: normal;\n	font-weight: bold;\n	margin-left: 20px;\n	display: block;\n	font-size: 0.9em;\n}\n\nblockquote cite cite {\n	font-size: 1em;\n}\n\nblockquote.uncited {\n	padding-top: 25px;\n}\n\n/* Code block */\ndl.codebox {\n	padding: 3px;\n	background-color: #FFFFFF;\n	border: 1px solid #d8d8d8;\n	font-size: 1em;\n}\n\ndl.codebox dt {\n	text-transform: uppercase;\n	border-bottom: 1px solid #CCCCCC;\n	margin-bottom: 3px;\n	font-size: 0.8em;\n	font-weight: bold;\n	display: block;\n}\n\nblockquote dl.codebox {\n	margin-left: 0;\n}\n\ndl.codebox code {\n	/* Also see tweaks.css */\n	overflow: auto;\n	display: block;\n	height: auto;\n	max-height: 200px;\n	white-space: normal;\n	padding-top: 5px;\n	font: 0.9em Monaco, "Andale Mono","Courier New", Courier, mono;\n	line-height: 1.3em;\n	color: #8b8b8b;\n	margin: 2px 0;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #000000; }\n.syntaxdefault	{ color: #bcbcbc; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #585858; }\n.syntaxstring	{ color: #a7a7a7; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	float: left;\n	width: auto; \n	margin: 5px 5px 5px 0;\n	padding: 6px;\n	background-color: #FFFFFF;\n	border: 1px dashed #d8d8d8;\n	clear: right;\n}\n\n.pm-message .attachbox {\n	background-color: #f3f3f3;\n}\n\n.attachbox dt {\n	font-family: Arial, Helvetica, sans-serif;\n	text-transform: uppercase;\n}\n\n.attachbox dd {\n	margin-top: 4px;\n	padding-top: 4px;\n	clear: left;\n	border-top: 1px solid #d8d8d8;\n}\n\n.attachbox dd dd {\n	border: none;\n}\n\n.attachbox p {\n	line-height: 110%;\n	color: #666666;\n	font-weight: normal;\n	clear: left;\n}\n\n.attachbox p.stats\n{\n	line-height: 110%;\n	color: #666666;\n	font-weight: normal;\n	clear: left;\n}\n\n.attach-image {\n	margin: 3px 0;\n	width: 100%;\n	max-height: 350px;\n	overflow: auto;\n}\n\n.attach-image img {\n	border: 1px solid #999999;\n/*	cursor: move; */\n	cursor: default;\n}\n\n/* Inline image thumbnails */\ndiv.inline-attachment dl.thumbnail, div.inline-attachment dl.file {\n	display: block;\n	margin-bottom: 4px;\n}\n\ndiv.inline-attachment p {\n	font-size: 100%;\n}\n\ndl.file {\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n	display: block;\n}\n\ndl.file dt {\n	text-transform: none;\n	margin: 0;\n	padding: 0;\n	font-weight: bold;\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n}\n\ndl.file dd {\n	color: #666666;\n	margin: 0;\n	padding: 0;	\n}\n\ndl.thumbnail img {\n	padding: 3px;\n	border: 1px solid #666666;\n	background-color: #FFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n	font-style: italic;\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n}\n\n.attachbox dl.thumbnail dd {\n	font-size: 100%;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border: 1px solid #d2d2d2;\n}\n\n/* Post poll styles\n----------------------------------------*/\nfieldset.polls {\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n}\n\nfieldset.polls dl {\n	margin-top: 5px;\n	border-top: 1px solid #e2e2e2;\n	padding: 5px 0 0 0;\n	line-height: 120%;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	font-weight: bold;\n	color: #000000;\n}\n\nfieldset.polls dt {\n	text-align: left;\n	float: left;\n	display: block;\n	width: 30%;\n	border-right: none;\n	padding: 0;\n	margin: 0;\n	font-size: 1.1em;\n}\n\nfieldset.polls dd {\n	float: left;\n	width: 10%;\n	border-left: none;\n	padding: 0 5px;\n	margin-left: 0;\n	font-size: 1.1em;\n}\n\nfieldset.polls dd.resultbar {\n	width: 50%;\n}\n\nfieldset.polls dd input {\n	margin: 2px 0;\n}\n\nfieldset.polls dd div {\n	text-align: right;\n	font-family: Arial, Helvetica, sans-serif;\n	color: #FFFFFF;\n	font-weight: bold;\n	padding: 0 2px;\n	overflow: visible;\n	min-width: 2%;\n}\n\n.pollbar1 {\n	background-color: #aaaaaa;\n	border-bottom: 1px solid #747474;\n	border-right: 1px solid #747474;\n}\n\n.pollbar2 {\n	background-color: #bebebe;\n	border-bottom: 1px solid #8c8c8c;\n	border-right: 1px solid #8c8c8c;\n}\n\n.pollbar3 {\n	background-color: #D1D1D1;\n	border-bottom: 1px solid #aaaaaa;\n	border-right: 1px solid #aaaaaa;\n}\n\n.pollbar4 {\n	background-color: #e4e4e4;\n	border-bottom: 1px solid #bebebe;\n	border-right: 1px solid #bebebe;\n}\n\n.pollbar5 {\n	background-color: #f8f8f8;\n	border-bottom: 1px solid #D1D1D1;\n	border-right: 1px solid #D1D1D1;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	/* Also see tweaks.css */\n	margin: 5px 0 10px 0;\n	min-height: 80px;\n	color: #666666;\n	border-left: 1px solid #FFFFFF;\n	width: 22%;\n	float: left;\n	display: inline;\n}\n.pm .postprofile {\n	border-right: 1px solid #DDDDDD;\n}\n\n.postprofile dd, .postprofile dt {\n	line-height: 1.2em;\n	margin-left: 8px;\n}\n\n.postprofile strong {\n	font-weight: normal;\n	color: #000000;\n}\n\n.avatar {\n	border: none;\n	margin-bottom: 3px;\n}\n\n.online {\n	background-image: none;\n	background-position: 100% 0;\n	background-repeat: no-repeat;\n}\n\n/* Poster profile used by search*/\n.search .postprofile {\n	width: 30%;\n}\n\n/* pm list in compose message if mass pm is enabled */\ndl.pmlist dt {\n	width: 60% !important;\n}\n\ndl.pmlist dt textarea {\n	width: 95%;\n}\n\ndl.pmlist dd {\n	margin-left: 61% !important;\n	margin-bottom: 2px;\n}\n/* Button Styles\n---------------------------------------- */\n\n/* Rollover buttons\n   Based on: http://wellstyled.com/css-nopreload-rollovers.html\n----------------------------------------*/\n.buttons {\n	float: left;\n	width: auto;\n	height: auto;\n}\n\n/* Rollover state */\n.buttons div {\n	float: left;\n	margin: 0 5px 0 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\n.buttons div a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n	position: relative;\n	overflow: hidden;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\n/*.buttons div span		{ display: none; }*/\n/*.buttons div a:hover	{ background-image: none; }*/\n.buttons div span			{ position: absolute; width: 100%; height: 100%; cursor: pointer;}\n.buttons div a:hover span	{ background-position: 0 100%; }\n\n/* Big button images */\n.reply-icon span	{ background: transparent none 0 0 no-repeat; }\n.post-icon span		{ background: transparent none 0 0 no-repeat; }\n.locked-icon span	{ background: transparent none 0 0 no-repeat; }\n.pmreply-icon span	{ background: none 0 0 no-repeat; }\n.newpm-icon span 	{ background: none 0 0 no-repeat; }\n.forwardpm-icon span 	{ background: none 0 0 no-repeat; }\n\n/* Set big button dimensions */\n.buttons div.reply-icon		{ width: {IMG_BUTTON_TOPIC_REPLY_WIDTH}px; height: {IMG_BUTTON_TOPIC_REPLY_HEIGHT}px; }\n.buttons div.post-icon		{ width: {IMG_BUTTON_TOPIC_NEW_WIDTH}px; height: {IMG_BUTTON_TOPIC_NEW_HEIGHT}px; }\n.buttons div.locked-icon	{ width: {IMG_BUTTON_TOPIC_LOCKED_WIDTH}px; height: {IMG_BUTTON_TOPIC_LOCKED_HEIGHT}px; }\n.buttons div.pmreply-icon	{ width: {IMG_BUTTON_PM_REPLY_WIDTH}px; height: {IMG_BUTTON_PM_REPLY_HEIGHT}px; }\n.buttons div.newpm-icon		{ width: {IMG_BUTTON_PM_NEW_WIDTH}px; height: {IMG_BUTTON_PM_NEW_HEIGHT}px; }\n.buttons div.forwardpm-icon	{ width: {IMG_BUTTON_PM_FORWARD_WIDTH}px; height: {IMG_BUTTON_PM_FORWARD_HEIGHT}px; }\n\n/* Sub-header (navigation bar)\n--------------------------------------------- */\na.print, a.sendemail, a.fontsize {\n	display: block;\n	overflow: hidden;\n	height: 18px;\n	text-indent: -5000px;\n	text-align: left;\n	background-repeat: no-repeat;\n}\n\na.print {\n	background-image: none;\n	width: 22px;\n}\n\na.sendemail {\n	background-image: none;\n	width: 22px;\n}\n\na.fontsize {\n	background-image: none;\n	background-position: 0 -1px;\n	width: 29px;\n}\n\na.fontsize:hover {\n	background-position: 0 -20px;\n	text-decoration: none;\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome, .icon-faq, .icon-members, .icon-home, .icon-ucp, .icon-register, .icon-logout,\n.icon-bookmark, .icon-bump, .icon-subscribe, .icon-unsubscribe, .icon-pages, .icon-search {\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	background-image: none;\n	padding: 1px 0 0 17px;\n}\n\n/* Poster profile icons\n----------------------------------------*/\nul.profile-icons {\n	padding-top: 10px;\n	list-style: none;\n}\n\n/* Rollover state */\nul.profile-icons li {\n	float: left;\n	margin: 0 6px 3px 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\nul.profile-icons li a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\nul.profile-icons li span { display:none; }\nul.profile-icons li a:hover { background: none; }\n\n/* Positioning of moderator icons */\n.postbody ul.profile-icons {\n	float: right;\n	width: auto;\n	padding: 0;\n}\n\n.postbody ul.profile-icons li {\n	margin: 0 3px;\n}\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background: none top left no-repeat; }\n.aim-icon, .aim-icon a			{ background: none top left no-repeat; }\n.yahoo-icon, .yahoo-icon a		{ background: none top left no-repeat; }\n.web-icon, .web-icon a			{ background: none top left no-repeat; }\n.msnm-icon, .msnm-icon a			{ background: none top left no-repeat; }\n.icq-icon, .icq-icon a			{ background: none top left no-repeat; }\n.jabber-icon, .jabber-icon a		{ background: none top left no-repeat; }\n.pm-icon, .pm-icon a				{ background: none top left no-repeat; }\n.quote-icon, .quote-icon a		{ background: none top left no-repeat; }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background: none top left no-repeat; }\n.warn-icon, .warn-icon a			{ background: none top left no-repeat; }\n.edit-icon, .edit-icon a			{ background: none top left no-repeat; }\n.delete-icon, .delete-icon a		{ background: none top left no-repeat; }\n.info-icon, .info-icon a			{ background: none top left no-repeat; }\n\n/* Set profile icon dimensions */\nul.profile-icons li.email-icon		{ width: {IMG_ICON_CONTACT_EMAIL_WIDTH}px; height: {IMG_ICON_CONTACT_EMAIL_HEIGHT}px; }\nul.profile-icons li.aim-icon	{ width: {IMG_ICON_CONTACT_AIM_WIDTH}px; height: {IMG_ICON_CONTACT_AIM_HEIGHT}px; }\nul.profile-icons li.yahoo-icon	{ width: {IMG_ICON_CONTACT_YAHOO_WIDTH}px; height: {IMG_ICON_CONTACT_YAHOO_HEIGHT}px; }\nul.profile-icons li.web-icon	{ width: {IMG_ICON_CONTACT_WWW_WIDTH}px; height: {IMG_ICON_CONTACT_WWW_HEIGHT}px; }\nul.profile-icons li.msnm-icon	{ width: {IMG_ICON_CONTACT_MSNM_WIDTH}px; height: {IMG_ICON_CONTACT_MSNM_HEIGHT}px; }\nul.profile-icons li.icq-icon	{ width: {IMG_ICON_CONTACT_ICQ_WIDTH}px; height: {IMG_ICON_CONTACT_ICQ_HEIGHT}px; }\nul.profile-icons li.jabber-icon	{ width: {IMG_ICON_CONTACT_JABBER_WIDTH}px; height: {IMG_ICON_CONTACT_JABBER_HEIGHT}px; }\nul.profile-icons li.pm-icon		{ width: {IMG_ICON_CONTACT_PM_WIDTH}px; height: {IMG_ICON_CONTACT_PM_HEIGHT}px; }\nul.profile-icons li.quote-icon	{ width: {IMG_ICON_POST_QUOTE_WIDTH}px; height: {IMG_ICON_POST_QUOTE_HEIGHT}px; }\nul.profile-icons li.report-icon	{ width: {IMG_ICON_POST_REPORT_WIDTH}px; height: {IMG_ICON_POST_REPORT_HEIGHT}px; }\nul.profile-icons li.edit-icon	{ width: {IMG_ICON_POST_EDIT_WIDTH}px; height: {IMG_ICON_POST_EDIT_HEIGHT}px; }\nul.profile-icons li.delete-icon	{ width: {IMG_ICON_POST_DELETE_WIDTH}px; height: {IMG_ICON_POST_DELETE_HEIGHT}px; }\nul.profile-icons li.info-icon	{ width: {IMG_ICON_POST_INFO_WIDTH}px; height: {IMG_ICON_POST_INFO_HEIGHT}px; }\nul.profile-icons li.warn-icon	{ width: {IMG_ICON_USER_WARN_WIDTH}px; height: {IMG_ICON_USER_WARN_HEIGHT}px; }\n\n/* Fix profile icon default margins */\nul.profile-icons li.edit-icon	{ margin: 0 0 0 3px; }\nul.profile-icons li.quote-icon	{ margin: 0 0 0 10px; }\nul.profile-icons li.info-icon, ul.profile-icons li.report-icon	{ margin: 0 3px 0 0; }\n/* Control Panel Styles\n---------------------------------------- */\n\n\n/* Main CP box\n----------------------------------------*/\n#cp-menu {\n	float:left;\n	width: 19%;\n	margin-top: 1em;\n	margin-bottom: 5px;\n}\n\n#cp-main {\n	float: left;\n	width: 81%;\n}\n\n#cp-main .content {\n	padding: 0;\n}\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #bfbfbf;\n}\n\n#cp-main .panel p {\n	font-size: 1.1em;\n}\n\n#cp-main .panel ol {\n	margin-left: 2em;\n	font-size: 1.1em;\n}\n\n#cp-main .panel li.row {\n	border-bottom: 1px solid #cbcbcb;\n	border-top: 1px solid #F9F9F9;\n}\n\nul.cplist {\n	margin-bottom: 5px;\n	border-top: 1px solid #cbcbcb;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #FFFFFF;\n	margin-bottom: 2px;\n}\n\n#cp-main table.table1 {\n	margin-bottom: 1em;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	font-weight: bold;\n	border-bottom: 1px solid #333333;\n	padding: 5px;\n}\n\n#cp-main table.table1 tbody th {\n	font-style: italic;\n	background-color: transparent !important;\n	border-bottom: none;\n}\n\n#cp-main .pagination {\n	float: right;\n	width: auto;\n	padding-top: 1px;\n}\n\n#cp-main .postbody p {\n	font-size: 1.1em;\n}\n\n#cp-main .pm-message {\n	border: 1px solid #e2e2e2;\n	margin: 10px 0;\n	background-color: #FFFFFF;\n	width: auto;\n	float: none;\n}\n\n.pm-message h2 {\n	padding-bottom: 5px;\n}\n\n#cp-main .postbody h3, #cp-main .box2 h3 {\n	margin-top: 0;\n}\n\n#cp-main .buttons {\n	margin-left: 0;\n}\n\n#cp-main ul.linklist {\n	margin: 0;\n}\n\n/* MCP Specific tweaks */\n.mcp-main .postbody {\n	width: 100%;\n}\n\n.tabs-container h2 {\n	float: left;\n	margin-bottom: 0px;\n}\n\n.tabs-container #minitabs {\n	float: right;\n	margin-top: 19px;\n}\n\n.tabs-container:after {\n	display: block;\n	clear: both;\n	content: '''';\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs {\n	line-height: normal;\n	margin: 20px 0 -1px 7px;\n	min-width: 570px;\n}\n\n#tabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#tabs li {\n	display: inline;\n	margin: 0;\n	padding: 0;\n	font-size: 1em;\n	font-weight: bold;\n}\n\n#tabs a {\n	float: left;\n	background: none no-repeat 0% -35px;\n	margin: 0 1px 0 0;\n	padding: 0 0 0 5px;\n	text-decoration: none;\n	position: relative;\n	cursor: pointer;\n}\n\n#tabs a span {\n	float: left;\n	display: block;\n	background: none no-repeat 100% -35px;\n	padding: 6px 10px 6px 5px;\n	color: #828282;\n	white-space: nowrap;\n}\n\n#tabs a:hover span {\n	color: #bcbcbc;\n}\n\n#tabs .activetab a {\n	background-position: 0 0;\n	border-bottom: 1px solid #ebebeb;\n}\n\n#tabs .activetab a span {\n	background-position: 100% 0;\n	padding-bottom: 7px;\n	color: #333333;\n}\n\n#tabs a:hover {\n	background-position: 0 -70px;\n}\n\n#tabs a:hover span {\n	background-position:100% -70px;\n}\n\n#tabs .activetab a:hover {\n	background-position: 0 0;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n	background-position: 100% 0;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs {\n	line-height: normal;\n	margin: -20px 7px 0 0;\n}\n\n#minitabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#minitabs li {\n	display: block;\n	float: right;\n	padding: 0 10px 4px 10px;\n	font-size: 1em;\n	font-weight: bold;\n	background-color: #f2f2f2;\n	margin-left: 2px;\n}\n\n#minitabs a {\n}\n\n#minitabs a:hover {\n	text-decoration: none;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n/* Container for sub-navigation list */\n#navigation {\n	width: 100%;\n	padding-top: 36px;\n}\n\n#navigation ul {\n	list-style:none;\n}\n\n/* Default list state */\n#navigation li {\n	margin: 1px 0;\n	padding: 0;\n	font-weight: bold;\n	display: inline;\n}\n\n/* Link styles for the sub-section links */\n#navigation a {\n	display: block;\n	padding: 5px;\n	margin: 1px 0;\n	text-decoration: none;\n	font-weight: bold;\n	color: #333;\n	background: #cfcfcf none repeat-y 100% 0;\n}\n\n#navigation a:hover {\n	text-decoration: none;\n	background-color: #c6c6c6;\n	color: #bcbcbc;\n	background-image: none;\n}\n\n#navigation #active-subsection a {\n	display: block;\n	color: #d3d3d3;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #d3d3d3;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	border-bottom: none;\n	padding: 0;\n	margin-left: 10px;\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: none;\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: none;\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: none;\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #f9f9f9;\n	padding: 0 5px;\n	margin: 10px 15px 10px 5px;\n}\n\n.cp-mini span.corners-top, .cp-mini span.corners-bottom {\n	margin: 0 -5px;\n}\n\ndl.mini dt {\n	font-weight: bold;\n	color: #676767;\n}\n\ndl.mini dd {\n	padding-top: 4px;\n}\n\n.friend-online {\n	font-weight: bold;\n}\n\n.friend-offline {\n	font-style: italic;\n}\n\n/* PM Styles\n----------------------------------------*/\n#pm-menu {\n	line-height: 2.5em;\n}\n\n/* PM panel adjustments */\n.reply-all a.left {\n	background-position: 3px 60%;\n}\n\n.reply-all a.left:hover {\n	background-position: 0px 60%;\n}\n\n.reply-all {\n	font-size: 11px;\n	padding-top: 5px;\n}\n\n/* PM Message history */\n.current {\n	color: #999999;\n}\n\n/* Defined rules list for PM options */\nol.def-rules {\n	padding-left: 0;\n}\n\nol.def-rules li {\n	line-height: 180%;\n	padding: 1px;\n}\n\n/* PM marking colours */\n.pmlist li.bg1 {\n	padding: 0 3px;\n}\n\n.pmlist li.bg2 {\n	padding: 0 3px;\n}\n\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #bcbcbc;\n	border-right-color: #bcbcbc;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	padding: 0;\n	border: solid 3px #ffffff;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	padding: 0;\n	border: solid 3px #c2c2c2;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	padding: 0;\n	border: solid 3px #bdbdbd;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	padding: 0;\n	border: solid 3px #000000;\n	border-width: 0 3px;\n}\n\n.pm-legend {\n	border-left-width: 10px;\n	border-left-style: solid;\n	border-right-width: 0;\n	margin-bottom: 3px;\n	padding-left: 3px;\n}\n\n/* Avatar gallery */\n#gallery label {\n	position: relative;\n	float: left;\n	margin: 10px;\n	padding: 5px;\n	width: auto;\n	background: #FFFFFF;\n	border: 1px solid #CCC;\n	text-align: center;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n/* Form Styles\n---------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nfieldset {\n	border-width: 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n}\n\ninput {\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	padding: 0 3px;\n	font-size: 1em;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n}\n\nselect {\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	border: 1px solid #666666;\n	padding: 1px;\n	background-color: #FAFAFA;\n	font-size: 1em;\n}\n\noption {\n	padding-right: 1em;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\ntextarea {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	width: 60%;\n	padding: 2px;\n	font-size: 1em;\n	line-height: 1.4em;\n}\n\nlabel {\n	cursor: default;\n	padding-right: 5px;\n	color: #676767;\n}\n\nlabel input {\n	vertical-align: middle;\n}\n\nlabel img {\n	vertical-align: middle;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\nfieldset dl {\n	padding: 4px 0;\n}\n\nfieldset dt {\n	float: left;	\n	width: 40%;\n	text-align: left;\n	display: block;\n}\n\nfieldset dd {\n	margin-left: 41%;\n	vertical-align: top;\n	margin-bottom: 3px;\n}\n\n/* Specific layout 1 */\nfieldset.fields1 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields1 dd {\n	margin-left: 15em;\n	border-left-width: 0;\n}\n\nfieldset.fields1 {\n	background-color: transparent;\n}\n\nfieldset.fields1 div {\n	margin-bottom: 3px;\n}\n\n/* Set it back to 0px for the reCaptcha divs: PHPBB3-9587 */\nfieldset.fields1 #recaptcha_widget_div div {\n	margin-bottom: 0;\n}\n\n/* Specific layout 2 */\nfieldset.fields2 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields2 dd {\n	margin-left: 16em;\n	border-left-width: 0;\n}\n\n/* Form elements */\ndt label {\n	font-weight: bold;\n	text-align: left;\n}\n\ndd label {\n	white-space: nowrap;\n	color: #333;\n}\n\ndd input, dd textarea {\n	margin-right: 3px;\n}\n\ndd select {\n	width: auto;\n}\n\ndd textarea {\n	width: 85%;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n#timezone {\n	width: 95%;\n}\n\n* html #timezone {\n	width: 50%;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login {\n	margin-top: 5px;\n}\n\nfieldset.quick-login input {\n	width: auto;\n}\n\nfieldset.quick-login input.inputbox {\n	width: 15%;\n	vertical-align: middle;\n	margin-right: 5px;\n	background-color: #f3f3f3;\n}\n\nfieldset.quick-login label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\n/* Display options on viewtopic/viewforum pages  */\nfieldset.display-options {\n	text-align: center;\n	margin: 3px 0 5px 0;\n}\n\nfieldset.display-options label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.display-options a {\n	margin-top: 3px;\n}\n\n/* Display actions for ucp and mcp pages */\nfieldset.display-actions {\n	text-align: right;\n	line-height: 2em;\n	white-space: nowrap;\n	padding-right: 1em;\n}\n\nfieldset.display-actions label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.sort-options {\n	line-height: 2em;\n}\n\n/* MCP forum selection*/\nfieldset.forum-selection {\n	margin: 5px 0 3px 0;\n	float: right;\n}\n\nfieldset.forum-selection2 {\n	margin: 13px 0 3px 0;\n	float: right;\n}\n\n/* Jumpbox */\nfieldset.jumpbox {\n	text-align: right;\n	margin-top: 15px;\n	height: 2.5em;\n}\n\nfieldset.quickmod {\n	width: 50%;\n	float: right;\n	text-align: right;\n	height: 2.5em;\n}\n\n/* Submit button fieldset */\nfieldset.submit-buttons {\n	text-align: center;\n	vertical-align: middle;\n	margin: 5px 0;\n}\n\nfieldset.submit-buttons input {\n	vertical-align: middle;\n	padding-top: 3px;\n	padding-bottom: 3px;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n/* Buttons used in the editor */\n#format-buttons {\n	margin: 15px 0 2px 0;\n}\n\n#format-buttons input, #format-buttons select {\n	vertical-align: middle;\n}\n\n/* Main message box */\n#message-box {\n	width: 80%;\n}\n\n#message-box textarea {\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	width: 450px;\n	height: 270px;\n	min-width: 100%;\n	max-width: 100%;\n	font-size: 1.2em;\n	color: #333333;\n}\n\n/* Emoticons panel */\n#smiley-box {\n	width: 18%;\n	float: right;\n}\n\n#smiley-box img {\n	margin: 3px;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF;\n	border: 1px solid #c0c0c0;\n	color: #333333;\n	padding: 2px;\n	cursor: text;\n}\n\n.inputbox:hover {\n	border: 1px solid #eaeaea;\n}\n\n.inputbox:focus {\n	border: 1px solid #eaeaea;\n	color: #4b4b4b;\n}\n\ninput.inputbox	{ width: 85%; }\ninput.medium	{ width: 50%; }\ninput.narrow	{ width: 25%; }\ninput.tiny		{ width: 125px; }\n\ntextarea.inputbox {\n	width: 85%;\n}\n\n.autowidth {\n	width: auto !important;\n}\n\n/* Form button styles\n---------------------------------------- */\ninput.button1, input.button2 {\n	font-size: 1em;\n}\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	width: auto !important;\n	padding-top: 1px;\n	padding-bottom: 1px;\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	color: #000;\n	background: #FAFAFA none repeat-x top left;\n}\n\na.button1, input.button1 {\n	font-weight: bold;\n	border: 1px solid #666666;\n}\n\ninput.button3 {\n	padding: 0;\n	margin: 0;\n	line-height: 5px;\n	height: 12px;\n	background-image: none;\n	font-variant: small-caps;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border: 1px solid #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	text-decoration: none;\n	color: #000000;\n	padding: 2px 8px;\n	line-height: 250%;\n	vertical-align: text-bottom;\n	background-position: 0 1px;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border: 1px solid #BCBCBC;\n	background-position: 0 100%;\n	color: #BCBCBC;\n}\n\ninput.disabled {\n	font-weight: normal;\n	color: #666666;\n}\n\n/* Topic and forum Search */\n.search-box {\n	margin-top: 3px;\n	margin-left: 5px;\n	float: left;\n}\n\n.search-box input {\n}\n\ninput.search {\n	background-image: none;\n	background-repeat: no-repeat;\n	background-position: left 1px;\n	padding-left: 17px;\n}\n\n.full { width: 95%; }\n.medium { width: 50%;}\n.narrow { width: 25%;}\n.tiny { width: 10%;}\n/* Style Sheet Tweaks\n\nThese style definitions are mainly IE specific \ntweaks required due to its poor CSS support.\n-------------------------------------------------*/\n\n* html table, * html select, * html input { font-size: 100%; }\n* html hr { margin: 0; }\n* html span.corners-top, * html span.corners-bottom { background-image: url("{T_THEME_PATH}/images/corners_left.gif"); }\n* html span.corners-top span, * html span.corners-bottom span { background-image: url("{T_THEME_PATH}/images/corners_right.gif"); }\n\ntable.table1 {\n	width: 99%;		/* IE < 6 browsers */\n	/* Tantek hack */\n	voice-family: "\\"}\\"";\n	voice-family: inherit;\n	width: 100%;\n}\nhtml>body table.table1 { width: 100%; }	/* Reset 100% for opera */\n\n* html ul.topiclist li { position: relative; }\n* html .postbody h3 img { vertical-align: middle; }\n\n/* Form styles */\nhtml>body dd label input { vertical-align: text-bottom; }	/* Align checkboxes/radio buttons nicely */\n\n* html input.button1, * html input.button2 {\n	padding-bottom: 0;\n	margin-bottom: 1px;\n}\n\n/* Misc layout styles */\n* html .column1, * html .column2 { width: 45%; }\n\n/* Nice method for clearing floated blocks without having to insert any extra markup (like spacer above)\n   From http://www.positioniseverything.net/easyclearing.html \n#tabs:after, #minitabs:after, .post:after, .navbar:after, fieldset dl:after, ul.topiclist dl:after, ul.linklist:after, dl.polls:after {\n	content: "."; \n	display: block; \n	height: 0; \n	clear: both; \n	visibility: hidden;\n}*/\n\n.clearfix, #tabs, #minitabs, fieldset dl, ul.topiclist dl, dl.polls {\n	height: 1%;\n	overflow: hidden;\n}\n\n/* viewtopic fix */\n* html .post {\n	height: 25%;\n	overflow: hidden;\n}\n\n/* navbar fix */\n* html .clearfix, * html .navbar, ul.linklist {\n	height: 4%;\n	overflow: hidden;\n}\n\n/* Simple fix so forum and topic lists always have a min-height set, even in IE6\n	From http://www.dustindiaz.com/min-height-fast-hack */\ndl.icon {\n	min-height: 35px;\n	height: auto !important;\n	height: 35px;\n}\n\n* html li.row dl.icon dt {\n	height: 35px;\n	overflow: visible;\n}\n\n* html #search-box {\n	width: 25%;\n}\n\n/* Correctly clear floating for details on profile view */\n*:first-child+html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n* html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n/* Headerbar height fix for IE7 and below */\n* html #site-description p {\n	margin-bottom: 1.0em;\n}\n\n*:first-child+html #site-description p {\n	margin-bottom: 1.0em;\n}\n\n/* #minitabs fix for IE */\n.tabs-container {\n	zoom: 1;\n}\n\n#minitabs {\n	white-space: nowrap;\n	*min-width: 50%;\n}\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for common.css\n-------------------------------------------------------------- */\n\nhtml, body {\n	color: #536482;\n	background-color: #FFFFFF;\n}\n\nh1 {\n	color: #FFFFFF;\n}\n\nh2 {\n	color: #28313F;\n}\n\nh3 {\n	border-bottom-color: #CCCCCC;\n	color: #115098;\n}\n\nhr {\n	border-color: #FFFFFF;\n	border-top-color: #CCCCCC;\n}\n\nhr.dashed {\n	border-top-color: #CCCCCC;\n}\n\n/* Search box\n--------------------------------------------- */\n\n#search-box {\n	color: #FFFFFF;\n}\n\n#search-box #keywords {\n	background-color: #FFF;\n}\n\n#search-box input {\n	border-color: #0075B0;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background-color: #12A3EB;\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\n	color: #FFFFFF;\n}\n\n.navbar {\n	background-color: #cadceb;\n}\n\n.forabg {\n	background-color: #0076b1;\n	background-image: url("{T_THEME_PATH}/images/bg_list.gif");\n}\n\n.forumbg {\n	background-color: #12A3EB;\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\n}\n\n.panel {\n	background-color: #ECF1F3;\n	color: #28313F;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #ECF3F7; }\n.bg2	{ background-color: #e1ebf2;  }\n.bg3	{ background-color: #cadceb; }\n\n.ucprowbg {\n	background-color: #DCDEE2;\n}\n\n.fieldsbg {\n	background-color: #E7E8EA;\n}\n\nspan.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\n}\n\nspan.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\n}\n\nspan.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\n}\n\nspan.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\n}\n\n/* Horizontal lists\n----------------------------------------*/\n\nul.navlinks {\n	border-bottom-color: #FFFFFF;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 thead th {\n	color: #FFFFFF;\n}\n\ntable.table1 tbody tr {\n	border-color: #BFC1CF;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #CFE1F6;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #536482;\n}\n\ntable.table1 tbody td {\n	border-top-color: #FAFAFA;\n}\n\ntable.table1 tbody th {\n	border-bottom-color: #000000;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\ntable.info tbody th {\n	color: #000000;\n}\n\n/* Misc layout styles\n---------------------------------------- */\ndl.details dt {\n	color: #000000;\n}\n\ndl.details dd {\n	color: #536482;\n}\n\n.sep {\n	color: #1198D9;\n}\n\n/* Pagination\n---------------------------------------- */\n\n.pagination span strong {\n	color: #FFFFFF;\n	background-color: #4692BF;\n	border-color: #4692BF;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited {\n	color: #5C758C;\n	background-color: #ECEDEE;\n	border-color: #B4BAC0;\n}\n\n.pagination span a:hover {\n	border-color: #368AD2;\n	background-color: #368AD2;\n	color: #FFF;\n}\n\n.pagination span a:active {\n	color: #5C758C;\n	background-color: #ECEDEE;\n	border-color: #B4BAC0;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	background-image: url("{T_THEME_PATH}/images/icon_pages.gif");\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #368AD2;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n\n.copyright {\n	color: #555555;\n}\n\n.error {\n	color: #BC2A4D;\n}\n\n.reported {\n	background-color: #F7ECEF;\n}\n\nli.reported:hover {\n	background-color: #ECD5D8 !important;\n}\n.sticky, .announce {\n	/* you can add a background for stickies and announcements*/\n}\n\ndiv.rules {\n	background-color: #ECD5D8;\n	color: #BC2A4D;\n}\n\np.rules {\n	background-color: #ECD5D8;\n	background-image: none;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for links.css\n-------------------------------------------------------------- */\n\na:link	{ color: #105289; }\na:visited	{ color: #105289; }\na:hover	{ color: #D31141; }\na:active	{ color: #368AD2; }\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #A8D8FF;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #C8E6FF;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	color: #105289;\n}\n\n/* a.forumtitle:visited { color: #105289; } */\n\na.forumtitle:hover {\n	color: #BC2A4D;\n}\n\na.forumtitle:active {\n	color: #105289;\n}\n\na.topictitle {\n	color: #105289;\n}\n\n/* a.topictitle:visited { color: #368AD2; } */\n\na.topictitle:hover {\n	color: #BC2A4D;\n}\n\na.topictitle:active {\n	color: #105289;\n}\n\n/* Post body links */\n.postlink {\n	color: #368AD2;\n	border-bottom-color: #368AD2;\n}\n\n.postlink:visited {\n	color: #5D8FBD;\n	border-bottom-color: #5D8FBD;\n}\n\n.postlink:active {\n	color: #368AD2;\n}\n\n.postlink:hover {\n	background-color: #D0E4F6;\n	color: #0D4473;\n}\n\n.signature a, .signature a:visited, .signature a:hover, .signature a:active {\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:visited, .postprofile dt.author a {\n	color: #105289;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	color: #D31141;\n}\n\n.postprofile a:active {\n	color: #105289;\n}\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #105289;\n}\n\n.search .postprofile a:hover {\n	color: #D31141;\n}\n\n/* Back to top of page */\na.top {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\na.top2 {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\n/* Arrow links  */\na.up		{ background-image: url("{T_THEME_PATH}/images/arrow_up.gif") }\na.down		{ background-image: url("{T_THEME_PATH}/images/arrow_down.gif") }\na.left		{ background-image: url("{T_THEME_PATH}/images/arrow_left.gif") }\na.right		{ background-image: url("{T_THEME_PATH}/images/arrow_right.gif") }\n\na.up:hover {\n	background-color: transparent;\n}\n\na.left:hover {\n	color: #368AD2;\n}\n\na.right:hover {\n	color: #368AD2;\n}\n\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for content.css\n-------------------------------------------------------------- */\n\nul.forums {\n	background-color: #eef5f9;\n	background-image: url("{T_THEME_PATH}/images/gradient.gif");\n}\n\nul.topiclist li {\n	color: #4C5D77;\n}\n\nul.topiclist dd {\n	border-left-color: #FFFFFF;\n}\n\n.rtl ul.topiclist dd {\n	border-right-color: #fff;\n	border-left-color: transparent;\n}\n\nul.topiclist li.row dt a.subforum.read {\n	background-image: url("{IMG_SUBFORUM_READ_SRC}");\n}\n\nul.topiclist li.row dt a.subforum.unread {\n	background-image: url("{IMG_SUBFORUM_UNREAD_SRC}");\n}\n\nli.row {\n	border-top-color:  #FFFFFF;\n	border-bottom-color: #00608F;\n}\n\nli.row strong {\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #F6F4D0;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\n.rtl li.row:hover dd {\n	border-right-color: #CCCCCC;\n	border-left-color: transparent;\n}\n\nli.header dt, li.header dd {\n	color: #FFFFFF;\n}\n\n/* Forum list column styles */\nul.topiclist dd.searchextra {\n	color: #333333;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	color: #333333;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	color: #333333;\n}\n\n.content h2, .panel h2 {\n	color: #115098;\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.faq dt {\n	color: #333333;\n}\n\n.posthilit {\n	background-color: #F3BFCC;\n	color: #BC2A4D;\n}\n\n/* Post signature */\n.signature {\n	border-top-color: #CCCCCC;\n}\n\n/* Post noticies */\n.notice {\n	border-top-color:  #CCCCCC;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background-color: #EBEADD;\n	background-image: url("{T_THEME_PATH}/images/quote.gif");\n	border-color:#DBDBCE;\n}\n\n.rtl blockquote {\n	background-image: url("{T_THEME_PATH}/images/quote_rtl.gif");\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color:#EFEED9;\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #EBEADD;\n}\n\n/* Code block */\ndl.codebox {\n	background-color: #FFFFFF;\n	border-color: #C9D2D8;\n}\n\ndl.codebox dt {\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.codebox code {\n	color: #2E8B57;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #FF8000; }\n.syntaxdefault	{ color: #0000BB; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #007700; }\n.syntaxstring	{ color: #DD0000; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	background-color: #FFFFFF;\n	border-color:  #C9D2D8;\n}\n\n.pm-message .attachbox {\n	background-color: #F2F3F3;\n}\n\n.attachbox dd {\n	border-top-color: #C9D2D8;\n}\n\n.attachbox p {\n	color: #666666;\n}\n\n.attachbox p.stats {\n	color: #666666;\n}\n\n.attach-image img {\n	border-color: #999999;\n}\n\n/* Inline image thumbnails */\n\ndl.file dd {\n	color: #666666;\n}\n\ndl.thumbnail img {\n	border-color: #666666;\n	background-color: #FFFFFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border-color: #368AD2;\n}\n\n/* Post poll styles\n----------------------------------------*/\n\nfieldset.polls dl {\n	border-top-color: #DCDEE2;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	color: #000000;\n}\n\nfieldset.polls dd div {\n	color: #FFFFFF;\n}\n\n.rtl .pollbar1, .rtl .pollbar2, .rtl .pollbar3, .rtl .pollbar4, .rtl .pollbar5 {\n	border-right-color: transparent;\n}\n\n.pollbar1 {\n	background-color: #AA2346;\n	border-bottom-color: #74162C;\n	border-right-color: #74162C;\n}\n\n.rtl .pollbar1 {\n	border-left-color: #74162C;\n}\n\n.pollbar2 {\n	background-color: #BE1E4A;\n	border-bottom-color: #8C1C38;\n	border-right-color: #8C1C38;\n}\n\n.rtl .pollbar2 {\n	border-left-color: #8C1C38;\n}\n\n.pollbar3 {\n	background-color: #D11A4E;\n	border-bottom-color: #AA2346;\n	border-right-color: #AA2346;\n}\n\n.rtl .pollbar3 {\n	border-left-color: #AA2346;\n}\n\n.pollbar4 {\n	background-color: #E41653;\n	border-bottom-color: #BE1E4A;\n	border-right-color: #BE1E4A;\n}\n\n.rtl .pollbar4 {\n	border-left-color: #BE1E4A;\n}\n\n.pollbar5 {\n	background-color: #F81157;\n	border-bottom-color: #D11A4E;\n	border-right-color: #D11A4E;\n}\n\n.rtl .pollbar5 {\n	border-left-color: #D11A4E;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	color: #666666;\n	border-left-color: #FFFFFF;\n}\n\n.rtl .postprofile {\n	border-right-color: #FFFFFF;\n	border-left-color: transparent;\n}\n\n.pm .postprofile {\n	border-left-color: #DDDDDD;\n}\n\n.rtl .pm .postprofile {\n	border-right-color: #DDDDDD;\n	border-left-color: transparent;\n}\n\n.postprofile strong {\n	color: #000000;\n}\n\n.online {\n	background-image: url("{IMG_ICON_USER_ONLINE_SRC}");\n	margin-top: -5px;\n}\n\n.online dt {\n	margin-top: 5px;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for buttons.css\n-------------------------------------------------------------- */\n\n/* Big button images */\n.reply-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_REPLY_SRC}"); }\n.post-icon span		{ background-image: url("{IMG_BUTTON_TOPIC_NEW_SRC}"); }\n.locked-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_LOCKED_SRC}"); }\n.pmreply-icon span	{ background-image: url("{IMG_BUTTON_PM_REPLY_SRC}") ;}\n.newpm-icon span 	{ background-image: url("{IMG_BUTTON_PM_NEW_SRC}") ;}\n.forwardpm-icon span	{ background-image: url("{IMG_BUTTON_PM_FORWARD_SRC}") ;}\n\na.print {\n	background-image: url("{T_THEME_PATH}/images/icon_print.gif");\n}\n\na.sendemail {\n	background-image: url("{T_THEME_PATH}/images/icon_sendemail.gif");\n}\n\na.fontsize {\n	background-image: url("{T_THEME_PATH}/images/icon_fontsize.gif");\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\n.icon-faq						{ background-image: url("{T_THEME_PATH}/images/icon_faq.gif"); }\n.icon-members					{ background-image: url("{T_THEME_PATH}/images/icon_members.gif"); }\n.icon-home						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\n.icon-ucp						{ background-image: url("{T_THEME_PATH}/images/icon_ucp.gif"); }\n.icon-register					{ background-image: url("{T_THEME_PATH}/images/icon_register.gif"); }\n.icon-logout					{ background-image: url("{T_THEME_PATH}/images/icon_logout.gif"); }\n.icon-bookmark					{ background-image: url("{T_THEME_PATH}/images/icon_bookmark.gif"); }\n.icon-bump						{ background-image: url("{T_THEME_PATH}/images/icon_bump.gif"); }\n.icon-subscribe					{ background-image: url("{T_THEME_PATH}/images/icon_subscribe.gif"); }\n.icon-unsubscribe				{ background-image: url("{T_THEME_PATH}/images/icon_unsubscribe.gif"); }\n.icon-pages						{ background-image: url("{T_THEME_PATH}/images/icon_pages.gif"); }\n.icon-search					{ background-image: url("{T_THEME_PATH}/images/icon_search.gif"); }\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background-image: url("{IMG_ICON_CONTACT_EMAIL_SRC}"); }\n.aim-icon, .aim-icon a			{ background-image: url("{IMG_ICON_CONTACT_AIM_SRC}"); }\n.yahoo-icon, .yahoo-icon a		{ background-image: url("{IMG_ICON_CONTACT_YAHOO_SRC}"); }\n.web-icon, .web-icon a			{ background-image: url("{IMG_ICON_CONTACT_WWW_SRC}"); }\n.msnm-icon, .msnm-icon a			{ background-image: url("{IMG_ICON_CONTACT_MSNM_SRC}"); }\n.icq-icon, .icq-icon a			{ background-image: url("{IMG_ICON_CONTACT_ICQ_SRC}"); }\n.jabber-icon, .jabber-icon a		{ background-image: url("{IMG_ICON_CONTACT_JABBER_SRC}"); }\n.pm-icon, .pm-icon a				{ background-image: url("{IMG_ICON_CONTACT_PM_SRC}"); }\n.quote-icon, .quote-icon a		{ background-image: url("{IMG_ICON_POST_QUOTE_SRC}"); }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background-image: url("{IMG_ICON_POST_REPORT_SRC}"); }\n.edit-icon, .edit-icon a			{ background-image: url("{IMG_ICON_POST_EDIT_SRC}"); }\n.delete-icon, .delete-icon a		{ background-image: url("{IMG_ICON_POST_DELETE_SRC}"); }\n.info-icon, .info-icon a			{ background-image: url("{IMG_ICON_POST_INFO_SRC}"); }\n.warn-icon, .warn-icon a			{ background-image: url("{IMG_ICON_USER_WARN_SRC}"); } /* Need updated warn icon */\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for cp.css\n-------------------------------------------------------------- */\n\n/* Main CP box\n----------------------------------------*/\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #A4B3BF;\n}\n\n#cp-main .panel li.row {\n	border-bottom-color: #B5C1CB;\n	border-top-color: #F9F9F9;\n}\n\nul.cplist {\n	border-top-color: #B5C1CB;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #000000;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	border-bottom-color: #333333;\n}\n\n#cp-main .pm-message {\n	border-color: #DBDEE2;\n	background-color: #FFFFFF;\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs a {\n	background-image: url("{T_THEME_PATH}/images/bg_tabs1.gif");\n}\n\n#tabs a span {\n	background-image: url("{T_THEME_PATH}/images/bg_tabs2.gif");\n	color: #536482;\n}\n\n#tabs a:hover span {\n	color: #BC2A4D;\n}\n\n#tabs .activetab a {\n	border-bottom-color: #CADCEB;\n}\n\n#tabs .activetab a span {\n	color: #333333;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs li {\n	background-color: #E1EBF2;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n\n/* Link styles for the sub-section links */\n#navigation a {\n	color: #333;\n	background-color: #B2C2CF;\n	background-image: url("{T_THEME_PATH}/images/bg_menu.gif");\n}\n\n.rtl #navigation a {\n	background-image: url("{T_THEME_PATH}/images/bg_menu_rtl.gif");\n	background-position: 0 100%;\n}\n\n#navigation a:hover {\n	background-image: none;\n	background-color: #aabac6;\n	color: #BC2A4D;\n}\n\n#navigation #active-subsection a {\n	color: #D31141;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #D31141;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #eef5f9;\n}\n\ndl.mini dt {\n	color: #425067;\n}\n\n/* PM Styles\n----------------------------------------*/\n/* PM Message history */\n.current {\n	color: #000000 !important;\n}\n\n/* PM marking colours */\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #BC2A4D;\n	border-right-color: #BC2A4D;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	border-color: #FF6600;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	border-color: #A9B8C2;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	border-color: #5D8FBD;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	border-color: #000000;\n}\n\n/* Avatar gallery */\n#gallery label {\n	background-color: #FFFFFF;\n	border-color: #CCC;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for forms.css\n-------------------------------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nselect {\n	border-color: #666666;\n	background-color: #FAFAFA;\n	color: #000;\n}\n\nlabel {\n	color: #425067;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\ndd label {\n	color: #333;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login input.inputbox {\n	background-color: #F2F3F3;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n#message-box textarea {\n	color: #333333;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF; \n	border-color: #B4BAC0;\n	color: #333333;\n}\n\n.inputbox:hover {\n	border-color: #11A3EA;\n}\n\n.inputbox:focus {\n	border-color: #11A3EA;\n	color: #0F4987;\n}\n\n/* Form button styles\n---------------------------------------- */\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	color: #000;\n	background-color: #FAFAFA;\n	background-image: url("{T_THEME_PATH}/images/bg_button.gif");\n}\n\na.button1, input.button1 {\n	border-color: #666666;\n}\n\ninput.button3 {\n	background-image: none;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border-color: #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	color: #000000;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border-color: #BC2A4D;\n	color: #BC2A4D;\n}\n\ninput.search {\n	background-image: url("{T_THEME_PATH}/images/icon_textbox_search.gif");\n}\n\ninput.disabled {\n	color: #666666;\n}\n');
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(5, 'Alpha', '&copy; 2013 Lacey Sutton (http://www.dinosaurfact.net)', 'Alpha', 1, 1388055940, '/*  phpBB3 Style Sheet\r\n    --------------------------------------------------------------\r\n	Style name:         Alpha\r\n   	Based on style:      prosilver (the default phpBB 3.0.x style)\r\n   	Original author:   Tom Beddard ( http://www.subblue.com/ )\r\n   	Modified by:      Lacey Sutton ( http://www.dinosaurfact.net/ )\r\n    --------------------------------------------------------------\r\n*/\r\n\r\n@font-face {\r\n    font-family: ''beb'';\r\n    src: url(''{T_THEME_PATH}/fonts/bebas___-webfont.eot'');\r\n    src: url(''{T_THEME_PATH}/fonts/bebas___-webfont.eot?#iefix'') format(''embedded-opentype''),\r\n         url(''{T_THEME_PATH}/fonts/bebas___-webfont.woff'') format(''woff''),\r\n         url(''{T_THEME_PATH}/fonts/bebas___-webfont.ttf'') format(''truetype''),\r\n         url(''{T_THEME_PATH}/fonts/bebas___-webfont.svg#bebasregular'') format(''svg'');\r\n    font-weight: normal;\r\n    font-style: normal;\r\n\r\n}\r\n\r\n/* General Markup Styles\r\n---------------------------------------- */\r\n\r\n* {\r\n	/* Reset browsers default margin, padding and font sizes */\r\n	margin: 0;\r\n	padding: 0;\r\n}\r\n\r\nhtml {\r\n	font-size: 100%;\r\n	/* Always show a scrollbar for short pages - stops the jump when the scrollbar appears. non-IE browsers */\r\n	height: 101%;\r\n}\r\n\r\nbody {\r\n	/* Text-Sizing with ems: http://www.clagnut.com/blog/348/ */\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	color: #828282;\r\n	background-color: #FFFFFF;\r\n	/*font-size: 62.5%;			 This sets the default font size to be equivalent to 10px */\r\n	font-size: 11px;\r\n	margin: 0;\r\n	padding: 12px 0;\r\n}\r\n\r\nh1 {\r\n	/* Forum name */\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	margin-right: 200px;\r\n	color: #FFFFFF;\r\n	margin-top: 15px;\r\n	font-weight: bold;\r\n	font-size: 2em;\r\n}\r\n\r\nh2 {\r\n	/* Forum header titles */\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-weight: normal;\r\n	color: #3f3f3f;\r\n	font-size: 2em;\r\n	margin: 0.8em 0 0.2em 0;\r\n}\r\n\r\nh2.solo {\r\n	margin-bottom: 1em;\r\n}\r\n\r\nh3 {\r\n	/* Sub-headers (also used as post headers, but defined later) */\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-weight: bold;\r\n	text-transform: uppercase;\r\n	border-bottom: 1px solid #CCCCCC;\r\n	margin-bottom: 3px;\r\n	padding-bottom: 2px;\r\n	font-size: 1.05em;\r\n	color: #989898;\r\n	margin-top: 20px;\r\n}\r\n\r\nh4 {\r\n	/* Forum and topic list titles */\r\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, Sans-serif;\r\n	font-size: 1.3em;\r\n}\r\n\r\np {\r\n	line-height: 1.3em;\r\n	font-size: 1.2em;\r\n	margin-bottom: 1.5em;\r\n}\r\n\r\nimg {\r\n	border-width: 0;\r\n}\r\n\r\nhr {\r\n	/* Also see tweaks.css */\r\n	border: 0 none #FFFFFF;\r\n	border-top: 1px solid #CCCCCC;\r\n	height: 1px;\r\n	margin: 5px 0;\r\n	display: block;\r\n	clear: both;\r\n}\r\n\r\nhr.dashed {\r\n	border-top: 1px dashed #CCCCCC;\r\n	margin: 10px 0;\r\n}\r\n\r\nhr.divider {\r\n	display: none;\r\n}\r\n\r\np.right {\r\n	text-align: right;\r\n}\r\n\r\n/* Main blocks\r\n---------------------------------------- */\r\n#wrap {\r\n	padding: 20px;\r\n	min-width: 650px;\r\n	width: 1000px;\r\n	margin: 40px auto 20px;\r\n}\r\n\r\n#simple-wrap {\r\n	padding: 6px 10px;\r\n}\r\n\r\n#page-body {\r\n	margin: 4px 0;\r\n	clear: both;\r\n}\r\n\r\n#page-footer {\r\n	clear: both;\r\n}\r\n\r\n#page-footer h3 {\r\n	margin-top: 20px;\r\n}\r\n\r\n#logo {\r\n	float: left;\r\n	width: auto;\r\n	padding: 10px 13px 0 10px;\r\n}\r\n\r\na#logo:hover {\r\n	text-decoration: none;\r\n}\r\n\r\n/* Search box\r\n--------------------------------------------- */\r\n#search-box {\r\n	color: #FFFFFF;\r\n	position: relative;\r\n	margin-top: 30px;\r\n	margin-right: 5px;\r\n	display: block;\r\n	float: right;\r\n	text-align: right;\r\n	white-space: nowrap; /* For Opera */\r\n}\r\n\r\n#search-box #keywords {\r\n	width: 95px;\r\n	background-color: #FFF;\r\n}\r\n\r\n#search-box input {\r\n	border: 1px solid #b0b0b0;\r\n}\r\n\r\n/* .button1 style defined later, just a few tweaks for the search button version */\r\n#search-box input.button1 {\r\n	padding: 1px 5px;\r\n}\r\n\r\n#search-box li {\r\n	text-align: right;\r\n	margin-top: 4px;\r\n}\r\n\r\n#search-box img {\r\n	vertical-align: middle;\r\n	margin-right: 3px;\r\n}\r\n\r\n/* Site description and logo */\r\n#site-description {\r\n	float: left;\r\n	width: 70%;\r\n}\r\n\r\n#site-description h1 {\r\n	margin-right: 0;\r\n}\r\n\r\n/* Round cornered boxes and backgrounds\r\n---------------------------------------- */\r\n.headerbar {\r\n	background: #ebebeb none repeat-x 0 0;\r\n	color: #FFFFFF;\r\n	margin-bottom: 4px;\r\n	padding: 0 5px;\r\n}\r\n\r\n.navbar {\r\n	background-color: #ebebeb;\r\n	padding: 0 10px;\r\n}\r\n\r\n.forabg, .forumbg {\r\n	background: #b1b1b1 none repeat-x 0 0;\r\n	margin-bottom: 24px;\r\n	padding: 0;\r\n	clear: both;\r\n}\r\n\r\n.panel {\r\n	margin-bottom: 4px;\r\n	padding: 0 10px;\r\n	background-color: #f3f3f3;\r\n	color: #3f3f3f;\r\n}\r\n\r\n.post {\r\n	padding: 0 10px;\r\n	margin-bottom: 4px;\r\n	background-repeat: no-repeat;\r\n	background-position: 100% 0;\r\n}\r\n\r\n.post:target .content {\r\n	color: #000000;\r\n}\r\n\r\n.post:target h3 a {\r\n	color: #000000;\r\n}\r\n\r\n.bg1	{ background-color: #f7f7f7;}\r\n.bg2	{ background-color: #f2f2f2; }\r\n.bg3	{ background-color: #ebebeb; }\r\n\r\n.rowbg {\r\n	margin: 5px 5px 2px 5px;\r\n}\r\n\r\n.ucprowbg {\r\n	background-color: #e2e2e2;\r\n}\r\n\r\n.fieldsbg {\r\n	/*border: 1px #e6e6e6 solid;*/\r\n	background-color: #eaeaea;\r\n}\r\n\r\nspan.corners-top, span.corners-bottom, span.corners-top span, span.corners-bottom span {\r\n	font-size: 1px;\r\n	line-height: 1px;\r\n	display: block;\r\n	height: 5px;\r\n	background-repeat: no-repeat;\r\n}\r\n\r\nspan.corners-top {\r\n	background-image: none;\r\n	background-position: 0 0;\r\n	margin: 0 -5px;\r\n}\r\n\r\nspan.corners-top span {\r\n	background-image: none;\r\n	background-position: 100% 0;\r\n}\r\n\r\nspan.corners-bottom {\r\n	background-image: none;\r\n	background-position: 0 100%;\r\n	margin: 0 -5px;\r\n	clear: both;\r\n}\r\n\r\nspan.corners-bottom span {\r\n	background-image: none;\r\n	background-position: 100% 100%;\r\n}\r\n\r\n.headbg span.corners-bottom {\r\n	margin-bottom: -1px;\r\n}\r\n\r\n.post span.corners-top, .post span.corners-bottom, .panel span.corners-top, .panel span.corners-bottom, .navbar span.corners-top, .navbar span.corners-bottom {\r\n	margin: 0 -10px;\r\n}\r\n\r\n.rules span.corners-top {\r\n	margin: 0 -10px 5px -10px;\r\n}\r\n\r\n.rules span.corners-bottom {\r\n	margin: 5px -10px 0 -10px;\r\n}\r\n\r\n/* Horizontal lists\r\n----------------------------------------*/\r\nul.linklist {\r\n	display: block;\r\n	margin: 0;\r\n}\r\n\r\nul.linklist li {\r\n	display: block;\r\n	list-style-type: none;\r\n	float: left;\r\n	width: auto;\r\n	margin-right: 5px;\r\n	font-size: 1.1em;\r\n	line-height: 2.2em;\r\n}\r\n\r\nul.linklist li.rightside, p.rightside {\r\n	float: right;\r\n	margin-right: 0;\r\n	margin-left: 5px;\r\n	text-align: right;\r\n}\r\n\r\nul.navlinks {\r\n	padding-bottom: 1px;\r\n	margin-bottom: 1px;\r\n	border-bottom: 1px solid #FFFFFF;\r\n	font-weight: bold;\r\n}\r\n\r\nul.leftside {\r\n	float: left;\r\n	margin-left: 0;\r\n	margin-right: 5px;\r\n	text-align: left;\r\n}\r\n\r\nul.rightside {\r\n	float: right;\r\n	margin-left: 5px;\r\n	margin-right: -5px;\r\n	text-align: right;\r\n}\r\n\r\n/* Table styles\r\n----------------------------------------*/\r\ntable.table1 {\r\n	/* See tweaks.css */\r\n}\r\n\r\n#ucp-main table.table1 {\r\n	padding: 2px;\r\n}\r\n\r\ntable.table1 thead th {\r\n	font-weight: normal;\r\n	text-transform: uppercase;\r\n	color: #FFFFFF;\r\n	line-height: 1.3em;\r\n	font-size: 1em;\r\n	padding: 0 0 4px 3px;\r\n	padding: 10px;\r\n	background-color: #333333;\r\n	-moz-border-radius: 0px;\r\n	-webkit-border-radius: 3px 3px 0px 0px;\r\n	border-radius: 3px 3px 0px 0px;\r\n}\r\n\r\ntable.table1 thead th span {\r\n	padding-left: 7px;\r\n}\r\n\r\ntable.table1 tbody tr {\r\n	border: 1px solid #cfcfcf;\r\n}\r\n\r\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\r\n	background-color: #f6f6f6;\r\n	color: #000;\r\n}\r\n\r\ntable.table1 td {\r\n	color: #6a6a6a;\r\n	font-size: 1.1em;\r\n}\r\n\r\ntable.table1 tbody td {\r\n	padding: 5px;\r\n	border-top: 1px solid #FAFAFA;\r\n}\r\n\r\ntable.table1 tbody th {\r\n	padding: 5px;\r\n	border-bottom: 1px solid #000000;\r\n	text-align: left;\r\n	color: #333333;\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n/* Specific column styles */\r\ntable.table1 .name		{ text-align: left; }\r\ntable.table1 .posts		{ text-align: center !important; width: 7%; }\r\ntable.table1 .joined	{ text-align: left; width: 15%; }\r\ntable.table1 .active	{ text-align: left; width: 15%; }\r\ntable.table1 .mark		{ text-align: center; width: 7%; }\r\ntable.table1 .info		{ text-align: left; width: 30%; }\r\ntable.table1 .info div	{ width: 100%; white-space: normal; overflow: hidden; }\r\ntable.table1 .autocol	{ line-height: 2em; white-space: nowrap; }\r\ntable.table1 thead .autocol { padding-left: 1em; }\r\n\r\ntable.table1 span.rank-img {\r\n	float: right;\r\n	width: auto;\r\n}\r\n\r\ntable.info td {\r\n	padding: 3px;\r\n}\r\n\r\ntable.info tbody th {\r\n	padding: 3px;\r\n	text-align: right;\r\n	vertical-align: top;\r\n	color: #000000;\r\n	font-weight: normal;\r\n}\r\n\r\n.forumbg table.table1 {\r\n	margin: 0;\r\n}\r\n\r\n.forumbg-table > .inner {\r\n	margin: 0 -1px;\r\n}\r\n\r\n.forumbg-table > .inner > span.corners-top {\r\n	margin: 0 -4px -1px -4px;\r\n}\r\n\r\n.forumbg-table > .inner > span.corners-bottom {\r\n	margin: -1px -4px 0 -4px;\r\n}\r\n\r\n/* Misc layout styles\r\n---------------------------------------- */\r\n/* column[1-2] styles are containers for two column layouts \r\n   Also see tweaks.css */\r\n.column1 {\r\n	float: left;\r\n	clear: left;\r\n	width: 49%;\r\n}\r\n\r\n.column2 {\r\n	float: right;\r\n	clear: right;\r\n	width: 49%;\r\n}\r\n\r\n/* General classes for placing floating blocks */\r\n.left-box {\r\n	float: left;\r\n	width: auto;\r\n	text-align: left;\r\n}\r\n\r\n.right-box {\r\n	float: right;\r\n	width: auto;\r\n	text-align: right;\r\n}\r\n\r\ndl.details {\r\n	/*font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;*/\r\n	font-size: 1.1em;\r\n}\r\n\r\ndl.details dt {\r\n	float: left;\r\n	clear: left;\r\n	width: 30%;\r\n	text-align: right;\r\n	color: #000000;\r\n	display: block;\r\n}\r\n\r\ndl.details dd {\r\n	margin-left: 0;\r\n	padding-left: 5px;\r\n	margin-bottom: 5px;\r\n	color: #828282;\r\n	float: left;\r\n	width: 65%;\r\n}\r\n\r\n/* Pagination\r\n---------------------------------------- */\r\n.pagination {\r\n	height: 1%; /* IE tweak (holly hack) */\r\n	width: auto;\r\n	text-align: right;\r\n	margin-top: 5px;\r\n	float: right;\r\n}\r\n\r\n.pagination span.page-sep {\r\n	display: none;\r\n}\r\n\r\nli.pagination {\r\n	margin-top: 0;\r\n}\r\n\r\n.pagination strong, .pagination b {\r\n	font-weight: normal;\r\n}\r\n\r\n.pagination span strong {\r\n	padding: 0 2px;\r\n	margin: 0 2px;\r\n	font-weight: normal;\r\n	color: #FFFFFF;\r\n	background-color: #bfbfbf;\r\n	border: 1px solid #bfbfbf;\r\n	font-size: 0.9em;\r\n}\r\n\r\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\r\n	font-weight: normal;\r\n	text-decoration: none;\r\n	color: #747474;\r\n	margin: 0 2px;\r\n	padding: 0 2px;\r\n	background-color: #eeeeee;\r\n	border: 1px solid #bababa;\r\n	font-size: 0.9em;\r\n	line-height: 1.5em;\r\n}\r\n\r\n.pagination span a:hover {\r\n	border-color: #d2d2d2;\r\n	background-color: #d2d2d2;\r\n	color: #FFF;\r\n	text-decoration: none;\r\n}\r\n\r\n.pagination img {\r\n	vertical-align: middle;\r\n}\r\n\r\n/* Pagination in viewforum for multipage topics */\r\n.row .pagination {\r\n	display: block;\r\n	float: right;\r\n	width: auto;\r\n	margin-top: 0;\r\n	padding: 1px 0 1px 15px;\r\n	font-size: 0.9em;\r\n	background: none 0 50% no-repeat;\r\n}\r\n\r\n.row .pagination span a, li.pagination span a {\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n.row .pagination span a:hover, li.pagination span a:hover {\r\n	background-color: #d2d2d2;\r\n}\r\n\r\n/* Miscellaneous styles\r\n---------------------------------------- */\r\n#forum-permissions {\r\n	float: right;\r\n	width: auto;\r\n	padding-left: 5px;\r\n	margin-left: 5px;\r\n	margin-top: 10px;\r\n	text-align: right;\r\n}\r\n\r\n.copyright {\r\n	padding: 5px;\r\n	text-align: center;\r\n	color: #555555;\r\n}\r\n\r\n.small {\r\n	font-size: 0.9em !important;\r\n}\r\n\r\n.titlespace {\r\n	margin-bottom: 15px;\r\n}\r\n\r\n.headerspace {\r\n	margin-top: 20px;\r\n}\r\n\r\n.error {\r\n	color: #bcbcbc;\r\n	font-weight: bold;\r\n	font-size: 1em;\r\n}\r\n\r\n.reported {\r\n	background-color: #f7f7f7;\r\n}\r\n\r\nli.reported:hover {\r\n	background-color: #ececec;\r\n}\r\n\r\ndiv.rules {\r\n	background-color: #ececec;\r\n	color: #bcbcbc;\r\n	padding: 0 10px;\r\n	margin: 10px 0;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndiv.rules ul, div.rules ol {\r\n	margin-left: 20px;\r\n}\r\n\r\np.rules {\r\n	background-color: #ececec;\r\n	background-image: none;\r\n	padding: 5px;\r\n}\r\n\r\np.rules img {\r\n	vertical-align: middle;\r\n	padding-top: 5px;\r\n}\r\n\r\np.rules a {\r\n	vertical-align: middle;\r\n	clear: both;\r\n}\r\n\r\n#top {\r\n	position: absolute;\r\n	top: -20px;\r\n}\r\n\r\n.clear {\r\n	display: block;\r\n	clear: both;\r\n	font-size: 1px;\r\n	line-height: 1px;\r\n	background: transparent;\r\n}\r\n/* Link Styles\r\n---------------------------------------- */\r\n\r\n/* Links adjustment to correctly display an order of rtl/ltr mixed content */\r\na {\r\n	direction: ltr;\r\n	unicode-bidi: embed;\r\n}\r\n\r\na:link	{ color: #898989; text-decoration: none; }\r\na:visited	{ color: #898989; text-decoration: none; }\r\na:hover	{ color: #d3d3d3; text-decoration: underline; }\r\na:active	{ color: #d2d2d2; text-decoration: none; }\r\n\r\n/* Coloured usernames */\r\n.username-coloured {\r\n	font-weight: bold;\r\n	display: inline !important;\r\n	padding: 0 !important;\r\n}\r\n\r\n/* Links on gradient backgrounds */\r\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\r\n	color: #FFFFFF;\r\n	text-decoration: none;\r\n}\r\n\r\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\r\n	color: #FFFFFF;\r\n	text-decoration: none;\r\n}\r\n\r\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\r\n	color: #ffffff;\r\n	text-decoration: underline;\r\n}\r\n\r\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\r\n	color: #ffffff;\r\n	text-decoration: none;\r\n}\r\n\r\n/* Links for forum/topic lists */\r\na.forumtitle {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-size: 1.2em;\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n/* a.forumtitle:visited { color: #898989; } */\r\n\r\na.forumtitle:hover {\r\n	color: #bcbcbc;\r\n	text-decoration: underline;\r\n}\r\n\r\na.forumtitle:active {\r\n	color: #898989;\r\n}\r\n\r\na.topictitle {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-size: 1.2em;\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n/* a.topictitle:visited { color: #d2d2d2; } */\r\n\r\na.topictitle:hover {\r\n	color: #bcbcbc;\r\n	text-decoration: underline;\r\n}\r\n\r\na.topictitle:active {\r\n	color: #898989;\r\n}\r\n\r\n/* Post body links */\r\n.postlink {\r\n	text-decoration: none;\r\n	color: #d2d2d2;\r\n	border-bottom: 1px solid #d2d2d2;\r\n	padding-bottom: 0;\r\n}\r\n\r\n/* .postlink:visited { color: #bdbdbd; } */\r\n\r\n.postlink:active {\r\n	color: #d2d2d2;\r\n}\r\n\r\n.postlink:hover {\r\n	background-color: #f6f6f6;\r\n	text-decoration: none;\r\n	color: #404040;\r\n}\r\n\r\n.signature a, .signature a:visited, .signature a:hover, .signature a:active {\r\n	border: none;\r\n	text-decoration: underline;\r\n	background-color: transparent;\r\n}\r\n\r\n/* Profile links */\r\n.postprofile a:link, .postprofile a:visited, .postprofile dt.author a {\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n.postprofile a:hover, .postprofile dt.author a:hover {\r\n	text-decoration: underline;\r\n	color: #d3d3d3;\r\n}\r\n\r\n/* CSS spec requires a:link, a:visited, a:hover and a:active rules to be specified in this order. */\r\n/* See http://www.phpbb.com/bugs/phpbb3/59685 */\r\n.postprofile a:active {\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n\r\n/* Profile searchresults */	\r\n.search .postprofile a {\r\n	color: #898989;\r\n	text-decoration: none; \r\n	font-weight: normal;\r\n}\r\n\r\n.search .postprofile a:hover {\r\n	color: #d3d3d3;\r\n	text-decoration: underline; \r\n}\r\n\r\n/* Back to top of page */\r\n.back2top {\r\n	clear: both;\r\n	height: 11px;\r\n	text-align: right;\r\n}\r\n\r\na.top {\r\n	background: none no-repeat top left;\r\n	text-decoration: none;\r\n	width: {IMG_ICON_BACK_TOP_WIDTH}px;\r\n	height: {IMG_ICON_BACK_TOP_HEIGHT}px;\r\n	display: block;\r\n	float: right;\r\n	overflow: hidden;\r\n	letter-spacing: 1000px;\r\n	text-indent: 11px;\r\n}\r\n\r\na.top2 {\r\n	background: none no-repeat 0 50%;\r\n	text-decoration: none;\r\n	padding-left: 15px;\r\n}\r\n\r\n/* Arrow links  */\r\na.up		{ background: none no-repeat left center; }\r\na.down		{ background: none no-repeat right center; }\r\na.left		{ background: none no-repeat 3px 60%; }\r\na.right		{ background: none no-repeat 95% 60%; }\r\n\r\na.up, a.up:link, a.up:active, a.up:visited {\r\n	padding-left: 10px;\r\n	text-decoration: none;\r\n	border-bottom-width: 0;\r\n}\r\n\r\na.up:hover {\r\n	background-position: left top;\r\n	background-color: transparent;\r\n}\r\n\r\na.down, a.down:link, a.down:active, a.down:visited {\r\n	padding-right: 10px;\r\n}\r\n\r\na.down:hover {\r\n	background-position: right bottom;\r\n	text-decoration: none;\r\n}\r\n\r\na.left, a.left:active, a.left:visited {\r\n	padding-left: 12px;\r\n}\r\n\r\na.left:hover {\r\n	color: #d2d2d2;\r\n	text-decoration: none;\r\n	background-position: 0 60%;\r\n}\r\n\r\na.right, a.right:active, a.right:visited {\r\n	padding-right: 12px;\r\n}\r\n\r\na.right:hover {\r\n	color: #d2d2d2;\r\n	text-decoration: none;\r\n	background-position: 100% 60%;\r\n}\r\n\r\n/* invisible skip link, used for accessibility  */\r\n.skiplink {\r\n	position: absolute;\r\n	left: -999px;\r\n	width: 990px;\r\n}\r\n\r\n/* Feed icon in forumlist_body.html */\r\na.feed-icon-forum {\r\n	float: right;\r\n	margin: 3px;\r\n}\r\n/* Content Styles\r\n---------------------------------------- */\r\n\r\nul.topiclist {\r\n	display: block;\r\n	list-style-type: none;\r\n	margin: 0;\r\n}\r\n\r\nul.forums {\r\n	background: #f9f9f9 none repeat-x 0 0;\r\n}\r\n\r\nul.topiclist li {\r\n	display: block;\r\n	list-style-type: none;\r\n	color: #777777;\r\n	margin: 0;\r\n}\r\n\r\nul.topiclist dl {\r\n	position: relative;\r\n}\r\n\r\nul.topiclist li.row dl {\r\n	padding: 2px 0;\r\n}\r\n\r\nul.topiclist dt {\r\n	display: block;\r\n	float: left;\r\n	width: 50%;\r\n	font-size: 1.1em;\r\n	padding-left: 5px;\r\n	padding-right: 5px;\r\n}\r\n\r\nul.topiclist dd {\r\n	display: block;\r\n	float: left;\r\n	border-left: 1px solid #FFFFFF;\r\n	padding: 4px 0;\r\n}\r\n\r\nul.topiclist dfn {\r\n	/* Labels for post/view counts */\r\n	position: absolute;\r\n	left: -999px;\r\n	width: 990px;\r\n}\r\n\r\nul.topiclist li.row dt a.subforum {\r\n	background-image: none;\r\n	background-position: 0 50%;\r\n	background-repeat: no-repeat;\r\n	position: relative;\r\n	white-space: nowrap;\r\n	padding: 0 0 0 12px;\r\n}\r\n\r\n.forum-image {\r\n	float: left;\r\n	padding-top: 5px;\r\n	margin-right: 5px;\r\n}\r\n\r\nli.row {\r\n	border-top: 1px solid #FFFFFF;\r\n	border-bottom: 1px solid #8f8f8f;\r\n}\r\n\r\nli.row strong {\r\n	font-weight: normal;\r\n	color: #000000;\r\n}\r\n\r\nli.row:hover dd {\r\n	border-left-color: #CCCCCC;\r\n}\r\n\r\nli.header dt, li.header dd {\r\n	line-height: 1em;\r\n	border-left-width: 0;\r\n	margin: 2px 0 4px 0;\r\n	color: #FFFFFF;\r\n	padding-top: 2px;\r\n	padding-bottom: 2px;\r\n	font-size: 1.3em;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n}\r\n\r\nli.header dt {\r\n	font-weight: bold;\r\n}\r\n\r\nli.header dd {\r\n	margin-left: 1px;\r\n}\r\n\r\nli.header dl.icon {\r\n	min-height: 0;\r\n}\r\n\r\nli.header dl.icon dt {\r\n	/* Tweak for headers alignment when folder icon used */\r\n	padding-left: 0;\r\n	padding-right: 50px;\r\n}\r\n\r\n/* Forum list column styles */\r\ndl.icon {\r\n	min-height: 35px;\r\n	background-position: 10px 50%;		/* Position of folder icon */\r\n	background-repeat: no-repeat;\r\n}\r\n\r\ndl.icon dt {\r\n	padding-left: 45px;					/* Space for folder icon */\r\n	background-repeat: no-repeat;\r\n	background-position: 5px 95%;		/* Position of topic icon */\r\n}\r\n\r\ndd.posts, dd.topics, dd.views {\r\n	width: 8%;\r\n	text-align: center;\r\n	line-height: 2.2em;\r\n	font-size: 1.2em;\r\n}\r\n\r\n/* List in forum description */\r\ndl.icon dt ol,\r\ndl.icon dt ul {\r\n	list-style-position: inside;\r\n	margin-left: 1em;\r\n}\r\n\r\ndl.icon dt li {\r\n	display: list-item;\r\n	list-style-type: inherit;\r\n}\r\n\r\ndd.lastpost {\r\n	width: 25%;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.redirect {\r\n	font-size: 1.1em;\r\n	line-height: 2.5em;\r\n}\r\n\r\ndd.moderation {\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.lastpost span, ul.topiclist dd.searchby span, ul.topiclist dd.info span, ul.topiclist dd.time span, dd.redirect span, dd.moderation span {\r\n	display: block;\r\n	padding-left: 5px;\r\n}\r\n\r\ndd.time {\r\n	width: auto;\r\n	line-height: 200%;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.extra {\r\n	width: 12%;\r\n	line-height: 200%;\r\n	text-align: center;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.mark {\r\n	float: right !important;\r\n	width: 9%;\r\n	text-align: center;\r\n	line-height: 200%;\r\n	font-size: 1.2em;\r\n}\r\n\r\ndd.info {\r\n	width: 30%;\r\n}\r\n\r\ndd.option {\r\n	width: 15%;\r\n	line-height: 200%;\r\n	text-align: center;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.searchby {\r\n	width: 47%;\r\n	font-size: 1.1em;\r\n	line-height: 1em;\r\n}\r\n\r\nul.topiclist dd.searchextra {\r\n	margin-left: 5px;\r\n	padding: 0.2em 0;\r\n	font-size: 1.1em;\r\n	color: #333333;\r\n	border-left: none;\r\n	clear: both;\r\n	width: 98%;\r\n	overflow: hidden;\r\n}\r\n\r\n/* Container for post/reply buttons and pagination */\r\n.topic-actions {\r\n	margin-bottom: 3px;\r\n	font-size: 1.1em;\r\n	height: 28px;\r\n	min-height: 28px;\r\n}\r\ndiv[class].topic-actions {\r\n	height: auto;\r\n}\r\n\r\n/* Post body styles\r\n----------------------------------------*/\r\n.postbody {\r\n	padding: 0;\r\n	line-height: 1.48em;\r\n	color: #333333;\r\n	width: 76%;\r\n	float: right;\r\n	clear: both;\r\n}\r\n\r\n.postbody .ignore {\r\n	font-size: 1.1em;\r\n}\r\n\r\n.postbody h3.first {\r\n	/* The first post on the page uses this */\r\n	font-size: 1.7em;\r\n}\r\n\r\n.postbody h3 {\r\n	/* Postbody requires a different h3 format - so change it here */\r\n	font-size: 1.5em;\r\n	padding: 2px 0 0 0;\r\n	margin: 0 0 0.3em 0 !important;\r\n	text-transform: none;\r\n	border: none;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	line-height: 125%;\r\n}\r\n\r\n.postbody h3 img {\r\n	/* Also see tweaks.css */\r\n	vertical-align: bottom;\r\n}\r\n\r\n.postbody .content {\r\n	font-size: 1.3em;\r\n}\r\n\r\n.search .postbody {\r\n	width: 68%\r\n}\r\n\r\n/* Topic review panel\r\n----------------------------------------*/\r\n#review {\r\n	margin-top: 2em;\r\n}\r\n\r\n#topicreview {\r\n	padding-right: 5px;\r\n	overflow: auto;\r\n	height: 300px;\r\n}\r\n\r\n#topicreview .postbody {\r\n	width: auto;\r\n	float: none;\r\n	margin: 0;\r\n	height: auto;\r\n}\r\n\r\n#topicreview .post {\r\n	height: auto;\r\n}\r\n\r\n#topicreview h2 {\r\n	border-bottom-width: 0;\r\n}\r\n\r\n.post-ignore .postbody {\r\n	display: none;\r\n}\r\n\r\n/* MCP Post details\r\n----------------------------------------*/\r\n#post_details\r\n{\r\n	/* This will only work in IE7+, plus the others */\r\n	overflow: auto;\r\n	max-height: 300px;\r\n}\r\n\r\n#expand\r\n{\r\n	clear: both;\r\n}\r\n\r\n/* Content container styles\r\n----------------------------------------*/\r\n.content {\r\n	min-height: 3em;\r\n	overflow: hidden;\r\n	line-height: 1.4em;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-size: 1em;\r\n	color: #333333;\r\n	padding-bottom: 1px;\r\n}\r\n\r\n.content h2, .panel h2 {\r\n	font-weight: normal;\r\n	color: #989898;\r\n	border-bottom: 1px solid #CCCCCC;\r\n	font-size: 1.6em;\r\n	margin-top: 0.5em;\r\n	margin-bottom: 0.5em;\r\n	padding-bottom: 0.5em;\r\n}\r\n\r\n.panel h3 {\r\n	margin: 0.5em 0;\r\n}\r\n\r\n.panel p {\r\n	font-size: 1.2em;\r\n	margin-bottom: 1em;\r\n	line-height: 1.4em;\r\n}\r\n\r\n.content p {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-size: 1.2em;\r\n	margin-bottom: 1em;\r\n	line-height: 1.4em;\r\n}\r\n\r\ndl.faq {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-size: 1.1em;\r\n	margin-top: 1em;\r\n	margin-bottom: 2em;\r\n	line-height: 1.4em;\r\n}\r\n\r\ndl.faq dt {\r\n	font-weight: bold;\r\n	color: #333333;\r\n}\r\n\r\n.content dl.faq {\r\n	font-size: 1.2em;\r\n	margin-bottom: 0.5em;\r\n}\r\n\r\n.content li {\r\n	list-style-type: inherit;\r\n}\r\n\r\n.content ul, .content ol {\r\n	margin-bottom: 1em;\r\n	margin-left: 3em;\r\n}\r\n\r\n.posthilit {\r\n	background-color: #f3f3f3;\r\n	color: #BCBCBC;\r\n	padding: 0 2px 1px 2px;\r\n}\r\n\r\n.announce, .unreadpost {\r\n	/* Highlight the announcements & unread posts box */\r\n	border-left-color: #BCBCBC;\r\n	border-right-color: #BCBCBC;\r\n}\r\n\r\n/* Post author */\r\np.author {\r\n	margin: 0 15em 0.6em 0;\r\n	padding: 0 0 5px 0;\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	font-size: 1em;\r\n	line-height: 1.2em;\r\n}\r\n\r\n/* Post signature */\r\n.signature {\r\n	margin-top: 1.5em;\r\n	padding-top: 0.2em;\r\n	font-size: 1.1em;\r\n	border-top: 1px solid #CCCCCC;\r\n	clear: left;\r\n	line-height: 140%;\r\n	overflow: hidden;\r\n	width: 100%;\r\n}\r\n\r\ndd .signature {\r\n	margin: 0;\r\n	padding: 0;\r\n	clear: none;\r\n	border: none;\r\n}\r\n\r\n.signature li {\r\n	list-style-type: inherit;\r\n}\r\n\r\n.signature ul, .signature ol {\r\n	margin-bottom: 1em;\r\n	margin-left: 3em;\r\n}\r\n\r\n/* Post noticies */\r\n.notice {\r\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\r\n	width: auto;\r\n	margin-top: 1.5em;\r\n	padding-top: 0.2em;\r\n	font-size: 1em;\r\n	border-top: 1px dashed #CCCCCC;\r\n	clear: left;\r\n	line-height: 130%;\r\n}\r\n\r\n/* Jump to post link for now */\r\nul.searchresults {\r\n	list-style: none;\r\n	text-align: right;\r\n	clear: both;\r\n}\r\n\r\n/* BB Code styles\r\n----------------------------------------*/\r\n/* Quote block */\r\nblockquote {\r\n	background: #ebebeb none 6px 8px no-repeat;\r\n	border: 1px solid #dbdbdb;\r\n	font-size: 0.95em;\r\n	margin: 0.5em 1px 0 25px;\r\n	overflow: hidden;\r\n	padding: 5px;\r\n}\r\n\r\nblockquote blockquote {\r\n	/* Nested quotes */\r\n	background-color: #bababa;\r\n	font-size: 1em;\r\n	margin: 0.5em 1px 0 15px;	\r\n}\r\n\r\nblockquote blockquote blockquote {\r\n	/* Nested quotes */\r\n	background-color: #e4e4e4;\r\n}\r\n\r\nblockquote cite {\r\n	/* Username/source of quoter */\r\n	font-style: normal;\r\n	font-weight: bold;\r\n	margin-left: 20px;\r\n	display: block;\r\n	font-size: 0.9em;\r\n}\r\n\r\nblockquote cite cite {\r\n	font-size: 1em;\r\n}\r\n\r\nblockquote.uncited {\r\n	padding-top: 25px;\r\n}\r\n\r\n/* Code block */\r\ndl.codebox {\r\n	padding: 3px;\r\n	background-color: #FFFFFF;\r\n	border: 1px solid #d8d8d8;\r\n	font-size: 1em;\r\n}\r\n\r\ndl.codebox dt {\r\n	text-transform: uppercase;\r\n	border-bottom: 1px solid #CCCCCC;\r\n	margin-bottom: 3px;\r\n	font-size: 0.8em;\r\n	font-weight: bold;\r\n	display: block;\r\n}\r\n\r\nblockquote dl.codebox {\r\n	margin-left: 0;\r\n}\r\n\r\ndl.codebox code {\r\n	/* Also see tweaks.css */\r\n	overflow: auto;\r\n	display: block;\r\n	height: auto;\r\n	max-height: 200px;\r\n	white-space: normal;\r\n	padding-top: 5px;\r\n	font: 0.9em Monaco, "Andale Mono","Courier New", Courier, mono;\r\n	line-height: 1.3em;\r\n	color: #8b8b8b;\r\n	margin: 2px 0;\r\n}\r\n\r\n.syntaxbg		{ color: #FFFFFF; }\r\n.syntaxcomment	{ color: #000000; }\r\n.syntaxdefault	{ color: #bcbcbc; }\r\n.syntaxhtml		{ color: #000000; }\r\n.syntaxkeyword	{ color: #585858; }\r\n.syntaxstring	{ color: #a7a7a7; }\r\n\r\n/* Attachments\r\n----------------------------------------*/\r\n.attachbox {\r\n	float: left;\r\n	width: auto; \r\n	margin: 5px 5px 5px 0;\r\n	padding: 6px;\r\n	background-color: #FFFFFF;\r\n	border: 1px dashed #d8d8d8;\r\n	clear: right;\r\n}\r\n\r\n.pm-message .attachbox {\r\n	background-color: #f3f3f3;\r\n}\r\n\r\n.attachbox dt {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	text-transform: uppercase;\r\n}\r\n\r\n.attachbox dd {\r\n	margin-top: 4px;\r\n	padding-top: 4px;\r\n	clear: left;\r\n	border-top: 1px solid #d8d8d8;\r\n}\r\n\r\n.attachbox dd dd {\r\n	border: none;\r\n}\r\n\r\n.attachbox p {\r\n	line-height: 110%;\r\n	color: #666666;\r\n	font-weight: normal;\r\n	clear: left;\r\n}\r\n\r\n.attachbox p.stats\r\n{\r\n	line-height: 110%;\r\n	color: #666666;\r\n	font-weight: normal;\r\n	clear: left;\r\n}\r\n\r\n.attach-image {\r\n	margin: 3px 0;\r\n	width: 100%;\r\n	max-height: 350px;\r\n	overflow: auto;\r\n}\r\n\r\n.attach-image img {\r\n	border: 1px solid #999999;\r\n/*	cursor: move; */\r\n	cursor: default;\r\n}\r\n\r\n/* Inline image thumbnails */\r\ndiv.inline-attachment dl.thumbnail, div.inline-attachment dl.file {\r\n	display: block;\r\n	margin-bottom: 4px;\r\n}\r\n\r\ndiv.inline-attachment p {\r\n	font-size: 100%;\r\n}\r\n\r\ndl.file {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	display: block;\r\n}\r\n\r\ndl.file dt {\r\n	text-transform: none;\r\n	margin: 0;\r\n	padding: 0;\r\n	font-weight: bold;\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n}\r\n\r\ndl.file dd {\r\n	color: #666666;\r\n	margin: 0;\r\n	padding: 0;	\r\n}\r\n\r\ndl.thumbnail img {\r\n	padding: 3px;\r\n	border: 1px solid #666666;\r\n	background-color: #FFF;\r\n}\r\n\r\ndl.thumbnail dd {\r\n	color: #666666;\r\n	font-style: italic;\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n}\r\n\r\n.attachbox dl.thumbnail dd {\r\n	font-size: 100%;\r\n}\r\n\r\ndl.thumbnail dt a:hover {\r\n	background-color: #EEEEEE;\r\n}\r\n\r\ndl.thumbnail dt a:hover img {\r\n	border: 1px solid #d2d2d2;\r\n}\r\n\r\n/* Post poll styles\r\n----------------------------------------*/\r\nfieldset.polls {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n}\r\n\r\nfieldset.polls dl {\r\n	margin-top: 5px;\r\n	border-top: 1px solid #e2e2e2;\r\n	padding: 5px 0 0 0;\r\n	line-height: 120%;\r\n	color: #666666;\r\n}\r\n\r\nfieldset.polls dl.voted {\r\n	font-weight: bold;\r\n	color: #000000;\r\n}\r\n\r\nfieldset.polls dt {\r\n	text-align: left;\r\n	float: left;\r\n	display: block;\r\n	width: 30%;\r\n	border-right: none;\r\n	padding: 0;\r\n	margin: 0;\r\n	font-size: 1.1em;\r\n}\r\n\r\nfieldset.polls dd {\r\n	float: left;\r\n	width: 10%;\r\n	border-left: none;\r\n	padding: 0 5px;\r\n	margin-left: 0;\r\n	font-size: 1.1em;\r\n}\r\n\r\nfieldset.polls dd.resultbar {\r\n	width: 50%;\r\n}\r\n\r\nfieldset.polls dd input {\r\n	margin: 2px 0;\r\n}\r\n\r\nfieldset.polls dd div {\r\n	text-align: right;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	color: #FFFFFF;\r\n	font-weight: bold;\r\n	padding: 0 2px;\r\n	overflow: visible;\r\n	min-width: 2%;\r\n}\r\n\r\n.pollbar1 {\r\n	background-color: #aaaaaa;\r\n	border-bottom: 1px solid #747474;\r\n	border-right: 1px solid #747474;\r\n}\r\n\r\n.pollbar2 {\r\n	background-color: #bebebe;\r\n	border-bottom: 1px solid #8c8c8c;\r\n	border-right: 1px solid #8c8c8c;\r\n}\r\n\r\n.pollbar3 {\r\n	background-color: #D1D1D1;\r\n	border-bottom: 1px solid #aaaaaa;\r\n	border-right: 1px solid #aaaaaa;\r\n}\r\n\r\n.pollbar4 {\r\n	background-color: #e4e4e4;\r\n	border-bottom: 1px solid #bebebe;\r\n	border-right: 1px solid #bebebe;\r\n}\r\n\r\n.pollbar5 {\r\n	background-color: #f8f8f8;\r\n	border-bottom: 1px solid #D1D1D1;\r\n	border-right: 1px solid #D1D1D1;\r\n}\r\n\r\n/* Poster profile block\r\n----------------------------------------*/\r\n.postprofile {\r\n	/* Also see tweaks.css */\r\n	margin: 5px 0 10px 0;\r\n	min-height: 80px;\r\n	color: #666666;\r\n	border-right: 1px solid #FFFFFF;\r\n	width: 22%;\r\n	float: left;\r\n	display: inline;\r\n}\r\n\r\n.pm .postprofile {\r\n	border-right: 1px solid #DDDDDD;\r\n}\r\n\r\n.postprofile dd, .postprofile dt {\r\n	line-height: 1.2em;\r\n	margin-left: 8px;\r\n}\r\n\r\n.postprofile strong {\r\n	font-weight: normal;\r\n	color: #000000;\r\n}\r\n\r\n.avatar {\r\n	border: none;\r\n	margin-bottom: 3px;\r\n}\r\n\r\n.online {\r\n	background-image: none;\r\n	background-position: 100% 0;\r\n	background-repeat: no-repeat;\r\n}\r\n\r\n/* Poster profile used by search*/\r\n.search .postprofile {\r\n	width: 30%;\r\n}\r\n\r\n/* pm list in compose message if mass pm is enabled */\r\ndl.pmlist dt {\r\n	width: 60% !important;\r\n}\r\n\r\ndl.pmlist dt textarea {\r\n	width: 95%;\r\n}\r\n\r\ndl.pmlist dd {\r\n	margin-left: 61% !important;\r\n	margin-bottom: 2px;\r\n}\r\n/* Button Styles\n---------------------------------------- */\n\n/* Rollover buttons\n   Based on: http://wellstyled.com/css-nopreload-rollovers.html\n----------------------------------------*/\n.buttons {\n	float: left;\n	width: auto;\n	height: auto;\n}\n\n/* Rollover state */\n.buttons div {\n	float: left;\n	margin: 0 5px 0 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\n.buttons div a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n	position: relative;\n	overflow: hidden;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\n/*.buttons div span		{ display: none; }*/\n/*.buttons div a:hover	{ background-image: none; }*/\n.buttons div span			{ position: absolute; width: 100%; height: 100%; cursor: pointer;}\n.buttons div a:hover span	{ background-position: 0 100%; }\n\n/* Big button images */\n.reply-icon span	{ background: transparent none 0 0 no-repeat; }\n.post-icon span		{ background: transparent none 0 0 no-repeat; }\n.locked-icon span	{ background: transparent none 0 0 no-repeat; }\n.pmreply-icon span	{ background: none 0 0 no-repeat; }\n.newpm-icon span 	{ background: none 0 0 no-repeat; }\n.forwardpm-icon span 	{ background: none 0 0 no-repeat; }\n\n/* Set big button dimensions */\n.buttons div.reply-icon		{ width: {IMG_BUTTON_TOPIC_REPLY_WIDTH}px; height: {IMG_BUTTON_TOPIC_REPLY_HEIGHT}px; }\n.buttons div.post-icon		{ width: {IMG_BUTTON_TOPIC_NEW_WIDTH}px; height: {IMG_BUTTON_TOPIC_NEW_HEIGHT}px; }\n.buttons div.locked-icon	{ width: {IMG_BUTTON_TOPIC_LOCKED_WIDTH}px; height: {IMG_BUTTON_TOPIC_LOCKED_HEIGHT}px; }\n.buttons div.pmreply-icon	{ width: {IMG_BUTTON_PM_REPLY_WIDTH}px; height: {IMG_BUTTON_PM_REPLY_HEIGHT}px; }\n.buttons div.newpm-icon		{ width: {IMG_BUTTON_PM_NEW_WIDTH}px; height: {IMG_BUTTON_PM_NEW_HEIGHT}px; }\n.buttons div.forwardpm-icon	{ width: {IMG_BUTTON_PM_FORWARD_WIDTH}px; height: {IMG_BUTTON_PM_FORWARD_HEIGHT}px; }\n\n/* Sub-header (navigation bar)\n--------------------------------------------- */\na.print, a.sendemail, a.fontsize {\n	display: block;\n	overflow: hidden;\n	height: 18px;\n	text-indent: -5000px;\n	text-align: left;\n	background-repeat: no-repeat;\n}\n\na.print {\n	background-image: none;\n	width: 22px;\n}\n\na.sendemail {\n	background-image: none;\n	width: 22px;\n}\n\na.fontsize {\n	background-image: none;\n	background-position: 0 -1px;\n	width: 29px;\n}\n\na.fontsize:hover {\n	background-position: 0 -20px;\n	text-decoration: none;\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome, .icon-faq, .icon-members, .icon-home, .icon-ucp, .icon-register, .icon-logout,\n.icon-bookmark, .icon-bump, .icon-subscribe, .icon-unsubscribe, .icon-pages, .icon-search {\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	background-image: none;\n	padding: 1px 0 0 17px;\n}\n\n/* Poster profile icons\n----------------------------------------*/\nul.profile-icons {\n	padding-top: 10px;\n	list-style: none;\n}\n\n/* Rollover state */\nul.profile-icons li {\n	float: left;\n	margin: 0 6px 3px 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\nul.profile-icons li a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\nul.profile-icons li span { display:none; }\nul.profile-icons li a:hover { background: none; }\n\n/* Positioning of moderator icons */\n.postbody ul.profile-icons {\n	float: right;\n	width: auto;\n	padding: 0;\n}\n\n.postbody ul.profile-icons li {\n	margin: 0 3px;\n}\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background: none top left no-repeat; }\n.aim-icon, .aim-icon a			{ background: none top left no-repeat; }\n.yahoo-icon, .yahoo-icon a		{ background: none top left no-repeat; }\n.web-icon, .web-icon a			{ background: none top left no-repeat; }\n.msnm-icon, .msnm-icon a			{ background: none top left no-repeat; }\n.icq-icon, .icq-icon a			{ background: none top left no-repeat; }\n.jabber-icon, .jabber-icon a		{ background: none top left no-repeat; }\n.pm-icon, .pm-icon a				{ background: none top left no-repeat; }\n.quote-icon, .quote-icon a		{ background: none top left no-repeat; }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background: none top left no-repeat; }\n.warn-icon, .warn-icon a			{ background: none top left no-repeat; }\n.edit-icon, .edit-icon a			{ background: none top left no-repeat; }\n.delete-icon, .delete-icon a		{ background: none top left no-repeat; }\n.info-icon, .info-icon a			{ background: none top left no-repeat; }\n\n/* Set profile icon dimensions */\nul.profile-icons li.email-icon		{ width: {IMG_ICON_CONTACT_EMAIL_WIDTH}px; height: {IMG_ICON_CONTACT_EMAIL_HEIGHT}px; }\nul.profile-icons li.aim-icon	{ width: {IMG_ICON_CONTACT_AIM_WIDTH}px; height: {IMG_ICON_CONTACT_AIM_HEIGHT}px; }\nul.profile-icons li.yahoo-icon	{ width: {IMG_ICON_CONTACT_YAHOO_WIDTH}px; height: {IMG_ICON_CONTACT_YAHOO_HEIGHT}px; }\nul.profile-icons li.web-icon	{ width: {IMG_ICON_CONTACT_WWW_WIDTH}px; height: {IMG_ICON_CONTACT_WWW_HEIGHT}px; }\nul.profile-icons li.msnm-icon	{ width: {IMG_ICON_CONTACT_MSNM_WIDTH}px; height: {IMG_ICON_CONTACT_MSNM_HEIGHT}px; }\nul.profile-icons li.icq-icon	{ width: {IMG_ICON_CONTACT_ICQ_WIDTH}px; height: {IMG_ICON_CONTACT_ICQ_HEIGHT}px; }\nul.profile-icons li.jabber-icon	{ width: {IMG_ICON_CONTACT_JABBER_WIDTH}px; height: {IMG_ICON_CONTACT_JABBER_HEIGHT}px; }\nul.profile-icons li.pm-icon		{ width: {IMG_ICON_CONTACT_PM_WIDTH}px; height: {IMG_ICON_CONTACT_PM_HEIGHT}px; }\nul.profile-icons li.quote-icon	{ width: {IMG_ICON_POST_QUOTE_WIDTH}px; height: {IMG_ICON_POST_QUOTE_HEIGHT}px; }\nul.profile-icons li.report-icon	{ width: {IMG_ICON_POST_REPORT_WIDTH}px; height: {IMG_ICON_POST_REPORT_HEIGHT}px; }\nul.profile-icons li.edit-icon	{ width: {IMG_ICON_POST_EDIT_WIDTH}px; height: {IMG_ICON_POST_EDIT_HEIGHT}px; }\nul.profile-icons li.delete-icon	{ width: {IMG_ICON_POST_DELETE_WIDTH}px; height: {IMG_ICON_POST_DELETE_HEIGHT}px; }\nul.profile-icons li.info-icon	{ width: {IMG_ICON_POST_INFO_WIDTH}px; height: {IMG_ICON_POST_INFO_HEIGHT}px; }\nul.profile-icons li.warn-icon	{ width: {IMG_ICON_USER_WARN_WIDTH}px; height: {IMG_ICON_USER_WARN_HEIGHT}px; }\n\n/* Fix profile icon default margins */\nul.profile-icons li.edit-icon	{ margin: 0 0 0 3px; }\nul.profile-icons li.quote-icon	{ margin: 0 0 0 10px; }\nul.profile-icons li.info-icon, ul.profile-icons li.report-icon	{ margin: 0 3px 0 0; }\r\n/* Control Panel Styles\n---------------------------------------- */\n\n\n/* Main CP box\n----------------------------------------*/\n#cp-menu {\n	float:left;\n	width: 19%;\n	margin-top: 1em;\n	margin-bottom: 5px;\n}\n\n#cp-main {\n	float: left;\n	width: 81%;\n}\n\n#cp-main .content {\n	padding: 0;\n}\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #bfbfbf;\n}\n\n#cp-main .panel p {\n	font-size: 1.1em;\n}\n\n#cp-main .panel ol {\n	margin-left: 2em;\n	font-size: 1.1em;\n}\n\n#cp-main .panel li.row {\n	border-bottom: 1px solid #cbcbcb;\n	border-top: 1px solid #F9F9F9;\n}\n\nul.cplist {\n	margin-bottom: 5px;\n	border-top: 1px solid #cbcbcb;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #000000;\n	margin-bottom: 2px;\n}\n\n#cp-main table.table1 {\n	margin-bottom: 1em;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	font-weight: bold;\n	border-bottom: 1px solid #333333;\n	padding: 5px;\n}\n\n#cp-main table.table1 tbody th {\n	font-style: italic;\n	background-color: transparent !important;\n	border-bottom: none;\n}\n\n#cp-main .pagination {\n	float: right;\n	width: auto;\n	padding-top: 1px;\n}\n\n#cp-main .postbody p {\n	font-size: 1.1em;\n}\n\n#cp-main .pm-message {\n	border: 1px solid #e2e2e2;\n	margin: 10px 0;\n	background-color: #FFFFFF;\n	width: auto;\n	float: none;\n}\n\n.pm-message h2 {\n	padding-bottom: 5px;\n}\n\n#cp-main .postbody h3, #cp-main .box2 h3 {\n	margin-top: 0;\n}\n\n#cp-main .buttons {\n	margin-left: 0;\n}\n\n#cp-main ul.linklist {\n	margin: 0;\n}\n\n/* MCP Specific tweaks */\n.mcp-main .postbody {\n	width: 100%;\n}\n\n.tabs-container h2 {\n	float: left;\n	margin-bottom: 0px;\n}\n\n.tabs-container #minitabs {\n	float: right;\n	margin-top: 19px;\n}\n\n.tabs-container:after {\n	display: block;\n	clear: both;\n	content: '''';\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs {\n	line-height: normal;\n	margin: 20px 0 -1px 7px;\n	min-width: 570px;\n}\n\n#tabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#tabs li {\n	display: inline;\n	margin: 0;\n	padding: 0;\n	font-size: 1em;\n	font-weight: bold;\n}\n\n#tabs a {\n	float: left;\n	background: none no-repeat 0% -35px;\n	margin: 0 1px 0 0;\n	padding: 0 0 0 5px;\n	text-decoration: none;\n	position: relative;\n	cursor: pointer;\n}\n\n#tabs a span {\n	float: left;\n	display: block;\n	background: none no-repeat 100% -35px;\n	padding: 6px 10px 6px 5px;\n	color: #828282;\n	white-space: nowrap;\n}\n\n#tabs a:hover span {\n	color: #bcbcbc;\n}\n\n#tabs .activetab a {\n	background-position: 0 0;\n	border-bottom: 1px solid #ebebeb;\n}\n\n#tabs .activetab a span {\n	background-position: 100% 0;\n	padding-bottom: 7px;\n	color: #333333;\n}\n\n#tabs a:hover {\n	background-position: 0 -70px;\n}\n\n#tabs a:hover span {\n	background-position:100% -70px;\n}\n\n#tabs .activetab a:hover {\n	background-position: 0 0;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n	background-position: 100% 0;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs {\n	line-height: normal;\n	margin: -20px 7px 0 0;\n}\n\n#minitabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#minitabs li {\n	display: block;\n	float: right;\n	padding: 0 10px 4px 10px;\n	font-size: 1em;\n	font-weight: bold;\n	background-color: #f2f2f2;\n	margin-left: 2px;\n}\n\n#minitabs a {\n}\n\n#minitabs a:hover {\n	text-decoration: none;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n/* Container for sub-navigation list */\n#navigation {\n	width: 100%;\n	padding-top: 36px;\n}\n\n#navigation ul {\n	list-style:none;\n}\n\n/* Default list state */\n#navigation li {\n	margin: 1px 0;\n	padding: 0;\n	font-weight: bold;\n	display: inline;\n}\n\n/* Link styles for the sub-section links */\n#navigation a {\n	display: block;\n	padding: 5px;\n	margin: 1px 0;\n	text-decoration: none;\n	font-weight: bold;\n	color: #333;\n	background: #cfcfcf none repeat-y 100% 0;\n}\n\n#navigation a:hover {\n	text-decoration: none;\n	background-color: #c6c6c6;\n	color: #bcbcbc;\n	background-image: none;\n}\n\n#navigation #active-subsection a {\n	display: block;\n	color: #d3d3d3;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #d3d3d3;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	border-bottom: none;\n	padding: 0;\n	margin-left: 10px;\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: none;\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: none;\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: none;\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #f9f9f9;\n	padding: 0 5px;\n	margin: 10px 15px 10px 5px;\n}\n\n.cp-mini span.corners-top, .cp-mini span.corners-bottom {\n	margin: 0 -5px;\n}\n\ndl.mini dt {\n	font-weight: bold;\n	color: #676767;\n}\n\ndl.mini dd {\n	padding-top: 4px;\n}\n\n.friend-online {\n	font-weight: bold;\n}\n\n.friend-offline {\n	font-style: italic;\n}\n\n/* PM Styles\n----------------------------------------*/\n#pm-menu {\n	line-height: 2.5em;\n}\n\n/* PM panel adjustments */\n.reply-all a.left {\n	background-position: 3px 60%;\n}\n\n.reply-all a.left:hover {\n	background-position: 0px 60%;\n}\n\n.reply-all {\n	font-size: 11px;\n	padding-top: 5px;\n}\n\n/* PM Message history */\n.current {\n	color: #999999;\n}\n\n/* Defined rules list for PM options */\nol.def-rules {\n	padding-left: 0;\n}\n\nol.def-rules li {\n	line-height: 180%;\n	padding: 1px;\n}\n\n/* PM marking colours */\n.pmlist li.bg1 {\n	padding: 0 3px;\n}\n\n.pmlist li.bg2 {\n	padding: 0 3px;\n}\n\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #bcbcbc;\n	border-right-color: #bcbcbc;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	padding: 0;\n	border: solid 3px #ffffff;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	padding: 0;\n	border: solid 3px #c2c2c2;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	padding: 0;\n	border: solid 3px #bdbdbd;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	padding: 0;\n	border: solid 3px #000000;\n	border-width: 0 3px;\n}\n\n.pm-legend {\n	border-left-width: 10px;\n	border-left-style: solid;\n	border-right-width: 0;\n	margin-bottom: 3px;\n	padding-left: 3px;\n}\n\n/* Avatar gallery */\n#gallery label {\n	position: relative;\n	float: left;\n	margin: 10px;\n	padding: 5px;\n	width: auto;\n	background: #FFFFFF;\n	border: 1px solid #CCC;\n	text-align: center;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\r\n/* Form Styles\n---------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nfieldset {\n	border-width: 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n}\n\ninput {\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	padding: 0 3px;\n	font-size: 1em;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n}\n\nselect {\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	border: 1px solid #666666;\n	padding: 1px;\n	background-color: #FAFAFA;\n	font-size: 1em;\n}\n\noption {\n	padding-right: 1em;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\ntextarea {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	width: 60%;\n	padding: 2px;\n	font-size: 1em;\n	line-height: 1.4em;\n}\n\nlabel {\n	cursor: default;\n	padding-right: 5px;\n	color: #676767;\n}\n\nlabel input {\n	vertical-align: middle;\n}\n\nlabel img {\n	vertical-align: middle;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\nfieldset dl {\n	padding: 4px 0;\n}\n\nfieldset dt {\n	float: left;	\n	width: 40%;\n	text-align: left;\n	display: block;\n}\n\nfieldset dd {\n	margin-left: 41%;\n	vertical-align: top;\n	margin-bottom: 3px;\n}\n\n/* Specific layout 1 */\nfieldset.fields1 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields1 dd {\n	margin-left: 15em;\n	border-left-width: 0;\n}\n\nfieldset.fields1 {\n	background-color: transparent;\n}\n\nfieldset.fields1 div {\n	margin-bottom: 3px;\n}\n\n/* Set it back to 0px for the reCaptcha divs: PHPBB3-9587 */\nfieldset.fields1 #recaptcha_widget_div div {\n	margin-bottom: 0;\n}\n\n/* Specific layout 2 */\nfieldset.fields2 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields2 dd {\n	margin-left: 16em;\n	border-left-width: 0;\n}\n\n/* Form elements */\ndt label {\n	font-weight: bold;\n	text-align: left;\n}\n\ndd label {\n	white-space: nowrap;\n	color: #333;\n}\n\ndd input, dd textarea {\n	margin-right: 3px;\n}\n\ndd select {\n	width: auto;\n}\n\ndd textarea {\n	width: 85%;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n#timezone {\n	width: 95%;\n}\n\n* html #timezone {\n	width: 50%;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login {\n	margin-top: 5px;\n}\n\nfieldset.quick-login input {\n	width: auto;\n}\n\nfieldset.quick-login input.inputbox {\n	width: 15%;\n	vertical-align: middle;\n	margin-right: 5px;\n	background-color: #f3f3f3;\n}\n\nfieldset.quick-login label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\n/* Display options on viewtopic/viewforum pages  */\nfieldset.display-options {\n	text-align: center;\n	margin: 3px 0 5px 0;\n}\n\nfieldset.display-options label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.display-options a {\n	margin-top: 3px;\n}\n\n/* Display actions for ucp and mcp pages */\nfieldset.display-actions {\n	text-align: right;\n	line-height: 2em;\n	white-space: nowrap;\n	padding-right: 1em;\n}\n\nfieldset.display-actions label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.sort-options {\n	line-height: 2em;\n}\n\n/* MCP forum selection*/\nfieldset.forum-selection {\n	margin: 5px 0 3px 0;\n	float: right;\n}\n\nfieldset.forum-selection2 {\n	margin: 13px 0 3px 0;\n	float: right;\n}\n\n/* Jumpbox */\nfieldset.jumpbox {\n	text-align: right;\n	margin-top: 15px;\n	height: 2.5em;\n}\n\nfieldset.quickmod {\n	width: 50%;\n	float: right;\n	text-align: right;\n	height: 2.5em;\n}\n\n/* Submit button fieldset */\nfieldset.submit-buttons {\n	text-align: center;\n	vertical-align: middle;\n	margin: 5px 0;\n}\n\nfieldset.submit-buttons input {\n	vertical-align: middle;\n	padding-top: 3px;\n	padding-bottom: 3px;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n/* Buttons used in the editor */\n#format-buttons {\n	margin: 15px 0 2px 0;\n}\n\n#format-buttons input, #format-buttons select {\n	vertical-align: middle;\n}\n\n/* Main message box */\n#message-box {\n	width: 80%;\n}\n\n#message-box textarea {\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	width: 450px;\n	height: 270px;\n	min-width: 100%;\n	max-width: 100%;\n	font-size: 1.2em;\n	color: #333333;\n}\n\n/* Emoticons panel */\n#smiley-box {\n	width: 18%;\n	float: right;\n}\n\n#smiley-box img {\n	margin: 3px;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF;\n	border: 1px solid #c0c0c0;\n	color: #333333;\n	padding: 2px;\n	cursor: text;\n}\n\n.inputbox:hover {\n	border: 1px solid #eaeaea;\n}\n\n.inputbox:focus {\n	border: 1px solid #eaeaea;\n	color: #4b4b4b;\n}\n\ninput.inputbox	{ width: 85%; }\ninput.medium	{ width: 50%; }\ninput.narrow	{ width: 25%; }\ninput.tiny		{ width: 125px; }\n\ntextarea.inputbox {\n	width: 85%;\n}\n\n.autowidth {\n	width: auto !important;\n}\n\n/* Form button styles\n---------------------------------------- */\ninput.button1, input.button2 {\n	font-size: 1em;\n}\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	width: auto !important;\n	padding-top: 1px;\n	padding-bottom: 1px;\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	color: #000;\n	background: #FAFAFA none repeat-x top left;\n}\n\na.button1, input.button1 {\n	font-weight: bold;\n	border: 1px solid #666666;\n}\n\ninput.button3 {\n	padding: 0;\n	margin: 0;\n	line-height: 5px;\n	height: 12px;\n	background-image: none;\n	font-variant: small-caps;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border: 1px solid #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	text-decoration: none;\n	color: #000000;\n	padding: 2px 8px;\n	line-height: 250%;\n	vertical-align: text-bottom;\n	background-position: 0 1px;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border: 1px solid #BCBCBC;\n	background-position: 0 100%;\n	color: #BCBCBC;\n}\n\ninput.disabled {\n	font-weight: normal;\n	color: #666666;\n}\n\n/* Topic and forum Search */\n.search-box {\n	margin-top: 3px;\n	margin-left: 5px;\n	float: left;\n}\n\n.search-box input {\n}\n\ninput.search {\n	background-image: none;\n	background-repeat: no-repeat;\n	background-position: left 1px;\n	padding-left: 17px;\n}\n\n.full { width: 95%; }\n.medium { width: 50%;}\n.narrow { width: 25%;}\n.tiny { width: 10%;}\r\n/* Style Sheet Tweaks\n\nThese style definitions are mainly IE specific \ntweaks required due to its poor CSS support.\n-------------------------------------------------*/\n\n* html table, * html select, * html input { font-size: 100%; }\n* html hr { margin: 0; }\n* html span.corners-top, * html span.corners-bottom { background-image: url("{T_THEME_PATH}/images/corners_left.gif"); }\n* html span.corners-top span, * html span.corners-bottom span { background-image: url("{T_THEME_PATH}/images/corners_right.gif"); }\n\ntable.table1 {\n	width: 99%;		/* IE < 6 browsers */\n	/* Tantek hack */\n	voice-family: "\\"}\\"";\n	voice-family: inherit;\n	width: 100%;\n}\nhtml>body table.table1 { width: 100%; }	/* Reset 100% for opera */\n\n* html ul.topiclist li { position: relative; }\n* html .postbody h3 img { vertical-align: middle; }\n\n/* Form styles */\nhtml>body dd label input { vertical-align: text-bottom; }	/* Align checkboxes/radio buttons nicely */\n\n* html input.button1, * html input.button2 {\n	padding-bottom: 0;\n	margin-bottom: 1px;\n}\n\n/* Misc layout styles */\n* html .column1, * html .column2 { width: 45%; }\n\n/* Nice method for clearing floated blocks without having to insert any extra markup (like spacer above)\n   From http://www.positioniseverything.net/easyclearing.html \n#tabs:after, #minitabs:after, .post:after, .navbar:after, fieldset dl:after, ul.topiclist dl:after, ul.linklist:after, dl.polls:after {\n	content: "."; \n	display: block; \n	height: 0; \n	clear: both; \n	visibility: hidden;\n}*/\n\n.clearfix, #tabs, #minitabs, fieldset dl, ul.topiclist dl, dl.polls {\n	height: 1%;\n	overflow: hidden;\n}\n\n/* viewtopic fix */\n* html .post {\n	height: 25%;\n	overflow: hidden;\n}\n\n/* navbar fix */\n* html .clearfix, * html .navbar, ul.linklist {\n	height: 4%;\n	overflow: hidden;\n}\n\n/* Simple fix so forum and topic lists always have a min-height set, even in IE6\n	From http://www.dustindiaz.com/min-height-fast-hack */\ndl.icon {\n	min-height: 35px;\n	height: auto !important;\n	height: 35px;\n}\n\n* html li.row dl.icon dt {\n	height: 35px;\n	overflow: visible;\n}\n\n* html #search-box {\n	width: 25%;\n}\n\n/* Correctly clear floating for details on profile view */\n*:first-child+html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n* html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n/* Headerbar height fix for IE7 and below */\n* html #site-description p {\n	margin-bottom: 1.0em;\n}\n\n*:first-child+html #site-description p {\n	margin-bottom: 1.0em;\n}\n\n/* #minitabs fix for IE */\n.tabs-container {\n	zoom: 1;\n}\n\n#minitabs {\n	white-space: nowrap;\n	*min-width: 50%;\n}\r\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for common.css\n-------------------------------------------------------------- */\n\nhtml, body {\n	color: #797979;\n	background: url("{T_THEME_PATH}/images/background.jpg");\n	background-position: 50% 0px;\n}\n\nh1 {\n	color: #FFFFFF;\n}\n\nh2 {\n	color: #3c3c3c;\n}\n\nh3 {\n	border-bottom-color: #CCCCCC;\n	color: #616161;\n}\n\nhr {\n	border-color: #FFFFFF;\n	border-top-color: #CCCCCC;\n}\n\nhr.dashed {\n	border-top-color: #CCCCCC;\n}\n\n/* Search box\n--------------------------------------------- */\n\n#search-box {\n	color: #FFFFFF;\n}\n\n#search-box #keywords {\n	background-color: #FFF;\n}\n\n#search-box input {\n	border-color: #656565;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background-color: #8e8e8e;\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\n	color: #FFFFFF;\n}\n\n.navbar {\n	background-color: #e3e3e3;\n}\n\n.forabg, .forumbg {\n	background: none;\n}\n\n.panel {\n	background-color: #f4f4f4;\n	color: #3c3c3c;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #F9FAF9; }\n.bg2	{ background-color: #F4F4F4;  }\n.bg3	{ background-color: #e3e3e3; }\n\n.ucprowbg {\n	background-color: #e7e7e7;\n}\n\n.fieldsbg {\n	background-color: #eeeeee;\n}\n\nspan.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\n}\n\nspan.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\n}\n\nspan.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\n}\n\nspan.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\n}\n\n/* Horizontal lists\n----------------------------------------*/\n\nul.navlinks {\n	border-bottom-color: #FFFFFF;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 thead th {\n	color: #FFFFFF;\n}\n\ntable.table1 tbody tr {\n	border-color: #cccdd2;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #eaeaea;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #797979;\n}\n\ntable.table1 tbody td {\n	border-top-color: #FAFAFA;\n}\n\ntable.table1 tbody th {\n	border-bottom-color: #000000;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\ntable.info tbody th {\n	color: #000000;\n}\n\n/* Misc layout styles\n---------------------------------------- */\ndl.details dt {\n	color: #000000;\n}\n\ndl.details dd {\n	color: #797979;\n}\n\n.sep {\n	color: #848484;\n}\n\n/* Pagination\n---------------------------------------- */\n\n.pagination span strong {\n	color: #FFFFFF;\n	background-color: #929292;\n	border-color: #929292;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited {\n	color: #838383;\n	background-color: #f2f2f2;\n	border-color: #c7c7c7;\n}\n\n.pagination span a:hover {\n	border-color: #939393;\n	background-color: #939393;\n	color: #FFF;\n}\n\n.pagination span a:active {\n	color: #838383;\n	background-color: #f2f2f2;\n	border-color: #c7c7c7;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	background-image: url("{T_THEME_PATH}/images/icon_pages.gif");\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #939393;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n\n.copyright {\n	color: #555555;\n}\n\n.error {\n	color: #ffb733;\n}\n\n.reported {\n	background-color: #f7eeec;\n}\n\nli.reported:hover {\n	background-color: #ecddd5 !important;\n}\n.sticky, .announce {\n	/* you can add a background for stickies and announcements*/\n}\n\ndiv.rules {\n	background-color: #ecddd5;\n	color: #ffb733;\n}\n\np.rules {\n	background-color: #ecddd5;\n	background-image: none;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for links.css\n-------------------------------------------------------------- */\n\na:link	{ color: #585858; }\na:visited	{ color: #585858; }\na:hover	{ color: #d33f11; }\na:active	{ color: #939393; }\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #dddddd;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #eaeaea;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	color: #585858;\n}\n\n/* a.forumtitle:visited { color: #585858; } */\n\na.forumtitle:hover {\n	color: #ffb733;\n}\n\na.forumtitle:active {\n	color: #585858;\n}\n\na.topictitle {\n	color: #585858;\n}\n\n/* a.topictitle:visited { color: #939393; } */\n\na.topictitle:hover {\n	color: #ffb733;\n}\n\na.topictitle:active {\n	color: #585858;\n}\n\n/* Post body links */\n.postlink {\n	color: #939393;\n	border-bottom-color: #939393;\n}\n\n.postlink:visited {\n	color: #9d9d9d;\n	border-bottom-color: #9d9d9d;\n}\n\n.postlink:active {\n	color: #939393;\n}\n\n.postlink:hover {\n	background-color: #eaeaea;\n	color: #4a4a4a;\n}\n\n.signature a, .signature a:visited, .signature a:hover, .signature a:active {\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:visited, .postprofile dt.author a {\n	color: #585858;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	color: #d33f11;\n}\n\n.postprofile a:active {\n	color: #585858;\n}\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #585858;\n}\n\n.search .postprofile a:hover {\n	color: #d33f11;\n}\n\n/* Back to top of page */\na.top {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\na.top2 {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\n/* Arrow links  */\na.up		{ background-image: url("{T_THEME_PATH}/images/arrow_up.gif") }\na.down		{ background-image: url("{T_THEME_PATH}/images/arrow_down.gif") }\na.left		{ background-image: url("{T_THEME_PATH}/images/arrow_left.gif") }\na.right		{ background-image: url("{T_THEME_PATH}/images/arrow_right.gif") }\n\na.up:hover {\n	background-color: transparent;\n}\n\na.left:hover {\n	color: #939393;\n}\n\na.right:hover {\n	color: #939393;\n}\n\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for content.css\n-------------------------------------------------------------- */\n\nul.forums {\n	background: none;\n}\n\nul.topiclist li {\n	color: #6f6f6f;\n}\n\nul.topiclist dd {\n	border-left-color: #FFFFFF;\n}\n\n.rtl ul.topiclist dd {\n	border-right-color: #fff;\n	border-left-color: transparent;\n}\n\nul.topiclist li.row dt a.subforum.read {\n	background-image: url("{IMG_SUBFORUM_READ_SRC}");\n}\n\nul.topiclist li.row dt a.subforum.unread {\n	background-image: url("{IMG_SUBFORUM_UNREAD_SRC}");\n}\n\nli.row {\n	border-top-color:  #FFFFFF;\n	border-bottom-color: #e9e9e9;\n	padding: 6px;\n}\n\nli.row strong {\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #faefd9;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\n.rtl li.row:hover dd {\n	border-right-color: #CCCCCC;\n	border-left-color: transparent;\n}\n\nli.header dt, li.header dd {\n	color: #FFFFFF;\n}\n\n/* Forum list column styles */\nul.topiclist dd.searchextra {\n	color: #333333;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	color: #333333;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	color: #333333;\n}\n\n.content h2, .panel h2 {\n	color: #616161;\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.faq dt {\n	color: #333333;\n}\n\n.posthilit {\n	background-color: #f3cbbf;\n	color: #ffb733;\n}\n\n/* Post signature */\n.signature {\n	border-top-color: #CCCCCC;\n}\n\n/* Post noticies */\n.notice {\n	border-top-color:  #CCCCCC;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background-color: #EBEADD;\n	background-image: url("{T_THEME_PATH}/images/quote.gif");\n	border-color:#DBDBCE;\n}\n\n.rtl blockquote {\n	background-image: url("{T_THEME_PATH}/images/quote_rtl.gif");\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color:#EFEED9;\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #EBEADD;\n}\n\n/* Code block */\ndl.codebox {\n	background-color: #FFFFFF;\n	border-color: #dbdbdb;\n}\n\ndl.codebox dt {\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.codebox code {\n	color: #2E8B57;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #ff8200; }\n.syntaxdefault	{ color: #2c2c9a; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #007700; }\n.syntaxstring	{ color: #dd6b00; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	background-color: #FFFFFF;\n	border-color:  #dbdbdb;\n}\n\n.pm-message .attachbox {\n	background-color: #f4f5f5;\n}\n\n.attachbox dd {\n	border-top-color: #dbdbdb;\n}\n\n.attachbox p {\n	color: #666666;\n}\n\n.attachbox p.stats {\n	color: #666666;\n}\n\n.attach-image img {\n	border-color: #999999;\n}\n\n/* Inline image thumbnails */\n\ndl.file dd {\n	color: #666666;\n}\n\ndl.thumbnail img {\n	border-color: #666666;\n	background-color: #FFFFFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border-color: #939393;\n}\n\n/* Post poll styles\n----------------------------------------*/\n\nfieldset.polls dl {\n	border-top-color: #e7e7e7;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	color: #000000;\n}\n\nfieldset.polls dd div {\n	color: #FFFFFF;\n}\n\n.rtl .pollbar1, .rtl .pollbar2, .rtl .pollbar3, .rtl .pollbar4, .rtl .pollbar5 {\n	border-right-color: transparent;\n}\n\n.pollbar1 {\n	background-color: #ffdf91;\n	border-bottom-color: #742d16;\n	border-right-color: #742d16;\n}\n\n.rtl .pollbar1 {\n	border-left-color: #742d16;\n}\n\n.pollbar2 {\n	background-color: #be3f1e;\n	border-bottom-color: #8c361c;\n	border-right-color: #8c361c;\n}\n\n.rtl .pollbar2 {\n	border-left-color: #8c361c;\n}\n\n.pollbar3 {\n	background-color: #d13e1a;\n	border-bottom-color: #ffdf91;\n	border-right-color: #ffdf91;\n}\n\n.rtl .pollbar3 {\n	border-left-color: #ffdf91;\n}\n\n.pollbar4 {\n	background-color: #e43d16;\n	border-bottom-color: #be3f1e;\n	border-right-color: #be3f1e;\n}\n\n.rtl .pollbar4 {\n	border-left-color: #be3f1e;\n}\n\n.pollbar5 {\n	background-color: #ffb733;\n	border-bottom-color: #d13e1a;\n	border-right-color: #d13e1a;\n}\n\n.rtl .pollbar5 {\n	border-left-color: #d13e1a;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	color: #666666;\n	border-left-color: #FFFFFF;\n}\n\n.rtl .postprofile {\n	border-right-color: #FFFFFF;\n	border-left-color: transparent;\n}\n\n.pm .postprofile {\n	border-left-color: #DDDDDD;\n}\n\n.rtl .pm .postprofile {\n	border-right-color: #DDDDDD;\n	border-left-color: transparent;\n}\n\n.postprofile strong {\n	color: #000000;\n}\n\n.online {\n	background-image: url("{IMG_ICON_USER_ONLINE_SRC}");\n	margin-top: -5px;\n}\n\n.online dt {\n	margin-top: 5px;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for buttons.css\n-------------------------------------------------------------- */\n\n/* Big button images */\n.reply-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_REPLY_SRC}"); }\n.post-icon span		{ background-image: url("{IMG_BUTTON_TOPIC_NEW_SRC}"); }\n.locked-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_LOCKED_SRC}"); }\n.pmreply-icon span	{ background-image: url("{IMG_BUTTON_PM_REPLY_SRC}") ;}\n.newpm-icon span 	{ background-image: url("{IMG_BUTTON_PM_NEW_SRC}") ;}\n.forwardpm-icon span	{ background-image: url("{IMG_BUTTON_PM_FORWARD_SRC}") ;}\n\na.print {\n	background-image: url("{T_THEME_PATH}/images/icon_print.gif");\n}\n\na.sendemail {\n	background-image: url("{T_THEME_PATH}/images/icon_sendemail.gif");\n}\n\na.fontsize {\n	background-image: url("{T_THEME_PATH}/images/icon_fontsize.gif");\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\n.icon-faq						{ background-image: url("{T_THEME_PATH}/images/icon_faq.gif"); }\n.icon-members					{ background-image: url("{T_THEME_PATH}/images/icon_members.gif"); }\n.icon-home						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\n.icon-ucp						{ background-image: url("{T_THEME_PATH}/images/icon_ucp.gif"); }\n.icon-register					{ background-image: url("{T_THEME_PATH}/images/icon_register.gif"); }\n.icon-logout					{ background-image: url("{T_THEME_PATH}/images/icon_logout.gif"); }\n.icon-bookmark					{ background-image: url("{T_THEME_PATH}/images/icon_bookmark.gif"); }\n.icon-bump						{ background-image: url("{T_THEME_PATH}/images/icon_bump.gif"); }\n.icon-subscribe					{ background-image: url("{T_THEME_PATH}/images/icon_subscribe.gif"); }\n.icon-unsubscribe				{ background-image: url("{T_THEME_PATH}/images/icon_unsubscribe.gif"); }\n.icon-pages						{ background-image: url("{T_THEME_PATH}/images/icon_pages.gif"); }\n.icon-search					{ background-image: url("{T_THEME_PATH}/images/icon_search.gif"); }\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background-image: url("{IMG_ICON_CONTACT_EMAIL_SRC}"); }\n.aim-icon, .aim-icon a			{ background-image: url("{IMG_ICON_CONTACT_AIM_SRC}"); }\n.yahoo-icon, .yahoo-icon a		{ background-image: url("{IMG_ICON_CONTACT_YAHOO_SRC}"); }\n.web-icon, .web-icon a			{ background-image: url("{IMG_ICON_CONTACT_WWW_SRC}"); }\n.msnm-icon, .msnm-icon a			{ background-image: url("{IMG_ICON_CONTACT_MSNM_SRC}"); }\n.icq-icon, .icq-icon a			{ background-image: url("{IMG_ICON_CONTACT_ICQ_SRC}"); }\n.jabber-icon, .jabber-icon a		{ background-image: url("{IMG_ICON_CONTACT_JABBER_SRC}"); }\n.pm-icon, .pm-icon a				{ background-image: url("{IMG_ICON_CONTACT_PM_SRC}"); }\n.quote-icon, .quote-icon a		{ background-image: url("{IMG_ICON_POST_QUOTE_SRC}"); }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background-image: url("{IMG_ICON_POST_REPORT_SRC}"); }\n.edit-icon, .edit-icon a			{ background-image: url("{IMG_ICON_POST_EDIT_SRC}"); }\n.delete-icon, .delete-icon a		{ background-image: url("{IMG_ICON_POST_DELETE_SRC}"); }\n.info-icon, .info-icon a			{ background-image: url("{IMG_ICON_POST_INFO_SRC}"); }\n.warn-icon, .warn-icon a			{ background-image: url("{IMG_ICON_USER_WARN_SRC}"); } /* Need updated warn icon */\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for cp.css\n-------------------------------------------------------------- */\n\n/* Main CP box\n----------------------------------------*/\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #c0c0c0;\n}\n\n#cp-main .panel li.row {\n	border-bottom-color: #cdcdcd;\n	border-top-color: #F9F9F9;\n}\n\nul.cplist {\n	border-top-color: #cdcdcd;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #FFFFFF;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	border-bottom-color: #333333;\n}\n\n#cp-main .pm-message {\n	border-color: #e6e6e6;\n	background-color: #FFFFFF;\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs a {\n	background-image: url("{T_THEME_PATH}/images/bg_tabs1.gif");\n}\n\n#tabs a span {\n	background-image: url("{T_THEME_PATH}/images/bg_tabs2.gif");\n	color: #797979;\n}\n\n#tabs a:hover span {\n	color: #ffb733;\n}\n\n#tabs .activetab a {\n	border-bottom-color: #e3e3e3;\n}\n\n#tabs .activetab a span {\n	color: #333333;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs li {\n	background-color: #efefef;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n\n/* Link styles for the sub-section links */\n#navigation a {\n	color: #333;\n	background-color: #cdcdcd;\n	background-image: url("{T_THEME_PATH}/images/bg_menu.gif");\n}\n\n.rtl #navigation a {\n	background-image: url("{T_THEME_PATH}/images/bg_menu_rtl.gif");\n	background-position: 0 100%;\n}\n\n#navigation a:hover {\n	background-image: none;\n	background-color: #c6c6c6;\n	color: #ffb733;\n}\n\n#navigation #active-subsection a {\n	color: #d33f11;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #d33f11;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #f7f7f7;\n}\n\ndl.mini dt {\n	color: #616161;\n}\n\n/* PM Styles\n----------------------------------------*/\n/* PM Message history */\n.current {\n	color: #000000 !important;\n}\n\n/* PM marking colours */\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #ffb733;\n	border-right-color: #ffb733;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	border-color: #ff8100;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	border-color: #c3c3c3;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	border-color: #9d9d9d;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	border-color: #000000;\n}\n\n/* Avatar gallery */\n#gallery label {\n	background-color: #FFFFFF;\n	border-color: #CCC;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for forms.css\n-------------------------------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nselect {\n	border-color: #666666;\n	background-color: #FAFAFA;\n	color: #000;\n}\n\nlabel {\n	color: #616161;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\ndd label {\n	color: #333;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login input.inputbox {\n	background-color: #f4f5f5;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n#message-box textarea {\n	color: #333333;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF; \n	border-color: #c7c7c7;\n	color: #333333;\n}\n\n.inputbox:hover {\n	border-color: #8d8d8d;\n}\n\n.inputbox:focus {\n	border-color: #8d8d8d;\n	color: #565656;\n}\n\n/* Form button styles\n---------------------------------------- */\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	color: #000;\n	background-color: #FAFAFA;\n	background-image: url("{T_THEME_PATH}/images/bg_button.gif");\n}\n\na.button1, input.button1 {\n	border-color: #666666;\n}\n\ninput.button3 {\n	background-image: none;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border-color: #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	color: #000000;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border-color: #ffb733;\n	color: #ffb733;\n}\n\ninput.search {\n	background-image: url("{T_THEME_PATH}/images/icon_textbox_search.gif");\n}\n\ninput.disabled {\n	color: #666666;\n}\r\n.fl {float: left;}\r\n.fr {float: right;}\r\n.cb {clear: both;}\r\n\r\na#logo {\r\n	/* See: https://www.phpbb.com/kb/article/changing-your-board-logo/\r\n	for changing logo image */\r\n	margin-top: 10px;\r\n	margin-left: 10px;\r\n}\r\n\r\n#banner {\r\n	padding-bottom: 20px;\r\n	background: url("{T_THEME_PATH}/images/example-banner.png") repeat left top;\r\n}\r\n\r\nul.userlinks {\r\n	margin: 0;\r\n	padding: 0;\r\n	list-style: none;\r\n	margin-right: 20px;\r\n	margin-top: 20px;\r\n}\r\n\r\nul.userlinks li {\r\n	float: left;\r\n	margin-left: 10px;\r\n}\r\n\r\nul.userlinks li a {\r\n	display: block;\r\n	font-size: 1.3em;\r\n	background: rgba(247,247,247,0.5);\r\n	font-family: "beb", Arial, Helvetica, sans-serif;\r\n	word-spacing: 5px;\r\n	border-bottom: 3px solid #e0591e;\r\n	line-height: 80px;\r\n	padding: 0 30px;\r\n}\r\n\r\nul.userlinks li a:hover {\r\n	text-decoration: none;\r\n}\r\n\r\nul.userlinks li a strong {\r\n	color: #e0591e;\r\n	margin-right: 5px;\r\n}\r\n\r\n.navigation {\r\n	background: #1e2025;\r\n	font-family: "beb", Arial, Helvetica, sans-serif;\r\n	word-spacing: 5px;\r\n	margin-bottom: 20px;\r\n}\r\n\r\n.navigation ul {\r\n	list-style: none;\r\n	margin: 0;\r\n	padding: 0;\r\n}\r\n\r\n.navigation ul li {\r\n	float: left;\r\n}\r\n\r\n.navigation ul li a {\r\n	display: block;\r\n	border-bottom: 3px solid #1e2025;\r\n	padding: 16px 16px 12px;\r\n	font-size: 1.3em;\r\n	color: #ffffff;\r\n}\r\n\r\n.navigation ul li.active > a, .navigation ul li a:hover {\r\n	border-bottom-color: #e0591e;\r\n	text-decoration: none;\r\n}\r\n\r\n.navigation ul li.parent > a {\r\n	background: url("{T_THEME_PATH}/images/drop.png") no-repeat right 50%;	\r\n}\r\n\r\n.navigation ul li a span { /* wrap nav items in <span> for orange text */\r\n	color: #e0591e;\r\n}\r\n\r\n/* Optional: Keep navbar parent link underlined when hovering over sub-menu items */\r\n/* .navigation ul li:hover > a {\r\n	border-bottom-color: #e0591e;\r\n}*/\r\n\r\n.navigation ul li ul { /* main menu drop down */\r\n	position: absolute;\r\n	background: #1E2025;\r\n	display: none;\r\n	z-index: 9999;\r\n}\r\n\r\n.navigation ul li:hover > ul {\r\n	display: block;\r\n}\r\n\r\n.navigation ul li ul li {\r\n	float: none;\r\n}\r\n\r\n.forumbg span.corners-top, .forumbg span.corners-bottom, .forabg span.corners-top, .forabg span.corners-bottom {\r\n	display: none;\r\n}\r\n\r\nli.header {\r\n	background: #1e2025;\r\n	padding: 10px;\r\n}\r\n\r\nli.header dl.icon dt {\r\n	font-weight: normal;\r\n}\r\n\r\n\r\nli.header dl.icon dt a:hover {\r\n	text-decoration: none;\r\n}\r\n\r\n.alpha-copyright {\r\n	text-align: center;\r\n	font-size: 1em;\r\n	padding-bottom: 40px;\r\n	font-family: ''contentfont'';\r\n}\r\n\r\n.alpha-copyright a {\r\n	color: #ff4e00;\r\n}\r\n\r\n.breadcrumbs {\r\n	font-size: 1.3em;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	margin-bottom: 20px;\r\n}\r\n\r\ntable#memberlist th {\r\n     background: #1E2025;\r\n     padding: 10px;\r\n}\r\n\r\n.ForumTitle {\r\n	padding: 0% 3%;\r\n	text-align: center;\r\n	font-family: ''bebas_neueregular'';\r\n	padding-top: 20px;\r\n	font-size: 55px;\r\n	line-height: 55px;\r\n	color: #FFB733;\r\n	text-shadow: 2px 2px #d5d5d5;\r\n}\r\n\r\n.ForumTitle a {\r\n	color: #FFB733;\r\n}\r\n\r\n.ForumDescription {\r\n	padding: 1% 0% 3% 0%;\r\n	font-size: 20px;\r\n	letter-spacing: -1px;\r\n	text-align: center;\r\n	text-shadow: 2px 2px #d5d5d5;\r\n	font-family: ''contentfont'';\r\n	color: #939393;\r\n}\r\n\r\n.author {\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	color: #828282;\r\n	font-size: 11px;\r\n	line-height: 1.48em;\r\n	font-weight: normal;\r\n}');

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_topics`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `topic_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_poster` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_time_limit` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_first_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_first_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_last_view_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poll_start` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_length` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_max_options` tinyint(4) NOT NULL DEFAULT '1',
  `poll_last_vote` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `phpbb_topics`
--

INSERT INTO `phpbb_topics` (`topic_id`, `forum_id`, `icon_id`, `topic_attachment`, `topic_approved`, `topic_reported`, `topic_title`, `topic_poster`, `topic_time`, `topic_time_limit`, `topic_views`, `topic_replies`, `topic_replies_real`, `topic_status`, `topic_type`, `topic_first_post_id`, `topic_first_poster_name`, `topic_first_poster_colour`, `topic_last_post_id`, `topic_last_poster_id`, `topic_last_poster_name`, `topic_last_poster_colour`, `topic_last_post_subject`, `topic_last_post_time`, `topic_last_view_time`, `topic_moved_id`, `topic_bumped`, `topic_bumper`, `poll_title`, `poll_start`, `poll_length`, `poll_max_options`, `poll_last_vote`, `poll_vote_change`) VALUES
(1, 2, 0, 0, 1, 0, 'Welcome to phpBB3', 2, 1387582309, 0, 46, 1, 1, 0, 0, 1, 'TheNavigator', 'AA0000', 2, 2, 'TheNavigator', 'AA0000', 'Re: Welcome to phpBB3', 1387991216, 1404939221, 0, 0, 0, '', 0, 0, 1, 0, 0),
(2, 2, 0, 0, 1, 0, 'test', 2, 1389069041, 0, 30, 3, 3, 0, 0, 3, 'TheNavigator', 'AA0000', 6, 2, 'TheNavigator', 'AA0000', 'Re: test', 1389069769, 1404939220, 0, 0, 0, '', 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_topics_posted`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_topics_posted`
--

INSERT INTO `phpbb_topics_posted` (`user_id`, `topic_id`, `topic_posted`) VALUES
(2, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_topics_track`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_topics_watch`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_users`
--

CREATE TABLE IF NOT EXISTS `phpbb_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '3',
  `user_permissions` mediumtext COLLATE utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passchg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_email_hash` bigint(20) NOT NULL DEFAULT '0',
  `user_birthday` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastmark` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpost_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpage` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_confirm_key` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_search` int(11) unsigned NOT NULL DEFAULT '0',
  `user_warnings` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_warning` int(11) unsigned NOT NULL DEFAULT '0',
  `user_login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `user_inactive_reason` tinyint(2) NOT NULL DEFAULT '0',
  `user_inactive_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_timezone` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_dateformat` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_full_folder` int(11) NOT NULL DEFAULT '-3',
  `user_emailtime` int(11) unsigned NOT NULL DEFAULT '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_topic_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_post_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_post_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'a',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_notify_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_options` int(11) unsigned NOT NULL DEFAULT '230271',
  `user_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_type` tinyint(2) NOT NULL DEFAULT '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_sig` mediumtext COLLATE utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_from` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_icq` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_aim` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_yim` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_msnm` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_jabber` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_website` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_occ` text COLLATE utf8_bin NOT NULL,
  `user_interests` text COLLATE utf8_bin NOT NULL,
  `user_actkey` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newpasswd` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_form_salt` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_reminded` tinyint(4) NOT NULL DEFAULT '0',
  `user_reminded_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

--
-- Dumping data for table `phpbb_users`
--

INSERT INTO `phpbb_users` (`user_id`, `user_type`, `group_id`, `user_permissions`, `user_perm_from`, `user_ip`, `user_regdate`, `username`, `username_clean`, `user_password`, `user_passchg`, `user_pass_convert`, `user_email`, `user_email_hash`, `user_birthday`, `user_lastvisit`, `user_lastmark`, `user_lastpost_time`, `user_lastpage`, `user_last_confirm_key`, `user_last_search`, `user_warnings`, `user_last_warning`, `user_login_attempts`, `user_inactive_reason`, `user_inactive_time`, `user_posts`, `user_lang`, `user_timezone`, `user_dst`, `user_dateformat`, `user_style`, `user_rank`, `user_colour`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_message_rules`, `user_full_folder`, `user_emailtime`, `user_topic_show_days`, `user_topic_sortby_type`, `user_topic_sortby_dir`, `user_post_show_days`, `user_post_sortby_type`, `user_post_sortby_dir`, `user_notify`, `user_notify_pm`, `user_notify_type`, `user_allow_pm`, `user_allow_viewonline`, `user_allow_viewemail`, `user_allow_massemail`, `user_options`, `user_avatar`, `user_avatar_type`, `user_avatar_width`, `user_avatar_height`, `user_sig`, `user_sig_bbcode_uid`, `user_sig_bbcode_bitfield`, `user_from`, `user_icq`, `user_aim`, `user_yim`, `user_msnm`, `user_jabber`, `user_website`, `user_occ`, `user_interests`, `user_actkey`, `user_newpasswd`, `user_form_salt`, `user_new`, `user_reminded`, `user_reminded_time`) VALUES
(1, 2, 1, '00000000003khra3nk\ni1cjyo000000\ni1cjyo000000', 0, '', 1387582309, 'Anonymous', 'anonymous', '', 0, 0, '', 0, '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'd M Y H:i', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ec4fd8e78aded17a', 1, 0, 0),
(2, 3, 5, '005m9rzik0zjzik0xs\ni1cjyo000000\nqlc4pi000000', 0, '127.0.0.1', 1387582309, 'Founder', 'thenavigator', 'comcom4', 0, 0, 'sasa@unlicrea.com', 64063034216, ' 0- 0-   0', 1389796312, 0, 1389069769, '../index.php', '', 0, 0, 0, 1, 0, 0, 6, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 1, 'AA0000', 0, 1, 1388107855, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', 'I am interested in games and coding and studying and mathematics. I''m a physics nerd and a boring person who''s typing on a keyboard not finding anything else to type whatsoever.', '', '', 'bcee77fa52018612', 0, 0, 0),
(3, 2, 6, '', 0, '', 1387582313, 'AdsBot [Google]', 'adsbot [google]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '9f97c73f643271e3', 0, 0, 0),
(4, 2, 6, '', 0, '', 1387582313, 'Alexa [Bot]', 'alexa [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '59ebe9c16b7bd956', 0, 0, 0),
(5, 2, 6, '', 0, '', 1387582313, 'Alta Vista [Bot]', 'alta vista [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'f540b1e4d817033d', 0, 0, 0),
(6, 2, 6, '', 0, '', 1387582313, 'Ask Jeeves [Bot]', 'ask jeeves [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '889aecaa4699eff3', 0, 0, 0),
(7, 2, 6, '\ni1cjyo000000\ni1cjr4000000', 0, '', 1387582313, 'Baidu [Spider]', 'baidu [spider]', '', 1387582313, 0, '', 0, '', 1404405680, 1387582313, 0, '../index.php', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ce4237af735cd2cb', 0, 0, 0),
(8, 2, 6, '', 0, '', 1387582313, 'Bing [Bot]', 'bing [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ad8e8b2148fe6a52', 0, 0, 0),
(9, 2, 6, '', 0, '', 1387582313, 'Exabot [Bot]', 'exabot [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e88d176ef3200eb8', 0, 0, 0),
(10, 2, 6, '', 0, '', 1387582313, 'FAST Enterprise [Crawler]', 'fast enterprise [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '98376a5b2181e16a', 0, 0, 0),
(11, 2, 6, '', 0, '', 1387582313, 'FAST WebCrawler [Crawler]', 'fast webcrawler [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '68aa0b826d2d979b', 0, 0, 0),
(12, 2, 6, '', 0, '', 1387582313, 'Francis [Bot]', 'francis [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c72c804163e3b24d', 0, 0, 0),
(13, 2, 6, '', 0, '', 1387582313, 'Gigabot [Bot]', 'gigabot [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6bd2e3f0880382fd', 0, 0, 0),
(14, 2, 6, '', 0, '', 1387582313, 'Google Adsense [Bot]', 'google adsense [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '764110f5a97718b8', 0, 0, 0),
(15, 2, 6, '', 0, '', 1387582313, 'Google Desktop', 'google desktop', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cf3c7deb3e1dd587', 0, 0, 0),
(16, 2, 6, '', 0, '', 1387582313, 'Google Feedfetcher', 'google feedfetcher', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ac0dd39cd4936056', 0, 0, 0),
(17, 2, 6, '\ni1cjyo000000\ni1cjr4000000', 0, '', 1387582313, 'Google [Bot]', 'google [bot]', '', 1387582313, 0, '', 0, '', 1404904765, 1387582313, 0, '../index.php', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5fb30622c0b2cf23', 0, 0, 0),
(18, 2, 6, '', 0, '', 1387582313, 'Heise IT-Markt [Crawler]', 'heise it-markt [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6b9e66dbb442c1af', 0, 0, 0),
(19, 2, 6, '', 0, '', 1387582313, 'Heritrix [Crawler]', 'heritrix [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'f026cee7df4298fc', 0, 0, 0),
(20, 2, 6, '', 0, '', 1387582313, 'IBM Research [Bot]', 'ibm research [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '306a53ce3f85ddec', 0, 0, 0),
(21, 2, 6, '', 0, '', 1387582313, 'ICCrawler - ICjobs', 'iccrawler - icjobs', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '3b25825f46ffa813', 0, 0, 0),
(22, 2, 6, '', 0, '', 1387582313, 'ichiro [Crawler]', 'ichiro [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2b01bf341df49367', 0, 0, 0),
(23, 2, 6, '', 0, '', 1387582313, 'Majestic-12 [Bot]', 'majestic-12 [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cf1272eef970331f', 0, 0, 0),
(24, 2, 6, '', 0, '', 1387582313, 'Metager [Bot]', 'metager [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5b7fe3540755da81', 0, 0, 0),
(25, 2, 6, '', 0, '', 1387582313, 'MSN NewsBlogs', 'msn newsblogs', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '15730741764a4e51', 0, 0, 0),
(26, 2, 6, '', 0, '', 1387582313, 'MSN [Bot]', 'msn [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'b0eb292b5a6be166', 0, 0, 0),
(27, 2, 6, '', 0, '', 1387582313, 'MSNbot Media', 'msnbot media', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '9f819c0a227fdc32', 0, 0, 0),
(28, 2, 6, '', 0, '', 1387582313, 'Nutch [Bot]', 'nutch [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '14432365898d72fc', 0, 0, 0),
(29, 2, 6, '', 0, '', 1387582313, 'Online link [Validator]', 'online link [validator]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '530fdb772f71442c', 0, 0, 0),
(30, 2, 6, '', 0, '', 1387582313, 'psbot [Picsearch]', 'psbot [picsearch]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'a2311c2b155164e5', 0, 0, 0),
(31, 2, 6, '', 0, '', 1387582313, 'Sensis [Crawler]', 'sensis [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '5a458458a539787e', 0, 0, 0),
(32, 2, 6, '', 0, '', 1387582313, 'SEO Crawler', 'seo crawler', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e9ec23a992f4e156', 0, 0, 0),
(33, 2, 6, '', 0, '', 1387582313, 'Seoma [Crawler]', 'seoma [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0ae2d61f46d2a1dd', 0, 0, 0),
(34, 2, 6, '', 0, '', 1387582313, 'SEOSearch [Crawler]', 'seosearch [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '4db5f82b046b560b', 0, 0, 0),
(35, 2, 6, '', 0, '', 1387582313, 'Snappy [Bot]', 'snappy [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '27fc5ee226bb8087', 0, 0, 0),
(36, 2, 6, '', 0, '', 1387582313, 'Steeler [Crawler]', 'steeler [crawler]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'b996ee6ea4c93760', 0, 0, 0),
(37, 2, 6, '', 0, '', 1387582313, 'Telekom [Bot]', 'telekom [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6b809fecff28eaaa', 0, 0, 0),
(38, 2, 6, '', 0, '', 1387582313, 'TurnitinBot [Bot]', 'turnitinbot [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'fd02fea11054e640', 0, 0, 0),
(39, 2, 6, '', 0, '', 1387582313, 'Voyager [Bot]', 'voyager [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '52d14c5eec099c17', 0, 0, 0),
(40, 2, 6, '', 0, '', 1387582313, 'W3 [Sitesearch]', 'w3 [sitesearch]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2e1819c56f06a83a', 0, 0, 0),
(41, 2, 6, '', 0, '', 1387582313, 'W3C [Linkcheck]', 'w3c [linkcheck]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8f07356a89ecfaf2', 0, 0, 0),
(42, 2, 6, '', 0, '', 1387582313, 'W3C [Validator]', 'w3c [validator]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '4fe79fd805694489', 0, 0, 0),
(43, 2, 6, '', 0, '', 1387582313, 'YaCy [Bot]', 'yacy [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '71bd5ca67490e4d3', 0, 0, 0),
(44, 2, 6, '', 0, '', 1387582313, 'Yahoo MMCrawler [Bot]', 'yahoo mmcrawler [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd722b32c448dbaed', 0, 0, 0),
(45, 2, 6, '', 0, '', 1387582313, 'Yahoo Slurp [Bot]', 'yahoo slurp [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1c0cb48aa12a480e', 0, 0, 0),
(46, 2, 6, '', 0, '', 1387582313, 'Yahoo [Bot]', 'yahoo [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '50ce88f3401c9d77', 0, 0, 0),
(47, 2, 6, '', 0, '', 1387582313, 'YahooSeeker [Bot]', 'yahooseeker [bot]', '', 1387582313, 0, '', 0, '', 0, 1387582313, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 0, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '24c3b698dea39ad6', 0, 0, 0),
(55, 0, 2, '', 0, '', 1387822487, 'test010', 'test010', '$H$9x5D.XFH1jegSDwrbGne6dKwqvImhe/', 1387822487, 0, 'test010@unlicrea.com', 419453730120, '', 1387896562, 1387822487, 0, '../index.php', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'eef7d2fc645e376a', 0, 0, 0),
(56, 0, 2, '', 0, '', 1387844144, 'aa', 'aa', '$H$9fh2IIDdtYCjY6CHcGAinF49ZDdvCs1', 1387844144, 0, 'aa', 1264910952, '', 0, 1387844144, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2b25cee31d1fbaba', 0, 0, 0),
(57, 0, 2, '', 0, '', 1387844229, 'lalalala', 'lalalala', '$H$9wNp1ivqdY9AA.6I6mUvun/WgrbwMq0', 1387844229, 0, 'lala@unlicrea.com', 248494295517, '', 0, 1387844229, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'f8841cfcae073a96', 0, 0, 0),
(58, 0, 2, '', 0, '', 1387891476, 'sasa', 'sasa', '$H$9rQCu.T2FxSbwuUlQAb8WQjBOubZWe1', 1387891476, 0, 'sasa@unlicrea.com', 142847540917, '', 0, 1387891476, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '16ea127ccd91adca', 0, 0, 0),
(59, 0, 2, '', 0, '', 1387891780, 'mama', 'mama', '$H$9aPMrUZkQ9nOObGZ9xfkM5l/IohiKv/', 1387891780, 0, 'mama@unlicrea.com', 285633145617, '', 0, 1387891780, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1d8487a610c284b8', 0, 0, 0),
(60, 0, 2, '', 0, '', 1387891949, 'kaka', 'kaka', '$H$9SA5MpnprzgmrIrbq1rEAZSxyid7EP0', 1387891949, 0, 'kaka@unlicrea.com', 79785452217, '', 0, 1387891949, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '836233d4876d637a', 0, 0, 0),
(61, 0, 2, '00000000006xv29nwg\ni1cjyo000000\nqlc4pi000000', 0, '', 1387892187, 'qqqq', 'qqqq', '$H$9I0LuUn6FbEHkz5tYL03Kna2yeXfxp0', 1387892187, 0, 'fast@unlicrea.com', 283613125317, '', 1389796307, 1387892187, 1388113333, '../index.php', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 1388104586, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '02a8b611c5c9b2be', 0, 0, 0),
(62, 0, 2, '', 0, '', 1389050691, 'masta', 'masta', '$H$9KBrxXWj0n4ZwuOJxp0t9UYR5HuDBK/', 1389050691, 0, 'masta@masta.com', 356865753315, '', 0, 1389050691, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c6aa133313fe1055', 0, 0, 0),
(63, 0, 2, '', 0, '', 1389051032, 'tasta', 'tasta', '$H$97Fj3YgM71dnlsf2.I7elFFyOZe7jx/', 1389051032, 0, 'tasta@tasta.com', 387174207115, '', 0, 1389051032, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '652c0d58fac89183', 0, 0, 0),
(64, 0, 2, '00000000006xv29nwg\ni1cjyo000000\nqlc4pi000000', 0, '', 1404425622, 'LittleBlueGuy', 'littleblueguy', '$H$9/AdyFuMHP41rn2XH9fq.3kK.BGXVz/', 1404425622, 0, 'joseph.clayton.marsden@gmail.com', 199294167132, '', 1404962172, 1404425622, 0, '../index.php', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '90b8176d622b677c', 0, 0, 0),
(65, 0, 2, '', 0, '', 1404534461, 'nigga', 'nigga', '$H$96gzef0soHoU2DCv/88ACLFKNZT/CG1', 1404534461, 0, 'nigga@gmil.com', 111395585314, '', 0, 1404534461, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'a5a17a30d45256a4', 0, 0, 0),
(66, 0, 2, '', 0, '', 1405037353, 'testuser', 'testuser', '$H$9dvVjSxCbV4SPcpak3Hgmq8KnyoIWQ0', 1405037353, 0, 'lol@googlle.com', 39249038315, '', 0, 1405037353, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'D M d, Y g:i a', 6, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '260bf6a34ce66576', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_user_group`
--

CREATE TABLE IF NOT EXISTS `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phpbb_user_group`
--

INSERT INTO `phpbb_user_group` (`group_id`, `user_id`, `group_leader`, `user_pending`) VALUES
(1, 1, 0, 0),
(2, 2, 0, 0),
(4, 2, 0, 0),
(5, 2, 1, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(6, 8, 0, 0),
(6, 9, 0, 0),
(6, 10, 0, 0),
(6, 11, 0, 0),
(6, 12, 0, 0),
(6, 13, 0, 0),
(6, 14, 0, 0),
(6, 15, 0, 0),
(6, 16, 0, 0),
(6, 17, 0, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(6, 20, 0, 0),
(6, 21, 0, 0),
(6, 22, 0, 0),
(6, 23, 0, 0),
(6, 24, 0, 0),
(6, 25, 0, 0),
(6, 26, 0, 0),
(6, 27, 0, 0),
(6, 28, 0, 0),
(6, 29, 0, 0),
(6, 30, 0, 0),
(6, 31, 0, 0),
(6, 32, 0, 0),
(6, 33, 0, 0),
(6, 34, 0, 0),
(6, 35, 0, 0),
(6, 36, 0, 0),
(6, 37, 0, 0),
(6, 38, 0, 0),
(6, 39, 0, 0),
(6, 40, 0, 0),
(6, 41, 0, 0),
(6, 42, 0, 0),
(6, 43, 0, 0),
(6, 44, 0, 0),
(6, 45, 0, 0),
(6, 46, 0, 0),
(6, 47, 0, 0),
(2, 48, 0, 0),
(7, 48, 0, 0),
(2, 49, 0, 0),
(2, 50, 0, 0),
(2, 51, 0, 0),
(2, 52, 0, 0),
(2, 53, 0, 0),
(2, 54, 0, 0),
(2, 55, 0, 0),
(2, 56, 0, 0),
(2, 57, 0, 0),
(2, 58, 0, 0),
(2, 59, 0, 0),
(2, 60, 0, 0),
(2, 61, 0, 0),
(2, 62, 0, 0),
(2, 63, 0, 0),
(10, 61, 0, 0),
(10, 2, 0, 0),
(2, 64, 0, 0),
(2, 65, 0, 0),
(2, 66, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_warnings`
--

CREATE TABLE IF NOT EXISTS `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_words`
--

CREATE TABLE IF NOT EXISTS `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phpbb_zebra`
--

CREATE TABLE IF NOT EXISTS `phpbb_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `zebra_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `foe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`zebra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
