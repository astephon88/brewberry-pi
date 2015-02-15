-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: beer
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Beer`
--

DROP TABLE IF EXISTS `Beer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Beer` (
  `Tap` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `name` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `brewery` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `style` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `abv` varchar(5) COLLATE latin1_german2_ci DEFAULT NULL,
  `ibu` double DEFAULT NULL,
  `srm` double DEFAULT NULL,
  `volume` double unsigned DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beer`
--

LOCK TABLES `Beer` WRITE;
/*!40000 ALTER TABLE `Beer` DISABLE KEYS */;
INSERT INTO `Beer` VALUES ('1','Empty','','','',0,0,0,0),('2','Empty','','','',0,0,0,0),('3','Empty','','','',0,0,0,0),('4','Empty','','','',0,0,0,0);
/*!40000 ALTER TABLE `Beer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temps`
--

DROP TABLE IF EXISTS `temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temps` (
  `type` varchar(255) COLLATE latin1_german2_ci DEFAULT NULL,
  `value` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temps`
--

LOCK TABLES `temps` WRITE;
/*!40000 ALTER TABLE `temps` DISABLE KEYS */;
INSERT INTO `temps` VALUES ('current',48),('setting',48);
/*!40000 ALTER TABLE `temps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-14 19:51:46
