CREATE DATABASE  IF NOT EXISTS `clothes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clothes`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clothes
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `addressshipping`
--

DROP TABLE IF EXISTS `addressshipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressshipping` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `num` varchar(30) NOT NULL,
  `ward` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressshipping`
--

LOCK TABLES `addressshipping` WRITE;
/*!40000 ALTER TABLE `addressshipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressshipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `cardNumber` varchar(20) NOT NULL,
  `cardType` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `paymentMethod` tinyint(1) NOT NULL,
  `id_address_shipping` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g69iwtjmlbxj5roy0mttmseha` (`id_address_shipping`),
  KEY `FK_q3eyf2mdt9dgql37tup14yg8e` (`id_customer`),
  CONSTRAINT `FK_g69iwtjmlbxj5roy0mttmseha` FOREIGN KEY (`id_address_shipping`) REFERENCES `addressshipping` (`id`),
  CONSTRAINT `FK_q3eyf2mdt9dgql37tup14yg8e` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billpublisher`
--

DROP TABLE IF EXISTS `billpublisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billpublisher` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_frum3v1eyc3m0f0h9dik9rbbg` (`id_publisher`),
  CONSTRAINT `FK_frum3v1eyc3m0f0h9dik9rbbg` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billpublisher`
--

LOCK TABLES `billpublisher` WRITE;
/*!40000 ALTER TABLE `billpublisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `billpublisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothes` (
  `id` int(11) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `material` varchar(30) DEFAULT NULL,
  `price` float NOT NULL,
  `pricePublisher` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(30) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `id_deal` int(11) DEFAULT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cyil0ilnyrd6cuaksms4l00p4` (`id_deal`),
  KEY `FK_nbogkdbv8kh28we561h42lp11` (`id_publisher`),
  CONSTRAINT `FK_cyil0ilnyrd6cuaksms4l00p4` FOREIGN KEY (`id_deal`) REFERENCES `deal` (`id`),
  CONSTRAINT `FK_nbogkdbv8kh28we561h42lp11` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes`
--

LOCK TABLES `clothes` WRITE;
/*!40000 ALTER TABLE `clothes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothesorder`
--

DROP TABLE IF EXISTS `clothesorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothesorder` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_bill` int(11) DEFAULT NULL,
  `id_clothes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9afd4809wedu7thbg8cw47oyu` (`id_bill`),
  KEY `FK_jdtembntla6a3dcp9m4hgrc2h` (`id_clothes`),
  CONSTRAINT `FK_9afd4809wedu7thbg8cw47oyu` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `FK_jdtembntla6a3dcp9m4hgrc2h` FOREIGN KEY (`id_clothes`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothesorder`
--

LOCK TABLES `clothesorder` WRITE;
/*!40000 ALTER TABLE `clothesorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothesorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `point` int(11) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `id_bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pvwxt8menb6nv5r2qfnwjb4f` (`id_bank`),
  CONSTRAINT `FK_pvwxt8menb6nv5r2qfnwjb4f` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deal` (
  `id` int(11) NOT NULL,
  `sale` int(11) NOT NULL,
  `timeStart` datetime DEFAULT NULL,
  `timeStop` datetime DEFAULT NULL,
  `voucher` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal`
--

LOCK TABLES `deal` WRITE;
/*!40000 ALTER TABLE `deal` DISABLE KEYS */;
/*!40000 ALTER TABLE `deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `cmnd` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` int(11) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `id_bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sxttfvyumgq24tpub9scbgtr` (`id_bank`),
  CONSTRAINT `FK_sxttfvyumgq24tpub9scbgtr` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershiptype`
--

DROP TABLE IF EXISTS `membershiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershiptype` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `rate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiptype`
--

LOCK TABLES `membershiptype` WRITE;
/*!40000 ALTER TABLE `membershiptype` DISABLE KEYS */;
/*!40000 ALTER TABLE `membershiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `token` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderpublisher`
--

DROP TABLE IF EXISTS `tblorderpublisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorderpublisher` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_bill_publisher` int(11) DEFAULT NULL,
  `id_clothes` int(11) DEFAULT NULL,
  `id_deal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ekhk44c9p5bslb0ixkg9n8nwi` (`id_bill_publisher`),
  KEY `FK_ovv2k934pdfde51j28y68xgrm` (`id_clothes`),
  KEY `FK_c0vxralfbbb82y5whrjr4ejge` (`id_deal`),
  CONSTRAINT `FK_c0vxralfbbb82y5whrjr4ejge` FOREIGN KEY (`id_deal`) REFERENCES `deal` (`id`),
  CONSTRAINT `FK_ekhk44c9p5bslb0ixkg9n8nwi` FOREIGN KEY (`id_bill_publisher`) REFERENCES `billpublisher` (`id`),
  CONSTRAINT `FK_ovv2k934pdfde51j28y68xgrm` FOREIGN KEY (`id_clothes`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderpublisher`
--

LOCK TABLES `tblorderpublisher` WRITE;
/*!40000 ALTER TABLE `tblorderpublisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorderpublisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-19 13:38:03
GRANT ALL ON clothes.* TO clothes@localhost IDENTIFIED BY '1234';