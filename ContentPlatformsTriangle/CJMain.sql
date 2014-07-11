-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2014 at 04:11 AM
-- Server version: 5.5.37-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CJMain`
--

-- --------------------------------------------------------

--
-- Table structure for table `GeneralSettings`
--

CREATE TABLE IF NOT EXISTS `GeneralSettings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SettingKey` text NOT NULL,
  `SettingValue` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `GeneralSettings`
--

INSERT INTO `GeneralSettings` (`ID`, `SettingKey`, `SettingValue`) VALUES
(1, 'AvailableEarlyAccessLicenses', '10');

-- --------------------------------------------------------

--
-- Table structure for table `PayPalOperations`
--

CREATE TABLE IF NOT EXISTS `PayPalOperations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `PaymentAmount` float NOT NULL,
  `OrderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TransactionID` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `PayPalOperations`
--

INSERT INTO `PayPalOperations` (`ID`, `UserID`, `PaymentAmount`, `OrderTime`, `TransactionID`) VALUES
(1, 8, 10, '2014-01-04 19:15:28', '53B581681R877871H'),
(2, 6, 10, '2014-01-04 19:34:32', '3LY03218M7000851Y'),
(3, 6, 10, '2014-01-04 19:37:38', '3HD56854B05023845'),
(4, 6, 10, '2014-01-04 19:40:27', '3P240090FL2897251'),
(5, 6, 10, '2014-01-04 19:46:38', '3WG00946H02386130'),
(6, 6, 10, '2014-01-04 19:51:23', '85524097HC172911B'),
(7, 6, 10, '2014-01-04 19:55:05', '7NA62467PC0845436'),
(8, 8, 5, '2014-01-06 19:16:27', '4U28759421362205A'),
(9, 8, 4.99, '2014-01-06 19:34:51', '74N53224L1817622F'),
(10, 6, 4.99, '2014-01-08 00:49:24', '3GX89607AC456431W'),
(11, 8, 4.99, '2014-01-09 02:12:09', '6GX70655JE598002U'),
(12, 8, 4.99, '2014-01-09 02:18:42', '2XK10031MK120331D'),
(13, 8, 4.99, '2014-01-09 02:20:04', '4K18841352027653K'),
(14, 8, 4.99, '2014-01-09 02:22:08', '7PA97186M01845246');

-- --------------------------------------------------------

--
-- Table structure for table `PayPalTokens`
--

CREATE TABLE IF NOT EXISTS `PayPalTokens` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Token` text NOT NULL,
  `UserID` int(11) NOT NULL,
  `Cleared` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `PayPalTokens`
--

INSERT INTO `PayPalTokens` (`ID`, `Token`, `UserID`, `Cleared`) VALUES
(1, 'EC-8T702933GA4046530', 8, 1),
(2, 'EC-65C96928NR626374L', 6, 1),
(3, 'EC-3YH35054UY341703M', 6, 1),
(4, 'EC-8PG97111FK2053916', 6, 1),
(5, 'EC-76848018984272047', 6, 1),
(6, 'EC-92G76969443242304', 6, 1),
(7, 'EC-2E8094601H177552T', 6, 1),
(8, 'EC-3L489559RL028664K', 6, 0),
(9, 'EC-2B44459990973411T', 6, 0),
(10, 'EC-01G70458F3540502S', 6, 0),
(11, 'EC-5JV50615WS1988219', 8, 1),
(12, 'EC-3JT71756WH985080S', 8, 1),
(13, 'EC-7SU45714U0523224A', 8, 0),
(14, 'EC-9L7030057D675204K', 6, 0),
(15, 'EC-2L698627UK3930026', 6, 0),
(16, 'EC-7X828770NW6600713', 6, 0),
(17, 'EC-5X62181795027604S', 6, 0),
(18, 'EC-0LS359997K9086237', 6, 0),
(19, 'EC-4KH07511H2018540Y', 6, 0),
(20, 'EC-6X828122A93285929', 6, 0),
(21, 'EC-7WL34120JY840971W', 6, 1),
(22, 'EC-46B703733H3783427', 8, 1),
(23, 'EC-2Y064269XJ374462S', 8, 1),
(24, 'EC-2R779663SL394921D', 8, 1),
(25, 'EC-6WW55596P0472222R', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `RememberUserTokens`
--

CREATE TABLE IF NOT EXISTS `RememberUserTokens` (
  `true` int(10) unsigned DEFAULT NULL,
  `UserID` varchar(60) DEFAULT NULL,
  `Token` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `Salt` text NOT NULL,
  `Verified` tinyint(1) NOT NULL DEFAULT '0',
  `RegistrationTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EarlyAccess` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`ID`, `Username`, `Email`, `Password`, `Salt`, `Verified`, `RegistrationTimestamp`, `EarlyAccess`) VALUES
(8, 'Founder', 'founder@yoursite.com', '82dfcdb3ec91e4cccd85854826471eeb0d821b29f5201bdd33970e48ed290969d669dc1a6bcf5f8bf2db7d723dca7abc20a0bbcb7fa4f8cbfcb211052aedf4ed', 'É"ôÝcÝâ z+', 1, '2014-07-11 00:10:22', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
