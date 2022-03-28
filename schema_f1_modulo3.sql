CREATE DATABASE  IF NOT EXISTS `modulo3_novo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `modulo3_novo`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: modulo3_novo
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `circuits`
--

DROP TABLE IF EXISTS `circuits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuits` (
  `circuitID` int NOT NULL,
  `circuitref` varchar(255) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `location` varchar(80) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `alt` int DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`circuitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constructorresults`
--

DROP TABLE IF EXISTS `constructorresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructorresults` (
  `constructorResultsID` int NOT NULL,
  `raceID` int DEFAULT NULL,
  `constructorID` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`constructorResultsID`),
  KEY `raceID` (`raceID`),
  KEY `constructorID` (`constructorID`),
  CONSTRAINT `constructorresults_ibfk_1` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`),
  CONSTRAINT `constructorresults_ibfk_2` FOREIGN KEY (`constructorID`) REFERENCES `constructors` (`constructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constructors`
--

DROP TABLE IF EXISTS `constructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructors` (
  `constructorID` int NOT NULL,
  `constructorRef` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `nationality` varchar(40) DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`constructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constructorstandings`
--

DROP TABLE IF EXISTS `constructorstandings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructorstandings` (
  `constructorStandingsID` int NOT NULL,
  `raceID` int DEFAULT NULL,
  `constructorID` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `positionText` varchar(2) DEFAULT NULL,
  `wins` int DEFAULT NULL,
  PRIMARY KEY (`constructorStandingsID`),
  KEY `raceID` (`raceID`),
  KEY `constructorID` (`constructorID`),
  CONSTRAINT `constructorstandings_ibfk_1` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`),
  CONSTRAINT `constructorstandings_ibfk_2` FOREIGN KEY (`constructorID`) REFERENCES `constructors` (`constructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driverID` int NOT NULL,
  `driverRef` varchar(50) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `code` char(3) DEFAULT NULL,
  `forename` varchar(40) DEFAULT NULL,
  `surname` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(40) DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`driverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driverstandings`
--

DROP TABLE IF EXISTS `driverstandings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driverstandings` (
  `driverStandingsID` int NOT NULL,
  `raceID` int DEFAULT NULL,
  `driverID` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `positionText` varchar(5) DEFAULT NULL,
  `wins` int DEFAULT NULL,
  PRIMARY KEY (`driverStandingsID`),
  KEY `driverID` (`driverID`),
  KEY `raceID` (`raceID`),
  CONSTRAINT `driverstandings_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driverID`),
  CONSTRAINT `driverstandings_ibfk_2` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `laptimes`
--

DROP TABLE IF EXISTS `laptimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptimes` (
  `raceID` int DEFAULT NULL,
  `driverID` int DEFAULT NULL,
  `lap` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  `milliseconds` int DEFAULT NULL,
  KEY `driverID` (`driverID`),
  KEY `raceID` (`raceID`),
  CONSTRAINT `laptimes_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driverID`),
  CONSTRAINT `laptimes_ibfk_2` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pitstops`
--

DROP TABLE IF EXISTS `pitstops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pitstops` (
  `raceID` int DEFAULT NULL,
  `driverID` int DEFAULT NULL,
  `stop` int DEFAULT NULL,
  `lap` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `milliseconds` int DEFAULT NULL,
  KEY `driverID` (`driverID`),
  KEY `raceID` (`raceID`),
  CONSTRAINT `pitstops_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driverID`),
  CONSTRAINT `pitstops_ibfk_2` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qualifying`
--

DROP TABLE IF EXISTS `qualifying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualifying` (
  `qualifyID` int NOT NULL,
  `raceID` int DEFAULT NULL,
  `driverID` int DEFAULT NULL,
  `constructorID` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `q1` time DEFAULT NULL,
  `q2` time DEFAULT NULL,
  `q3` time DEFAULT NULL,
  PRIMARY KEY (`qualifyID`),
  KEY `driverID` (`driverID`),
  KEY `raceID` (`raceID`),
  KEY `constructorID` (`constructorID`),
  CONSTRAINT `qualifying_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driverID`),
  CONSTRAINT `qualifying_ibfk_2` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`),
  CONSTRAINT `qualifying_ibfk_3` FOREIGN KEY (`constructorID`) REFERENCES `constructors` (`constructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `raceID` int NOT NULL,
  `year` int DEFAULT NULL,
  `round` int DEFAULT NULL,
  `circuitID` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`raceID`),
  KEY `circuitID` (`circuitID`),
  CONSTRAINT `races_ibfk_1` FOREIGN KEY (`circuitID`) REFERENCES `circuits` (`circuitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `resultID` int NOT NULL,
  `raceID` int DEFAULT NULL,
  `driverID` int DEFAULT NULL,
  `constructorID` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `grid` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `positionText` varchar(20) DEFAULT NULL,
  `positionOrder` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `laps` int DEFAULT NULL,
  `time` varchar(15) DEFAULT NULL,
  `milliseconds` int DEFAULT NULL,
  `fastestLap` int DEFAULT NULL,
  `rank_title` int DEFAULT NULL,
  `fastestLapTime` time DEFAULT NULL,
  `fastestLapSpeed` double DEFAULT NULL,
  `statusID` int DEFAULT NULL,
  PRIMARY KEY (`resultID`),
  KEY `driverID` (`driverID`),
  KEY `raceID` (`raceID`),
  KEY `constructorID` (`constructorID`),
  KEY `statusID` (`statusID`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driverID`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`raceID`) REFERENCES `races` (`raceID`),
  CONSTRAINT `results_ibfk_3` FOREIGN KEY (`constructorID`) REFERENCES `constructors` (`constructorID`),
  CONSTRAINT `results_ibfk_4` FOREIGN KEY (`statusID`) REFERENCES `status` (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `year` int DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `statusID` int NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`statusID`)
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

-- Dump completed on 2022-03-28 13:52:41
