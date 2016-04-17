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
  `cardNumber` varchar(20) DEFAULT NULL,
  `cardType` varchar(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'12345678','Visa','Agribank'),(2,'123456789','Visa','Agribank'),(3,'123456789','Master','Techcombank');
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
  `description` longtext,
  `image` varchar(200) DEFAULT NULL,
  `material` varchar(200) DEFAULT NULL,
  `price` float NOT NULL,
  `pricePublisher` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
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
INSERT INTO `customer` VALUES (0,'Nam Định','thanhtam.ha1994@hotmail.com','Hà Thanh Tâm','0918181003',0,'1234','test',2),(1,'Nam Định','thanhtam.ha1994@gmail.com','Hà Thanh Tâm','0918181003',0,'1234','test1',3);
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
INSERT INTO `deal` VALUES (0,0,NULL,NULL,0);
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
INSERT INTO `employee` VALUES (1,'Nam Định','12345678','thanhtam.ha1994@hotmail.com','0918181003',2,'1234','hathanhtam',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderpublisher`
--

DROP TABLE IF EXISTS `orderpublisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderpublisher` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_bill_publisher` int(11) DEFAULT NULL,
  `id_clothes` int(11) DEFAULT NULL,
  `id_deal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cwc21yjkwmrcx03b1hgehuorb` (`id_bill_publisher`),
  KEY `FK_s06gnm5lixxw7c0775nbjai9k` (`id_clothes`),
  KEY `FK_hltedespfdxoy20q3d9vfdpn6` (`id_deal`),
  CONSTRAINT `FK_cwc21yjkwmrcx03b1hgehuorb` FOREIGN KEY (`id_bill_publisher`) REFERENCES `billpublisher` (`id`),
  CONSTRAINT `FK_hltedespfdxoy20q3d9vfdpn6` FOREIGN KEY (`id_deal`) REFERENCES `deal` (`id`),
  CONSTRAINT `FK_s06gnm5lixxw7c0775nbjai9k` FOREIGN KEY (`id_clothes`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderpublisher`
--

LOCK TABLES `orderpublisher` WRITE;
/*!40000 ALTER TABLE `orderpublisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderpublisher` ENABLE KEYS */;
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
INSERT INTO `publisher` VALUES (1,'Hà Nội','clothesservice1@hotmail.com','Clothes Service 1','0911111111');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisherservice`
--

DROP TABLE IF EXISTS `publisherservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisherservice` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `interfaceName` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `targetNamespace` varchar(100) NOT NULL,
  `urlService` varchar(255) NOT NULL,
  `id_publisher` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_j5xnnyo841olsatl0ksal8u15` (`id_publisher`),
  CONSTRAINT `FK_j5xnnyo841olsatl0ksal8u15` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisherservice`
--

LOCK TABLES `publisherservice` WRITE;
/*!40000 ALTER TABLE `publisherservice` DISABLE KEYS */;
INSERT INTO `publisherservice` VALUES (1,'Danh sách tất cả các mặt hàng','ClothesService1','ClothesService1ImplService','com.clothes1','http://localhost:8001/Clothes1/Clothes-service.html?wsdl',1);
/*!40000 ALTER TABLE `publisherservice` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-17 15:06:15
GRANT ALL ON clothes.* TO clothes@localhost IDENTIFIED BY '1234';