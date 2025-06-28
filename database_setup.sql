-- Database: upload
CREATE DATABASE IF NOT EXISTS `upload`;
USE `upload`;

-- Table for Public Records/Submissions
CREATE TABLE IF NOT EXISTS `tb_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `Approval` varchar(10) NOT NULL DEFAULT 'OFF',
  `Decline` varchar(10) NOT NULL DEFAULT 'OFF',
  `Departments` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table for Contact Support / Unique Code Requests
CREATE TABLE IF NOT EXISTS `contactUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table for System Admins (Manage Roles and Unique Codes)
CREATE TABLE IF NOT EXISTS `systemadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `uniqueCode` varchar(20) DEFAULT 'MINT-2024',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Admin Account (admin/admin123)
INSERT IGNORE INTO `systemadmin` (`fullname`, `username`, `password`, `uniqueCode`) 
VALUES ('System Admin', 'admin', 'admin123', 'MINT-2024');

-- Table for Main Record Officer
CREATE TABLE IF NOT EXISTS `admintable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT 'Record Officer',
  `deleted` varchar(10) NOT NULL DEFAULT 'OFF',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Record Officer Account (ro/ro123)
INSERT IGNORE INTO `admintable` (`fullname`, `username`, `password`) 
VALUES ('Record Officer', 'ro', 'ro123');

-- Departmental Tables
CREATE TABLE IF NOT EXISTS `itdepartmenttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `Approval` varchar(10) NOT NULL DEFAULT 'OFF',
  `Decline` varchar(10) NOT NULL DEFAULT 'OFF',
  `Departments` varchar(50) DEFAULT NULL,
  `Assign` varchar(10) NOT NULL DEFAULT 'OFF',
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `seconddepartmenttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `Approval` varchar(10) NOT NULL DEFAULT 'OFF',
  `Decline` varchar(10) NOT NULL DEFAULT 'OFF',
  `Departments` varchar(50) DEFAULT NULL,
  `Assign` varchar(10) NOT NULL DEFAULT 'OFF',
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table for Stored Records (Archive)
CREATE TABLE IF NOT EXISTS `storerecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `Decline` varchar(10) NOT NULL DEFAULT 'ON',
  `Restore` varchar(10) NOT NULL DEFAULT 'OFF',
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- IT Admin and other department admins
CREATE TABLE IF NOT EXISTS `itadmintable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT 'IT Department',
  `deleted` varchar(10) NOT NULL DEFAULT 'OFF',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `computeradmintable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT 'Computer Department',
  `deleted` varchar(10) NOT NULL DEFAULT 'OFF',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
