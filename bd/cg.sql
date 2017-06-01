-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: cg
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.10.1

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
-- Table structure for table `_group`
--

DROP TABLE IF EXISTS `_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_group` (
  `theme` varchar(255) NOT NULL,
  `block_message` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('public','friend','work','quiz') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_group`
--

LOCK TABLES `_group` WRITE;
/*!40000 ALTER TABLE `_group` DISABLE KEYS */;
INSERT INTO `_group` VALUES ('festa',0,7,'public'),('festa',0,8,'public');
/*!40000 ALTER TABLE `_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_range`
--

DROP TABLE IF EXISTS `_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_range` (
  `f_boost_shop` int(11) NOT NULL,
  `f_stock` int(11) NOT NULL,
  `rang_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rang_id`),
  KEY `f_stock_range` (`f_stock`),
  CONSTRAINT `f_stock_range` FOREIGN KEY (`f_stock`) REFERENCES `stock` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_range`
--

LOCK TABLES `_range` WRITE;
/*!40000 ALTER TABLE `_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_return`
--

DROP TABLE IF EXISTS `_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_return` (
  `reusable` tinyint(1) DEFAULT '0',
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `cost` float(10,2) NOT NULL DEFAULT '0.00',
  `way` enum('product','money','card') NOT NULL,
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_return`
--

LOCK TABLES `_return` WRITE;
/*!40000 ALTER TABLE `_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_trigger`
--

DROP TABLE IF EXISTS `_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_trigger` (
  `appointment` tinyint(1) NOT NULL DEFAULT '0',
  `commemorative_date` tinyint(1) NOT NULL DEFAULT '0',
  `system_notification` tinyint(1) NOT NULL DEFAULT '0',
  `message` tinyint(1) NOT NULL DEFAULT '0',
  `validity` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_user` tinyint(1) NOT NULL DEFAULT '0',
  `price` tinyint(1) NOT NULL DEFAULT '0',
  `date_in` datetime DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `trigger_id` int(11) NOT NULL,
  PRIMARY KEY (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_trigger`
--

LOCK TABLES `_trigger` WRITE;
/*!40000 ALTER TABLE `_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acesse`
--

DROP TABLE IF EXISTS `acesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acesse` (
  `acesse_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_profile` int(11) NOT NULL,
  `f_stock` int(11) NOT NULL,
  PRIMARY KEY (`acesse_id`),
  KEY `f_profile_acesse` (`f_profile`),
  KEY `f_stock_acesse` (`f_stock`),
  CONSTRAINT `f_profile_acesse` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `f_stock_acesse` FOREIGN KEY (`f_stock`) REFERENCES `stock` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acesse`
--

LOCK TABLES `acesse` WRITE;
/*!40000 ALTER TABLE `acesse` DISABLE KEYS */;
/*!40000 ALTER TABLE `acesse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_return` int(11) NOT NULL,
  `f_business` int(11) NOT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `f_busines_activity` (`f_business`),
  KEY `f_return_activity` (`f_return`),
  CONSTRAINT `f_busines_activity` FOREIGN KEY (`f_business`) REFERENCES `business` (`business_id`),
  CONSTRAINT `f_return_activity` FOREIGN KEY (`f_return`) REFERENCES `_return` (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apointment_book`
--

DROP TABLE IF EXISTS `apointment_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apointment_book` (
  `date` datetime DEFAULT NULL,
  `f_profile` int(11) NOT NULL,
  `f_doing` int(11) NOT NULL,
  `relationship_level` enum('owner','adm','work','friend','user') NOT NULL DEFAULT 'user',
  KEY `c_profile_appointment_book` (`f_profile`),
  KEY `c_doing_apponitment_book` (`f_doing`),
  CONSTRAINT `c_doing_apponitment_book` FOREIGN KEY (`f_doing`) REFERENCES `doing` (`doing_id`),
  CONSTRAINT `c_profile_appointment_book` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apointment_book`
--

LOCK TABLES `apointment_book` WRITE;
/*!40000 ALTER TABLE `apointment_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `apointment_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banck_account`
--

DROP TABLE IF EXISTS `banck_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banck_account` (
  `agency` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `f_profile` int(11) NOT NULL,
  KEY `f_profile` (`f_profile`),
  CONSTRAINT `banck_account_ibfk_1` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banck_account`
--

LOCK TABLES `banck_account` WRITE;
/*!40000 ALTER TABLE `banck_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `banck_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boost_ranking`
--

DROP TABLE IF EXISTS `boost_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boost_ranking` (
  `boost_ranking_id` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `period_start` datetime DEFAULT NULL,
  `period_end` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `value` float(10,2) DEFAULT '0.00',
  PRIMARY KEY (`boost_ranking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boost_ranking`
--

LOCK TABLES `boost_ranking` WRITE;
/*!40000 ALTER TABLE `boost_ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `boost_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `rate` float(10,2) DEFAULT NULL,
  `value` float(10,2) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `date_request` date NOT NULL,
  `date_delivery` date NOT NULL,
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `yers` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `color` enum('black','white','silver','gray','red','blue','green') DEFAULT NULL,
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('maintenance','rented','sold','in use','damaged','stolen','idle') NOT NULL DEFAULT 'idle',
  `mark` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `mileage` float(10,3) NOT NULL DEFAULT '0.000',
  `plate` varchar(255) NOT NULL,
  `origion_states` varchar(255) NOT NULL,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code` (
  `code_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_dinamic` tinyint(1) DEFAULT '0',
  `type_static` tinyint(1) DEFAULT '0',
  `f_image` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  PRIMARY KEY (`code_id`),
  KEY `f_image_code` (`f_image`),
  CONSTRAINT `f_image_code` FOREIGN KEY (`f_image`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communicate`
--

DROP TABLE IF EXISTS `communicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communicate` (
  `block_user` tinyint(1) NOT NULL DEFAULT '0',
  `block_message` tinyint(1) NOT NULL DEFAULT '0',
  `block_lock` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `type` enum('owner','adm','work','friend','user') NOT NULL DEFAULT 'user',
  `f_group` int(11) NOT NULL,
  `f_message` int(11) NOT NULL,
  `f_profile` int(11) NOT NULL,
  KEY `f_group` (`f_group`),
  KEY `f_profile` (`f_profile`),
  KEY `f_message` (`f_message`),
  CONSTRAINT `communicate_ibfk_1` FOREIGN KEY (`f_group`) REFERENCES `_group` (`group_id`),
  CONSTRAINT `communicate_ibfk_2` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `communicate_ibfk_3` FOREIGN KEY (`f_message`) REFERENCES `message` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communicate`
--

LOCK TABLES `communicate` WRITE;
/*!40000 ALTER TABLE `communicate` DISABLE KEYS */;
/*!40000 ALTER TABLE `communicate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `cnpj` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `f_profile` int(11) NOT NULL,
  KEY `f_profile_company` (`f_profile`),
  CONSTRAINT `f_profile_company` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `relationship_level` enum('owner','adm','work','friend','user') NOT NULL DEFAULT 'user',
  `date_begine` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `vision` enum('work','friend','user') NOT NULL DEFAULT 'user',
  `f_profile` int(11) NOT NULL,
  KEY `f_profile_profile` (`f_profile`),
  CONSTRAINT `f_profile_profile` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `text` varchar(255) NOT NULL,
  `tipe_of_restriction` enum('public','proprietário') NOT NULL DEFAULT 'public',
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `target` enum('sale','rent','service') NOT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_event`
--

DROP TABLE IF EXISTS `date_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_event` (
  `date` datetime DEFAULT NULL,
  `f_event` int(11) NOT NULL,
  KEY `c_date_event` (`f_event`),
  CONSTRAINT `c_date_event` FOREIGN KEY (`f_event`) REFERENCES `event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_event`
--

LOCK TABLES `date_event` WRITE;
/*!40000 ALTER TABLE `date_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `delivery_date` datetime DEFAULT NULL,
  `delivery_id` int(11) NOT NULL,
  `value` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design` (
  `sheet_size_width` int(11) NOT NULL DEFAULT '1024',
  `sheet_size_height` int(11) NOT NULL DEFAULT '720',
  `design_id` int(11) NOT NULL AUTO_INCREMENT,
  `cut_line_width` int(11) NOT NULL DEFAULT '10',
  `cut_line_height` int(11) NOT NULL DEFAULT '3',
  `f_type` int(11) NOT NULL,
  PRIMARY KEY (`design_id`),
  KEY `f_type_design` (`f_type`),
  CONSTRAINT `f_type_design` FOREIGN KEY (`f_type`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designe`
--

DROP TABLE IF EXISTS `designe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designe` (
  `sheet_size_heght` float(10,3) DEFAULT '720.000',
  `sheet_size_width` float(10,3) DEFAULT '1024.000',
  `design_id` int(11) NOT NULL AUTO_INCREMENT,
  `cut_line_height` float(10,3) DEFAULT '720.000',
  `cut_line_width` float(10,3) DEFAULT '1024.000',
  PRIMARY KEY (`design_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designe`
--

LOCK TABLES `designe` WRITE;
/*!40000 ALTER TABLE `designe` DISABLE KEYS */;
/*!40000 ALTER TABLE `designe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doing`
--

DROP TABLE IF EXISTS `doing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doing` (
  `name` varchar(255) NOT NULL,
  `climate` varchar(255) DEFAULT NULL,
  `doing_id` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`doing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doing`
--

LOCK TABLES `doing` WRITE;
/*!40000 ALTER TABLE `doing` DISABLE KEYS */;
/*!40000 ALTER TABLE `doing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enable_promotion`
--

DROP TABLE IF EXISTS `enable_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enable_promotion` (
  `f_promotion` int(11) NOT NULL,
  `f_profile` int(11) NOT NULL,
  `enable_promotion_id` int(11) NOT NULL,
  PRIMARY KEY (`enable_promotion_id`),
  KEY `f_enable_p_promotion` (`f_promotion`),
  KEY `f_enabe_p_profile` (`f_profile`),
  CONSTRAINT `f_enabe_p_profile` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `f_enable_p_promotion` FOREIGN KEY (`f_promotion`) REFERENCES `promotion` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enable_promotion`
--

LOCK TABLES `enable_promotion` WRITE;
/*!40000 ALTER TABLE `enable_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `enable_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation` (
  `evaluation_id` int(11) NOT NULL,
  `speed` int(11) DEFAULT '0',
  `star` int(11) DEFAULT '0',
  `helpful` int(11) DEFAULT '0',
  `clearing` int(11) DEFAULT '0',
  `trust` int(11) DEFAULT '0',
  `multitasking` int(11) DEFAULT '0',
  `blacklist` int(11) DEFAULT '0',
  `apresentation` int(11) DEFAULT '0',
  PRIMARY KEY (`evaluation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `profit` float(10,2) DEFAULT NULL,
  `boost_ray_size` int(11) NOT NULL DEFAULT '100',
  `boost_deep` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fines` (
  `deadline` date NOT NULL,
  `number` varchar(255) NOT NULL,
  `value` float(10,2) NOT NULL,
  `f_car` int(11) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `f_car_fines` (`f_car`),
  CONSTRAINT `f_car_fines` FOREIGN KEY (`f_car`) REFERENCES `car` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines`
--

LOCK TABLES `fines` WRITE;
/*!40000 ALTER TABLE `fines` DISABLE KEYS */;
/*!40000 ALTER TABLE `fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_for_trigger`
--

DROP TABLE IF EXISTS `flag_for_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flag_for_trigger` (
  `flag_for_trigger_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_trigger` int(11) NOT NULL,
  `f_profile` int(11) NOT NULL,
  PRIMARY KEY (`flag_for_trigger_id`),
  KEY `f_flag_profile` (`f_profile`),
  KEY `f_flag_trigger` (`f_trigger`),
  CONSTRAINT `f_flag_profile` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `f_flag_trigger` FOREIGN KEY (`f_trigger`) REFERENCES `_trigger` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_for_trigger`
--

LOCK TABLES `flag_for_trigger` WRITE;
/*!40000 ALTER TABLE `flag_for_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `flag_for_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelance`
--

DROP TABLE IF EXISTS `freelance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freelance` (
  `rg` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `cnh` varchar(50) NOT NULL,
  `f_profile` int(11) NOT NULL,
  KEY `f_profile_freelance` (`f_profile`),
  CONSTRAINT `f_profile_freelance` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelance`
--

LOCK TABLES `freelance` WRITE;
/*!40000 ALTER TABLE `freelance` DISABLE KEYS */;
/*!40000 ALTER TABLE `freelance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_box`
--

DROP TABLE IF EXISTS `generic_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_box` (
  `mirror` tinyint(1) NOT NULL DEFAULT '0',
  `margin` float(10,3) NOT NULL DEFAULT '0.100',
  `border` float(10,3) NOT NULL DEFAULT '0.100',
  `padding` float(10,3) NOT NULL DEFAULT '0.100',
  `rotation` float(10,3) NOT NULL DEFAULT '0.000',
  `generic_box_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_x` float(10,3) NOT NULL DEFAULT '0.000',
  `origin_y` float(10,3) NOT NULL DEFAULT '0.000',
  `size_heigh` float(10,3) NOT NULL DEFAULT '720.000',
  `size_width` float(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`generic_box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_box`
--

LOCK TABLES `generic_box` WRITE;
/*!40000 ALTER TABLE `generic_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `is_thumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `limk` varchar(255) NOT NULL,
  `f_generic_box` int(11) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `f_generic_box_image` (`f_generic_box`),
  CONSTRAINT `f_generic_box_image` FOREIGN KEY (`f_generic_box`) REFERENCES `generic_box` (`generic_box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immobile`
--

DROP TABLE IF EXISTS `immobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `immobile` (
  `position_latitude` float(10,3) NOT NULL,
  `position_longitude` float(10,3) NOT NULL,
  `immobile_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('maintenance','rented','sold','in use','damaged','idle') NOT NULL DEFAULT 'idle',
  `price` float(10,2) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `size_width` float(10,3) DEFAULT NULL,
  `size_height` float(10,3) DEFAULT NULL,
  PRIMARY KEY (`immobile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immobile`
--

LOCK TABLES `immobile` WRITE;
/*!40000 ALTER TABLE `immobile` DISABLE KEYS */;
/*!40000 ALTER TABLE `immobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introduce`
--

DROP TABLE IF EXISTS `introduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `introduce` (
  `introduce_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_music` int(11) NOT NULL,
  `f_personality` int(11) NOT NULL,
  PRIMARY KEY (`introduce_id`),
  KEY `f_music_introduce` (`f_music`),
  KEY `f_personality_introduce` (`f_personality`),
  CONSTRAINT `f_music_introduce` FOREIGN KEY (`f_music`) REFERENCES `music` (`music_id`),
  CONSTRAINT `f_personality_introduce` FOREIGN KEY (`f_personality`) REFERENCES `personality` (`personality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introduce`
--

LOCK TABLES `introduce` WRITE;
/*!40000 ALTER TABLE `introduce` DISABLE KEYS */;
/*!40000 ALTER TABLE `introduce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `text` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `evaluation` int(11) DEFAULT '0',
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `stile` enum('rock','pop','jazz','samba','rap','sertanejo','national music','classic','instrument','electonc','indie') DEFAULT NULL,
  `live` tinyint(1) NOT NULL DEFAULT '0',
  `age_of_classification` int(11) NOT NULL DEFAULT '16',
  `music_id` int(11) NOT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participates`
--

DROP TABLE IF EXISTS `participates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participates` (
  `relationship_level` enum('owner','adm','work','friend','custumer','user') NOT NULL DEFAULT 'user',
  `participates_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_event` int(11) NOT NULL,
  `f_profile` int(11) NOT NULL,
  `f_personality` int(11) NOT NULL,
  PRIMARY KEY (`participates_id`),
  KEY `f_event_participates` (`f_event`),
  KEY `f_profile_participates` (`f_profile`),
  KEY `f_personality_participates` (`f_personality`),
  CONSTRAINT `f_event_participates` FOREIGN KEY (`f_event`) REFERENCES `event` (`event_id`),
  CONSTRAINT `f_personality_participates` FOREIGN KEY (`f_personality`) REFERENCES `personality` (`personality_id`),
  CONSTRAINT `f_profile_participates` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participates`
--

LOCK TABLES `participates` WRITE;
/*!40000 ALTER TABLE `participates` DISABLE KEYS */;
/*!40000 ALTER TABLE `participates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personality`
--

DROP TABLE IF EXISTS `personality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personality` (
  `clouthes` enum('light','beach','night','casual','social','fantasy') NOT NULL DEFAULT 'casual',
  `food` enum('homely','fast','gourmet','candy','salty','hot','cold','exotic') DEFAULT NULL,
  `ornamentation` tinyint(1) DEFAULT '0',
  `time_min` datetime DEFAULT NULL,
  `time_max` datetime DEFAULT NULL,
  `personality_id` int(11) NOT NULL,
  PRIMARY KEY (`personality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personality`
--

LOCK TABLES `personality` WRITE;
/*!40000 ALTER TABLE `personality` DISABLE KEYS */;
/*!40000 ALTER TABLE `personality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `present`
--

DROP TABLE IF EXISTS `present`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `present` (
  `present_id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) DEFAULT '0',
  `f_stock` int(11) NOT NULL,
  `f_design` int(11) NOT NULL,
  PRIMARY KEY (`present_id`),
  KEY `f_stock_present` (`f_stock`),
  KEY `f_design_presents` (`f_design`),
  CONSTRAINT `f_design_presents` FOREIGN KEY (`f_design`) REFERENCES `design` (`design_id`),
  CONSTRAINT `f_stock_present` FOREIGN KEY (`f_stock`) REFERENCES `stock` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `present`
--

LOCK TABLES `present` WRITE;
/*!40000 ALTER TABLE `present` DISABLE KEYS */;
/*!40000 ALTER TABLE `present` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `lot` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `prive` float(10,3) NOT NULL,
  `volume` float(10,5) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `weight` float(10,5) DEFAULT NULL,
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) DEFAULT NULL,
  `validity` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('bruno',NULL,NULL,'',NULL,1),('fabio',NULL,NULL,'',NULL,2),('renata',NULL,NULL,'',NULL,3),('celso',NULL,NULL,'',NULL,4),('maria',NULL,NULL,'',NULL,5),('walter',NULL,NULL,'',NULL,6);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `type_unity` int(11) DEFAULT '0',
  `type_price` float(10,2) DEFAULT '0.00',
  `amount` int(11) DEFAULT '0',
  `date_begin` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provides`
--

DROP TABLE IF EXISTS `provides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provides` (
  `provides_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_profile` int(11) NOT NULL,
  `f_contract` int(11) NOT NULL,
  `f_business` int(11) NOT NULL,
  PRIMARY KEY (`provides_id`),
  KEY `f_profile_provides` (`f_profile`),
  KEY `f_contracit_provides` (`f_contract`),
  KEY `f_business_provides` (`f_business`),
  CONSTRAINT `f_business_provides` FOREIGN KEY (`f_business`) REFERENCES `business` (`business_id`),
  CONSTRAINT `f_contracit_provides` FOREIGN KEY (`f_contract`) REFERENCES `contract` (`contract_id`),
  CONSTRAINT `f_profile_provides` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provides`
--

LOCK TABLES `provides` WRITE;
/*!40000 ALTER TABLE `provides` DISABLE KEYS */;
/*!40000 ALTER TABLE `provides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranking` (
  `raking_id` int(11) NOT NULL,
  `f_boost` int(11) NOT NULL,
  `f_evaluation` int(11) NOT NULL,
  `f_profile` int(11) NOT NULL,
  PRIMARY KEY (`raking_id`),
  KEY `f_profil_ranking` (`f_profile`),
  KEY `f_evaluation_ranking` (`f_evaluation`),
  KEY `f_boost_r_ranking` (`f_boost`),
  CONSTRAINT `f_boost_r_ranking` FOREIGN KEY (`f_boost`) REFERENCES `boost_ranking` (`boost_ranking_id`),
  CONSTRAINT `f_evaluation_ranking` FOREIGN KEY (`f_evaluation`) REFERENCES `evaluation` (`evaluation_id`),
  CONSTRAINT `f_profil_ranking` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rant`
--

DROP TABLE IF EXISTS `rant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rant` (
  `schendule` datetime NOT NULL,
  `price` float(10,2) NOT NULL,
  `installment` int(11) NOT NULL DEFAULT '1',
  `period_begin` date NOT NULL,
  `priod_end` date NOT NULL,
  `f_business` int(11) NOT NULL,
  KEY `f_business_rent` (`f_business`),
  CONSTRAINT `f_business_rent` FOREIGN KEY (`f_business`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rant`
--

LOCK TABLES `rant` WRITE;
/*!40000 ALTER TABLE `rant` DISABLE KEYS */;
/*!40000 ALTER TABLE `rant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `avaliable` int(11) DEFAULT '0',
  `equipped` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size_width` float(10,2) DEFAULT NULL,
  `size_height` float(10,2) DEFAULT NULL,
  `f_immobile` int(11) NOT NULL,
  `floor_number` int(11) DEFAULT NULL,
  KEY `f_immobile_room` (`f_immobile`),
  CONSTRAINT `f_immobile_room` FOREIGN KEY (`f_immobile`) REFERENCES `immobile` (`immobile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `schedule` date NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `installment` int(11) NOT NULL DEFAULT '1',
  `serial_number` varchar(255) NOT NULL,
  `f_business` int(11) NOT NULL,
  KEY `f_business_sale` (`f_business`),
  CONSTRAINT `f_business_sale` FOREIGN KEY (`f_business`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `title` varchar(255) NOT NULL,
  `thesis` varchar(255) DEFAULT NULL,
  `result` enum('expectede','unexpected','inconcluseve') DEFAULT NULL,
  `ask` varchar(512) NOT NULL,
  `choice` varchar(255) DEFAULT NULL,
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `type` enum('bartender','cook','security','porter','cashier','electrician','illuminator','driver','musical band','D.J.','promoter','singer','fireman','paramedc','garçon','helper','decorator','makeup artist','camera man','presenter') NOT NULL DEFAULT 'helper',
  `description` varchar(255) NOT NULL,
  `benefits_value` float(10,2) DEFAULT NULL,
  `schendule_begin` date NOT NULL,
  `schendule_end` date NOT NULL,
  `f_business` int(11) NOT NULL,
  KEY `f_business_service` (`f_business`),
  CONSTRAINT `f_business_service` FOREIGN KEY (`f_business`) REFERENCES `business` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `f_generic_box` int(11) NOT NULL,
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_design` int(11) NOT NULL,
  PRIMARY KEY (`settings_id`),
  KEY `f_design_settings` (`f_design`),
  KEY `f_generc_box_settings` (`f_generic_box`),
  CONSTRAINT `f_design_settings` FOREIGN KEY (`f_design`) REFERENCES `design` (`design_id`),
  CONSTRAINT `f_generc_box_settings` FOREIGN KEY (`f_generic_box`) REFERENCES `generic_box` (`generic_box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt`
--

DROP TABLE IF EXISTS `shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shirt` (
  `shit_id` int(11) NOT NULL AUTO_INCREMENT,
  `dawn_begin` time DEFAULT NULL,
  `dawn_end` time DEFAULT NULL,
  `night_begin` time DEFAULT NULL,
  `night_end` time DEFAULT NULL,
  `afternoon_begin` time DEFAULT NULL,
  `afternoon_end` time DEFAULT NULL,
  `morning_begin` time DEFAULT NULL,
  `morning_end` time DEFAULT NULL,
  `f_personality` int(11) NOT NULL,
  PRIMARY KEY (`shit_id`),
  KEY `f_personality_shirt` (`f_personality`),
  CONSTRAINT `f_personality_shirt` FOREIGN KEY (`f_personality`) REFERENCES `personality` (`personality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt`
--

LOCK TABLES `shirt` WRITE;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature`
--

DROP TABLE IF EXISTS `signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature` (
  `public_key` varchar(512) DEFAULT NULL,
  `private_key1` varchar(512) DEFAULT NULL,
  `private_key2` varchar(512) DEFAULT NULL,
  `f_profile` int(11) NOT NULL,
  KEY `f_profile_signature` (`f_profile`),
  CONSTRAINT `f_profile_signature` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature`
--

LOCK TABLES `signature` WRITE;
/*!40000 ALTER TABLE `signature` DISABLE KEYS */;
/*!40000 ALTER TABLE `signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_ntwork`
--

DROP TABLE IF EXISTS `social_ntwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_ntwork` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passoword` varchar(255) NOT NULL,
  `f_profile` int(11) NOT NULL,
  UNIQUE KEY `email` (`email`),
  KEY `f_profile` (`f_profile`),
  CONSTRAINT `social_ntwork_ibfk_1` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_ntwork`
--

LOCK TABLES `social_ntwork` WRITE;
/*!40000 ALTER TABLE `social_ntwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_ntwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `use_type` enum('owner','work','friend','user') DEFAULT 'owner',
  `position_latitude` float(10,3) DEFAULT NULL,
  `position_longitude` float(10,3) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studies`
--

DROP TABLE IF EXISTS `studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studies` (
  `studies_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_group` int(11) NOT NULL,
  `f_search` int(11) NOT NULL,
  PRIMARY KEY (`studies_id`),
  KEY `c_studies_search` (`f_search`),
  KEY `c_studies_group` (`f_group`),
  CONSTRAINT `c_studies_group` FOREIGN KEY (`f_group`) REFERENCES `_group` (`group_id`),
  CONSTRAINT `c_studies_search` FOREIGN KEY (`f_search`) REFERENCES `search` (`search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studies`
--

LOCK TABLES `studies` WRITE;
/*!40000 ALTER TABLE `studies` DISABLE KEYS */;
/*!40000 ALTER TABLE `studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `link` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `identifiers` enum('party','work','friends','rand') NOT NULL DEFAULT 'rand',
  `text_id` int(11) NOT NULL AUTO_INCREMENT,
  `text_title` varchar(255) DEFAULT NULL,
  `text_contents` text NOT NULL,
  `f_generic_box` int(11) NOT NULL,
  PRIMARY KEY (`text_id`),
  KEY `f_generic_boc_text` (`f_generic_box`),
  CONSTRAINT `f_generic_boc_text` FOREIGN KEY (`f_generic_box`) REFERENCES `generic_box` (`generic_box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `number_of_child` int(11) NOT NULL,
  `name_of_type` enum('profile','product','car','stock','company','freelance','inmobile','promotion','contract') NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `link` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_generic_box` int(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  KEY `f_generic_box_video` (`f_generic_box`),
  CONSTRAINT `f_generic_box_video` FOREIGN KEY (`f_generic_box`) REFERENCES `generic_box` (`generic_box_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-01  0:55:53
