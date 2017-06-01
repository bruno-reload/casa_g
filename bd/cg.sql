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
  KEY `f_stokc_acesse` (`f_stock`),
  CONSTRAINT `f_profile_acesse` FOREIGN KEY (`f_profile`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `f_stokc_acesse` FOREIGN KEY (`f_stock`) REFERENCES `stock` (`stock_id`)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-29 22:51:05
