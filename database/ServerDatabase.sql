CREATE DATABASE  IF NOT EXISTS `clothes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clothes`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: clothes
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `tbladdressshipping`
--

DROP TABLE IF EXISTS `tbladdressshipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladdressshipping` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `num` varchar(30) NOT NULL,
  `ward` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladdressshipping`
--

LOCK TABLES `tbladdressshipping` WRITE;
/*!40000 ALTER TABLE `tbladdressshipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladdressshipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbank`
--

DROP TABLE IF EXISTS `tblbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbank` (
  `id` int(11) NOT NULL,
  `cardNumber` varchar(20) NOT NULL,
  `cardType` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbank`
--

LOCK TABLES `tblbank` WRITE;
/*!40000 ALTER TABLE `tblbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbill`
--

DROP TABLE IF EXISTS `tblbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbill` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `paymentMethod` tinyint(1) NOT NULL,
  `id_address_shipping` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9a6e5xngd8vk5jw00ocyfg3g1` (`id_address_shipping`),
  KEY `FK_hb3dyt8wwomf4o9wjvxi9eluu` (`id_customer`),
  CONSTRAINT `FK_9a6e5xngd8vk5jw00ocyfg3g1` FOREIGN KEY (`id_address_shipping`) REFERENCES `tbladdressshipping` (`id`),
  CONSTRAINT `FK_hb3dyt8wwomf4o9wjvxi9eluu` FOREIGN KEY (`id_customer`) REFERENCES `tblcustomer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbill`
--

LOCK TABLES `tblbill` WRITE;
/*!40000 ALTER TABLE `tblbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbillpublisher`
--

DROP TABLE IF EXISTS `tblbillpublisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbillpublisher` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_auvtbu1njbea9am4nwwn6k7gv` (`id_publisher`),
  CONSTRAINT `FK_auvtbu1njbea9am4nwwn6k7gv` FOREIGN KEY (`id_publisher`) REFERENCES `tblpublisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbillpublisher`
--

LOCK TABLES `tblbillpublisher` WRITE;
/*!40000 ALTER TABLE `tblbillpublisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbillpublisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclothes`
--

DROP TABLE IF EXISTS `tblclothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclothes` (
  `id` int(11) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `deal` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `material` varchar(30) DEFAULT NULL,
  `price` float NOT NULL,
  `pricePublisher` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `salePrice` float NOT NULL,
  `size` varchar(30) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_irqvjsdngf4ad3dhhjxjqyylq` (`id_publisher`),
  CONSTRAINT `FK_irqvjsdngf4ad3dhhjxjqyylq` FOREIGN KEY (`id_publisher`) REFERENCES `tblpublisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclothes`
--

LOCK TABLES `tblclothes` WRITE;
/*!40000 ALTER TABLE `tblclothes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclothesorder`
--

DROP TABLE IF EXISTS `tblclothesorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclothesorder` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_bill` int(11) DEFAULT NULL,
  `id_clothes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6q611mvxx0qqdgq09os0vg4b` (`id_bill`),
  KEY `FK_4noexwjch3ancjfcwd4e3t3in` (`id_clothes`),
  CONSTRAINT `FK_4noexwjch3ancjfcwd4e3t3in` FOREIGN KEY (`id_clothes`) REFERENCES `tblclothes` (`id`),
  CONSTRAINT `FK_6q611mvxx0qqdgq09os0vg4b` FOREIGN KEY (`id_bill`) REFERENCES `tblbill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclothesorder`
--

LOCK TABLES `tblclothesorder` WRITE;
/*!40000 ALTER TABLE `tblclothesorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclothesorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomer` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `pwd` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `id_bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7tt1i2w2n9kfts2nnwsgasw8h` (`id_bank`),
  CONSTRAINT `FK_7tt1i2w2n9kfts2nnwsgasw8h` FOREIGN KEY (`id_bank`) REFERENCES `tblbank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer`
--

LOCK TABLES `tblcustomer` WRITE;
/*!40000 ALTER TABLE `tblcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemployee` (
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
  KEY `FK_7b0opcjnjr1mx26ctr02tu0l5` (`id_bank`),
  CONSTRAINT `FK_7b0opcjnjr1mx26ctr02tu0l5` FOREIGN KEY (`id_bank`) REFERENCES `tblbank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployee`
--

LOCK TABLES `tblemployee` WRITE;
/*!40000 ALTER TABLE `tblemployee` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemployee` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `FK_ekhk44c9p5bslb0ixkg9n8nwi` (`id_bill_publisher`),
  KEY `FK_ovv2k934pdfde51j28y68xgrm` (`id_clothes`),
  CONSTRAINT `FK_ekhk44c9p5bslb0ixkg9n8nwi` FOREIGN KEY (`id_bill_publisher`) REFERENCES `tblbillpublisher` (`id`),
  CONSTRAINT `FK_ovv2k934pdfde51j28y68xgrm` FOREIGN KEY (`id_clothes`) REFERENCES `tblclothes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderpublisher`
--

LOCK TABLES `tblorderpublisher` WRITE;
/*!40000 ALTER TABLE `tblorderpublisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorderpublisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpublisher`
--

DROP TABLE IF EXISTS `tblpublisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpublisher` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpublisher`
--

LOCK TABLES `tblpublisher` WRITE;
/*!40000 ALTER TABLE `tblpublisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpublisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblshop`
--

DROP TABLE IF EXISTS `tblshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblshop` (
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
-- Dumping data for table `tblshop`
--

LOCK TABLES `tblshop` WRITE;
/*!40000 ALTER TABLE `tblshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblshop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-16 11:20:49

GRANT ALL ON clothes.* TO clothes@localhost IDENTIFIED BY '1234';