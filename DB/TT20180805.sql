CREATE DATABASE  IF NOT EXISTS `trucktracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `trucktracker`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: trucktracker
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tt_data`
--

DROP TABLE IF EXISTS `tt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_data` (
  `dID` int(11) NOT NULL AUTO_INCREMENT,
  `dataSet` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `loc` int(11) NOT NULL,
  `locRadius` int(11) NOT NULL,
  `scania` int(11) NOT NULL,
  `volvo` int(11) NOT NULL,
  `mercedes` int(11) NOT NULL,
  `man` int(11) NOT NULL,
  `daf` int(11) NOT NULL,
  `reanult` int(11) NOT NULL,
  `iveco` int(11) NOT NULL,
  PRIMARY KEY (`dID`),
  KEY `dataCreator_idx` (`creator`),
  KEY `dataLoc_idx` (`loc`),
  KEY `dataSet_idx` (`dataSet`),
  CONSTRAINT `dataCreator` FOREIGN KEY (`creator`) REFERENCES `tt_users` (`uid`),
  CONSTRAINT `dataLoc` FOREIGN KEY (`loc`) REFERENCES `tt_loc` (`locid`),
  CONSTRAINT `dataSet` FOREIGN KEY (`dataSet`) REFERENCES `tt_dataset` (`datasetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_dataset`
--

DROP TABLE IF EXISTS `tt_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_dataset` (
  `dataSetID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`dataSetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_group_rights`
--

DROP TABLE IF EXISTS `tt_group_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_group_rights` (
  `rID` int(11) NOT NULL,
  `gID` int(11) NOT NULL,
  PRIMARY KEY (`rID`,`gID`),
  KEY `zwGroup_idx` (`gID`),
  CONSTRAINT `zwGroup` FOREIGN KEY (`gID`) REFERENCES `tt_rgroups` (`gid`),
  CONSTRAINT `zwRight` FOREIGN KEY (`rID`) REFERENCES `tt_rights` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_loc`
--

DROP TABLE IF EXISTS `tt_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_loc` (
  `locID` int(11) NOT NULL AUTO_INCREMENT,
  `postcode` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `region` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`locID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_rgroups`
--

DROP TABLE IF EXISTS `tt_rgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_rgroups` (
  `gID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`gID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_rights`
--

DROP TABLE IF EXISTS `tt_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_rights` (
  `rID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` enum('read','write') NOT NULL,
  `dataSet` int(11) DEFAULT NULL,
  PRIMARY KEY (`rID`),
  KEY `dataSetRights_idx` (`dataSet`),
  CONSTRAINT `dataSetRights` FOREIGN KEY (`dataSet`) REFERENCES `tt_dataset` (`datasetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt_users`
--

DROP TABLE IF EXISTS `tt_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tt_users` (
  `uID` int(11) NOT NULL AUTO_INCREMENT,
  `eMail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hLoc` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`uID`),
  KEY `userLoc_idx` (`hLoc`),
  CONSTRAINT `userLoc` FOREIGN KEY (`hLoc`) REFERENCES `tt_loc` (`locid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-05 13:30:13
