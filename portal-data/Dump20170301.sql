-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: tiisportal
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `account_`
--

DROP TABLE IF EXISTS `account_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_` (
  `accountId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentAccountId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `legalName` varchar(75) DEFAULT NULL,
  `legalId` varchar(75) DEFAULT NULL,
  `legalType` varchar(75) DEFAULT NULL,
  `sicCode` varchar(75) DEFAULT NULL,
  `tickerSymbol` varchar(75) DEFAULT NULL,
  `industry` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `size_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_`
--

LOCK TABLES `account_` WRITE;
/*!40000 ALTER TABLE `account_` DISABLE KEYS */;
INSERT INTO `account_` VALUES (20157,20155,0,'','2016-10-02 17:09:31','2016-10-27 22:49:27',0,'TIIS Portal','','','','','','','','');
/*!40000 ALTER TABLE `account_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `uuid_` varchar(75) DEFAULT NULL,
  `addressId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `street1` varchar(75) DEFAULT NULL,
  `street2` varchar(75) DEFAULT NULL,
  `street3` varchar(75) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `zip` varchar(75) DEFAULT NULL,
  `regionId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `mailing` tinyint(4) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `IX_93D5AD4E` (`companyId`),
  KEY `IX_ABD7DAC0` (`companyId`,`classNameId`),
  KEY `IX_71CB1123` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_923BD178` (`companyId`,`classNameId`,`classPK`,`mailing`),
  KEY `IX_9226DBB4` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_5BC8B0D4` (`userId`),
  KEY `IX_381E55DA` (`uuid_`),
  KEY `IX_8FCB620E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcementsdelivery`
--

DROP TABLE IF EXISTS `announcementsdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcementsdelivery` (
  `deliveryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `email` tinyint(4) DEFAULT NULL,
  `sms` tinyint(4) DEFAULT NULL,
  `website` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`deliveryId`),
  UNIQUE KEY `IX_BA4413D5` (`userId`,`type_`),
  KEY `IX_6EDB9600` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcementsdelivery`
--

LOCK TABLES `announcementsdelivery` WRITE;
/*!40000 ALTER TABLE `announcementsdelivery` DISABLE KEYS */;
INSERT INTO `announcementsdelivery` VALUES (20601,20155,20199,'general',0,0,1),(20602,20155,20199,'news',0,0,1),(20603,20155,20199,'test',0,0,1);
/*!40000 ALTER TABLE `announcementsdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcementsentry`
--

DROP TABLE IF EXISTS `announcementsentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcementsentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `content` longtext,
  `url` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `displayDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `alert` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  KEY `IX_A6EF0B81` (`classNameId`,`classPK`),
  KEY `IX_14F06A6B` (`classNameId`,`classPK`,`alert`),
  KEY `IX_D49C2E66` (`userId`),
  KEY `IX_1AFBDE08` (`uuid_`),
  KEY `IX_F2949120` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcementsentry`
--

LOCK TABLES `announcementsentry` WRITE;
/*!40000 ALTER TABLE `announcementsentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcementsentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcementsflag`
--

DROP TABLE IF EXISTS `announcementsflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcementsflag` (
  `flagId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `entryId` bigint(20) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`flagId`),
  UNIQUE KEY `IX_4539A99C` (`userId`,`entryId`,`value`),
  KEY `IX_9C7EB9F` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcementsflag`
--

LOCK TABLES `announcementsflag` WRITE;
/*!40000 ALTER TABLE `announcementsflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcementsflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetcategory`
--

DROP TABLE IF EXISTS `assetcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetcategory` (
  `uuid_` varchar(75) DEFAULT NULL,
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `leftCategoryId` bigint(20) DEFAULT NULL,
  `rightCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `vocabularyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `IX_BE4DF2BF` (`parentCategoryId`,`name`,`vocabularyId`),
  UNIQUE KEY `IX_E8D019AA` (`uuid_`,`groupId`),
  KEY `IX_E639E2F6` (`groupId`),
  KEY `IX_C7F39FCA` (`groupId`,`name`,`vocabularyId`),
  KEY `IX_852EA801` (`groupId`,`parentCategoryId`,`name`,`vocabularyId`),
  KEY `IX_87603842` (`groupId`,`parentCategoryId`,`vocabularyId`),
  KEY `IX_2008FACB` (`groupId`,`vocabularyId`),
  KEY `IX_D61ABE08` (`name`,`vocabularyId`),
  KEY `IX_7BB1826B` (`parentCategoryId`),
  KEY `IX_9DDD15EA` (`parentCategoryId`,`name`),
  KEY `IX_B185E980` (`parentCategoryId`,`vocabularyId`),
  KEY `IX_4D37BB00` (`uuid_`),
  KEY `IX_BBAF6928` (`uuid_`,`companyId`),
  KEY `IX_287B1F89` (`vocabularyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetcategory`
--

LOCK TABLES `assetcategory` WRITE;
/*!40000 ALTER TABLE `assetcategory` DISABLE KEYS */;
INSERT INTO `assetcategory` VALUES ('c6531fbf-ebe3-4496-90ff-1b58eea25509',22803,20182,20155,20199,'Test Test','2016-10-26 23:20:18','2016-10-26 23:20:18',0,2,3,'Work','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,ru_RU,\" default-locale=\"en_US\"><Title language-id=\"en_US\">Work</Title><Title language-id=\"ru_RU\">Профильная литература</Title></root>','',22802),('0e14b702-b629-41f9-bfc4-8e3fcd028900',22804,20182,20155,20199,'Test Test','2016-10-26 23:20:49','2016-10-26 23:20:49',0,4,5,'Непрофильня литература','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Непрофильня литература</Title></root>','',22802),('8c43e3af-cdbf-4e0a-b53c-ce1b5888116c',22805,20182,20155,20199,'Test Test','2016-10-26 23:21:01','2016-10-26 23:21:01',0,6,7,'Художественная литература','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Художественная литература</Title></root>','',22802);
/*!40000 ALTER TABLE `assetcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetcategoryproperty`
--

DROP TABLE IF EXISTS `assetcategoryproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetcategoryproperty` (
  `categoryPropertyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `value` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`categoryPropertyId`),
  UNIQUE KEY `IX_DBD111AA` (`categoryId`,`key_`),
  KEY `IX_99DA856` (`categoryId`),
  KEY `IX_8654719F` (`companyId`),
  KEY `IX_52340033` (`companyId`,`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetcategoryproperty`
--

LOCK TABLES `assetcategoryproperty` WRITE;
/*!40000 ALTER TABLE `assetcategoryproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetcategoryproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetentries_assetcategories`
--

DROP TABLE IF EXISTS `assetentries_assetcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetentries_assetcategories` (
  `categoryId` bigint(20) NOT NULL,
  `entryId` bigint(20) NOT NULL,
  PRIMARY KEY (`categoryId`,`entryId`),
  KEY `IX_A188F560` (`categoryId`),
  KEY `IX_E119938A` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetentries_assetcategories`
--

LOCK TABLES `assetentries_assetcategories` WRITE;
/*!40000 ALTER TABLE `assetentries_assetcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetentries_assetcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetentries_assettags`
--

DROP TABLE IF EXISTS `assetentries_assettags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetentries_assettags` (
  `entryId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`entryId`,`tagId`),
  KEY `IX_2ED82CAD` (`entryId`),
  KEY `IX_B2A61B55` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetentries_assettags`
--

LOCK TABLES `assetentries_assettags` WRITE;
/*!40000 ALTER TABLE `assetentries_assettags` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetentries_assettags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetentry`
--

DROP TABLE IF EXISTS `assetentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetentry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `classTypeId` bigint(20) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `publishDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `summary` longtext,
  `url` longtext,
  `layoutUuid` varchar(75) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_1E9D371D` (`classNameId`,`classPK`),
  KEY `IX_FC1F9C7B` (`classUuid`),
  KEY `IX_7306C60` (`companyId`),
  KEY `IX_75D42FF9` (`expirationDate`),
  KEY `IX_1EBA6821` (`groupId`,`classUuid`),
  KEY `IX_FEC4A201` (`layoutUuid`),
  KEY `IX_2E4E3885` (`publishDate`),
  KEY `IX_9029E15A` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetentry`
--

LOCK TABLES `assetentry` WRITE;
/*!40000 ALTER TABLE `assetentry` DISABLE KEYS */;
INSERT INTO `assetentry` VALUES (20180,20173,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20116,20178,'c25a00f0-c7e6-482d-87c5-01bc26b73e7c',0,0,NULL,NULL,NULL,NULL,'text/html','20176','','','','',0,0,0,0),(20189,20182,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20116,20187,'699af1d0-a25c-4b05-879b-0b23a641729a',0,0,NULL,NULL,NULL,NULL,'text/html','20185','','','','',0,0,0,0),(20204,20195,20155,20199,'Test Test','2016-10-02 17:09:32','2016-10-26 23:33:14',20005,20199,'679596ac-3571-4995-b186-007a71357925',0,0,NULL,NULL,NULL,NULL,'','Test Test','','','','',0,0,0,0),(20325,20317,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20116,20322,'b50ff767-19e8-4b0d-9795-4745a9c0d65c',0,0,NULL,NULL,NULL,NULL,'text/html','20320','','','','',0,0,0,0),(20336,20329,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20116,20334,'03011d4f-1ebc-49a1-bba3-f1abde1686bc',0,0,NULL,NULL,NULL,NULL,'text/html','20332','','','','',0,0,0,0),(20346,20339,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20116,20344,'8b6b08c8-55d3-4817-9e1a-a3475cfb0524',0,0,NULL,NULL,NULL,NULL,'text/html','20342','','','','',0,0,0,0),(20365,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20116,20363,'a8844412-d704-4617-b1d8-04fd5f8c6ceb',0,0,NULL,NULL,NULL,NULL,'text/html','20361','','','','',0,0,0,0),(20373,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20116,20371,'fd707339-d3e3-45e2-af79-67451bbb8279',0,0,NULL,NULL,NULL,NULL,'text/html','20369','','','','',0,0,0,0),(20391,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20116,20389,'19120ce4-6589-4cc7-b3c3-bd7383d17146',0,0,NULL,NULL,NULL,NULL,'text/html','20387','','','','',0,0,0,0),(20400,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20116,20398,'0ed9919b-70b9-49dc-a851-484fbfd77fd9',0,0,NULL,NULL,NULL,NULL,'text/html','20396','','','','',0,0,0,0),(20408,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20116,20406,'4ebe9eb2-9476-47ab-b41f-92de79012c4e',0,0,NULL,NULL,NULL,NULL,'text/html','20404','','','','',0,0,0,0),(20608,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20116,20606,'b92f1515-ce64-4aaf-9799-a91112602aeb',0,0,NULL,NULL,NULL,NULL,'text/html','20604','','','','',0,0,0,0),(20614,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20116,20612,'1a74961f-b748-4906-9a11-f7f1ff62934f',0,0,NULL,NULL,NULL,NULL,'text/html','20610','','','','',0,0,0,0),(20717,20182,20155,20199,'Test Test','2016-10-05 13:40:10','2016-10-05 13:40:10',20116,20715,'803d3433-995b-4a55-b168-2a3411c95222',0,0,NULL,NULL,NULL,NULL,'text/html','20713','','','','',0,0,0,0),(21236,21219,20155,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48',20116,21234,'aa700b40-15b4-4b76-8e83-56064991372e',0,0,NULL,NULL,NULL,NULL,'text/html','21232','','','','',0,0,0,0),(21408,20182,20155,20199,'Test Test','2016-10-24 18:44:26','2016-10-24 18:44:26',20116,21406,'3898ffcb-7854-440a-9ff5-6fbf6552df42',0,0,NULL,NULL,NULL,NULL,'text/html','21404','','','','',0,0,0,0),(21414,20182,20155,20199,'Test Test','2016-10-24 18:44:34','2016-10-24 18:44:34',20116,21412,'1f326ac1-a33b-47e3-8013-f2f70465989e',0,0,NULL,NULL,NULL,NULL,'text/html','21410','','','','',0,0,0,0),(22835,20201,20155,20199,'Test Test','2016-10-26 23:34:12','2016-10-26 23:34:12',20012,22834,'25eb237c-9a1f-4b82-ad2e-e2e57b9e8d91',0,1,NULL,NULL,NULL,NULL,'','OpenSocial Gadgets','','','','',0,0,0,0),(22905,20182,20155,20199,'Test Test','2016-10-27 22:24:11','2016-10-27 22:24:11',20116,22903,'ac7161b3-a0e1-4196-bb3c-37436d0a6fa3',0,0,NULL,NULL,NULL,NULL,'text/html','22901','','','','',0,0,0,0),(23006,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2017-02-24 23:12:55',20109,23004,'e6b93c2c-ab89-4835-9f9a-f03484ce1d01',0,1,NULL,NULL,'2016-10-27 23:55:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','','','','',0,0,0,6),(23010,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-27 23:55:52',20116,23008,'bef04289-85ac-486d-abbb-e4c24565865f',0,0,NULL,NULL,NULL,NULL,'text/html','23004','','','','',0,0,0,0),(23034,20182,20155,20199,'Test Test','2016-10-28 00:14:28','2016-10-28 00:14:28',20116,23032,'a04f9172-8ea7-4748-a101-a3f75df79483',0,0,NULL,NULL,NULL,NULL,'text/html','23030','','','','',0,0,0,0),(24005,20182,20155,20199,'Test Test','2016-11-03 10:32:26','2016-11-03 10:32:26',20116,24003,'30307c10-f99a-4606-8a92-366110118850',0,0,NULL,NULL,NULL,NULL,'text/html','24001','','','','',0,0,0,0),(24519,24502,20155,20159,'','2016-11-06 15:26:10','2016-11-06 15:26:10',20116,24517,'33747e32-4b8a-43d2-bf98-9884c3180a77',0,0,NULL,NULL,NULL,NULL,'text/html','24515','','','','',0,0,0,0),(24849,24802,20155,20159,'','2016-11-21 17:31:22','2016-11-21 17:31:22',20116,24847,'31fb88a5-1b05-46f9-a2b1-3c211af9183f',0,0,NULL,NULL,NULL,NULL,'text/html','24845','','','','',0,0,0,0),(24868,24855,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',20011,24866,'7c3abf7b-91d1-47e1-adba-53530fe30e31',0,1,NULL,NULL,NULL,NULL,'image/png','64_64','','','','',0,0,0,0),(24871,24855,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',20116,24869,'deaf9cb2-f964-4215-9f35-212ed72525dd',0,0,NULL,NULL,NULL,NULL,'text/html','24866','','','','',0,0,0,0),(24877,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24875,'855d87ca-c560-451d-971c-ddafbdb7ab48',0,1,NULL,NULL,NULL,NULL,'image/jpeg','avatar1','','','','',0,0,0,0),(24880,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20116,24878,'32af8a9a-02bc-4cec-9ab8-31880aee7fba',0,0,NULL,NULL,NULL,NULL,'text/html','24875','','','','',0,0,0,0),(24885,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24883,'8ccbafbd-7799-4fb8-8790-c58c4647d821',0,1,NULL,NULL,NULL,NULL,'image/png','197_203','','','','',0,0,0,0),(24888,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20116,24886,'bb122b8b-bf09-47c3-bf63-f0d93119e55c',0,0,NULL,NULL,NULL,NULL,'text/html','24883','','','','',0,0,0,0),(24893,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24891,'a674a96d-fb2e-45de-acd3-66111c31eb5d',0,1,NULL,NULL,NULL,NULL,'image/jpeg','avatar2','','','','',0,0,0,0),(24896,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20116,24894,'83aa6aae-bcf5-4d42-997a-ce4aaffcb297',0,0,NULL,NULL,NULL,NULL,'text/html','24891','','','','',0,0,0,0),(24901,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24899,'4d6bc0b3-950a-4b05-8c26-6f0f4f1631dc',0,1,NULL,NULL,NULL,NULL,'image/jpeg','avatar3','','','','',0,0,0,0),(24904,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20116,24902,'043ec114-3573-4305-ab41-7f06b2e37fb7',0,0,NULL,NULL,NULL,NULL,'text/html','24899','','','','',0,0,0,0),(24910,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24908,'eb0e6c25-927a-44f3-a610-b6085c1f47de',0,1,NULL,NULL,NULL,NULL,'image/png','210_150','','','','',0,0,0,0),(24913,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20116,24911,'711536c5-ac7f-4c9d-ba93-d2257c98d3ae',0,0,NULL,NULL,NULL,NULL,'text/html','24908','','','','',0,0,0,0),(24918,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24916,'e1a093d1-f5af-473a-ba52-9513c19a8b10',0,1,NULL,NULL,NULL,NULL,'image/png','900_350','','','','',0,0,0,0),(24922,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20116,24920,'6bfc0907-22fe-4d9e-a1dc-a70c58f6dbf3',0,0,NULL,NULL,NULL,NULL,'text/html','24916','','','','',0,0,0,0),(24949,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24935,'46f24818-e7fe-49d1-9d34-6bd76dd7749d',24927,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">text-link-image-slider</Title></root>','','','','',0,0,0,0),(24952,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20116,24950,'1762bd63-004a-4704-8dfd-8286fe1da537',0,0,NULL,NULL,NULL,NULL,'text/html','24935','','','','',0,0,0,0),(24969,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24967,'86ff5a9d-08bb-4fe1-8aed-fc6dd008ea76',24963,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">skins</Title></root>','','','','',0,0,0,0),(24972,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20116,24970,'8677dcfe-771e-4a37-b49c-1e0e11718f2f',0,0,NULL,NULL,NULL,NULL,'text/html','24967','','','','',0,0,0,0),(24978,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24976,'9ffab629-96f8-435c-9ba2-b41c0de1b52e',24963,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">responsive-layout</Title></root>','','','','',0,0,0,0),(24981,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20116,24979,'ebd7ef97-0e93-492c-9465-90789565e4ff',0,0,NULL,NULL,NULL,NULL,'text/html','24976','','','','',0,0,0,0),(24989,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24986,'11e4868f-1dd9-4263-937e-a4a955097391',24963,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">custom-portlets</Title></root>','','','','',0,0,0,0),(24992,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20116,24990,'43547da0-b0e5-4dbf-ab7a-c69b33bdba25',0,0,NULL,NULL,NULL,NULL,'text/html','24986','','','','',0,0,0,0),(25003,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,25001,'4427f2a1-9ee0-4cf3-b52a-bce56e8ec664',24996,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Footer Links</Title></root>','','','','',0,0,0,0),(25006,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20116,25004,'12c10fca-a815-4465-bb58-aace4bd1173a',0,0,NULL,NULL,NULL,NULL,'text/html','25001','','','','',0,0,0,0),(25014,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25012,'1e68d0a1-6a38-45f1-992b-146e741b50d2',25008,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">portfolio</Title></root>','','','','',0,0,0,0),(25017,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20116,25015,'dcf5954d-5ba5-461a-8515-d5545d0e20f3',0,0,NULL,NULL,NULL,NULL,'text/html','25012','','','','',0,0,0,0),(25025,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25023,'9d706729-06c1-4715-a65d-e382883f7de2',25019,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">mini-portofolio</Title></root>','','','','',0,0,0,0),(25028,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20116,25026,'775ec0af-d67d-4ac7-9477-f8c491f2c340',0,0,NULL,NULL,NULL,NULL,'text/html','25023','','','','',0,0,0,0),(25036,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25034,'8d41af50-aff0-494a-bc52-489d4700013f',25030,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">carousel</Title></root>','','','','',0,0,0,0),(25039,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20116,25037,'9b51cb52-9525-4df2-90c6-30f79c6a5ba6',0,0,NULL,NULL,NULL,NULL,'text/html','25034','','','','',0,0,0,0),(25047,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25045,'42ca3eb1-a3bf-4070-880e-7d3f8118a72d',25041,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">testimonials</Title></root>','','','','',0,0,0,0),(25050,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20116,25048,'a30ca7cd-dbaa-4e8e-a0f6-45ef51a47682',0,0,NULL,NULL,NULL,NULL,'text/html','25045','','','','',0,0,0,0),(25058,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25056,'bac56197-b8b7-4d32-ab12-70b0d0771201',25052,1,NULL,NULL,'2010-01-31 21:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Footer Social</Title></root>','','','','',0,0,0,0),(25061,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20116,25059,'a8fe0227-79be-43dc-96bc-e42621516237',0,0,NULL,NULL,NULL,NULL,'text/html','25056','','','','',0,0,0,0),(25069,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20116,25067,'c0ece2d7-7e5a-4f3a-b431-86bd88f7ab72',0,0,NULL,NULL,NULL,NULL,'text/html','25065','','','','',0,0,0,0),(25081,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20116,25079,'6b09fff9-4a7f-42c7-a56a-37ccdbc06c43',0,0,NULL,NULL,NULL,NULL,'text/html','25077','','','','',0,0,0,0),(25088,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20116,25086,'55ae7335-8787-4786-baa3-e150d5517982',0,0,NULL,NULL,NULL,NULL,'text/html','25084','','','','',0,0,0,0),(25095,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20116,25093,'d503dfe6-0a81-40ee-bfa7-180daa9f3dcb',0,0,NULL,NULL,NULL,NULL,'text/html','25091','','','','',0,0,0,0),(25101,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20116,25099,'b83ea66e-263f-4b77-bdfb-ad42aff63dbd',0,0,NULL,NULL,NULL,NULL,'text/html','25097','','','','',0,0,0,0),(25107,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20116,25105,'9dea24dc-4cd7-4e03-99e5-9285e10db17a',0,0,NULL,NULL,NULL,NULL,'text/html','25103','','','','',0,0,0,0),(25128,25111,20155,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44',20116,25126,'a7cfb84a-bb3b-4daa-82f7-88436b940e94',0,0,NULL,NULL,NULL,NULL,'text/html','25124','','','','',0,0,0,0),(25809,20182,20155,20199,'Test Test','2017-02-14 21:12:59','2017-02-14 21:12:59',20116,25807,'96d6e42d-bb17-48ee-a731-b66884f06077',0,0,NULL,NULL,NULL,NULL,'text/html','25805','','','','',0,0,0,0),(26673,20620,20155,20159,'','2017-02-25 00:03:29','2017-02-25 00:03:29',20116,26671,'b273661f-5e34-4f65-90f1-5b1370703c40',0,0,NULL,NULL,NULL,NULL,'text/html','26669','','','','',0,0,0,0);
/*!40000 ALTER TABLE `assetentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetlink`
--

DROP TABLE IF EXISTS `assetlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetlink` (
  `linkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `entryId1` bigint(20) DEFAULT NULL,
  `entryId2` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`linkId`),
  UNIQUE KEY `IX_8F542794` (`entryId1`,`entryId2`,`type_`),
  KEY `IX_128516C8` (`entryId1`),
  KEY `IX_56E0AB21` (`entryId1`,`entryId2`),
  KEY `IX_14D5A20D` (`entryId1`,`type_`),
  KEY `IX_12851A89` (`entryId2`),
  KEY `IX_91F132C` (`entryId2`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetlink`
--

LOCK TABLES `assetlink` WRITE;
/*!40000 ALTER TABLE `assetlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettag`
--

DROP TABLE IF EXISTS `assettag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettag` (
  `tagId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `assetCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`tagId`),
  KEY `IX_7C9E46BA` (`groupId`),
  KEY `IX_D63322F9` (`groupId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettag`
--

LOCK TABLES `assettag` WRITE;
/*!40000 ALTER TABLE `assettag` DISABLE KEYS */;
INSERT INTO `assettag` VALUES (22820,20182,20155,20199,'Test Test','2016-10-26 23:29:41','2016-10-26 23:29:59','пушкин',0),(22821,20182,20155,20199,'Test Test','2016-10-26 23:29:51','2016-10-26 23:29:51','лермонтов',0);
/*!40000 ALTER TABLE `assettag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettagproperty`
--

DROP TABLE IF EXISTS `assettagproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettagproperty` (
  `tagPropertyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `tagId` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tagPropertyId`),
  UNIQUE KEY `IX_2C944354` (`tagId`,`key_`),
  KEY `IX_DFF1F063` (`companyId`),
  KEY `IX_13805BF7` (`companyId`,`key_`),
  KEY `IX_3269E180` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettagproperty`
--

LOCK TABLES `assettagproperty` WRITE;
/*!40000 ALTER TABLE `assettagproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettagproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettagstats`
--

DROP TABLE IF EXISTS `assettagstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettagstats` (
  `tagStatsId` bigint(20) NOT NULL,
  `tagId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `assetCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`tagStatsId`),
  UNIQUE KEY `IX_56682CC4` (`tagId`,`classNameId`),
  KEY `IX_50702693` (`classNameId`),
  KEY `IX_9464CA` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettagstats`
--

LOCK TABLES `assettagstats` WRITE;
/*!40000 ALTER TABLE `assettagstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettagstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetvocabulary`
--

DROP TABLE IF EXISTS `assetvocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetvocabulary` (
  `uuid_` varchar(75) DEFAULT NULL,
  `vocabularyId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `settings_` longtext,
  PRIMARY KEY (`vocabularyId`),
  UNIQUE KEY `IX_1B2B8792` (`uuid_`,`groupId`),
  KEY `IX_B22D908C` (`companyId`),
  KEY `IX_B6B8CA0E` (`groupId`),
  KEY `IX_C0AAD74D` (`groupId`,`name`),
  KEY `IX_55F58818` (`uuid_`),
  KEY `IX_C4E6FD10` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetvocabulary`
--

LOCK TABLES `assetvocabulary` WRITE;
/*!40000 ALTER TABLE `assetvocabulary` DISABLE KEYS */;
INSERT INTO `assetvocabulary` VALUES ('562bfec4-199b-49e3-952f-820968658dcd',20324,20195,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','',''),('b3d0edd6-7b7c-4c20-b654-44b2124fc73c',22603,20182,20155,20159,'','2016-10-26 23:11:22','2016-10-26 23:11:22','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','',''),('5d39d5a4-471f-43c2-a0a1-57ab5917d18b',22802,20182,20155,20199,'Test Test','2016-10-26 23:19:34','2016-10-26 23:19:34','Books','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,ru_RU,\" default-locale=\"en_US\"><Title language-id=\"en_US\">Books</Title><Title language-id=\"ru_RU\">Книги</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,ru_RU,\" default-locale=\"en_US\"><Description language-id=\"en_US\">Books categories</Description><Description language-id=\"ru_RU\">Категории книг</Description></root>','multiValued=true\nselectedClassNameIds=0\n'),('8f6011a0-893f-4ba2-8fff-36b27092b7d9',22832,20201,20155,20159,'','2016-10-26 23:32:48','2016-10-26 23:32:48','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','','');
/*!40000 ALTER TABLE `assetvocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backgroundtask`
--

DROP TABLE IF EXISTS `backgroundtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backgroundtask` (
  `backgroundTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `servletContextNames` varchar(255) DEFAULT NULL,
  `taskExecutorClassName` varchar(200) DEFAULT NULL,
  `taskContext` longtext,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusMessage` longtext,
  PRIMARY KEY (`backgroundTaskId`),
  KEY `IX_C5A6C78F` (`companyId`),
  KEY `IX_5A09E5D1` (`groupId`),
  KEY `IX_98CC0AAB` (`groupId`,`name`,`taskExecutorClassName`),
  KEY `IX_579C63B0` (`groupId`,`name`,`taskExecutorClassName`,`completed`),
  KEY `IX_C71C3B7` (`groupId`,`status`),
  KEY `IX_A73B688A` (`groupId`,`taskExecutorClassName`),
  KEY `IX_7A9FF471` (`groupId`,`taskExecutorClassName`,`completed`),
  KEY `IX_7E757D70` (`groupId`,`taskExecutorClassName`,`status`),
  KEY `IX_C07CC7F8` (`name`),
  KEY `IX_75638CDF` (`status`),
  KEY `IX_2FCFE748` (`taskExecutorClassName`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backgroundtask`
--

LOCK TABLES `backgroundtask` WRITE;
/*!40000 ALTER TABLE `backgroundtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `backgroundtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogsentry`
--

DROP TABLE IF EXISTS `blogsentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogsentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `urlTitle` varchar(150) DEFAULT NULL,
  `description` longtext,
  `content` longtext,
  `displayDate` datetime DEFAULT NULL,
  `allowPingbacks` tinyint(4) DEFAULT NULL,
  `allowTrackbacks` tinyint(4) DEFAULT NULL,
  `trackbacks` longtext,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_DB780A20` (`groupId`,`urlTitle`),
  UNIQUE KEY `IX_1B1040FD` (`uuid_`,`groupId`),
  KEY `IX_72EF6041` (`companyId`),
  KEY `IX_430D791F` (`companyId`,`displayDate`),
  KEY `IX_BB0C2905` (`companyId`,`displayDate`,`status`),
  KEY `IX_EB2DCE27` (`companyId`,`status`),
  KEY `IX_8CACE77B` (`companyId`,`userId`),
  KEY `IX_A5F57B61` (`companyId`,`userId`,`status`),
  KEY `IX_2672F77F` (`displayDate`,`status`),
  KEY `IX_81A50303` (`groupId`),
  KEY `IX_621E19D` (`groupId`,`displayDate`),
  KEY `IX_F0E73383` (`groupId`,`displayDate`,`status`),
  KEY `IX_1EFD8EE9` (`groupId`,`status`),
  KEY `IX_FBDE0AA3` (`groupId`,`userId`,`displayDate`),
  KEY `IX_DA04F689` (`groupId`,`userId`,`displayDate`,`status`),
  KEY `IX_49E15A23` (`groupId`,`userId`,`status`),
  KEY `IX_69157A4D` (`uuid_`),
  KEY `IX_5E8307BB` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogsentry`
--

LOCK TABLES `blogsentry` WRITE;
/*!40000 ALTER TABLE `blogsentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogsentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogsstatsuser`
--

DROP TABLE IF EXISTS `blogsstatsuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogsstatsuser` (
  `statsUserId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `entryCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  `ratingsTotalEntries` int(11) DEFAULT NULL,
  `ratingsTotalScore` double DEFAULT NULL,
  `ratingsAverageScore` double DEFAULT NULL,
  PRIMARY KEY (`statsUserId`),
  UNIQUE KEY `IX_82254C25` (`groupId`,`userId`),
  KEY `IX_90CDA39A` (`companyId`,`entryCount`),
  KEY `IX_43840EEB` (`groupId`),
  KEY `IX_28C78D5C` (`groupId`,`entryCount`),
  KEY `IX_BB51F1D9` (`userId`),
  KEY `IX_507BA031` (`userId`,`lastPostDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogsstatsuser`
--

LOCK TABLES `blogsstatsuser` WRITE;
/*!40000 ALTER TABLE `blogsstatsuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogsstatsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarksentry`
--

DROP TABLE IF EXISTS `bookmarksentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarksentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `description` longtext,
  `visits` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_EAA02A91` (`uuid_`,`groupId`),
  KEY `IX_1F90CA2D` (`companyId`),
  KEY `IX_276C8C13` (`companyId`,`status`),
  KEY `IX_5200100C` (`groupId`,`folderId`),
  KEY `IX_146382F2` (`groupId`,`folderId`,`status`),
  KEY `IX_416AD7D5` (`groupId`,`status`),
  KEY `IX_C78B61AC` (`groupId`,`userId`,`folderId`,`status`),
  KEY `IX_9D9CF70F` (`groupId`,`userId`,`status`),
  KEY `IX_E848278F` (`resourceBlockId`),
  KEY `IX_B670BA39` (`uuid_`),
  KEY `IX_89BEDC4F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarksentry`
--

LOCK TABLES `bookmarksentry` WRITE;
/*!40000 ALTER TABLE `bookmarksentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarksentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarksfolder`
--

DROP TABLE IF EXISTS `bookmarksfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarksfolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_DC2F8927` (`uuid_`,`groupId`),
  KEY `IX_2ABA25D7` (`companyId`),
  KEY `IX_C27C9DBD` (`companyId`,`status`),
  KEY `IX_7F703619` (`groupId`),
  KEY `IX_967799C0` (`groupId`,`parentFolderId`),
  KEY `IX_D16018A6` (`groupId`,`parentFolderId`,`status`),
  KEY `IX_28A49BB9` (`resourceBlockId`),
  KEY `IX_451E7AE3` (`uuid_`),
  KEY `IX_54F0ED65` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarksfolder`
--

LOCK TABLES `bookmarksfolder` WRITE;
/*!40000 ALTER TABLE `bookmarksfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarksfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browsertracker`
--

DROP TABLE IF EXISTS `browsertracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsertracker` (
  `browserTrackerId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `browserKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`browserTrackerId`),
  UNIQUE KEY `IX_E7B95510` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsertracker`
--

LOCK TABLES `browsertracker` WRITE;
/*!40000 ALTER TABLE `browsertracker` DISABLE KEYS */;
INSERT INTO `browsertracker` VALUES (20618,20199,211576108442);
/*!40000 ALTER TABLE `browsertracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `calendarResourceId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `timeZoneId` varchar(75) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `defaultCalendar` tinyint(4) DEFAULT NULL,
  `enableComments` tinyint(4) DEFAULT NULL,
  `enableRatings` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`calendarId`),
  UNIQUE KEY `IX_3AE311A` (`uuid_`,`groupId`),
  KEY `IX_B53EB0E1` (`groupId`,`calendarResourceId`),
  KEY `IX_97FC174E` (`groupId`,`calendarResourceId`,`defaultCalendar`),
  KEY `IX_F0FAF226` (`resourceBlockId`),
  KEY `IX_96C8590` (`uuid_`),
  KEY `IX_97656498` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarbooking`
--

DROP TABLE IF EXISTS `calendarbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarbooking` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarBookingId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `calendarId` bigint(20) DEFAULT NULL,
  `calendarResourceId` bigint(20) DEFAULT NULL,
  `parentCalendarBookingId` bigint(20) DEFAULT NULL,
  `vEventUid` varchar(255) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `location` longtext,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `recurrence` longtext,
  `firstReminder` bigint(20) DEFAULT NULL,
  `firstReminderType` varchar(75) DEFAULT NULL,
  `secondReminder` bigint(20) DEFAULT NULL,
  `secondReminderType` varchar(75) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`calendarBookingId`),
  UNIQUE KEY `IX_113A264E` (`calendarId`,`parentCalendarBookingId`),
  UNIQUE KEY `IX_8B23DA0E` (`calendarId`,`vEventUid`),
  UNIQUE KEY `IX_F4C61797` (`uuid_`,`groupId`),
  KEY `IX_D300DFCE` (`calendarId`),
  KEY `IX_470170B4` (`calendarId`,`status`),
  KEY `IX_B198FFC` (`calendarResourceId`),
  KEY `IX_57EBF55B` (`parentCalendarBookingId`),
  KEY `IX_F7B8A941` (`parentCalendarBookingId`,`status`),
  KEY `IX_22DFDB49` (`resourceBlockId`),
  KEY `IX_F6E8EE73` (`uuid_`),
  KEY `IX_A21D9FD5` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarbooking`
--

LOCK TABLES `calendarbooking` WRITE;
/*!40000 ALTER TABLE `calendarbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarnotificationtemplate`
--

DROP TABLE IF EXISTS `calendarnotificationtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarnotificationtemplate` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarNotificationTemplateId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `calendarId` bigint(20) DEFAULT NULL,
  `notificationType` varchar(75) DEFAULT NULL,
  `notificationTypeSettings` varchar(75) DEFAULT NULL,
  `notificationTemplateType` varchar(75) DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`calendarNotificationTemplateId`),
  UNIQUE KEY `IX_4012E97F` (`uuid_`,`groupId`),
  KEY `IX_A412E5B6` (`calendarId`),
  KEY `IX_7727A482` (`calendarId`,`notificationType`,`notificationTemplateType`),
  KEY `IX_A2D4D78B` (`uuid_`),
  KEY `IX_4D7D97BD` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarnotificationtemplate`
--

LOCK TABLES `calendarnotificationtemplate` WRITE;
/*!40000 ALTER TABLE `calendarnotificationtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarnotificationtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarresource`
--

DROP TABLE IF EXISTS `calendarresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarresource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarResourceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `code_` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`calendarResourceId`),
  UNIQUE KEY `IX_16A12327` (`classNameId`,`classPK`),
  UNIQUE KEY `IX_4ABD2BC8` (`uuid_`,`groupId`),
  KEY `IX_76DDD0F7` (`active_`),
  KEY `IX_4470A59D` (`companyId`,`code_`,`active_`),
  KEY `IX_1243D698` (`groupId`),
  KEY `IX_40678371` (`groupId`,`active_`),
  KEY `IX_55C2F8AA` (`groupId`,`code_`),
  KEY `IX_8BCB4D38` (`resourceBlockId`),
  KEY `IX_150E2F22` (`uuid_`),
  KEY `IX_56A06BC6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarresource`
--

LOCK TABLES `calendarresource` WRITE;
/*!40000 ALTER TABLE `calendarresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calevent`
--

DROP TABLE IF EXISTS `calevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calevent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `eventId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `description` longtext,
  `location` longtext,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `durationHour` int(11) DEFAULT NULL,
  `durationMinute` int(11) DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `timeZoneSensitive` tinyint(4) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `repeating` tinyint(4) DEFAULT NULL,
  `recurrence` longtext,
  `remindBy` int(11) DEFAULT NULL,
  `firstReminder` int(11) DEFAULT NULL,
  `secondReminder` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  UNIQUE KEY `IX_5CCE79C8` (`uuid_`,`groupId`),
  KEY `IX_D6FD9496` (`companyId`),
  KEY `IX_12EE4898` (`groupId`),
  KEY `IX_4FDDD2BF` (`groupId`,`repeating`),
  KEY `IX_FCD7C63D` (`groupId`,`type_`),
  KEY `IX_FD93CBFA` (`groupId`,`type_`,`repeating`),
  KEY `IX_F6006202` (`remindBy`),
  KEY `IX_C1AD2122` (`uuid_`),
  KEY `IX_299639C6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calevent`
--

LOCK TABLES `calevent` WRITE;
/*!40000 ALTER TABLE `calevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `calevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classname_`
--

DROP TABLE IF EXISTS `classname_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classname_` (
  `classNameId` bigint(20) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`classNameId`),
  UNIQUE KEY `IX_B27A301F` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classname_`
--

LOCK TABLES `classname_` WRITE;
/*!40000 ALTER TABLE `classname_` DISABLE KEYS */;
INSERT INTO `classname_` VALUES (20441,'com.liferay.calendar.model.Calendar'),(20442,'com.liferay.calendar.model.CalendarBooking'),(20443,'com.liferay.calendar.model.CalendarNotificationTemplate'),(20444,'com.liferay.calendar.model.CalendarResource'),(20017,'com.liferay.counter.model.Counter'),(20433,'com.liferay.marketplace.model.App'),(20434,'com.liferay.marketplace.model.Module'),(20495,'com.liferay.notifications.model.UserNotificationEvent'),(20499,'com.liferay.opensocial.model.Gadget'),(20500,'com.liferay.opensocial.model.OAuthConsumer'),(20501,'com.liferay.opensocial.model.OAuthToken'),(20422,'com.liferay.portal.kernel.repository.model.FileEntry'),(25803,'com.liferay.portal.kernel.repository.model.Folder'),(20018,'com.liferay.portal.kernel.workflow.WorkflowTask'),(20019,'com.liferay.portal.model.Account'),(20020,'com.liferay.portal.model.Address'),(20021,'com.liferay.portal.model.BackgroundTask'),(20022,'com.liferay.portal.model.BrowserTracker'),(20023,'com.liferay.portal.model.ClassName'),(20024,'com.liferay.portal.model.ClusterGroup'),(20025,'com.liferay.portal.model.Company'),(20026,'com.liferay.portal.model.Contact'),(20027,'com.liferay.portal.model.Country'),(20028,'com.liferay.portal.model.EmailAddress'),(20001,'com.liferay.portal.model.Group'),(20029,'com.liferay.portal.model.Image'),(20002,'com.liferay.portal.model.Layout'),(20030,'com.liferay.portal.model.LayoutBranch'),(20031,'com.liferay.portal.model.LayoutFriendlyURL'),(20032,'com.liferay.portal.model.LayoutPrototype'),(20033,'com.liferay.portal.model.LayoutRevision'),(20034,'com.liferay.portal.model.LayoutSet'),(20035,'com.liferay.portal.model.LayoutSetBranch'),(20036,'com.liferay.portal.model.LayoutSetPrototype'),(20037,'com.liferay.portal.model.ListType'),(20038,'com.liferay.portal.model.Lock'),(20039,'com.liferay.portal.model.MembershipRequest'),(20003,'com.liferay.portal.model.Organization'),(20040,'com.liferay.portal.model.OrgGroupRole'),(20041,'com.liferay.portal.model.OrgLabor'),(20042,'com.liferay.portal.model.PasswordPolicy'),(20043,'com.liferay.portal.model.PasswordPolicyRel'),(20044,'com.liferay.portal.model.PasswordTracker'),(20045,'com.liferay.portal.model.Phone'),(20046,'com.liferay.portal.model.PluginSetting'),(20047,'com.liferay.portal.model.PortalPreferences'),(20048,'com.liferay.portal.model.Portlet'),(20049,'com.liferay.portal.model.PortletItem'),(20050,'com.liferay.portal.model.PortletPreferences'),(20051,'com.liferay.portal.model.Region'),(20052,'com.liferay.portal.model.Release'),(20053,'com.liferay.portal.model.Repository'),(20054,'com.liferay.portal.model.RepositoryEntry'),(20055,'com.liferay.portal.model.ResourceAction'),(20056,'com.liferay.portal.model.ResourceBlock'),(20057,'com.liferay.portal.model.ResourceBlockPermission'),(20058,'com.liferay.portal.model.ResourcePermission'),(20059,'com.liferay.portal.model.ResourceTypePermission'),(20004,'com.liferay.portal.model.Role'),(20060,'com.liferay.portal.model.ServiceComponent'),(20061,'com.liferay.portal.model.Shard'),(20062,'com.liferay.portal.model.Subscription'),(20063,'com.liferay.portal.model.SystemEvent'),(20064,'com.liferay.portal.model.Team'),(20065,'com.liferay.portal.model.Ticket'),(20005,'com.liferay.portal.model.User'),(20006,'com.liferay.portal.model.UserGroup'),(20066,'com.liferay.portal.model.UserGroupGroupRole'),(20067,'com.liferay.portal.model.UserGroupRole'),(20068,'com.liferay.portal.model.UserIdMapper'),(20069,'com.liferay.portal.model.UserNotificationDelivery'),(20070,'com.liferay.portal.model.UserNotificationEvent'),(20191,'com.liferay.portal.model.UserPersonalSite'),(20071,'com.liferay.portal.model.UserTracker'),(20072,'com.liferay.portal.model.UserTrackerPath'),(20073,'com.liferay.portal.model.VirtualHost'),(20074,'com.liferay.portal.model.WebDAVProps'),(20075,'com.liferay.portal.model.Website'),(20076,'com.liferay.portal.model.WorkflowDefinitionLink'),(20077,'com.liferay.portal.model.WorkflowInstanceLink'),(21004,'com.liferay.portal.repository.liferayrepository.LiferayRepository'),(20448,'com.liferay.portal.workflow.kaleo.model.KaleoAction'),(20449,'com.liferay.portal.workflow.kaleo.model.KaleoCondition'),(20450,'com.liferay.portal.workflow.kaleo.model.KaleoDefinition'),(20451,'com.liferay.portal.workflow.kaleo.model.KaleoInstance'),(20452,'com.liferay.portal.workflow.kaleo.model.KaleoInstanceToken'),(20453,'com.liferay.portal.workflow.kaleo.model.KaleoLog'),(20454,'com.liferay.portal.workflow.kaleo.model.KaleoNode'),(20455,'com.liferay.portal.workflow.kaleo.model.KaleoNotification'),(20456,'com.liferay.portal.workflow.kaleo.model.KaleoNotificationRecipient'),(20457,'com.liferay.portal.workflow.kaleo.model.KaleoTask'),(20458,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignment'),(20459,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignmentInstance'),(20460,'com.liferay.portal.workflow.kaleo.model.KaleoTaskInstanceToken'),(20461,'com.liferay.portal.workflow.kaleo.model.KaleoTimer'),(20462,'com.liferay.portal.workflow.kaleo.model.KaleoTimerInstanceToken'),(20463,'com.liferay.portal.workflow.kaleo.model.KaleoTransition'),(20078,'com.liferay.portlet.announcements.model.AnnouncementsDelivery'),(20079,'com.liferay.portlet.announcements.model.AnnouncementsEntry'),(20080,'com.liferay.portlet.announcements.model.AnnouncementsFlag'),(20081,'com.liferay.portlet.asset.model.AssetCategory'),(20082,'com.liferay.portlet.asset.model.AssetCategoryProperty'),(20083,'com.liferay.portlet.asset.model.AssetEntry'),(20084,'com.liferay.portlet.asset.model.AssetLink'),(20085,'com.liferay.portlet.asset.model.AssetTag'),(20086,'com.liferay.portlet.asset.model.AssetTagProperty'),(20087,'com.liferay.portlet.asset.model.AssetTagStats'),(20088,'com.liferay.portlet.asset.model.AssetVocabulary'),(20007,'com.liferay.portlet.blogs.model.BlogsEntry'),(20089,'com.liferay.portlet.blogs.model.BlogsStatsUser'),(20008,'com.liferay.portlet.bookmarks.model.BookmarksEntry'),(20009,'com.liferay.portlet.bookmarks.model.BookmarksFolder'),(20010,'com.liferay.portlet.calendar.model.CalEvent'),(20090,'com.liferay.portlet.documentlibrary.model.DLContent'),(20011,'com.liferay.portlet.documentlibrary.model.DLFileEntry'),(20091,'com.liferay.portlet.documentlibrary.model.DLFileEntryMetadata'),(20092,'com.liferay.portlet.documentlibrary.model.DLFileEntryType'),(20093,'com.liferay.portlet.documentlibrary.model.DLFileRank'),(20094,'com.liferay.portlet.documentlibrary.model.DLFileShortcut'),(20095,'com.liferay.portlet.documentlibrary.model.DLFileVersion'),(20012,'com.liferay.portlet.documentlibrary.model.DLFolder'),(20096,'com.liferay.portlet.documentlibrary.model.DLSyncEvent'),(20314,'com.liferay.portlet.documentlibrary.util.RawMetadataProcessor'),(20097,'com.liferay.portlet.dynamicdatalists.model.DDLRecord'),(20098,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet'),(20099,'com.liferay.portlet.dynamicdatalists.model.DDLRecordVersion'),(20100,'com.liferay.portlet.dynamicdatamapping.model.DDMContent'),(20101,'com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink'),(20102,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure'),(20103,'com.liferay.portlet.dynamicdatamapping.model.DDMStructureLink'),(20104,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate'),(20105,'com.liferay.portlet.expando.model.ExpandoColumn'),(20106,'com.liferay.portlet.expando.model.ExpandoRow'),(20107,'com.liferay.portlet.expando.model.ExpandoTable'),(20108,'com.liferay.portlet.expando.model.ExpandoValue'),(20109,'com.liferay.portlet.journal.model.JournalArticle'),(20110,'com.liferay.portlet.journal.model.JournalArticleImage'),(20111,'com.liferay.portlet.journal.model.JournalArticleResource'),(20112,'com.liferay.portlet.journal.model.JournalContentSearch'),(20113,'com.liferay.portlet.journal.model.JournalFeed'),(20013,'com.liferay.portlet.journal.model.JournalFolder'),(20114,'com.liferay.portlet.messageboards.model.MBBan'),(20115,'com.liferay.portlet.messageboards.model.MBCategory'),(20116,'com.liferay.portlet.messageboards.model.MBDiscussion'),(20117,'com.liferay.portlet.messageboards.model.MBMailingList'),(20014,'com.liferay.portlet.messageboards.model.MBMessage'),(20118,'com.liferay.portlet.messageboards.model.MBStatsUser'),(20015,'com.liferay.portlet.messageboards.model.MBThread'),(20119,'com.liferay.portlet.messageboards.model.MBThreadFlag'),(20120,'com.liferay.portlet.mobiledevicerules.model.MDRAction'),(20121,'com.liferay.portlet.mobiledevicerules.model.MDRRule'),(20122,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup'),(20123,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance'),(20124,'com.liferay.portlet.polls.model.PollsChoice'),(20125,'com.liferay.portlet.polls.model.PollsQuestion'),(20126,'com.liferay.portlet.polls.model.PollsVote'),(20127,'com.liferay.portlet.ratings.model.RatingsEntry'),(20128,'com.liferay.portlet.ratings.model.RatingsStats'),(20129,'com.liferay.portlet.shopping.model.ShoppingCart'),(20130,'com.liferay.portlet.shopping.model.ShoppingCategory'),(20131,'com.liferay.portlet.shopping.model.ShoppingCoupon'),(20132,'com.liferay.portlet.shopping.model.ShoppingItem'),(20133,'com.liferay.portlet.shopping.model.ShoppingItemField'),(20134,'com.liferay.portlet.shopping.model.ShoppingItemPrice'),(20135,'com.liferay.portlet.shopping.model.ShoppingOrder'),(20136,'com.liferay.portlet.shopping.model.ShoppingOrderItem'),(20137,'com.liferay.portlet.social.model.SocialActivity'),(20138,'com.liferay.portlet.social.model.SocialActivityAchievement'),(20139,'com.liferay.portlet.social.model.SocialActivityCounter'),(20140,'com.liferay.portlet.social.model.SocialActivityLimit'),(20141,'com.liferay.portlet.social.model.SocialActivitySet'),(20142,'com.liferay.portlet.social.model.SocialActivitySetting'),(20143,'com.liferay.portlet.social.model.SocialRelation'),(20144,'com.liferay.portlet.social.model.SocialRequest'),(20145,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion'),(20146,'com.liferay.portlet.softwarecatalog.model.SCLicense'),(20147,'com.liferay.portlet.softwarecatalog.model.SCProductEntry'),(20148,'com.liferay.portlet.softwarecatalog.model.SCProductScreenshot'),(20149,'com.liferay.portlet.softwarecatalog.model.SCProductVersion'),(20150,'com.liferay.portlet.trash.model.TrashEntry'),(20151,'com.liferay.portlet.trash.model.TrashVersion'),(20152,'com.liferay.portlet.wiki.model.WikiNode'),(20016,'com.liferay.portlet.wiki.model.WikiPage'),(20153,'com.liferay.portlet.wiki.model.WikiPageResource'),(20509,'com.liferay.sync.model.SyncDLFileVersionDiff'),(20510,'com.liferay.sync.model.SyncDLObject'),(20439,'com.tiis.library.service.model.Foo'),(21514,'ru.tiis.srv.model.Book'),(21515,'ru.tiis.srv.model.Test'),(21516,'ru.tiis.srv.model.TestAttempt');
/*!40000 ALTER TABLE `classname_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clustergroup`
--

DROP TABLE IF EXISTS `clustergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clustergroup` (
  `clusterGroupId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `clusterNodeIds` varchar(75) DEFAULT NULL,
  `wholeCluster` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`clusterGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clustergroup`
--

LOCK TABLES `clustergroup` WRITE;
/*!40000 ALTER TABLE `clustergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `clustergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `companyId` bigint(20) NOT NULL,
  `accountId` bigint(20) DEFAULT NULL,
  `webId` varchar(75) DEFAULT NULL,
  `key_` longtext,
  `mx` varchar(75) DEFAULT NULL,
  `homeURL` longtext,
  `logoId` bigint(20) DEFAULT NULL,
  `system` tinyint(4) DEFAULT NULL,
  `maxUsers` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`companyId`),
  UNIQUE KEY `IX_EC00543C` (`webId`),
  KEY `IX_38EFE3FD` (`logoId`),
  KEY `IX_12566EC2` (`mx`),
  KEY `IX_35E3E7C6` (`system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (20155,20157,'liferay.com','rO0ABXNyAB9qYXZheC5jcnlwdG8uc3BlYy5TZWNyZXRLZXlTcGVjW0cLZuIwYU0CAAJMAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZztbAANrZXl0AAJbQnhwdAADQUVTdXIAAltCrPMX+AYIVOACAAB4cAAAABDX5D0mrqLAcGH/RwtC+4N+','tiis.pro','',21011,0,0,1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_`
--

DROP TABLE IF EXISTS `contact_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_` (
  `contactId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `accountId` bigint(20) DEFAULT NULL,
  `parentContactId` bigint(20) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `firstName` varchar(75) DEFAULT NULL,
  `middleName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `prefixId` int(11) DEFAULT NULL,
  `suffixId` int(11) DEFAULT NULL,
  `male` tinyint(4) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `smsSn` varchar(75) DEFAULT NULL,
  `aimSn` varchar(75) DEFAULT NULL,
  `facebookSn` varchar(75) DEFAULT NULL,
  `icqSn` varchar(75) DEFAULT NULL,
  `jabberSn` varchar(75) DEFAULT NULL,
  `msnSn` varchar(75) DEFAULT NULL,
  `mySpaceSn` varchar(75) DEFAULT NULL,
  `skypeSn` varchar(75) DEFAULT NULL,
  `twitterSn` varchar(75) DEFAULT NULL,
  `ymSn` varchar(75) DEFAULT NULL,
  `employeeStatusId` varchar(75) DEFAULT NULL,
  `employeeNumber` varchar(75) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `jobClass` varchar(75) DEFAULT NULL,
  `hoursOfOperation` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `IX_B8C28C53` (`accountId`),
  KEY `IX_791914FA` (`classNameId`,`classPK`),
  KEY `IX_66D496A3` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_`
--

LOCK TABLES `contact_` WRITE;
/*!40000 ALTER TABLE `contact_` DISABLE KEYS */;
INSERT INTO `contact_` VALUES (20160,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20005,20159,20157,0,'default@liferay.com','','','',0,0,1,'2016-10-02 17:09:31','','','','','','','','','','','','','','',''),(20200,20155,20199,'','2016-10-02 17:09:32','2016-10-26 23:33:14',20005,20199,20157,0,'test@liferay.com','Test','','Test',0,0,1,'1970-01-01 00:00:00','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `contact_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `name` varchar(75) NOT NULL,
  `currentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES ('com.liferay.counter.model.Counter',26700),('com.liferay.portal.model.Layout#20173#true',1),('com.liferay.portal.model.Layout#20182#false',9),('com.liferay.portal.model.Layout#20182#true',1),('com.liferay.portal.model.Layout#20201#false',1),('com.liferay.portal.model.Layout#20201#true',1),('com.liferay.portal.model.Layout#20317#true',1),('com.liferay.portal.model.Layout#20329#true',1),('com.liferay.portal.model.Layout#20339#true',1),('com.liferay.portal.model.Layout#20350#true',2),('com.liferay.portal.model.Layout#20376#true',3),('com.liferay.portal.model.Layout#20620#true',1),('com.liferay.portal.model.Layout#21104#true',1),('com.liferay.portal.model.Layout#21219#true',1),('com.liferay.portal.model.Layout#24502#true',1),('com.liferay.portal.model.Layout#24802#true',1),('com.liferay.portal.model.Layout#24855#true',6),('com.liferay.portal.model.Layout#25111#true',1),('com.liferay.portal.model.ResourceAction',1600),('com.liferay.portal.model.ResourcePermission',5000),('com.liferay.portlet.documentlibrary.model.DLFileEntry',200),('com.liferay.portlet.social.model.SocialActivity',600),('ru.tiis.srv.model.Book',1200);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `a2` varchar(75) DEFAULT NULL,
  `a3` varchar(75) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `idd_` varchar(75) DEFAULT NULL,
  `zipRequired` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `IX_717B97E1` (`a2`),
  UNIQUE KEY `IX_717B9BA2` (`a3`),
  UNIQUE KEY `IX_19DA007B` (`name`),
  KEY `IX_25D734CD` (`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'canada','CA','CAN','124','001',1,1),(2,'china','CN','CHN','156','086',1,1),(3,'france','FR','FRA','250','033',1,1),(4,'germany','DE','DEU','276','049',1,1),(5,'hong-kong','HK','HKG','344','852',1,1),(6,'hungary','HU','HUN','348','036',1,1),(7,'israel','IL','ISR','376','972',1,1),(8,'italy','IT','ITA','380','039',1,1),(9,'japan','JP','JPN','392','081',0,1),(10,'south-korea','KR','KOR','410','082',1,1),(11,'netherlands','NL','NLD','528','031',1,1),(12,'portugal','PT','PRT','620','351',1,1),(13,'russia','RU','RUS','643','007',1,1),(14,'singapore','SG','SGP','702','065',1,1),(15,'spain','ES','ESP','724','034',1,1),(16,'turkey','TR','TUR','792','090',1,1),(17,'vietnam','VN','VNM','704','084',1,1),(18,'united-kingdom','GB','GBR','826','044',1,1),(19,'united-states','US','USA','840','001',1,1),(20,'afghanistan','AF','AFG','4','093',1,1),(21,'albania','AL','ALB','8','355',1,1),(22,'algeria','DZ','DZA','12','213',1,1),(23,'american-samoa','AS','ASM','16','684',1,1),(24,'andorra','AD','AND','20','376',1,1),(25,'angola','AO','AGO','24','244',0,1),(26,'anguilla','AI','AIA','660','264',1,1),(27,'antarctica','AQ','ATA','10','672',1,1),(28,'antigua-barbuda','AG','ATG','28','268',0,1),(29,'argentina','AR','ARG','32','054',1,1),(30,'armenia','AM','ARM','51','374',1,1),(31,'aruba','AW','ABW','533','297',0,1),(32,'australia','AU','AUS','36','061',1,1),(33,'austria','AT','AUT','40','043',1,1),(34,'azerbaijan','AZ','AZE','31','994',1,1),(35,'bahamas','BS','BHS','44','242',0,1),(36,'bahrain','BH','BHR','48','973',1,1),(37,'bangladesh','BD','BGD','50','880',1,1),(38,'barbados','BB','BRB','52','246',1,1),(39,'belarus','BY','BLR','112','375',1,1),(40,'belgium','BE','BEL','56','032',1,1),(41,'belize','BZ','BLZ','84','501',0,1),(42,'benin','BJ','BEN','204','229',0,1),(43,'bermuda','BM','BMU','60','441',1,1),(44,'bhutan','BT','BTN','64','975',1,1),(45,'bolivia','BO','BOL','68','591',1,1),(46,'bosnia-herzegovina','BA','BIH','70','387',1,1),(47,'botswana','BW','BWA','72','267',0,1),(48,'brazil','BR','BRA','76','055',1,1),(49,'british-virgin-islands','VG','VGB','92','284',1,1),(50,'brunei','BN','BRN','96','673',1,1),(51,'bulgaria','BG','BGR','100','359',1,1),(52,'burkina-faso','BF','BFA','854','226',0,1),(53,'burma-myanmar','MM','MMR','104','095',1,1),(54,'burundi','BI','BDI','108','257',0,1),(55,'cambodia','KH','KHM','116','855',1,1),(56,'cameroon','CM','CMR','120','237',1,1),(57,'cape-verde-island','CV','CPV','132','238',1,1),(58,'cayman-islands','KY','CYM','136','345',1,1),(59,'central-african-republic','CF','CAF','140','236',0,1),(60,'chad','TD','TCD','148','235',1,1),(61,'chile','CL','CHL','152','056',1,1),(62,'christmas-island','CX','CXR','162','061',1,1),(63,'cocos-islands','CC','CCK','166','061',1,1),(64,'colombia','CO','COL','170','057',1,1),(65,'comoros','KM','COM','174','269',0,1),(66,'republic-of-congo','CD','COD','180','242',0,1),(67,'democratic-republic-of-congo','CG','COG','178','243',0,1),(68,'cook-islands','CK','COK','184','682',0,1),(69,'costa-rica','CR','CRI','188','506',1,1),(70,'croatia','HR','HRV','191','385',1,1),(71,'cuba','CU','CUB','192','053',1,1),(72,'cyprus','CY','CYP','196','357',1,1),(73,'czech-republic','CZ','CZE','203','420',1,1),(74,'denmark','DK','DNK','208','045',1,1),(75,'djibouti','DJ','DJI','262','253',0,1),(76,'dominica','DM','DMA','212','767',0,1),(77,'dominican-republic','DO','DOM','214','809',1,1),(78,'ecuador','EC','ECU','218','593',1,1),(79,'egypt','EG','EGY','818','020',1,1),(80,'el-salvador','SV','SLV','222','503',1,1),(81,'equatorial-guinea','GQ','GNQ','226','240',0,1),(82,'eritrea','ER','ERI','232','291',0,1),(83,'estonia','EE','EST','233','372',1,1),(84,'ethiopia','ET','ETH','231','251',1,1),(85,'faeroe-islands','FO','FRO','234','298',1,1),(86,'falkland-islands','FK','FLK','238','500',1,1),(87,'fiji-islands','FJ','FJI','242','679',0,1),(88,'finland','FI','FIN','246','358',1,1),(89,'french-guiana','GF','GUF','254','594',1,1),(90,'french-polynesia','PF','PYF','258','689',1,1),(91,'gabon','GA','GAB','266','241',1,1),(92,'gambia','GM','GMB','270','220',0,1),(93,'georgia','GE','GEO','268','995',1,1),(94,'ghana','GH','GHA','288','233',0,1),(95,'gibraltar','GI','GIB','292','350',1,1),(96,'greece','GR','GRC','300','030',1,1),(97,'greenland','GL','GRL','304','299',1,1),(98,'grenada','GD','GRD','308','473',0,1),(99,'guadeloupe','GP','GLP','312','590',1,1),(100,'guam','GU','GUM','316','671',1,1),(101,'guatemala','GT','GTM','320','502',1,1),(102,'guinea','GN','GIN','324','224',0,1),(103,'guinea-bissau','GW','GNB','624','245',1,1),(104,'guyana','GY','GUY','328','592',0,1),(105,'haiti','HT','HTI','332','509',1,1),(106,'honduras','HN','HND','340','504',1,1),(107,'iceland','IS','ISL','352','354',1,1),(108,'india','IN','IND','356','091',1,1),(109,'indonesia','ID','IDN','360','062',1,1),(110,'iran','IR','IRN','364','098',1,1),(111,'iraq','IQ','IRQ','368','964',1,1),(112,'ireland','IE','IRL','372','353',0,1),(113,'ivory-coast','CI','CIV','384','225',1,1),(114,'jamaica','JM','JAM','388','876',1,1),(115,'jordan','JO','JOR','400','962',1,1),(116,'kazakhstan','KZ','KAZ','398','007',1,1),(117,'kenya','KE','KEN','404','254',1,1),(118,'kiribati','KI','KIR','408','686',0,1),(119,'kuwait','KW','KWT','414','965',1,1),(120,'north-korea','KP','PRK','408','850',0,1),(121,'kyrgyzstan','KG','KGZ','471','996',1,1),(122,'laos','LA','LAO','418','856',1,1),(123,'latvia','LV','LVA','428','371',1,1),(124,'lebanon','LB','LBN','422','961',1,1),(125,'lesotho','LS','LSO','426','266',1,1),(126,'liberia','LR','LBR','430','231',1,1),(127,'libya','LY','LBY','434','218',1,1),(128,'liechtenstein','LI','LIE','438','423',1,1),(129,'lithuania','LT','LTU','440','370',1,1),(130,'luxembourg','LU','LUX','442','352',1,1),(131,'macau','MO','MAC','446','853',0,1),(132,'macedonia','MK','MKD','807','389',1,1),(133,'madagascar','MG','MDG','450','261',1,1),(134,'malawi','MW','MWI','454','265',0,1),(135,'malaysia','MY','MYS','458','060',1,1),(136,'maldives','MV','MDV','462','960',1,1),(137,'mali','ML','MLI','466','223',0,1),(138,'malta','MT','MLT','470','356',1,1),(139,'marshall-islands','MH','MHL','584','692',1,1),(140,'martinique','MQ','MTQ','474','596',1,1),(141,'mauritania','MR','MRT','478','222',0,1),(142,'mauritius','MU','MUS','480','230',0,1),(143,'mayotte-island','YT','MYT','175','269',1,1),(144,'mexico','MX','MEX','484','052',1,1),(145,'micronesia','FM','FSM','583','691',1,1),(146,'moldova','MD','MDA','498','373',1,1),(147,'monaco','MC','MCO','492','377',1,1),(148,'mongolia','MN','MNG','496','976',1,1),(149,'montenegro','ME','MNE','499','382',1,1),(150,'montserrat','MS','MSR','500','664',0,1),(151,'morocco','MA','MAR','504','212',1,1),(152,'mozambique','MZ','MOZ','508','258',1,1),(153,'namibia','NA','NAM','516','264',1,1),(154,'nauru','NR','NRU','520','674',0,1),(155,'nepal','NP','NPL','524','977',1,1),(156,'netherlands-antilles','AN','ANT','530','599',1,1),(157,'new-caledonia','NC','NCL','540','687',1,1),(158,'new-zealand','NZ','NZL','554','064',1,1),(159,'nicaragua','NI','NIC','558','505',1,1),(160,'niger','NE','NER','562','227',1,1),(161,'nigeria','NG','NGA','566','234',1,1),(162,'niue','NU','NIU','570','683',0,1),(163,'norfolk-island','NF','NFK','574','672',1,1),(164,'norway','NO','NOR','578','047',1,1),(165,'oman','OM','OMN','512','968',1,1),(166,'pakistan','PK','PAK','586','092',1,1),(167,'palau','PW','PLW','585','680',1,1),(168,'palestine','PS','PSE','275','970',1,1),(169,'panama','PA','PAN','591','507',1,1),(170,'papua-new-guinea','PG','PNG','598','675',1,1),(171,'paraguay','PY','PRY','600','595',1,1),(172,'peru','PE','PER','604','051',1,1),(173,'philippines','PH','PHL','608','063',1,1),(174,'poland','PL','POL','616','048',1,1),(175,'puerto-rico','PR','PRI','630','787',1,1),(176,'qatar','QA','QAT','634','974',0,1),(177,'reunion-island','RE','REU','638','262',1,1),(178,'romania','RO','ROU','642','040',1,1),(179,'rwanda','RW','RWA','646','250',0,1),(180,'st-helena','SH','SHN','654','290',1,1),(181,'st-kitts','KN','KNA','659','869',0,1),(182,'st-lucia','LC','LCA','662','758',0,1),(183,'st-pierre-miquelon','PM','SPM','666','508',1,1),(184,'st-vincent','VC','VCT','670','784',1,1),(185,'san-marino','SM','SMR','674','378',1,1),(186,'sao-tome-principe','ST','STP','678','239',0,1),(187,'saudi-arabia','SA','SAU','682','966',1,1),(188,'senegal','SN','SEN','686','221',1,1),(189,'serbia','RS','SRB','688','381',1,1),(190,'seychelles','SC','SYC','690','248',0,1),(191,'sierra-leone','SL','SLE','694','249',0,1),(192,'slovakia','SK','SVK','703','421',1,1),(193,'slovenia','SI','SVN','705','386',1,1),(194,'solomon-islands','SB','SLB','90','677',0,1),(195,'somalia','SO','SOM','706','252',0,1),(196,'south-africa','ZA','ZAF','710','027',1,1),(197,'sri-lanka','LK','LKA','144','094',1,1),(198,'sudan','SD','SDN','736','095',1,1),(199,'suriname','SR','SUR','740','597',0,1),(200,'swaziland','SZ','SWZ','748','268',1,1),(201,'sweden','SE','SWE','752','046',1,1),(202,'switzerland','CH','CHE','756','041',1,1),(203,'syria','SY','SYR','760','963',0,1),(204,'taiwan','TW','TWN','158','886',1,1),(205,'tajikistan','TJ','TJK','762','992',1,1),(206,'tanzania','TZ','TZA','834','255',0,1),(207,'thailand','TH','THA','764','066',1,1),(208,'togo','TG','TGO','768','228',1,1),(209,'tonga','TO','TON','776','676',0,1),(210,'trinidad-tobago','TT','TTO','780','868',0,1),(211,'tunisia','TN','TUN','788','216',1,1),(212,'turkmenistan','TM','TKM','795','993',1,1),(213,'turks-caicos','TC','TCA','796','649',1,1),(214,'tuvalu','TV','TUV','798','688',0,1),(215,'uganda','UG','UGA','800','256',0,1),(216,'ukraine','UA','UKR','804','380',1,1),(217,'united-arab-emirates','AE','ARE','784','971',0,1),(218,'uruguay','UY','URY','858','598',1,1),(219,'uzbekistan','UZ','UZB','860','998',1,1),(220,'vanuatu','VU','VUT','548','678',0,1),(221,'vatican-city','VA','VAT','336','039',1,1),(222,'venezuela','VE','VEN','862','058',1,1),(223,'wallis-futuna','WF','WLF','876','681',1,1),(224,'western-samoa','WS','WSM','882','685',1,1),(225,'yemen','YE','YEM','887','967',0,1),(226,'zambia','ZM','ZMB','894','260',1,1),(227,'zimbabwe','ZW','ZWE','716','263',0,1),(228,'aland-islands','AX','ALA','248','359',1,1),(229,'bonaire-st-eustatius-saba','BQ','BES','535','599',1,1),(230,'bouvet-island','BV','BVT','74','047',1,1),(231,'british-indian-ocean-territory','IO','IOT','86','246',1,1),(232,'curacao','CW','CUW','531','599',1,1),(233,'french-southern-territories','TF','ATF','260','033',0,1),(234,'guernsey','GG','GGY','831','044',1,1),(235,'heard-island-mcdonald-islands','HM','HMD','334','061',1,1),(236,'isle-of-man','IM','IMN','833','044',1,1),(237,'jersey','JE','JEY','832','044',1,1),(238,'northern-mariana-islands','MP','MNP','580','670',1,1),(239,'pitcairn','PN','PCN','612','649',1,1),(240,'south-georgia-south-sandwich-islands','GS','SGS','239','044',1,1),(241,'south-sudan','SS','SSD','728','211',1,1),(242,'sint-maarten','SX','SXM','534','721',1,1),(243,'st-barthelemy','BL','BLM','652','590',1,1),(244,'st-martin','MF','MAF','663','590',1,1),(245,'tokelau','TK','TKL','772','690',0,1),(246,'timor-leste','TL','TLS','626','670',1,1),(247,'united-states-minor-outlying-islands','UM','UMI','581','699',1,1),(248,'united-states-virgin-islands','VI','VIR','850','340',1,1),(249,'western-sahara','EH','ESH','732','212',1,1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cyrususer`
--

DROP TABLE IF EXISTS `cyrususer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cyrususer` (
  `userId` varchar(75) NOT NULL,
  `password_` varchar(75) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cyrususer`
--

LOCK TABLES `cyrususer` WRITE;
/*!40000 ALTER TABLE `cyrususer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cyrususer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cyrusvirtual`
--

DROP TABLE IF EXISTS `cyrusvirtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cyrusvirtual` (
  `emailAddress` varchar(75) NOT NULL,
  `userId` varchar(75) NOT NULL,
  PRIMARY KEY (`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cyrusvirtual`
--

LOCK TABLES `cyrusvirtual` WRITE;
/*!40000 ALTER TABLE `cyrusvirtual` DISABLE KEYS */;
/*!40000 ALTER TABLE `cyrusvirtual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddlrecord`
--

DROP TABLE IF EXISTS `ddlrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddlrecord` (
  `uuid_` varchar(75) DEFAULT NULL,
  `recordId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `versionUserId` bigint(20) DEFAULT NULL,
  `versionUserName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `recordSetId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `displayIndex` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  UNIQUE KEY `IX_B4328F39` (`uuid_`,`groupId`),
  KEY `IX_6A6C1C85` (`companyId`),
  KEY `IX_87A6B599` (`recordSetId`),
  KEY `IX_AAC564D3` (`recordSetId`,`userId`),
  KEY `IX_8BC2F891` (`uuid_`),
  KEY `IX_384AB6F7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddlrecord`
--

LOCK TABLES `ddlrecord` WRITE;
/*!40000 ALTER TABLE `ddlrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `ddlrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddlrecordset`
--

DROP TABLE IF EXISTS `ddlrecordset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddlrecordset` (
  `uuid_` varchar(75) DEFAULT NULL,
  `recordSetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `DDMStructureId` bigint(20) DEFAULT NULL,
  `recordSetKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `minDisplayRows` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordSetId`),
  UNIQUE KEY `IX_56DAB121` (`groupId`,`recordSetKey`),
  UNIQUE KEY `IX_270BA5E1` (`uuid_`,`groupId`),
  KEY `IX_4FA5969F` (`groupId`),
  KEY `IX_561E44E9` (`uuid_`),
  KEY `IX_5938C39F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddlrecordset`
--

LOCK TABLES `ddlrecordset` WRITE;
/*!40000 ALTER TABLE `ddlrecordset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ddlrecordset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddlrecordversion`
--

DROP TABLE IF EXISTS `ddlrecordversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddlrecordversion` (
  `recordVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `recordSetId` bigint(20) DEFAULT NULL,
  `recordId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `displayIndex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`recordVersionId`),
  UNIQUE KEY `IX_C79E347` (`recordId`,`version`),
  KEY `IX_2F4DDFE1` (`recordId`),
  KEY `IX_762ADC7` (`recordId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddlrecordversion`
--

LOCK TABLES `ddlrecordversion` WRITE;
/*!40000 ALTER TABLE `ddlrecordversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ddlrecordversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddmcontent`
--

DROP TABLE IF EXISTS `ddmcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddmcontent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `contentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `xml` longtext,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `IX_EB9BDE28` (`uuid_`,`groupId`),
  KEY `IX_E3BAF436` (`companyId`),
  KEY `IX_50BF1038` (`groupId`),
  KEY `IX_AE4B50C2` (`uuid_`),
  KEY `IX_3A9C0626` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddmcontent`
--

LOCK TABLES `ddmcontent` WRITE;
/*!40000 ALTER TABLE `ddmcontent` DISABLE KEYS */;
INSERT INTO `ddmcontent` VALUES ('16864135-21f0-4f7e-ad62-171c1fea8da7',24919,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[64]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[64]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('627004a6-86df-4962-9302-6284ff9a83f8',24931,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 85]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[320]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 85]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[400]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('cc737075-e134-435e-b07e-3c05967d7b6f',24937,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[197]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[203]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('b937e5c0-f07b-4472-aeb5-fb182ec49726',24942,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[225]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[225]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('40a958e0-35d7-4334-9111-659bd97708ba',24946,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[132]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[171]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('049d0dd6-b88c-4b15-b13a-858772439ad2',24955,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[201]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[150]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('08af7f5f-2a08-489e-ad17-eb5d8c6ee118',24960,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[900]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[350]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>');
/*!40000 ALTER TABLE `ddmcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddmstoragelink`
--

DROP TABLE IF EXISTS `ddmstoragelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddmstoragelink` (
  `uuid_` varchar(75) DEFAULT NULL,
  `storageLinkId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`storageLinkId`),
  UNIQUE KEY `IX_702D1AD5` (`classPK`),
  KEY `IX_81776090` (`structureId`),
  KEY `IX_32A18526` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddmstoragelink`
--

LOCK TABLES `ddmstoragelink` WRITE;
/*!40000 ALTER TABLE `ddmstoragelink` DISABLE KEYS */;
INSERT INTO `ddmstoragelink` VALUES ('eab811df-cf62-4fbe-a26d-4567e08d6d4d',24925,20100,24919,20315),('c0174a19-d141-49c8-8bc2-fd961e265935',24932,20100,24931,20315),('87fbda2c-056b-4144-bf58-dae00dc4c494',24938,20100,24937,20315),('1f72b444-4a1a-4270-89f3-bfd343f57646',24943,20100,24942,20315),('cee2a624-ba9b-46ff-a3e6-f3404d273af4',24947,20100,24946,20315),('26fd783c-0fb6-429e-ae53-ff3b69395740',24956,20100,24955,20315),('a5f3bc81-7a83-4281-ab51-1f1ca995094f',24961,20100,24960,20315);
/*!40000 ALTER TABLE `ddmstoragelink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddmstructure`
--

DROP TABLE IF EXISTS `ddmstructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddmstructure` (
  `uuid_` varchar(75) DEFAULT NULL,
  `structureId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentStructureId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `structureKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `xsd` longtext,
  `storageType` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  PRIMARY KEY (`structureId`),
  UNIQUE KEY `IX_C8785130` (`groupId`,`classNameId`,`structureKey`),
  UNIQUE KEY `IX_85C7EBE2` (`uuid_`,`groupId`),
  KEY `IX_31817A62` (`classNameId`),
  KEY `IX_4FBAC092` (`companyId`,`classNameId`),
  KEY `IX_C8419FBE` (`groupId`),
  KEY `IX_B6ED5E50` (`groupId`,`classNameId`),
  KEY `IX_43395316` (`groupId`,`parentStructureId`),
  KEY `IX_657899A8` (`parentStructureId`),
  KEY `IX_20FDE04C` (`structureKey`),
  KEY `IX_E61809C8` (`uuid_`),
  KEY `IX_F9FB8D60` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddmstructure`
--

LOCK TABLES `ddmstructure` WRITE;
/*!40000 ALTER TABLE `ddmstructure` DISABLE KEYS */;
INSERT INTO `ddmstructure` VALUES ('a1a2cdd5-c477-40e9-835c-2f1e64d633f1',20303,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'LEARNING MODULE METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Learning Module Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Learning Module Metadata</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select2235\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"home_edition\" type=\"option\" value=\"HE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Home Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"business_edition\" type=\"option\" value=\"BE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Business Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"enterprise_edition\" type=\"option\" value=\"EE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Enterprise Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Product]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select3212\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"1_0\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"2_0\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"3_0\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Version]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select4115\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"administration\" type=\"option\" value=\"admin\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Administration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"installation\" type=\"option\" value=\"install\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Installation]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"configuration\" type=\"option\" value=\"config\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Configuration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Topics]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select5069\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"beginner\" type=\"option\" value=\"beginner\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Beginner]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"intermediate\" type=\"option\" value=\"intermediate\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Intermediate]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"advanced\" type=\"option\" value=\"advanced\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Advanced]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Level]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('c622f97e-f6d0-48ae-8663-082e151a5df6',20304,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'MARKETING CAMPAIGN THEME METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Campaign Theme Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Campaign Theme Metadata</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select2305\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"strong_company\" type=\"option\" value=\"strong\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Strong Company]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"new_product_launch\" type=\"option\" value=\"product\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[New Product Launch]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"company_philosophy\" type=\"option\" value=\"philosophy\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Company Philosophy]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Select]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select3229\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"your_trusted_advisor\" type=\"option\" value=\"advisor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Your Trusted Advisor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"10_years_of_customer_solutions\" type=\"option\" value=\"solutions\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[10 Years of Customer Solutions]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"making_a_difference\" type=\"option\" value=\"difference\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Making a Difference]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Campaign Theme]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select4282\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"awareness\" type=\"option\" value=\"awareness\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Awareness]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"lead_generation\" type=\"option\" value=\"leads\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Lead Generation]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"customer_service\" type=\"option\" value=\"service\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Customer Service]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Business Goal]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('ce84ae2f-abaa-4f17-9180-914ea529ae35',20305,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'MEETING METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Meeting Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Metadata for meeting</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date3054\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2217\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text4569\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Time]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text5638\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea6584\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea7502\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Participants]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('87844065-c353-4e9c-ac8a-386e89724e10',20307,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'AUTO_E6CE2F36-BD9C-4095-924F-1F2741E38705','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contract</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date18949\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Effective Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date20127\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Expiration Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select10264\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"nda\" type=\"option\" value=\"NDA\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[NDA]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"msa\" type=\"option\" value=\"MSA\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[MSA]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"license_agreement\" type=\"option\" value=\"License\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[License Agreement]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Contract Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select4893\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"draft\" type=\"option\" value=\"Draft\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Draft]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"in_review\" type=\"option\" value=\"Review\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[In Review]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"suspended\" type=\"option\" value=\"Suspended\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Suspended]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"signed\" type=\"option\" value=\"Signed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Signed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text14822\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Legal Reviewer]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text17700\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Signing Authority]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2087\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Deal Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('f1b9e7f8-b313-470b-8b6d-0610e437aa0b',20309,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'AUTO_6A314A20-23BD-4991-BBDB-4DA65A82F313','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Banner</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"radio5547\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"radio\">\n		<dynamic-element name=\"yes\" type=\"option\" value=\"yes\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Yes]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"no\" type=\"option\" value=\"no\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[No]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Needs Legal Review]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2033\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Banner Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea2873\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('44a393f1-1a6f-4fb5-a459-d82b3bbe1878',20311,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'AUTO_56FEAAE9-1048-4950-90ED-0E74EC9F2CC9','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Online Training</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2082\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Lesson Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2979\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Author]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('d1bc4713-63de-4bd9-9d19-58e69c793934',20313,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34',0,20091,'AUTO_EF5F066A-556B-4C4F-817B-E671A961B82B','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Sales Presentation</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select2890\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"home_edition\" type=\"option\" value=\"HE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Home Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"business_edition\" type=\"option\" value=\"BE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Business Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"enterprise_edition\" type=\"option\" value=\"EE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Enterprise Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Product]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select3864\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"1_0\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"2_0\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"3_0\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Version]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select4831\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"website\" type=\"option\" value=\"website\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Website]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"collaboration\" type=\"option\" value=\"collaboration\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Collaboration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"intranet\" type=\"option\" value=\"intranet\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Intranet]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Areas of Interest]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select5929\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"acme\" type=\"option\" value=\"acme\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[ACME]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"sevencogs\" type=\"option\" value=\"sevencogs\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[SevenCogs]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"freeplus\" type=\"option\" value=\"freeplus\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[FreePlus]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Competitors]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text1993\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Prospect Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('b2953b71-f392-4951-b328-677c37911eea',20315,20195,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',0,20314,'TIKARAWMETADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">TIKARAWMETADATA</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">TIKARAWMETADATA</Description></root>','<root available-locales=\"en_US\" default-locale=\"en_US\"><dynamic-element dataType=\"string\" name=\"ClimateForcast_PROGRAM_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.PROGRAM_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_COMMAND_LINE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.COMMAND_LINE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_HISTORY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.HISTORY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_TABLE_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.TABLE_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_INSTITUTION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.INSTITUTION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_SOURCE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.SOURCE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_CONTACT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.CONTACT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_PROJECT_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.PROJECT_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_CONVENTIONS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.CONVENTIONS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_REFERENCES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.REFERENCES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_ACKNOWLEDGEMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.ACKNOWLEDGEMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_REALIZATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.REALIZATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_EXPERIMENT_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.EXPERIMENT_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_COMMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.COMMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_MODEL_NAME_ENGLISH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.MODEL_NAME_ENGLISH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_LICENSE_URL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.LICENSE_URL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_LICENSE_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.LICENSE_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_WORK_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.WORK_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_NAMESPACE_URI_DC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.NAMESPACE_URI_DC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_NAMESPACE_URI_DC_TERMS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.NAMESPACE_URI_DC_TERMS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PREFIX_DC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PREFIX_DC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PREFIX_DC_TERMS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PREFIX_DC_TERMS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_FORMAT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.FORMAT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_IDENTIFIER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.IDENTIFIER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_MODIFIED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.MODIFIED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CONTRIBUTOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CONTRIBUTOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_COVERAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.COVERAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CREATOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CREATOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CREATED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CREATED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_DESCRIPTION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.DESCRIPTION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_LANGUAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.LANGUAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PUBLISHER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PUBLISHER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_RELATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.RELATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_RIGHTS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.RIGHTS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_SOURCE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.SOURCE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_SUBJECT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.SUBJECT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_TITLE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.TITLE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_LATITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.LATITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_LONGITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.LONGITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_ALTITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.ALTITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_ENCODING\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_ENCODING]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LANGUAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LANGUAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_DISPOSITION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_DISPOSITION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_MD5\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_MD5]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_LAST_MODIFIED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.LAST_MODIFIED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_RECIPIENT_ADDRESS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_RECIPIENT_ADDRESS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_FROM\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_FROM]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_TO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_TO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_CC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_CC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_BCC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_BCC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_KEYWORDS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.KEYWORDS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_COMMENTS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.COMMENTS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_AUTHOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_AUTHOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_AUTHOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.AUTHOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_APPLICATION_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.APPLICATION_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_REVISION_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.REVISION_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TEMPLATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TEMPLATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TOTAL_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TOTAL_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PRESENTATION_FORMAT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PRESENTATION_FORMAT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_NOTES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.NOTES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_MANAGER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.MANAGER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_APPLICATION_VERSION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.APPLICATION_VERSION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_VERSION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.VERSION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CONTENT_STATUS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CONTENT_STATUS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CATEGORY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CATEGORY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_COMPANY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.COMPANY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_SECURITY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.SECURITY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_SLIDE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.SLIDE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PAGE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PAGE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PARAGRAPH_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PARAGRAPH_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LINE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LINE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_WORD_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.WORD_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CHARACTER_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CHARACTER_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CHARACTER_COUNT_WITH_SPACES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CHARACTER_COUNT_WITH_SPACES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TABLE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TABLE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_IMAGE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.IMAGE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_OBJECT_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.OBJECT_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_EDIT_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.EDIT_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CREATION_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CREATION_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_SAVED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_SAVED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_PRINTED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_PRINTED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_USER_DEFINED_METADATA_NAME_PREFIX\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.USER_DEFINED_METADATA_NAME_PREFIX]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_BITS_PER_SAMPLE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.BITS_PER_SAMPLE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_IMAGE_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.IMAGE_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_IMAGE_WIDTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.IMAGE_WIDTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_SAMPLES_PER_PIXEL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.SAMPLES_PER_PIXEL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_FLASH_FIRED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.FLASH_FIRED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EXPOSURE_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EXPOSURE_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_F_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.F_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_FOCAL_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.FOCAL_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ISO_SPEED_RATINGS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ISO_SPEED_RATINGS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EQUIPMENT_MAKE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EQUIPMENT_MAKE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EQUIPMENT_MODEL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EQUIPMENT_MODEL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_SOFTWARE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.SOFTWARE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ORIENTATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ORIENTATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_HORIZONTAL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_HORIZONTAL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_VERTICAL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_VERTICAL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_UNIT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_UNIT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ORIGINAL_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ORIGINAL_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_RESOURCE_NAME_KEY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.RESOURCE_NAME_KEY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_PROTECTED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.PROTECTED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_EMBEDDED_RELATIONSHIP_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.EMBEDDED_RELATIONSHIP_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMimeKeys_TIKA_MIME_FILE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMimeKeys.TIKA_MIME_FILE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMimeKeys_MIME_TYPE_MAGIC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMimeKeys.MIME_TYPE_MAGIC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_DURATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.DURATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ABS_PEAK_AUDIO_FILE_PATH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ABS_PEAK_AUDIO_FILE_PATH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ALBUM\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ALBUM]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ALT_TAPE_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ALT_TAPE_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ARTIST\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ARTIST]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_SAMPLE_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_SAMPLE_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_SAMPLE_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_SAMPLE_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_CHANNEL_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_CHANNEL_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_COMPRESSOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_COMPRESSOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_COMPOSER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.COMPOSER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_COPYRIGHT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.COPYRIGHT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ENGINEER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ENGINEER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_FILE_DATA_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.FILE_DATA_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_GENRE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.GENRE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_INSTRUMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.INSTRUMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_KEY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.KEY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_LOG_COMMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.LOG_COMMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_LOOP\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.LOOP]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_NUMBER_OF_BEATS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.NUMBER_OF_BEATS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_METADATA_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.METADATA_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_PULL_DOWN\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.PULL_DOWN]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_RELATIVE_PEAK_AUDIO_FILE_PATH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.RELATIVE_PEAK_AUDIO_FILE_PATH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_RELEASE_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.RELEASE_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SCALE_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SCALE_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SCENE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SCENE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SPEAKER_PLACEMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SPEAKER_PLACEMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_STRETCH_MODE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.STRETCH_MODE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TAPE_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TAPE_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TEMPO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TEMPO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TIME_SIGNATURE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TIME_SIGNATURE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TRACK_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TRACK_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_ALPHA_MODE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_ALPHA_MODE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_ALPHA_UNITY_IS_TRANSPARENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_ALPHA_UNITY_IS_TRANSPARENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_COLOR_SPACE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_COLOR_SPACE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_COMPRESSOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_COMPRESSOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_FIELD_ORDER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_FIELD_ORDER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_FRAME_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_FRAME_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_PIXEL_DEPTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_PIXEL_DEPTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_PIXEL_ASPECT_RATIO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_PIXEL_ASPECT_RATIO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element></root>','xml',0),('70ba07f5-dd65-479f-be87-4bf25bc1389f',20412,20182,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',0,20098,'CONTACTS','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contacts</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contacts</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"company\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Company]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"email\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Email]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"firstName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[First Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"imService\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"aol\" type=\"option\" value=\"aol\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[AOL]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"yahoo\" type=\"option\" value=\"yahoo\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Yahoo]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"gtalk\" type=\"option\" value=\"gtalk\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[GTalk]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Instant Messenger Service]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"gtalk\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"imUserName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Instant Messenger]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"jobTitle\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Job Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"lastName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Last Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"notes\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Notes]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"phoneMobile\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Phone (Mobile)]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"phoneOffice\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Phone (Office)]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('9babf709-4e2d-43a7-a7fb-1fdb5ae9b83e',20413,20182,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',0,20098,'EVENTS','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Events</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Events</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"cost\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Cost]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"eventDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"eventName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Event Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"eventTime\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Time]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"location\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('d968d929-abc3-4ffa-8752-2181c5f54778',20414,20182,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',0,20098,'INVENTORY','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Inventory</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Inventory</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"item\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Item]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"location\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"purchaseDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Purchase Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"purchasePrice\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Purchase Price]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"quantity\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Quantity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('6d6374e2-ab50-45a0-9599-f2a50d616ded',20415,20182,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',0,20098,'ISSUES TRACKING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Issues Tracking</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Issue Tracking</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"assignedTo\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Assigned To]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"comments\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Comments]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"dueDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Due Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"issueId\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Issue ID]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"severity\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"critical\" type=\"option\" value=\"critical\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Critical]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"major\" type=\"option\" value=\"major\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Major]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"minor\" type=\"option\" value=\"minor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Minor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"trivial\" type=\"option\" value=\"trivial\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Trivial]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Severity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"minor\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"status\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"open\" type=\"option\" value=\"open\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Open]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"pending\" type=\"option\" value=\"pending\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Pending]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"completed\" type=\"option\" value=\"completed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Completed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"open\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('7a941cb0-bdf7-4cb8-8e70-19adceac88c0',20416,20182,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',0,20098,'MEETING MINUTES','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Meeting Minutes</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Meeting Minutes</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"author\" required=\"false\" showLabel=\"true\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Author]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"duration\" required=\"false\" showLabel=\"true\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Duration]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"meetingDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"minutes\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Minutes]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('7cf5c53f-b737-4f0f-889e-d7dcff857649',20417,20182,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',0,20098,'TO DO','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">To Do</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">To Do</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"assignedTo\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Assigned To]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"comments\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Comments]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"endDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[End Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"integer\" fieldNamespace=\"ddm\" name=\"percentComplete\" required=\"false\" showLabel=\"true\" type=\"ddm-integer\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[% Complete]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"severity\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"critical\" type=\"option\" value=\"critical\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Critical]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"major\" type=\"option\" value=\"major\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Major]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"minor\" type=\"option\" value=\"minor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Minor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"trivial\" type=\"option\" value=\"trivial\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Trivial]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Severity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"minor\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"startDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Start Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"status\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"open\" type=\"option\" value=\"open\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Open]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"pending\" type=\"option\" value=\"pending\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Pending]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"completed\" type=\"option\" value=\"completed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Completed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"open\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('6cd3e422-ccbe-4d64-8fa6-214ddde8361a',24927,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,20109,'TEXT-LINK-IMAGE-SLIDER-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">text-link-image-slider - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, the duration between each slide transition defaule value is 3000]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[600]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, duration of time slide transitions will occupy defaule value is 500]]></entry>\n			<entry name=\"label\"><![CDATA[Slideshow Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[500]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Auto Show Loading]]></entry>\n			<entry name=\"label\"><![CDATA[Auto Show]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"item-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Box-model width of individual carousel items, including horizontal borders and padding.]]></entry>\n			<entry name=\"label\"><![CDATA[Item Width]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"max-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Maxmimum number of carousel items that should be visible. Items will resize fluidly when above this limit.]]></entry>\n			<entry name=\"label\"><![CDATA[Max Items]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"moved-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Number of carousel items that should move on animation. If 0, slider will move all visible items.]]></entry>\n			<entry name=\"label\"><![CDATA[Move]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Create navigation for previous next navigation ]]></entry>\n			<entry name=\"label\"><![CDATA[Next Prev controls]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pagination Note: Leave true for manualControls usage ]]></entry>\n			<entry name=\"label\"><![CDATA[Pagination]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Should the animation loop? If false, directionNav will received \"disable\" classes at either end ]]></entry>\n			<entry name=\"label\"><![CDATA[Loop]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering]]></entry>\n			<entry name=\"label\"><![CDATA[Pause On Hover]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"slide\" value=\"slide\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Slide]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"fade\" value=\"fade\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Fade]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select your animation type, \"fade\" or \"slide\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"horizontal\" value=\"horizontal\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Horizontal]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"vertical\" value=\"vertical\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Vertical]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select the sliding direction, \"horizontal\" or \"vertical\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Selector: Declare custom control navigation. Examples would be \".flex-control-nav li\" or \"#tabs-nav li img\", etc. The number of elements in your controlNav should match the number of slides or tabs.]]></entry>\n			<entry name=\"label\"><![CDATA[Manual Controls Selector]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"description\" dataType=\"html\" fieldNamespace=\"ddm\" type=\"ddm-text-html\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Text]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\" repeatable=\"false\">\n			<dynamic-element name=\"image-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n				<meta-data locale=\"en_US\">\n					<entry name=\"tip\"><![CDATA[Integer: Image width en pixel (don\'t put px)]]></entry>\n					<entry name=\"label\"><![CDATA[Image Width]]></entry>\n					<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				</meta-data>\n			</dynamic-element>\n			<dynamic-element name=\"image-height\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n				<meta-data locale=\"en_US\">\n					<entry name=\"tip\"><![CDATA[Integer: Image Height en pixel (don\'t put px)]]></entry>\n					<entry name=\"label\"><![CDATA[Image Height]]></entry>\n					<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				</meta-data>\n			</dynamic-element>\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Image]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[Page opened on clicking the image for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Image Link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"button-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Button Link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"button-caption\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Button Caption]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[slides]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('5da0047a-f6de-45ed-9859-d981f09a2b06',24963,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,20109,'FEATURES-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">features - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"feature\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Theme Feature]]></entry>\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[An abstract of the feature to be shown before readmore link]]></entry>\n			<entry name=\"label\"><![CDATA[Abstract]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"icone\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select an expressive icone to be shown with the title]]></entry>\n			<entry name=\"label\"><![CDATA[Icone]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"feature-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[The link to the full article describing the feature for external links add // before your link]]></entry>\n			<entry name=\"label\"><![CDATA[Link to the Feature]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('18f5bf68-ded7-4315-adfb-e92e807b3464',24996,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,20109,'FOOTER-LINKS-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Footer Links - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"title\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Footer Link Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"footer-links\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Url]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Link Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('25ef1421-6f67-47c5-8cbb-cad74cfa21b9',25008,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,20109,'PORTFOLIO-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">portfolio - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"portofolio-title\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Portofolio Title]]></entry>\n			<entry name=\"label\"><![CDATA[Section Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"portofolio-description\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Portofolio Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n			<dynamic-element name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n				<meta-data locale=\"en_US\">\n					<entry name=\"tip\"><![CDATA[]]></entry>\n					<entry name=\"label\"><![CDATA[Image Source]]></entry>\n					<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				</meta-data>\n			</dynamic-element>\n			<dynamic-element name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n				<meta-data locale=\"en_US\">\n					<entry name=\"tip\"><![CDATA[]]></entry>\n					<entry name=\"label\"><![CDATA[Image Name]]></entry>\n					<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				</meta-data>\n			</dynamic-element>\n			<dynamic-element name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n				<meta-data locale=\"en_US\">\n					<entry name=\"tip\"><![CDATA[for external links add // before your link]]></entry>\n					<entry name=\"label\"><![CDATA[Link]]></entry>\n					<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				</meta-data>\n			</dynamic-element>\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Images]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Section]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('05daf237-f491-41b6-8ef2-46ce4eaccf9a',25019,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,20109,'MINI-PORTOFOLIO-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">mini-portofolio - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, the duration between each slide transition defaule value is 3000]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[600]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, duration of time slide transitions will occupy defaule value is 500]]></entry>\n			<entry name=\"label\"><![CDATA[Slideshow Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[500]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Auto Show Loading]]></entry>\n			<entry name=\"label\"><![CDATA[Auto Show]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"item-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Box-model width of individual carousel items, including horizontal borders and padding.]]></entry>\n			<entry name=\"label\"><![CDATA[Item Width]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"max-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Maxmimum number of carousel items that should be visible. Items will resize fluidly when above this limit.]]></entry>\n			<entry name=\"label\"><![CDATA[Max Items]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"moved-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Number of carousel items that should move on animation. If 0, slider will move all visible items.]]></entry>\n			<entry name=\"label\"><![CDATA[Move]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Create navigation for previous next navigation ]]></entry>\n			<entry name=\"label\"><![CDATA[Next Prev controls]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pagination Note: Leave true for manualControls usage ]]></entry>\n			<entry name=\"label\"><![CDATA[Pagination]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Should the animation loop? If false, directionNav will received \"disable\" classes at either end ]]></entry>\n			<entry name=\"label\"><![CDATA[Loop]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering]]></entry>\n			<entry name=\"label\"><![CDATA[Pause On Hover]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"slide\" value=\"slide\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Slide]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"fade\" value=\"fade\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Fade]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select your animation type, \"fade\" or \"slide\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"horizontal\" value=\"horizontal\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Horizontal]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"vertical\" value=\"vertical\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Vertical]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select the sliding direction, \"horizontal\" or \"vertical\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Selector: Declare custom control navigation. Examples would be \".flex-control-nav li\" or \"#tabs-nav li img\", etc. The number of elements in your controlNav should match the number of slides or tabs.]]></entry>\n			<entry name=\"label\"><![CDATA[Manual Controls Selector]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"section-title\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[The title that its desplayed on the header of section]]></entry>\n			<entry name=\"label\"><![CDATA[Section Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"section-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Section Link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Sub Sections]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Image source]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[Page opened on clicking the image for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Image Link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Title Text]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Title Link for external links add // before your link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Description]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[slides]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('b3812589-d62e-426d-af79-d70ea9a8acfc',25030,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,20109,'CAROUSEL-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">carousel - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, the duration between each slide transition defaule value is 3000]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[600]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, duration of time slide transitions will occupy defaule value is 500]]></entry>\n			<entry name=\"label\"><![CDATA[Slideshow Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[500]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Auto Show Loading]]></entry>\n			<entry name=\"label\"><![CDATA[Auto Show]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"item-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Box-model width of individual carousel items, including horizontal borders and padding.]]></entry>\n			<entry name=\"label\"><![CDATA[Item Width]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"max-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Maxmimum number of carousel items that should be visible. Items will resize fluidly when above this limit.]]></entry>\n			<entry name=\"label\"><![CDATA[Max Items]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"moved-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Number of carousel items that should move on animation. If 0, slider will move all visible items.]]></entry>\n			<entry name=\"label\"><![CDATA[Move]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Create navigation for previous next navigation ]]></entry>\n			<entry name=\"label\"><![CDATA[Next Prev controls]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pagination Note: Leave true for manualControls usage ]]></entry>\n			<entry name=\"label\"><![CDATA[Pagination]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Should the animation loop? If false, directionNav will received \"disable\" classes at either end ]]></entry>\n			<entry name=\"label\"><![CDATA[Loop]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering]]></entry>\n			<entry name=\"label\"><![CDATA[Pause On Hover]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"slide\" value=\"slide\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Slide]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"fade\" value=\"fade\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Fade]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select your animation type, \"fade\" or \"slide\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"horizontal\" value=\"horizontal\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Horizontal]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"vertical\" value=\"vertical\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Vertical]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select the sliding direction, \"horizontal\" or \"vertical\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Selector: Declare custom control navigation. Examples would be \".flex-control-nav li\" or \"#tabs-nav li img\", etc. The number of elements in your controlNav should match the number of slides or tabs.]]></entry>\n			<entry name=\"label\"><![CDATA[Manual Controls Selector]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"pager-abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[Abstract Text that will be shown on the pager]]></entry>\n				<entry name=\"label\"><![CDATA[Text]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\" repeatable=\"false\">\n			<dynamic-element name=\"image-height\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n				<meta-data locale=\"en_US\">\n					<entry name=\"tip\"><![CDATA[Integer: Image Height in pixel (don\'t put px)]]></entry>\n					<entry name=\"label\"><![CDATA[Image Height]]></entry>\n					<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				</meta-data>\n			</dynamic-element>\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Image]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[Page opened on clicking the image for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Image Link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[slide]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('9df18d27-3d7d-48c2-b937-328d3aaa9950',25041,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,20109,'TESTIMONIALS-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">testimonials - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, the duration between each slide transition defaule value is 3000]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[600]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, duration of time slide transitions will occupy defaule value is 500]]></entry>\n			<entry name=\"label\"><![CDATA[Slideshow Speed]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[500]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Auto Show Loading]]></entry>\n			<entry name=\"label\"><![CDATA[Auto Show]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"item-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Box-model width of individual carousel items, including horizontal borders and padding.]]></entry>\n			<entry name=\"label\"><![CDATA[Item Width]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"max-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Maxmimum number of carousel items that should be visible. Items will resize fluidly when above this limit.]]></entry>\n			<entry name=\"label\"><![CDATA[Max Items]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"moved-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Integer: Number of carousel items that should move on animation. If 0, slider will move all visible items.]]></entry>\n			<entry name=\"label\"><![CDATA[Move]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Create navigation for previous next navigation ]]></entry>\n			<entry name=\"label\"><![CDATA[Next Prev controls]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pagination Note: Leave true for manualControls usage ]]></entry>\n			<entry name=\"label\"><![CDATA[Pagination]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Should the animation loop? If false, directionNav will received \"disable\" classes at either end ]]></entry>\n			<entry name=\"label\"><![CDATA[Loop]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Boolean: Pause the slideshow when hovering over slider, then resume when no longer hovering]]></entry>\n			<entry name=\"label\"><![CDATA[Pause On Hover]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"slide\" value=\"slide\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Slide]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"fade\" value=\"fade\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Fade]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select your animation type, \"fade\" or \"slide\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\" repeatable=\"false\">\n		<dynamic-element name=\"horizontal\" value=\"horizontal\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Horizontal]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"vertical\" value=\"vertical\" type=\"option\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"> <![CDATA[Vertical]]> </entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Select the sliding direction, \"horizontal\" or \"vertical\"]]></entry>\n			<entry name=\"label\"><![CDATA[Animation Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Selector: Declare custom control navigation. Examples would be \".flex-control-nav li\" or \"#tabs-nav li img\", etc. The number of elements in your controlNav should match the number of slides or tabs.]]></entry>\n			<entry name=\"label\"><![CDATA[Manual Controls Selector]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"section-title\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[In ms, the duration between each slide transition defaule value is 3000]]></entry>\n			<entry name=\"label\"><![CDATA[Section Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"section-description\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Section Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Image source]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"author-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Author Name]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"site\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Site Title]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"site-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[for external links add // before your link]]></entry>\n				<entry name=\"label\"><![CDATA[Site Link]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"description\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Description]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[slides]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('d38b942f-4569-4db5-a8c7-052d3a8f8ebd',25052,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,20109,'FOOTER-SOCIAL-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Footer Social - 6.2.0.0</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"title\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"tagline\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Tagline]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"facebook\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show Facebook Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[Facebook]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"fb-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"google-plus\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show Google plus Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[Google-plus]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"gp-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"twitter\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show Twitter Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[Twitter]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"tw-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"linkedin\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show Linkedin Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[Linkedin]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"li-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"rss\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show Rss Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[Rss]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"rs-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"youtube\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show youtube Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[youtube]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"yu-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"vimeo\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[Show vimeo Social icone]]></entry>\n			<entry name=\"label\"><![CDATA[vimeo]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"vi-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Url]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element name=\"social-links\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"true\">\n		<dynamic-element name=\"icon\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[icon]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\" repeatable=\"false\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"tip\"><![CDATA[]]></entry>\n				<entry name=\"label\"><![CDATA[Url]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"tip\"><![CDATA[]]></entry>\n			<entry name=\"label\"><![CDATA[Social Link]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0);
/*!40000 ALTER TABLE `ddmstructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddmstructurelink`
--

DROP TABLE IF EXISTS `ddmstructurelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddmstructurelink` (
  `structureLinkId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`structureLinkId`),
  UNIQUE KEY `IX_C803899D` (`classPK`),
  KEY `IX_D43E4208` (`classNameId`),
  KEY `IX_17692B58` (`structureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddmstructurelink`
--

LOCK TABLES `ddmstructurelink` WRITE;
/*!40000 ALTER TABLE `ddmstructurelink` DISABLE KEYS */;
INSERT INTO `ddmstructurelink` VALUES (24926,20091,24907,20315),(24933,20091,24930,20315),(24939,20091,24936,20315),(24944,20091,24940,20315),(24948,20091,24945,20315),(24957,20091,24954,20315),(24962,20091,24958,20315);
/*!40000 ALTER TABLE `ddmstructurelink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ddmtemplate`
--

DROP TABLE IF EXISTS `ddmtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ddmtemplate` (
  `uuid_` varchar(75) DEFAULT NULL,
  `templateId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `templateKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `mode_` varchar(75) DEFAULT NULL,
  `language` varchar(75) DEFAULT NULL,
  `script` longtext,
  `cacheable` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`templateId`),
  UNIQUE KEY `IX_E6DFAB84` (`groupId`,`classNameId`,`templateKey`),
  UNIQUE KEY `IX_1AA75CE3` (`uuid_`,`groupId`),
  KEY `IX_B6356F93` (`classNameId`,`classPK`,`type_`),
  KEY `IX_32F83D16` (`classPK`),
  KEY `IX_DB24DDDD` (`groupId`),
  KEY `IX_BD9A4A91` (`groupId`,`classNameId`),
  KEY `IX_824ADC72` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_90800923` (`groupId`,`classNameId`,`classPK`,`type_`),
  KEY `IX_F0C3449` (`groupId`,`classNameId`,`classPK`,`type_`,`mode_`),
  KEY `IX_B1C33EA6` (`groupId`,`classPK`),
  KEY `IX_33BEF579` (`language`),
  KEY `IX_127A35B0` (`smallImageId`),
  KEY `IX_CAE41A28` (`templateKey`),
  KEY `IX_C4F283C8` (`type_`),
  KEY `IX_F2A243A7` (`uuid_`),
  KEY `IX_D4C2C221` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ddmtemplate`
--

LOCK TABLES `ddmtemplate` WRITE;
/*!40000 ALTER TABLE `ddmtemplate` DISABLE KEYS */;
INSERT INTO `ddmtemplate` VALUES ('dbe33137-fbb8-4e90-b4c8-5d76126ba70a',20418,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20016,0,'WIKI-SOCIAL-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Social</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays social bookmarks and ratings for wiki pages and their child pages.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#assign wikiPageClassName = \"com.liferay.portlet.wiki.model.WikiPage\" />\n\n<#assign assetRenderer = assetEntry.getAssetRenderer() />\n\n<div class=\"taglib-header\">\n	<h1 class=\"header-title\">${entry.getTitle()}</h1>\n</div>\n\n<div style=\"float: right;\">\n	<@getEditIcon />\n\n	<@getPageDetailsIcon />\n\n	<@getPrintIcon />\n</div>\n\n<div class=\"wiki-body\">\n	<div class=\"wiki-info\">\n		<span class=\"stats\">${assetEntry.getViewCount()} <@liferay.language key=\"views\" /></span> |\n\n		<span class=\"date\"><@liferay.language key=\"last-modified\" /> ${dateUtil.getDate(entry.getModifiedDate(), \"dd MMM yyyy - HH:mm:ss\", locale)}</span>\n\n		<span class=\"author\"><@liferay.language key=\"by\" /> ${htmlUtil.escape(portalUtil.getUserName(entry.getUserId(), entry.getUserName()))}</span>\n	</div>\n\n	<div class=\"wiki-content\">\n		<@liferay_ui[\"social-bookmarks\"]\n			displayStyle=\"normal\"\n			target=\"_blank\"\n			title=entry.getTitle()\n			url=viewURL\n		/>\n\n		${formattedContent}\n	</div>\n\n	<div class=\"page-actions\">\n		<div class=\"article-actions\">\n			<@getAddChildPageIcon />\n\n			<@getAttatchmentsIcon />\n		</div>\n	</div>\n\n	 <br />\n\n	<@getRatings cssClass=\"page-ratings\" entry=entry />\n\n	<@getRelatedAssets />\n</div>\n\n<div class=\"page-categorization\">\n	<div class=\"page-categories\">\n		<#assign viewCategorizedPagesURL = renderResponse.createRenderURL() />\n\n		${viewCategorizedPagesURL.setParameter(\"struts_action\", \"/wiki/view_categorized_pages\")}\n		${viewCategorizedPagesURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n\n		<@liferay_ui[\"asset-categories-summary\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			portletURL=viewCategorizedPagesURL\n		/>\n	</div>\n\n	<div class=\"page-tags\">\n		<#assign viewTaggedPagesURL = renderResponse.createRenderURL() />\n\n		${viewTaggedPagesURL.setParameter(\"struts_action\", \"/wiki/view_tagged_pages\")}\n		${viewTaggedPagesURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n\n		<@liferay_ui[\"asset-tags-summary\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			portletURL=viewTaggedPagesURL\n		/>\n	</div>\n</div>\n\n<#assign childPages = entry.getChildPages() />\n\n<#if (childPages?has_content)>\n	<div class=\"child-pages\">\n		<h2><@liferay.language key=\"children-pages\" /></h2>\n\n		<table class=\"taglib-search-iterator\">\n			<tr class=\"portlet-section-header results-header\">\n				<th>\n					<@liferay.language key=\"page\" />\n				</th>\n				<th>\n					<@liferay.language key=\"last-modified\" />\n				</th>\n				<th>\n					<@liferay.language key=\"ratings\" />\n				</th>\n			</tr>\n\n			<#list childPages as childPage>\n				<tr class=\"results-row\">\n					<#assign viewPageURL = renderResponse.createRenderURL() />\n\n					${viewPageURL.setParameter(\"struts_action\", \"/wiki/view\")}\n\n					<#assign childNode = childPage.getNode() />\n\n					${viewPageURL.setParameter(\"nodeName\", childNode.getName())}\n					${viewPageURL.setParameter(\"title\", childPage.getTitle())}\n\n					<td>\n						<a href=\"${viewPageURL}\">${childPage.getTitle()}</a>\n					</td>\n					<td>\n						<a href=\"${viewPageURL}\">${dateUtil.getDate(childPage.getModifiedDate(),\"dd MMM yyyy - HH:mm:ss\", locale)} <@liferay.language key=\"by\" /> ${htmlUtil.escape(portalUtil.getUserName(childPage.getUserId(), childPage.getUserName()))}</a>\n					</td>\n					<td>\n						<@getRatings cssClass=\"child-ratings\" entry=childPage />\n					</td>\n				</tr>\n			</#list>\n		</table>\n	</div>\n</#if>\n\n<@getDiscussion />\n\n<#macro getAddChildPageIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign addPageURL = renderResponse.createRenderURL() />\n\n		${addPageURL.setParameter(\"struts_action\", \"/wiki/edit_page\")}\n		${addPageURL.setParameter(\"redirect\", currentURL)}\n		${addPageURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n		${addPageURL.setParameter(\"title\", \"\")}\n		${addPageURL.setParameter(\"editTitle\", \"1\")}\n		${addPageURL.setParameter(\"parentTitle\", entry.getTitle())}\n\n		<@liferay_ui[\"icon\"]\n			image=\"add_article\"\n			label=true\n			message=\"add-child-page\"\n			url=addPageURL?string\n		/>\n	</#if>\n</#macro>\n\n<#macro getAttatchmentsIcon>\n	<#assign viewPageAttachmentsURL = renderResponse.createRenderURL() />\n\n	${viewPageAttachmentsURL.setParameter(\"struts_action\", \"/wiki/view_page_attachments\") }\n\n	<@liferay_ui[\"icon\"]\n		image=\"clip\"\n		label=true\n		message=\'${entry.getAttachmentsFileEntriesCount() + languageUtil.get(locale, \"attachments\")}\'\n		url=viewPageAttachmentsURL?string\n	/>\n</#macro>\n\n<#macro getDiscussion>\n	<#if validator.isNotNull(assetRenderer.getDiscussionPath()) && (enableComments == \"true\")>\n		<br />\n\n		<#assign discussionURL = renderResponse.createActionURL() />\n\n		${discussionURL.setParameter(\"struts_action\", \"/wiki/\" + assetRenderer.getDiscussionPath())}\n\n		<@liferay_ui[\"discussion\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			formAction=discussionURL?string\n			formName=\"fm2\"\n			ratingsEnabled=enableCommentRatings == \"true\"\n			redirect=currentURL\n			subject=assetRenderer.getTitle(locale)\n			userId=assetRenderer.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getEditIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign editPageURL = renderResponse.createRenderURL() />\n\n		${editPageURL.setParameter(\"struts_action\", \"/wiki/edit_page\")}\n		${editPageURL.setParameter(\"redirect\", currentURL)}\n		${editPageURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n		${editPageURL.setParameter(\"title\", entry.getTitle())}\n\n		<@liferay_ui[\"icon\"]\n			image=\"edit\"\n			message=entry.getTitle()\n			url=editPageURL?string\n		/>\n	</#if>\n</#macro>\n\n<#macro getPageDetailsIcon>\n	<#assign viewPageDetailsURL = renderResponse.createRenderURL() />\n\n	${viewPageDetailsURL.setParameter(\"struts_action\", \"/wiki/view_page_details\")}\n	${viewPageDetailsURL.setParameter(\"redirect\", currentURL)}\n\n	<@liferay_ui[\"icon\"]\n		image=\"history\"\n		message=\"details\"\n		url=viewPageDetailsURL?string\n	/>\n</#macro>\n\n<#macro getPrintIcon>\n	<#assign printURL = renderResponse.createRenderURL() />\n\n	${printURL.setParameter(\"viewMode\", \"print\")}\n	${printURL.setWindowState(\"pop_up\")}\n\n	<#assign title = languageUtil.format(locale, \"print-x-x\", [\"hide-accessible\", htmlUtil.escape(assetRenderer.getTitle(locale))]) />\n	<#assign taglibPrintURL = \"javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:\'\" + renderResponse.getNamespace() + \"printAsset\', title: \'\" + title + \"\', uri: \'\" + htmlUtil.escapeURL(printURL.toString()) + \"\'});\" />\n\n	<@liferay_ui[\"icon\"]\n		image=\"print\"\n		message=\"print\"\n		url=taglibPrintURL\n	/>\n</#macro>\n\n<#macro getRatings\n	cssClass\n	entry\n>\n	<#if enablePageRatings == \"true\">\n		<div class=\"${cssClass}\">\n			<@liferay_ui[\"ratings\"]\n				className=wikiPageClassName\n				classPK=entry.getResourcePrimKey()\n			/>\n		</div>\n	</#if>\n</#macro>\n\n<#macro getRelatedAssets>\n	<#if assetEntry?? && (enableRelatedAssets == \"true\")>\n		<@liferay_ui[\"asset-links\"]\n			assetEntryId=assetEntry.getEntryId()\n		/>\n	</#if>\n</#macro>',0,0,20419,''),('5a38cd6f-935c-4ab5-b4c0-eb8f75fb5dff',20420,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20081,0,'ASSET-CATEGORIES-NAVIGATION-MULTI-COLUMN-LAYOUT-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Multi Column Layout</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays a column for each vocabulary. Each column includes the name of a vocabulary with the vocabulary\'s top level categories listed underneath.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n\n<#if entries?has_content>\n	<@aui.layout>\n		<#list entries as entry>\n			<@aui.column columnWidth=25>\n				<div class=\"results-header\">\n					<h3>\n						${entry.getName()}\n					</h3>\n				</div>\n\n				<#assign categories = entry.getCategories()>\n\n				<@displayCategories categories=categories />\n			</@aui.column>\n		</#list>\n	</@aui.layout>\n</#if>\n\n<#macro displayCategories\n	categories\n>\n	<#if categories?has_content>\n		<ul class=\"categories\">\n			<#list categories as category>\n				<li>\n					<#assign categoryURL = renderResponse.createRenderURL()>\n\n					${categoryURL.setParameter(\"resetCur\", \"true\")}\n					${categoryURL.setParameter(\"categoryId\", category.getCategoryId()?string)}\n\n					<a href=\"${categoryURL}\">${category.getName()}</a>\n\n					<#if serviceLocator??>\n						<#assign assetCategoryService = serviceLocator.findService(\"com.liferay.portlet.asset.service.AssetCategoryService\")>\n\n						<#assign childCategories = assetCategoryService.getChildCategories(category.getCategoryId())>\n\n						<@displayCategories categories=childCategories />\n					</#if>\n				</li>\n			</#list>\n		</ul>\n	</#if>\n</#macro>',0,0,20421,''),('38d70acd-10b0-4a1f-a6e0-6c6d28422691',20423,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20422,0,'DOCUMENTLIBRARY-CAROUSEL-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays images in a carousel.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n<#assign liferay_portlet = taglibLiferayHash[\"/WEB-INF/tld/liferay-portlet.tld\"] />\n\n<#if entries?has_content>\n	<style>\n		#<@liferay_portlet.namespace />carousel .carousel-item {\n			background-color: #000;\n			height: 250px;\n			overflow: hidden;\n			text-align: center;\n			width: 700px;\n		}\n\n		#<@liferay_portlet.namespace />carousel .carousel-item img {\n			max-height: 250px;\n			max-width: 700px;\n		}\n	</style>\n\n	<div id=\"<@liferay_portlet.namespace />carousel\">\n		<#assign imageMimeTypes = propsUtil.getArray(\"dl.file.entry.preview.image.mime.types\") />\n\n		<#list entries as entry>\n			<#if imageMimeTypes?seq_contains(entry.getMimeType()) >\n				<div class=\"carousel-item\">\n					<img src=\"${dlUtil.getPreviewURL(entry, entry.getFileVersion(), themeDisplay, \"\")}\" />\n				</div>\n			</#if>\n		</#list>\n	</div>\n\n	<@aui.script use=\"aui-carousel\">\n		new A.Carousel(\n			{\n				contentBox: \'#<@liferay_portlet.namespace />carousel\',\n				height: 250,\n				intervalTime: 2,\n				width: 700\n			}\n		).render();\n	</@aui.script>\n</#if>',0,0,20424,''),('13965f9d-4cfa-4474-991e-9064b68dae03',20425,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20083,0,'ASSET-PUBLISHER-RICH-SUMMARY-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Rich Summary</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays abstracts, icons, related assets, and print/edit actions for assets. Optionally include asset bookmarks and ratings.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#list entries as entry>\n	<#assign entry = entry />\n\n	<#assign assetRenderer = entry.getAssetRenderer() />\n\n	<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />\n\n	<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />\n\n	<#if assetLinkBehavior != \"showFullContent\">\n		<#assign viewURL = assetPublisherHelperImpl.getAssetViewURL(renderRequest, renderResponse, entry, true) />\n	</#if>\n\n	<div class=\"asset-abstract\">\n		<div class=\"lfr-meta-actions asset-actions\">\n			<@getPrintIcon />\n\n			<@getFlagsIcon />\n\n			<@getEditIcon />\n		</div>\n\n		<h3 class=\"asset-title\">\n			<a href=\"${viewURL}\"><img alt=\"\" src=\"${assetRenderer.getIconPath(renderRequest)}\" />${entryTitle}</a>\n		</h3>\n\n		<@getMetadataField fieldName=\"tags\" />\n\n		<@getMetadataField fieldName=\"create-date\" />\n\n		<@getMetadataField fieldName=\"view-count\" />\n\n		<div class=\"asset-content\">\n			<@getSocialBookmarks />\n\n			<div class=\"asset-summary\">\n				<@getMetadataField fieldName=\"author\" />\n\n				${htmlUtil.escape(assetRenderer.getSummary(locale))}\n\n				<a href=\"${viewURL}\"><@liferay.language key=\"read-more\" /><span class=\"hide-accessible\"><@liferay.language key=\"about\" />${entryTitle}</span> &raquo;</a>\n			</div>\n\n			<@getRatings />\n\n			<@getRelatedAssets />\n\n			<@getDiscussion />\n		</div>\n	</div>\n\n</#list>\n\n<#macro getDiscussion>\n	<#if validator.isNotNull(assetRenderer.getDiscussionPath()) && (enableComments == \"true\")>\n		<br />\n\n		<#assign discussionURL = renderResponse.createActionURL() />\n\n		${discussionURL.setParameter(\"struts_action\", \"/asset_publisher/\" + assetRenderer.getDiscussionPath())}\n\n		<@liferay_ui[\"discussion\"]\n			className=entry.getClassName()\n			classPK=entry.getClassPK()\n			formAction=discussionURL?string\n			formName=\"fm\" + entry.getClassPK()\n			ratingsEnabled=enableCommentRatings == \"true\"\n			redirect=portalUtil.getCurrentURL(request)\n			userId=assetRenderer.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getEditIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign redirectURL = renderResponse.createRenderURL() />\n\n		${redirectURL.setParameter(\"struts_action\", \"/asset_publisher/add_asset_redirect\")}\n		${redirectURL.setWindowState(\"pop_up\")}\n\n		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState(\"pop_up\"), redirectURL)!\"\" />\n\n		<#if validator.isNotNull(editPortletURL)>\n			<#assign title = languageUtil.format(locale, \"edit-x\", entryTitle) />\n\n			<@liferay_ui[\"icon\"]\n				image=\"edit\"\n				message=title\n				url=\"javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:\'\" + renderResponse.getNamespace() + \"editAsset\', title: \'\" + title + \"\', uri:\'\" + htmlUtil.escapeURL(editPortletURL.toString()) + \"\'});\"\n			/>\n		</#if>\n	</#if>\n</#macro>\n\n<#macro getFlagsIcon>\n	<#if enableFlags == \"true\">\n		<@liferay_ui[\"flags\"]\n			className=entry.getClassName()\n			classPK=entry.getClassPK()\n			contentTitle=entry.getTitle(locale)\n			label=false\n			reportedUserId=entry.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getMetadataField\n	fieldName\n>\n	<#if stringUtil.split(metadataFields)?seq_contains(fieldName)>\n		<span class=\"metadata-entry metadata-\"${fieldName}\">\n			<#assign dateFormat = \"dd MMM yyyy - HH:mm:ss\" />\n\n			<#if fieldName == \"author\">\n				<@liferay.language key=\"by\" /> ${portalUtil.getUserName(assetRenderer.getUserId(), assetRenderer.getUserName())}\n			<#elseif fieldName == \"categories\">\n				<@liferay_ui[\"asset-categories-summary\"]\n					className=entry.getClassName()\n					classPK=entry.getClassPK()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			<#elseif fieldName == \"create-date\">\n				${dateUtil.getDate(entry.getCreateDate(), dateFormat, locale)}\n			<#elseif fieldName == \"expiration-date\">\n				${dateUtil.getDate(entry.getExpirationDate(), dateFormat, locale)}\n			<#elseif fieldName == \"modified-date\">\n				${dateUtil.getDate(entry.getModifiedDate(), dateFormat, locale)}\n			<#elseif fieldName == \"priority\">\n				${entry.getPriority()}\n			<#elseif fieldName == \"publish-date\">\n				${dateUtil.getDate(entry.getPublishDate(), dateFormat, locale)}\n			<#elseif fieldName == \"tags\">\n				<@liferay_ui[\"asset-tags-summary\"]\n					className=entry.getClassName()\n					classPK=entry.getClassPK()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			<#elseif fieldName == \"view-count\">\n				<@liferay_ui[\"icon\"]\n					image=\"history\"\n				/>\n\n				${entry.getViewCount()} <@liferay.language key=\"views\" />\n			</#if>\n		</span>\n	</#if>\n</#macro>\n\n<#macro getPrintIcon>\n	<#if enablePrint == \"true\" >\n		<#assign printURL = renderResponse.createRenderURL() />\n\n		${printURL.setParameter(\"struts_action\", \"/asset_publisher/view_content\")}\n		${printURL.setParameter(\"assetEntryId\", entry.getEntryId()?string)}\n		${printURL.setParameter(\"viewMode\", \"print\")}\n		${printURL.setParameter(\"type\", entry.getAssetRendererFactory().getType())}\n\n		<#if (validator.isNotNull(assetRenderer.getUrlTitle()))>\n			<#if (assetRenderer.getGroupId() != themeDisplay.getScopeGroupId())>\n				${printURL.setParameter(\"groupId\", assetRenderer.getGroupId()?string)}\n			</#if>\n\n			${printURL.setParameter(\"urlTitle\", assetRenderer.getUrlTitle())}\n		</#if>\n\n		${printURL.setWindowState(\"pop_up\")}\n\n		<@liferay_ui[\"icon\"]\n			image=\"print\"\n			message=\"print\"\n			url=\"javascript:Liferay.Util.openWindow({id:\'\" + renderResponse.getNamespace() + \"printAsset\', title: \'\" + languageUtil.format(locale, \"print-x-x\", [\"hide-accessible\", entryTitle]) + \"\', uri: \'\" + htmlUtil.escapeURL(printURL.toString()) + \"\'});\"\n		/>\n	</#if>\n</#macro>\n\n<#macro getRatings>\n	<#if (enableRatings == \"true\")>\n		<div class=\"asset-ratings\">\n			<@liferay_ui[\"ratings\"]\n				className=entry.getClassName()\n				classPK=entry.getClassPK()\n			/>\n		</div>\n	</#if>\n</#macro>\n\n<#macro getRelatedAssets>\n	<#if enableRelatedAssets == \"true\">\n		<@liferay_ui[\"asset-links\"]\n			assetEntryId=entry.getEntryId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getSocialBookmarks>\n	<#if enableSocialBookmarks == \"true\">\n		<@liferay_ui[\"social-bookmarks\"]\n			displayStyle=\"${socialBookmarksDisplayStyle}\"\n			target=\"_blank\"\n			title=entry.getTitle(locale)\n			url=viewURL\n		/>\n	</#if>\n</#macro>',0,0,20426,''),('3238d3a5-5e49-4614-8057-578460ba037a',20427,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20034,0,'SITE-MAP-MULTI-COLUMN-LAYOUT-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Multi Column Layout</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays a column for each top level page. Each column includes the name of a top level page with the page\'s immediate children listed underneath.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n\n<#if entries?has_content>\n	<@aui.layout>\n		<#list entries as entry>\n		    <@aui.column columnWidth=25>\n				<div class=\"results-header\">\n					<h3>\n						<#assign layoutURL = portalUtil.getLayoutURL(entry, themeDisplay)>\n\n						<a href=\"${layoutURL}\">${entry.getName(locale)}</a>\n					</h3>\n				</div>\n\n				<#assign pages = entry.getChildren()>\n\n				<@displayPages pages = pages />\n		    </@aui.column>\n		</#list>\n	</@aui.layout>\n</#if>\n\n<#macro displayPages\n	pages\n>\n	<#if pages?has_content>\n		<ul class=\"child-pages\">\n			<#list pages as page>\n				<li>\n					<#assign pageLayoutURL = portalUtil.getLayoutURL(page, themeDisplay)>\n\n					<a href=\"${pageLayoutURL}\">${page.getName(locale)}</a>\n\n					<#assign childPages = page.getChildren()>\n\n					<@displayPages pages = childPages />\n				</li>\n			</#list>\n		</ul>\n	</#if>\n</#macro>',0,0,20428,''),('c7e18ed8-1195-4a8e-9762-5b9429278f37',20429,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20085,0,'ASSET-TAGS-NAVIGATION-COLOR-BY-POPULARITY-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Color by Popularity</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays asset tags colored by popularity: red (high), yellow (medium), and green (low).</Description></root>','display','','ftl','<#if entries?has_content>\n	<ul class=\"tag-items tag-list\">\n		<#assign scopeGroupId = getterUtil.getLong(scopeGroupId, themeDisplay.getScopeGroupId()) />\n		<#assign classNameId = getterUtil.getLong(classNameId, 0) />\n\n		<#assign maxCount = 1 />\n		<#assign minCount = 1 />\n\n		<#list entries as entry>\n			<#assign maxCount = liferay.max(maxCount, entry.getAssetCount()) />\n			<#assign minCount = liferay.min(minCount, entry.getAssetCount()) />\n		</#list>\n\n		<#assign multiplier = 1 />\n\n		<#if maxCount != minCount>\n			<#assign multiplier = 3 / (maxCount - minCount) />\n		</#if>\n\n		<#list entries as entry>\n			<li class=\"taglib-asset-tags-summary\">\n				<#assign popularity = (maxCount - (maxCount - (entry.getAssetCount() - minCount))) * multiplier />\n\n				<#if popularity < 1>\n					<#assign color = \"green\" />\n				<#elseif (popularity >= 1) && (popularity < 2)>\n					<#assign color = \"orange\" />\n				<#else>\n					<#assign color = \"red\" />\n				</#if>\n\n				<#assign tagURL = renderResponse.createRenderURL() />\n\n				${tagURL.setParameter(\"resetCur\", \"true\")}\n				${tagURL.setParameter(\"tag\", entry.getName())}\n\n				<a class =\"tag\" style=\"color: ${color};\" href=\"${tagURL}\">\n					${entry.getName()}\n\n					<#if (showAssetCount == \"true\")>\n						<span class=\"tag-asset-count\">(${count})</span>\n					</#if>\n				</a>\n			</li>\n		</#list>\n	</ul>\n\n	<br style=\"clear: both;\" />\n</#if>',0,0,20430,''),('1833464f-041f-48c3-ac70-4a3c98332f74',20431,20195,20155,20159,'','2016-10-02 17:09:38','2016-10-02 17:09:38',20007,0,'BLOGS-BASIC-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays titles, authors, and abstracts compactly for blog entries.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#list entries as entry>\n	<div class=\"entry\">\n		<#assign viewURL = renderResponse.createRenderURL() />\n\n		${viewURL.setParameter(\"struts_action\", \"/blogs/view_entry\")}\n		${viewURL.setParameter(\"redirect\", currentURL)}\n		${viewURL.setParameter(\"urlTitle\", entry.getUrlTitle())}\n\n		<div class=\"entry-content\">\n			<div class=\"entry-title\">\n				<h2><a href=\"${viewURL}\">${htmlUtil.escape(entry.getTitle())}</a></h2>\n			</div>\n		</div>\n\n		<div class=\"entry-body\">\n			<div class=\"entry-author\">\n				<@liferay.language key=\"written-by\" /> ${htmlUtil.escape(portalUtil.getUserName(entry.getUserId(), entry.getUserName()))}\n			</div>\n\n			<#assign summary = entry.getDescription() />\n\n			<#if (validator.isNull(summary))>\n				<#assign summary = entry.getContent() />\n			</#if>\n\n			${stringUtil.shorten(htmlUtil.stripHtml(summary), 100)}\n\n			<a href=\"${viewURL}\"><@liferay.language key=\"read-more\" /> <span class=\"hide-accessible\"><@liferay.language key=\"about\"/>${htmlUtil.escape(entry.getTitle())}</span> &raquo;</a>\n		</div>\n\n		<div class=\"entry-footer\">\n			<span class=\"entry-date\">\n				${dateUtil.getDate(entry.getCreateDate(), \"dd MMM yyyy - HH:mm:ss\", locale)}\n			</span>\n\n			<#assign blogsEntryClassName = \"com.liferay.portlet.blogs.model.BlogsEntry\" />\n\n			<#if (enableFlags == \"true\")>\n				<@liferay_ui[\"flags\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					contentTitle=entry.getTitle()\n					reportedUserId=entry.getUserId()\n				/>\n			</#if>\n\n			<span class=\"entry-categories\">\n				<@liferay_ui[\"asset-categories-summary\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			</span>\n\n			<span class=\"entry-tags\">\n				<@liferay_ui[\"asset-tags-summary\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			</span>\n		</div>\n	</div>\n\n	<div class=\"separator\"><!-- --></div>\n</#list>',0,0,20432,''),('be90d28a-7344-42eb-8cdd-e2beabb83740',24928,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20102,24927,'TEXT-LINK-IMAGE-SLIDER-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">text-link-image-slider - 6.2.0.0</Name></root>','','display','','vm','<!-- ******slider parameters ****** -->\n\n#set($sliderId = \"slider\"+$reserved-article-id.data.replaceAll(\"-\", \"\")+\"name\")\n#set ($animationSpeed = $getterUtil.getInteger($animation-speed.data))\n#if ($animationSpeed==0)\n   #set ($animationSpeed = 3000)\n#end\n#set ($slideshowSpeed = $getterUtil.getInteger($slideshow-speed.data))\n#if ($slideshowSpeed==0)\n   #set ($slideshowSpeed = 500)\n#end\n#set ($itemWidth = $getterUtil.getInteger($item-width.data))\n\n#set ($move = $getterUtil.getInteger($moved-items.data))\n\n#set ($maxItems = $getterUtil.getInteger($max-items.data))\n\n#set ($slideshow = $auto-slideshow.data)\n#if ($slideshow==\"\")\n   #set ($slideshow = false)\n#end\n#set ($manualControls = $manual-controls.data)\n#if ($manualControls==\"\")\n   #set ($manualControls = \"\'\'\")\n#end\n#set ($directionNav = $direction-nav.data)\n#if ($directionNav==\"\")\n   #set ($directionNav = false)\n#end\n#set ($controlNav = $control-nav.data)\n#if ($controlNav==\"\")\n   #set ($controlNav = false)\n#end\n#set ($animationLoop = $animation-loop.data)\n#if ($animationLoop==\"\")\n   #set ($animationLoop = false)\n#end\n#set ($pauseOnHover = $pause-on-hover.data)\n#if ($pauseOnHover==\"\")\n   #set ($pauseOnHover = false)\n#end\n\n#set ($animation = \"\'\"+$animation-type.data+\"\'\")\n\n#set ($direction = \"\'\"+$sliding-direction.data+\"\'\")\n\n#set ($contentId = \"slider-\" + $reserved-article-id.getData() + \"-id\")\n\n<section class=\"text-link-image-slider-wrap \" id=\"$contentId\">\n	<ul  class=\"slides\"  >\n		#foreach($slide in $slides.siblings)\n	        <li >\n                   <div class=\"slide-content-container\">\n	    	      <article class=\"slide-content  not-video\">\n	    	    	<header>\n	    	    	   <h1>$slide.data</h1>\n                        </header>\n                        <div class=\"entry\">\n                            <p class=\"description\">$slide.description.data</p>\n							\n								<a href=\"$slide.button-link.data\" >\n									<span >$slide.button-caption.data</span>\n								</a>\n								<img alt=\"$slide.description.data\" width=\"$slide.image.image-width.data\" height=\"$slide.image.image-height.data\" src=\"$slide.image.data\">\n    	    		</div><!-- /.entry -->\n	    	    			    	    		\n	    	      </article>\n    	    	</div>\n                </li>\n                #end\n		</ul>\n   \n\n</section>\n\n<!-- ********* javaScript ********** -->\n<script type=\"text/javascript\">\n   jQuery(window).load(function() {  \n       jQuery(\'#$contentId\').flexslider({  \n           	animation: $animation,\n           	direction: $direction,   		   	\n           	controlNav: $controlNav,  \n           	directionNav: $directionNav,\n           	slideshow: $slideshow,   \n           	animationSpeed: $animationSpeed ,	\n           	slideshowSpeed: $slideshowSpeed ,\n           	pauseOnHover: $pauseOnHover,\n           	animationLoop: $animationLoop,\n			itemWidth: $itemWidth,\n			maxItems: $maxItems,\n			move: $move,\n			smoothHeight: true,\n			manualControls: $manualControls\n		\n           	   	});   \n            });	\n</script>',0,0,24929,''),('179310ea-683d-46f2-a7ed-4745db75de23',24964,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20102,24963,'FEATURES-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">features - 6.2.0.0</Name></root>','','display','','vm','<div class=\"mini-features\">\n<div class=\"image\">\n<img src=\"$icone.data\" alt=\"\">\n</div>	    					\n<div class=\"entry\">\n<h2>\n<a href=\"$feature-link.data\">\n$feature.data\n</a></h2>\n<p>\n$abstract.data\n</p>\n</div>\n</div>',0,0,24965,''),('35b63648-302c-46b5-a661-fcf89c76b4b6',24998,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20102,24996,'FOOTER-LINKS-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Footer Links - 6.2.0.0</Name></root>','','display','','vm','#if ($title.data != \"\")\n	<h2>\n		$title.data\n	</h2>\n#end\n\n<ul class=\"hide-bullets\">\n	#foreach ($footer-link in $footer-links.siblings)\n		<li>\n			#if ($footer-link.url-location.data != \"\")\n				<a href=\"$footer-link.url-location.data\">\n			#end\n\n			$footer-link.data\n\n			#if ($footer-link.url-location.data != \"\")\n				</a>\n			#end\n		</li>\n	#end\n</ul>',0,0,24999,''),('a53f99e4-5c20-45cf-ae30-5f56d5ec4936',25009,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20102,25008,'PORTFOLIO-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">portfolio - 6.2.0.0</Name></root>','','display','','vm','<div id=\"portfolio\">\n<header class=\"portfolio-header\">\n    <h1 class=\"fix\">				    	\n		 #if($portofolio-title.data)\n                   $portofolio-title.data\n         #end				    		\n	</h1>\n	<p>\n    <span>\n    $portofolio-description.data\n    </span>\n    </p>\n	<div id=\"portfolio-filter\" class=\"port-tags\">\n        <div class=\"fl\">\n            <span class=\"port-cat\">\n                <a href=\"#all\">All</a>\n               #foreach($section in $sections.siblings)\n                <a rel=\"design\" href=\"#$section.data.replace(\" \", \"\")\">$section.data</a>\n               #end\n            </span>\n        </div><!--/.fl-->\n    <div class=\"fix\"></div>\n    </div><!--/#port-tags .port-tags-->\n</header>\n<div id=\"portfolio-list\" class=\"portfolio-items type-page fix\">\n#foreach($section in $sections.siblings)\n   #foreach($image in $section.images.siblings)\n    <article id=\"portfolio-item-id-116\" class=\"post-116 type-portfolio status-publish portfolio-item $section.data.replace(\" \", \"\")\" style=\"height: 295px; \">\n         <a title=\"\" href=\"$image.link.data\" class=\"item drop-shadow curved curved-hz-1\">\n             <img src=\"$image.image-source.data\" alt=\"\" width=\"207\" height=\"212\" class=\"thumbnail\" style=\"opacity: 1; \">\n         </a>\n         <span class=\"mask\"></span>\n         <h2><a href=\"$image.link.data\" rel=\"bookmark\" title=\"$image.image-name.data\">$image.image-name.data</a></h2>\n         <p class=\"category\">$section.data</p>\n    </article>\n   #end\n#end\n</div>\n</div>',0,0,25010,''),('e5691766-f181-4510-b803-942e3185dd3c',25020,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20102,25019,'MINI-PORTOFOLIO-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">mini-portofolio - 6.2.0.0</Name></root>','','display','','vm','<!-- ******slider parameters ****** -->\n\n#set($sliderId = \"slider\"+$reserved-article-id.data.replaceAll(\"-\", \"\")+\"name\")\n#set ($animationSpeed = $getterUtil.getInteger($animation-speed.data))\n#if ($animationSpeed==0)\n   #set ($animationSpeed = 3000)\n#end\n#set ($slideshowSpeed = $getterUtil.getInteger($slideshow-speed.data))\n#if ($slideshowSpeed==0)\n   #set ($slideshowSpeed = 500)\n#end\n#set ($itemWidth = $getterUtil.getInteger($item-width.data))\n\n#set ($move = $getterUtil.getInteger($moved-items.data))\n\n#set ($maxItems = $getterUtil.getInteger($max-items.data))\n\n#set ($slideshow = $auto-slideshow.data)\n#if ($slideshow==\"\")\n   #set ($slideshow = false)\n#end\n#set ($manualControls = $manual-controls.data)\n#if ($manualControls==\"\")\n   #set ($manualControls = \"\'\'\")\n#end\n#set ($directionNav = $direction-nav.data)\n#if ($directionNav==\"\")\n   #set ($directionNav = false)\n#end\n#set ($controlNav = $control-nav.data)\n#if ($controlNav==\"\")\n   #set ($controlNav = false)\n#end\n#set ($animationLoop = $animation-loop.data)\n#if ($animationLoop==\"\")\n   #set ($animationLoop = false)\n#end\n#set ($pauseOnHover = $pause-on-hover.data)\n#if ($pauseOnHover==\"\")\n   #set ($pauseOnHover = false)\n#end\n\n#set ($animation = \"\'\"+$animation-type.data+\"\'\")\n\n#set ($direction = \"\'\"+$sliding-direction.data+\"\'\")\n\n#set ($contentId = \"slider-\" + $reserved-article-id.getData() + \"-id\")\n\n#set ($itemWidth = 230)\n#set ($maxItems = 4)\n#set ($move = 4)\n<section class=\"mini-Portfolio\">\n<header class=\"section-header\">\n     <h1>\n           #if($section-title.data)\n                   $section-title.data\n           #end\n     </h1>\n     <p>     \n     <span>\n      #if($sections)\n         #foreach($section in $sections.siblings)\n            <a href=\"$section.section-link.data\" rel=\"all\">$section.data</a> \n         #end\n      #end\n     </span>\n     </p>\n</header>\n<div class=\"mini-Portfolio-slider\" id=\"$contentId\">\n 	<ul  class=\"slides\">\n		#foreach($slide in $slides.siblings)\n	        <li >\n                   <article class=\"portfolio-item\"> \n                       <a href=\"$slide.image-link.data\" class=\"item\"> \n                         <div class=\"img-wrap\"> \n                           <img src=\"$slide.image-source.data\"> \n                         </div> \n                       </a> \n                       <div class=\"mask\"> \n                          <div class=\"content\"> \n                            <h2><a href=\"$slide.title-text.data\" title=\"Travel\">$slide.title-text.data</a></h2> \n                              <p>\n                                 #if($slide.description.data)\n                                     $slide.description.data\n                                 #end\n                              </p> \n                          </div> \n                       </div> \n                   </article>\n                </li>\n\n                #end\n		\n		</ul>\n</div>\n</section>\n\n\n<!-- ********* javaScript ********** -->\n<script type=\"text/javascript\">\n   jQuery(window).load(function() {  \n       jQuery(\'#$contentId\').flexslider({  \n           	animation: $animation,\n           	direction: $direction,   		   	\n           	controlNav: $controlNav,  \n           	directionNav: $directionNav,\n           	slideshow: $slideshow,   \n           	animationSpeed: $animationSpeed ,	\n           	slideshowSpeed: $slideshowSpeed ,\n           	pauseOnHover: $pauseOnHover,\n           	animationLoop: $animationLoop,\n			itemWidth: $itemWidth,\n			maxItems: $maxItems,\n			move: $move,\n			smoothHeight: true,\n			manualControls: $manualControls\n		\n           	   	});   \n            });	\n</script>',0,0,25021,''),('99e4fe12-9213-4d83-89a7-ee3717dd2548',25031,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20102,25030,'CAROUSEL-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">carousel - 6.2.0.0</Name></root>','','display','','vm','<!-- ******slider parameters ****** -->\n\n#set($sliderId = \"slider\"+$reserved-article-id.data.replaceAll(\"-\", \"\")+\"name\")\n#set ($animationSpeed = $getterUtil.getInteger($animation-speed.data))\n#if ($animationSpeed==0)\n   #set ($animationSpeed = 3000)\n#end\n#set ($slideshowSpeed = $getterUtil.getInteger($slideshow-speed.data))\n#if ($slideshowSpeed==0)\n   #set ($slideshowSpeed = 500)\n#end\n#set ($itemWidth = $getterUtil.getInteger($item-width.data))\n\n#set ($move = $getterUtil.getInteger($moved-items.data))\n\n#set ($maxItems = $getterUtil.getInteger($max-items.data))\n\n#set ($slideshow = $auto-slideshow.data)\n#if ($slideshow==\"\")\n   #set ($slideshow = false)\n#end\n#set ($manualControls = $manual-controls.data)\n#if ($manualControls==\"\")\n   #set ($manualControls = \"\'\'\")\n#end\n#set ($directionNav = $direction-nav.data)\n#if ($directionNav==\"\")\n   #set ($directionNav = false)\n#end\n#set ($controlNav = $control-nav.data)\n#if ($controlNav==\"\")\n   #set ($controlNav = false)\n#end\n#set ($animationLoop = $animation-loop.data)\n#if ($animationLoop==\"\")\n   #set ($animationLoop = false)\n#end\n#set ($pauseOnHover = $pause-on-hover.data)\n#if ($pauseOnHover==\"\")\n   #set ($pauseOnHover = false)\n#end\n\n#set ($animation = \"\'\"+$animation-type.data+\"\'\")\n\n#set ($direction = \"\'\"+$sliding-direction.data+\"\'\")\n\n#set ($contentId = \"slider-\" + $reserved-article-id.getData() + \"-id\")\n#set ($navId = \"slider-\" + $reserved-article-id.getData() + \"-navigation\")\n#set ($manualControls = \"\'#\" + $navId + \" li\'\" )\n\n<div class=\"col-full carousel-outer-wrap\" >\n	<div class=\"carousel-wrap\" id=\"$contentId\">\n	  \n		\n			<ul class=\"slides\" >\n			#foreach($slide in $slides.siblings)\n		        <li >\n	              \n	                <div class=\"slide-media\">\n				          <a href=\"$slide.image-link.data\" >			        \n	                          <img  alt=\"$slide.data\" src=\"$slide.image.data\" height=\"$slide.image.image-height.data\"></img>\n	                      </a>\n		            </div> \n	             </li>\n	\n	         #end\n			\n			</ul>\n	   \n	</div>\n	\n	<div class=\"carousel-slide-nav\" id=\"$navId\">\n		<div class=\"carousel-pg \">\n			<ul class=\"carousel-pager slides\">\n	        #foreach($slide in $slides.siblings)\n	        <li class=\"links\">\n	            <a href=\"\">\n	            <span class=\"title\">$slide.data</span>\n	            <span class=\"content\">$slide.pager-abstract.data</span>\n	            </a>\n	        </li>\n	        \n	        #end\n			</ul>\n		</div>\n	</div>\n</div >\n\n\n\n<!-- ********* javaScript ********** -->\n<script type=\"text/javascript\">\n   jQuery(window).load(function() {  \n       jQuery(\'#$contentId\').flexslider({  \n           	animation: $animation,\n           	direction: $direction,   		   	\n           	controlNav: $controlNav,  \n           	directionNav: $directionNav,\n           	slideshow: $slideshow,   \n           	animationSpeed: $animationSpeed ,	\n           	slideshowSpeed: $slideshowSpeed ,\n           	pauseOnHover: $pauseOnHover,\n           	animationLoop: $animationLoop,\n			itemWidth: $itemWidth,\n			maxItems: $maxItems,\n			move: $move,\n			smoothHeight: true,\n			manualControls: $manualControls\n		\n           	   	});   \n            });	\n</script>',0,0,25032,''),('9280e8b1-47cb-42cc-b3d7-0efd25d7ef50',25042,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20102,25041,'TESTIMONIALS-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">testimonials - 6.2.0.0</Name></root>','','display','','vm','<!-- ******slider parameters ****** -->\n\n#set($sliderId = \"slider\"+$reserved-article-id.data.replaceAll(\"-\", \"\")+\"name\")\n#set ($animationSpeed = $getterUtil.getInteger($animation-speed.data))\n#if ($animationSpeed==0)\n   #set ($animationSpeed = 3000)\n#end\n#set ($slideshowSpeed = $getterUtil.getInteger($slideshow-speed.data))\n#if ($slideshowSpeed==0)\n   #set ($slideshowSpeed = 500)\n#end\n#set ($itemWidth = $getterUtil.getInteger($item-width.data))\n\n#set ($move = $getterUtil.getInteger($moved-items.data))\n\n#set ($maxItems = $getterUtil.getInteger($max-items.data))\n\n#set ($slideshow = $auto-slideshow.data)\n#if ($slideshow==\"\")\n   #set ($slideshow = false)\n#end\n#set ($manualControls = $manual-controls.data)\n#if ($manualControls==\"\")\n   #set ($manualControls = \"\'\'\")\n#end\n#set ($directionNav = $direction-nav.data)\n#if ($directionNav==\"\")\n   #set ($directionNav = false)\n#end\n#set ($controlNav = $control-nav.data)\n#if ($controlNav==\"\")\n   #set ($controlNav = false)\n#end\n#set ($animationLoop = $animation-loop.data)\n#if ($animationLoop==\"\")\n   #set ($animationLoop = false)\n#end\n#set ($pauseOnHover = $pause-on-hover.data)\n#if ($pauseOnHover==\"\")\n   #set ($pauseOnHover = false)\n#end\n\n#set ($animation = \"\'\"+$animation-type.data+\"\'\")\n\n#set ($direction = \"\'\"+$sliding-direction.data+\"\'\")\n\n#set ($contentId = \"slider-\" + $reserved-article-id.getData() + \"-id\")\n\n#set ($itemWidth = 300)\n#set ($maxItems = 3)\n#set ($move = 3)\n<section class=\"testimonial\" >\n	<header class=\"testimonial-header\">\n		<h1>\n			#if($section-title.data)\n                   $section-title.data\n			#end\n		</h1>\n     	<p>     \n     		<span>\n       			$section-description.data\n     		</span>\n     	</p>\n	</header>\n	<div class=\"testimonial-slider\" id=\"$contentId\">\n		<ul class=\"slides\" >\n		#foreach($slide in $slides.siblings)\n			<li >\n				<div class=\"content\">\n					<div class=\"gravatar\">\n     					<span class=\"gravatar-wrap\">\n							<img alt=\"\" src=\"$slide.image-source.data\" class=\"avatar avatar-40 photo\" height=\"40\" width=\"40\">\n						</span>\n					</div>\n					<p>$slide.description.data</p>\n                    <div class=\"author\">\n	    				<span class=\"name\">$slide.author-name.data</span>\n		        		<span class=\"website\"><a href=\"$slide.site-link.data\" title=\"My site\">$slide.site.data</a></span>\n		   			</div>\n                </div>\n			</li>\n\n		#end\n		\n		</ul>\n	</div>\n\n</section>\n\n<!-- ********* javaScript ********** -->\n<script type=\"text/javascript\">\n   jQuery(window).load(function() {  \n       jQuery(\'#$contentId\').flexslider({  \n           	animation: $animation,\n           	direction: $direction,   		   	\n           	controlNav: $controlNav,  \n           	directionNav: $directionNav,\n           	slideshow: $slideshow,   \n           	animationSpeed: $animationSpeed ,	\n           	slideshowSpeed: $slideshowSpeed ,\n           	pauseOnHover: $pauseOnHover,\n           	animationLoop: $animationLoop,\n			itemWidth: $itemWidth,\n			maxItems: $maxItems,\n			move: $move,\n			smoothHeight: true,\n			manualControls: $manualControls\n		\n           	   	});   \n            });	\n</script>',0,0,25043,''),('6ff09542-8836-4f93-b475-fa955bbb7aaa',25053,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20102,25052,'FOOTER-SOCIAL-6.2.0.0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Footer Social - 6.2.0.0</Name></root>','','display','','vm','#if ($title.data != \"\")\n	<h2>\n		$title.data\n	</h2>\n#end\n\n#if ($tagline.data != \"\")\n	<h4>\n		$tagline.data\n	</h4>\n#end\n<ul class=\"social \">\n#if ($facebook.data!= \"\")\n		<li>\n			<a class=\"facebook\" href=\"$fb-url-location.data\" target=\"new_window\" title=\"Facebook\">\n			</a>\n		</li>\n#end\n#if ($google-plus.data!= \"\")\n		<li>\n			<a class=\"google-plus\" href=\"$gp-url-location.data\" target=\"new_window\" title=\"google plus\">\n			</a>\n		</li>\n#end\n#if ($twitter.data!= \"\")\n		<li>\n			<a class=\"twitter\" href=\"$tw-url-location.data\" target=\"new_window\" title=\"Twitter\">\n			</a>\n		</li>\n#end\n#if ($rss.data!= \"\")\n		<li>\n			<a class=\"rss\" href=\"$rs-url-location.data\" target=\"new_window\" title=\"RSS\">\n			</a>\n		</li>\n#end\n#if ($linkedin.data!= \"\")\n		<li>\n			<a class=\"linkedin\" href=\"$li-url-location.data\" target=\"new_window\" title=\"Linkedin\">\n			</a>\n		</li>\n#end\n#if ($youtube.data!= \"\")\n		<li>\n			<a class=\"youtube\" href=\"$yu-url-location.data\" target=\"new_window\" title=\"Youtube\">\n			</a>\n		</li>\n#end\n#if ($vimeo.data!= \"\")\n		<li>\n			<a class=\"vimeo\" href=\"$vi-url-location.data\" target=\"new_window\" title=\"vimeo\">\n			</a>\n		</li>\n#end\n	#foreach ($social-link in $social-links.siblings)\n		#if ($social-link.data!= \"\")\n		<li>\n			<a href=\"$social-link.url-location.data\" target=\"new_window\" title=\"$social-link.data\">\n				<img alt=\"$social-link.data\" src=\"$social-link.icon.data\" />\n\n			</a>\n		</li>\n		#end\n	#end\n</ul>',0,0,25054,'');
/*!40000 ALTER TABLE `ddmtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlcontent`
--

DROP TABLE IF EXISTS `dlcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlcontent` (
  `contentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `path_` varchar(255) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `data_` longblob,
  `size_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `IX_FDD1AAA8` (`companyId`,`repositoryId`,`path_`,`version`),
  KEY `IX_6A83A66A` (`companyId`,`repositoryId`),
  KEY `IX_EB531760` (`companyId`,`repositoryId`,`path_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlcontent`
--

LOCK TABLES `dlcontent` WRITE;
/*!40000 ALTER TABLE `dlcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dlcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileentry`
--

DROP TABLE IF EXISTS `dlfileentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `extraSettings` longtext,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `readCount` int(11) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `largeImageId` bigint(20) DEFAULT NULL,
  `custom1ImageId` bigint(20) DEFAULT NULL,
  `custom2ImageId` bigint(20) DEFAULT NULL,
  `manualCheckInRequired` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fileEntryId`),
  UNIQUE KEY `IX_5391712` (`groupId`,`folderId`,`name`),
  UNIQUE KEY `IX_ED5CA615` (`groupId`,`folderId`,`title`),
  UNIQUE KEY `IX_BC2E7E6A` (`uuid_`,`groupId`),
  KEY `IX_4CB1B2B4` (`companyId`),
  KEY `IX_772ECDE7` (`fileEntryTypeId`),
  KEY `IX_8F6C75D0` (`folderId`,`name`),
  KEY `IX_F4AF5636` (`groupId`),
  KEY `IX_93CF8193` (`groupId`,`folderId`),
  KEY `IX_29D0AF28` (`groupId`,`folderId`,`fileEntryTypeId`),
  KEY `IX_43261870` (`groupId`,`userId`),
  KEY `IX_D20C434D` (`groupId`,`userId`,`folderId`),
  KEY `IX_D9492CF6` (`mimeType`),
  KEY `IX_1B352F4A` (`repositoryId`,`folderId`),
  KEY `IX_64F0FE40` (`uuid_`),
  KEY `IX_31079DE8` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileentry`
--

LOCK TABLES `dlfileentry` WRITE;
/*!40000 ALTER TABLE `dlfileentry` DISABLE KEYS */;
INSERT INTO `dlfileentry` VALUES ('7c3abf7b-91d1-47e1-adba-53530fe30e31',24866,24855,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',0,0,24855,0,'/0/','101','png','image/png','64_64','','',0,'1.0',6409,0,0,0,0,0,0),('855d87ca-c560-451d-971c-ddafbdb7ab48',24875,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',0,0,24855,0,'/0/','102','jpeg','image/jpeg','avatar1','','',0,'1.0',3718,0,0,0,0,0,0),('8ccbafbd-7799-4fb8-8790-c58c4647d821',24883,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',0,0,24855,0,'/0/','103','png','image/png','197_203','','',0,'1.0',10921,0,0,0,0,0,0),('a674a96d-fb2e-45de-acd3-66111c31eb5d',24891,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',0,0,24855,0,'/0/','104','jpeg','image/jpeg','avatar2','','',0,'1.0',2989,0,0,0,0,0,0),('4d6bc0b3-950a-4b05-8c26-6f0f4f1631dc',24899,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',0,0,24855,0,'/0/','105','jpeg','image/jpeg','avatar3','','',0,'1.0',912,0,0,0,0,0,0),('eb0e6c25-927a-44f3-a610-b6085c1f47de',24908,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',0,0,24855,0,'/0/','106','png','image/png','210_150','','',0,'1.0',12214,0,0,0,0,0,0),('e1a093d1-f5af-473a-ba52-9513c19a8b10',24916,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',0,0,24855,0,'/0/','107','png','image/png','900_350','','',0,'1.0',34646,0,0,0,0,0,0);
/*!40000 ALTER TABLE `dlfileentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileentrymetadata`
--

DROP TABLE IF EXISTS `dlfileentrymetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileentrymetadata` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryMetadataId` bigint(20) NOT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `DDMStructureId` bigint(20) DEFAULT NULL,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `fileVersionId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fileEntryMetadataId`),
  UNIQUE KEY `IX_7332B44F` (`DDMStructureId`,`fileVersionId`),
  KEY `IX_4F40FE5E` (`fileEntryId`),
  KEY `IX_A44636C9` (`fileEntryId`,`fileVersionId`),
  KEY `IX_F8E90438` (`fileEntryTypeId`),
  KEY `IX_1FE9C04` (`fileVersionId`),
  KEY `IX_D49AB5D1` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileentrymetadata`
--

LOCK TABLES `dlfileentrymetadata` WRITE;
/*!40000 ALTER TABLE `dlfileentrymetadata` DISABLE KEYS */;
INSERT INTO `dlfileentrymetadata` VALUES ('7c7186ee-550e-4093-9498-2564757ee234',24907,24919,20315,0,24866,24867),('9f55396f-22dc-4ece-8584-655dac7b98a3',24930,24931,20315,0,24875,24876),('6a5a6679-8bea-4812-b3be-2f643c90f8b8',24936,24937,20315,0,24883,24884),('ab185807-db54-4739-9ab6-587d75ae2513',24940,24942,20315,0,24891,24892),('9bee2d6b-af64-4b0a-a3fd-c5b0aa0ade93',24945,24946,20315,0,24899,24900),('f13b7439-885e-4363-86a9-29c3e954ea94',24954,24955,20315,0,24908,24909),('a16552c0-66b2-4074-a6eb-a1e4919333e4',24958,24960,20315,0,24916,24917);
/*!40000 ALTER TABLE `dlfileentrymetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileentrytype`
--

DROP TABLE IF EXISTS `dlfileentrytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileentrytype` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryTypeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `fileEntryTypeKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  PRIMARY KEY (`fileEntryTypeId`),
  UNIQUE KEY `IX_5B6BEF5F` (`groupId`,`fileEntryTypeKey`),
  UNIQUE KEY `IX_1399D844` (`uuid_`,`groupId`),
  KEY `IX_4501FD9C` (`groupId`),
  KEY `IX_90724726` (`uuid_`),
  KEY `IX_5B03E942` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileentrytype`
--

LOCK TABLES `dlfileentrytype` WRITE;
/*!40000 ALTER TABLE `dlfileentrytype` DISABLE KEYS */;
INSERT INTO `dlfileentrytype` VALUES ('3319e6d1-30de-438c-b52b-77a71bcd51ca',0,0,0,0,'','2016-10-02 17:09:23','2016-10-02 17:09:23','BASIC-DOCUMENT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">basic-document</Name></root>',''),('e6ce2f36-bd9c-4095-924f-1f2741e38705',20306,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34','CONTRACT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contract</Description></root>'),('6a314a20-23bd-4991-bbdb-4da65a82f313',20308,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34','MARKETING BANNER','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Banner</Description></root>'),('56feaae9-1048-4950-90ed-0e74ec9f2cc9',20310,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34','ONLINE TRAINING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Online Training</Description></root>'),('ef5f066a-556b-4c4f-817b-e671a961b82b',20312,20195,20155,20159,'','2016-10-02 17:09:34','2016-10-02 17:09:34','SALES PRESENTATION','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Sales Presentation</Description></root>');
/*!40000 ALTER TABLE `dlfileentrytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileentrytypes_ddmstructures`
--

DROP TABLE IF EXISTS `dlfileentrytypes_ddmstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileentrytypes_ddmstructures` (
  `structureId` bigint(20) NOT NULL,
  `fileEntryTypeId` bigint(20) NOT NULL,
  PRIMARY KEY (`structureId`,`fileEntryTypeId`),
  KEY `IX_8373EC7C` (`fileEntryTypeId`),
  KEY `IX_F147CF3F` (`structureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileentrytypes_ddmstructures`
--

LOCK TABLES `dlfileentrytypes_ddmstructures` WRITE;
/*!40000 ALTER TABLE `dlfileentrytypes_ddmstructures` DISABLE KEYS */;
INSERT INTO `dlfileentrytypes_ddmstructures` VALUES (20307,20306),(20304,20308),(20309,20308),(20303,20310),(20311,20310),(20305,20312),(20313,20312);
/*!40000 ALTER TABLE `dlfileentrytypes_ddmstructures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileentrytypes_dlfolders`
--

DROP TABLE IF EXISTS `dlfileentrytypes_dlfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileentrytypes_dlfolders` (
  `fileEntryTypeId` bigint(20) NOT NULL,
  `folderId` bigint(20) NOT NULL,
  PRIMARY KEY (`fileEntryTypeId`,`folderId`),
  KEY `IX_5BB6AD6C` (`fileEntryTypeId`),
  KEY `IX_6E00A2EC` (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileentrytypes_dlfolders`
--

LOCK TABLES `dlfileentrytypes_dlfolders` WRITE;
/*!40000 ALTER TABLE `dlfileentrytypes_dlfolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `dlfileentrytypes_dlfolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfilerank`
--

DROP TABLE IF EXISTS `dlfilerank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfilerank` (
  `fileRankId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fileRankId`),
  UNIQUE KEY `IX_38F0315` (`companyId`,`userId`,`fileEntryId`),
  KEY `IX_A65A1F8B` (`fileEntryId`),
  KEY `IX_BAFB116E` (`groupId`,`userId`),
  KEY `IX_4E96195B` (`groupId`,`userId`,`active_`),
  KEY `IX_EED06670` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfilerank`
--

LOCK TABLES `dlfilerank` WRITE;
/*!40000 ALTER TABLE `dlfilerank` DISABLE KEYS */;
/*!40000 ALTER TABLE `dlfilerank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileshortcut`
--

DROP TABLE IF EXISTS `dlfileshortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileshortcut` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileShortcutId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `toFileEntryId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`fileShortcutId`),
  UNIQUE KEY `IX_FDB4A946` (`uuid_`,`groupId`),
  KEY `IX_A4BB2E58` (`companyId`),
  KEY `IX_8571953E` (`companyId`,`status`),
  KEY `IX_B0051937` (`groupId`,`folderId`),
  KEY `IX_348DC3B2` (`groupId`,`folderId`,`active_`),
  KEY `IX_17EE3098` (`groupId`,`folderId`,`active_`,`status`),
  KEY `IX_4B7247F6` (`toFileEntryId`),
  KEY `IX_4831EBE4` (`uuid_`),
  KEY `IX_29AE81C4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileshortcut`
--

LOCK TABLES `dlfileshortcut` WRITE;
/*!40000 ALTER TABLE `dlfileshortcut` DISABLE KEYS */;
/*!40000 ALTER TABLE `dlfileshortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfileversion`
--

DROP TABLE IF EXISTS `dlfileversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfileversion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `changeLog` varchar(75) DEFAULT NULL,
  `extraSettings` longtext,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `checksum` varchar(75) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`fileVersionId`),
  UNIQUE KEY `IX_E2815081` (`fileEntryId`,`version`),
  UNIQUE KEY `IX_C99B2650` (`uuid_`,`groupId`),
  KEY `IX_F389330E` (`companyId`),
  KEY `IX_A0A283F4` (`companyId`,`status`),
  KEY `IX_C68DC967` (`fileEntryId`),
  KEY `IX_D47BB14D` (`fileEntryId`,`status`),
  KEY `IX_DFD809D3` (`groupId`,`folderId`,`status`),
  KEY `IX_9BE769ED` (`groupId`,`folderId`,`title`,`version`),
  KEY `IX_FFB3395C` (`mimeType`),
  KEY `IX_4BFABB9A` (`uuid_`),
  KEY `IX_95E9E44E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfileversion`
--

LOCK TABLES `dlfileversion` WRITE;
/*!40000 ALTER TABLE `dlfileversion` DISABLE KEYS */;
INSERT INTO `dlfileversion` VALUES ('8d454e72-21fc-412a-8129-7d0d9f1c0774',24867,24855,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',24855,0,24866,'/0/','png','image/png','64_64','','','',0,'1.0',6409,'',0,20159,'','2016-11-21 19:01:12'),('7ab9f87c-276f-4da3-9981-6ad60163d736',24876,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',24855,0,24875,'/0/','jpeg','image/jpeg','avatar1','','','',0,'1.0',3718,'',0,20159,'','2016-11-21 19:01:13'),('1b75cdaa-8869-4c9e-af91-70f2276c0481',24884,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',24855,0,24883,'/0/','png','image/png','197_203','','','',0,'1.0',10921,'',0,20159,'','2016-11-21 19:01:13'),('80aab269-f464-4fdb-a1c5-c4d25eda6a64',24892,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',24855,0,24891,'/0/','jpeg','image/jpeg','avatar2','','','',0,'1.0',2989,'',0,20159,'','2016-11-21 19:01:13'),('8ac6fb79-25fc-4d3e-816c-33f813889a35',24900,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',24855,0,24899,'/0/','jpeg','image/jpeg','avatar3','','','',0,'1.0',912,'',0,20159,'','2016-11-21 19:01:13'),('17660121-87ed-437c-9870-ac2121b80626',24909,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',24855,0,24908,'/0/','png','image/png','210_150','','','',0,'1.0',12214,'',0,20159,'','2016-11-21 19:01:13'),('27c898ef-fadd-44c3-95b3-092a22d39457',24917,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',24855,0,24916,'/0/','png','image/png','900_350','','','',0,'1.0',34646,'',0,20159,'','2016-11-21 19:01:13');
/*!40000 ALTER TABLE `dlfileversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlfolder`
--

DROP TABLE IF EXISTS `dlfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlfolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `mountPoint` tinyint(4) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `lastPostDate` datetime DEFAULT NULL,
  `defaultFileEntryTypeId` bigint(20) DEFAULT NULL,
  `hidden_` tinyint(4) DEFAULT NULL,
  `overrideFileEntryTypes` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_902FD874` (`groupId`,`parentFolderId`,`name`),
  UNIQUE KEY `IX_3CC1DED2` (`uuid_`,`groupId`),
  KEY `IX_A74DB14C` (`companyId`),
  KEY `IX_E79BE432` (`companyId`,`status`),
  KEY `IX_F2EA1ACE` (`groupId`),
  KEY `IX_F78286C5` (`groupId`,`mountPoint`,`parentFolderId`,`hidden_`),
  KEY `IX_C88430AB` (`groupId`,`mountPoint`,`parentFolderId`,`hidden_`,`status`),
  KEY `IX_49C37475` (`groupId`,`parentFolderId`),
  KEY `IX_CE360BF6` (`groupId`,`parentFolderId`,`hidden_`,`status`),
  KEY `IX_51556082` (`parentFolderId`,`name`),
  KEY `IX_EE29C715` (`repositoryId`),
  KEY `IX_CBC408D8` (`uuid_`),
  KEY `IX_DA448450` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlfolder`
--

LOCK TABLES `dlfolder` WRITE;
/*!40000 ALTER TABLE `dlfolder` DISABLE KEYS */;
INSERT INTO `dlfolder` VALUES ('6f065e99-2b62-4eda-8386-59fee9d4d499',21006,20195,20155,20159,'','2016-10-05 15:16:45','2016-10-05 15:16:45',21005,1,0,'/21006/','20','','2016-10-05 15:16:45',0,1,0,0,0,'',NULL),('3f336168-a7e5-4ac3-b7ea-ba76829675cc',21007,20195,20155,20199,'Test Test','2016-10-05 15:16:45','2016-10-05 15:16:45',21005,0,21006,'/21006/21007/','20199','','2016-10-05 15:16:45',0,0,0,0,0,'',NULL),('3de5a3c2-62a4-4106-9975-6e21c9875c88',21008,20195,20155,20199,'Test Test','2016-10-05 15:16:45','2016-10-05 15:16:45',21005,0,21007,'/21006/21007/21008/','com.liferay.portlet.portalsettings.action.EditCompanyLogoAction','','2016-10-05 15:16:45',0,0,0,0,0,'',NULL),('25eb237c-9a1f-4b82-ad2e-e2e57b9e8d91',22834,20201,20155,20199,'Test Test','2016-10-26 23:34:12','2016-10-26 23:34:12',20201,0,0,'/22834/','OpenSocial Gadgets','','2016-10-26 23:34:12',0,0,0,0,0,'',NULL);
/*!40000 ALTER TABLE `dlfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlsyncevent`
--

DROP TABLE IF EXISTS `dlsyncevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlsyncevent` (
  `syncEventId` bigint(20) NOT NULL,
  `modifiedTime` bigint(20) DEFAULT NULL,
  `event` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`syncEventId`),
  UNIQUE KEY `IX_57D82B06` (`typePK`),
  KEY `IX_3D8E1607` (`modifiedTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlsyncevent`
--

LOCK TABLES `dlsyncevent` WRITE;
/*!40000 ALTER TABLE `dlsyncevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dlsyncevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailaddress`
--

DROP TABLE IF EXISTS `emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailaddress` (
  `uuid_` varchar(75) DEFAULT NULL,
  `emailAddressId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`emailAddressId`),
  KEY `IX_1BB072CA` (`companyId`),
  KEY `IX_49D2DEC4` (`companyId`,`classNameId`),
  KEY `IX_551A519F` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_2A2CB130` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_7B43CD8` (`userId`),
  KEY `IX_D24F3956` (`uuid_`),
  KEY `IX_F74AB912` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailaddress`
--

LOCK TABLES `emailaddress` WRITE;
/*!40000 ALTER TABLE `emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expandocolumn`
--

DROP TABLE IF EXISTS `expandocolumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expandocolumn` (
  `columnId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `defaultData` longtext,
  `typeSettings` longtext,
  PRIMARY KEY (`columnId`),
  UNIQUE KEY `IX_FEFC8DA7` (`tableId`,`name`),
  KEY `IX_A8C0CBE8` (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expandocolumn`
--

LOCK TABLES `expandocolumn` WRITE;
/*!40000 ALTER TABLE `expandocolumn` DISABLE KEYS */;
INSERT INTO `expandocolumn` VALUES (20438,20155,20437,'clientId',15,'','');
/*!40000 ALTER TABLE `expandocolumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expandorow`
--

DROP TABLE IF EXISTS `expandorow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expandorow` (
  `rowId_` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowId_`),
  UNIQUE KEY `IX_81EFBFF5` (`tableId`,`classPK`),
  KEY `IX_49EB3118` (`classPK`),
  KEY `IX_D3F5D7AE` (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expandorow`
--

LOCK TABLES `expandorow` WRITE;
/*!40000 ALTER TABLE `expandorow` DISABLE KEYS */;
/*!40000 ALTER TABLE `expandorow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expandotable`
--

DROP TABLE IF EXISTS `expandotable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expandotable` (
  `tableId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`tableId`),
  UNIQUE KEY `IX_37562284` (`companyId`,`classNameId`,`name`),
  KEY `IX_B5AE8A85` (`companyId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expandotable`
--

LOCK TABLES `expandotable` WRITE;
/*!40000 ALTER TABLE `expandotable` DISABLE KEYS */;
INSERT INTO `expandotable` VALUES (20507,20155,20002,'OPEN_SOCIAL_DATA_'),(20437,20155,20005,'MP'),(20508,20155,20005,'OPEN_SOCIAL_DATA_'),(22619,20155,20088,'CUSTOM_FIELDS');
/*!40000 ALTER TABLE `expandotable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expandovalue`
--

DROP TABLE IF EXISTS `expandovalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expandovalue` (
  `valueId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `columnId` bigint(20) DEFAULT NULL,
  `rowId_` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `data_` longtext,
  PRIMARY KEY (`valueId`),
  UNIQUE KEY `IX_9DDD21E5` (`columnId`,`rowId_`),
  UNIQUE KEY `IX_D27B03E7` (`tableId`,`columnId`,`classPK`),
  KEY `IX_B29FEF17` (`classNameId`,`classPK`),
  KEY `IX_F7DD0987` (`columnId`),
  KEY `IX_9112A7A0` (`rowId_`),
  KEY `IX_F0566A77` (`tableId`),
  KEY `IX_1BD3F4C` (`tableId`,`classPK`),
  KEY `IX_CA9AFB7C` (`tableId`,`columnId`),
  KEY `IX_B71E92D5` (`tableId`,`rowId_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expandovalue`
--

LOCK TABLES `expandovalue` WRITE;
/*!40000 ALTER TABLE `expandovalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `expandovalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_`
--

DROP TABLE IF EXISTS `group_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `groupId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `creatorUserId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `parentGroupId` bigint(20) DEFAULT NULL,
  `liveGroupId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `typeSettings` longtext,
  `manualMembership` tinyint(4) DEFAULT NULL,
  `membershipRestriction` int(11) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `site` tinyint(4) DEFAULT NULL,
  `remoteStagingGroupCount` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `IX_D0D5E397` (`companyId`,`classNameId`,`classPK`),
  UNIQUE KEY `IX_5DE0BE11` (`companyId`,`classNameId`,`liveGroupId`,`name`),
  UNIQUE KEY `IX_5BDDB872` (`companyId`,`friendlyURL`),
  UNIQUE KEY `IX_BBCA55B` (`companyId`,`liveGroupId`,`name`),
  UNIQUE KEY `IX_5AA68501` (`companyId`,`name`),
  UNIQUE KEY `IX_754FBB1C` (`uuid_`,`groupId`),
  KEY `IX_ABA5CEC2` (`companyId`),
  KEY `IX_B584B5CC` (`companyId`,`classNameId`),
  KEY `IX_ABE2D54` (`companyId`,`classNameId`,`parentGroupId`),
  KEY `IX_5D75499E` (`companyId`,`parentGroupId`),
  KEY `IX_6C499099` (`companyId`,`parentGroupId`,`site`),
  KEY `IX_63A2AABD` (`companyId`,`site`),
  KEY `IX_16218A38` (`liveGroupId`),
  KEY `IX_7B590A7A` (`type_`,`active_`),
  KEY `IX_F981514E` (`uuid_`),
  KEY `IX_26CC761A` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_`
--

LOCK TABLES `group_` WRITE;
/*!40000 ALTER TABLE `group_` DISABLE KEYS */;
INSERT INTO `group_` VALUES ('c59d917f-ffd7-46eb-996c-766ce8274136',20173,20155,20159,20001,20173,0,0,'/20173/','Control Panel','',3,'',1,0,'/control_panel',0,0,1),('f1fc8aaf-7745-4971-8e91-8eaa1fb75c80',20182,20155,20159,20001,20182,0,0,'/20182/','Guest','',1,'mergeGuestPublicPages=false\n',1,0,'/guest',1,0,1),('3906dade-601b-4e57-b19e-19ed49abee0f',20192,20155,20159,20191,20159,0,0,'/20192/','User Personal Site','',3,'',1,0,'/personal_site',0,0,1),('fd9ac1ff-860e-4187-b85f-97acdef19636',20195,20155,20159,20025,20155,0,0,'/20195/','20155','',0,'',1,0,'/global',1,0,1),('826679d9-6aba-40be-9199-310015793a97',20201,20155,20199,20005,20199,0,0,'/20201/','20199','',0,'',1,0,'/test',0,0,1),('e5dd339e-40b4-4aa3-a601-f84f05e4fde2',20317,20155,20159,20032,20316,0,0,'/20317/','20316','',0,'',1,0,'/template-20316',0,0,1),('58340ed0-4132-4f6e-a2ac-e5716de59d4f',20329,20155,20159,20032,20328,0,0,'/20329/','20328','',0,'',1,0,'/template-20328',0,0,1),('f9291bee-3cf5-4977-8a03-5d4f9dbf2ed5',20339,20155,20159,20032,20338,0,0,'/20339/','20338','',0,'',1,0,'/template-20338',0,0,1),('f5e2f419-deb0-4cf5-a0c6-df7fa398c26d',20350,20155,20159,20036,20349,0,0,'/20350/','20349','',0,'',1,0,'/template-20349',0,0,1),('e548c7a7-5ea5-4749-8666-c2b768c9dbca',20376,20155,20159,20036,20375,0,0,'/20376/','20375','',0,'',1,0,'/template-20375',0,0,1),('b62adfa7-3327-4bdc-892c-08e790216898',20620,20155,20159,20036,20619,0,0,'/20620/','20619','',0,'',1,0,'/template-20619',0,0,1),('632d7cd1-53ce-49a7-8c2a-a7afd87e5356',21104,20155,20159,20036,21103,0,0,'/21104/','21103','',0,'',1,0,'/template-21103',0,0,1),('3c4c26a2-32a9-4773-aedb-35d2ea028ab6',21219,20155,20159,20036,21218,0,0,'/21219/','21218','',0,'',1,0,'/template-21218',0,0,1),('f1e2413d-f872-4c54-8513-fe3155be92f8',24502,20155,20159,20036,24501,0,0,'/24502/','24501','',0,'',1,0,'/template-24501',0,0,1),('270a71a3-4241-439c-bbf4-85b50e7ca569',24802,20155,20159,20036,24801,0,0,'/24802/','24801','',0,'',1,0,'/template-24801',0,0,1),('52c62368-9811-4a60-a5bf-634b5fa79ea0',24855,20155,20159,20036,24854,0,0,'/24855/','24854','',0,'',1,0,'/template-24854',0,0,1),('4c30d7a4-e280-47e5-81fe-fc29c73becdb',25111,20155,20159,20036,25110,0,0,'/25111/','25110','',0,'',1,0,'/template-25110',0,0,1);
/*!40000 ALTER TABLE `group_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_orgs`
--

DROP TABLE IF EXISTS `groups_orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_orgs` (
  `groupId` bigint(20) NOT NULL,
  `organizationId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`organizationId`),
  KEY `IX_75267DCA` (`groupId`),
  KEY `IX_6BBB7682` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_orgs`
--

LOCK TABLES `groups_orgs` WRITE;
/*!40000 ALTER TABLE `groups_orgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_orgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_roles`
--

DROP TABLE IF EXISTS `groups_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_roles` (
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`roleId`),
  KEY `IX_84471FD2` (`groupId`),
  KEY `IX_3103EF3D` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_roles`
--

LOCK TABLES `groups_roles` WRITE;
/*!40000 ALTER TABLE `groups_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_usergroups`
--

DROP TABLE IF EXISTS `groups_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_usergroups` (
  `groupId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`userGroupId`),
  KEY `IX_31FB749A` (`groupId`),
  KEY `IX_3B69160F` (`userGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_usergroups`
--

LOCK TABLES `groups_usergroups` WRITE;
/*!40000 ALTER TABLE `groups_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `imageId` bigint(20) NOT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `size_` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `IX_6A925A4D` (`size_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (21011,'2016-10-05 15:16:47','png',60,372,5822);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalarticle`
--

DROP TABLE IF EXISTS `journalarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalarticle` (
  `uuid_` varchar(75) DEFAULT NULL,
  `id_` bigint(20) NOT NULL,
  `resourcePrimKey` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `articleId` varchar(75) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `title` longtext,
  `urlTitle` varchar(150) DEFAULT NULL,
  `description` longtext,
  `content` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `structureId` varchar(75) DEFAULT NULL,
  `templateId` varchar(75) DEFAULT NULL,
  `layoutUuid` varchar(75) DEFAULT NULL,
  `displayDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `reviewDate` datetime DEFAULT NULL,
  `indexable` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_85C52EEC` (`groupId`,`articleId`,`version`),
  UNIQUE KEY `IX_3463D95B` (`uuid_`,`groupId`),
  KEY `IX_FF0E7A72` (`classNameId`,`templateId`),
  KEY `IX_DFF98523` (`companyId`),
  KEY `IX_323DF109` (`companyId`,`status`),
  KEY `IX_3D070845` (`companyId`,`version`),
  KEY `IX_E82F322B` (`companyId`,`version`,`status`),
  KEY `IX_EA05E9E1` (`displayDate`,`status`),
  KEY `IX_9356F865` (`groupId`),
  KEY `IX_68C0F69C` (`groupId`,`articleId`),
  KEY `IX_4D5CD982` (`groupId`,`articleId`,`status`),
  KEY `IX_9CE6E0FA` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_A2534AC2` (`groupId`,`classNameId`,`layoutUuid`),
  KEY `IX_91E78C35` (`groupId`,`classNameId`,`structureId`),
  KEY `IX_F43B9FF2` (`groupId`,`classNameId`,`templateId`),
  KEY `IX_5CD17502` (`groupId`,`folderId`),
  KEY `IX_F35391E8` (`groupId`,`folderId`,`status`),
  KEY `IX_3C028C1E` (`groupId`,`layoutUuid`),
  KEY `IX_301D024B` (`groupId`,`status`),
  KEY `IX_2E207659` (`groupId`,`structureId`),
  KEY `IX_8DEAE14E` (`groupId`,`templateId`),
  KEY `IX_22882D02` (`groupId`,`urlTitle`),
  KEY `IX_D2D249E8` (`groupId`,`urlTitle`,`status`),
  KEY `IX_D19C1B9F` (`groupId`,`userId`),
  KEY `IX_43A0F80F` (`groupId`,`userId`,`classNameId`),
  KEY `IX_3F1EA19E` (`layoutUuid`),
  KEY `IX_33F49D16` (`resourcePrimKey`),
  KEY `IX_89FF8B06` (`resourcePrimKey`,`indexable`),
  KEY `IX_451D63EC` (`resourcePrimKey`,`indexable`,`status`),
  KEY `IX_3E2765FC` (`resourcePrimKey`,`status`),
  KEY `IX_EF9B7028` (`smallImageId`),
  KEY `IX_8E8710D9` (`structureId`),
  KEY `IX_9106F6CE` (`templateId`),
  KEY `IX_F029602F` (`uuid_`),
  KEY `IX_71520099` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalarticle`
--

LOCK TABLES `journalarticle` WRITE;
/*!40000 ALTER TABLE `journalarticle` DISABLE KEYS */;
INSERT INTO `journalarticle` VALUES ('740ea720-7802-432b-8d05-779ba00360e4',23003,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-27 23:55:52',0,0,0,'/0/','23002',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"one-page.html\">О КОМПАНИИ</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">ПРОЕКТЫ</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">УСЛУГИ</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">НОВОСТИ</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">ДОКУМЕНТАЦИЯ</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"#\">КОНТАКТЫ</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>О компании</h1>\n				<p>...</p>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>КОМАНДА</h1>\n				<p>...</p>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,1,0,23005,'',0,20199,'Test Test','2016-10-27 23:55:52'),('d7a5f43e-6aa0-4a93-89a1-0723b116b414',23025,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 00:13:12',0,0,0,'/0/','23002',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"one-page.html\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"#\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Company library</h1>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Lorem ipsum</h1>\n			</div>\n		</div>\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<runtime-portlet instance=\"\" name=\"library_WAR_tiislibraryportlet\" querystring=\"\"> </runtime-portlet>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 00:13:12'),('f056aba6-0d54-4ccf-ae3e-4081d05fa7db',23039,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 00:16:17',0,0,0,'/0/','23002',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"one-page.html\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"#\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Company library</h1>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Lorem ipsum</h1>\n			</div>\n		</div>\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<runtime-portlet instance=\"SwNhPcCyFOrD\" name=\"library_WAR_tiislibraryportlet\" querystring=\"\"> </runtime-portlet>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 00:16:17'),('d5d7c46a-4f6b-4298-97f4-e0e48e9b544f',23044,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 00:17:49',0,0,0,'/0/','23002',1.3,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"one-page.html\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"#\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Company library</h1>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Lorem ipsum</h1>\n			</div>\n		</div>\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<!-- <runtime-portlet instance=\"SwNhPcCyFOrD\" name=\"library_WAR_tiislibraryportlet\" querystring=\"\"> </runtime-portlet>  -->\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 00:17:49'),('755d9f0a-41b7-4793-83a0-42c5b924b630',23048,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 00:23:58',0,0,0,'/0/','23002',1.4,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"one-page.html\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"#\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Company library</h1>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Lorem ipsum</h1>\n			</div>\n		</div>\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<!-- <runtime-portlet instance=\"SwNhPcCyFOrD\" name=\"library_WAR_tiislibraryportlet\" querystring=\"\"> </runtime-portlet>  -->\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 00:23:58'),('6cac2fd3-fc24-4159-91d3-9b9d36d60fb9',23052,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 00:24:49',0,0,0,'/0/','23002',1.5,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"one-page.html\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"slider.html\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"#\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Company library</h1>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Lorem ipsum</h1>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 00:24:49'),('739669ac-4342-4d42-8d6a-9fd581b39abd',23101,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 20:53:19',0,0,0,'/0/','23002',1.6,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/catalog\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/tests\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/news\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/document\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"#\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"/c/portal/login\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Company library</h1>\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n				<h1>Lorem ipsum</h1>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 20:53:19'),('afcc2879-a8de-40e3-a963-ae2e0d6412db',23201,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-28 21:02:03',0,0,0,'/0/','23002',1.7,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<header class=\"navbar navbar--sticky \" >\n    <div class=\"navbar__wrapper\">\n        <div class=\"container top-menu\">\n\n                <div class=\"col-md-3 navbar__column navbar__brand\">\n                	<span class=\"brand__logo\">\n                		<a href=\"#\"><img class=\"navbar__brand-img\" src=\"/tiis-main-page-theme/images/logo/logo.png\" alt=\"ТИИС\"></a>\n                	</span>\n                </div>\n\n\n                <div class=\"col-md-9 navbar__column navbar__menu\">\n                   	<label for=\"topmenu\" class=\"navbar__hamburger hamburger text-white\"><span class=\"hamburger__line\"></span></label>\n                   	<input type=\"checkbox\" id=\"topmenu\">\n                    <nav class=\"navbar__menu-box\">\n                        <div class=\"col-md-10 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-decorator\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/catalog\">BOOKS</a>\n								</li>\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/tests\">TESTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/news\">NEWS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"/document\">DOCUMENTS</a>\n								</li>								\n								<li class=\"navbar__item\">\n									<a class=\"buttons__link btn text-white\" href=\"#\">SOMETHING</a>\n								</li>																					\n							</ul>\n                        </div>\n                        <div class=\"col-md-2 navbar__column\">\n							<ul class=\"navbar__items navbar__items--right btn-inverse\">\n								<li class=\"navbar__item\">\n									<a class=\"buttons__btn btn btn-default\" href=\"/c/portal/login\">MY ACCOUNT</a>\n								</li>\n							</ul>\n                        </div>\n                    </nav>\n                </div>\n\n\n        </div>\n    </div>\n\n</header>\n<div id=\"main-wrapper\">\n	<section class=\"section section_one\">\n		<div class=\"slide\">\n			<div class=\"container\">			\n			</div>\n		</div>		\n		<div class=\"slide\">\n			<div class=\"container\">			\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_two\">\n		<div class=\"container\">\n			<div class=\"main-advantage\">\n				<div class=\"row\">\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>					\n					<div class=\"col-md-3\">\n						<div class=\"image-box\">\n							<div class=\"image-box__image\">\n								<i class=\"glyphicon glyphicon-globe\"></i>\n							</div>							\n							<div class=\"image-box__title\">\n								<a href=\"#\">Разумная ценовая политика</a>\n							</div>\n						</div>						\n					</div>\n				</div>\n			</div>\n		</div>\n		<div class=\"row\">\n			<div class=\"main-gallery\">\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n				<div class=\"main-gallery__item col-md-4\">\n					<div class=\"main-gallery__description\">\n						text\n					</div>\n				</div>\n			</div>\n		</div>\n	</section>\n	<section class=\"section section_three\">\n		<div class=\"container\">\n			<div class=\"main-contacts\">\n				<h2>Контакты</h2>\n				<div class=\"row\">\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n					<div class=\"infoblock col-md-6\">\n						<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n						<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж </p>\n						<p>Тел./факс. +7(3452) 684142 факс. доб 0. </p>\n						<p>Email: mail@tiis.pro</p>\n					</div>\n				</div>\n				\n			</div>\n		</div>\n	</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2016-10-28 21:02:03'),('eb2971be-f928-4ca0-9245-77858110c241',24934,24935,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,0,0,'/0/','TEXT-LINK-IMAGE-SLIDER',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">text-link-image-slider</Title></root>','text-link-image-slider','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"ON2Bu9Ie\" name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[600]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"p1TgHLMl\" name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"hpxrUwr8\" name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"40mJ1UMb\" name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"sBgqL2fS\" name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"TktfZ4ue\" name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"6IeUZqPZ\" name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"rR54sU5M\" name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[fade]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"2Yyb0jzq\" name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[horizontal]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Z4uDKsJe\" name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Ip6fx3id\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"YZ30reTU\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"VsjSlQa7\" name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/900_350/e1a093d1-f5af-473a-ba52-9513c19a8b10?version=1.0&t=1479754873457]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"DmwoYWd8\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"oxW2xYM9\" name=\"button-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"r6zUyOb6\" name=\"button-caption\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Buy Pixelpress]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Cinema , Documentary , Photography ]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"t5wlwoEm\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"GeLUxZgm\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"OAOivXwm\" name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/900_350/e1a093d1-f5af-473a-ba52-9513c19a8b10?version=1.0&t=1479754873457]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"XUtdPwPm\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"oPgXWBbm\" name=\"button-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"627KBp4m\" name=\"button-caption\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Buy This Theme]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[And More]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"t5wlwoEN\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"GeLUxZg7\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"OAOivXwq\" name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/900_350/e1a093d1-f5af-473a-ba52-9513c19a8b10?version=1.0&t=1479754873457]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"XUtdPwPS\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"oPgXWBbq\" name=\"button-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"627KBp4J\" name=\"button-caption\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Buy This Theme]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Perfection]]></dynamic-content>\n	</dynamic-element>\n</root>','general','TEXT-LINK-IMAGE-SLIDER-6.2.0.0','TEXT-LINK-IMAGE-SLIDER-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,24941,'',0,20159,'','2016-11-21 19:01:14'),('a1c695fa-b282-4893-b563-df86afbf59c5',24966,24967,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,0,0,'/0/','SKINS',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">skins</Title></root>','skins','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"H0rarIPa\" name=\"feature\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[5 Color Schemes]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0owmagb\" name=\"abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Pixelpress offer 5 diffrent Color Schemes.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"HrowmaPc\" name=\"icone\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[/documents/24855/0/64_64/7c3abf7b-91d1-47e1-adba-53530fe30e31?version=1.0&t=1479754871832]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0owrbad\" name=\"feature-link\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n</root>','general','FEATURES-6.2.0.0','FEATURES-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,24968,'',0,20159,'','2016-11-21 19:01:14'),('be0f8c57-7386-477f-9f24-ad0294c51343',24975,24976,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,0,0,'/0/','RESPONSIVE-LAYOUT',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">responsive-layout</Title></root>','responsive-layout','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"H0owsIPa\" name=\"feature\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Responsive Design]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0owsIPb\" name=\"abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Pixelpress is designed with the Liferay responsive design technologies to fit the principal mobile devices resolution.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0owsIPc\" name=\"icone\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[/documents/24855/0/64_64/7c3abf7b-91d1-47e1-adba-53530fe30e31?version=1.0&t=1479754871832]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0owsIPd\" name=\"feature-link\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n</root>','general','FEATURES-6.2.0.0','FEATURES-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,24977,'',0,20159,'','2016-11-21 19:01:14'),('766ee4dd-73bf-44b3-8895-acf4a269ede8',24985,24986,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,0,0,'/0/','CUSTOM-PORTLETS',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">custom-portlets</Title></root>','custom-portlets','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"H08arIPa\" name=\"feature\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Adapted portlets]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0owma8b\" name=\"abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Pixelpress adapt the styles of the most used liferay port lets to fit its styles.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Hrowma8c\" name=\"icone\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[/documents/24855/0/64_64/7c3abf7b-91d1-47e1-adba-53530fe30e31?version=1.0&t=1479754871832]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"H0ow8bad\" name=\"feature-link\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n</root>','general','FEATURES-6.2.0.0','FEATURES-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,24987,'',0,20159,'','2016-11-21 19:01:14'),('7f776e41-cd4b-4867-af14-d5ab39c17cd0',25000,25001,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',0,0,0,'/0/','FOOTER-LINKS',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Footer Links</Title></root>','footer-links','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"umMah2Cu\" name=\"title\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Footer Links]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"RRsHqYC8\" name=\"footer-links\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"0taWbQYJ\" name=\"url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[#]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Link 1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"zDZxljs0\" name=\"footer-links\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"xYz2736x\" name=\"url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[#]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Link 2]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"XW4ePqv5\" name=\"footer-links\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"IDDC7b0Y\" name=\"url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[#]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Link 3]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"ehen0mXb\" name=\"footer-links\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"APqM5EaX\" name=\"url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[#]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Link 4]]></dynamic-content>\n	</dynamic-element>\n</root>','general','FOOTER-LINKS-6.2.0.0','FOOTER-LINKS-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,25002,'',0,20159,'','2016-11-21 19:01:15'),('442bfb10-085e-4fbb-b943-80a9a0b00cdc',25011,25012,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,0,0,'/0/','PORTFOLIO',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">portfolio</Title></root>','portfolio','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"wXIPb4lc\" name=\"portofolio-title\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Portfolio]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"5aTjL31P\" name=\"portofolio-description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[This is where your portfolio items will show up. You can change this text in the options.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"TWwqXZK4\" name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"WPUGFl83\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"qM93wG7O\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"35FYhPuk\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Sunset]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"KMdxQ7lt\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image0]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"WPUGfl83\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"qM9fwG7O\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"35FYfPuk\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Sunset]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"KMdxf7lt\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image10]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Cinema]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"e5IqJzMa\" name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"K6BKEeDG\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"fWmsmqVg\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"gFgjGPM9\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Cityscapes]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"7Bx4eW6E\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image1]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"5IWdYQVv\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"lWoiAlu2\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"09jgm4qT\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Travel]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"6aNU65Cb\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image 2]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Documentary]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"5JtiBHAi\" name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"cKnCIOvO\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"h7CjaTki\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"6Bu0KRqc\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Desert]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"vOJXBOq9\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image1]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"u9vMtmOQ\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"tASXVQ2X\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"mgOjsHkA\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Random Images]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"zV1PU6sB\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image 2]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"jtd8CKX5\" name=\"images\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"KAfzsTLQ\" name=\"image-source\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[/documents/24855/0/197_203/8ccbafbd-7799-4fb8-8790-c58c4647d821?version=1.0&t=1479754872601]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"jwf31hCe\" name=\"image-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[Single Image]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-element instance-id=\"GDvhKN8i\" name=\"link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[#]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[image 3]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Photography]]></dynamic-content>\n	</dynamic-element>\n</root>','general','PORTFOLIO-6.2.0.0','PORTFOLIO-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,25013,'',0,20159,'','2016-11-21 19:01:15'),('c3f2beec-d4dc-4e09-877d-df43da428dcf',25022,25023,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,0,0,'/0/','MINI-PORTOFOLIO',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">mini-portofolio</Title></root>','mini-portofolio','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"4TCOc6Fq\" name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[600]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"kl21srlD\" name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[500]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"4LDkOlhS\" name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"jkObPS1R\" name=\"item-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Y0XJtsZx\" name=\"max-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"2hBlbgfY\" name=\"moved-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"WxUKs93G\" name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"1nB826Hy\" name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"L2wl1H2D\" name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"LI0ak8Bt\" name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Tn0EKbEf\" name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[slide]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"E7aWuFp7\" name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[horizontal]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Z4uDKsJe\" name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"jOi3SjMI\" name=\"section-title\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Mini portfolio]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"2K1bKSJh\" name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"MVaZYD1R\" name=\"section-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[section 1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"DPrjVh1D\" name=\"sections\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"zFiw8gib\" name=\"section-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[section 2]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"3S5ci8ye\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"EEWxtr6W\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/210_150/eb0e6c25-927a-44f3-a610-b6085c1f47de?version=1.0&t=1479754873369]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"vpt3NbVb\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"FG9qvuVm\" name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[camera]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"xvmuKv9W\" name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"uEEMcRG7\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"OzXgsASc\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"MKlyxX6t\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/210_150/eb0e6c25-927a-44f3-a610-b6085c1f47de?version=1.0&t=1479754873369]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"K4yWxFYU\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"95HROyZe\" name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Camera man]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"ee1hQsOV\" name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"IJtJWtf7\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 2]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"HskOx7nJ\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"tzm22Ajy\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/210_150/eb0e6c25-927a-44f3-a610-b6085c1f47de?version=1.0&t=1479754873369]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"AS3sFA50\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"yC7TJEik\" name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[photography]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"V1lvWCOJ\" name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"waHwDfPl\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 3]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"888odcuY\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"rRvFZuFD\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/210_150/eb0e6c25-927a-44f3-a610-b6085c1f47de?version=1.0&t=1479754873369]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"gKv8R2fV\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"BokOCHwt\" name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[production]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"sykhyJoR\" name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"HkblXcMK\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 4]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"sjqxFmCU\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"3MTF9kWu\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/210_150/eb0e6c25-927a-44f3-a610-b6085c1f47de?version=1.0&t=1479754873369]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"K2KrS1o9\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"WKtD5OFP\" name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Documentary]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"yVLFtDRi\" name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"ykd5XxJV\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 5]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"OpnIFzJO\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"qtLylkZc\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/210_150/eb0e6c25-927a-44f3-a610-b6085c1f47de?version=1.0&t=1479754873369]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"GbwyyKgk\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"kyNqSTMW\" name=\"title-text\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[zoom]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"NTyJ2i68\" name=\"title-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"LMY1nJmG\" name=\"description\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 6]]></dynamic-content>\n	</dynamic-element>\n</root>','general','MINI-PORTOFOLIO-6.2.0.0','MINI-PORTOFOLIO-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,25024,'',0,20159,'','2016-11-21 19:01:15'),('5e7cdea9-e4ec-42e7-a0be-0de32c68f2fd',25033,25034,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,0,0,'/0/','CAROUSEL',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">carousel</Title></root>','carousel','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"zG8uM6bN\" name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[600]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"DtL9LMJ6\" name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[500]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"iMi7qY6X\" name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"bEATM56E\" name=\"item-width\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"bfP2ES6O\" name=\"max-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Dv32E299\" name=\"moved-items\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"g0bsg6DY\" name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"R9omA9zE\" name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"2YqlDY9K\" name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"wFAejU9h\" name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Ukk9OD9T\" name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[fade]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"PqYo7J9c\" name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[horizontal]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"iOBAyB94\" name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"6gW7Hb9N\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"KYNzQz96\" name=\"pager-abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipisicing elit,]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"kQ4lh95M\" name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"IP2s1PKI\" name=\"image-height\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[338]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[/documents/24855/0/900_350/e1a093d1-f5af-473a-ba52-9513c19a8b10?version=1.0&t=1479754873457]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"ix77V9sC\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Accounts]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"dQjeidp9\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"a8dJUx9g\" name=\"pager-abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet,]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"pQInyS9T\" name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"IP2y1PKI\" name=\"image-height\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[338]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[/documents/24855/0/900_350/e1a093d1-f5af-473a-ba52-9513c19a8b10?version=1.0&t=1479754873457]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"ix77V9iC\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Cash Management]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"4JHzgL9h\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"5XiR9JxJ\" name=\"pager-abstract\" type=\"textarea\" dataType=\"string\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet,]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"8Xjp9Lq3\" name=\"image\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-element instance-id=\"IP2s2PKI\" name=\"image-height\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n				<dynamic-content><![CDATA[338]]></dynamic-content>\n			</dynamic-element>\n			<dynamic-content><![CDATA[/documents/24855/0/900_350/e1a093d1-f5af-473a-ba52-9513c19a8b10?version=1.0&t=1479754873457]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"ix7WV9iC\" name=\"image-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Finance]]></dynamic-content>\n	</dynamic-element>\n</root>','general','CAROUSEL-6.2.0.0','CAROUSEL-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,25035,'',0,20159,'','2016-11-21 19:01:15'),('5b3d08b2-aeeb-422d-bbf8-7683c5135963',25044,25045,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,0,0,'/0/','TESTIMONIALS',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">testimonials</Title></root>','testimonials','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"ON2Bu9Ie\" name=\"animation-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[600]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"p1TgHLMl\" name=\"slideshow-speed\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"hpxrUwr8\" name=\"auto-slideshow\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"40mJ1UMb\" name=\"direction-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"sBgqL2fS\" name=\"control-nav\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"TktfZ4ue\" name=\"animation-loop\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"6IeUZqPZ\" name=\"pause-on-hover\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"rR54sU5M\" name=\"animation-type\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[slide]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"2Yyb0jzq\" name=\"sliding-direction\" type=\"select\" dataType=\"string\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[horizontal]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"Z4uDKsJe\" name=\"manual-controls\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"56hCIjdM\" name=\"section-title\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Testimonials]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qa8F8dLb\" name=\"section-description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[What are valued clients saying about us]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"8BpZtdjU\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"idGhdz8p\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/avatar1/855d87ca-c560-451d-971c-ddafbdb7ab48?version=1.0&t=1479754872530]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"Ed5NV9jU\" name=\"author-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Some guy]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"FdntYc0Z\" name=\"site\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[My site]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"xd1RfqY6\" name=\"site-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[http://www.me.com/]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"4dnplJig\" name=\"description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"uS9ZjdPO\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"xde4kivV\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/avatar2/a674a96d-fb2e-45de-acd3-66111c31eb5d?version=1.0&t=1479754872703]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"jdCfczjB\" name=\"author-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[That person]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"MdRfB5Th\" name=\"site\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[http://www.avatar.com]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"hdIpLrqi\" name=\"site-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[http://www.avatar.com]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"IdB5f2at\" name=\"description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[This is my testimonial about that theme]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 2]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"iadkpdqH\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"9dljPZy9\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/avatar3/4d6bc0b3-950a-4b05-8c26-6f0f4f1631dc?version=1.0&t=1479754872822]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"GdQteXRM\" name=\"author-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Mr person]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"CdXCpQax\" name=\"site\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[this site]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"RduSYx0D\" name=\"site-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[#]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"VdY4SsDZ\" name=\"description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 3]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"dYPSmd3j\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"WNrVtbep\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/avatar1/855d87ca-c560-451d-971c-ddafbdb7ab48?version=1.0&t=1479754872530]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"8dFJDk2h\" name=\"author-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Flena Foulaniya]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"Qd03wgx8\" name=\"site\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[www.dummyurl.com]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"Xd7ojxzH\" name=\"site-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Jeffikus]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"KdvJQPny\" name=\"description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 4]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"6HopLdyG\" name=\"slides\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-element instance-id=\"FdLTZuPD\" name=\"image-source\" type=\"wcm-image\" dataType=\"image\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[/documents/24855/0/avatar1/855d87ca-c560-451d-971c-ddafbdb7ab48?version=1.0&t=1479754872530]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"tdjeGVu0\" name=\"author-name\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Flen Foulani]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"wdWFKzf5\" name=\"site\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[My site]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"ZdptDx65\" name=\"site-link\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[http://site.com/]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"7dy9nFlm\" name=\"description\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[slid 5]]></dynamic-content>\n	</dynamic-element>\n</root>','general','TESTIMONIALS-6.2.0.0','TESTIMONIALS-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,25046,'',0,20159,'','2016-11-21 19:01:15'),('ba5da147-f8f1-4cf7-8899-3fd5e4742707',25055,25056,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',0,0,0,'/0/','FOOTER-SOCIAL',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Footer Social</Title></root>','footer-social','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"rf6JrNjG\" name=\"facebook\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"3jreHw0n\" name=\"fb-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"rf6JrN87\" name=\"google-plus\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"3jreRw08\" name=\"gp-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"GCq0Nd6u\" name=\"twitter\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"95GYntgE\" name=\"tw-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"zaaxn0TT\" name=\"linkedin\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"SaH9kkn6\" name=\"li-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"vLWN9Y7W\" name=\"rss\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"zQ3zOuc9\" name=\"rs-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qOcV2OFb\" name=\"youtube\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"x2ed2lJ3\" name=\"yu-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qOcV2Oyb\" name=\"vimeo\" dataType=\"boolean\" type=\"checkbox\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"x2ed2lp3\" name=\"vi-url-location\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[#]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"5ByhMfQG\" name=\"title\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Stay Updated]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"ClMr3Ooh\" name=\"tagline\" dataType=\"string\" type=\"text\" indexType=\"keyword\">\n		<dynamic-content><![CDATA[Subscribe and follow us]]></dynamic-content>\n	</dynamic-element>\n</root>','general','FOOTER-SOCIAL-6.2.0.0','FOOTER-SOCIAL-6.2.0.0','','2010-01-31 21:00:00',NULL,NULL,1,0,25057,'',0,20159,'','2016-11-21 19:01:15'),('2aa23d83-75a7-4670-b095-c9e6df36d765',26601,23004,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2017-02-24 23:12:55',0,0,0,'/0/','23002',1.8,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"ru_RU\" default-locale=\"ru_RU\"><Title language-id=\"ru_RU\">Главная страница</Title></root>','glavnaa-stranica','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"ru_RU\" default-locale=\"ru_RU\">\n	<static-content language-id=\"ru_RU\"><![CDATA[<div id=\"main-wrapper\">\n<section class=\"section section_one\">\n<div class=\"slide\">\n<div class=\"container\">&nbsp;</div>\n</div>\n\n<div class=\"slide\">\n<div class=\"container\">&nbsp;</div>\n</div>\n</section>\n\n<section class=\"section section_two\">\n<div class=\"container\">\n<div class=\"main-advantage\">\n<div class=\"row\">\n<div class=\"col-md-3\">\n<div class=\"image-box\">\n<div class=\"image-box__image\">&nbsp;</div>\n\n<div class=\"image-box__title\"><a href=\"#\">Разумная ценовая политика</a></div>\n</div>\n</div>\n\n<div class=\"col-md-3\">\n<div class=\"image-box\">\n<div class=\"image-box__image\">&nbsp;</div>\n\n<div class=\"image-box__title\"><a href=\"#\">Разумная ценовая политика</a></div>\n</div>\n</div>\n\n<div class=\"col-md-3\">\n<div class=\"image-box\">\n<div class=\"image-box__image\">&nbsp;</div>\n\n<div class=\"image-box__title\"><a href=\"#\">Разумная ценовая политика</a></div>\n</div>\n</div>\n\n<div class=\"col-md-3\">\n<div class=\"image-box\">\n<div class=\"image-box__image\">&nbsp;</div>\n\n<div class=\"image-box__title\"><a href=\"#\">Разумная ценовая политика</a></div>\n</div>\n</div>\n</div>\n</div>\n</div>\n\n<div class=\"row\">\n<div class=\"main-gallery\">\n<div class=\"main-gallery__item col-md-4\">\n<div class=\"main-gallery__description\">text</div>\n</div>\n\n<div class=\"main-gallery__item col-md-4\">\n<div class=\"main-gallery__description\">text</div>\n</div>\n\n<div class=\"main-gallery__item col-md-4\">\n<div class=\"main-gallery__description\">text</div>\n</div>\n</div>\n</div>\n</section>\n\n<section class=\"section section_three\">\n<div class=\"container\">\n<div class=\"main-contacts\">\n<h2>Контакты</h2>\n\n<div class=\"row\">\n<div class=\"infoblock col-md-6\">\n<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n\n<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж</p>\n\n<p>Тел./факс. +7(3452) 684142 факс. доб 0.</p>\n\n<p>Email: mail@tiis.pro</p>\n</div>\n\n<div class=\"infoblock col-md-6\">\n<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n\n<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж</p>\n\n<p>Тел./факс. +7(3452) 684142 факс. доб 0.</p>\n\n<p>Email: mail@tiis.pro</p>\n</div>\n\n<div class=\"infoblock col-md-6\">\n<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n\n<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж</p>\n\n<p>Тел./факс. +7(3452) 684142 факс. доб 0.</p>\n\n<p>Email: mail@tiis.pro</p>\n</div>\n\n<div class=\"infoblock col-md-6\">\n<h3>АДМИНИСТРАТИВНЫЙ ОФИС</h3>\n\n<p>ООО «ТИИС «Инновация», 625003, г. Тюмень, ул.Кирова, 40, 5 этаж</p>\n\n<p>Тел./факс. +7(3452) 684142 факс. доб 0.</p>\n\n<p>Email: mail@tiis.pro</p>\n</div>\n</div>\n</div>\n</div>\n</section>\n</div>\n<script>\n	$(document).ready(function() {\n    $(\'#main-wrapper\').fullpage({\n		        //Custom selectors\n        sectionSelector: \'section\',\n        slideSelector: \'.slide\',\n	});\n});\n</script>]]></static-content>\n</root>','general','','','','2016-10-27 23:55:00',NULL,NULL,0,0,0,'',0,20199,'Test Test','2017-02-24 23:12:56');
/*!40000 ALTER TABLE `journalarticle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalarticleimage`
--

DROP TABLE IF EXISTS `journalarticleimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalarticleimage` (
  `articleImageId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `elInstanceId` varchar(75) DEFAULT NULL,
  `elName` varchar(75) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `tempImage` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`articleImageId`),
  UNIQUE KEY `IX_103D6207` (`groupId`,`articleId`,`version`,`elInstanceId`,`elName`,`languageId`),
  KEY `IX_3B51BB68` (`groupId`),
  KEY `IX_158B526F` (`groupId`,`articleId`,`version`),
  KEY `IX_D4121315` (`tempImage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalarticleimage`
--

LOCK TABLES `journalarticleimage` WRITE;
/*!40000 ALTER TABLE `journalarticleimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `journalarticleimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalarticleresource`
--

DROP TABLE IF EXISTS `journalarticleresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalarticleresource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `resourcePrimKey` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`resourcePrimKey`),
  UNIQUE KEY `IX_88DF994A` (`groupId`,`articleId`),
  UNIQUE KEY `IX_84AB0309` (`uuid_`,`groupId`),
  KEY `IX_F8433677` (`groupId`),
  KEY `IX_DCD1FAC1` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalarticleresource`
--

LOCK TABLES `journalarticleresource` WRITE;
/*!40000 ALTER TABLE `journalarticleresource` DISABLE KEYS */;
INSERT INTO `journalarticleresource` VALUES ('e6b93c2c-ab89-4835-9f9a-f03484ce1d01',23004,20182,'23002'),('46f24818-e7fe-49d1-9d34-6bd76dd7749d',24935,24855,'TEXT-LINK-IMAGE-SLIDER'),('86ff5a9d-08bb-4fe1-8aed-fc6dd008ea76',24967,24855,'SKINS'),('9ffab629-96f8-435c-9ba2-b41c0de1b52e',24976,24855,'RESPONSIVE-LAYOUT'),('11e4868f-1dd9-4263-937e-a4a955097391',24986,24855,'CUSTOM-PORTLETS'),('4427f2a1-9ee0-4cf3-b52a-bce56e8ec664',25001,24855,'FOOTER-LINKS'),('1e68d0a1-6a38-45f1-992b-146e741b50d2',25012,24855,'PORTFOLIO'),('9d706729-06c1-4715-a65d-e382883f7de2',25023,24855,'MINI-PORTOFOLIO'),('8d41af50-aff0-494a-bc52-489d4700013f',25034,24855,'CAROUSEL'),('42ca3eb1-a3bf-4070-880e-7d3f8118a72d',25045,24855,'TESTIMONIALS'),('bac56197-b8b7-4d32-ab12-70b0d0771201',25056,24855,'FOOTER-SOCIAL');
/*!40000 ALTER TABLE `journalarticleresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalcontentsearch`
--

DROP TABLE IF EXISTS `journalcontentsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalcontentsearch` (
  `contentSearchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `layoutId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`contentSearchId`),
  UNIQUE KEY `IX_C3AA93B8` (`groupId`,`privateLayout`,`layoutId`,`portletId`,`articleId`),
  KEY `IX_9207CB31` (`articleId`),
  KEY `IX_6838E427` (`groupId`,`articleId`),
  KEY `IX_20962903` (`groupId`,`privateLayout`),
  KEY `IX_7CC7D73E` (`groupId`,`privateLayout`,`articleId`),
  KEY `IX_B3B318DC` (`groupId`,`privateLayout`,`layoutId`),
  KEY `IX_7ACC74C9` (`groupId`,`privateLayout`,`layoutId`,`portletId`),
  KEY `IX_8DAF8A35` (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalcontentsearch`
--

LOCK TABLES `journalcontentsearch` WRITE;
/*!40000 ALTER TABLE `journalcontentsearch` DISABLE KEYS */;
INSERT INTO `journalcontentsearch` VALUES (23024,20182,20155,0,1,'56_INSTANCE_hxzxircFM6RQ','23002');
/*!40000 ALTER TABLE `journalcontentsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalfeed`
--

DROP TABLE IF EXISTS `journalfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalfeed` (
  `uuid_` varchar(75) DEFAULT NULL,
  `id_` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `feedId` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `structureId` varchar(75) DEFAULT NULL,
  `templateId` varchar(75) DEFAULT NULL,
  `rendererTemplateId` varchar(75) DEFAULT NULL,
  `delta` int(11) DEFAULT NULL,
  `orderByCol` varchar(75) DEFAULT NULL,
  `orderByType` varchar(75) DEFAULT NULL,
  `targetLayoutFriendlyUrl` varchar(255) DEFAULT NULL,
  `targetPortletId` varchar(75) DEFAULT NULL,
  `contentField` varchar(75) DEFAULT NULL,
  `feedFormat` varchar(75) DEFAULT NULL,
  `feedVersion` double DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_65576CBC` (`groupId`,`feedId`),
  UNIQUE KEY `IX_39031F51` (`uuid_`,`groupId`),
  KEY `IX_35A2DB2F` (`groupId`),
  KEY `IX_50C36D79` (`uuid_`),
  KEY `IX_CB37A10F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalfeed`
--

LOCK TABLES `journalfeed` WRITE;
/*!40000 ALTER TABLE `journalfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `journalfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalfolder`
--

DROP TABLE IF EXISTS `journalfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalfolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_65026705` (`groupId`,`parentFolderId`,`name`),
  UNIQUE KEY `IX_E002061` (`uuid_`,`groupId`),
  KEY `IX_E6E2725D` (`companyId`),
  KEY `IX_C36B0443` (`companyId`,`status`),
  KEY `IX_742DEC1F` (`groupId`),
  KEY `IX_E988689E` (`groupId`,`name`),
  KEY `IX_190483C6` (`groupId`,`parentFolderId`),
  KEY `IX_EFD9CAC` (`groupId`,`parentFolderId`,`status`),
  KEY `IX_63BDFA69` (`uuid_`),
  KEY `IX_54F89E1F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalfolder`
--

LOCK TABLES `journalfolder` WRITE;
/*!40000 ALTER TABLE `journalfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `journalfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleoaction`
--

DROP TABLE IF EXISTS `kaleoaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleoaction` (
  `kaleoActionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `executionType` varchar(20) DEFAULT NULL,
  `script` longtext,
  `scriptLanguage` varchar(75) DEFAULT NULL,
  `scriptRequiredContexts` longtext,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`kaleoActionId`),
  KEY `IX_50E9112C` (`companyId`),
  KEY `IX_170EFD7A` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_4B2545E8` (`kaleoClassName`,`kaleoClassPK`,`executionType`),
  KEY `IX_F95A622` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleoaction`
--

LOCK TABLES `kaleoaction` WRITE;
/*!40000 ALTER TABLE `kaleoaction` DISABLE KEYS */;
INSERT INTO `kaleoaction` VALUES (20468,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoNode',20467,20466,'update','reject','','onAssignment','\n					\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"denied\"), workflowContext);\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"pending\"), workflowContext);\n					\n				','javascript','',0),(20473,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoNode',20472,20466,'approved','approve','','onEntry','\n					\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.toStatus(\"approved\"), workflowContext);\n					\n				','groovy','',0);
/*!40000 ALTER TABLE `kaleoaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleocondition`
--

DROP TABLE IF EXISTS `kaleocondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleocondition` (
  `kaleoConditionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `script` longtext,
  `scriptLanguage` varchar(75) DEFAULT NULL,
  `scriptRequiredContexts` longtext,
  PRIMARY KEY (`kaleoConditionId`),
  KEY `IX_FEE46067` (`companyId`),
  KEY `IX_DC978A5D` (`kaleoDefinitionId`),
  KEY `IX_86CBD4C` (`kaleoNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleocondition`
--

LOCK TABLES `kaleocondition` WRITE;
/*!40000 ALTER TABLE `kaleocondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleocondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleodefinition`
--

DROP TABLE IF EXISTS `kaleodefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleodefinition` (
  `kaleoDefinitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `content` longtext,
  `version` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `startKaleoNodeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kaleoDefinitionId`),
  KEY `IX_40B9112F` (`companyId`),
  KEY `IX_408542BA` (`companyId`,`active_`),
  KEY `IX_76C781AE` (`companyId`,`name`),
  KEY `IX_4C23F11B` (`companyId`,`name`,`active_`),
  KEY `IX_EC14F81A` (`companyId`,`name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleodefinition`
--

LOCK TABLES `kaleodefinition` WRITE;
/*!40000 ALTER TABLE `kaleodefinition` DISABLE KEYS */;
INSERT INTO `kaleodefinition` VALUES (20466,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','Single Approver','Single Approver','A single approver can approve a workflow content.','<?xml version=\"1.0\"?>\n\n<workflow-definition xmlns=\"urn:liferay.com:liferay-workflow_6.2.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"urn:liferay.com:liferay-workflow_6.2.0 http://www.liferay.com/dtd/liferay-workflow-definition_6_2_0.xsd\">\n	<name>Single Approver</name>\n	<description>A single approver can approve a workflow content.</description>\n	<version>1</version>\n	<state>\n		<name>created</name>\n		<metadata> <![CDATA[{\"xy\":[36,51]}]]> </metadata>\n		<initial>true</initial>\n		<transitions>\n			<transition>\n				<name>review</name>\n				<target>review</target>\n			</transition>\n		</transitions>\n	</state>\n	<task>\n		<name>update</name>\n		<metadata> <![CDATA[{\"transitions\":{\"resubmit\":{\"bendpoints\":[[303,140]]}},\"xy\":[328,199]}]]> </metadata>\n		<actions>\n			<action>\n				<name>reject</name>\n				<script> <![CDATA[\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"denied\"), workflowContext);\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"pending\"), workflowContext);\n					]]> </script>\n				<script-language>javascript</script-language>\n				<execution-type>onAssignment</execution-type>\n			</action>\n			<notification>\n				<name>Creator Modification Notification</name>\n				<template>Your submission was rejected by ${userName}, please modify and resubmit.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<notification-type>user-notification</notification-type>\n				<execution-type>onAssignment</execution-type>\n			</notification>\n		</actions>\n		<assignments>\n			<user/>\n		</assignments>\n		<transitions>\n			<transition>\n				<name>resubmit</name>\n				<target>review</target>\n			</transition>\n		</transitions>\n	</task>\n	<task>\n		<name>review</name>\n		<metadata> <![CDATA[{\"xy\":[168,36]}]]> </metadata>\n		<actions>\n			<notification>\n				<name>Review Notification</name>\n				<template>${userName} sent you a ${entryType} for review in the workflow.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<notification-type>user-notification</notification-type>\n				<execution-type>onAssignment</execution-type>\n			</notification>\n			<notification>\n				<name>Review Completion Notification</name>\n				<template>Your submission has been reviewed and the reviewer has applied the following ${taskComments}.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<recipients>\n					<user/>\n				</recipients>\n				<execution-type>onExit</execution-type>\n			</notification>\n		</actions>\n		<assignments>\n			<roles>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Administrator</name>\n				</role>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Owner</name>\n				</role>\n				<role>\n					<role-type>regular</role-type>\n					<name>Administrator</name>\n				</role>\n				<role>\n					<role-type>regular</role-type>\n					<name>Portal Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Administrator</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Owner</name>\n				</role>\n			</roles>\n		</assignments>\n		<transitions>\n			<transition>\n				<name>approve</name>\n				<target>approved</target>\n			</transition>\n			<transition>\n				<name>reject</name>\n				<target>update</target>\n				<default>false</default>\n			</transition>\n		</transitions>\n	</task>\n	<state>\n		<name>approved</name>\n		<metadata> <![CDATA[\n				{\"xy\":[380,51]}\n			]]> </metadata>\n		<actions>\n			<action>\n				<name>approve</name>\n				<script> <![CDATA[\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.toStatus(\"approved\"), workflowContext);\n					]]> </script>\n				<script-language>groovy</script-language>\n				<execution-type>onEntry</execution-type>\n			</action>\n		</actions>\n	</state>\n</workflow-definition>',1,1,20474);
/*!40000 ALTER TABLE `kaleodefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleoinstance`
--

DROP TABLE IF EXISTS `kaleoinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleoinstance` (
  `kaleoInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoDefinitionName` varchar(200) DEFAULT NULL,
  `kaleoDefinitionVersion` int(11) DEFAULT NULL,
  `rootKaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoInstanceId`),
  KEY `IX_58D85ECB` (`className`,`classPK`),
  KEY `IX_5F2FCD2D` (`companyId`),
  KEY `IX_BF5839F8` (`companyId`,`kaleoDefinitionName`,`kaleoDefinitionVersion`,`completionDate`),
  KEY `IX_C6D7A867` (`companyId`,`userId`),
  KEY `IX_4DA4D123` (`kaleoDefinitionId`),
  KEY `IX_ACF16238` (`kaleoDefinitionId`,`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleoinstance`
--

LOCK TABLES `kaleoinstance` WRITE;
/*!40000 ALTER TABLE `kaleoinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleoinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleoinstancetoken`
--

DROP TABLE IF EXISTS `kaleoinstancetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleoinstancetoken` (
  `kaleoInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `parentKaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `currentKaleoNodeId` bigint(20) DEFAULT NULL,
  `currentKaleoNodeName` varchar(200) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`kaleoInstanceTokenId`),
  KEY `IX_153721BE` (`companyId`),
  KEY `IX_4A86923B` (`companyId`,`parentKaleoInstanceTokenId`),
  KEY `IX_360D34D9` (`companyId`,`parentKaleoInstanceTokenId`,`completionDate`),
  KEY `IX_7BDB04B4` (`kaleoDefinitionId`),
  KEY `IX_F42AAFF6` (`kaleoInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleoinstancetoken`
--

LOCK TABLES `kaleoinstancetoken` WRITE;
/*!40000 ALTER TABLE `kaleoinstancetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleoinstancetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleolog`
--

DROP TABLE IF EXISTS `kaleolog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleolog` (
  `kaleoLogId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `terminalKaleoNode` tinyint(4) DEFAULT NULL,
  `kaleoActionId` bigint(20) DEFAULT NULL,
  `kaleoActionName` varchar(200) DEFAULT NULL,
  `kaleoActionDescription` longtext,
  `previousKaleoNodeId` bigint(20) DEFAULT NULL,
  `previousKaleoNodeName` varchar(200) DEFAULT NULL,
  `previousAssigneeClassName` varchar(200) DEFAULT NULL,
  `previousAssigneeClassPK` bigint(20) DEFAULT NULL,
  `currentAssigneeClassName` varchar(200) DEFAULT NULL,
  `currentAssigneeClassPK` bigint(20) DEFAULT NULL,
  `type_` varchar(50) DEFAULT NULL,
  `comment_` longtext,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoLogId`),
  KEY `IX_73B5F4DE` (`companyId`),
  KEY `IX_E66A153A` (`kaleoClassName`,`kaleoClassPK`,`kaleoInstanceTokenId`,`type_`),
  KEY `IX_6C64B7D4` (`kaleoDefinitionId`),
  KEY `IX_5BC6AB16` (`kaleoInstanceId`),
  KEY `IX_470B9FF8` (`kaleoInstanceTokenId`,`type_`),
  KEY `IX_B0CDCA38` (`kaleoTaskInstanceTokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleolog`
--

LOCK TABLES `kaleolog` WRITE;
/*!40000 ALTER TABLE `kaleolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleolog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleonode`
--

DROP TABLE IF EXISTS `kaleonode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleonode` (
  `kaleoNodeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `metadata` longtext,
  `description` longtext,
  `type_` varchar(20) DEFAULT NULL,
  `initial_` tinyint(4) DEFAULT NULL,
  `terminal` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kaleoNodeId`),
  KEY `IX_C4E9ACE0` (`companyId`),
  KEY `IX_F28C443E` (`companyId`,`kaleoDefinitionId`),
  KEY `IX_32E94DD6` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleonode`
--

LOCK TABLES `kaleonode` WRITE;
/*!40000 ALTER TABLE `kaleonode` DISABLE KEYS */;
INSERT INTO `kaleonode` VALUES (20467,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,'update','\n			{\"transitions\":{\"resubmit\":{\"bendpoints\":[[303,140]]}},\"xy\":[328,199]}\n		','','TASK',0,0),(20472,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,'approved','\n			\n				{\"xy\":[380,51]}\n			\n		','','STATE',0,1),(20474,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,'created','\n			{\"xy\":[36,51]}\n		','','STATE',1,0),(20475,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,'review','\n			{\"xy\":[168,36]}\n		','','TASK',0,0);
/*!40000 ALTER TABLE `kaleonode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleonotification`
--

DROP TABLE IF EXISTS `kaleonotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleonotification` (
  `kaleoNotificationId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `executionType` varchar(20) DEFAULT NULL,
  `template` longtext,
  `templateLanguage` varchar(75) DEFAULT NULL,
  `notificationTypes` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`kaleoNotificationId`),
  KEY `IX_38829497` (`companyId`),
  KEY `IX_902D342F` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_F3362E93` (`kaleoClassName`,`kaleoClassPK`,`executionType`),
  KEY `IX_4B968E8D` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleonotification`
--

LOCK TABLES `kaleonotification` WRITE;
/*!40000 ALTER TABLE `kaleonotification` DISABLE KEYS */;
INSERT INTO `kaleonotification` VALUES (20469,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoNode',20467,20466,'update','Creator Modification Notification','','onAssignment','Your submission was rejected by ${userName}, please modify and resubmit.','freemarker','email,user-notification'),(20476,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoNode',20475,20466,'review','Review Notification','','onAssignment','${userName} sent you a ${entryType} for review in the workflow.','freemarker','email,user-notification'),(20477,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoNode',20475,20466,'review','Review Completion Notification','','onExit','\n					Your submission has been reviewed and the reviewer has applied the following ${taskComments}.','freemarker','email');
/*!40000 ALTER TABLE `kaleonotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleonotificationrecipient`
--

DROP TABLE IF EXISTS `kaleonotificationrecipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleonotificationrecipient` (
  `kaleoNotificationRecipientId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNotificationId` bigint(20) DEFAULT NULL,
  `recipientClassName` varchar(200) DEFAULT NULL,
  `recipientClassPK` bigint(20) DEFAULT NULL,
  `recipientRoleType` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kaleoNotificationRecipientId`),
  KEY `IX_2C8C4AF4` (`companyId`),
  KEY `IX_AA6697EA` (`kaleoDefinitionId`),
  KEY `IX_7F4FED02` (`kaleoNotificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleonotificationrecipient`
--

LOCK TABLES `kaleonotificationrecipient` WRITE;
/*!40000 ALTER TABLE `kaleonotificationrecipient` DISABLE KEYS */;
INSERT INTO `kaleonotificationrecipient` VALUES (20478,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20477,'com.liferay.portal.model.User',0,0,'');
/*!40000 ALTER TABLE `kaleonotificationrecipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotask`
--

DROP TABLE IF EXISTS `kaleotask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotask` (
  `kaleoTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`kaleoTaskId`),
  KEY `IX_E1F8B23D` (`companyId`),
  KEY `IX_3FFA633` (`kaleoDefinitionId`),
  KEY `IX_77B3F1A2` (`kaleoNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotask`
--

LOCK TABLES `kaleotask` WRITE;
/*!40000 ALTER TABLE `kaleotask` DISABLE KEYS */;
INSERT INTO `kaleotask` VALUES (20470,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20467,'update',''),(20479,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20475,'review','');
/*!40000 ALTER TABLE `kaleotask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotaskassignment`
--

DROP TABLE IF EXISTS `kaleotaskassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotaskassignment` (
  `kaleoTaskAssignmentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `assigneeClassName` varchar(200) DEFAULT NULL,
  `assigneeClassPK` bigint(20) DEFAULT NULL,
  `assigneeActionId` varchar(75) DEFAULT NULL,
  `assigneeScript` longtext,
  `assigneeScriptLanguage` varchar(75) DEFAULT NULL,
  `assigneeScriptRequiredContexts` longtext,
  PRIMARY KEY (`kaleoTaskAssignmentId`),
  KEY `IX_611732B0` (`companyId`),
  KEY `IX_D835C576` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_1087068E` (`kaleoClassName`,`kaleoClassPK`,`assigneeClassName`),
  KEY `IX_575C03A6` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotaskassignment`
--

LOCK TABLES `kaleotaskassignment` WRITE;
/*!40000 ALTER TABLE `kaleotaskassignment` DISABLE KEYS */;
INSERT INTO `kaleotaskassignment` VALUES (20471,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20470,20466,0,'com.liferay.portal.model.User',0,'','','',''),(20480,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20162,'','','',''),(20481,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20482,'','','',''),(20483,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20484,'','','',''),(20485,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20486,'','','',''),(20487,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20172,'','','',''),(20488,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20170,'','','',''),(20489,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20167,'','','',''),(20490,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05','com.liferay.portal.workflow.kaleo.model.KaleoTask',20479,20466,0,'com.liferay.portal.model.Role',20168,'','','','');
/*!40000 ALTER TABLE `kaleotaskassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotaskassignmentinstance`
--

DROP TABLE IF EXISTS `kaleotaskassignmentinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotaskassignmentinstance` (
  `kaleoTaskAssignmentInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskId` bigint(20) DEFAULT NULL,
  `kaleoTaskName` varchar(200) DEFAULT NULL,
  `assigneeClassName` varchar(200) DEFAULT NULL,
  `assigneeClassPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`kaleoTaskAssignmentInstanceId`),
  KEY `IX_945F4EB7` (`assigneeClassName`),
  KEY `IX_3BD436FD` (`assigneeClassName`,`assigneeClassPK`),
  KEY `IX_6E3CDA1B` (`companyId`),
  KEY `IX_38A47B17` (`groupId`,`assigneeClassPK`),
  KEY `IX_C851011` (`kaleoDefinitionId`),
  KEY `IX_67A9EE93` (`kaleoInstanceId`),
  KEY `IX_D4C2235B` (`kaleoTaskInstanceTokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotaskassignmentinstance`
--

LOCK TABLES `kaleotaskassignmentinstance` WRITE;
/*!40000 ALTER TABLE `kaleotaskassignmentinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleotaskassignmentinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotaskinstancetoken`
--

DROP TABLE IF EXISTS `kaleotaskinstancetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotaskinstancetoken` (
  `kaleoTaskInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskId` bigint(20) DEFAULT NULL,
  `kaleoTaskName` varchar(200) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completionUserId` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `dueDate` datetime DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoTaskInstanceTokenId`),
  KEY `IX_A3271995` (`className`,`classPK`),
  KEY `IX_997FE723` (`companyId`),
  KEY `IX_608E9519` (`kaleoDefinitionId`),
  KEY `IX_2CE1159B` (`kaleoInstanceId`),
  KEY `IX_B857A115` (`kaleoInstanceId`,`kaleoTaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotaskinstancetoken`
--

LOCK TABLES `kaleotaskinstancetoken` WRITE;
/*!40000 ALTER TABLE `kaleotaskinstancetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleotaskinstancetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotimer`
--

DROP TABLE IF EXISTS `kaleotimer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotimer` (
  `kaleoTimerId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `blocking` tinyint(4) DEFAULT NULL,
  `description` longtext,
  `duration` double DEFAULT NULL,
  `scale` varchar(75) DEFAULT NULL,
  `recurrenceDuration` double DEFAULT NULL,
  `recurrenceScale` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`kaleoTimerId`),
  KEY `IX_4DE6A889` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_1A479F32` (`kaleoClassName`,`kaleoClassPK`,`blocking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotimer`
--

LOCK TABLES `kaleotimer` WRITE;
/*!40000 ALTER TABLE `kaleotimer` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleotimer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotimerinstancetoken`
--

DROP TABLE IF EXISTS `kaleotimerinstancetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotimerinstancetoken` (
  `kaleoTimerInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTimerId` bigint(20) DEFAULT NULL,
  `kaleoTimerName` varchar(200) DEFAULT NULL,
  `blocking` tinyint(4) DEFAULT NULL,
  `completionUserId` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoTimerInstanceTokenId`),
  KEY `IX_DB96C55B` (`kaleoInstanceId`),
  KEY `IX_DB279423` (`kaleoInstanceTokenId`,`completed`),
  KEY `IX_9932524C` (`kaleoInstanceTokenId`,`completed`,`blocking`),
  KEY `IX_13A5BA2C` (`kaleoInstanceTokenId`,`kaleoTimerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotimerinstancetoken`
--

LOCK TABLES `kaleotimerinstancetoken` WRITE;
/*!40000 ALTER TABLE `kaleotimerinstancetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `kaleotimerinstancetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleotransition`
--

DROP TABLE IF EXISTS `kaleotransition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleotransition` (
  `kaleoTransitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `sourceKaleoNodeId` bigint(20) DEFAULT NULL,
  `sourceKaleoNodeName` varchar(200) DEFAULT NULL,
  `targetKaleoNodeId` bigint(20) DEFAULT NULL,
  `targetKaleoNodeName` varchar(200) DEFAULT NULL,
  `defaultTransition` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kaleoTransitionId`),
  KEY `IX_41D6C6D` (`companyId`),
  KEY `IX_479F3063` (`kaleoDefinitionId`),
  KEY `IX_A392DFD2` (`kaleoNodeId`),
  KEY `IX_A38E2194` (`kaleoNodeId`,`defaultTransition`),
  KEY `IX_85268A11` (`kaleoNodeId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleotransition`
--

LOCK TABLES `kaleotransition` WRITE;
/*!40000 ALTER TABLE `kaleotransition` DISABLE KEYS */;
INSERT INTO `kaleotransition` VALUES (20491,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20467,'resubmit','',20467,'update',20475,'review',1),(20492,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20474,'review','',20474,'created',20475,'review',1),(20493,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20475,'approve','',20475,'review',20472,'approved',1),(20494,0,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20466,20475,'reject','',20475,'review',20467,'update',0);
/*!40000 ALTER TABLE `kaleotransition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout` (
  `uuid_` varchar(75) DEFAULT NULL,
  `plid` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `layoutId` bigint(20) DEFAULT NULL,
  `parentLayoutId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `title` longtext,
  `description` longtext,
  `keywords` longtext,
  `robots` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `typeSettings` longtext,
  `hidden_` tinyint(4) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `iconImage` tinyint(4) DEFAULT NULL,
  `iconImageId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `priority` int(11) DEFAULT NULL,
  `layoutPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  `sourcePrototypeLayoutUuid` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`plid`),
  UNIQUE KEY `IX_BC2C4231` (`groupId`,`privateLayout`,`friendlyURL`),
  UNIQUE KEY `IX_7162C27C` (`groupId`,`privateLayout`,`layoutId`),
  UNIQUE KEY `IX_E118C537` (`uuid_`,`groupId`,`privateLayout`),
  KEY `IX_C7FBC998` (`companyId`),
  KEY `IX_C099D61A` (`groupId`),
  KEY `IX_705F5AA3` (`groupId`,`privateLayout`),
  KEY `IX_6DE88B06` (`groupId`,`privateLayout`,`parentLayoutId`),
  KEY `IX_8CE8C0D9` (`groupId`,`privateLayout`,`sourcePrototypeLayoutUuid`),
  KEY `IX_1A1B61D2` (`groupId`,`privateLayout`,`type_`),
  KEY `IX_23922F7D` (`iconImageId`),
  KEY `IX_B529BFD3` (`layoutPrototypeUuid`),
  KEY `IX_39A18ECC` (`sourcePrototypeLayoutUuid`),
  KEY `IX_D0822724` (`uuid_`),
  KEY `IX_2CE4BE84` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` VALUES ('7e6fff8c-4309-442e-91c3-6e70c6537a30',20176,20173,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Control Panel</Name></root>','','','','','control_panel','privateLayout=true\n',0,'/manage',0,0,'','','','','',0,'',0,''),('111366ca-e5f7-43de-ab32-2363b7fec13a',20185,20182,20155,20159,'','2016-10-02 17:09:32','2017-02-18 19:40:11',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,ru_RU,\" default-locale=\"en_US\"><Name language-id=\"en_US\">Главная</Name><Name language-id=\"ru_RU\">Главная</Name></root>','','','','','portlet','column-1=56_INSTANCE_hxzxircFM6RQ\ncolumn-1-customizable=false\ncolumn-2-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nsitemap-changefreq=daily\nsitemap-include=1\n',0,'/home',0,0,'tiis_WAR_tiistheme','01','','','',0,'',0,''),('1c5daa91-5fc8-4037-a0c6-c9ae3d8ed142',20320,20317,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blog</Name></root>','','','','','portlet','column-1=33,\ncolumn-2=148_INSTANCE_yRd2QnjG7SOz,114,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('28ebd015-04e1-4bc4-8b37-76cb163556ca',20332,20329,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Content Display Page</Name></root>','','','','','portlet','column-1=141_INSTANCE_jwcnVpPO7wtt,122_INSTANCE_5aEdsJ16khto,\ncolumn-2=3,101_INSTANCE_oRauDMMjzqO2,\ndefault-asset-publisher-portlet-id=101_INSTANCE_oRauDMMjzqO2\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('865fa32f-7e2e-4994-82df-2ac55bededdb',20342,20339,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','','','','','portlet','column-1=36,\ncolumn-2=122_INSTANCE_UbtJWxnPexGO,141_INSTANCE_iKsu1dFDc5TA,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('39f5abc6-a120-4be9-afae-b628648c8d0e',20361,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=19,\ncolumn-2=3,59_INSTANCE_UQP13IeWHUvq,180,101_INSTANCE_5erQjJCp1AmD,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('3be18c30-be71-4d3c-9b36-7e3b73f276d3',20369,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','','','','','portlet','column-1=36,\ncolumn-2=122_INSTANCE_Mu7HACoebA1l,148_INSTANCE_RRK748ozoyNL,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/wiki',0,0,'','','','','',1,'',0,''),('850a31d1-413a-47e9-96fe-f68cf6eb1ee9',20387,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=116,\ncolumn-2=3,82,101_INSTANCE_UwZwjRTT7KcJ,\nlayout-template-id=2_columns_i\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('0b78bd0d-160e-405f-ac88-01cf87014fc8',20396,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Documents and Media</Name></root>','','','','','portlet','column-1=20,\ncolumn-2=101_INSTANCE_hmIO5Hm0VPQw,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/documents',0,0,'','','','','',1,'',0,''),('61d540ed-6ebb-4998-ac1c-48b2e2826136',20404,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">News</Name></root>','','','','','portlet','column-1=39_INSTANCE_q5gobxJHASSS,\ncolumn-2=39_INSTANCE_ghTzLw0vrulo,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/news',0,0,'','','','','',2,'',0,''),('3901cbb6-e8a8-4058-ad90-64374f03f3f0',20604,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('1f021769-cdd7-4937-912b-2b2abc2ad470',20610,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('8aee43d9-366b-4387-8003-456659da38ab',20713,20182,20155,20199,'Test Test','2016-10-05 13:40:10','2017-02-14 21:12:22',0,4,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Тесты</Name></root>','','','','','portlet','column-1-customizable=false\ncolumn-2-customizable=false\nlayout-template-id=2_columns_ii\nlayoutUpdateable=true\nsitemap-changefreq=daily\nsitemap-include=1\n',0,'/test',0,0,'classic','','','','',3,'',0,''),('06dbba0c-8a37-4763-80ca-9417ef3ff820',21232,21219,20155,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('8c2ecf8f-264b-486d-97c3-0e9d651039bb',21404,20182,20155,20199,'Test Test','2016-10-24 18:44:26','2017-02-14 21:12:09',0,5,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">News</Name></root>','','','','','portlet','column-1-customizable=false\ncolumn-2-customizable=false\nlayout-template-id=2_columns_ii\nlayoutUpdateable=true\nsitemap-changefreq=daily\nsitemap-include=1\n',1,'/news',0,0,'classic','','','','',2,'',0,''),('8d11cb08-9c7e-408b-90e3-4dd0ed41b9ba',21410,20182,20155,20199,'Test Test','2016-10-24 18:44:34','2017-02-14 21:12:27',0,6,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Documents</Name></root>','','','','','portlet','column-1-customizable=false\ncolumn-2-customizable=false\nlayout-template-id=2_columns_ii\nlayoutUpdateable=true\nsitemap-changefreq=daily\nsitemap-include=1\n',1,'/documents',0,0,'classic','','','','',4,'',0,''),('4e096fe1-96b4-4817-9f44-3d97d5ecdb5d',22901,20182,20155,20199,'Test Test','2016-10-27 22:24:11','2017-02-14 21:11:58',0,7,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,ru_RU,\" default-locale=\"en_US\"><Name language-id=\"en_US\">Каталог книг</Name><Name language-id=\"ru_RU\">Каталог книг</Name></root>','','','','','portlet','column-1=library_WAR_tiislibraryportlet_INSTANCE_5WA2keNLjgqy,\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nsitemap-changefreq=daily\nsitemap-include=1\n',0,'/catalog',0,0,'classic','','','','',1,'',0,''),('eb480698-a9ad-4ac5-9b0b-1bc65687d205',23030,20182,20155,20199,'Test Test','2016-10-28 00:14:28','2016-10-28 00:15:00',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">private</Name></root>','','','','','portlet','column-1=library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD\nlayout-template-id=1_column\nprivateLayout=true\n',1,'/1',0,0,'','','','','',0,'',0,''),('e7c72b4d-1c6b-4c34-b863-6106a925d5cc',24001,20182,20155,20199,'Test Test','2016-11-03 10:32:25','2016-11-03 18:44:28',0,8,7,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US,ru_RU,\" default-locale=\"en_US\"><Name language-id=\"en_US\">Book Info</Name><Name language-id=\"ru_RU\">Информация о книге</Name></root>','','','','','portlet','column-1=bookinfo_WAR_tiislibraryportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nsitemap-changefreq=daily\nsitemap-include=1\n',1,'/book-info',0,0,'classic','','','','',0,'',0,''),('ea3d0324-d7cb-4b61-ba40-10d90909a16f',24515,24502,20155,20159,'','2016-11-06 15:26:10','2016-11-06 15:26:10',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('7853f56f-6fdf-42d7-a60b-3dbb1ea31c48',24845,24802,20155,20159,'','2016-11-21 17:31:22','2016-11-21 17:31:22',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('75fc2a87-46cb-4a52-92af-af54f573f16d',25065,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Home</Title></root>','','','','portlet','column-1=56_INSTANCE_OIR2gK9jmKfI,\ncolumn-2=56_INSTANCE_yaAam8InsEtE,\ncolumn-3=56_INSTANCE_P0LZA4YCeb1d,\ncolumn-4=56_INSTANCE_dXKZGFN8S9av,\ncolumn-5=56_INSTANCE_JQLULPmJHBAQ,56_INSTANCE_6YRMNCEdPqLu,\nlayout-template-id=home_pixelpress\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('50cf1b5d-f5f5-47f2-b872-bb1622d5d8ff',25077,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',1,2,1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Carousel</Title></root>','','','','portlet','column-1=56_INSTANCE_K3WFW4pB3MEg,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/carousel',0,0,'','','','','',0,'',0,''),('fac3a7d7-1df6-44e1-812f-622cedeb1dff',25084,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Portfolio</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Portfolio</Title></root>','','','','portlet','column-1=73_INSTANCE_imu8aggV6ywU,56_INSTANCE_TvwnctsNXcf4,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/portfolio',0,0,'','','','','',1,'',0,''),('45c59c35-38c2-43f0-ac43-b57df68a3e3b',25091,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',1,4,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blogs</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Blogs</Title></root>','','','','portlet','column-1=33,\ncolumn-2=114,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/blogs',0,0,'','','','','',2,'',0,''),('b83988f1-979c-44eb-8a0c-f64e0f81be44',25097,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',1,5,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">wiki</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Wiki</Title></root>','','','','portlet','column-1=36,\ncolumn-2=3,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/wiki',0,0,'','','','','',3,'',0,''),('5ab3a294-f4be-4648-9ad7-329d77e3117a',25103,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:17',1,6,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contact us</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Contact us</Title></root>','','','','portlet','column-1=1_WAR_webformportlet_INSTANCE_t77GAfHbo0NC,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/contact-us',0,0,'','','','','',4,'',0,''),('84c06167-5731-4ef0-958c-0438e6ab285e',25124,25111,20155,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('d3b76073-fcdc-4302-a438-221942cda393',25805,20182,20155,20199,'Test Test','2017-02-14 21:12:59','2017-02-14 21:12:59',0,9,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Личный кабинет</Name></root>','','','','','portlet','layout-template-id=1_column\n',0,'/licnyj-kabinet',0,0,'','','','','',5,'',0,''),('fc6ae6b2-7f38-4f9b-b0ad-7334e2a8eba4',26669,20620,20155,20159,'','2017-02-25 00:03:29','2017-02-25 00:03:29',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,'');
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutbranch`
--

DROP TABLE IF EXISTS `layoutbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutbranch` (
  `LayoutBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `master` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`LayoutBranchId`),
  UNIQUE KEY `IX_FD57097D` (`layoutSetBranchId`,`plid`,`name`),
  KEY `IX_6C226433` (`layoutSetBranchId`),
  KEY `IX_2C42603E` (`layoutSetBranchId`,`plid`),
  KEY `IX_A705FF94` (`layoutSetBranchId`,`plid`,`master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutbranch`
--

LOCK TABLES `layoutbranch` WRITE;
/*!40000 ALTER TABLE `layoutbranch` DISABLE KEYS */;
/*!40000 ALTER TABLE `layoutbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutfriendlyurl`
--

DROP TABLE IF EXISTS `layoutfriendlyurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutfriendlyurl` (
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutFriendlyURLId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`layoutFriendlyURLId`),
  UNIQUE KEY `IX_A6FC2B28` (`groupId`,`privateLayout`,`friendlyURL`,`languageId`),
  UNIQUE KEY `IX_C5762E72` (`plid`,`languageId`),
  UNIQUE KEY `IX_326525D6` (`uuid_`,`groupId`),
  KEY `IX_EAB317C8` (`companyId`),
  KEY `IX_742EF04A` (`groupId`),
  KEY `IX_CA713461` (`groupId`,`privateLayout`,`friendlyURL`),
  KEY `IX_83AE56AB` (`plid`),
  KEY `IX_59051329` (`plid`,`friendlyURL`),
  KEY `IX_9F80D54` (`uuid_`),
  KEY `IX_F4321A54` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutfriendlyurl`
--

LOCK TABLES `layoutfriendlyurl` WRITE;
/*!40000 ALTER TABLE `layoutfriendlyurl` DISABLE KEYS */;
INSERT INTO `layoutfriendlyurl` VALUES ('de1598a6-9db2-4012-a503-ef75fcdda646',20177,20173,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20176,1,'/manage','en_US'),('f9c388af-2365-44d6-9630-bc7db4eafc24',20186,20182,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20185,0,'/home','en_US'),('f9ab09fc-d416-4fc1-8331-50837a8655e5',20321,20317,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20320,1,'/layout','en_US'),('8cd6b741-ae08-46fc-bba7-a9f69c8cd4de',20333,20329,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20332,1,'/layout','en_US'),('37d1bc8e-731f-42fd-a578-a8c4cfcd37e5',20343,20339,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20342,1,'/layout','en_US'),('a189f74d-fdba-431e-9242-6346089d746d',20362,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20361,1,'/home','en_US'),('29c540cb-583a-4fee-adaa-c862b6012095',20370,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20369,1,'/wiki','en_US'),('36a32098-d1b1-4451-99a9-a54aa49a18fb',20388,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20387,1,'/home','en_US'),('acfead7b-8765-4833-a4c1-8f8509a8708a',20397,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20396,1,'/documents','en_US'),('49d39284-243a-4d83-bca0-121f98e8cab0',20405,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20404,1,'/news','en_US'),('0e6637c1-4cf4-47c5-8845-6eacc9cc0d4f',20605,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20604,1,'/home','en_US'),('cdffb8e0-5fcc-4691-a125-ec55c26923c3',20611,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20610,0,'/home','en_US'),('55bfca3b-17b6-4348-a060-2b41aa880530',20714,20182,20155,20199,'Test Test','2016-10-05 13:40:10','2016-10-05 13:40:10',20713,0,'/test','en_US'),('6290def2-5216-445f-bad1-ab8337714c73',21233,21219,20155,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48',21232,1,'/home','en_US'),('56b06395-b4d4-4344-afa3-4d6069af959b',21405,20182,20155,20199,'Test Test','2016-10-24 18:44:26','2016-10-24 18:44:26',21404,0,'/news','en_US'),('35a4294b-66cd-4d5f-8472-7fd84e3b97e9',21411,20182,20155,20199,'Test Test','2016-10-24 18:44:34','2016-10-24 18:44:34',21410,0,'/documents','en_US'),('cca7a2c0-551c-43c2-a7ae-28c493ec2130',22902,20182,20155,20199,'Test Test','2016-10-27 22:24:11','2016-10-27 22:24:11',22901,0,'/catalog','en_US'),('9383c82c-e35d-4cd1-a6d7-864d7c85c43c',23031,20182,20155,20199,'Test Test','2016-10-28 00:14:28','2016-10-28 00:14:28',23030,1,'/1','en_US'),('c15cb09c-f351-4208-8378-630b439708cb',24002,20182,20155,20199,'Test Test','2016-11-03 10:32:26','2016-11-03 10:32:26',24001,0,'/book-info','en_US'),('5ec0e829-11f7-443e-9e36-7722914cd33a',24516,24502,20155,20159,'','2016-11-06 15:26:10','2016-11-06 15:26:10',24515,1,'/home','en_US'),('7607d46d-69bc-47e5-bc5f-e714da906a49',24846,24802,20155,20159,'','2016-11-21 17:31:22','2016-11-21 17:31:22',24845,1,'/home','en_US'),('17ffcca6-a4d5-4daf-8f77-c3409765ae2a',25066,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',25065,1,'/home','en_US'),('e6d9b873-0da6-49cc-83fe-c62c3ab2b51e',25078,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',25077,1,'/carousel','en_US'),('e49d4a57-b714-4718-ad70-8cf423e34c3b',25085,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',25084,1,'/portfolio','en_US'),('e1d29ff3-0aaa-4812-ae2a-4bb1329dafbe',25092,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',25091,1,'/blogs','en_US'),('64532fdd-125d-4fed-a56b-0abca2aae127',25098,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',25097,1,'/wiki','en_US'),('59e65187-0be9-4e3b-bdc8-e83844974ec2',25104,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',25103,1,'/contact-us','en_US'),('c3786cc4-e709-48a8-82f1-be6fe31cb655',25125,25111,20155,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44',25124,1,'/home','en_US'),('9dcf82b1-9216-4bc1-afb3-7e6f2093487a',25806,20182,20155,20199,'Test Test','2017-02-14 21:12:59','2017-02-14 21:12:59',25805,0,'/licnyj-kabinet','en_US'),('c93d1b6e-44b0-45ec-9e00-0240eda046eb',26670,20620,20155,20159,'','2017-02-25 00:03:29','2017-02-25 00:03:29',26669,1,'/home','en_US');
/*!40000 ALTER TABLE `layoutfriendlyurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutprototype`
--

DROP TABLE IF EXISTS `layoutprototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutprototype` (
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutPrototypeId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `settings_` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutPrototypeId`),
  KEY `IX_30616AAA` (`companyId`),
  KEY `IX_557A639F` (`companyId`,`active_`),
  KEY `IX_CEF72136` (`uuid_`),
  KEY `IX_63ED2532` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutprototype`
--

LOCK TABLES `layoutprototype` WRITE;
/*!40000 ALTER TABLE `layoutprototype` DISABLE KEYS */;
INSERT INTO `layoutprototype` VALUES ('4eeb1c53-a013-45ee-a174-56ff287715c7',20316,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blog</Name></root>','Create, edit, and view blogs from this page. Explore topics using tags, and connect with other members that blog.','',1),('65707e54-c59c-4656-bec5-a96ff8261fe7',20328,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Content Display Page</Name></root>','Create, edit, and explore web content with this page. Search available content, explore related content with tags, and browse content categories.','',1),('957ba051-067d-48e9-b844-0be41dc5d476',20338,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','Collaborate with members through the wiki on this page. Discover related content through tags, and navigate quickly and easily with categories.','',1);
/*!40000 ALTER TABLE `layoutprototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutrevision`
--

DROP TABLE IF EXISTS `layoutrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutrevision` (
  `layoutRevisionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `layoutBranchId` bigint(20) DEFAULT NULL,
  `parentLayoutRevisionId` bigint(20) DEFAULT NULL,
  `head` tinyint(4) DEFAULT NULL,
  `major` tinyint(4) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `name` longtext,
  `title` longtext,
  `description` longtext,
  `keywords` longtext,
  `robots` longtext,
  `typeSettings` longtext,
  `iconImage` tinyint(4) DEFAULT NULL,
  `iconImageId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`layoutRevisionId`),
  KEY `IX_43E8286A` (`head`,`plid`),
  KEY `IX_314B621A` (`layoutSetBranchId`),
  KEY `IX_A9AC086E` (`layoutSetBranchId`,`head`),
  KEY `IX_E10AC39` (`layoutSetBranchId`,`head`,`plid`),
  KEY `IX_13984800` (`layoutSetBranchId`,`layoutBranchId`,`plid`),
  KEY `IX_4A84AF43` (`layoutSetBranchId`,`parentLayoutRevisionId`,`plid`),
  KEY `IX_B7B914E5` (`layoutSetBranchId`,`plid`),
  KEY `IX_70DA9ECB` (`layoutSetBranchId`,`plid`,`status`),
  KEY `IX_7FFAE700` (`layoutSetBranchId`,`status`),
  KEY `IX_9329C9D6` (`plid`),
  KEY `IX_8EC3D2BC` (`plid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutrevision`
--

LOCK TABLES `layoutrevision` WRITE;
/*!40000 ALTER TABLE `layoutrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `layoutrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutset`
--

DROP TABLE IF EXISTS `layoutset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutset` (
  `layoutSetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `logo` tinyint(4) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `pageCount` int(11) DEFAULT NULL,
  `settings_` longtext,
  `layoutSetPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetId`),
  UNIQUE KEY `IX_48550691` (`groupId`,`privateLayout`),
  KEY `IX_A40B8BEC` (`groupId`),
  KEY `IX_72BBA8B7` (`layoutSetPrototypeUuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutset`
--

LOCK TABLES `layoutset` WRITE;
/*!40000 ALTER TABLE `layoutset` DISABLE KEYS */;
INSERT INTO `layoutset` VALUES (20174,20173,20155,'2016-10-02 17:09:31','2016-10-02 17:09:32',1,0,0,'classic','01','mobile','01','',1,'','',0),(20175,20173,20155,'2016-10-02 17:09:31','2016-10-02 17:09:31',0,0,0,'classic','01','mobile','01','',0,'','',0),(20183,20182,20155,'2016-10-02 17:09:32','2016-10-28 00:14:28',1,0,0,'classic','01','mobile','01','',1,'','',0),(20184,20182,20155,'2016-10-02 17:09:32','2017-02-14 21:12:59',0,0,0,'tiis_WAR_tiistheme','01','mobile','01','',7,'showSiteName=false\n','',0),(20193,20192,20155,'2016-10-02 17:09:32','2016-10-02 17:09:32',1,0,0,'classic','01','mobile','01','',0,'','',0),(20194,20192,20155,'2016-10-02 17:09:32','2016-10-02 17:09:32',0,0,0,'classic','01','mobile','01','',0,'','',0),(20196,20195,20155,'2016-10-02 17:09:32','2016-10-02 17:09:32',1,0,0,'classic','01','mobile','01','',0,'','',0),(20197,20195,20155,'2016-10-02 17:09:32','2016-10-02 17:09:32',0,0,0,'classic','01','mobile','01','',0,'','',0),(20202,20201,20155,'2016-10-02 17:09:33','2016-10-02 17:25:21',1,0,0,'classic','01','mobile','01','',1,'','',0),(20203,20201,20155,'2016-10-02 17:09:33','2016-10-02 17:25:21',0,0,0,'classic','01','mobile','01','',1,'','',0),(20318,20317,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',1,0,0,'classic','01','mobile','01','',1,'','',0),(20319,20317,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',0,0,0,'classic','01','mobile','01','',0,'','',0),(20330,20329,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',1,0,0,'classic','01','mobile','01','',1,'','',0),(20331,20329,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',0,0,0,'classic','01','mobile','01','',0,'','',0),(20340,20339,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',1,0,0,'classic','01','mobile','01','',1,'','',0),(20341,20339,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',0,0,0,'classic','01','mobile','01','',0,'','',0),(20351,20350,20155,'2016-10-02 17:09:35','2016-10-02 17:09:36',1,0,0,'classic','01','mobile','01','',2,'','',0),(20352,20350,20155,'2016-10-02 17:09:35','2016-10-02 17:09:35',0,0,0,'classic','01','mobile','01','',0,'','',0),(20377,20376,20155,'2016-10-02 17:09:36','2016-10-02 17:09:37',1,0,0,'classic','01','mobile','01','',3,'','',0),(20378,20376,20155,'2016-10-02 17:09:36','2016-10-02 17:09:36',0,0,0,'classic','01','mobile','01','',0,'','',0),(20621,20620,20155,'2016-10-02 17:26:22','2017-02-25 00:03:29',1,0,0,'tiis_WAR_tiistheme','01','mobile','01','',1,'','',0),(20622,20620,20155,'2016-10-02 17:26:22','2017-02-25 00:03:29',0,0,0,'tiis_WAR_tiistheme','01','mobile','01','',0,'','',0),(21105,21104,20155,'2016-10-05 15:25:21','2017-02-12 13:07:09',1,0,0,'tiismainpage_WAR_tiismainpagetheme','01','mobile','01','',0,'','',0),(21106,21104,20155,'2016-10-05 15:25:21','2017-02-12 13:07:09',0,0,0,'tiismainpage_WAR_tiismainpagetheme','01','mobile','01','',0,'','',0),(21220,21219,20155,'2016-10-05 16:54:48','2016-10-05 16:54:48',1,0,0,'itdeutschnoheaderandfooter_WAR_itdeutschnoheaderandfootertheme','01','mobile','01','',1,'','',0),(21221,21219,20155,'2016-10-05 16:54:48','2016-10-05 16:54:48',0,0,0,'itdeutschnoheaderandfooter_WAR_itdeutschnoheaderandfootertheme','01','mobile','01','',0,'','',0),(24503,24502,20155,'2016-11-06 15:26:09','2016-11-06 15:26:10',1,0,0,'itdeutsch_WAR_itdeutschtheme','01','mobile','01','',1,'','',0),(24504,24502,20155,'2016-11-06 15:26:09','2016-11-06 15:26:10',0,0,0,'itdeutsch_WAR_itdeutschtheme','01','mobile','01','',0,'','',0),(24803,24802,20155,'2016-11-21 17:18:24','2016-11-21 17:31:22',1,0,0,'tiistestbs3_WAR_tiistestbs3theme','01','mobile','01','',1,'','',0),(24804,24802,20155,'2016-11-21 17:18:24','2016-11-21 17:31:22',0,0,0,'tiistestbs3_WAR_tiistestbs3theme','01','mobile','01','',0,'','',0),(24856,24855,20155,'2016-11-21 19:01:12','2016-11-21 19:01:17',1,0,0,'pixelpress_WAR_pixelpresstheme','01','mobile','01','',6,'','',0),(24857,24855,20155,'2016-11-21 19:01:12','2016-11-21 19:01:16',0,0,0,'pixelpress_WAR_pixelpresstheme','01','mobile','01','',0,'','',0),(25112,25111,20155,'2016-11-21 19:08:44','2016-11-21 19:08:44',1,0,0,'tiistestmaterial_WAR_tiistestmaterialtheme','01','mobile','01','',1,'','',0),(25113,25111,20155,'2016-11-21 19:08:44','2016-11-21 19:08:44',0,0,0,'tiistestmaterial_WAR_tiistestmaterialtheme','01','mobile','01','',0,'','',0);
/*!40000 ALTER TABLE `layoutset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutsetbranch`
--

DROP TABLE IF EXISTS `layoutsetbranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutsetbranch` (
  `layoutSetBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `master` tinyint(4) DEFAULT NULL,
  `logo` tinyint(4) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `settings_` longtext,
  `layoutSetPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetBranchId`),
  UNIQUE KEY `IX_5FF18552` (`groupId`,`privateLayout`,`name`),
  KEY `IX_8FF5D6EA` (`groupId`),
  KEY `IX_C4079FD3` (`groupId`,`privateLayout`),
  KEY `IX_CCF0DA29` (`groupId`,`privateLayout`,`master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutsetbranch`
--

LOCK TABLES `layoutsetbranch` WRITE;
/*!40000 ALTER TABLE `layoutsetbranch` DISABLE KEYS */;
/*!40000 ALTER TABLE `layoutsetbranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layoutsetprototype`
--

DROP TABLE IF EXISTS `layoutsetprototype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layoutsetprototype` (
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `settings_` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetPrototypeId`),
  KEY `IX_55F63D98` (`companyId`),
  KEY `IX_9178FC71` (`companyId`,`active_`),
  KEY `IX_C5D69B24` (`uuid_`),
  KEY `IX_D9FFCA84` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layoutsetprototype`
--

LOCK TABLES `layoutsetprototype` WRITE;
/*!40000 ALTER TABLE `layoutsetprototype` DISABLE KEYS */;
INSERT INTO `layoutsetprototype` VALUES ('c09bdb69-9bdd-4d7b-aca5-ab42bfd42511',20349,20155,20159,'','2016-10-02 17:09:35','2016-10-05 15:18:15','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Community Site</Name></root>','Site with Forums and Wiki','layoutsUpdateable=true\n',1),('712ae8ff-687e-4790-a742-15e5fb5bf081',20375,20155,20159,'','2016-10-02 17:09:36','2016-10-05 15:18:15','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Intranet Site</Name></root>','Site with Documents and News','layoutsUpdateable=true\n',1),('df0b90a4-ba6b-4b7e-a26f-ed88b75c98de',20619,20155,20159,'','2016-10-02 17:26:22','2017-02-25 00:03:29','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tiis Theme</Name></root>','','layoutsUpdateable=true\n',1),('22ae7289-00c8-4949-bc98-9f6fc0ed4ed5',21103,20155,20159,'','2016-10-05 15:25:21','2017-02-12 13:07:09','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tiis Main Page Theme</Name></root>','','layoutsUpdateable=true\n',1),('92751287-387e-4458-8428-934531220a93',21218,20155,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">It Deutsch No Header And Footer Theme</Name></root>','','layoutsUpdateable=true\n',1),('aaedc9f4-b675-484b-9e6a-c90dedc1c016',24501,20155,20159,'','2016-11-06 15:26:09','2016-11-06 15:26:10','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">It Deutsch Theme</Name></root>','','layoutsUpdateable=true\n',1),('e7e39788-a0ee-41a8-9647-216f251ef09c',24801,20155,20159,'','2016-11-21 17:18:24','2016-11-21 17:31:22','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tiis Test Bs3 Theme</Name></root>','','layoutsUpdateable=true\n',1),('bb957a84-e332-452d-a8ca-f2de288888ae',24854,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:17','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Pixelpress Theme</Name></root>','','layoutsUpdateable=true\n',1),('7da7c697-73e7-4e0e-93fc-ddd71f59f2b9',25110,20155,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tiis Test Material Theme</Name></root>','','layoutsUpdateable=true\n',1);
/*!40000 ALTER TABLE `layoutsetprototype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listtype`
--

DROP TABLE IF EXISTS `listtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listtype` (
  `listTypeId` int(11) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`listTypeId`),
  KEY `IX_2932DD37` (`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listtype`
--

LOCK TABLES `listtype` WRITE;
/*!40000 ALTER TABLE `listtype` DISABLE KEYS */;
INSERT INTO `listtype` VALUES (10000,'billing','com.liferay.portal.model.Account.address'),(10001,'other','com.liferay.portal.model.Account.address'),(10002,'p-o-box','com.liferay.portal.model.Account.address'),(10003,'shipping','com.liferay.portal.model.Account.address'),(10004,'email-address','com.liferay.portal.model.Account.emailAddress'),(10005,'email-address-2','com.liferay.portal.model.Account.emailAddress'),(10006,'email-address-3','com.liferay.portal.model.Account.emailAddress'),(10007,'fax','com.liferay.portal.model.Account.phone'),(10008,'local','com.liferay.portal.model.Account.phone'),(10009,'other','com.liferay.portal.model.Account.phone'),(10010,'toll-free','com.liferay.portal.model.Account.phone'),(10011,'tty','com.liferay.portal.model.Account.phone'),(10012,'intranet','com.liferay.portal.model.Account.website'),(10013,'public','com.liferay.portal.model.Account.website'),(11000,'business','com.liferay.portal.model.Contact.address'),(11001,'other','com.liferay.portal.model.Contact.address'),(11002,'personal','com.liferay.portal.model.Contact.address'),(11003,'email-address','com.liferay.portal.model.Contact.emailAddress'),(11004,'email-address-2','com.liferay.portal.model.Contact.emailAddress'),(11005,'email-address-3','com.liferay.portal.model.Contact.emailAddress'),(11006,'business','com.liferay.portal.model.Contact.phone'),(11007,'business-fax','com.liferay.portal.model.Contact.phone'),(11008,'mobile-phone','com.liferay.portal.model.Contact.phone'),(11009,'other','com.liferay.portal.model.Contact.phone'),(11010,'pager','com.liferay.portal.model.Contact.phone'),(11011,'personal','com.liferay.portal.model.Contact.phone'),(11012,'personal-fax','com.liferay.portal.model.Contact.phone'),(11013,'tty','com.liferay.portal.model.Contact.phone'),(11014,'dr','com.liferay.portal.model.Contact.prefix'),(11015,'mr','com.liferay.portal.model.Contact.prefix'),(11016,'mrs','com.liferay.portal.model.Contact.prefix'),(11017,'ms','com.liferay.portal.model.Contact.prefix'),(11020,'ii','com.liferay.portal.model.Contact.suffix'),(11021,'iii','com.liferay.portal.model.Contact.suffix'),(11022,'iv','com.liferay.portal.model.Contact.suffix'),(11023,'jr','com.liferay.portal.model.Contact.suffix'),(11024,'phd','com.liferay.portal.model.Contact.suffix'),(11025,'sr','com.liferay.portal.model.Contact.suffix'),(11026,'blog','com.liferay.portal.model.Contact.website'),(11027,'business','com.liferay.portal.model.Contact.website'),(11028,'other','com.liferay.portal.model.Contact.website'),(11029,'personal','com.liferay.portal.model.Contact.website'),(12000,'billing','com.liferay.portal.model.Organization.address'),(12001,'other','com.liferay.portal.model.Organization.address'),(12002,'p-o-box','com.liferay.portal.model.Organization.address'),(12003,'shipping','com.liferay.portal.model.Organization.address'),(12004,'email-address','com.liferay.portal.model.Organization.emailAddress'),(12005,'email-address-2','com.liferay.portal.model.Organization.emailAddress'),(12006,'email-address-3','com.liferay.portal.model.Organization.emailAddress'),(12007,'fax','com.liferay.portal.model.Organization.phone'),(12008,'local','com.liferay.portal.model.Organization.phone'),(12009,'other','com.liferay.portal.model.Organization.phone'),(12010,'toll-free','com.liferay.portal.model.Organization.phone'),(12011,'tty','com.liferay.portal.model.Organization.phone'),(12012,'administrative','com.liferay.portal.model.Organization.service'),(12013,'contracts','com.liferay.portal.model.Organization.service'),(12014,'donation','com.liferay.portal.model.Organization.service'),(12015,'retail','com.liferay.portal.model.Organization.service'),(12016,'training','com.liferay.portal.model.Organization.service'),(12017,'full-member','com.liferay.portal.model.Organization.status'),(12018,'provisional-member','com.liferay.portal.model.Organization.status'),(12019,'intranet','com.liferay.portal.model.Organization.website'),(12020,'public','com.liferay.portal.model.Organization.website');
/*!40000 ALTER TABLE `listtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_`
--

DROP TABLE IF EXISTS `lock_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lock_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `lockId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `className` varchar(75) DEFAULT NULL,
  `key_` varchar(200) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `inheritable` tinyint(4) DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`lockId`),
  UNIQUE KEY `IX_228562AD` (`className`,`key_`),
  KEY `IX_E3F1286B` (`expirationDate`),
  KEY `IX_13C5CD3A` (`uuid_`),
  KEY `IX_2C418EAE` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_`
--

LOCK TABLES `lock_` WRITE;
/*!40000 ALTER TABLE `lock_` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_app`
--

DROP TABLE IF EXISTS `marketplace_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketplace_app` (
  `uuid_` varchar(75) DEFAULT NULL,
  `appId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remoteAppId` bigint(20) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `description` longtext,
  `category` varchar(75) DEFAULT NULL,
  `iconURL` longtext,
  `version` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`appId`),
  KEY `IX_94A7EF25` (`category`),
  KEY `IX_865B7BD5` (`companyId`),
  KEY `IX_20F14D93` (`remoteAppId`),
  KEY `IX_3E667FE1` (`uuid_`),
  KEY `IX_A7807DA7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_app`
--

LOCK TABLES `marketplace_app` WRITE;
/*!40000 ALTER TABLE `marketplace_app` DISABLE KEYS */;
INSERT INTO `marketplace_app` VALUES ('50d2d53a-8f34-46e7-9c4a-4441651eeb72',24851,0,0,'','2016-11-21 19:01:06','2016-11-21 19:01:06',25965836,'Pixelpress','Pixelpress is a responsive Liferay Theme with cool design and many features and capabilities Like :-Custom color schemes.-Responsive design.-Cross browsers.-Various custom templates.-Different theme settings.-Ready to use site template.Prerequisites: Web Form CE/EE version 1.0.1 or higher must be installed prior to deploying this app. Resources Importer EE 1.0.1/CE 1.0.2 or higher must be installed prior to deploying this app.NOTE: to be able to see the documentation, please register in www.themeray.com and also click the button \"Free Download\" under https://www.themeray.com/themes/pixelpress','Themes / Site Templates','http://www.liferay.com/web/guest/marketplace/-/mp/asset/icon/39502586','2.0.0');
/*!40000 ALTER TABLE `marketplace_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_module`
--

DROP TABLE IF EXISTS `marketplace_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketplace_module` (
  `uuid_` varchar(75) DEFAULT NULL,
  `moduleId` bigint(20) NOT NULL,
  `appId` bigint(20) DEFAULT NULL,
  `bundleSymbolicName` varchar(500) DEFAULT NULL,
  `bundleVersion` varchar(75) DEFAULT NULL,
  `contextName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  KEY `IX_7DC16D26` (`appId`),
  KEY `IX_5848F52D` (`appId`,`bundleSymbolicName`,`bundleVersion`),
  KEY `IX_C6938724` (`appId`,`contextName`),
  KEY `IX_DD03D499` (`bundleSymbolicName`),
  KEY `IX_F2F1E964` (`contextName`),
  KEY `IX_A7EFD80E` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_module`
--

LOCK TABLES `marketplace_module` WRITE;
/*!40000 ALTER TABLE `marketplace_module` DISABLE KEYS */;
INSERT INTO `marketplace_module` VALUES ('23607970-3625-46a3-b2b5-8449d0f49e66',24852,24851,'','','pixelpress-theme'),('d9a03743-5cc5-41ed-a63c-34e9b30707e9',24853,24851,'','','resources-importer-web');
/*!40000 ALTER TABLE `marketplace_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbban`
--

DROP TABLE IF EXISTS `mbban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbban` (
  `uuid_` varchar(75) DEFAULT NULL,
  `banId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `banUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`banId`),
  UNIQUE KEY `IX_8ABC4E3B` (`groupId`,`banUserId`),
  UNIQUE KEY `IX_2A3B68F6` (`uuid_`,`groupId`),
  KEY `IX_69951A25` (`banUserId`),
  KEY `IX_5C3FF12A` (`groupId`),
  KEY `IX_48814BBA` (`userId`),
  KEY `IX_8A13C634` (`uuid_`),
  KEY `IX_4F841574` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbban`
--

LOCK TABLES `mbban` WRITE;
/*!40000 ALTER TABLE `mbban` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbcategory`
--

DROP TABLE IF EXISTS `mbcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbcategory` (
  `uuid_` varchar(75) DEFAULT NULL,
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `displayStyle` varchar(75) DEFAULT NULL,
  `threadCount` int(11) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `IX_F7D28C2F` (`uuid_`,`groupId`),
  KEY `IX_BC735DCF` (`companyId`),
  KEY `IX_E15A5DB5` (`companyId`,`status`),
  KEY `IX_BB870C11` (`groupId`),
  KEY `IX_ED292508` (`groupId`,`parentCategoryId`),
  KEY `IX_C295DBEE` (`groupId`,`parentCategoryId`,`status`),
  KEY `IX_DA84A9F7` (`groupId`,`status`),
  KEY `IX_C2626EDB` (`uuid_`),
  KEY `IX_13DF4E6D` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbcategory`
--

LOCK TABLES `mbcategory` WRITE;
/*!40000 ALTER TABLE `mbcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbdiscussion`
--

DROP TABLE IF EXISTS `mbdiscussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbdiscussion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `discussionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`discussionId`),
  UNIQUE KEY `IX_33A4DE38` (`classNameId`,`classPK`),
  UNIQUE KEY `IX_B5CA2DC` (`threadId`),
  UNIQUE KEY `IX_F7AAC799` (`uuid_`,`groupId`),
  KEY `IX_79D0120B` (`classNameId`),
  KEY `IX_5477D431` (`uuid_`),
  KEY `IX_7E965757` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbdiscussion`
--

LOCK TABLES `mbdiscussion` WRITE;
/*!40000 ALTER TABLE `mbdiscussion` DISABLE KEYS */;
INSERT INTO `mbdiscussion` VALUES ('1b025b5e-0886-4cc4-a992-2aebd292a4c6',20181,0,0,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20002,20176,20179),('0532a24a-9f98-4455-88f4-327fc55d84e7',20190,0,0,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20002,20185,20188),('37fbd841-d62b-47ea-a2b0-b1c60d4a8a5e',20326,0,0,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20002,20320,20323),('98792ced-6f00-4493-ade6-277ad044b1ee',20337,0,0,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20002,20332,20335),('29e6ba36-0ded-4bd5-b3cb-c2840c93961e',20347,0,0,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20002,20342,20345),('c6303096-60a2-44bd-82e8-c7dc98c519e4',20366,0,0,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20002,20361,20364),('a7b9e51a-fad7-476b-ac8c-80e6e236d138',20374,0,0,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20002,20369,20372),('cbeb9c20-b267-4f58-ab35-31e64c931c52',20392,0,0,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20002,20387,20390),('7b90091c-8d97-4eee-ae4d-e8a5d5edc1b1',20401,0,0,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20002,20396,20399),('fcd36272-41a6-41a0-b5b8-94207a1e5582',20409,0,0,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20002,20404,20407),('4bd6c81f-68ff-4a45-8ef5-3b5b1ce3ff10',20609,0,0,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20002,20604,20607),('6af75772-aadf-410d-86a3-a07e5163c5f7',20615,0,0,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20002,20610,20613),('6da0423d-d925-4cca-b266-3a578025b7a9',20718,0,0,20199,'Test Test','2016-10-05 13:40:10','2016-10-05 13:40:10',20002,20713,20716),('8feded61-bdde-41ca-bae4-599d821dee05',21237,0,0,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48',20002,21232,21235),('1d0540cf-c398-4f1c-aac4-82f8749b53c4',21409,0,0,20199,'Test Test','2016-10-24 18:44:27','2016-10-24 18:44:27',20002,21404,21407),('0f884974-cceb-4815-a93e-7f9dfca522ef',21415,0,0,20199,'Test Test','2016-10-24 18:44:34','2016-10-24 18:44:34',20002,21410,21413),('c66cad80-6391-44c6-9e90-be24539839fe',22906,0,0,20199,'Test Test','2016-10-27 22:24:11','2016-10-27 22:24:11',20002,22901,22904),('ea24f5fb-3858-4fe4-8409-be4b648a409c',23011,0,0,20199,'Test Test','2016-10-27 23:55:52','2016-10-27 23:55:52',20109,23004,23009),('f7dc4e06-69b7-4fb8-815c-16b4d6c18e0c',23035,0,0,20199,'Test Test','2016-10-28 00:14:28','2016-10-28 00:14:28',20002,23030,23033),('b2b24461-a9b1-4be9-a4be-3ec2896fc755',24006,0,0,20199,'Test Test','2016-11-03 10:32:26','2016-11-03 10:32:26',20002,24001,24004),('9a752603-c9bc-4443-b4dd-e938b7eac5e3',24520,0,0,20159,'','2016-11-06 15:26:10','2016-11-06 15:26:10',20002,24515,24518),('e3485a35-0337-468f-9c39-33a8283230da',24850,0,0,20159,'','2016-11-21 17:31:22','2016-11-21 17:31:22',20002,24845,24848),('c5527c25-d8fd-49b7-b122-c87f4ebbb544',24872,0,0,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',20011,24866,24870),('8afca0bc-d155-4eb5-a99e-a6449f015e2b',24881,0,0,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24875,24879),('fac2d7ca-9c10-4c81-986a-6ff9c0dd3f79',24889,0,0,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24883,24887),('7fc36837-3551-4976-aeb1-828d5b127c8e',24897,0,0,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24891,24895),('deacfdaf-7f85-441e-b12d-61516319f223',24905,0,0,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24899,24903),('101207eb-3ac4-412a-8f1a-b8e6931d08b6',24914,0,0,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24908,24912),('14cd9ae9-4f74-45e0-9bbe-9b7e974274f5',24923,0,0,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24916,24921),('bf3b9439-a74b-44c0-a989-2fd0595ca797',24953,0,0,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24935,24951),('7f8cc5d4-3069-4e96-b587-c90ce2ea43e8',24973,0,0,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24967,24971),('bf4734bc-ca08-452f-bf9c-76e2a530f5d8',24982,0,0,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24976,24980),('2b965675-c31c-4275-8197-4b71bed652ca',24993,0,0,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24986,24991),('eeba638e-b9d4-4074-898d-f9605cfd85e8',25007,0,0,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25001,25005),('cb40f6a6-b624-437a-a019-9fb4058a5353',25018,0,0,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25012,25016),('232c3bce-7072-4c5f-bf80-b656f3ccd7a7',25029,0,0,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25023,25027),('a3c751c4-fd8c-4066-8d00-28426566b620',25040,0,0,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25034,25038),('32e3536a-f5ae-4756-8895-a3d42ef9dbcf',25051,0,0,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25045,25049),('fd887898-3c7b-408b-87f8-7659d414b0d0',25062,0,0,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25056,25060),('e2d5f698-bf65-4624-b1ec-13851990cbb4',25070,0,0,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25065,25068),('9aa03e40-0f04-460e-9d09-3106103acae0',25082,0,0,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25077,25080),('0609af85-15fc-4ba5-be85-060b4de72120',25089,0,0,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25084,25087),('f3f96868-84ac-403a-8715-eb239081e473',25096,0,0,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25091,25094),('be8c0f45-e29b-43d5-96e0-ad7917587a25',25102,0,0,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25097,25100),('89f917d8-fd25-41f0-b961-230dd6b39ae5',25108,0,0,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25103,25106),('6ebe3e2b-9a3b-4778-b3a0-c1909b0ef7f7',25129,0,0,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44',20002,25124,25127),('7733ce0d-f2bc-4566-b401-790d1bfd1221',25810,0,0,20199,'Test Test','2017-02-14 21:12:59','2017-02-14 21:12:59',20002,25805,25808),('f80ecd1a-c0bd-43bd-a9b3-9101940745f7',26674,0,0,20159,'','2017-02-25 00:03:29','2017-02-25 00:03:29',20002,26669,26672);
/*!40000 ALTER TABLE `mbdiscussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbmailinglist`
--

DROP TABLE IF EXISTS `mbmailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbmailinglist` (
  `uuid_` varchar(75) DEFAULT NULL,
  `mailingListId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `inProtocol` varchar(75) DEFAULT NULL,
  `inServerName` varchar(75) DEFAULT NULL,
  `inServerPort` int(11) DEFAULT NULL,
  `inUseSSL` tinyint(4) DEFAULT NULL,
  `inUserName` varchar(75) DEFAULT NULL,
  `inPassword` varchar(75) DEFAULT NULL,
  `inReadInterval` int(11) DEFAULT NULL,
  `outEmailAddress` varchar(75) DEFAULT NULL,
  `outCustom` tinyint(4) DEFAULT NULL,
  `outServerName` varchar(75) DEFAULT NULL,
  `outServerPort` int(11) DEFAULT NULL,
  `outUseSSL` tinyint(4) DEFAULT NULL,
  `outUserName` varchar(75) DEFAULT NULL,
  `outPassword` varchar(75) DEFAULT NULL,
  `allowAnonymous` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`mailingListId`),
  UNIQUE KEY `IX_76CE9CDD` (`groupId`,`categoryId`),
  UNIQUE KEY `IX_E858F170` (`uuid_`,`groupId`),
  KEY `IX_BFEB984F` (`active_`),
  KEY `IX_4115EC7A` (`uuid_`),
  KEY `IX_FC61676E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbmailinglist`
--

LOCK TABLES `mbmailinglist` WRITE;
/*!40000 ALTER TABLE `mbmailinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbmailinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbmessage`
--

DROP TABLE IF EXISTS `mbmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbmessage` (
  `uuid_` varchar(75) DEFAULT NULL,
  `messageId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  `rootMessageId` bigint(20) DEFAULT NULL,
  `parentMessageId` bigint(20) DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `body` longtext,
  `format` varchar(75) DEFAULT NULL,
  `anonymous` tinyint(4) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `allowPingbacks` tinyint(4) DEFAULT NULL,
  `answer` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  UNIQUE KEY `IX_8D12316E` (`uuid_`,`groupId`),
  KEY `IX_51A8D44D` (`classNameId`,`classPK`),
  KEY `IX_F6687633` (`classNameId`,`classPK`,`status`),
  KEY `IX_B1432D30` (`companyId`),
  KEY `IX_1AD93C16` (`companyId`,`status`),
  KEY `IX_5B153FB2` (`groupId`),
  KEY `IX_1073AB9F` (`groupId`,`categoryId`),
  KEY `IX_4257DB85` (`groupId`,`categoryId`,`status`),
  KEY `IX_B674AB58` (`groupId`,`categoryId`,`threadId`),
  KEY `IX_CBFDBF0A` (`groupId`,`categoryId`,`threadId`,`answer`),
  KEY `IX_385E123E` (`groupId`,`categoryId`,`threadId`,`status`),
  KEY `IX_ED39AC98` (`groupId`,`status`),
  KEY `IX_8EB8C5EC` (`groupId`,`userId`),
  KEY `IX_377858D2` (`groupId`,`userId`,`status`),
  KEY `IX_75B95071` (`threadId`),
  KEY `IX_9D7C3B23` (`threadId`,`answer`),
  KEY `IX_A7038CD7` (`threadId`,`parentMessageId`),
  KEY `IX_9DC8E57` (`threadId`,`status`),
  KEY `IX_7A040C32` (`userId`),
  KEY `IX_59F9CE5C` (`userId`,`classNameId`),
  KEY `IX_ABEB6D07` (`userId`,`classNameId`,`classPK`),
  KEY `IX_4A4BB4ED` (`userId`,`classNameId`,`classPK`,`status`),
  KEY `IX_3321F142` (`userId`,`classNameId`,`status`),
  KEY `IX_C57B16BC` (`uuid_`),
  KEY `IX_57CA9FEC` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbmessage`
--

LOCK TABLES `mbmessage` WRITE;
/*!40000 ALTER TABLE `mbmessage` DISABLE KEYS */;
INSERT INTO `mbmessage` VALUES ('c25a00f0-c7e6-482d-87c5-01bc26b73e7c',20178,20173,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20002,20176,-1,20179,20178,0,'20176','20176','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:32'),('699af1d0-a25c-4b05-879b-0b23a641729a',20187,20182,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',20002,20185,-1,20188,20187,0,'20185','20185','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:32'),('b50ff767-19e8-4b0d-9795-4745a9c0d65c',20322,20317,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20002,20320,-1,20323,20322,0,'20320','20320','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:35'),('03011d4f-1ebc-49a1-bba3-f1abde1686bc',20334,20329,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20002,20332,-1,20335,20334,0,'20332','20332','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:35'),('8b6b08c8-55d3-4817-9e1a-a3475cfb0524',20344,20339,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',20002,20342,-1,20345,20344,0,'20342','20342','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:35'),('a8844412-d704-4617-b1d8-04fd5f8c6ceb',20363,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20002,20361,-1,20364,20363,0,'20361','20361','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:36'),('fd707339-d3e3-45e2-af79-67451bbb8279',20371,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',20002,20369,-1,20372,20371,0,'20369','20369','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:36'),('19120ce4-6589-4cc7-b3c3-bd7383d17146',20389,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20002,20387,-1,20390,20389,0,'20387','20387','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:37'),('0ed9919b-70b9-49dc-a851-484fbfd77fd9',20398,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20002,20396,-1,20399,20398,0,'20396','20396','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:37'),('4ebe9eb2-9476-47ab-b41f-92de79012c4e',20406,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',20002,20404,-1,20407,20406,0,'20404','20404','bbcode',1,0,0,0,0,20159,'','2016-10-02 17:09:37'),('b92f1515-ce64-4aaf-9799-a91112602aeb',20606,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20002,20604,-1,20607,20606,0,'20604','20604','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-02 17:25:21'),('1a74961f-b748-4906-9a11-f7f1ff62934f',20612,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',20002,20610,-1,20613,20612,0,'20610','20610','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-02 17:25:21'),('803d3433-995b-4a55-b168-2a3411c95222',20715,20182,20155,20199,'Test Test','2016-10-05 13:40:10','2016-10-05 13:40:10',20002,20713,-1,20716,20715,0,'20713','20713','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-05 13:40:10'),('aa700b40-15b4-4b76-8e83-56064991372e',21234,21219,20155,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48',20002,21232,-1,21235,21234,0,'21232','21232','bbcode',1,0,0,0,0,20159,'','2016-10-05 16:54:48'),('3898ffcb-7854-440a-9ff5-6fbf6552df42',21406,20182,20155,20199,'Test Test','2016-10-24 18:44:26','2016-10-24 18:44:26',20002,21404,-1,21407,21406,0,'21404','21404','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-24 18:44:26'),('1f326ac1-a33b-47e3-8013-f2f70465989e',21412,20182,20155,20199,'Test Test','2016-10-24 18:44:34','2016-10-24 18:44:34',20002,21410,-1,21413,21412,0,'21410','21410','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-24 18:44:34'),('ac7161b3-a0e1-4196-bb3c-37436d0a6fa3',22903,20182,20155,20199,'Test Test','2016-10-27 22:24:11','2016-10-27 22:24:11',20002,22901,-1,22904,22903,0,'22901','22901','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-27 22:24:11'),('bef04289-85ac-486d-abbb-e4c24565865f',23008,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-27 23:55:52',20109,23004,-1,23009,23008,0,'23004','23004','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-27 23:55:52'),('a04f9172-8ea7-4748-a101-a3f75df79483',23032,20182,20155,20199,'Test Test','2016-10-28 00:14:28','2016-10-28 00:14:28',20002,23030,-1,23033,23032,0,'23030','23030','bbcode',0,0,0,0,0,20199,'Test Test','2016-10-28 00:14:28'),('30307c10-f99a-4606-8a92-366110118850',24003,20182,20155,20199,'Test Test','2016-11-03 10:32:26','2016-11-03 10:32:26',20002,24001,-1,24004,24003,0,'24001','24001','bbcode',0,0,0,0,0,20199,'Test Test','2016-11-03 10:32:26'),('33747e32-4b8a-43d2-bf98-9884c3180a77',24517,24502,20155,20159,'','2016-11-06 15:26:10','2016-11-06 15:26:10',20002,24515,-1,24518,24517,0,'24515','24515','bbcode',1,0,0,0,0,20159,'','2016-11-06 15:26:10'),('31fb88a5-1b05-46f9-a2b1-3c211af9183f',24847,24802,20155,20159,'','2016-11-21 17:31:22','2016-11-21 17:31:22',20002,24845,-1,24848,24847,0,'24845','24845','bbcode',1,0,0,0,0,20159,'','2016-11-21 17:31:22'),('deaf9cb2-f964-4215-9f35-212ed72525dd',24869,24855,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',20011,24866,-1,24870,24869,0,'24866','24866','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:12'),('32af8a9a-02bc-4cec-9ab8-31880aee7fba',24878,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24875,-1,24879,24878,0,'24875','24875','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:13'),('bb122b8b-bf09-47c3-bf63-f0d93119e55c',24886,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24883,-1,24887,24886,0,'24883','24883','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:13'),('83aa6aae-bcf5-4d42-997a-ce4aaffcb297',24894,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24891,-1,24895,24894,0,'24891','24891','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:13'),('043ec114-3573-4305-ab41-7f06b2e37fb7',24902,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24899,-1,24903,24902,0,'24899','24899','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:13'),('711536c5-ac7f-4c9d-ba93-d2257c98d3ae',24911,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24908,-1,24912,24911,0,'24908','24908','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:13'),('6bfc0907-22fe-4d9e-a1dc-a70c58f6dbf3',24920,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',20011,24916,-1,24921,24920,0,'24916','24916','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:13'),('1762bd63-004a-4704-8dfd-8286fe1da537',24950,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24935,-1,24951,24950,0,'24935','24935','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:14'),('8677dcfe-771e-4a37-b49c-1e0e11718f2f',24970,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24967,-1,24971,24970,0,'24967','24967','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:14'),('ebd7ef97-0e93-492c-9465-90789565e4ff',24979,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24976,-1,24980,24979,0,'24976','24976','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:14'),('43547da0-b0e5-4dbf-ab7a-c69b33bdba25',24990,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',20109,24986,-1,24991,24990,0,'24986','24986','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:14'),('12c10fca-a815-4465-bb58-aace4bd1173a',25004,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25001,-1,25005,25004,0,'25001','25001','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:15'),('dcf5954d-5ba5-461a-8515-d5545d0e20f3',25015,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25012,-1,25016,25015,0,'25012','25012','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:15'),('775ec0af-d67d-4ac7-9477-f8c491f2c340',25026,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25023,-1,25027,25026,0,'25023','25023','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:15'),('9b51cb52-9525-4df2-90c6-30f79c6a5ba6',25037,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25034,-1,25038,25037,0,'25034','25034','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:15'),('a30ca7cd-dbaa-4e8e-a0f6-45ef51a47682',25048,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25045,-1,25049,25048,0,'25045','25045','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:15'),('a8fe0227-79be-43dc-96bc-e42621516237',25059,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',20109,25056,-1,25060,25059,0,'25056','25056','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:15'),('c0ece2d7-7e5a-4f3a-b431-86bd88f7ab72',25067,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25065,-1,25068,25067,0,'25065','25065','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:16'),('6b09fff9-4a7f-42c7-a56a-37ccdbc06c43',25079,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25077,-1,25080,25079,0,'25077','25077','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:16'),('55ae7335-8787-4786-baa3-e150d5517982',25086,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25084,-1,25087,25086,0,'25084','25084','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:16'),('d503dfe6-0a81-40ee-bfa7-180daa9f3dcb',25093,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25091,-1,25094,25093,0,'25091','25091','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:16'),('b83ea66e-263f-4b77-bdfb-ad42aff63dbd',25099,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25097,-1,25100,25099,0,'25097','25097','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:16'),('9dea24dc-4cd7-4e03-99e5-9285e10db17a',25105,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',20002,25103,-1,25106,25105,0,'25103','25103','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:01:16'),('a7cfb84a-bb3b-4daa-82f7-88436b940e94',25126,25111,20155,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44',20002,25124,-1,25127,25126,0,'25124','25124','bbcode',1,0,0,0,0,20159,'','2016-11-21 19:08:44'),('96d6e42d-bb17-48ee-a731-b66884f06077',25807,20182,20155,20199,'Test Test','2017-02-14 21:12:59','2017-02-14 21:12:59',20002,25805,-1,25808,25807,0,'25805','25805','bbcode',0,0,0,0,0,20199,'Test Test','2017-02-14 21:12:59'),('b273661f-5e34-4f65-90f1-5b1370703c40',26671,20620,20155,20159,'','2017-02-25 00:03:29','2017-02-25 00:03:29',20002,26669,-1,26672,26671,0,'26669','26669','bbcode',1,0,0,0,0,20159,'','2017-02-25 00:03:29');
/*!40000 ALTER TABLE `mbmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbstatsuser`
--

DROP TABLE IF EXISTS `mbstatsuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbstatsuser` (
  `statsUserId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  PRIMARY KEY (`statsUserId`),
  UNIQUE KEY `IX_9168E2C9` (`groupId`,`userId`),
  KEY `IX_A00A898F` (`groupId`),
  KEY `IX_D33A5445` (`groupId`,`userId`,`messageCount`),
  KEY `IX_847F92B5` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbstatsuser`
--

LOCK TABLES `mbstatsuser` WRITE;
/*!40000 ALTER TABLE `mbstatsuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbstatsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbthread`
--

DROP TABLE IF EXISTS `mbthread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbthread` (
  `uuid_` varchar(75) DEFAULT NULL,
  `threadId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `rootMessageId` bigint(20) DEFAULT NULL,
  `rootMessageUserId` bigint(20) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  `lastPostByUserId` bigint(20) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `question` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`threadId`),
  UNIQUE KEY `IX_3A200B7B` (`uuid_`,`groupId`),
  KEY `IX_41F6DC8A` (`categoryId`,`priority`),
  KEY `IX_95C0EA45` (`groupId`),
  KEY `IX_9A2D11B2` (`groupId`,`categoryId`),
  KEY `IX_50F1904A` (`groupId`,`categoryId`,`lastPostDate`),
  KEY `IX_485F7E98` (`groupId`,`categoryId`,`status`),
  KEY `IX_E1E7142B` (`groupId`,`status`),
  KEY `IX_AEDD9CB5` (`lastPostDate`,`priority`),
  KEY `IX_CC993ECB` (`rootMessageId`),
  KEY `IX_7E264A0F` (`uuid_`),
  KEY `IX_F8CA2AB9` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbthread`
--

LOCK TABLES `mbthread` WRITE;
/*!40000 ALTER TABLE `mbthread` DISABLE KEYS */;
INSERT INTO `mbthread` VALUES ('0e7214c3-5cf9-4206-b414-c64f583481e9',20179,20173,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',-1,20178,20159,1,0,0,'2016-10-02 17:09:32',0,0,0,20159,'','2016-10-02 17:09:32'),('24e3c900-5ed7-48fd-b091-1776a3128a77',20188,20182,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',-1,20187,20159,1,0,0,'2016-10-02 17:09:32',0,0,0,20159,'','2016-10-02 17:09:32'),('03ca5474-de8d-4fc0-9a3d-7db61814c6bf',20323,20317,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',-1,20322,20159,1,0,0,'2016-10-02 17:09:35',0,0,0,20159,'','2016-10-02 17:09:35'),('4e6339df-5d9d-4459-8be6-6621f1f7fe1f',20335,20329,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',-1,20334,20159,1,0,0,'2016-10-02 17:09:35',0,0,0,20159,'','2016-10-02 17:09:35'),('b8de09e3-d72d-45a2-b14a-119dfaef87bc',20345,20339,20155,20159,'','2016-10-02 17:09:35','2016-10-02 17:09:35',-1,20344,20159,1,0,0,'2016-10-02 17:09:35',0,0,0,20159,'','2016-10-02 17:09:35'),('9663e338-1976-4b3b-b7d0-a68701982ff0',20364,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',-1,20363,20159,1,0,0,'2016-10-02 17:09:36',0,0,0,20159,'','2016-10-02 17:09:36'),('03c87f3d-5736-4051-ab87-c6f9963ace23',20372,20350,20155,20159,'','2016-10-02 17:09:36','2016-10-02 17:09:36',-1,20371,20159,1,0,0,'2016-10-02 17:09:36',0,0,0,20159,'','2016-10-02 17:09:36'),('229f2b58-8730-459a-b302-99a40aacfea6',20390,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',-1,20389,20159,1,0,0,'2016-10-02 17:09:37',0,0,0,20159,'','2016-10-02 17:09:37'),('1d827a2c-effe-4bef-8cc2-9d02f1bd990a',20399,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',-1,20398,20159,1,0,0,'2016-10-02 17:09:37',0,0,0,20159,'','2016-10-02 17:09:37'),('6db24ba6-f572-4d7a-8cf6-5a7020bbca28',20407,20376,20155,20159,'','2016-10-02 17:09:37','2016-10-02 17:09:37',-1,20406,20159,1,0,0,'2016-10-02 17:09:37',0,0,0,20159,'','2016-10-02 17:09:37'),('d94f3fe8-9155-4c8c-b635-c328f24735cc',20607,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',-1,20606,20199,1,0,20199,'2016-10-02 17:25:21',0,0,0,20199,'Test Test','2016-10-02 17:25:21'),('6c69d398-31db-482a-9ffa-1f8e5ae6cfc2',20613,20201,20155,20199,'Test Test','2016-10-02 17:25:21','2016-10-02 17:25:21',-1,20612,20199,1,0,20199,'2016-10-02 17:25:21',0,0,0,20199,'Test Test','2016-10-02 17:25:21'),('cd342339-3dda-4c10-916b-acce6184f8e0',20716,20182,20155,20199,'Test Test','2016-10-05 13:40:10','2016-10-05 13:40:10',-1,20715,20199,1,0,20199,'2016-10-05 13:40:10',0,0,0,20199,'Test Test','2016-10-05 13:40:10'),('6b8b4957-7fe9-49cd-b08c-280c53ce751f',21235,21219,20155,20159,'','2016-10-05 16:54:48','2016-10-05 16:54:48',-1,21234,20159,1,0,0,'2016-10-05 16:54:48',0,0,0,20159,'','2016-10-05 16:54:48'),('6a32326b-439b-4100-931b-e8717648a6a4',21407,20182,20155,20199,'Test Test','2016-10-24 18:44:26','2016-10-24 18:44:26',-1,21406,20199,1,0,20199,'2016-10-24 18:44:26',0,0,0,20199,'Test Test','2016-10-24 18:44:26'),('353cacd9-e116-417a-971f-f1b83cb04ab4',21413,20182,20155,20199,'Test Test','2016-10-24 18:44:34','2016-10-24 18:44:34',-1,21412,20199,1,0,20199,'2016-10-24 18:44:34',0,0,0,20199,'Test Test','2016-10-24 18:44:34'),('3bc5f255-fca3-4a6a-b347-63fcd3f9c040',22904,20182,20155,20199,'Test Test','2016-10-27 22:24:11','2016-10-27 22:24:11',-1,22903,20199,1,0,20199,'2016-10-27 22:24:11',0,0,0,20199,'Test Test','2016-10-27 22:24:11'),('e11d7cdf-20a8-45b3-8d6a-0f326f2d9695',23009,20182,20155,20199,'Test Test','2016-10-27 23:55:52','2016-10-27 23:55:52',-1,23008,20199,1,0,20199,'2016-10-27 23:55:52',0,0,0,20199,'Test Test','2016-10-27 23:55:52'),('3bc84eab-eb0e-4dd8-8e09-7d7adfdfea86',23033,20182,20155,20199,'Test Test','2016-10-28 00:14:28','2016-10-28 00:14:28',-1,23032,20199,1,0,20199,'2016-10-28 00:14:28',0,0,0,20199,'Test Test','2016-10-28 00:14:28'),('45539a79-6942-411b-9058-10bd6cc179a1',24004,20182,20155,20199,'Test Test','2016-11-03 10:32:26','2016-11-03 10:32:26',-1,24003,20199,1,0,20199,'2016-11-03 10:32:26',0,0,0,20199,'Test Test','2016-11-03 10:32:26'),('ea977999-2434-413b-b16c-20d7d209d12c',24518,24502,20155,20159,'','2016-11-06 15:26:10','2016-11-06 15:26:10',-1,24517,20159,1,0,0,'2016-11-06 15:26:10',0,0,0,20159,'','2016-11-06 15:26:10'),('2dfac61e-cd42-47f4-94b3-76470db62839',24848,24802,20155,20159,'','2016-11-21 17:31:22','2016-11-21 17:31:22',-1,24847,20159,1,0,0,'2016-11-21 17:31:22',0,0,0,20159,'','2016-11-21 17:31:22'),('2d62077d-f453-483d-b106-68e23cc2cf3e',24870,24855,20155,20159,'','2016-11-21 19:01:12','2016-11-21 19:01:12',-1,24869,20159,1,0,0,'2016-11-21 19:01:12',0,0,0,20159,'','2016-11-21 19:01:12'),('17985775-9d39-4f5c-93cc-6d90fceb8ba3',24879,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',-1,24878,20159,1,0,0,'2016-11-21 19:01:13',0,0,0,20159,'','2016-11-21 19:01:13'),('e140be7c-5743-476e-abed-89bc0fcea050',24887,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',-1,24886,20159,1,0,0,'2016-11-21 19:01:13',0,0,0,20159,'','2016-11-21 19:01:13'),('70b482c0-ca33-4feb-97c4-b6873579bff7',24895,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',-1,24894,20159,1,0,0,'2016-11-21 19:01:13',0,0,0,20159,'','2016-11-21 19:01:13'),('25d097a6-6ccf-4ac7-bed5-4bccb9f758cd',24903,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',-1,24902,20159,1,0,0,'2016-11-21 19:01:13',0,0,0,20159,'','2016-11-21 19:01:13'),('e6cb3be8-cb88-49e8-a062-d5928b0bd7c1',24912,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',-1,24911,20159,1,0,0,'2016-11-21 19:01:13',0,0,0,20159,'','2016-11-21 19:01:13'),('f891348c-3e70-4680-b36b-098dba0985fd',24921,24855,20155,20159,'','2016-11-21 19:01:13','2016-11-21 19:01:13',-1,24920,20159,1,0,0,'2016-11-21 19:01:13',0,0,0,20159,'','2016-11-21 19:01:13'),('196331d9-57e1-4905-9f7f-51deaceadce7',24951,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',-1,24950,20159,1,0,0,'2016-11-21 19:01:14',0,0,0,20159,'','2016-11-21 19:01:14'),('d49fe282-2983-40bf-862f-3ae8ce3051f9',24971,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',-1,24970,20159,1,0,0,'2016-11-21 19:01:14',0,0,0,20159,'','2016-11-21 19:01:14'),('31184cba-4068-42b1-89cf-2d8a5c258596',24980,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',-1,24979,20159,1,0,0,'2016-11-21 19:01:14',0,0,0,20159,'','2016-11-21 19:01:14'),('77035388-cc7d-4934-b321-15174ce085e3',24991,24855,20155,20159,'','2016-11-21 19:01:14','2016-11-21 19:01:14',-1,24990,20159,1,0,0,'2016-11-21 19:01:14',0,0,0,20159,'','2016-11-21 19:01:14'),('fb2fd397-ae71-40ec-b144-b860eb397c5f',25005,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',-1,25004,20159,1,0,0,'2016-11-21 19:01:15',0,0,0,20159,'','2016-11-21 19:01:15'),('f1f7b477-d466-43e2-9e0a-a7fff0684b34',25016,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',-1,25015,20159,1,0,0,'2016-11-21 19:01:15',0,0,0,20159,'','2016-11-21 19:01:15'),('cd80f76a-6359-41c3-9566-7371e8fb8cee',25027,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',-1,25026,20159,1,0,0,'2016-11-21 19:01:15',0,0,0,20159,'','2016-11-21 19:01:15'),('b024031d-e1e7-4df2-af68-542cb16e016d',25038,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',-1,25037,20159,1,0,0,'2016-11-21 19:01:15',0,0,0,20159,'','2016-11-21 19:01:15'),('5280f724-16df-4d29-a4f1-095b57ab6e4c',25049,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',-1,25048,20159,1,0,0,'2016-11-21 19:01:15',0,0,0,20159,'','2016-11-21 19:01:15'),('952449f6-8333-4388-855d-68f7be03f911',25060,24855,20155,20159,'','2016-11-21 19:01:15','2016-11-21 19:01:15',-1,25059,20159,1,0,0,'2016-11-21 19:01:15',0,0,0,20159,'','2016-11-21 19:01:15'),('ea55c995-3c22-45f9-b5fb-cda0207f4f43',25068,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',-1,25067,20159,1,0,0,'2016-11-21 19:01:16',0,0,0,20159,'','2016-11-21 19:01:16'),('da06eff9-e59b-422b-aa4b-df7674be17ab',25080,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',-1,25079,20159,1,0,0,'2016-11-21 19:01:16',0,0,0,20159,'','2016-11-21 19:01:16'),('4bac6e95-b283-4a8f-ac87-878e13ff30d1',25087,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',-1,25086,20159,1,0,0,'2016-11-21 19:01:16',0,0,0,20159,'','2016-11-21 19:01:16'),('f94c537a-8091-4b4c-9b3b-c383a75a1120',25094,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',-1,25093,20159,1,0,0,'2016-11-21 19:01:16',0,0,0,20159,'','2016-11-21 19:01:16'),('f3da385d-4003-4ce5-9468-587bdc49cb2e',25100,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',-1,25099,20159,1,0,0,'2016-11-21 19:01:16',0,0,0,20159,'','2016-11-21 19:01:16'),('d5fd2232-8190-46b8-9f0f-bdfe61481bf2',25106,24855,20155,20159,'','2016-11-21 19:01:16','2016-11-21 19:01:16',-1,25105,20159,1,0,0,'2016-11-21 19:01:16',0,0,0,20159,'','2016-11-21 19:01:16'),('f512e290-b6de-4d4a-97fe-3333091a70fd',25127,25111,20155,20159,'','2016-11-21 19:08:44','2016-11-21 19:08:44',-1,25126,20159,1,0,0,'2016-11-21 19:08:44',0,0,0,20159,'','2016-11-21 19:08:44'),('91227bf4-7fc1-425a-8ecd-075f2192b1e9',25808,20182,20155,20199,'Test Test','2017-02-14 21:12:59','2017-02-14 21:12:59',-1,25807,20199,1,0,20199,'2017-02-14 21:12:59',0,0,0,20199,'Test Test','2017-02-14 21:12:59'),('16d125a4-cd7a-4e41-8b20-ac922fa85a8a',26672,20620,20155,20159,'','2017-02-25 00:03:29','2017-02-25 00:03:29',-1,26671,20159,1,0,0,'2017-02-25 00:03:29',0,0,0,20159,'','2017-02-25 00:03:29');
/*!40000 ALTER TABLE `mbthread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbthreadflag`
--

DROP TABLE IF EXISTS `mbthreadflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mbthreadflag` (
  `uuid_` varchar(75) DEFAULT NULL,
  `threadFlagId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`threadFlagId`),
  UNIQUE KEY `IX_33781904` (`userId`,`threadId`),
  UNIQUE KEY `IX_FEB0FC87` (`uuid_`,`groupId`),
  KEY `IX_8CB0A24A` (`threadId`),
  KEY `IX_A28004B` (`userId`),
  KEY `IX_F36BBB83` (`uuid_`),
  KEY `IX_DCE308C5` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbthreadflag`
--

LOCK TABLES `mbthreadflag` WRITE;
/*!40000 ALTER TABLE `mbthreadflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbthreadflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdraction`
--

DROP TABLE IF EXISTS `mdraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdraction` (
  `uuid_` varchar(75) DEFAULT NULL,
  `actionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `ruleGroupInstanceId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(255) DEFAULT NULL,
  `typeSettings` longtext,
  PRIMARY KEY (`actionId`),
  UNIQUE KEY `IX_75BE36AD` (`uuid_`,`groupId`),
  KEY `IX_FD90786C` (`ruleGroupInstanceId`),
  KEY `IX_77BB5E9D` (`uuid_`),
  KEY `IX_C58A516B` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdraction`
--

LOCK TABLES `mdraction` WRITE;
/*!40000 ALTER TABLE `mdraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdrrule`
--

DROP TABLE IF EXISTS `mdrrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdrrule` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `ruleGroupId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(255) DEFAULT NULL,
  `typeSettings` longtext,
  PRIMARY KEY (`ruleId`),
  UNIQUE KEY `IX_F3EFDCB3` (`uuid_`,`groupId`),
  KEY `IX_4F4293F1` (`ruleGroupId`),
  KEY `IX_EA63B9D7` (`uuid_`),
  KEY `IX_7DEA8DF1` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdrrule`
--

LOCK TABLES `mdrrule` WRITE;
/*!40000 ALTER TABLE `mdrrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdrrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdrrulegroup`
--

DROP TABLE IF EXISTS `mdrrulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdrrulegroup` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleGroupId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  PRIMARY KEY (`ruleGroupId`),
  UNIQUE KEY `IX_46665CC4` (`uuid_`,`groupId`),
  KEY `IX_5849891C` (`groupId`),
  KEY `IX_7F26B2A6` (`uuid_`),
  KEY `IX_CC14DC2` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdrrulegroup`
--

LOCK TABLES `mdrrulegroup` WRITE;
/*!40000 ALTER TABLE `mdrrulegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdrrulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdrrulegroupinstance`
--

DROP TABLE IF EXISTS `mdrrulegroupinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdrrulegroupinstance` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleGroupInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `ruleGroupId` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`ruleGroupInstanceId`),
  UNIQUE KEY `IX_808A0036` (`classNameId`,`classPK`,`ruleGroupId`),
  UNIQUE KEY `IX_9CBC6A39` (`uuid_`,`groupId`),
  KEY `IX_C95A08D8` (`classNameId`,`classPK`),
  KEY `IX_AFF28547` (`groupId`),
  KEY `IX_22DAB85C` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_BF3E642B` (`ruleGroupId`),
  KEY `IX_B6A6BD91` (`uuid_`),
  KEY `IX_25C9D1F7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdrrulegroupinstance`
--

LOCK TABLES `mdrrulegroupinstance` WRITE;
/*!40000 ALTER TABLE `mdrrulegroupinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdrrulegroupinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershiprequest`
--

DROP TABLE IF EXISTS `membershiprequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershiprequest` (
  `membershipRequestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `comments` longtext,
  `replyComments` longtext,
  `replyDate` datetime DEFAULT NULL,
  `replierUserId` bigint(20) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`membershipRequestId`),
  KEY `IX_8A1CC4B` (`groupId`),
  KEY `IX_C28C72EC` (`groupId`,`statusId`),
  KEY `IX_35AA8FA6` (`groupId`,`userId`,`statusId`),
  KEY `IX_66D70879` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiprequest`
--

LOCK TABLES `membershiprequest` WRITE;
/*!40000 ALTER TABLE `membershiprequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `membershiprequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_usernotificationevent`
--

DROP TABLE IF EXISTS `notifications_usernotificationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_usernotificationevent` (
  `notificationEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userNotificationEventId` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `delivered` tinyint(4) DEFAULT NULL,
  `actionRequired` tinyint(4) DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`notificationEventId`),
  UNIQUE KEY `IX_DC9FCEDC` (`userNotificationEventId`),
  KEY `IX_93C52776` (`userId`,`actionRequired`),
  KEY `IX_36E5AE4C` (`userId`,`actionRequired`,`archived`),
  KEY `IX_73C065F0` (`userId`,`delivered`,`actionRequired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_usernotificationevent`
--

LOCK TABLES `notifications_usernotificationevent` WRITE;
/*!40000 ALTER TABLE `notifications_usernotificationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_usernotificationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opensocial_gadget`
--

DROP TABLE IF EXISTS `opensocial_gadget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opensocial_gadget` (
  `uuid_` varchar(75) DEFAULT NULL,
  `gadgetId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `url` longtext,
  `portletCategoryNames` longtext,
  PRIMARY KEY (`gadgetId`),
  KEY `IX_729869EE` (`companyId`),
  KEY `IX_E1F8627A` (`uuid_`),
  KEY `IX_3C79316E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opensocial_gadget`
--

LOCK TABLES `opensocial_gadget` WRITE;
/*!40000 ALTER TABLE `opensocial_gadget` DISABLE KEYS */;
/*!40000 ALTER TABLE `opensocial_gadget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opensocial_oauthconsumer`
--

DROP TABLE IF EXISTS `opensocial_oauthconsumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opensocial_oauthconsumer` (
  `oAuthConsumerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `gadgetKey` varchar(75) DEFAULT NULL,
  `serviceName` varchar(75) DEFAULT NULL,
  `consumerKey` varchar(75) DEFAULT NULL,
  `consumerSecret` longtext,
  `keyType` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`oAuthConsumerId`),
  KEY `IX_47206618` (`gadgetKey`),
  KEY `IX_8E715BF8` (`gadgetKey`,`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opensocial_oauthconsumer`
--

LOCK TABLES `opensocial_oauthconsumer` WRITE;
/*!40000 ALTER TABLE `opensocial_oauthconsumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `opensocial_oauthconsumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opensocial_oauthtoken`
--

DROP TABLE IF EXISTS `opensocial_oauthtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opensocial_oauthtoken` (
  `oAuthTokenId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `gadgetKey` varchar(75) DEFAULT NULL,
  `serviceName` varchar(75) DEFAULT NULL,
  `moduleId` bigint(20) DEFAULT NULL,
  `accessToken` varchar(75) DEFAULT NULL,
  `tokenName` varchar(75) DEFAULT NULL,
  `tokenSecret` varchar(75) DEFAULT NULL,
  `sessionHandle` varchar(75) DEFAULT NULL,
  `expiration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`oAuthTokenId`),
  KEY `IX_6C8CCC3D` (`gadgetKey`,`serviceName`),
  KEY `IX_CDD35402` (`userId`,`gadgetKey`,`serviceName`,`moduleId`,`tokenName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opensocial_oauthtoken`
--

LOCK TABLES `opensocial_oauthtoken` WRITE;
/*!40000 ALTER TABLE `opensocial_oauthtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `opensocial_oauthtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_`
--

DROP TABLE IF EXISTS `organization_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `organizationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentOrganizationId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `recursable` tinyint(4) DEFAULT NULL,
  `regionId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `comments` longtext,
  PRIMARY KEY (`organizationId`),
  UNIQUE KEY `IX_E301BDF5` (`companyId`,`name`),
  KEY `IX_834BCEB6` (`companyId`),
  KEY `IX_418E4522` (`companyId`,`parentOrganizationId`),
  KEY `IX_396D6B42` (`uuid_`),
  KEY `IX_A9D85BA6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_`
--

LOCK TABLES `organization_` WRITE;
/*!40000 ALTER TABLE `organization_` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orggrouprole`
--

DROP TABLE IF EXISTS `orggrouprole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orggrouprole` (
  `organizationId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`organizationId`,`groupId`,`roleId`),
  KEY `IX_4A527DD3` (`groupId`),
  KEY `IX_AB044D1C` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orggrouprole`
--

LOCK TABLES `orggrouprole` WRITE;
/*!40000 ALTER TABLE `orggrouprole` DISABLE KEYS */;
/*!40000 ALTER TABLE `orggrouprole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orglabor`
--

DROP TABLE IF EXISTS `orglabor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orglabor` (
  `orgLaborId` bigint(20) NOT NULL,
  `organizationId` bigint(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sunOpen` int(11) DEFAULT NULL,
  `sunClose` int(11) DEFAULT NULL,
  `monOpen` int(11) DEFAULT NULL,
  `monClose` int(11) DEFAULT NULL,
  `tueOpen` int(11) DEFAULT NULL,
  `tueClose` int(11) DEFAULT NULL,
  `wedOpen` int(11) DEFAULT NULL,
  `wedClose` int(11) DEFAULT NULL,
  `thuOpen` int(11) DEFAULT NULL,
  `thuClose` int(11) DEFAULT NULL,
  `friOpen` int(11) DEFAULT NULL,
  `friClose` int(11) DEFAULT NULL,
  `satOpen` int(11) DEFAULT NULL,
  `satClose` int(11) DEFAULT NULL,
  PRIMARY KEY (`orgLaborId`),
  KEY `IX_6AF0D434` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orglabor`
--

LOCK TABLES `orglabor` WRITE;
/*!40000 ALTER TABLE `orglabor` DISABLE KEYS */;
/*!40000 ALTER TABLE `orglabor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordpolicy`
--

DROP TABLE IF EXISTS `passwordpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwordpolicy` (
  `uuid_` varchar(75) DEFAULT NULL,
  `passwordPolicyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `defaultPolicy` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `changeable` tinyint(4) DEFAULT NULL,
  `changeRequired` tinyint(4) DEFAULT NULL,
  `minAge` bigint(20) DEFAULT NULL,
  `checkSyntax` tinyint(4) DEFAULT NULL,
  `allowDictionaryWords` tinyint(4) DEFAULT NULL,
  `minAlphanumeric` int(11) DEFAULT NULL,
  `minLength` int(11) DEFAULT NULL,
  `minLowerCase` int(11) DEFAULT NULL,
  `minNumbers` int(11) DEFAULT NULL,
  `minSymbols` int(11) DEFAULT NULL,
  `minUpperCase` int(11) DEFAULT NULL,
  `regex` varchar(75) DEFAULT NULL,
  `history` tinyint(4) DEFAULT NULL,
  `historyCount` int(11) DEFAULT NULL,
  `expireable` tinyint(4) DEFAULT NULL,
  `maxAge` bigint(20) DEFAULT NULL,
  `warningTime` bigint(20) DEFAULT NULL,
  `graceLimit` int(11) DEFAULT NULL,
  `lockout` tinyint(4) DEFAULT NULL,
  `maxFailure` int(11) DEFAULT NULL,
  `lockoutDuration` bigint(20) DEFAULT NULL,
  `requireUnlock` tinyint(4) DEFAULT NULL,
  `resetFailureCount` bigint(20) DEFAULT NULL,
  `resetTicketMaxAge` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passwordPolicyId`),
  UNIQUE KEY `IX_3FBFA9F4` (`companyId`,`name`),
  KEY `IX_8FEE65F5` (`companyId`),
  KEY `IX_2C1142E` (`companyId`,`defaultPolicy`),
  KEY `IX_51437A01` (`uuid_`),
  KEY `IX_E4D7EF87` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordpolicy`
--

LOCK TABLES `passwordpolicy` WRITE;
/*!40000 ALTER TABLE `passwordpolicy` DISABLE KEYS */;
INSERT INTO `passwordpolicy` VALUES ('3fdc9ae0-cf1d-40b4-9537-8b280329e2d0',20198,20155,20159,'','2016-10-02 17:09:32','2016-10-02 17:09:32',1,'Default Password Policy','Default Password Policy',1,1,0,0,1,0,6,0,1,0,1,'(?=.{4})(?:[a-zA-Z0-9]*)',0,6,0,8640000,86400,0,0,3,0,1,600,86400);
/*!40000 ALTER TABLE `passwordpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordpolicyrel`
--

DROP TABLE IF EXISTS `passwordpolicyrel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwordpolicyrel` (
  `passwordPolicyRelId` bigint(20) NOT NULL,
  `passwordPolicyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passwordPolicyRelId`),
  UNIQUE KEY `IX_C3A17327` (`classNameId`,`classPK`),
  KEY `IX_CD25266E` (`passwordPolicyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordpolicyrel`
--

LOCK TABLES `passwordpolicyrel` WRITE;
/*!40000 ALTER TABLE `passwordpolicyrel` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwordpolicyrel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordtracker`
--

DROP TABLE IF EXISTS `passwordtracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwordtracker` (
  `passwordTrackerId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `password_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`passwordTrackerId`),
  KEY `IX_326F75BD` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordtracker`
--

LOCK TABLES `passwordtracker` WRITE;
/*!40000 ALTER TABLE `passwordtracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwordtracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `uuid_` varchar(75) DEFAULT NULL,
  `phoneId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`phoneId`),
  KEY `IX_9F704A14` (`companyId`),
  KEY `IX_A2E4AFBA` (`companyId`,`classNameId`),
  KEY `IX_9A53569` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_812CE07A` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_F202B9CE` (`userId`),
  KEY `IX_EA6245A0` (`uuid_`),
  KEY `IX_B271FA88` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginsetting`
--

DROP TABLE IF EXISTS `pluginsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsetting` (
  `pluginSettingId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `pluginId` varchar(75) DEFAULT NULL,
  `pluginType` varchar(75) DEFAULT NULL,
  `roles` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`pluginSettingId`),
  UNIQUE KEY `IX_7171B2E8` (`companyId`,`pluginId`,`pluginType`),
  KEY `IX_B9746445` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginsetting`
--

LOCK TABLES `pluginsetting` WRITE;
/*!40000 ALTER TABLE `pluginsetting` DISABLE KEYS */;
INSERT INTO `pluginsetting` VALUES (25130,20155,'pixelpress_WAR_pixelpresstheme','theme','',0);
/*!40000 ALTER TABLE `pluginsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pollschoice`
--

DROP TABLE IF EXISTS `pollschoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pollschoice` (
  `uuid_` varchar(75) DEFAULT NULL,
  `choiceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`choiceId`),
  UNIQUE KEY `IX_D76DD2CF` (`questionId`,`name`),
  UNIQUE KEY `IX_C222BD31` (`uuid_`,`groupId`),
  KEY `IX_EC370F10` (`questionId`),
  KEY `IX_6660B399` (`uuid_`),
  KEY `IX_8AE746EF` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pollschoice`
--

LOCK TABLES `pollschoice` WRITE;
/*!40000 ALTER TABLE `pollschoice` DISABLE KEYS */;
INSERT INTO `pollschoice` VALUES ('87eee792-92d7-422e-8ff0-b79faa8ffc61',22825,20182,20155,20199,'Test Test','2016-10-26 23:31:04','2016-10-26 23:31:04',22824,'a','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Yes</Description></root>'),('00037c86-f59a-4f57-86aa-99e7be64dd36',22826,20182,20155,20199,'Test Test','2016-10-26 23:31:04','2016-10-26 23:31:04',22824,'b','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">No</Description></root>'),('a08b9429-2ef0-42af-98db-0e917ea4b1df',22827,20182,20155,20199,'Test Test','2016-10-26 23:31:04','2016-10-26 23:31:04',22824,'c','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Don\'t know</Description></root>');
/*!40000 ALTER TABLE `pollschoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pollsquestion`
--

DROP TABLE IF EXISTS `pollsquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pollsquestion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `questionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `expirationDate` datetime DEFAULT NULL,
  `lastVoteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  UNIQUE KEY `IX_F3C9F36` (`uuid_`,`groupId`),
  KEY `IX_9FF342EA` (`groupId`),
  KEY `IX_51F087F4` (`uuid_`),
  KEY `IX_F910BBB4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pollsquestion`
--

LOCK TABLES `pollsquestion` WRITE;
/*!40000 ALTER TABLE `pollsquestion` DISABLE KEYS */;
INSERT INTO `pollsquestion` VALUES ('1f4a881c-0f3e-40b7-ac58-167ddb07ab8f',22824,20182,20155,20199,'Test Test','2016-10-26 23:31:04','2016-10-26 23:31:04','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Test1</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Lol?</Description></root>',NULL,'2016-10-26 23:31:25');
/*!40000 ALTER TABLE `pollsquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pollsvote`
--

DROP TABLE IF EXISTS `pollsvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pollsvote` (
  `uuid_` varchar(75) DEFAULT NULL,
  `voteId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `choiceId` bigint(20) DEFAULT NULL,
  `voteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`voteId`),
  UNIQUE KEY `IX_1BBFD4D3` (`questionId`,`userId`),
  UNIQUE KEY `IX_A88C673A` (`uuid_`,`groupId`),
  KEY `IX_D5DF7B54` (`choiceId`),
  KEY `IX_12112599` (`questionId`),
  KEY `IX_FD32EB70` (`uuid_`),
  KEY `IX_7D8E92B8` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pollsvote`
--

LOCK TABLES `pollsvote` WRITE;
/*!40000 ALTER TABLE `pollsvote` DISABLE KEYS */;
INSERT INTO `pollsvote` VALUES ('5807f302-2ff1-448a-b925-85956d611e49',22828,20182,20155,20199,'Test Test','2016-10-26 23:31:25','2016-10-26 23:31:25',22824,22826,'2016-10-26 23:31:25');
/*!40000 ALTER TABLE `pollsvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portalpreferences`
--

DROP TABLE IF EXISTS `portalpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalpreferences` (
  `portalPreferencesId` bigint(20) NOT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`portalPreferencesId`),
  KEY `IX_D1F795F1` (`ownerId`,`ownerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portalpreferences`
--

LOCK TABLES `portalpreferences` WRITE;
/*!40000 ALTER TABLE `portalpreferences` DISABLE KEYS */;
INSERT INTO `portalpreferences` VALUES (20154,0,1,'<portlet-preferences />'),(20161,20155,1,'<portlet-preferences><preference><name>company.security.strangers.verify</name><value>false</value></preference><preference><name>ldap.password.policy.enabled</name><value>true</value></preference><preference><name>locales</name><value>en_US,ru_RU</value></preference><preference><name>ldap.server.ids</name><value></value></preference><preference><name>admin.analytics.types</name><value>google[$NEW_LINE$]piwik</value></preference><preference><name>admin.email.password.reset.subject</name><value>[$PORTAL_URL$]: Reset Your Password</value></preference><preference><name>admin.email.user.added.subject</name><value>[$PORTAL_URL$]: Your New Account</value></preference><preference><name>admin.email.password.sent.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Your new password for [$PORTAL_URL$] is [$USER_PASSWORD$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]The request for a new password was made from [$REMOTE_ADDRESS$] / [$REMOTE_HOST$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.verification.subject</name><value>[$PORTAL_URL$]: Email Address Verification</value></preference><preference><name>open.id.auth.enabled</name><value>false</value></preference><preference><name>admin.default.role.names</name><value>Power User[$NEW_LINE$]User</value></preference><preference><name>company.security.strangers.with.mx</name><value>true</value></preference><preference><name>company.security.auto.login</name><value>true</value></preference><preference><name>company.security.site.logo</name><value>true</value></preference><preference><name>admin.email.password.sent.subject</name><value>[$PORTAL_URL$]: Your New Password</value></preference><preference><name>admin.email.password.reset.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]You can reset your password for [$PORTAL_URL$] at [$PASSWORD_RESET_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]The request for a new password was made from [$REMOTE_ADDRESS$] / [$REMOTE_HOST$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>company.security.send.password</name><value>false</value></preference><preference><name>admin.email.verification.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Please verify your email address for [$PORTAL_URL$] at [$EMAIL_VERIFICATION_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Your verification code is [$EMAIL_VERIFICATION_CODE$] Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.user.added.no.password.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.user.added.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$]. Your password is [$USER_PASSWORD$]. Enjoy!&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>company.security.strangers</name><value>true</value></preference><preference><name>company.security.auth.type</name><value>emailAddress</value></preference></portlet-preferences>'),(20514,20159,4,'<portlet-preferences />'),(20616,20199,4,'<portlet-preferences><preference><name>15#articles-order-by-col</name><value>id</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.pages</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionTreeJSClicks#layoutsTree</name><value>7,</value></preference><preference><name>com.liferay.portal.util.SessionClicks#control-panel-sidebar-minimized</name><value>1</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.configuration</name><value>closed</value></preference><preference><name>125#entries-order-by-col</name><value>removed-date</value></preference><preference><name>125#entries-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.util.SessionClicks#regularlayoutsAdminLookAndFeelSettingsPanel</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory7</name><value>open</value></preference><preference><name>15#articles-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.content</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_details</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_customizationSettings</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#liferay_toggle_controls</name><value>visible</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.users</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory0</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#liferay_addpanel_tab</name><value>applications</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_advanced</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_embeddedPortlets</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_customFields</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_mobileDeviceRules</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#p_auth</name><value>6r7rZnzh</value></preference><preference><name>com.liferay.portal.util.SessionClicks#vocabularyExtraFieldsPanelContainer</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_lookAndFeel</name><value>open</value></preference></portlet-preferences>');
/*!40000 ALTER TABLE `portalpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet`
--

DROP TABLE IF EXISTS `portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet` (
  `id_` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `roles` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_12B5E51D` (`companyId`,`portletId`),
  KEY `IX_80CC9508` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet`
--

LOCK TABLES `portlet` WRITE;
/*!40000 ALTER TABLE `portlet` DISABLE KEYS */;
INSERT INTO `portlet` VALUES (20205,20155,'98','',0),(20206,20155,'183','',1),(20207,20155,'66','',1),(20208,20155,'180','',1),(20209,20155,'27','',1),(20210,20155,'152','',1),(20211,20155,'134','',1),(20212,20155,'130','',1),(20213,20155,'122','',1),(20214,20155,'36','',1),(20215,20155,'26','',1),(20216,20155,'175','',1),(20217,20155,'153','',1),(20218,20155,'64','',1),(20219,20155,'129','',1),(20220,20155,'182','',1),(20221,20155,'179','',1),(20222,20155,'173','',0),(20223,20155,'100','',1),(20224,20155,'19','',1),(20225,20155,'157','',1),(20226,20155,'181','',1),(20227,20155,'128','',1),(20228,20155,'154','',1),(20229,20155,'148','',1),(20230,20155,'11','',1),(20231,20155,'29','',1),(20232,20155,'158','',1),(20233,20155,'178','',1),(20234,20155,'58','',1),(20235,20155,'71','',1),(20236,20155,'97','',1),(20237,20155,'39','',1),(20238,20155,'85','',1),(20239,20155,'118','',1),(20240,20155,'107','',1),(20241,20155,'30','',1),(20242,20155,'184','',1),(20243,20155,'147','',1),(20244,20155,'48','',1),(20245,20155,'125','',1),(20246,20155,'161','',1),(20247,20155,'146','',1),(20248,20155,'62','',0),(20249,20155,'162','',1),(20250,20155,'176','',1),(20251,20155,'108','',1),(20252,20155,'187','',1),(20253,20155,'84','',1),(20254,20155,'101','',1),(20255,20155,'121','',1),(20256,20155,'143','',1),(20257,20155,'77','',1),(20258,20155,'167','',1),(20259,20155,'115','',1),(20260,20155,'56','',1),(20261,20155,'16','',1),(20262,20155,'3','',1),(20263,20155,'20','',1),(20264,20155,'23','',1),(20265,20155,'83','',1),(20266,20155,'99','',1),(20267,20155,'186','',1),(20268,20155,'194','',1),(20269,20155,'70','',1),(20270,20155,'164','',1),(20271,20155,'141','',1),(20272,20155,'9','',1),(20273,20155,'28','',1),(20274,20155,'137','',1),(20275,20155,'15','',1),(20276,20155,'47','',1),(20277,20155,'116','',1),(20278,20155,'82','',1),(20279,20155,'151','',1),(20280,20155,'54','',1),(20281,20155,'34','',1),(20282,20155,'132','',1),(20283,20155,'169','',1),(20284,20155,'61','',1),(20285,20155,'73','',1),(20286,20155,'50','',1),(20287,20155,'127','',1),(20288,20155,'193','',1),(20289,20155,'31','',1),(20290,20155,'25','',1),(20291,20155,'166','',1),(20292,20155,'33','',1),(20293,20155,'150','',1),(20294,20155,'114','',1),(20295,20155,'149','',1),(20296,20155,'67','',1),(20297,20155,'110','',1),(20298,20155,'59','',1),(20299,20155,'135','',1),(20300,20155,'188','',1),(20301,20155,'131','',1),(20302,20155,'102','',1),(20447,20155,'1_WAR_calendarportlet','',1),(20498,20155,'1_WAR_notificationsportlet','',1),(20503,20155,'4_WAR_opensocialportlet','',1),(20504,20155,'2_WAR_opensocialportlet','',1),(20505,20155,'1_WAR_opensocialportlet','',1),(20506,20155,'3_WAR_opensocialportlet','',1),(20513,20155,'1_WAR_webformportlet','',1),(20801,20155,'bookscatalog_WAR_tiislibraryportlet','',1),(21518,20155,'library_WAR_tiislibraryportlet','',1),(24101,20155,'bookinfo_WAR_tiislibraryportlet','',1),(24601,20155,'librarymanagment_WAR_tiislibraryportlet','',1);
/*!40000 ALTER TABLE `portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portletitem`
--

DROP TABLE IF EXISTS `portletitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portletitem` (
  `portletItemId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`portletItemId`),
  KEY `IX_96BDD537` (`groupId`,`classNameId`),
  KEY `IX_D699243F` (`groupId`,`name`,`portletId`,`classNameId`),
  KEY `IX_2C61314E` (`groupId`,`portletId`),
  KEY `IX_E922D6C0` (`groupId`,`portletId`,`classNameId`),
  KEY `IX_8E71167F` (`groupId`,`portletId`,`classNameId`,`name`),
  KEY `IX_33B8CE8D` (`groupId`,`portletId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portletitem`
--

LOCK TABLES `portletitem` WRITE;
/*!40000 ALTER TABLE `portletitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `portletitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portletpreferences`
--

DROP TABLE IF EXISTS `portletpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portletpreferences` (
  `portletPreferencesId` bigint(20) NOT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`portletPreferencesId`),
  UNIQUE KEY `IX_C7057FF7` (`ownerId`,`ownerType`,`plid`,`portletId`),
  KEY `IX_E4F13E6E` (`ownerId`,`ownerType`,`plid`),
  KEY `IX_C9A3FCE2` (`ownerId`,`ownerType`,`portletId`),
  KEY `IX_D5EDA3A1` (`ownerType`,`plid`,`portletId`),
  KEY `IX_A3B2A80C` (`ownerType`,`portletId`),
  KEY `IX_F15C1C4F` (`plid`),
  KEY `IX_D340DB76` (`plid`,`portletId`),
  KEY `IX_8E6DA3A1` (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portletpreferences`
--

LOCK TABLES `portletpreferences` WRITE;
/*!40000 ALTER TABLE `portletpreferences` DISABLE KEYS */;
INSERT INTO `portletpreferences` VALUES (20327,0,3,20320,'148_INSTANCE_yRd2QnjG7SOz','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>showZeroAssetCount</name><value>false</value></preference><preference><name>classNameId</name><value>20007</value></preference><preference><name>displayStyle</name><value>cloud</value></preference><preference><name>maxAssetTags</name><value>10</value></preference></portlet-preferences>'),(20348,0,3,20342,'141_INSTANCE_iKsu1dFDc5TA','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>classNameId</name><value>20016</value></preference></portlet-preferences>'),(20367,0,3,20361,'3','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(20368,0,3,20361,'101_INSTANCE_5erQjJCp1AmD','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>anyAssetType</name><value>false</value></preference><preference><name>portletSetupTitle_en_US</name><value>Upcoming Events</value></preference></portlet-preferences>'),(20393,0,3,20387,'3','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(20394,0,3,20387,'82','<portlet-preferences><preference><name>displayStyle</name><value>3</value></preference></portlet-preferences>'),(20395,0,3,20387,'101_INSTANCE_UwZwjRTT7KcJ','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>portletSetupTitle_en_US</name><value>Recent Content</value></preference></portlet-preferences>'),(20402,0,3,20396,'20','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(20403,0,3,20396,'101_INSTANCE_hmIO5Hm0VPQw','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>anyAssetType</name><value>false</value></preference><preference><name>portletSetupTitle_en_US</name><value>Upcoming Events</value></preference></portlet-preferences>'),(20410,0,3,20404,'39_INSTANCE_q5gobxJHASSS','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>expandedEntriesPerFeed</name><value>3</value></preference><preference><name>urls</name><value>http://partners.userland.com/nytRss/technology.xml</value></preference><preference><name>entriesPerFeed</name><value>4</value></preference><preference><name>portletSetupTitle_en_US</name><value>Technology news</value></preference></portlet-preferences>'),(20411,0,3,20404,'39_INSTANCE_ghTzLw0vrulo','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>expandedEntriesPerFeed</name><value>0</value></preference><preference><name>urls</name><value>http://www.liferay.com/en/about-us/news/-/blogs/rss</value></preference><preference><name>titles</name><value>Liferay Press Releases</value></preference><preference><name>entriesPerFeed</name><value>4</value></preference><preference><name>portletSetupTitle_en_US</name><value>Liferay news</value></preference></portlet-preferences>'),(20515,0,3,20185,'145','<portlet-preferences />'),(20617,0,3,20185,'2_WAR_notificationsportlet','<portlet-preferences />'),(20649,0,3,20176,'160','<portlet-preferences />'),(20650,0,3,20176,'156','<portlet-preferences />'),(20651,0,3,20176,'145','<portlet-preferences />'),(20652,0,3,20176,'2_WAR_notificationsportlet','<portlet-preferences />'),(20901,0,3,20176,'2','<portlet-preferences />'),(20902,0,3,20610,'145','<portlet-preferences />'),(20903,0,3,20610,'2_WAR_notificationsportlet','<portlet-preferences />'),(21001,0,3,20176,'190','<portlet-preferences />'),(21002,0,3,20176,'137','<portlet-preferences />'),(21003,0,3,20176,'130','<portlet-preferences />'),(21014,0,3,20176,'165','<portlet-preferences />'),(21133,0,3,20176,'178','<portlet-preferences />'),(21145,20182,2,0,'15','<portlet-preferences />'),(21206,0,3,20176,'3_WAR_marketplaceportlet','<portlet-preferences />'),(21207,20199,4,20176,'3_WAR_marketplaceportlet','<portlet-preferences />'),(21302,0,3,20176,'174','<portlet-preferences />'),(21402,0,3,20713,'145','<portlet-preferences />'),(21403,0,3,20713,'2_WAR_notificationsportlet','<portlet-preferences />'),(21416,0,3,21404,'145','<portlet-preferences />'),(21417,0,3,21404,'2_WAR_notificationsportlet','<portlet-preferences />'),(21418,0,3,21410,'145','<portlet-preferences />'),(21419,0,3,21410,'2_WAR_notificationsportlet','<portlet-preferences />'),(22602,0,3,20176,'15','<portlet-preferences />'),(22618,0,3,20176,'147','<portlet-preferences />'),(22806,0,3,20176,'182','<portlet-preferences />'),(22819,0,3,20176,'99','<portlet-preferences />'),(22822,0,3,20176,'25','<portlet-preferences />'),(22823,20182,2,0,'25','<portlet-preferences />'),(22829,0,3,20176,'28','<portlet-preferences />'),(22830,20182,2,0,'28','<portlet-preferences />'),(22831,20201,2,0,'15','<portlet-preferences />'),(22833,0,3,20176,'4_WAR_opensocialportlet','<portlet-preferences />'),(22839,0,3,20176,'152','<portlet-preferences />'),(22840,0,3,20176,'179','<portlet-preferences />'),(22841,0,3,20176,'183','<portlet-preferences />'),(22907,0,3,22901,'145','<portlet-preferences />'),(22908,0,3,22901,'2_WAR_notificationsportlet','<portlet-preferences />'),(23023,0,3,20185,'56_INSTANCE_hxzxircFM6RQ','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>false</value></preference><preference><name>showAvailableLocales</name><value>false</value></preference><preference><name>enableViewCountIncrement</name><value>false</value></preference><preference><name>portlet-freeform-styles</name><value>height=850px[$NEW_LINE$]width=1725px[$NEW_LINE$]top=213px[$NEW_LINE$]left=-100px[$NEW_LINE$]</value></preference><preference><name>enableRatings</name><value>false</value></preference><preference><name>articleId</name><value>23002</value></preference><preference><name>extensions</name><value>NULL_VALUE</value></preference><preference><name>enableRelatedAssets</name><value>false</value></preference><preference><name>portletSetupCss</name><value>{&#034;wapData&#034;:{&#034;title&#034;:&#034;&#034;,&#034;initialWindowState&#034;:&#034;NORMAL&#034;},&#034;spacingData&#034;:{&#034;margin&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;padding&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;borderData&#034;:{&#034;borderStyle&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderColor&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderWidth&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;textData&#034;:{&#034;fontWeight&#034;:&#034;&#034;,&#034;lineHeight&#034;:&#034;&#034;,&#034;textDecoration&#034;:&#034;&#034;,&#034;letterSpacing&#034;:&#034;&#034;,&#034;color&#034;:&#034;&#034;,&#034;textAlign&#034;:&#034;&#034;,&#034;fontStyle&#034;:&#034;&#034;,&#034;fontFamily&#034;:&#034;&#034;,&#034;wordSpacing&#034;:&#034;&#034;,&#034;fontSize&#034;:&#034;&#034;},&#034;bgData&#034;:{&#034;backgroundPosition&#034;:{&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;backgroundColor&#034;:&#034;&#034;,&#034;backgroundRepeat&#034;:&#034;&#034;,&#034;backgroundImage&#034;:&#034;&#034;,&#034;useBgImage&#034;:false},&#034;advancedData&#034;:{&#034;customCSS&#034;:&#034;&#034;,&#034;customCSSClassName&#034;:&#034;&#034;}}</value></preference><preference><name>enablePrint</name><value>false</value></preference><preference><name>enableCommentRatings</name><value>false</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>ddmTemplateKey</name><value></value></preference><preference><name>groupId</name><value>20182</value></preference><preference><name>enableComments</name><value>false</value></preference></portlet-preferences>'),(23029,0,3,20185,'library_WAR_tiislibraryportlet','<portlet-preferences />'),(23036,0,3,23030,'145','<portlet-preferences />'),(23037,0,3,23030,'2_WAR_notificationsportlet','<portlet-preferences />'),(23038,0,3,23030,'library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>false</value></preference><preference><name>popularBooksAmount</name><value>6</value></preference><preference><name>portletSetupCss</name><value>{&#034;wapData&#034;:{&#034;title&#034;:&#034;&#034;,&#034;initialWindowState&#034;:&#034;NORMAL&#034;},&#034;spacingData&#034;:{&#034;margin&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;padding&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;borderData&#034;:{&#034;borderStyle&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderColor&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderWidth&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;textData&#034;:{&#034;fontWeight&#034;:&#034;&#034;,&#034;lineHeight&#034;:&#034;&#034;,&#034;textDecoration&#034;:&#034;&#034;,&#034;letterSpacing&#034;:&#034;&#034;,&#034;color&#034;:&#034;&#034;,&#034;textAlign&#034;:&#034;&#034;,&#034;fontStyle&#034;:&#034;&#034;,&#034;fontFamily&#034;:&#034;&#034;,&#034;wordSpacing&#034;:&#034;&#034;,&#034;fontSize&#034;:&#034;&#034;},&#034;bgData&#034;:{&#034;backgroundPosition&#034;:{&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;backgroundColor&#034;:&#034;&#034;,&#034;backgroundRepeat&#034;:&#034;&#034;,&#034;backgroundImage&#034;:&#034;&#034;,&#034;useBgImage&#034;:false},&#034;advancedData&#034;:{&#034;customCSS&#034;:&#034;&#034;,&#034;customCSSClassName&#034;:&#034;&#034;}}</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>portletViewMode</name><value>isPopularBooksView</value></preference></portlet-preferences>'),(23043,0,3,20185,'library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD','<portlet-preferences />'),(23501,0,3,22901,'library_WAR_tiislibraryportlet_INSTANCE_5WA2keNLjgqy','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>false</value></preference><preference><name>popularBooksAmount</name><value>6</value></preference><preference><name>portletSetupCss</name><value>{&#034;wapData&#034;:{&#034;title&#034;:&#034;&#034;,&#034;initialWindowState&#034;:&#034;NORMAL&#034;},&#034;spacingData&#034;:{&#034;margin&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;padding&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;borderData&#034;:{&#034;borderStyle&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderColor&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderWidth&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;textData&#034;:{&#034;fontWeight&#034;:&#034;&#034;,&#034;lineHeight&#034;:&#034;&#034;,&#034;textDecoration&#034;:&#034;&#034;,&#034;letterSpacing&#034;:&#034;&#034;,&#034;color&#034;:&#034;&#034;,&#034;textAlign&#034;:&#034;&#034;,&#034;fontStyle&#034;:&#034;&#034;,&#034;fontFamily&#034;:&#034;&#034;,&#034;wordSpacing&#034;:&#034;&#034;,&#034;fontSize&#034;:&#034;&#034;},&#034;bgData&#034;:{&#034;backgroundPosition&#034;:{&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;backgroundColor&#034;:&#034;&#034;,&#034;backgroundRepeat&#034;:&#034;&#034;,&#034;backgroundImage&#034;:&#034;&#034;,&#034;useBgImage&#034;:false},&#034;advancedData&#034;:{&#034;customCSS&#034;:&#034;&#034;,&#034;customCSSClassName&#034;:&#034;&#034;}}</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>portletViewMode</name><value>isCatalogView</value></preference></portlet-preferences>'),(24007,0,3,24001,'145','<portlet-preferences />'),(24008,0,3,24001,'2_WAR_notificationsportlet','<portlet-preferences />'),(24301,0,3,24001,'bookinfo_WAR_tiislibraryportlet','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>false</value></preference><preference><name>portletSetupCss</name><value>{&#034;wapData&#034;:{&#034;title&#034;:&#034;&#034;,&#034;initialWindowState&#034;:&#034;NORMAL&#034;},&#034;spacingData&#034;:{&#034;margin&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;padding&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;borderData&#034;:{&#034;borderStyle&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderColor&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:&#034;&#034;,&#034;left&#034;:&#034;&#034;,&#034;right&#034;:&#034;&#034;,&#034;top&#034;:&#034;&#034;},&#034;borderWidth&#034;:{&#034;sameForAll&#034;:true,&#034;bottom&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;right&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}}},&#034;textData&#034;:{&#034;fontWeight&#034;:&#034;&#034;,&#034;lineHeight&#034;:&#034;&#034;,&#034;textDecoration&#034;:&#034;&#034;,&#034;letterSpacing&#034;:&#034;&#034;,&#034;color&#034;:&#034;&#034;,&#034;textAlign&#034;:&#034;&#034;,&#034;fontStyle&#034;:&#034;&#034;,&#034;fontFamily&#034;:&#034;&#034;,&#034;wordSpacing&#034;:&#034;&#034;,&#034;fontSize&#034;:&#034;&#034;},&#034;bgData&#034;:{&#034;backgroundPosition&#034;:{&#034;left&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;},&#034;top&#034;:{&#034;unit&#034;:&#034;px&#034;,&#034;value&#034;:&#034;&#034;}},&#034;backgroundColor&#034;:&#034;&#034;,&#034;backgroundRepeat&#034;:&#034;&#034;,&#034;backgroundImage&#034;:&#034;&#034;,&#034;useBgImage&#034;:false},&#034;advancedData&#034;:{&#034;customCSS&#034;:&#034;&#034;,&#034;customCSSClassName&#034;:&#034;&#034;}}</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(24874,24855,2,0,'20','<portlet-preferences />'),(24959,24855,2,0,'15','<portlet-preferences />'),(25071,0,3,25065,'56_INSTANCE_OIR2gK9jmKfI','<portlet-preferences><preference><name>articleId</name><value>TEXT-LINK-IMAGE-SLIDER</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25072,0,3,25065,'56_INSTANCE_yaAam8InsEtE','<portlet-preferences><preference><name>articleId</name><value>CUSTOM-PORTLETS</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25073,0,3,25065,'56_INSTANCE_P0LZA4YCeb1d','<portlet-preferences><preference><name>articleId</name><value>RESPONSIVE-LAYOUT</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25074,0,3,25065,'56_INSTANCE_dXKZGFN8S9av','<portlet-preferences><preference><name>articleId</name><value>SKINS</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25075,0,3,25065,'56_INSTANCE_JQLULPmJHBAQ','<portlet-preferences><preference><name>articleId</name><value>MINI-PORTOFOLIO</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25076,0,3,25065,'56_INSTANCE_6YRMNCEdPqLu','<portlet-preferences><preference><name>articleId</name><value>TESTIMONIALS</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25083,0,3,25077,'56_INSTANCE_K3WFW4pB3MEg','<portlet-preferences><preference><name>articleId</name><value>CAROUSEL</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25090,0,3,25084,'56_INSTANCE_TvwnctsNXcf4','<portlet-preferences><preference><name>articleId</name><value>PORTFOLIO</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>24855</value></preference></portlet-preferences>'),(25109,0,3,25103,'1_WAR_webformportlet_INSTANCE_t77GAfHbo0NC','<portlet-preferences><preference><name>description</name><value></value></preference><preference><name>subject</name><value>Suggestions</value></preference><preference><name>fieldType2</name><value>radio</value></preference><preference><name>fieldType3</name><value>textarea</value></preference><preference><name>fieldType1</name><value>text</value></preference><preference><name>fieldOptions2</name><value>option1,option2,option3</value></preference><preference><name>saveToDatabase</name><value>true</value></preference><preference><name>title</name><value></value></preference><preference><name>fieldLabel1</name><value>Name</value></preference><preference><name>fieldLabel2</name><value>Rating</value></preference><preference><name>fieldLabel3</name><value>Comments</value></preference><preference><name>fieldType</name><value>email</value></preference></portlet-preferences>'),(25131,0,3,22901,'56_INSTANCE_HEADER','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(25132,0,3,22901,'56_INSTANCE_FOOTER','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(25801,0,3,20176,'20','<portlet-preferences />'),(25802,20182,2,0,'20','<portlet-preferences />'),(25804,0,3,20176,'134','<portlet-preferences />'),(25811,0,3,25805,'145','<portlet-preferences />'),(25812,0,3,25805,'2_WAR_notificationsportlet','<portlet-preferences />'),(26111,20195,2,0,'15','<portlet-preferences />');
/*!40000 ALTER TABLE `portletpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_blob_triggers`
--

DROP TABLE IF EXISTS `quartz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_blob_triggers`
--

LOCK TABLES `quartz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `quartz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_calendars`
--

DROP TABLE IF EXISTS `quartz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` longblob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_calendars`
--

LOCK TABLES `quartz_calendars` WRITE;
/*!40000 ALTER TABLE `quartz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_cron_triggers`
--

DROP TABLE IF EXISTS `quartz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_cron_triggers`
--

LOCK TABLES `quartz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `quartz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_fired_triggers`
--

DROP TABLE IF EXISTS `quartz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(4) DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IX_BE3835E5` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IX_4BD722BM` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IX_204D31E8` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IX_339E078M` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IX_5005E3AF` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_BC2F03B0` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_fired_triggers`
--

LOCK TABLES `quartz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `quartz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_job_details`
--

DROP TABLE IF EXISTS `quartz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` tinyint(4) NOT NULL,
  `IS_NONCONCURRENT` tinyint(4) NOT NULL,
  `IS_UPDATE_DATA` tinyint(4) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(4) NOT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_88328984` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IX_779BCA37` (`SCHED_NAME`,`REQUESTS_RECOVERY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_job_details`
--

LOCK TABLES `quartz_job_details` WRITE;
/*!40000 ALTER TABLE `quartz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_locks`
--

DROP TABLE IF EXISTS `quartz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_locks`
--

LOCK TABLES `quartz_locks` WRITE;
/*!40000 ALTER TABLE `quartz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `quartz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_paused_trigger_grps`
--

LOCK TABLES `quartz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `quartz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_scheduler_state`
--

DROP TABLE IF EXISTS `quartz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_scheduler_state`
--

LOCK TABLES `quartz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `quartz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_simple_triggers`
--

DROP TABLE IF EXISTS `quartz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_simple_triggers`
--

LOCK TABLES `quartz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `quartz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_simprop_triggers`
--

DROP TABLE IF EXISTS `quartz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` tinyint(4) DEFAULT NULL,
  `BOOL_PROP_2` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_simprop_triggers`
--

LOCK TABLES `quartz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `quartz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartz_triggers`
--

DROP TABLE IF EXISTS `quartz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quartz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` int(11) DEFAULT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IX_186442A4` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IX_1BA1F9DC` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IX_91CA7CCE` (`SCHED_NAME`,`TRIGGER_GROUP`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`,`MISFIRE_INSTR`),
  KEY `IX_D219AFDE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IX_A85822A0` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_8AA50BE1` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IX_EEFE382A` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IX_F026CF4C` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IX_F2DD7C7E` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`,`MISFIRE_INSTR`),
  KEY `IX_1F92813C` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`MISFIRE_INSTR`),
  KEY `IX_99108B6E` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IX_CD7132D0` (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartz_triggers`
--

LOCK TABLES `quartz_triggers` WRITE;
/*!40000 ALTER TABLE `quartz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quartz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingsentry`
--

DROP TABLE IF EXISTS `ratingsentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratingsentry` (
  `entryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_B47E3C11` (`userId`,`classNameId`,`classPK`),
  KEY `IX_16184D57` (`classNameId`,`classPK`),
  KEY `IX_A1A8CB8B` (`classNameId`,`classPK`,`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingsentry`
--

LOCK TABLES `ratingsentry` WRITE;
/*!40000 ALTER TABLE `ratingsentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratingsentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingsstats`
--

DROP TABLE IF EXISTS `ratingsstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratingsstats` (
  `statsId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `totalScore` double DEFAULT NULL,
  `averageScore` double DEFAULT NULL,
  PRIMARY KEY (`statsId`),
  UNIQUE KEY `IX_A6E99284` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingsstats`
--

LOCK TABLES `ratingsstats` WRITE;
/*!40000 ALTER TABLE `ratingsstats` DISABLE KEYS */;
INSERT INTO `ratingsstats` VALUES (22836,20012,22834,0,0,0),(23007,20109,23004,0,0,0),(25401,20109,24935,0,0,0),(25402,20109,24967,0,0,0),(25403,20109,24976,0,0,0),(25404,20109,24986,0,0,0),(25405,20109,25001,0,0,0),(25406,20109,25012,0,0,0),(25407,20109,25023,0,0,0),(25408,20109,25034,0,0,0),(25409,20109,25045,0,0,0),(25410,20109,25056,0,0,0),(25411,20011,24866,0,0,0),(25412,20011,24875,0,0,0),(25413,20011,24883,0,0,0),(25414,20011,24891,0,0,0),(25415,20011,24899,0,0,0),(25416,20011,24908,0,0,0),(25417,20011,24916,0,0,0);
/*!40000 ALTER TABLE `ratingsstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `regionId` bigint(20) NOT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `regionCode` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`regionId`),
  UNIQUE KEY `IX_A2635F5C` (`countryId`,`regionCode`),
  KEY `IX_2D9A426F` (`active_`),
  KEY `IX_16D87CA7` (`countryId`),
  KEY `IX_11FB3E42` (`countryId`,`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1001,1,'AB','Alberta',1),(1002,1,'BC','British Columbia',1),(1003,1,'MB','Manitoba',1),(1004,1,'NB','New Brunswick',1),(1005,1,'NL','Newfoundland and Labrador',1),(1006,1,'NT','Northwest Territories',1),(1007,1,'NS','Nova Scotia',1),(1008,1,'NU','Nunavut',1),(1009,1,'ON','Ontario',1),(1010,1,'PE','Prince Edward Island',1),(1011,1,'QC','Quebec',1),(1012,1,'SK','Saskatchewan',1),(1013,1,'YT','Yukon',1),(2001,2,'CN-34','Anhui',1),(2002,2,'CN-92','Aomen',1),(2003,2,'CN-11','Beijing',1),(2004,2,'CN-50','Chongqing',1),(2005,2,'CN-35','Fujian',1),(2006,2,'CN-62','Gansu',1),(2007,2,'CN-44','Guangdong',1),(2008,2,'CN-45','Guangxi',1),(2009,2,'CN-52','Guizhou',1),(2010,2,'CN-46','Hainan',1),(2011,2,'CN-13','Hebei',1),(2012,2,'CN-23','Heilongjiang',1),(2013,2,'CN-41','Henan',1),(2014,2,'CN-42','Hubei',1),(2015,2,'CN-43','Hunan',1),(2016,2,'CN-32','Jiangsu',1),(2017,2,'CN-36','Jiangxi',1),(2018,2,'CN-22','Jilin',1),(2019,2,'CN-21','Liaoning',1),(2020,2,'CN-15','Nei Mongol',1),(2021,2,'CN-64','Ningxia',1),(2022,2,'CN-63','Qinghai',1),(2023,2,'CN-61','Shaanxi',1),(2024,2,'CN-37','Shandong',1),(2025,2,'CN-31','Shanghai',1),(2026,2,'CN-14','Shanxi',1),(2027,2,'CN-51','Sichuan',1),(2028,2,'CN-71','Taiwan',1),(2029,2,'CN-12','Tianjin',1),(2030,2,'CN-91','Xianggang',1),(2031,2,'CN-65','Xinjiang',1),(2032,2,'CN-54','Xizang',1),(2033,2,'CN-53','Yunnan',1),(2034,2,'CN-33','Zhejiang',1),(3001,3,'A','Alsace',1),(3002,3,'B','Aquitaine',1),(3003,3,'C','Auvergne',1),(3004,3,'P','Basse-Normandie',1),(3005,3,'D','Bourgogne',1),(3006,3,'E','Bretagne',1),(3007,3,'F','Centre',1),(3008,3,'G','Champagne-Ardenne',1),(3009,3,'H','Corse',1),(3010,3,'GF','Guyane',1),(3011,3,'I','Franche Comté',1),(3012,3,'GP','Guadeloupe',1),(3013,3,'Q','Haute-Normandie',1),(3014,3,'J','Île-de-France',1),(3015,3,'K','Languedoc-Roussillon',1),(3016,3,'L','Limousin',1),(3017,3,'M','Lorraine',1),(3018,3,'MQ','Martinique',1),(3019,3,'N','Midi-Pyrénées',1),(3020,3,'O','Nord Pas de Calais',1),(3021,3,'R','Pays de la Loire',1),(3022,3,'S','Picardie',1),(3023,3,'T','Poitou-Charentes',1),(3024,3,'U','Provence-Alpes-Côte-d\'Azur',1),(3025,3,'RE','Réunion',1),(3026,3,'V','Rhône-Alpes',1),(4001,4,'BW','Baden-Württemberg',1),(4002,4,'BY','Bayern',1),(4003,4,'BE','Berlin',1),(4004,4,'BB','Brandenburg',1),(4005,4,'HB','Bremen',1),(4006,4,'HH','Hamburg',1),(4007,4,'HE','Hessen',1),(4008,4,'MV','Mecklenburg-Vorpommern',1),(4009,4,'NI','Niedersachsen',1),(4010,4,'NW','Nordrhein-Westfalen',1),(4011,4,'RP','Rheinland-Pfalz',1),(4012,4,'SL','Saarland',1),(4013,4,'SN','Sachsen',1),(4014,4,'ST','Sachsen-Anhalt',1),(4015,4,'SH','Schleswig-Holstein',1),(4016,4,'TH','Thüringen',1),(8001,8,'AG','Agrigento',1),(8002,8,'AL','Alessandria',1),(8003,8,'AN','Ancona',1),(8004,8,'AO','Aosta',1),(8005,8,'AR','Arezzo',1),(8006,8,'AP','Ascoli Piceno',1),(8007,8,'AT','Asti',1),(8008,8,'AV','Avellino',1),(8009,8,'BA','Bari',1),(8010,8,'BT','Barletta-Andria-Trani',1),(8011,8,'BL','Belluno',1),(8012,8,'BN','Benevento',1),(8013,8,'BG','Bergamo',1),(8014,8,'BI','Biella',1),(8015,8,'BO','Bologna',1),(8016,8,'BZ','Bolzano',1),(8017,8,'BS','Brescia',1),(8018,8,'BR','Brindisi',1),(8019,8,'CA','Cagliari',1),(8020,8,'CL','Caltanissetta',1),(8021,8,'CB','Campobasso',1),(8022,8,'CI','Carbonia-Iglesias',1),(8023,8,'CE','Caserta',1),(8024,8,'CT','Catania',1),(8025,8,'CZ','Catanzaro',1),(8026,8,'CH','Chieti',1),(8027,8,'CO','Como',1),(8028,8,'CS','Cosenza',1),(8029,8,'CR','Cremona',1),(8030,8,'KR','Crotone',1),(8031,8,'CN','Cuneo',1),(8032,8,'EN','Enna',1),(8033,8,'FM','Fermo',1),(8034,8,'FE','Ferrara',1),(8035,8,'FI','Firenze',1),(8036,8,'FG','Foggia',1),(8037,8,'FC','Forli-Cesena',1),(8038,8,'FR','Frosinone',1),(8039,8,'GE','Genova',1),(8040,8,'GO','Gorizia',1),(8041,8,'GR','Grosseto',1),(8042,8,'IM','Imperia',1),(8043,8,'IS','Isernia',1),(8044,8,'AQ','L\'Aquila',1),(8045,8,'SP','La Spezia',1),(8046,8,'LT','Latina',1),(8047,8,'LE','Lecce',1),(8048,8,'LC','Lecco',1),(8049,8,'LI','Livorno',1),(8050,8,'LO','Lodi',1),(8051,8,'LU','Lucca',1),(8052,8,'MC','Macerata',1),(8053,8,'MN','Mantova',1),(8054,8,'MS','Massa-Carrara',1),(8055,8,'MT','Matera',1),(8056,8,'MA','Medio Campidano',1),(8057,8,'ME','Messina',1),(8058,8,'MI','Milano',1),(8059,8,'MO','Modena',1),(8060,8,'MB','Monza e Brianza',1),(8061,8,'NA','Napoli',1),(8062,8,'NO','Novara',1),(8063,8,'NU','Nuoro',1),(8064,8,'OG','Ogliastra',1),(8065,8,'OT','Olbia-Tempio',1),(8066,8,'OR','Oristano',1),(8067,8,'PD','Padova',1),(8068,8,'PA','Palermo',1),(8069,8,'PR','Parma',1),(8070,8,'PV','Pavia',1),(8071,8,'PG','Perugia',1),(8072,8,'PU','Pesaro e Urbino',1),(8073,8,'PE','Pescara',1),(8074,8,'PC','Piacenza',1),(8075,8,'PI','Pisa',1),(8076,8,'PT','Pistoia',1),(8077,8,'PN','Pordenone',1),(8078,8,'PZ','Potenza',1),(8079,8,'PO','Prato',1),(8080,8,'RG','Ragusa',1),(8081,8,'RA','Ravenna',1),(8082,8,'RC','Reggio Calabria',1),(8083,8,'RE','Reggio Emilia',1),(8084,8,'RI','Rieti',1),(8085,8,'RN','Rimini',1),(8086,8,'RM','Roma',1),(8087,8,'RO','Rovigo',1),(8088,8,'SA','Salerno',1),(8089,8,'SS','Sassari',1),(8090,8,'SV','Savona',1),(8091,8,'SI','Siena',1),(8092,8,'SR','Siracusa',1),(8093,8,'SO','Sondrio',1),(8094,8,'TA','Taranto',1),(8095,8,'TE','Teramo',1),(8096,8,'TR','Terni',1),(8097,8,'TO','Torino',1),(8098,8,'TP','Trapani',1),(8099,8,'TN','Trento',1),(8100,8,'TV','Treviso',1),(8101,8,'TS','Trieste',1),(8102,8,'UD','Udine',1),(8103,8,'VA','Varese',1),(8104,8,'VE','Venezia',1),(8105,8,'VB','Verbano-Cusio-Ossola',1),(8106,8,'VC','Vercelli',1),(8107,8,'VR','Verona',1),(8108,8,'VV','Vibo Valentia',1),(8109,8,'VI','Vicenza',1),(8110,8,'VT','Viterbo',1),(11001,11,'DR','Drenthe',1),(11002,11,'FL','Flevoland',1),(11003,11,'FR','Friesland',1),(11004,11,'GE','Gelderland',1),(11005,11,'GR','Groningen',1),(11006,11,'LI','Limburg',1),(11007,11,'NB','Noord-Brabant',1),(11008,11,'NH','Noord-Holland',1),(11009,11,'OV','Overijssel',1),(11010,11,'UT','Utrecht',1),(11011,11,'ZE','Zeeland',1),(11012,11,'ZH','Zuid-Holland',1),(15001,15,'AN','Andalusia',1),(15002,15,'AR','Aragon',1),(15003,15,'AS','Asturias',1),(15004,15,'IB','Balearic Islands',1),(15005,15,'PV','Basque Country',1),(15006,15,'CN','Canary Islands',1),(15007,15,'CB','Cantabria',1),(15008,15,'CL','Castile and Leon',1),(15009,15,'CM','Castile-La Mancha',1),(15010,15,'CT','Catalonia',1),(15011,15,'CE','Ceuta',1),(15012,15,'EX','Extremadura',1),(15013,15,'GA','Galicia',1),(15014,15,'LO','La Rioja',1),(15015,15,'M','Madrid',1),(15016,15,'ML','Melilla',1),(15017,15,'MU','Murcia',1),(15018,15,'NA','Navarra',1),(15019,15,'VC','Valencia',1),(19001,19,'AL','Alabama',1),(19002,19,'AK','Alaska',1),(19003,19,'AZ','Arizona',1),(19004,19,'AR','Arkansas',1),(19005,19,'CA','California',1),(19006,19,'CO','Colorado',1),(19007,19,'CT','Connecticut',1),(19008,19,'DC','District of Columbia',1),(19009,19,'DE','Delaware',1),(19010,19,'FL','Florida',1),(19011,19,'GA','Georgia',1),(19012,19,'HI','Hawaii',1),(19013,19,'ID','Idaho',1),(19014,19,'IL','Illinois',1),(19015,19,'IN','Indiana',1),(19016,19,'IA','Iowa',1),(19017,19,'KS','Kansas',1),(19018,19,'KY','Kentucky ',1),(19019,19,'LA','Louisiana ',1),(19020,19,'ME','Maine',1),(19021,19,'MD','Maryland',1),(19022,19,'MA','Massachusetts',1),(19023,19,'MI','Michigan',1),(19024,19,'MN','Minnesota',1),(19025,19,'MS','Mississippi',1),(19026,19,'MO','Missouri',1),(19027,19,'MT','Montana',1),(19028,19,'NE','Nebraska',1),(19029,19,'NV','Nevada',1),(19030,19,'NH','New Hampshire',1),(19031,19,'NJ','New Jersey',1),(19032,19,'NM','New Mexico',1),(19033,19,'NY','New York',1),(19034,19,'NC','North Carolina',1),(19035,19,'ND','North Dakota',1),(19036,19,'OH','Ohio',1),(19037,19,'OK','Oklahoma ',1),(19038,19,'OR','Oregon',1),(19039,19,'PA','Pennsylvania',1),(19040,19,'PR','Puerto Rico',1),(19041,19,'RI','Rhode Island',1),(19042,19,'SC','South Carolina',1),(19043,19,'SD','South Dakota',1),(19044,19,'TN','Tennessee',1),(19045,19,'TX','Texas',1),(19046,19,'UT','Utah',1),(19047,19,'VT','Vermont',1),(19048,19,'VA','Virginia',1),(19049,19,'WA','Washington',1),(19050,19,'WV','West Virginia',1),(19051,19,'WI','Wisconsin',1),(19052,19,'WY','Wyoming',1),(32001,32,'ACT','Australian Capital Territory',1),(32002,32,'NSW','New South Wales',1),(32003,32,'NT','Northern Territory',1),(32004,32,'QLD','Queensland',1),(32005,32,'SA','South Australia',1),(32006,32,'TAS','Tasmania',1),(32007,32,'VIC','Victoria',1),(32008,32,'WA','Western Australia',1),(144001,144,'MX-AGS','Aguascalientes',1),(144002,144,'MX-BCN','Baja California',1),(144003,144,'MX-BCS','Baja California Sur',1),(144004,144,'MX-CAM','Campeche',1),(144005,144,'MX-CHP','Chiapas',1),(144006,144,'MX-CHI','Chihuahua',1),(144007,144,'MX-COA','Coahuila',1),(144008,144,'MX-COL','Colima',1),(144009,144,'MX-DUR','Durango',1),(144010,144,'MX-GTO','Guanajuato',1),(144011,144,'MX-GRO','Guerrero',1),(144012,144,'MX-HGO','Hidalgo',1),(144013,144,'MX-JAL','Jalisco',1),(144014,144,'MX-MEX','Mexico',1),(144015,144,'MX-MIC','Michoacan',1),(144016,144,'MX-MOR','Morelos',1),(144017,144,'MX-NAY','Nayarit',1),(144018,144,'MX-NLE','Nuevo Leon',1),(144019,144,'MX-OAX','Oaxaca',1),(144020,144,'MX-PUE','Puebla',1),(144021,144,'MX-QRO','Queretaro',1),(144023,144,'MX-ROO','Quintana Roo',1),(144024,144,'MX-SLP','San Luis Potosí',1),(144025,144,'MX-SIN','Sinaloa',1),(144026,144,'MX-SON','Sonora',1),(144027,144,'MX-TAB','Tabasco',1),(144028,144,'MX-TAM','Tamaulipas',1),(144029,144,'MX-TLX','Tlaxcala',1),(144030,144,'MX-VER','Veracruz',1),(144031,144,'MX-YUC','Yucatan',1),(144032,144,'MX-ZAC','Zacatecas',1),(164001,164,'01','Østfold',1),(164002,164,'02','Akershus',1),(164003,164,'03','Oslo',1),(164004,164,'04','Hedmark',1),(164005,164,'05','Oppland',1),(164006,164,'06','Buskerud',1),(164007,164,'07','Vestfold',1),(164008,164,'08','Telemark',1),(164009,164,'09','Aust-Agder',1),(164010,164,'10','Vest-Agder',1),(164011,164,'11','Rogaland',1),(164012,164,'12','Hordaland',1),(164013,164,'14','Sogn og Fjordane',1),(164014,164,'15','Møre of Romsdal',1),(164015,164,'16','Sør-Trøndelag',1),(164016,164,'17','Nord-Trøndelag',1),(164017,164,'18','Nordland',1),(164018,164,'19','Troms',1),(164019,164,'20','Finnmark',1),(202001,202,'AG','Aargau',1),(202002,202,'AR','Appenzell Ausserrhoden',1),(202003,202,'AI','Appenzell Innerrhoden',1),(202004,202,'BL','Basel-Landschaft',1),(202005,202,'BS','Basel-Stadt',1),(202006,202,'BE','Bern',1),(202007,202,'FR','Fribourg',1),(202008,202,'GE','Geneva',1),(202009,202,'GL','Glarus',1),(202010,202,'GR','Graubünden',1),(202011,202,'JU','Jura',1),(202012,202,'LU','Lucerne',1),(202013,202,'NE','Neuchâtel',1),(202014,202,'NW','Nidwalden',1),(202015,202,'OW','Obwalden',1),(202016,202,'SH','Schaffhausen',1),(202017,202,'SZ','Schwyz',1),(202018,202,'SO','Solothurn',1),(202019,202,'SG','St. Gallen',1),(202020,202,'TG','Thurgau',1),(202021,202,'TI','Ticino',1),(202022,202,'UR','Uri',1),(202023,202,'VS','Valais',1),(202024,202,'VD','Vaud',1),(202025,202,'ZG','Zug',1),(202026,202,'ZH','Zürich',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_`
--

DROP TABLE IF EXISTS `release_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release_` (
  `releaseId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `servletContextName` varchar(75) DEFAULT NULL,
  `buildNumber` int(11) DEFAULT NULL,
  `buildDate` datetime DEFAULT NULL,
  `verified` tinyint(4) DEFAULT NULL,
  `state_` int(11) DEFAULT NULL,
  `testString` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`releaseId`),
  UNIQUE KEY `IX_8BD6BCA7` (`servletContextName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_`
--

LOCK TABLES `release_` WRITE;
/*!40000 ALTER TABLE `release_` DISABLE KEYS */;
INSERT INTO `release_` VALUES (1,'2016-10-02 20:08:17','2017-02-24 18:27:08','portal',6205,'2017-02-24 18:27:08',1,0,'You take the blue pill, the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill, you stay in Wonderland, and I show you how deep the rabbit hole goes.'),(20436,'2016-10-02 17:09:51','2017-02-24 18:27:37','marketplace-portlet',100,NULL,1,0,''),(20446,'2016-10-02 17:09:56','2017-02-24 18:27:42','calendar-portlet',102,NULL,1,0,''),(20465,'2016-10-02 17:10:04','2017-02-24 18:27:45','kaleo-web',110,NULL,1,0,''),(20497,'2016-10-02 17:10:07','2017-02-24 18:27:48','notifications-portlet',110,NULL,1,0,''),(20512,'2016-10-02 17:10:21','2017-02-24 18:27:58','sync-web',101,NULL,1,0,'');
/*!40000 ALTER TABLE `release_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `uuid_` varchar(75) DEFAULT NULL,
  `repositoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `portletId` varchar(200) DEFAULT NULL,
  `typeSettings` longtext,
  `dlFolderId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`repositoryId`),
  UNIQUE KEY `IX_60C8634C` (`groupId`,`name`,`portletId`),
  UNIQUE KEY `IX_11641E26` (`uuid_`,`groupId`),
  KEY `IX_5253B1FA` (`groupId`),
  KEY `IX_74C17B04` (`uuid_`),
  KEY `IX_F543EA4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
INSERT INTO `repository` VALUES ('ca5f38c3-7d29-4349-9771-538fb30f175a',21005,20195,20155,20159,'','2016-10-05 15:16:45','2016-10-05 15:16:45',21004,'20','','20','',21006);
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositoryentry`
--

DROP TABLE IF EXISTS `repositoryentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositoryentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `repositoryEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `mappedId` varchar(75) DEFAULT NULL,
  `manualCheckInRequired` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`repositoryEntryId`),
  UNIQUE KEY `IX_9BDCF489` (`repositoryId`,`mappedId`),
  UNIQUE KEY `IX_354AA664` (`uuid_`,`groupId`),
  KEY `IX_B7034B27` (`repositoryId`),
  KEY `IX_B9B1506` (`uuid_`),
  KEY `IX_D3B9AF62` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositoryentry`
--

LOCK TABLES `repositoryentry` WRITE;
/*!40000 ALTER TABLE `repositoryentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositoryentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourceaction`
--

DROP TABLE IF EXISTS `resourceaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourceaction` (
  `resourceActionId` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actionId` varchar(75) DEFAULT NULL,
  `bitwiseValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceActionId`),
  UNIQUE KEY `IX_EDB9986E` (`name`,`actionId`),
  KEY `IX_81F2DB09` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourceaction`
--

LOCK TABLES `resourceaction` WRITE;
/*!40000 ALTER TABLE `resourceaction` DISABLE KEYS */;
INSERT INTO `resourceaction` VALUES (1,'com.liferay.portlet.softwarecatalog','ADD_FRAMEWORK_VERSION',2),(2,'com.liferay.portlet.softwarecatalog','ADD_PRODUCT_ENTRY',4),(3,'com.liferay.portlet.softwarecatalog','PERMISSIONS',8),(4,'com.liferay.portal.model.Team','ASSIGN_MEMBERS',2),(5,'com.liferay.portal.model.Team','DELETE',4),(6,'com.liferay.portal.model.Team','PERMISSIONS',8),(7,'com.liferay.portal.model.Team','UPDATE',16),(8,'com.liferay.portal.model.Team','VIEW',1),(9,'com.liferay.portal.model.PasswordPolicy','ASSIGN_MEMBERS',2),(10,'com.liferay.portal.model.PasswordPolicy','DELETE',4),(11,'com.liferay.portal.model.PasswordPolicy','PERMISSIONS',8),(12,'com.liferay.portal.model.PasswordPolicy','UPDATE',16),(13,'com.liferay.portal.model.PasswordPolicy','VIEW',1),(14,'com.liferay.portlet.blogs.model.BlogsEntry','ADD_DISCUSSION',2),(15,'com.liferay.portlet.blogs.model.BlogsEntry','DELETE',4),(16,'com.liferay.portlet.blogs.model.BlogsEntry','DELETE_DISCUSSION',8),(17,'com.liferay.portlet.blogs.model.BlogsEntry','PERMISSIONS',16),(18,'com.liferay.portlet.blogs.model.BlogsEntry','UPDATE',32),(19,'com.liferay.portlet.blogs.model.BlogsEntry','UPDATE_DISCUSSION',64),(20,'com.liferay.portlet.blogs.model.BlogsEntry','VIEW',1),(21,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','DELETE',2),(22,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','PERMISSIONS',4),(23,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','UPDATE',8),(24,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','VIEW',1),(25,'com.liferay.portlet.journal.model.JournalFeed','DELETE',2),(26,'com.liferay.portlet.journal.model.JournalFeed','PERMISSIONS',4),(27,'com.liferay.portlet.journal.model.JournalFeed','UPDATE',8),(28,'com.liferay.portlet.journal.model.JournalFeed','VIEW',1),(29,'com.liferay.portlet.wiki.model.WikiNode','ADD_ATTACHMENT',2),(30,'com.liferay.portlet.wiki.model.WikiNode','ADD_PAGE',4),(31,'com.liferay.portlet.wiki.model.WikiNode','DELETE',8),(32,'com.liferay.portlet.wiki.model.WikiNode','IMPORT',16),(33,'com.liferay.portlet.wiki.model.WikiNode','PERMISSIONS',32),(34,'com.liferay.portlet.wiki.model.WikiNode','SUBSCRIBE',64),(35,'com.liferay.portlet.wiki.model.WikiNode','UPDATE',128),(36,'com.liferay.portlet.wiki.model.WikiNode','VIEW',1),(37,'com.liferay.portlet.announcements.model.AnnouncementsEntry','DELETE',2),(38,'com.liferay.portlet.announcements.model.AnnouncementsEntry','UPDATE',4),(39,'com.liferay.portlet.announcements.model.AnnouncementsEntry','VIEW',1),(40,'com.liferay.portlet.announcements.model.AnnouncementsEntry','PERMISSIONS',8),(41,'com.liferay.portlet.bookmarks','ADD_ENTRY',2),(42,'com.liferay.portlet.bookmarks','ADD_FOLDER',4),(43,'com.liferay.portlet.bookmarks','PERMISSIONS',8),(44,'com.liferay.portlet.bookmarks','SUBSCRIBE',16),(45,'com.liferay.portlet.bookmarks','VIEW',1),(46,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','DELETE',2),(47,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','PERMISSIONS',4),(48,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','UPDATE',8),(49,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','VIEW',1),(50,'com.liferay.portlet.asset.model.AssetVocabulary','DELETE',2),(51,'com.liferay.portlet.asset.model.AssetVocabulary','PERMISSIONS',4),(52,'com.liferay.portlet.asset.model.AssetVocabulary','UPDATE',8),(53,'com.liferay.portlet.asset.model.AssetVocabulary','VIEW',1),(54,'com.liferay.portlet.documentlibrary.model.DLFolder','ACCESS',2),(55,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_DOCUMENT',4),(56,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_SHORTCUT',8),(57,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_SUBFOLDER',16),(58,'com.liferay.portlet.documentlibrary.model.DLFolder','DELETE',32),(59,'com.liferay.portlet.documentlibrary.model.DLFolder','PERMISSIONS',64),(60,'com.liferay.portlet.documentlibrary.model.DLFolder','UPDATE',128),(61,'com.liferay.portlet.documentlibrary.model.DLFolder','VIEW',1),(62,'com.liferay.portlet.expando.model.ExpandoColumn','DELETE',2),(63,'com.liferay.portlet.expando.model.ExpandoColumn','PERMISSIONS',4),(64,'com.liferay.portlet.expando.model.ExpandoColumn','UPDATE',8),(65,'com.liferay.portlet.expando.model.ExpandoColumn','VIEW',1),(66,'com.liferay.portlet.documentlibrary','ADD_DOCUMENT',2),(67,'com.liferay.portlet.documentlibrary','ADD_DOCUMENT_TYPE',4),(68,'com.liferay.portlet.documentlibrary','ADD_FOLDER',8),(69,'com.liferay.portlet.documentlibrary','ADD_REPOSITORY',16),(70,'com.liferay.portlet.documentlibrary','ADD_STRUCTURE',32),(71,'com.liferay.portlet.documentlibrary','ADD_SHORTCUT',64),(72,'com.liferay.portlet.documentlibrary','PERMISSIONS',128),(73,'com.liferay.portlet.documentlibrary','SUBSCRIBE',256),(74,'com.liferay.portlet.documentlibrary','UPDATE',512),(75,'com.liferay.portlet.documentlibrary','VIEW',1),(76,'com.liferay.portlet.calendar.model.CalEvent','ADD_DISCUSSION',2),(77,'com.liferay.portlet.calendar.model.CalEvent','DELETE',4),(78,'com.liferay.portlet.calendar.model.CalEvent','DELETE_DISCUSSION',8),(79,'com.liferay.portlet.calendar.model.CalEvent','PERMISSIONS',16),(80,'com.liferay.portlet.calendar.model.CalEvent','UPDATE',32),(81,'com.liferay.portlet.calendar.model.CalEvent','UPDATE_DISCUSSION',64),(82,'com.liferay.portlet.calendar.model.CalEvent','VIEW',1),(83,'com.liferay.portlet.shopping.model.ShoppingCategory','ADD_ITEM',2),(84,'com.liferay.portlet.shopping.model.ShoppingCategory','ADD_SUBCATEGORY',4),(85,'com.liferay.portlet.shopping.model.ShoppingCategory','DELETE',8),(86,'com.liferay.portlet.shopping.model.ShoppingCategory','PERMISSIONS',16),(87,'com.liferay.portlet.shopping.model.ShoppingCategory','UPDATE',32),(88,'com.liferay.portlet.shopping.model.ShoppingCategory','VIEW',1),(89,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','DELETE',2),(90,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','PERMISSIONS',4),(91,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','UPDATE',8),(92,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','VIEW',1),(93,'com.liferay.portlet.journal','ADD_ARTICLE',2),(94,'com.liferay.portlet.journal','ADD_FEED',4),(95,'com.liferay.portlet.journal','ADD_FOLDER',8),(96,'com.liferay.portlet.journal','ADD_STRUCTURE',16),(97,'com.liferay.portlet.journal','ADD_TEMPLATE',32),(98,'com.liferay.portlet.journal','SUBSCRIBE',64),(99,'com.liferay.portlet.journal','VIEW',1),(100,'com.liferay.portlet.journal','PERMISSIONS',128),(101,'com.liferay.portlet.calendar','ADD_EVENT',2),(102,'com.liferay.portlet.calendar','EXPORT_ALL_EVENTS',4),(103,'com.liferay.portlet.calendar','PERMISSIONS',8),(104,'com.liferay.portal.model.LayoutPrototype','DELETE',2),(105,'com.liferay.portal.model.LayoutPrototype','PERMISSIONS',4),(106,'com.liferay.portal.model.LayoutPrototype','UPDATE',8),(107,'com.liferay.portal.model.LayoutPrototype','VIEW',1),(108,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','ADD_RECORD',2),(109,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','DELETE',4),(110,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','PERMISSIONS',8),(111,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','UPDATE',16),(112,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','VIEW',1),(113,'com.liferay.portal.model.Organization','ADD_ORGANIZATION',2),(114,'com.liferay.portal.model.Organization','ASSIGN_MEMBERS',4),(115,'com.liferay.portal.model.Organization','ASSIGN_USER_ROLES',8),(116,'com.liferay.portal.model.Organization','DELETE',16),(117,'com.liferay.portal.model.Organization','MANAGE_ANNOUNCEMENTS',32),(118,'com.liferay.portal.model.Organization','MANAGE_SUBORGANIZATIONS',64),(119,'com.liferay.portal.model.Organization','MANAGE_USERS',128),(120,'com.liferay.portal.model.Organization','PERMISSIONS',256),(121,'com.liferay.portal.model.Organization','UPDATE',512),(122,'com.liferay.portal.model.Organization','VIEW',1),(123,'com.liferay.portal.model.Organization','VIEW_MEMBERS',1024),(124,'com.liferay.portlet.softwarecatalog.model.SCLicense','DELETE',2),(125,'com.liferay.portlet.softwarecatalog.model.SCLicense','PERMISSIONS',4),(126,'com.liferay.portlet.softwarecatalog.model.SCLicense','UPDATE',8),(127,'com.liferay.portlet.softwarecatalog.model.SCLicense','VIEW',1),(128,'com.liferay.portlet.journal.model.JournalFolder','ACCESS',2),(129,'com.liferay.portlet.journal.model.JournalFolder','ADD_ARTICLE',4),(130,'com.liferay.portlet.journal.model.JournalFolder','ADD_SUBFOLDER',8),(131,'com.liferay.portlet.journal.model.JournalFolder','DELETE',16),(132,'com.liferay.portlet.journal.model.JournalFolder','PERMISSIONS',32),(133,'com.liferay.portlet.journal.model.JournalFolder','UPDATE',64),(134,'com.liferay.portlet.journal.model.JournalFolder','VIEW',1),(135,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','DELETE',2),(136,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','PERMISSIONS',4),(137,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','UPDATE',8),(138,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','VIEW',1),(139,'com.liferay.portlet.journal.model.JournalTemplate','DELETE',2),(140,'com.liferay.portlet.journal.model.JournalTemplate','PERMISSIONS',4),(141,'com.liferay.portlet.journal.model.JournalTemplate','UPDATE',8),(142,'com.liferay.portlet.journal.model.JournalTemplate','VIEW',1),(143,'com.liferay.portlet.journal.model.JournalArticle','ADD_DISCUSSION',2),(144,'com.liferay.portlet.journal.model.JournalArticle','DELETE',4),(145,'com.liferay.portlet.journal.model.JournalArticle','DELETE_DISCUSSION',8),(146,'com.liferay.portlet.journal.model.JournalArticle','EXPIRE',16),(147,'com.liferay.portlet.journal.model.JournalArticle','PERMISSIONS',32),(148,'com.liferay.portlet.journal.model.JournalArticle','UPDATE',64),(149,'com.liferay.portlet.journal.model.JournalArticle','UPDATE_DISCUSSION',128),(150,'com.liferay.portlet.journal.model.JournalArticle','VIEW',1),(151,'com.liferay.portlet.dynamicdatalists','ADD_RECORD_SET',2),(152,'com.liferay.portlet.dynamicdatalists','ADD_STRUCTURE',4),(153,'com.liferay.portlet.dynamicdatalists','ADD_TEMPLATE',8),(154,'com.liferay.portlet.dynamicdatalists','PERMISSIONS',16),(155,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ACCESS',2),(156,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ADD_ENTRY',4),(157,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ADD_SUBFOLDER',8),(158,'com.liferay.portlet.bookmarks.model.BookmarksFolder','DELETE',16),(159,'com.liferay.portlet.bookmarks.model.BookmarksFolder','PERMISSIONS',32),(160,'com.liferay.portlet.bookmarks.model.BookmarksFolder','SUBSCRIBE',64),(161,'com.liferay.portlet.bookmarks.model.BookmarksFolder','UPDATE',128),(162,'com.liferay.portlet.bookmarks.model.BookmarksFolder','VIEW',1),(163,'com.liferay.portal.model.Group','ADD_COMMUNITY',2),(164,'com.liferay.portal.model.Group','ADD_LAYOUT',4),(165,'com.liferay.portal.model.Group','ADD_LAYOUT_BRANCH',8),(166,'com.liferay.portal.model.Group','ADD_LAYOUT_SET_BRANCH',16),(167,'com.liferay.portal.model.Group','ASSIGN_MEMBERS',32),(168,'com.liferay.portal.model.Group','ASSIGN_USER_ROLES',64),(169,'com.liferay.portal.model.Group','CONFIGURE_PORTLETS',128),(170,'com.liferay.portal.model.Group','DELETE',256),(171,'com.liferay.portal.model.Group','EXPORT_IMPORT_LAYOUTS',512),(172,'com.liferay.portal.model.Group','EXPORT_IMPORT_PORTLET_INFO',1024),(173,'com.liferay.portal.model.Group','MANAGE_ANNOUNCEMENTS',2048),(174,'com.liferay.portal.model.Group','MANAGE_ARCHIVED_SETUPS',4096),(175,'com.liferay.portal.model.Group','MANAGE_LAYOUTS',8192),(176,'com.liferay.portal.model.Group','MANAGE_STAGING',16384),(177,'com.liferay.portal.model.Group','MANAGE_SUBGROUPS',32768),(178,'com.liferay.portal.model.Group','MANAGE_TEAMS',65536),(179,'com.liferay.portal.model.Group','PERMISSIONS',131072),(180,'com.liferay.portal.model.Group','PREVIEW_IN_DEVICE',262144),(181,'com.liferay.portal.model.Group','PUBLISH_STAGING',524288),(182,'com.liferay.portal.model.Group','PUBLISH_TO_REMOTE',1048576),(183,'com.liferay.portal.model.Group','UPDATE',2097152),(184,'com.liferay.portal.model.Group','VIEW',1),(185,'com.liferay.portal.model.Group','VIEW_MEMBERS',4194304),(186,'com.liferay.portal.model.Group','VIEW_SITE_ADMINISTRATION',8388608),(187,'com.liferay.portal.model.Group','VIEW_STAGING',16777216),(188,'com.liferay.portlet.journal.model.JournalStructure','DELETE',2),(189,'com.liferay.portlet.journal.model.JournalStructure','PERMISSIONS',4),(190,'com.liferay.portlet.journal.model.JournalStructure','UPDATE',8),(191,'com.liferay.portlet.journal.model.JournalStructure','VIEW',1),(192,'com.liferay.portlet.asset.model.AssetTag','DELETE',2),(193,'com.liferay.portlet.asset.model.AssetTag','PERMISSIONS',4),(194,'com.liferay.portlet.asset.model.AssetTag','UPDATE',8),(195,'com.liferay.portlet.asset.model.AssetTag','VIEW',1),(196,'com.liferay.portal.model.Layout','ADD_DISCUSSION',2),(197,'com.liferay.portal.model.Layout','ADD_LAYOUT',4),(198,'com.liferay.portal.model.Layout','CONFIGURE_PORTLETS',8),(199,'com.liferay.portal.model.Layout','CUSTOMIZE',16),(200,'com.liferay.portal.model.Layout','DELETE',32),(201,'com.liferay.portal.model.Layout','DELETE_DISCUSSION',64),(202,'com.liferay.portal.model.Layout','PERMISSIONS',128),(203,'com.liferay.portal.model.Layout','UPDATE',256),(204,'com.liferay.portal.model.Layout','UPDATE_DISCUSSION',512),(205,'com.liferay.portal.model.Layout','VIEW',1),(206,'com.liferay.portlet.asset','ADD_TAG',2),(207,'com.liferay.portlet.asset','PERMISSIONS',4),(208,'com.liferay.portlet.asset','ADD_CATEGORY',8),(209,'com.liferay.portlet.asset','ADD_VOCABULARY',16),(210,'com.liferay.portal.model.LayoutBranch','DELETE',2),(211,'com.liferay.portal.model.LayoutBranch','PERMISSIONS',4),(212,'com.liferay.portal.model.LayoutBranch','UPDATE',8),(213,'com.liferay.portal.model.LayoutSetBranch','DELETE',2),(214,'com.liferay.portal.model.LayoutSetBranch','MERGE',4),(215,'com.liferay.portal.model.LayoutSetBranch','PERMISSIONS',8),(216,'com.liferay.portal.model.LayoutSetBranch','UPDATE',16),(217,'com.liferay.portlet.messageboards','ADD_CATEGORY',2),(218,'com.liferay.portlet.messageboards','ADD_FILE',4),(219,'com.liferay.portlet.messageboards','ADD_MESSAGE',8),(220,'com.liferay.portlet.messageboards','BAN_USER',16),(221,'com.liferay.portlet.messageboards','MOVE_THREAD',32),(222,'com.liferay.portlet.messageboards','LOCK_THREAD',64),(223,'com.liferay.portlet.messageboards','PERMISSIONS',128),(224,'com.liferay.portlet.messageboards','REPLY_TO_MESSAGE',256),(225,'com.liferay.portlet.messageboards','SUBSCRIBE',512),(226,'com.liferay.portlet.messageboards','UPDATE_THREAD_PRIORITY',1024),(227,'com.liferay.portlet.messageboards','VIEW',1),(228,'com.liferay.portlet.polls','ADD_QUESTION',2),(229,'com.liferay.portlet.polls','PERMISSIONS',4),(230,'com.liferay.portlet.shopping.model.ShoppingItem','DELETE',2),(231,'com.liferay.portlet.shopping.model.ShoppingItem','PERMISSIONS',4),(232,'com.liferay.portlet.shopping.model.ShoppingItem','UPDATE',8),(233,'com.liferay.portlet.shopping.model.ShoppingItem','VIEW',1),(234,'com.liferay.portlet.bookmarks.model.BookmarksEntry','DELETE',2),(235,'com.liferay.portlet.bookmarks.model.BookmarksEntry','PERMISSIONS',4),(236,'com.liferay.portlet.bookmarks.model.BookmarksEntry','SUBSCRIBE',8),(237,'com.liferay.portlet.bookmarks.model.BookmarksEntry','UPDATE',16),(238,'com.liferay.portlet.bookmarks.model.BookmarksEntry','VIEW',1),(239,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','ADD_DISCUSSION',2),(240,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','DELETE',4),(241,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','DELETE_DISCUSSION',8),(242,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','PERMISSIONS',16),(243,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','UPDATE',32),(244,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','UPDATE_DISCUSSION',64),(245,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','VIEW',1),(246,'com.liferay.portal.model.User','DELETE',2),(247,'com.liferay.portal.model.User','IMPERSONATE',4),(248,'com.liferay.portal.model.User','PERMISSIONS',8),(249,'com.liferay.portal.model.User','UPDATE',16),(250,'com.liferay.portal.model.User','VIEW',1),(251,'com.liferay.portal.model.LayoutSetPrototype','DELETE',2),(252,'com.liferay.portal.model.LayoutSetPrototype','PERMISSIONS',4),(253,'com.liferay.portal.model.LayoutSetPrototype','UPDATE',8),(254,'com.liferay.portal.model.LayoutSetPrototype','VIEW',1),(255,'com.liferay.portlet.shopping','ADD_CATEGORY',2),(256,'com.liferay.portlet.shopping','ADD_ITEM',4),(257,'com.liferay.portlet.shopping','MANAGE_COUPONS',8),(258,'com.liferay.portlet.shopping','MANAGE_ORDERS',16),(259,'com.liferay.portlet.shopping','PERMISSIONS',32),(260,'com.liferay.portlet.shopping','VIEW',1),(261,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','DELETE',2),(262,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','PERMISSIONS',4),(263,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','UPDATE',8),(264,'com.liferay.portlet.wiki','ADD_NODE',2),(265,'com.liferay.portlet.wiki','PERMISSIONS',4),(266,'com.liferay.portlet.polls.model.PollsQuestion','ADD_VOTE',2),(267,'com.liferay.portlet.polls.model.PollsQuestion','DELETE',4),(268,'com.liferay.portlet.polls.model.PollsQuestion','PERMISSIONS',8),(269,'com.liferay.portlet.polls.model.PollsQuestion','UPDATE',16),(270,'com.liferay.portlet.polls.model.PollsQuestion','VIEW',1),(271,'com.liferay.portlet.shopping.model.ShoppingOrder','DELETE',2),(272,'com.liferay.portlet.shopping.model.ShoppingOrder','PERMISSIONS',4),(273,'com.liferay.portlet.shopping.model.ShoppingOrder','UPDATE',8),(274,'com.liferay.portlet.shopping.model.ShoppingOrder','VIEW',1),(275,'com.liferay.portal.model.UserGroup','ASSIGN_MEMBERS',2),(276,'com.liferay.portal.model.UserGroup','DELETE',4),(277,'com.liferay.portal.model.UserGroup','MANAGE_ANNOUNCEMENTS',8),(278,'com.liferay.portal.model.UserGroup','PERMISSIONS',16),(279,'com.liferay.portal.model.UserGroup','UPDATE',32),(280,'com.liferay.portal.model.UserGroup','VIEW',1),(281,'com.liferay.portal.model.UserGroup','VIEW_MEMBERS',64),(282,'com.liferay.portal.model.Role','ASSIGN_MEMBERS',2),(283,'com.liferay.portal.model.Role','DEFINE_PERMISSIONS',4),(284,'com.liferay.portal.model.Role','DELETE',8),(285,'com.liferay.portal.model.Role','MANAGE_ANNOUNCEMENTS',16),(286,'com.liferay.portal.model.Role','PERMISSIONS',32),(287,'com.liferay.portal.model.Role','UPDATE',64),(288,'com.liferay.portal.model.Role','VIEW',1),(289,'com.liferay.portlet.messageboards.model.MBCategory','ADD_FILE',2),(290,'com.liferay.portlet.messageboards.model.MBCategory','ADD_MESSAGE',4),(291,'com.liferay.portlet.messageboards.model.MBCategory','ADD_SUBCATEGORY',8),(292,'com.liferay.portlet.messageboards.model.MBCategory','DELETE',16),(293,'com.liferay.portlet.messageboards.model.MBCategory','LOCK_THREAD',32),(294,'com.liferay.portlet.messageboards.model.MBCategory','MOVE_THREAD',64),(295,'com.liferay.portlet.messageboards.model.MBCategory','PERMISSIONS',128),(296,'com.liferay.portlet.messageboards.model.MBCategory','REPLY_TO_MESSAGE',256),(297,'com.liferay.portlet.messageboards.model.MBCategory','SUBSCRIBE',512),(298,'com.liferay.portlet.messageboards.model.MBCategory','UPDATE',1024),(299,'com.liferay.portlet.messageboards.model.MBCategory','UPDATE_THREAD_PRIORITY',2048),(300,'com.liferay.portlet.messageboards.model.MBCategory','VIEW',1),(301,'com.liferay.portlet.mobiledevicerules','ADD_RULE_GROUP',2),(302,'com.liferay.portlet.mobiledevicerules','ADD_RULE_GROUP_INSTANCE',4),(303,'com.liferay.portlet.mobiledevicerules','CONFIGURATION',8),(304,'com.liferay.portlet.mobiledevicerules','VIEW',1),(305,'com.liferay.portlet.mobiledevicerules','PERMISSIONS',16),(306,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','DELETE',2),(307,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','PERMISSIONS',4),(308,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','UPDATE',8),(309,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','VIEW',1),(310,'com.liferay.portlet.wiki.model.WikiPage','ADD_DISCUSSION',2),(311,'com.liferay.portlet.wiki.model.WikiPage','DELETE',4),(312,'com.liferay.portlet.wiki.model.WikiPage','DELETE_DISCUSSION',8),(313,'com.liferay.portlet.wiki.model.WikiPage','PERMISSIONS',16),(314,'com.liferay.portlet.wiki.model.WikiPage','SUBSCRIBE',32),(315,'com.liferay.portlet.wiki.model.WikiPage','UPDATE',64),(316,'com.liferay.portlet.wiki.model.WikiPage','UPDATE_DISCUSSION',128),(317,'com.liferay.portlet.wiki.model.WikiPage','VIEW',1),(318,'com.liferay.portlet.asset.model.AssetCategory','ADD_CATEGORY',2),(319,'com.liferay.portlet.asset.model.AssetCategory','DELETE',4),(320,'com.liferay.portlet.asset.model.AssetCategory','PERMISSIONS',8),(321,'com.liferay.portlet.asset.model.AssetCategory','UPDATE',16),(322,'com.liferay.portlet.asset.model.AssetCategory','VIEW',1),(323,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','DELETE',2),(324,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','PERMISSIONS',4),(325,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','UPDATE',8),(326,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','VIEW',1),(327,'com.liferay.portlet.messageboards.model.MBMessage','DELETE',2),(328,'com.liferay.portlet.messageboards.model.MBMessage','PERMISSIONS',4),(329,'com.liferay.portlet.messageboards.model.MBMessage','SUBSCRIBE',8),(330,'com.liferay.portlet.messageboards.model.MBMessage','UPDATE',16),(331,'com.liferay.portlet.messageboards.model.MBMessage','VIEW',1),(332,'com.liferay.portlet.messageboards.model.MBThread','SUBSCRIBE',2),(333,'com.liferay.portlet.messageboards.model.MBThread','VIEW',1),(334,'com.liferay.portlet.messageboards.model.MBThread','PERMISSIONS',4),(335,'com.liferay.portlet.blogs','ADD_ENTRY',2),(336,'com.liferay.portlet.blogs','PERMISSIONS',4),(337,'com.liferay.portlet.blogs','SUBSCRIBE',8),(338,'com.liferay.portlet.documentlibrary.model.DLFileEntry','ADD_DISCUSSION',2),(339,'com.liferay.portlet.documentlibrary.model.DLFileEntry','DELETE',4),(340,'com.liferay.portlet.documentlibrary.model.DLFileEntry','DELETE_DISCUSSION',8),(341,'com.liferay.portlet.documentlibrary.model.DLFileEntry','OVERRIDE_CHECKOUT',16),(342,'com.liferay.portlet.documentlibrary.model.DLFileEntry','PERMISSIONS',32),(343,'com.liferay.portlet.documentlibrary.model.DLFileEntry','UPDATE',64),(344,'com.liferay.portlet.documentlibrary.model.DLFileEntry','UPDATE_DISCUSSION',128),(345,'com.liferay.portlet.documentlibrary.model.DLFileEntry','VIEW',1),(346,'134','ACCESS_IN_CONTROL_PANEL',2),(347,'134','CONFIGURATION',4),(348,'134','VIEW',1),(349,'134','PERMISSIONS',8),(350,'134','PREFERENCES',16),(351,'59','ADD_TO_PAGE',2),(352,'59','CONFIGURATION',4),(353,'59','PERMISSIONS',8),(354,'59','PREFERENCES',16),(355,'59','VIEW',1),(356,'139','ACCESS_IN_CONTROL_PANEL',2),(357,'139','ADD_EXPANDO',4),(358,'139','CONFIGURATION',8),(359,'139','VIEW',1),(360,'139','PERMISSIONS',16),(361,'139','PREFERENCES',32),(362,'19','ADD_TO_PAGE',2),(363,'19','CONFIGURATION',4),(364,'19','VIEW',1),(365,'19','PERMISSIONS',8),(366,'19','PREFERENCES',16),(367,'110','ADD_TO_PAGE',2),(368,'110','CONFIGURATION',4),(369,'110','PERMISSIONS',8),(370,'110','PREFERENCES',16),(371,'110','VIEW',1),(372,'36','ADD_PORTLET_DISPLAY_TEMPLATE',2),(373,'36','ADD_TO_PAGE',4),(374,'36','CONFIGURATION',8),(375,'36','VIEW',1),(376,'36','PERMISSIONS',16),(377,'36','PREFERENCES',32),(378,'178','CONFIGURATION',2),(379,'178','VIEW',1),(380,'178','ADD_TO_PAGE',4),(381,'178','PERMISSIONS',8),(382,'178','PREFERENCES',16),(383,'15','ACCESS_IN_CONTROL_PANEL',2),(384,'15','ADD_TO_PAGE',4),(385,'15','CONFIGURATION',8),(386,'15','VIEW',1),(387,'15','PERMISSIONS',16),(388,'15','PREFERENCES',32),(389,'33','ADD_PORTLET_DISPLAY_TEMPLATE',2),(390,'33','ADD_TO_PAGE',4),(391,'33','CONFIGURATION',8),(392,'33','VIEW',1),(393,'33','PERMISSIONS',16),(394,'33','PREFERENCES',32),(395,'34','ADD_TO_PAGE',2),(396,'34','CONFIGURATION',4),(397,'34','VIEW',1),(398,'34','PERMISSIONS',8),(399,'34','PREFERENCES',16),(400,'156','ADD_TO_PAGE',2),(401,'156','CONFIGURATION',4),(402,'156','PERMISSIONS',8),(403,'156','PREFERENCES',16),(404,'156','VIEW',1),(405,'154','ACCESS_IN_CONTROL_PANEL',2),(406,'154','CONFIGURATION',4),(407,'154','VIEW',1),(408,'154','PERMISSIONS',8),(409,'154','PREFERENCES',16),(410,'20','ACCESS_IN_CONTROL_PANEL',2),(411,'20','ADD_PORTLET_DISPLAY_TEMPLATE',4),(412,'20','ADD_TO_PAGE',8),(413,'20','CONFIGURATION',16),(414,'20','VIEW',1),(415,'20','PERMISSIONS',32),(416,'20','PREFERENCES',64),(417,'174','ADD_TO_PAGE',2),(418,'174','CONFIGURATION',4),(419,'174','PERMISSIONS',8),(420,'174','PREFERENCES',16),(421,'174','VIEW',1),(422,'83','ADD_ENTRY',2),(423,'83','ADD_TO_PAGE',4),(424,'83','CONFIGURATION',8),(425,'83','VIEW',1),(426,'83','PERMISSIONS',16),(427,'83','PREFERENCES',32),(428,'99','ACCESS_IN_CONTROL_PANEL',2),(429,'99','CONFIGURATION',4),(430,'99','VIEW',1),(431,'99','PERMISSIONS',8),(432,'99','PREFERENCES',16),(433,'84','ADD_ENTRY',2),(434,'84','ADD_TO_PAGE',4),(435,'84','CONFIGURATION',8),(436,'84','VIEW',1),(437,'84','PERMISSIONS',16),(438,'84','PREFERENCES',32),(439,'98','ACCESS_IN_CONTROL_PANEL',2),(440,'98','ADD_TO_PAGE',4),(441,'98','CONFIGURATION',8),(442,'98','VIEW',1),(443,'98','PERMISSIONS',16),(444,'98','PREFERENCES',32),(445,'125','ACCESS_IN_CONTROL_PANEL',2),(446,'125','CONFIGURATION',4),(447,'125','EXPORT_USER',8),(448,'125','VIEW',1),(449,'125','PERMISSIONS',16),(450,'125','PREFERENCES',32),(451,'127','ADD_TO_PAGE',2),(452,'127','CONFIGURATION',4),(453,'127','PERMISSIONS',8),(454,'127','PREFERENCES',16),(455,'127','VIEW',1),(456,'128','ACCESS_IN_CONTROL_PANEL',2),(457,'128','CONFIGURATION',4),(458,'128','VIEW',1),(459,'128','PERMISSIONS',8),(460,'128','PREFERENCES',16),(461,'146','ACCESS_IN_CONTROL_PANEL',2),(462,'146','CONFIGURATION',4),(463,'146','VIEW',1),(464,'146','PERMISSIONS',8),(465,'146','PREFERENCES',16),(466,'147','ACCESS_IN_CONTROL_PANEL',2),(467,'147','CONFIGURATION',4),(468,'147','VIEW',1),(469,'147','PERMISSIONS',8),(470,'147','PREFERENCES',16),(471,'149','ACCESS_IN_CONTROL_PANEL',2),(472,'149','CONFIGURATION',4),(473,'149','VIEW',1),(474,'149','PERMISSIONS',8),(475,'149','PREFERENCES',16),(476,'169','ADD_TO_PAGE',2),(477,'169','CONFIGURATION',4),(478,'169','PERMISSIONS',8),(479,'169','PREFERENCES',16),(480,'169','VIEW',1),(481,'25','ACCESS_IN_CONTROL_PANEL',2),(482,'25','CONFIGURATION',4),(483,'25','VIEW',1),(484,'25','PERMISSIONS',8),(485,'25','PREFERENCES',16),(486,'129','ACCESS_IN_CONTROL_PANEL',2),(487,'129','CONFIGURATION',4),(488,'129','VIEW',1),(489,'129','PERMISSIONS',8),(490,'129','PREFERENCES',16),(491,'166','ACCESS_IN_CONTROL_PANEL',2),(492,'166','ADD_TO_PAGE',4),(493,'166','CONFIGURATION',8),(494,'166','VIEW',1),(495,'166','PERMISSIONS',16),(496,'166','PREFERENCES',32),(497,'165','ADD_TO_PAGE',2),(498,'165','CONFIGURATION',4),(499,'165','PERMISSIONS',8),(500,'165','PREFERENCES',16),(501,'165','VIEW',1),(502,'28','ACCESS_IN_CONTROL_PANEL',2),(503,'28','ADD_TO_PAGE',4),(504,'28','CONFIGURATION',8),(505,'28','VIEW',1),(506,'28','PERMISSIONS',16),(507,'28','PREFERENCES',32),(508,'167','ACCESS_IN_CONTROL_PANEL',2),(509,'167','ADD_TO_PAGE',4),(510,'167','CONFIGURATION',8),(511,'167','VIEW',1),(512,'167','PERMISSIONS',16),(513,'167','PREFERENCES',32),(514,'161','ACCESS_IN_CONTROL_PANEL',2),(515,'161','CONFIGURATION',4),(516,'161','VIEW',1),(517,'161','PERMISSIONS',8),(518,'161','PREFERENCES',16),(519,'162','ACCESS_IN_CONTROL_PANEL',2),(520,'162','CONFIGURATION',4),(521,'162','VIEW',1),(522,'162','PERMISSIONS',8),(523,'162','PREFERENCES',16),(524,'31','ADD_TO_PAGE',2),(525,'31','CONFIGURATION',4),(526,'31','PERMISSIONS',8),(527,'31','PREFERENCES',16),(528,'31','VIEW',1),(529,'8','ACCESS_IN_CONTROL_PANEL',2),(530,'8','ADD_TO_PAGE',4),(531,'8','CONFIGURATION',8),(532,'8','VIEW',1),(533,'8','PERMISSIONS',16),(534,'8','PREFERENCES',32),(535,'183','VIEW',1),(536,'183','ADD_TO_PAGE',2),(537,'183','CONFIGURATION',4),(538,'183','PERMISSIONS',8),(539,'183','PREFERENCES',16),(540,'183','ACCESS_IN_CONTROL_PANEL',32),(541,'66','VIEW',1),(542,'66','ADD_TO_PAGE',2),(543,'66','CONFIGURATION',4),(544,'66','PERMISSIONS',8),(545,'66','PREFERENCES',16),(546,'66','ACCESS_IN_CONTROL_PANEL',32),(547,'156','ACCESS_IN_CONTROL_PANEL',32),(548,'180','VIEW',1),(549,'180','ADD_TO_PAGE',2),(550,'180','CONFIGURATION',4),(551,'180','PERMISSIONS',8),(552,'180','PREFERENCES',16),(553,'180','ACCESS_IN_CONTROL_PANEL',32),(554,'152','ACCESS_IN_CONTROL_PANEL',2),(555,'152','CONFIGURATION',4),(556,'152','VIEW',1),(557,'152','PERMISSIONS',8),(558,'152','PREFERENCES',16),(559,'27','VIEW',1),(560,'27','ADD_TO_PAGE',2),(561,'27','CONFIGURATION',4),(562,'27','PERMISSIONS',8),(563,'27','PREFERENCES',16),(564,'27','ACCESS_IN_CONTROL_PANEL',32),(565,'88','VIEW',1),(566,'88','ADD_TO_PAGE',2),(567,'88','CONFIGURATION',4),(568,'88','PERMISSIONS',8),(569,'88','PREFERENCES',16),(570,'88','ACCESS_IN_CONTROL_PANEL',32),(571,'130','ACCESS_IN_CONTROL_PANEL',2),(572,'130','CONFIGURATION',4),(573,'130','VIEW',1),(574,'130','PERMISSIONS',8),(575,'130','PREFERENCES',16),(576,'122','ADD_PORTLET_DISPLAY_TEMPLATE',2),(577,'122','CONFIGURATION',4),(578,'122','VIEW',1),(579,'122','ADD_TO_PAGE',8),(580,'122','PERMISSIONS',16),(581,'122','PREFERENCES',32),(582,'122','ACCESS_IN_CONTROL_PANEL',64),(583,'36','ACCESS_IN_CONTROL_PANEL',64),(584,'26','VIEW',1),(585,'26','ADD_TO_PAGE',2),(586,'26','CONFIGURATION',4),(587,'26','PERMISSIONS',8),(588,'26','PREFERENCES',16),(589,'26','ACCESS_IN_CONTROL_PANEL',32),(590,'190','VIEW',1),(591,'190','ADD_TO_PAGE',2),(592,'190','CONFIGURATION',4),(593,'190','PERMISSIONS',8),(594,'190','PREFERENCES',16),(595,'190','ACCESS_IN_CONTROL_PANEL',32),(596,'175','VIEW',1),(597,'175','ADD_TO_PAGE',2),(598,'175','CONFIGURATION',4),(599,'175','PERMISSIONS',8),(600,'175','PREFERENCES',16),(601,'175','ACCESS_IN_CONTROL_PANEL',32),(602,'64','VIEW',1),(603,'64','ADD_TO_PAGE',2),(604,'64','CONFIGURATION',4),(605,'64','PERMISSIONS',8),(606,'64','PREFERENCES',16),(607,'64','ACCESS_IN_CONTROL_PANEL',32),(608,'153','ACCESS_IN_CONTROL_PANEL',2),(609,'153','ADD_TO_PAGE',4),(610,'153','CONFIGURATION',8),(611,'153','VIEW',1),(612,'153','PERMISSIONS',16),(613,'153','PREFERENCES',32),(614,'182','VIEW',1),(615,'182','ADD_TO_PAGE',2),(616,'182','CONFIGURATION',4),(617,'182','PERMISSIONS',8),(618,'182','PREFERENCES',16),(619,'182','ACCESS_IN_CONTROL_PANEL',32),(620,'179','ACCESS_IN_CONTROL_PANEL',2),(621,'179','CONFIGURATION',4),(622,'179','VIEW',1),(623,'179','PERMISSIONS',8),(624,'179','PREFERENCES',16),(625,'173','VIEW',1),(626,'173','ADD_TO_PAGE',2),(627,'173','CONFIGURATION',4),(628,'173','PERMISSIONS',8),(629,'173','PREFERENCES',16),(630,'173','ACCESS_IN_CONTROL_PANEL',32),(631,'100','VIEW',1),(632,'100','ADD_TO_PAGE',2),(633,'100','CONFIGURATION',4),(634,'100','PERMISSIONS',8),(635,'100','PREFERENCES',16),(636,'100','ACCESS_IN_CONTROL_PANEL',32),(637,'157','ACCESS_IN_CONTROL_PANEL',2),(638,'157','CONFIGURATION',4),(639,'157','VIEW',1),(640,'157','PERMISSIONS',8),(641,'157','PREFERENCES',16),(642,'19','ACCESS_IN_CONTROL_PANEL',32),(643,'160','VIEW',1),(644,'160','ADD_TO_PAGE',2),(645,'160','CONFIGURATION',4),(646,'160','PERMISSIONS',8),(647,'160','PREFERENCES',16),(648,'160','ACCESS_IN_CONTROL_PANEL',32),(649,'181','VIEW',1),(650,'181','ADD_TO_PAGE',2),(651,'181','CONFIGURATION',4),(652,'181','PERMISSIONS',8),(653,'181','PREFERENCES',16),(654,'181','ACCESS_IN_CONTROL_PANEL',32),(655,'86','VIEW',1),(656,'86','ADD_TO_PAGE',2),(657,'86','CONFIGURATION',4),(658,'86','PERMISSIONS',8),(659,'86','PREFERENCES',16),(660,'86','ACCESS_IN_CONTROL_PANEL',32),(661,'148','VIEW',1),(662,'148','ADD_TO_PAGE',2),(663,'148','CONFIGURATION',4),(664,'148','PERMISSIONS',8),(665,'148','PREFERENCES',16),(666,'148','ACCESS_IN_CONTROL_PANEL',32),(667,'11','ADD_TO_PAGE',2),(668,'11','CONFIGURATION',4),(669,'11','VIEW',1),(670,'11','PERMISSIONS',8),(671,'11','PREFERENCES',16),(672,'11','ACCESS_IN_CONTROL_PANEL',32),(673,'29','ADD_TO_PAGE',2),(674,'29','CONFIGURATION',4),(675,'29','VIEW',1),(676,'29','PERMISSIONS',8),(677,'29','PREFERENCES',16),(678,'29','ACCESS_IN_CONTROL_PANEL',32),(679,'174','ACCESS_IN_CONTROL_PANEL',32),(680,'158','ACCESS_IN_CONTROL_PANEL',2),(681,'158','ADD_TO_PAGE',4),(682,'158','CONFIGURATION',8),(683,'158','VIEW',1),(684,'158','PERMISSIONS',16),(685,'158','PREFERENCES',32),(686,'178','ACCESS_IN_CONTROL_PANEL',32),(687,'124','VIEW',1),(688,'124','ADD_TO_PAGE',2),(689,'124','CONFIGURATION',4),(690,'124','PERMISSIONS',8),(691,'124','PREFERENCES',16),(692,'124','ACCESS_IN_CONTROL_PANEL',32),(693,'58','ADD_TO_PAGE',2),(694,'58','CONFIGURATION',4),(695,'58','VIEW',1),(696,'58','PERMISSIONS',8),(697,'58','PREFERENCES',16),(698,'58','ACCESS_IN_CONTROL_PANEL',32),(699,'97','VIEW',1),(700,'97','ADD_TO_PAGE',2),(701,'97','CONFIGURATION',4),(702,'97','PERMISSIONS',8),(703,'97','PREFERENCES',16),(704,'97','ACCESS_IN_CONTROL_PANEL',32),(705,'71','ADD_TO_PAGE',2),(706,'71','CONFIGURATION',4),(707,'71','VIEW',1),(708,'71','PERMISSIONS',8),(709,'71','PREFERENCES',16),(710,'71','ACCESS_IN_CONTROL_PANEL',32),(711,'39','VIEW',1),(712,'39','ADD_TO_PAGE',2),(713,'39','CONFIGURATION',4),(714,'39','PERMISSIONS',8),(715,'39','PREFERENCES',16),(716,'39','ACCESS_IN_CONTROL_PANEL',32),(717,'185','VIEW',1),(718,'185','ADD_TO_PAGE',2),(719,'185','CONFIGURATION',4),(720,'185','PERMISSIONS',8),(721,'185','PREFERENCES',16),(722,'185','ACCESS_IN_CONTROL_PANEL',32),(723,'170','VIEW',1),(724,'170','ADD_TO_PAGE',2),(725,'170','CONFIGURATION',4),(726,'170','PERMISSIONS',8),(727,'170','PREFERENCES',16),(728,'170','ACCESS_IN_CONTROL_PANEL',32),(729,'85','ADD_TO_PAGE',2),(730,'85','CONFIGURATION',4),(731,'85','VIEW',1),(732,'85','PERMISSIONS',8),(733,'85','PREFERENCES',16),(734,'85','ADD_PORTLET_DISPLAY_TEMPLATE',32),(735,'85','ACCESS_IN_CONTROL_PANEL',64),(736,'118','VIEW',1),(737,'118','ADD_TO_PAGE',2),(738,'118','CONFIGURATION',4),(739,'118','PERMISSIONS',8),(740,'118','PREFERENCES',16),(741,'118','ACCESS_IN_CONTROL_PANEL',32),(742,'107','VIEW',1),(743,'107','ADD_TO_PAGE',2),(744,'107','CONFIGURATION',4),(745,'107','PERMISSIONS',8),(746,'107','PREFERENCES',16),(747,'107','ACCESS_IN_CONTROL_PANEL',32),(748,'30','VIEW',1),(749,'30','ADD_TO_PAGE',2),(750,'30','CONFIGURATION',4),(751,'30','PERMISSIONS',8),(752,'30','PREFERENCES',16),(753,'30','ACCESS_IN_CONTROL_PANEL',32),(754,'184','ADD_TO_PAGE',2),(755,'184','CONFIGURATION',4),(756,'184','VIEW',1),(757,'184','PERMISSIONS',8),(758,'184','PREFERENCES',16),(759,'184','ACCESS_IN_CONTROL_PANEL',32),(760,'48','VIEW',1),(761,'48','ADD_TO_PAGE',2),(762,'48','CONFIGURATION',4),(763,'48','PERMISSIONS',8),(764,'48','PREFERENCES',16),(765,'48','ACCESS_IN_CONTROL_PANEL',32),(766,'62','VIEW',1),(767,'62','ADD_TO_PAGE',2),(768,'62','CONFIGURATION',4),(769,'62','PERMISSIONS',8),(770,'62','PREFERENCES',16),(771,'62','ACCESS_IN_CONTROL_PANEL',32),(772,'176','VIEW',1),(773,'176','ADD_TO_PAGE',2),(774,'176','CONFIGURATION',4),(775,'176','PERMISSIONS',8),(776,'176','PREFERENCES',16),(777,'176','ACCESS_IN_CONTROL_PANEL',32),(778,'172','VIEW',1),(779,'172','ADD_TO_PAGE',2),(780,'172','CONFIGURATION',4),(781,'172','PERMISSIONS',8),(782,'172','PREFERENCES',16),(783,'172','ACCESS_IN_CONTROL_PANEL',32),(784,'187','ADD_TO_PAGE',2),(785,'187','CONFIGURATION',4),(786,'187','VIEW',1),(787,'187','PERMISSIONS',8),(788,'187','PREFERENCES',16),(789,'187','ACCESS_IN_CONTROL_PANEL',32),(790,'108','VIEW',1),(791,'108','ADD_TO_PAGE',2),(792,'108','CONFIGURATION',4),(793,'108','PERMISSIONS',8),(794,'108','PREFERENCES',16),(795,'108','ACCESS_IN_CONTROL_PANEL',32),(796,'84','ACCESS_IN_CONTROL_PANEL',64),(797,'101','ADD_PORTLET_DISPLAY_TEMPLATE',2),(798,'101','ADD_TO_PAGE',4),(799,'101','CONFIGURATION',8),(800,'101','SUBSCRIBE',16),(801,'101','VIEW',1),(802,'101','PERMISSIONS',32),(803,'101','PREFERENCES',64),(804,'101','ACCESS_IN_CONTROL_PANEL',128),(805,'121','VIEW',1),(806,'121','ADD_TO_PAGE',2),(807,'121','CONFIGURATION',4),(808,'121','PERMISSIONS',8),(809,'121','PREFERENCES',16),(810,'121','ACCESS_IN_CONTROL_PANEL',32),(811,'49','VIEW',1),(812,'49','ADD_TO_PAGE',2),(813,'49','CONFIGURATION',4),(814,'49','PERMISSIONS',8),(815,'49','PREFERENCES',16),(816,'49','ACCESS_IN_CONTROL_PANEL',32),(817,'143','VIEW',1),(818,'143','ADD_TO_PAGE',2),(819,'143','CONFIGURATION',4),(820,'143','PERMISSIONS',8),(821,'143','PREFERENCES',16),(822,'143','ACCESS_IN_CONTROL_PANEL',32),(823,'77','VIEW',1),(824,'77','ADD_TO_PAGE',2),(825,'77','CONFIGURATION',4),(826,'77','PERMISSIONS',8),(827,'77','PREFERENCES',16),(828,'77','ACCESS_IN_CONTROL_PANEL',32),(829,'115','VIEW',1),(830,'115','ADD_TO_PAGE',2),(831,'115','CONFIGURATION',4),(832,'115','PERMISSIONS',8),(833,'115','PREFERENCES',16),(834,'115','ACCESS_IN_CONTROL_PANEL',32),(835,'56','ADD_TO_PAGE',2),(836,'56','CONFIGURATION',4),(837,'56','VIEW',1),(838,'56','PERMISSIONS',8),(839,'56','PREFERENCES',16),(840,'56','ACCESS_IN_CONTROL_PANEL',32),(841,'142','VIEW',1),(842,'142','ADD_TO_PAGE',2),(843,'142','CONFIGURATION',4),(844,'142','PERMISSIONS',8),(845,'142','PREFERENCES',16),(846,'142','ACCESS_IN_CONTROL_PANEL',32),(847,'16','PREFERENCES',2),(848,'16','GUEST_PREFERENCES',4),(849,'16','VIEW',1),(850,'16','ADD_TO_PAGE',8),(851,'16','CONFIGURATION',16),(852,'16','PERMISSIONS',32),(853,'16','ACCESS_IN_CONTROL_PANEL',64),(854,'3','VIEW',1),(855,'3','ADD_TO_PAGE',2),(856,'3','CONFIGURATION',4),(857,'3','PERMISSIONS',8),(858,'3','PREFERENCES',16),(859,'3','ACCESS_IN_CONTROL_PANEL',32),(860,'23','VIEW',1),(861,'23','ADD_TO_PAGE',2),(862,'23','CONFIGURATION',4),(863,'23','PERMISSIONS',8),(864,'23','PREFERENCES',16),(865,'23','ACCESS_IN_CONTROL_PANEL',32),(866,'145','VIEW',1),(867,'145','ADD_TO_PAGE',2),(868,'145','CONFIGURATION',4),(869,'145','PERMISSIONS',8),(870,'145','PREFERENCES',16),(871,'145','ACCESS_IN_CONTROL_PANEL',32),(872,'83','ACCESS_IN_CONTROL_PANEL',64),(873,'194','VIEW',1),(874,'194','ADD_TO_PAGE',2),(875,'194','CONFIGURATION',4),(876,'194','PERMISSIONS',8),(877,'194','PREFERENCES',16),(878,'194','ACCESS_IN_CONTROL_PANEL',32),(879,'186','ADD_TO_PAGE',2),(880,'186','CONFIGURATION',4),(881,'186','VIEW',1),(882,'186','PERMISSIONS',8),(883,'186','PREFERENCES',16),(884,'186','ACCESS_IN_CONTROL_PANEL',32),(885,'164','VIEW',1),(886,'164','ADD_TO_PAGE',2),(887,'164','CONFIGURATION',4),(888,'164','PERMISSIONS',8),(889,'164','PREFERENCES',16),(890,'164','ACCESS_IN_CONTROL_PANEL',32),(891,'70','VIEW',1),(892,'70','ADD_TO_PAGE',2),(893,'70','CONFIGURATION',4),(894,'70','PERMISSIONS',8),(895,'70','PREFERENCES',16),(896,'70','ACCESS_IN_CONTROL_PANEL',32),(897,'141','ADD_PORTLET_DISPLAY_TEMPLATE',2),(898,'141','CONFIGURATION',4),(899,'141','VIEW',1),(900,'141','ADD_TO_PAGE',8),(901,'141','PERMISSIONS',16),(902,'141','PREFERENCES',32),(903,'141','ACCESS_IN_CONTROL_PANEL',64),(904,'9','VIEW',1),(905,'9','ADD_TO_PAGE',2),(906,'9','CONFIGURATION',4),(907,'9','PERMISSIONS',8),(908,'9','PREFERENCES',16),(909,'9','ACCESS_IN_CONTROL_PANEL',32),(910,'137','ACCESS_IN_CONTROL_PANEL',2),(911,'137','CONFIGURATION',4),(912,'137','VIEW',1),(913,'137','PERMISSIONS',8),(914,'137','PREFERENCES',16),(915,'133','VIEW',1),(916,'133','ADD_TO_PAGE',2),(917,'133','CONFIGURATION',4),(918,'133','PERMISSIONS',8),(919,'133','PREFERENCES',16),(920,'133','ACCESS_IN_CONTROL_PANEL',32),(921,'116','VIEW',1),(922,'116','ADD_TO_PAGE',2),(923,'116','CONFIGURATION',4),(924,'116','PERMISSIONS',8),(925,'116','PREFERENCES',16),(926,'116','ACCESS_IN_CONTROL_PANEL',32),(927,'47','VIEW',1),(928,'47','ADD_TO_PAGE',2),(929,'47','CONFIGURATION',4),(930,'47','PERMISSIONS',8),(931,'47','PREFERENCES',16),(932,'47','ACCESS_IN_CONTROL_PANEL',32),(933,'82','VIEW',1),(934,'82','ADD_TO_PAGE',2),(935,'82','CONFIGURATION',4),(936,'82','PERMISSIONS',8),(937,'82','PREFERENCES',16),(938,'82','ACCESS_IN_CONTROL_PANEL',32),(939,'103','VIEW',1),(940,'103','ADD_TO_PAGE',2),(941,'103','CONFIGURATION',4),(942,'103','PERMISSIONS',8),(943,'103','PREFERENCES',16),(944,'103','ACCESS_IN_CONTROL_PANEL',32),(945,'151','ACCESS_IN_CONTROL_PANEL',2),(946,'151','CONFIGURATION',4),(947,'151','VIEW',1),(948,'151','PERMISSIONS',8),(949,'151','PREFERENCES',16),(950,'140','ACCESS_IN_CONTROL_PANEL',2),(951,'140','CONFIGURATION',4),(952,'140','VIEW',1),(953,'140','PERMISSIONS',8),(954,'140','PREFERENCES',16),(955,'54','VIEW',1),(956,'54','ADD_TO_PAGE',2),(957,'54','CONFIGURATION',4),(958,'54','PERMISSIONS',8),(959,'54','PREFERENCES',16),(960,'54','ACCESS_IN_CONTROL_PANEL',32),(961,'169','ACCESS_IN_CONTROL_PANEL',32),(962,'132','ACCESS_IN_CONTROL_PANEL',2),(963,'132','CONFIGURATION',4),(964,'132','VIEW',1),(965,'132','PERMISSIONS',8),(966,'132','PREFERENCES',16),(967,'34','ACCESS_IN_CONTROL_PANEL',32),(968,'61','VIEW',1),(969,'61','ADD_TO_PAGE',2),(970,'61','CONFIGURATION',4),(971,'61','PERMISSIONS',8),(972,'61','PREFERENCES',16),(973,'61','ACCESS_IN_CONTROL_PANEL',32),(974,'73','ADD_TO_PAGE',2),(975,'73','CONFIGURATION',4),(976,'73','VIEW',1),(977,'73','PERMISSIONS',8),(978,'73','PREFERENCES',16),(979,'73','ACCESS_IN_CONTROL_PANEL',32),(980,'193','VIEW',1),(981,'193','ADD_TO_PAGE',2),(982,'193','CONFIGURATION',4),(983,'193','PERMISSIONS',8),(984,'193','PREFERENCES',16),(985,'193','ACCESS_IN_CONTROL_PANEL',32),(986,'127','ACCESS_IN_CONTROL_PANEL',32),(987,'50','VIEW',1),(988,'50','ADD_TO_PAGE',2),(989,'50','CONFIGURATION',4),(990,'50','PERMISSIONS',8),(991,'50','PREFERENCES',16),(992,'50','ACCESS_IN_CONTROL_PANEL',32),(993,'31','ACCESS_IN_CONTROL_PANEL',32),(994,'165','ACCESS_IN_CONTROL_PANEL',32),(995,'192','VIEW',1),(996,'192','ADD_TO_PAGE',2),(997,'192','CONFIGURATION',4),(998,'192','PERMISSIONS',8),(999,'192','PREFERENCES',16),(1000,'192','ACCESS_IN_CONTROL_PANEL',32),(1001,'90','ADD_COMMUNITY',2),(1002,'90','ADD_GENERAL_ANNOUNCEMENTS',4),(1003,'90','ADD_LAYOUT_PROTOTYPE',8),(1004,'90','ADD_LAYOUT_SET_PROTOTYPE',16),(1005,'90','ADD_LICENSE',32),(1006,'90','ADD_ORGANIZATION',64),(1007,'90','ADD_PASSWORD_POLICY',128),(1008,'90','ADD_ROLE',256),(1009,'90','ADD_USER',512),(1010,'90','ADD_USER_GROUP',1024),(1011,'90','CONFIGURATION',2048),(1012,'90','EXPORT_USER',4096),(1013,'90','IMPERSONATE',8192),(1014,'90','UNLINK_LAYOUT_SET_PROTOTYPE',16384),(1015,'90','VIEW_CONTROL_PANEL',32768),(1016,'90','ADD_TO_PAGE',65536),(1017,'90','PERMISSIONS',131072),(1018,'90','PREFERENCES',262144),(1019,'90','VIEW',1),(1020,'90','ACCESS_IN_CONTROL_PANEL',524288),(1021,'150','ACCESS_IN_CONTROL_PANEL',2),(1022,'150','CONFIGURATION',4),(1023,'150','VIEW',1),(1024,'150','PERMISSIONS',8),(1025,'150','PREFERENCES',16),(1026,'113','VIEW',1),(1027,'113','ADD_TO_PAGE',2),(1028,'113','CONFIGURATION',4),(1029,'113','PERMISSIONS',8),(1030,'113','PREFERENCES',16),(1031,'113','ACCESS_IN_CONTROL_PANEL',32),(1032,'33','ACCESS_IN_CONTROL_PANEL',64),(1033,'2','ACCESS_IN_CONTROL_PANEL',2),(1034,'2','CONFIGURATION',4),(1035,'2','VIEW',1),(1036,'2','PERMISSIONS',8),(1037,'2','PREFERENCES',16),(1038,'191','VIEW',1),(1039,'191','ADD_TO_PAGE',2),(1040,'191','CONFIGURATION',4),(1041,'191','PERMISSIONS',8),(1042,'191','PREFERENCES',16),(1043,'191','ACCESS_IN_CONTROL_PANEL',32),(1044,'119','VIEW',1),(1045,'119','ADD_TO_PAGE',2),(1046,'119','CONFIGURATION',4),(1047,'119','PERMISSIONS',8),(1048,'119','PREFERENCES',16),(1049,'119','ACCESS_IN_CONTROL_PANEL',32),(1050,'114','VIEW',1),(1051,'114','ADD_TO_PAGE',2),(1052,'114','CONFIGURATION',4),(1053,'114','PERMISSIONS',8),(1054,'114','PREFERENCES',16),(1055,'114','ACCESS_IN_CONTROL_PANEL',32),(1056,'67','VIEW',1),(1057,'67','ADD_TO_PAGE',2),(1058,'67','CONFIGURATION',4),(1059,'67','PERMISSIONS',8),(1060,'67','PREFERENCES',16),(1061,'67','ACCESS_IN_CONTROL_PANEL',32),(1062,'110','ACCESS_IN_CONTROL_PANEL',32),(1063,'135','ACCESS_IN_CONTROL_PANEL',2),(1064,'135','CONFIGURATION',4),(1065,'135','VIEW',1),(1066,'135','PERMISSIONS',8),(1067,'135','PREFERENCES',16),(1068,'59','ACCESS_IN_CONTROL_PANEL',32),(1069,'188','ADD_TO_PAGE',2),(1070,'188','CONFIGURATION',4),(1071,'188','VIEW',1),(1072,'188','PERMISSIONS',8),(1073,'188','PREFERENCES',16),(1074,'188','ACCESS_IN_CONTROL_PANEL',32),(1075,'131','ACCESS_IN_CONTROL_PANEL',2),(1076,'131','CONFIGURATION',4),(1077,'131','VIEW',1),(1078,'131','PERMISSIONS',8),(1079,'131','PREFERENCES',16),(1080,'102','VIEW',1),(1081,'102','ADD_TO_PAGE',2),(1082,'102','CONFIGURATION',4),(1083,'102','PERMISSIONS',8),(1084,'102','PREFERENCES',16),(1085,'102','ACCESS_IN_CONTROL_PANEL',32),(1086,'1_WAR_marketplaceportlet','VIEW',1),(1087,'1_WAR_marketplaceportlet','ADD_TO_PAGE',2),(1088,'1_WAR_marketplaceportlet','CONFIGURATION',4),(1089,'1_WAR_marketplaceportlet','PERMISSIONS',8),(1090,'1_WAR_marketplaceportlet','PREFERENCES',16),(1091,'1_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',32),(1092,'2_WAR_marketplaceportlet','VIEW',1),(1093,'2_WAR_marketplaceportlet','ADD_TO_PAGE',2),(1094,'2_WAR_marketplaceportlet','CONFIGURATION',4),(1095,'2_WAR_marketplaceportlet','PERMISSIONS',8),(1096,'2_WAR_marketplaceportlet','PREFERENCES',16),(1097,'2_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',32),(1098,'3_WAR_marketplaceportlet','VIEW',1),(1099,'3_WAR_marketplaceportlet','ADD_TO_PAGE',2),(1100,'3_WAR_marketplaceportlet','CONFIGURATION',4),(1101,'3_WAR_marketplaceportlet','PERMISSIONS',8),(1102,'3_WAR_marketplaceportlet','PREFERENCES',16),(1103,'3_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',32),(1104,'1_WAR_calendarportlet','ACCESS_IN_CONTROL_PANEL',2),(1105,'1_WAR_calendarportlet','ADD_TO_PAGE',4),(1106,'1_WAR_calendarportlet','CONFIGURATION',8),(1107,'1_WAR_calendarportlet','VIEW',1),(1108,'1_WAR_calendarportlet','PERMISSIONS',16),(1109,'1_WAR_calendarportlet','PREFERENCES',32),(1110,'com.liferay.calendar.model.CalendarResource','ADD_CALENDAR',2),(1111,'com.liferay.calendar.model.CalendarResource','DELETE',4),(1112,'com.liferay.calendar.model.CalendarResource','UPDATE',8),(1113,'com.liferay.calendar.model.CalendarResource','VIEW',1),(1114,'com.liferay.calendar.model.CalendarResource','PERMISSIONS',16),(1115,'com.liferay.calendar.model.Calendar','DELETE',2),(1116,'com.liferay.calendar.model.Calendar','MANAGE_BOOKINGS',4),(1117,'com.liferay.calendar.model.Calendar','PERMISSIONS',8),(1118,'com.liferay.calendar.model.Calendar','UPDATE',16),(1119,'com.liferay.calendar.model.Calendar','VIEW',1),(1120,'com.liferay.calendar.model.Calendar','VIEW_BOOKING_DETAILS',32),(1121,'com.liferay.calendar','ADD_RESOURCE',2),(1122,'com.liferay.calendar','PERMISSIONS',4),(1123,'com.liferay.calendar.model.CalendarBooking','ADD_DISCUSSION',2),(1124,'com.liferay.calendar.model.CalendarBooking','DELETE_DISCUSSION',4),(1125,'com.liferay.calendar.model.CalendarBooking','PERMISSIONS',8),(1126,'com.liferay.calendar.model.CalendarBooking','UPDATE_DISCUSSION',16),(1127,'2_WAR_notificationsportlet','VIEW',1),(1128,'2_WAR_notificationsportlet','ADD_TO_PAGE',2),(1129,'2_WAR_notificationsportlet','CONFIGURATION',4),(1130,'2_WAR_notificationsportlet','PERMISSIONS',8),(1131,'2_WAR_notificationsportlet','PREFERENCES',16),(1132,'2_WAR_notificationsportlet','ACCESS_IN_CONTROL_PANEL',32),(1133,'1_WAR_notificationsportlet','VIEW',1),(1134,'1_WAR_notificationsportlet','ADD_TO_PAGE',2),(1135,'1_WAR_notificationsportlet','CONFIGURATION',4),(1136,'1_WAR_notificationsportlet','PERMISSIONS',8),(1137,'1_WAR_notificationsportlet','PREFERENCES',16),(1138,'1_WAR_notificationsportlet','ACCESS_IN_CONTROL_PANEL',32),(1139,'4_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',2),(1140,'4_WAR_opensocialportlet','CONFIGURATION',4),(1141,'4_WAR_opensocialportlet','VIEW',1),(1142,'4_WAR_opensocialportlet','PERMISSIONS',8),(1143,'4_WAR_opensocialportlet','PREFERENCES',16),(1144,'2_WAR_opensocialportlet','ADD_TO_PAGE',2),(1145,'2_WAR_opensocialportlet','CONFIGURATION',4),(1146,'2_WAR_opensocialportlet','VIEW',1),(1147,'2_WAR_opensocialportlet','PERMISSIONS',8),(1148,'2_WAR_opensocialportlet','PREFERENCES',16),(1149,'2_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',32),(1150,'1_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',2),(1151,'1_WAR_opensocialportlet','CONFIGURATION',4),(1152,'1_WAR_opensocialportlet','VIEW',1),(1153,'1_WAR_opensocialportlet','PERMISSIONS',8),(1154,'1_WAR_opensocialportlet','PREFERENCES',16),(1155,'com.liferay.opensocial.model.Gadget','DELETE',2),(1156,'com.liferay.opensocial.model.Gadget','PERMISSIONS',4),(1157,'com.liferay.opensocial.model.Gadget','UPDATE',8),(1158,'com.liferay.opensocial.model.Gadget','VIEW',1),(1159,'com.liferay.opensocial','PERMISSIONS',2),(1160,'com.liferay.opensocial','PUBLISH_GADGET',4),(1161,'3_WAR_opensocialportlet','ADD_TO_PAGE',2),(1162,'3_WAR_opensocialportlet','CONFIGURATION',4),(1163,'3_WAR_opensocialportlet','VIEW',1),(1164,'3_WAR_opensocialportlet','PERMISSIONS',8),(1165,'3_WAR_opensocialportlet','PREFERENCES',16),(1166,'3_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',32),(1167,'1_WAR_webformportlet','VIEW',1),(1168,'1_WAR_webformportlet','ADD_TO_PAGE',2),(1169,'1_WAR_webformportlet','CONFIGURATION',4),(1170,'1_WAR_webformportlet','PERMISSIONS',8),(1171,'1_WAR_webformportlet','PREFERENCES',16),(1172,'1_WAR_webformportlet','ACCESS_IN_CONTROL_PANEL',32),(1201,'bookscatalog_WAR_tiislibraryportlet','VIEW',1),(1202,'bookscatalog_WAR_tiislibraryportlet','ADD_TO_PAGE',2),(1203,'bookscatalog_WAR_tiislibraryportlet','CONFIGURATION',4),(1204,'bookscatalog_WAR_tiislibraryportlet','PERMISSIONS',8),(1205,'bookscatalog_WAR_tiislibraryportlet','PREFERENCES',16),(1206,'bookscatalog_WAR_tiislibraryportlet','ACCESS_IN_CONTROL_PANEL',32),(1301,'library_WAR_tiislibraryportlet','VIEW',1),(1302,'library_WAR_tiislibraryportlet','ADD_TO_PAGE',2),(1303,'library_WAR_tiislibraryportlet','CONFIGURATION',4),(1304,'library_WAR_tiislibraryportlet','PERMISSIONS',8),(1305,'library_WAR_tiislibraryportlet','PREFERENCES',16),(1306,'library_WAR_tiislibraryportlet','ACCESS_IN_CONTROL_PANEL',32),(1401,'bookinfo_WAR_tiislibraryportlet','VIEW',1),(1402,'bookinfo_WAR_tiislibraryportlet','ADD_TO_PAGE',2),(1403,'bookinfo_WAR_tiislibraryportlet','CONFIGURATION',4),(1404,'bookinfo_WAR_tiislibraryportlet','PERMISSIONS',8),(1405,'bookinfo_WAR_tiislibraryportlet','PREFERENCES',16),(1406,'bookinfo_WAR_tiislibraryportlet','ACCESS_IN_CONTROL_PANEL',32),(1501,'librarymanagment_WAR_tiislibraryportlet','VIEW',1),(1502,'librarymanagment_WAR_tiislibraryportlet','ADD_TO_PAGE',2),(1503,'librarymanagment_WAR_tiislibraryportlet','CONFIGURATION',4),(1504,'librarymanagment_WAR_tiislibraryportlet','PERMISSIONS',8),(1505,'librarymanagment_WAR_tiislibraryportlet','PREFERENCES',16),(1506,'librarymanagment_WAR_tiislibraryportlet','ACCESS_IN_CONTROL_PANEL',32);
/*!40000 ALTER TABLE `resourceaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourceblock`
--

DROP TABLE IF EXISTS `resourceblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourceblock` (
  `resourceBlockId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `permissionsHash` varchar(75) DEFAULT NULL,
  `referenceCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceBlockId`),
  UNIQUE KEY `IX_AEEA209C` (`companyId`,`groupId`,`name`,`permissionsHash`),
  KEY `IX_DA30B086` (`companyId`,`groupId`,`name`),
  KEY `IX_2D4CC782` (`companyId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourceblock`
--

LOCK TABLES `resourceblock` WRITE;
/*!40000 ALTER TABLE `resourceblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `resourceblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourceblockpermission`
--

DROP TABLE IF EXISTS `resourceblockpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourceblockpermission` (
  `resourceBlockPermissionId` bigint(20) NOT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceBlockPermissionId`),
  UNIQUE KEY `IX_D63D20BB` (`resourceBlockId`,`roleId`),
  KEY `IX_4AB3756` (`resourceBlockId`),
  KEY `IX_20A2E3D9` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourceblockpermission`
--

LOCK TABLES `resourceblockpermission` WRITE;
/*!40000 ALTER TABLE `resourceblockpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `resourceblockpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepermission`
--

DROP TABLE IF EXISTS `resourcepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepermission` (
  `resourcePermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `primKey` varchar(255) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourcePermissionId`),
  UNIQUE KEY `IX_8D83D0CE` (`companyId`,`name`,`scope`,`primKey`,`roleId`),
  KEY `IX_60B99860` (`companyId`,`name`,`scope`),
  KEY `IX_2200AA69` (`companyId`,`name`,`scope`,`primKey`),
  KEY `IX_26284944` (`companyId`,`primKey`),
  KEY `IX_A37A0588` (`roleId`),
  KEY `IX_F4555981` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepermission`
--

LOCK TABLES `resourcepermission` WRITE;
/*!40000 ALTER TABLE `resourcepermission` DISABLE KEYS */;
INSERT INTO `resourcepermission` VALUES (1,20155,'2',1,'20155',20166,0,2),(2,20155,'140',1,'20155',20166,0,2),(3,20155,'158',1,'20155',20166,0,6),(4,20155,'153',1,'20155',20166,0,6),(5,20155,'com.liferay.portal.model.Role',4,'20162',20166,0,1),(6,20155,'com.liferay.portal.model.Role',4,'20163',20166,0,1),(7,20155,'com.liferay.portal.model.Role',4,'20164',20166,0,1),(8,20155,'com.liferay.portal.model.Role',4,'20165',20166,0,1),(9,20155,'com.liferay.portal.model.Role',4,'20166',20166,0,1),(10,20155,'com.liferay.portal.model.Role',4,'20167',20166,0,1),(11,20155,'com.liferay.portal.model.Role',4,'20168',20166,0,1),(12,20155,'com.liferay.portal.model.Role',4,'20169',20166,0,1),(13,20155,'com.liferay.portal.model.Role',4,'20170',20166,0,1),(14,20155,'com.liferay.portal.model.Role',4,'20171',20166,0,1),(15,20155,'com.liferay.portal.model.Role',4,'20172',20166,0,1),(16,20155,'com.liferay.portal.model.Layout',4,'20176',20164,20159,1023),(17,20155,'com.liferay.portal.model.Layout',4,'20176',20171,0,19),(18,20155,'com.liferay.portal.model.Layout',4,'20176',20163,0,1),(19,20155,'com.liferay.portal.model.Layout',4,'20185',20164,20159,1023),(20,20155,'com.liferay.portal.model.Layout',4,'20185',20171,0,19),(21,20155,'com.liferay.portal.model.Layout',4,'20185',20163,0,1),(22,20155,'com.liferay.portal.model.Layout',2,'20192',20166,0,1),(23,20155,'com.liferay.portlet.blogs',2,'20192',20166,0,14),(24,20155,'98',2,'20192',20165,0,2),(25,20155,'183',2,'20192',20165,0,32),(26,20155,'152',2,'20192',20165,0,2),(27,20155,'182',2,'20192',20165,0,32),(28,20155,'179',2,'20192',20165,0,2),(29,20155,'173',2,'20192',20165,0,32),(30,20155,'154',2,'20192',20165,0,2),(31,20155,'178',2,'20192',20165,0,32),(32,20155,'147',2,'20192',20165,0,2),(33,20155,'161',2,'20192',20165,0,2),(34,20155,'162',2,'20192',20165,0,2),(35,20155,'167',2,'20192',20165,0,2),(36,20155,'20',2,'20192',20165,0,2),(37,20155,'99',2,'20192',20165,0,2),(38,20155,'28',2,'20192',20165,0,2),(39,20155,'15',2,'20192',20165,0,2),(40,20155,'25',2,'20192',20165,0,2),(41,20155,'com.liferay.portal.model.Group',2,'20192',20165,0,8396800),(42,20155,'com.liferay.portlet.asset',2,'20192',20165,0,30),(43,20155,'com.liferay.portlet.blogs',2,'20192',20165,0,14),(44,20155,'com.liferay.portlet.bookmarks',2,'20192',20165,0,31),(45,20155,'com.liferay.portlet.documentlibrary',2,'20192',20165,0,1023),(46,20155,'com.liferay.portlet.journal',2,'20192',20165,0,255),(47,20155,'com.liferay.portlet.messageboards',2,'20192',20165,0,2047),(48,20155,'com.liferay.portlet.polls',2,'20192',20165,0,6),(49,20155,'com.liferay.portlet.wiki',2,'20192',20165,0,6),(50,20155,'com.liferay.portal.model.User',4,'20199',20164,20199,31),(51,20155,'98',1,'20155',20165,0,4),(52,20155,'98',1,'20155',20166,0,4),(53,20155,'183',1,'20155',20162,0,2),(54,20155,'66',1,'20155',20165,0,2),(55,20155,'66',1,'20155',20166,0,2),(56,20155,'180',1,'20155',20163,0,2),(57,20155,'180',1,'20155',20165,0,2),(58,20155,'180',1,'20155',20166,0,2),(59,20155,'27',1,'20155',20165,0,2),(60,20155,'27',1,'20155',20166,0,2),(61,20155,'122',1,'20155',20163,0,8),(62,20155,'122',1,'20155',20165,0,8),(63,20155,'122',1,'20155',20166,0,8),(64,20155,'36',1,'20155',20165,0,4),(65,20155,'36',1,'20155',20166,0,4),(66,20155,'26',1,'20155',20165,0,2),(67,20155,'26',1,'20155',20166,0,2),(68,20155,'175',1,'20155',20163,0,2),(69,20155,'175',1,'20155',20165,0,2),(70,20155,'175',1,'20155',20166,0,2),(71,20155,'153',1,'20155',20165,0,4),(72,20155,'64',1,'20155',20163,0,2),(73,20155,'64',1,'20155',20165,0,2),(74,20155,'64',1,'20155',20166,0,2),(75,20155,'182',1,'20155',20165,0,2),(76,20155,'182',1,'20155',20166,0,2),(77,20155,'173',1,'20155',20163,0,2),(78,20155,'173',1,'20155',20165,0,2),(79,20155,'173',1,'20155',20166,0,2),(80,20155,'100',1,'20155',20165,0,2),(81,20155,'100',1,'20155',20166,0,2),(82,20155,'19',1,'20155',20165,0,2),(83,20155,'19',1,'20155',20166,0,2),(84,20155,'181',1,'20155',20163,0,2),(85,20155,'181',1,'20155',20165,0,2),(86,20155,'181',1,'20155',20166,0,2),(87,20155,'148',1,'20155',20163,0,2),(88,20155,'148',1,'20155',20165,0,2),(89,20155,'148',1,'20155',20166,0,2),(90,20155,'11',1,'20155',20165,0,2),(91,20155,'11',1,'20155',20166,0,2),(92,20155,'29',1,'20155',20165,0,2),(93,20155,'29',1,'20155',20166,0,2),(94,20155,'158',1,'20155',20165,0,4),(95,20155,'178',1,'20155',20165,0,4),(96,20155,'178',1,'20155',20166,0,4),(97,20155,'58',1,'20155',20163,0,2),(98,20155,'58',1,'20155',20165,0,2),(99,20155,'58',1,'20155',20166,0,2),(100,20155,'71',1,'20155',20163,0,2),(101,20155,'71',1,'20155',20165,0,2),(102,20155,'71',1,'20155',20166,0,2),(103,20155,'97',1,'20155',20165,0,2),(104,20155,'97',1,'20155',20166,0,2),(105,20155,'39',1,'20155',20165,0,2),(106,20155,'39',1,'20155',20166,0,2),(107,20155,'85',1,'20155',20163,0,2),(108,20155,'85',1,'20155',20165,0,2),(109,20155,'85',1,'20155',20166,0,2),(110,20155,'118',1,'20155',20163,0,2),(111,20155,'118',1,'20155',20165,0,2),(112,20155,'118',1,'20155',20166,0,2),(113,20155,'107',1,'20155',20165,0,2),(114,20155,'107',1,'20155',20166,0,2),(115,20155,'30',1,'20155',20165,0,2),(116,20155,'30',1,'20155',20166,0,2),(117,20155,'184',1,'20155',20163,0,2),(118,20155,'184',1,'20155',20165,0,2),(119,20155,'184',1,'20155',20166,0,2),(120,20155,'48',1,'20155',20165,0,2),(121,20155,'48',1,'20155',20166,0,2),(122,20155,'62',1,'20155',20165,0,2),(123,20155,'62',1,'20155',20166,0,2),(124,20155,'176',1,'20155',20162,0,2),(125,20155,'108',1,'20155',20165,0,2),(126,20155,'108',1,'20155',20166,0,2),(127,20155,'187',1,'20155',20165,0,2),(128,20155,'187',1,'20155',20166,0,2),(129,20155,'84',1,'20155',20165,0,4),(130,20155,'84',1,'20155',20166,0,4),(131,20155,'101',1,'20155',20163,0,4),(132,20155,'101',1,'20155',20165,0,4),(133,20155,'101',1,'20155',20166,0,4),(134,20155,'121',1,'20155',20163,0,2),(135,20155,'121',1,'20155',20165,0,2),(136,20155,'121',1,'20155',20166,0,2),(137,20155,'143',1,'20155',20163,0,2),(138,20155,'143',1,'20155',20165,0,2),(139,20155,'143',1,'20155',20166,0,2),(140,20155,'77',1,'20155',20163,0,2),(141,20155,'77',1,'20155',20165,0,2),(142,20155,'77',1,'20155',20166,0,2),(143,20155,'167',1,'20155',20165,0,4),(144,20155,'167',1,'20155',20166,0,4),(145,20155,'115',1,'20155',20163,0,2),(146,20155,'115',1,'20155',20165,0,2),(147,20155,'115',1,'20155',20166,0,2),(148,20155,'56',1,'20155',20163,0,2),(149,20155,'56',1,'20155',20165,0,2),(150,20155,'56',1,'20155',20166,0,2),(151,20155,'16',1,'20155',20165,0,8),(152,20155,'16',1,'20155',20166,0,8),(153,20155,'3',1,'20155',20163,0,2),(154,20155,'3',1,'20155',20165,0,2),(155,20155,'3',1,'20155',20166,0,2),(156,20155,'20',1,'20155',20163,0,8),(157,20155,'20',1,'20155',20165,0,8),(158,20155,'20',1,'20155',20166,0,8),(159,20155,'23',1,'20155',20165,0,2),(160,20155,'23',1,'20155',20166,0,2),(161,20155,'83',1,'20155',20165,0,4),(162,20155,'83',1,'20155',20166,0,4),(163,20155,'186',1,'20155',20165,0,2),(164,20155,'186',1,'20155',20166,0,2),(165,20155,'194',1,'20155',20163,0,2),(166,20155,'194',1,'20155',20165,0,2),(167,20155,'194',1,'20155',20166,0,2),(168,20155,'70',1,'20155',20165,0,2),(169,20155,'70',1,'20155',20166,0,2),(170,20155,'164',1,'20155',20163,0,2),(171,20155,'164',1,'20155',20165,0,2),(172,20155,'164',1,'20155',20166,0,2),(173,20155,'141',1,'20155',20163,0,8),(174,20155,'141',1,'20155',20165,0,8),(175,20155,'141',1,'20155',20166,0,8),(176,20155,'9',1,'20155',20162,0,2),(177,20155,'28',1,'20155',20165,0,4),(178,20155,'28',1,'20155',20166,0,4),(179,20155,'15',1,'20155',20165,0,4),(180,20155,'15',1,'20155',20166,0,4),(181,20155,'47',1,'20155',20163,0,2),(182,20155,'47',1,'20155',20165,0,2),(183,20155,'47',1,'20155',20166,0,2),(184,20155,'116',1,'20155',20163,0,2),(185,20155,'116',1,'20155',20165,0,2),(186,20155,'116',1,'20155',20166,0,2),(187,20155,'82',1,'20155',20163,0,2),(188,20155,'82',1,'20155',20165,0,2),(189,20155,'82',1,'20155',20166,0,2),(190,20155,'54',1,'20155',20165,0,2),(191,20155,'54',1,'20155',20166,0,2),(192,20155,'34',1,'20155',20165,0,2),(193,20155,'34',1,'20155',20166,0,2),(194,20155,'169',1,'20155',20165,0,2),(195,20155,'169',1,'20155',20166,0,2),(196,20155,'61',1,'20155',20165,0,2),(197,20155,'61',1,'20155',20166,0,2),(198,20155,'73',1,'20155',20163,0,2),(199,20155,'73',1,'20155',20165,0,2),(200,20155,'73',1,'20155',20166,0,2),(201,20155,'50',1,'20155',20163,0,2),(202,20155,'50',1,'20155',20165,0,2),(203,20155,'50',1,'20155',20166,0,2),(204,20155,'127',1,'20155',20162,0,2),(205,20155,'193',1,'20155',20163,0,2),(206,20155,'193',1,'20155',20165,0,2),(207,20155,'193',1,'20155',20166,0,2),(208,20155,'31',1,'20155',20163,0,2),(209,20155,'31',1,'20155',20165,0,2),(210,20155,'31',1,'20155',20166,0,2),(211,20155,'166',1,'20155',20165,0,4),(212,20155,'166',1,'20155',20166,0,4),(213,20155,'33',1,'20155',20163,0,4),(214,20155,'33',1,'20155',20165,0,4),(215,20155,'33',1,'20155',20166,0,4),(216,20155,'114',1,'20155',20163,0,2),(217,20155,'114',1,'20155',20165,0,2),(218,20155,'114',1,'20155',20166,0,2),(219,20155,'67',1,'20155',20165,0,2),(220,20155,'67',1,'20155',20166,0,2),(221,20155,'110',1,'20155',20165,0,2),(222,20155,'110',1,'20155',20166,0,2),(223,20155,'59',1,'20155',20165,0,2),(224,20155,'59',1,'20155',20166,0,2),(225,20155,'188',1,'20155',20165,0,2),(226,20155,'188',1,'20155',20166,0,2),(227,20155,'102',1,'20155',20162,0,2),(228,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20303',20164,20159,15),(229,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20303',20166,0,1),(230,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20303',20163,0,1),(231,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20304',20164,20159,15),(232,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20304',20166,0,1),(233,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20304',20163,0,1),(234,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20305',20164,20159,15),(235,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20305',20166,0,1),(236,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20305',20163,0,1),(237,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20307',20164,20159,15),(238,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20307',20166,0,1),(239,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20307',20163,0,1),(240,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20306',20164,20159,15),(241,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20306',20166,0,1),(242,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20306',20163,0,1),(243,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20309',20164,20159,15),(244,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20309',20166,0,1),(245,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20309',20163,0,1),(246,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20308',20164,20159,15),(247,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20308',20166,0,1),(248,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20308',20163,0,1),(249,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20311',20164,20159,15),(250,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20311',20166,0,1),(251,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20311',20163,0,1),(252,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20310',20164,20159,15),(253,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20310',20166,0,1),(254,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20310',20163,0,1),(255,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20313',20164,20159,15),(256,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20313',20166,0,1),(257,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20313',20163,0,1),(258,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20312',20164,20159,15),(259,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20312',20166,0,1),(260,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'20312',20163,0,1),(261,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20315',20164,20159,15),(262,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20315',20166,0,1),(263,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20315',20163,0,1),(264,20155,'com.liferay.portal.model.LayoutPrototype',4,'20316',20164,20159,15),(265,20155,'com.liferay.portal.model.Layout',4,'20320',20164,20159,1023),(266,20155,'com.liferay.portal.model.Layout',4,'20320',20171,0,19),(267,20155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'20324',20164,20159,15),(268,20155,'33',4,'20320_LAYOUT_33',20164,0,127),(269,20155,'33',4,'20320_LAYOUT_33',20171,0,1),(270,20155,'33',4,'20320_LAYOUT_33',20163,0,1),(271,20155,'com.liferay.portlet.blogs',4,'20317',20164,0,14),(272,20155,'148',4,'20320_LAYOUT_148_INSTANCE_yRd2QnjG7SOz',20164,0,63),(273,20155,'148',4,'20320_LAYOUT_148_INSTANCE_yRd2QnjG7SOz',20171,0,1),(274,20155,'148',4,'20320_LAYOUT_148_INSTANCE_yRd2QnjG7SOz',20163,0,1),(275,20155,'114',4,'20320_LAYOUT_114',20164,0,63),(276,20155,'114',4,'20320_LAYOUT_114',20171,0,1),(277,20155,'114',4,'20320_LAYOUT_114',20163,0,1),(278,20155,'com.liferay.portal.model.LayoutPrototype',4,'20328',20164,20159,15),(279,20155,'com.liferay.portal.model.Layout',4,'20332',20164,20159,1023),(280,20155,'com.liferay.portal.model.Layout',4,'20332',20171,0,19),(281,20155,'141',4,'20332_LAYOUT_141_INSTANCE_jwcnVpPO7wtt',20164,0,127),(282,20155,'141',4,'20332_LAYOUT_141_INSTANCE_jwcnVpPO7wtt',20171,0,1),(283,20155,'141',4,'20332_LAYOUT_141_INSTANCE_jwcnVpPO7wtt',20163,0,1),(284,20155,'122',4,'20332_LAYOUT_122_INSTANCE_5aEdsJ16khto',20164,0,127),(285,20155,'122',4,'20332_LAYOUT_122_INSTANCE_5aEdsJ16khto',20171,0,1),(286,20155,'122',4,'20332_LAYOUT_122_INSTANCE_5aEdsJ16khto',20163,0,1),(287,20155,'3',4,'20332_LAYOUT_3',20164,0,63),(288,20155,'3',4,'20332_LAYOUT_3',20171,0,1),(289,20155,'3',4,'20332_LAYOUT_3',20163,0,1),(290,20155,'101',4,'20332_LAYOUT_101_INSTANCE_oRauDMMjzqO2',20164,0,255),(291,20155,'101',4,'20332_LAYOUT_101_INSTANCE_oRauDMMjzqO2',20171,0,17),(292,20155,'101',4,'20332_LAYOUT_101_INSTANCE_oRauDMMjzqO2',20163,0,1),(293,20155,'com.liferay.portal.model.LayoutPrototype',4,'20338',20164,20159,15),(294,20155,'com.liferay.portal.model.Layout',4,'20342',20164,20159,1023),(295,20155,'com.liferay.portal.model.Layout',4,'20342',20171,0,19),(296,20155,'36',4,'20342_LAYOUT_36',20164,0,127),(297,20155,'36',4,'20342_LAYOUT_36',20171,0,1),(298,20155,'36',4,'20342_LAYOUT_36',20163,0,1),(299,20155,'com.liferay.portlet.wiki',4,'20339',20164,0,6),(300,20155,'122',4,'20342_LAYOUT_122_INSTANCE_UbtJWxnPexGO',20164,0,127),(301,20155,'122',4,'20342_LAYOUT_122_INSTANCE_UbtJWxnPexGO',20171,0,1),(302,20155,'122',4,'20342_LAYOUT_122_INSTANCE_UbtJWxnPexGO',20163,0,1),(303,20155,'141',4,'20342_LAYOUT_141_INSTANCE_iKsu1dFDc5TA',20164,0,127),(304,20155,'141',4,'20342_LAYOUT_141_INSTANCE_iKsu1dFDc5TA',20171,0,1),(305,20155,'141',4,'20342_LAYOUT_141_INSTANCE_iKsu1dFDc5TA',20163,0,1),(306,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'20349',20164,20159,15),(310,20155,'com.liferay.portal.model.Layout',4,'20361',20164,20159,1023),(311,20155,'com.liferay.portal.model.Layout',4,'20361',20171,0,19),(312,20155,'com.liferay.portal.model.Layout',4,'20361',20163,0,1),(313,20155,'19',4,'20361_LAYOUT_19',20164,0,63),(314,20155,'19',4,'20361_LAYOUT_19',20171,0,1),(315,20155,'19',4,'20361_LAYOUT_19',20163,0,1),(316,20155,'com.liferay.portlet.messageboards',4,'20350',20164,0,2047),(317,20155,'com.liferay.portlet.messageboards',4,'20350',20171,0,781),(318,20155,'com.liferay.portlet.messageboards',4,'20350',20163,0,1),(319,20155,'3',4,'20361_LAYOUT_3',20164,0,63),(320,20155,'3',4,'20361_LAYOUT_3',20171,0,1),(321,20155,'3',4,'20361_LAYOUT_3',20163,0,1),(322,20155,'59',4,'20361_LAYOUT_59_INSTANCE_UQP13IeWHUvq',20164,0,63),(323,20155,'59',4,'20361_LAYOUT_59_INSTANCE_UQP13IeWHUvq',20171,0,1),(324,20155,'59',4,'20361_LAYOUT_59_INSTANCE_UQP13IeWHUvq',20163,0,1),(325,20155,'com.liferay.portlet.polls',4,'20350',20164,0,6),(326,20155,'180',4,'20361_LAYOUT_180',20164,0,63),(327,20155,'180',4,'20361_LAYOUT_180',20171,0,1),(328,20155,'180',4,'20361_LAYOUT_180',20163,0,1),(329,20155,'101',4,'20361_LAYOUT_101_INSTANCE_5erQjJCp1AmD',20164,0,255),(330,20155,'101',4,'20361_LAYOUT_101_INSTANCE_5erQjJCp1AmD',20171,0,17),(331,20155,'101',4,'20361_LAYOUT_101_INSTANCE_5erQjJCp1AmD',20163,0,1),(332,20155,'com.liferay.portal.model.Layout',4,'20369',20164,20159,1023),(333,20155,'com.liferay.portal.model.Layout',4,'20369',20171,0,19),(334,20155,'com.liferay.portal.model.Layout',4,'20369',20163,0,1),(335,20155,'36',4,'20369_LAYOUT_36',20164,0,127),(336,20155,'36',4,'20369_LAYOUT_36',20171,0,1),(337,20155,'36',4,'20369_LAYOUT_36',20163,0,1),(338,20155,'com.liferay.portlet.wiki',4,'20350',20164,0,6),(339,20155,'122',4,'20369_LAYOUT_122_INSTANCE_Mu7HACoebA1l',20164,0,127),(340,20155,'122',4,'20369_LAYOUT_122_INSTANCE_Mu7HACoebA1l',20171,0,1),(341,20155,'122',4,'20369_LAYOUT_122_INSTANCE_Mu7HACoebA1l',20163,0,1),(342,20155,'148',4,'20369_LAYOUT_148_INSTANCE_RRK748ozoyNL',20164,0,63),(343,20155,'148',4,'20369_LAYOUT_148_INSTANCE_RRK748ozoyNL',20171,0,1),(344,20155,'148',4,'20369_LAYOUT_148_INSTANCE_RRK748ozoyNL',20163,0,1),(345,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'20375',20164,20159,15),(349,20155,'com.liferay.portal.model.Layout',4,'20387',20164,20159,1023),(350,20155,'com.liferay.portal.model.Layout',4,'20387',20171,0,19),(351,20155,'com.liferay.portal.model.Layout',4,'20387',20163,0,1),(352,20155,'116',4,'20387_LAYOUT_116',20164,0,63),(353,20155,'116',4,'20387_LAYOUT_116',20171,0,1),(354,20155,'116',4,'20387_LAYOUT_116',20163,0,1),(355,20155,'3',4,'20387_LAYOUT_3',20164,0,63),(356,20155,'3',4,'20387_LAYOUT_3',20171,0,1),(357,20155,'3',4,'20387_LAYOUT_3',20163,0,1),(358,20155,'82',4,'20387_LAYOUT_82',20164,0,63),(359,20155,'82',4,'20387_LAYOUT_82',20171,0,1),(360,20155,'82',4,'20387_LAYOUT_82',20163,0,1),(361,20155,'101',4,'20387_LAYOUT_101_INSTANCE_UwZwjRTT7KcJ',20164,0,255),(362,20155,'101',4,'20387_LAYOUT_101_INSTANCE_UwZwjRTT7KcJ',20171,0,17),(363,20155,'101',4,'20387_LAYOUT_101_INSTANCE_UwZwjRTT7KcJ',20163,0,1),(364,20155,'com.liferay.portal.model.Layout',4,'20396',20164,20159,1023),(365,20155,'com.liferay.portal.model.Layout',4,'20396',20171,0,19),(366,20155,'com.liferay.portal.model.Layout',4,'20396',20163,0,1),(367,20155,'20',4,'20396_LAYOUT_20',20164,0,127),(368,20155,'20',4,'20396_LAYOUT_20',20171,0,1),(369,20155,'20',4,'20396_LAYOUT_20',20163,0,1),(370,20155,'com.liferay.portlet.documentlibrary',4,'20376',20164,0,1023),(371,20155,'com.liferay.portlet.documentlibrary',4,'20376',20171,0,331),(372,20155,'com.liferay.portlet.documentlibrary',4,'20376',20163,0,1),(373,20155,'101',4,'20396_LAYOUT_101_INSTANCE_hmIO5Hm0VPQw',20164,0,255),(374,20155,'101',4,'20396_LAYOUT_101_INSTANCE_hmIO5Hm0VPQw',20171,0,17),(375,20155,'101',4,'20396_LAYOUT_101_INSTANCE_hmIO5Hm0VPQw',20163,0,1),(376,20155,'com.liferay.portal.model.Layout',4,'20404',20164,20159,1023),(377,20155,'com.liferay.portal.model.Layout',4,'20404',20171,0,19),(378,20155,'com.liferay.portal.model.Layout',4,'20404',20163,0,1),(379,20155,'39',4,'20404_LAYOUT_39_INSTANCE_q5gobxJHASSS',20164,0,63),(380,20155,'39',4,'20404_LAYOUT_39_INSTANCE_q5gobxJHASSS',20171,0,1),(381,20155,'39',4,'20404_LAYOUT_39_INSTANCE_q5gobxJHASSS',20163,0,1),(382,20155,'39',4,'20404_LAYOUT_39_INSTANCE_ghTzLw0vrulo',20164,0,63),(383,20155,'39',4,'20404_LAYOUT_39_INSTANCE_ghTzLw0vrulo',20171,0,1),(384,20155,'39',4,'20404_LAYOUT_39_INSTANCE_ghTzLw0vrulo',20163,0,1),(385,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20412',20164,20159,15),(386,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20413',20164,20159,15),(387,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20414',20164,20159,15),(388,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20415',20164,20159,15),(389,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20416',20164,20159,15),(390,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'20417',20164,20159,15),(391,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20418',20164,20159,15),(392,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20420',20164,20159,15),(393,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20423',20164,20159,15),(394,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20425',20164,20159,15),(395,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20427',20164,20159,15),(396,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20429',20164,20159,15),(397,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'20431',20164,20159,15),(398,20155,'com.liferay.portlet.expando.model.ExpandoColumn',4,'20438',20164,0,15),(399,20155,'1_WAR_calendarportlet',1,'20155',20162,0,4),(400,20155,'1_WAR_calendarportlet',1,'20155',20163,0,4),(401,20155,'1_WAR_calendarportlet',1,'20155',20165,0,4),(402,20155,'1_WAR_calendarportlet',1,'20155',20166,0,4),(403,20155,'1_WAR_notificationsportlet',1,'20155',20162,0,2),(404,20155,'1_WAR_notificationsportlet',1,'20155',20163,0,2),(405,20155,'1_WAR_notificationsportlet',1,'20155',20165,0,2),(406,20155,'1_WAR_notificationsportlet',1,'20155',20166,0,2),(407,20155,'2_WAR_opensocialportlet',1,'20155',20162,0,2),(408,20155,'2_WAR_opensocialportlet',1,'20155',20163,0,2),(409,20155,'2_WAR_opensocialportlet',1,'20155',20165,0,2),(410,20155,'2_WAR_opensocialportlet',1,'20155',20166,0,2),(411,20155,'3_WAR_opensocialportlet',1,'20155',20162,0,2),(412,20155,'3_WAR_opensocialportlet',1,'20155',20163,0,2),(413,20155,'3_WAR_opensocialportlet',1,'20155',20165,0,2),(414,20155,'3_WAR_opensocialportlet',1,'20155',20166,0,2),(415,20155,'1_WAR_webformportlet',1,'20155',20162,0,2),(416,20155,'1_WAR_webformportlet',1,'20155',20163,0,2),(417,20155,'1_WAR_webformportlet',1,'20155',20165,0,2),(418,20155,'1_WAR_webformportlet',1,'20155',20166,0,2),(425,20155,'145',4,'20185_LAYOUT_145',20164,0,63),(426,20155,'145',4,'20185_LAYOUT_145',20171,0,1),(427,20155,'145',4,'20185_LAYOUT_145',20163,0,1),(501,20155,'com.liferay.portal.model.Layout',4,'20604',20164,20199,1023),(502,20155,'com.liferay.portal.model.Layout',4,'20610',20164,20199,1023),(503,20155,'com.liferay.portal.model.Layout',4,'20610',20166,0,19),(504,20155,'com.liferay.portal.model.Layout',4,'20610',20163,0,1),(505,20155,'2_WAR_notificationsportlet',4,'20185_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(506,20155,'2_WAR_notificationsportlet',4,'20185_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(507,20155,'2_WAR_notificationsportlet',4,'20185_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(508,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'20619',20164,20159,15),(601,20155,'49',4,'20185_LAYOUT_49',20164,0,63),(602,20155,'49',4,'20185_LAYOUT_49',20171,0,1),(603,20155,'49',4,'20185_LAYOUT_49',20163,0,1),(610,20155,'com.liferay.portal.model.Layout',4,'20713',20164,20199,1023),(611,20155,'com.liferay.portal.model.Layout',4,'20713',20171,0,19),(612,20155,'com.liferay.portal.model.Layout',4,'20713',20163,0,1),(701,20155,'bookscatalog_WAR_tiislibraryportlet',1,'20155',20162,0,2),(702,20155,'bookscatalog_WAR_tiislibraryportlet',1,'20155',20163,0,2),(703,20155,'bookscatalog_WAR_tiislibraryportlet',1,'20155',20165,0,2),(704,20155,'bookscatalog_WAR_tiislibraryportlet',1,'20155',20166,0,2),(801,20155,'82',4,'20610_LAYOUT_82',20164,0,63),(802,20155,'33',4,'20610_LAYOUT_33',20164,0,127),(803,20155,'33',4,'20610_LAYOUT_33',20166,0,1),(804,20155,'33',4,'20610_LAYOUT_33',20163,0,1),(805,20155,'82',4,'20610_LAYOUT_82',20166,0,1),(806,20155,'82',4,'20610_LAYOUT_82',20163,0,1),(807,20155,'com.liferay.portlet.blogs',4,'20201',20164,0,14),(808,20155,'3',4,'20610_LAYOUT_3',20164,0,63),(809,20155,'3',4,'20610_LAYOUT_3',20166,0,1),(810,20155,'3',4,'20610_LAYOUT_3',20163,0,1),(811,20155,'145',4,'20610_LAYOUT_145',20164,0,63),(812,20155,'145',4,'20610_LAYOUT_145',20166,0,1),(813,20155,'145',4,'20610_LAYOUT_145',20163,0,1),(814,20155,'2_WAR_notificationsportlet',4,'20610_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(815,20155,'2_WAR_notificationsportlet',4,'20610_LAYOUT_2_WAR_notificationsportlet',20166,0,1),(816,20155,'2_WAR_notificationsportlet',4,'20610_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(901,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21006',20164,20159,255),(902,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21006',20166,0,29),(903,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21006',20163,0,1),(904,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21007',20164,20199,255),(905,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21007',20166,0,29),(906,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21007',20163,0,1),(907,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21008',20164,20199,255),(908,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21008',20166,0,29),(909,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'21008',20163,0,1),(1007,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'21103',20164,20159,15),(1017,20155,'com.liferay.portlet.journal',4,'20182',20164,0,255),(1018,20155,'com.liferay.portlet.journal',4,'20182',20171,0,1),(1019,20155,'com.liferay.portlet.journal',4,'20182',20163,0,1),(1020,20155,'com.liferay.portlet.documentlibrary',4,'20182',20164,0,1023),(1021,20155,'com.liferay.portlet.documentlibrary',4,'20182',20171,0,331),(1022,20155,'com.liferay.portlet.documentlibrary',4,'20182',20163,0,1),(1062,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'21218',20164,20159,15),(1066,20155,'com.liferay.portal.model.Layout',4,'21232',20164,20159,1023),(1067,20155,'com.liferay.portal.model.Layout',4,'21232',20171,0,19),(1068,20155,'com.liferay.portal.model.Layout',4,'21232',20163,0,1),(1072,20155,'15',4,'20185_LAYOUT_15',20164,0,63),(1073,20155,'15',4,'20185_LAYOUT_15',20171,0,1),(1074,20155,'15',4,'20185_LAYOUT_15',20163,0,1),(1078,20155,'113',4,'20185_LAYOUT_113',20164,0,63),(1079,20155,'113',4,'20185_LAYOUT_113',20171,0,1),(1080,20155,'113',4,'20185_LAYOUT_113',20163,0,1),(1201,20155,'58',4,'20185_LAYOUT_58',20164,0,63),(1202,20155,'58',4,'20185_LAYOUT_58',20171,0,1),(1203,20155,'58',4,'20185_LAYOUT_58',20163,0,1),(1404,20155,'145',4,'20713_LAYOUT_145',20164,0,63),(1405,20155,'145',4,'20713_LAYOUT_145',20171,0,1),(1406,20155,'145',4,'20713_LAYOUT_145',20163,0,1),(1407,20155,'2_WAR_notificationsportlet',4,'20713_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(1408,20155,'2_WAR_notificationsportlet',4,'20713_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(1409,20155,'2_WAR_notificationsportlet',4,'20713_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(1410,20155,'com.liferay.portal.model.Layout',4,'21404',20164,20199,1023),(1411,20155,'com.liferay.portal.model.Layout',4,'21404',20171,0,19),(1412,20155,'com.liferay.portal.model.Layout',4,'21404',20163,0,1),(1413,20155,'com.liferay.portal.model.Layout',4,'21410',20164,20199,1023),(1414,20155,'com.liferay.portal.model.Layout',4,'21410',20171,0,19),(1415,20155,'com.liferay.portal.model.Layout',4,'21410',20163,0,1),(1416,20155,'145',4,'21404_LAYOUT_145',20164,0,63),(1417,20155,'145',4,'21404_LAYOUT_145',20171,0,1),(1418,20155,'145',4,'21404_LAYOUT_145',20163,0,1),(1419,20155,'2_WAR_notificationsportlet',4,'21404_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(1420,20155,'2_WAR_notificationsportlet',4,'21404_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(1421,20155,'2_WAR_notificationsportlet',4,'21404_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(1422,20155,'145',4,'21410_LAYOUT_145',20164,0,63),(1423,20155,'145',4,'21410_LAYOUT_145',20171,0,1),(1424,20155,'145',4,'21410_LAYOUT_145',20163,0,1),(1425,20155,'2_WAR_notificationsportlet',4,'21410_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(1426,20155,'2_WAR_notificationsportlet',4,'21410_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(1427,20155,'2_WAR_notificationsportlet',4,'21410_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(1504,20155,'library_WAR_tiislibraryportlet',1,'20155',20162,0,2),(1505,20155,'library_WAR_tiislibraryportlet',1,'20155',20163,0,2),(1506,20155,'library_WAR_tiislibraryportlet',1,'20155',20165,0,2),(1507,20155,'library_WAR_tiislibraryportlet',1,'20155',20166,0,2),(1604,20155,'86',4,'20185_LAYOUT_86',20164,0,63),(1605,20155,'86',4,'20185_LAYOUT_86',20171,0,1),(1606,20155,'86',4,'20185_LAYOUT_86',20163,0,1),(1801,20155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'22603',20164,20159,15),(1901,20155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'22802',20164,20199,15),(1902,20155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'22802',20171,0,1),(1903,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22803',20164,20199,31),(1904,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22803',20171,0,3),(1905,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22803',20163,0,1),(1906,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22804',20164,20199,31),(1907,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22804',20171,0,3),(1908,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22804',20163,0,1),(1909,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22805',20164,20199,31),(1910,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22805',20171,0,3),(1911,20155,'com.liferay.portlet.asset.model.AssetCategory',4,'22805',20163,0,1),(1912,20155,'com.liferay.portlet.asset.model.AssetTag',4,'22820',20164,20199,15),(1913,20155,'com.liferay.portlet.asset.model.AssetTag',4,'22821',20164,20199,15),(1914,20155,'com.liferay.portlet.polls.model.PollsQuestion',4,'22824',20164,20199,31),(1915,20155,'com.liferay.portlet.polls.model.PollsQuestion',4,'22824',20171,0,3),(1916,20155,'com.liferay.portlet.journal',4,'20201',20164,0,255),(1917,20155,'com.liferay.portlet.journal',4,'20201',20166,0,1),(1918,20155,'com.liferay.portlet.journal',4,'20201',20163,0,1),(1919,20155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'22832',20164,20159,15),(1920,20155,'com.liferay.portlet.documentlibrary',4,'20201',20164,0,1023),(1921,20155,'com.liferay.portlet.documentlibrary',4,'20201',20166,0,331),(1922,20155,'com.liferay.portlet.documentlibrary',4,'20201',20163,0,1),(1923,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'22834',20164,20199,255),(1924,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'22834',20166,0,165),(1925,20155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'22834',20163,0,1),(2001,20155,'com.liferay.portal.model.Layout',4,'22901',20164,20199,1023),(2002,20155,'com.liferay.portal.model.Layout',4,'22901',20171,0,19),(2003,20155,'com.liferay.portal.model.Layout',4,'22901',20163,0,1),(2004,20155,'145',4,'22901_LAYOUT_145',20164,0,63),(2005,20155,'145',4,'22901_LAYOUT_145',20171,0,1),(2006,20155,'145',4,'22901_LAYOUT_145',20163,0,1),(2007,20155,'2_WAR_notificationsportlet',4,'22901_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(2008,20155,'2_WAR_notificationsportlet',4,'22901_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(2009,20155,'2_WAR_notificationsportlet',4,'22901_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(2101,20155,'86',4,'22901_LAYOUT_86',20164,0,63),(2102,20155,'86',4,'22901_LAYOUT_86',20171,0,1),(2103,20155,'86',4,'22901_LAYOUT_86',20163,0,1),(2104,20155,'113',4,'22901_LAYOUT_113',20164,0,63),(2105,20155,'113',4,'22901_LAYOUT_113',20171,0,1),(2106,20155,'113',4,'22901_LAYOUT_113',20163,0,1),(2107,20155,'58',4,'22901_LAYOUT_58',20164,0,63),(2108,20155,'58',4,'22901_LAYOUT_58',20171,0,1),(2109,20155,'58',4,'22901_LAYOUT_58',20163,0,1),(2204,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'23004',20164,20199,255),(2205,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'23004',20171,0,3),(2206,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'23004',20163,0,3),(2210,20155,'56',4,'20185_LAYOUT_56_INSTANCE_hxzxircFM6RQ',20164,0,63),(2211,20155,'56',4,'20185_LAYOUT_56_INSTANCE_hxzxircFM6RQ',20171,0,1),(2212,20155,'56',4,'20185_LAYOUT_56_INSTANCE_hxzxircFM6RQ',20163,0,1),(2213,20155,'library_WAR_tiislibraryportlet',4,'20185_LAYOUT_library_WAR_tiislibraryportlet',20164,0,63),(2214,20155,'library_WAR_tiislibraryportlet',4,'20185_LAYOUT_library_WAR_tiislibraryportlet',20171,0,1),(2215,20155,'library_WAR_tiislibraryportlet',4,'20185_LAYOUT_library_WAR_tiislibraryportlet',20163,0,1),(2216,20155,'com.liferay.portal.model.Layout',4,'23030',20164,20199,1023),(2217,20155,'com.liferay.portal.model.Layout',4,'23030',20171,0,19),(2218,20155,'145',4,'23030_LAYOUT_145',20164,0,63),(2219,20155,'145',4,'23030_LAYOUT_145',20171,0,1),(2220,20155,'2_WAR_notificationsportlet',4,'23030_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(2221,20155,'2_WAR_notificationsportlet',4,'23030_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(2222,20155,'library_WAR_tiislibraryportlet',4,'23030_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD',20164,0,63),(2223,20155,'library_WAR_tiislibraryportlet',4,'23030_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD',20171,0,1),(2224,20155,'113',4,'23030_LAYOUT_113',20164,0,63),(2225,20155,'113',4,'23030_LAYOUT_113',20171,0,1),(2226,20155,'86',4,'23030_LAYOUT_86',20164,0,63),(2227,20155,'86',4,'23030_LAYOUT_86',20171,0,1),(2228,20155,'library_WAR_tiislibraryportlet',4,'20185_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD',20164,0,63),(2229,20155,'library_WAR_tiislibraryportlet',4,'20185_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD',20171,0,1),(2230,20155,'library_WAR_tiislibraryportlet',4,'20185_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_SwNhPcCyFOrD',20163,0,1),(2301,20155,'49',4,'20713_LAYOUT_49',20164,0,63),(2302,20155,'49',4,'20713_LAYOUT_49',20171,0,1),(2303,20155,'49',4,'20713_LAYOUT_49',20163,0,1),(2501,20155,'library_WAR_tiislibraryportlet',4,'22901_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_5WA2keNLjgqy',20164,0,31),(2502,20155,'library_WAR_tiislibraryportlet',4,'22901_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_5WA2keNLjgqy',20171,0,1),(2503,20155,'library_WAR_tiislibraryportlet',4,'22901_LAYOUT_library_WAR_tiislibraryportlet_INSTANCE_5WA2keNLjgqy',20163,0,1),(2801,20155,'com.liferay.portal.model.Layout',4,'24001',20164,20199,1023),(2802,20155,'com.liferay.portal.model.Layout',4,'24001',20171,0,19),(2803,20155,'com.liferay.portal.model.Layout',4,'24001',20163,0,1),(2804,20155,'145',4,'24001_LAYOUT_145',20164,0,63),(2805,20155,'145',4,'24001_LAYOUT_145',20171,0,1),(2806,20155,'145',4,'24001_LAYOUT_145',20163,0,1),(2807,20155,'2_WAR_notificationsportlet',4,'24001_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(2808,20155,'2_WAR_notificationsportlet',4,'24001_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(2809,20155,'2_WAR_notificationsportlet',4,'24001_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(2813,20155,'113',4,'24001_LAYOUT_113',20164,0,63),(2814,20155,'113',4,'24001_LAYOUT_113',20171,0,1),(2815,20155,'113',4,'24001_LAYOUT_113',20163,0,1),(2816,20155,'86',4,'24001_LAYOUT_86',20164,0,63),(2817,20155,'86',4,'24001_LAYOUT_86',20171,0,1),(2818,20155,'86',4,'24001_LAYOUT_86',20163,0,1),(2901,20155,'bookinfo_WAR_tiislibraryportlet',1,'20155',20162,0,2),(2902,20155,'bookinfo_WAR_tiislibraryportlet',1,'20155',20163,0,2),(2903,20155,'bookinfo_WAR_tiislibraryportlet',1,'20155',20165,0,2),(2904,20155,'bookinfo_WAR_tiislibraryportlet',1,'20155',20166,0,2),(3001,20155,'bookinfo_WAR_tiislibraryportlet',4,'24001_LAYOUT_bookinfo_WAR_tiislibraryportlet',20164,0,63),(3002,20155,'bookinfo_WAR_tiislibraryportlet',4,'24001_LAYOUT_bookinfo_WAR_tiislibraryportlet',20171,0,1),(3003,20155,'bookinfo_WAR_tiislibraryportlet',4,'24001_LAYOUT_bookinfo_WAR_tiislibraryportlet',20163,0,1),(3101,20155,'49',4,'24001_LAYOUT_49',20164,0,63),(3102,20155,'49',4,'24001_LAYOUT_49',20171,0,1),(3103,20155,'49',4,'24001_LAYOUT_49',20163,0,1),(3204,20155,'15',4,'22901_LAYOUT_15',20164,0,63),(3205,20155,'15',4,'22901_LAYOUT_15',20171,0,1),(3206,20155,'15',4,'22901_LAYOUT_15',20163,0,1),(3301,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'24501',20164,20159,15),(3305,20155,'com.liferay.portal.model.Layout',4,'24515',20164,20159,1023),(3306,20155,'com.liferay.portal.model.Layout',4,'24515',20171,0,19),(3307,20155,'com.liferay.portal.model.Layout',4,'24515',20163,0,1),(3401,20155,'librarymanagment_WAR_tiislibraryportlet',1,'20155',20162,0,2),(3402,20155,'librarymanagment_WAR_tiislibraryportlet',1,'20155',20163,0,2),(3403,20155,'librarymanagment_WAR_tiislibraryportlet',1,'20155',20165,0,2),(3404,20155,'librarymanagment_WAR_tiislibraryportlet',1,'20155',20166,0,2),(3501,20155,'49',4,'22901_LAYOUT_49',20164,0,63),(3502,20155,'49',4,'22901_LAYOUT_49',20171,0,1),(3503,20155,'49',4,'22901_LAYOUT_49',20163,0,1),(3601,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'24801',20164,20159,15),(3614,20155,'com.liferay.portal.model.Layout',4,'24845',20164,20159,1023),(3615,20155,'com.liferay.portal.model.Layout',4,'24845',20171,0,19),(3616,20155,'com.liferay.portal.model.Layout',4,'24845',20163,0,1),(3617,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'24854',20164,20159,15),(3621,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24866',20164,20159,255),(3622,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24866',20171,0,3),(3623,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24866',20163,0,3),(3624,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24875',20164,20159,255),(3625,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24875',20171,0,3),(3626,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24875',20163,0,3),(3627,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24883',20164,20159,255),(3628,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24883',20171,0,3),(3629,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24883',20163,0,3),(3630,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24891',20164,20159,255),(3631,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24891',20171,0,3),(3632,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24891',20163,0,3),(3633,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24899',20164,20159,255),(3634,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24899',20171,0,3),(3635,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24899',20163,0,3),(3636,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24908',20164,20159,255),(3637,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24908',20171,0,3),(3638,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24908',20163,0,3),(3639,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24916',20164,20159,255),(3640,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24916',20171,0,3),(3641,20155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'24916',20163,0,3),(3642,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24927',20164,20159,15),(3643,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24927',20171,0,1),(3644,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24927',20163,0,1),(3645,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24928',20164,20159,15),(3646,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24928',20171,0,1),(3647,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24928',20163,0,1),(3648,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24935',20164,20159,255),(3649,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24935',20171,0,3),(3650,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24935',20163,0,3),(3651,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24963',20164,20159,15),(3652,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24963',20171,0,1),(3653,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24963',20163,0,1),(3654,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24964',20164,20159,15),(3655,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24964',20171,0,1),(3656,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24964',20163,0,1),(3657,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24967',20164,20159,255),(3658,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24967',20171,0,3),(3659,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24967',20163,0,3),(3660,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24976',20164,20159,255),(3661,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24976',20171,0,3),(3662,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24976',20163,0,3),(3663,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24986',20164,20159,255),(3664,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24986',20171,0,3),(3665,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'24986',20163,0,3),(3666,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24996',20164,20159,15),(3667,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24996',20171,0,1),(3668,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'24996',20163,0,1),(3669,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24998',20164,20159,15),(3670,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24998',20171,0,1),(3671,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'24998',20163,0,1),(3672,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25001',20164,20159,255),(3673,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25001',20171,0,3),(3674,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25001',20163,0,3),(3675,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25008',20164,20159,15),(3676,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25008',20171,0,1),(3677,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25008',20163,0,1),(3678,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25009',20164,20159,15),(3679,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25009',20171,0,1),(3680,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25009',20163,0,1),(3681,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25012',20164,20159,255),(3682,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25012',20171,0,3),(3683,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25012',20163,0,3),(3684,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25019',20164,20159,15),(3685,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25019',20171,0,1),(3686,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25019',20163,0,1),(3687,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25020',20164,20159,15),(3688,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25020',20171,0,1),(3689,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25020',20163,0,1),(3690,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25023',20164,20159,255),(3691,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25023',20171,0,3),(3692,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25023',20163,0,3),(3693,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25030',20164,20159,15),(3694,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25030',20171,0,1),(3695,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25030',20163,0,1),(3696,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25031',20164,20159,15),(3697,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25031',20171,0,1),(3698,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25031',20163,0,1),(3699,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25034',20164,20159,255),(3700,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25034',20171,0,3),(3701,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25034',20163,0,3),(3702,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25041',20164,20159,15),(3703,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25041',20171,0,1),(3704,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25041',20163,0,1),(3705,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25042',20164,20159,15),(3706,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25042',20171,0,1),(3707,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25042',20163,0,1),(3708,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25045',20164,20159,255),(3709,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25045',20171,0,3),(3710,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25045',20163,0,3),(3711,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25052',20164,20159,15),(3712,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25052',20171,0,1),(3713,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'25052',20163,0,1),(3714,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25053',20164,20159,15),(3715,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25053',20171,0,1),(3716,20155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'25053',20163,0,1),(3717,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25056',20164,20159,255),(3718,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25056',20171,0,3),(3719,20155,'com.liferay.portlet.journal.model.JournalArticle',4,'25056',20163,0,3),(3720,20155,'com.liferay.portal.model.Layout',4,'25065',20164,20159,1023),(3721,20155,'com.liferay.portal.model.Layout',4,'25065',20171,0,19),(3722,20155,'com.liferay.portal.model.Layout',4,'25065',20163,0,1),(3723,20155,'com.liferay.portal.model.Layout',4,'25077',20164,20159,1023),(3724,20155,'com.liferay.portal.model.Layout',4,'25077',20171,0,19),(3725,20155,'com.liferay.portal.model.Layout',4,'25077',20163,0,1),(3726,20155,'com.liferay.portal.model.Layout',4,'25084',20164,20159,1023),(3727,20155,'com.liferay.portal.model.Layout',4,'25084',20171,0,19),(3728,20155,'com.liferay.portal.model.Layout',4,'25084',20163,0,1),(3729,20155,'com.liferay.portal.model.Layout',4,'25091',20164,20159,1023),(3730,20155,'com.liferay.portal.model.Layout',4,'25091',20171,0,19),(3731,20155,'com.liferay.portal.model.Layout',4,'25091',20163,0,1),(3732,20155,'com.liferay.portal.model.Layout',4,'25097',20164,20159,1023),(3733,20155,'com.liferay.portal.model.Layout',4,'25097',20171,0,19),(3734,20155,'com.liferay.portal.model.Layout',4,'25097',20163,0,1),(3735,20155,'com.liferay.portal.model.Layout',4,'25103',20164,20159,1023),(3736,20155,'com.liferay.portal.model.Layout',4,'25103',20171,0,19),(3737,20155,'com.liferay.portal.model.Layout',4,'25103',20163,0,1),(3738,20155,'com.liferay.portal.model.LayoutSetPrototype',4,'25110',20164,20159,15),(3742,20155,'com.liferay.portal.model.Layout',4,'25124',20164,20159,1023),(3743,20155,'com.liferay.portal.model.Layout',4,'25124',20171,0,19),(3744,20155,'com.liferay.portal.model.Layout',4,'25124',20163,0,1),(3745,20155,'56',4,'22901_LAYOUT_56_INSTANCE_HEADER',20164,0,63),(3746,20155,'56',4,'22901_LAYOUT_56_INSTANCE_HEADER',20171,0,1),(3747,20155,'56',4,'22901_LAYOUT_56_INSTANCE_HEADER',20163,0,1),(3748,20155,'56',4,'22901_LAYOUT_56_INSTANCE_FOOTER',20164,0,63),(3749,20155,'56',4,'22901_LAYOUT_56_INSTANCE_FOOTER',20171,0,1),(3750,20155,'56',4,'22901_LAYOUT_56_INSTANCE_FOOTER',20163,0,1),(4001,20155,'58',4,'24001_LAYOUT_58',20164,0,63),(4002,20155,'58',4,'24001_LAYOUT_58',20171,0,1),(4003,20155,'58',4,'24001_LAYOUT_58',20163,0,1),(4301,20155,'com.liferay.portal.model.Layout',4,'25805',20164,20199,1023),(4302,20155,'com.liferay.portal.model.Layout',4,'25805',20171,0,19),(4303,20155,'com.liferay.portal.model.Layout',4,'25805',20163,0,1),(4304,20155,'145',4,'25805_LAYOUT_145',20164,0,63),(4305,20155,'145',4,'25805_LAYOUT_145',20171,0,1),(4306,20155,'145',4,'25805_LAYOUT_145',20163,0,1),(4307,20155,'2_WAR_notificationsportlet',4,'25805_LAYOUT_2_WAR_notificationsportlet',20164,0,63),(4308,20155,'2_WAR_notificationsportlet',4,'25805_LAYOUT_2_WAR_notificationsportlet',20171,0,1),(4309,20155,'2_WAR_notificationsportlet',4,'25805_LAYOUT_2_WAR_notificationsportlet',20163,0,1),(4513,20155,'49',4,'21404_LAYOUT_49',20164,0,63),(4514,20155,'49',4,'21404_LAYOUT_49',20171,0,1),(4515,20155,'49',4,'21404_LAYOUT_49',20163,0,1),(4604,20155,'com.liferay.portlet.journal',4,'20195',20164,0,255),(4605,20155,'com.liferay.portlet.journal',4,'20195',20166,0,1),(4606,20155,'com.liferay.portlet.journal',4,'20195',20163,0,1),(4710,20155,'49',4,'23030_LAYOUT_49',20164,0,63),(4711,20155,'49',4,'23030_LAYOUT_49',20171,0,1),(4949,20155,'com.liferay.portal.model.Layout',4,'26669',20164,20159,1023),(4950,20155,'com.liferay.portal.model.Layout',4,'26669',20171,0,19),(4951,20155,'com.liferay.portal.model.Layout',4,'26669',20163,0,1);
/*!40000 ALTER TABLE `resourcepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcetypepermission`
--

DROP TABLE IF EXISTS `resourcetypepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcetypepermission` (
  `resourceTypePermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceTypePermissionId`),
  UNIQUE KEY `IX_BA497163` (`companyId`,`groupId`,`name`,`roleId`),
  KEY `IX_7D81F66F` (`companyId`,`name`,`roleId`),
  KEY `IX_A82690E2` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcetypepermission`
--

LOCK TABLES `resourcetypepermission` WRITE;
/*!40000 ALTER TABLE `resourcetypepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `resourcetypepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_`
--

DROP TABLE IF EXISTS `role_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `roleId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `subtype` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `IX_A88E424E` (`companyId`,`classNameId`,`classPK`),
  UNIQUE KEY `IX_EBC931B8` (`companyId`,`name`),
  KEY `IX_449A10B9` (`companyId`),
  KEY `IX_F3E1C6FC` (`companyId`,`type_`),
  KEY `IX_F436EC8E` (`name`),
  KEY `IX_5EB4E2FB` (`subtype`),
  KEY `IX_F92B66E6` (`type_`),
  KEY `IX_CBE204` (`type_`,`subtype`),
  KEY `IX_26DB26C5` (`uuid_`),
  KEY `IX_B9FF6043` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_`
--

LOCK TABLES `role_` WRITE;
/*!40000 ALTER TABLE `role_` DISABLE KEYS */;
INSERT INTO `role_` VALUES ('35753f7e-b83c-48d6-be47-1d78ef9d8be0',20162,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20162,'Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Administrators are super users who can do anything.</Description></root>',1,''),('2d47d27e-278c-440a-a43f-2068ba3f6b68',20163,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20163,'Guest','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Unauthenticated users always have this role.</Description></root>',1,''),('f77b9ad7-c829-4413-93f6-728643a84f12',20164,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20164,'Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an implied role with respect to the objects users create.</Description></root>',1,''),('62fd5770-1082-4b27-a4b0-26b4e1a0ae88',20165,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20165,'Power User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Power Users have their own personal site.</Description></root>',1,''),('dcc41330-6185-4b6e-87aa-7057fb54246a',20166,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20166,'User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Authenticated users should be assigned this role.</Description></root>',1,''),('0a89ff8d-62f2-4d22-81c7-5bbd5c3f3ab2',20167,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20167,'Organization Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Administrators are super users of their organization but cannot make other users into Organization Administrators.</Description></root>',3,''),('486090ab-37eb-46fb-a95c-b56e6a3537d8',20168,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20168,'Organization Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Owners are super users of their organization and can assign organization roles to users.</Description></root>',3,''),('c3ace3b7-41f7-4e7e-950b-b2944ca2bd00',20169,20155,20159,'','2016-10-02 17:23:03','2016-10-02 17:23:03',20004,20169,'Organization User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to an organization have this role within that organization.</Description></root>',3,''),('f8e05b09-3b45-4d5c-a597-bc8a77759335',20170,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20170,'Site Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Administrators are super users of their site but cannot make other users into Site Administrators.</Description></root>',2,''),('77a6a71b-6367-41cb-ba04-7f394a9a1587',20171,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20171,'Site Member','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to a site have this role within that site.</Description></root>',2,''),('61875146-da42-40c0-b665-651e14cae028',20172,20155,20159,'','2016-10-02 17:09:31','2016-10-02 17:09:31',20004,20172,'Site Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Owners are super users of their site and can assign site roles to users.</Description></root>',2,''),('821a94e3-3c4b-4346-8d85-590893537bbb',20482,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20004,20482,'Organization Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',3,''),('27f70b5c-7fce-465d-b08d-c370e0932e83',20484,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20004,20484,'Site Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',2,''),('70ff366d-5b05-4077-9086-f3645fc000fb',20486,20155,20159,'','2016-10-02 17:10:05','2016-10-02 17:10:05',20004,20486,'Portal Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',1,'');
/*!40000 ALTER TABLE `role_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scframeworkversi_scproductvers`
--

DROP TABLE IF EXISTS `scframeworkversi_scproductvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scframeworkversi_scproductvers` (
  `frameworkVersionId` bigint(20) NOT NULL,
  `productVersionId` bigint(20) NOT NULL,
  PRIMARY KEY (`frameworkVersionId`,`productVersionId`),
  KEY `IX_3BB93ECA` (`frameworkVersionId`),
  KEY `IX_E8D33FF9` (`productVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scframeworkversi_scproductvers`
--

LOCK TABLES `scframeworkversi_scproductvers` WRITE;
/*!40000 ALTER TABLE `scframeworkversi_scproductvers` DISABLE KEYS */;
/*!40000 ALTER TABLE `scframeworkversi_scproductvers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scframeworkversion`
--

DROP TABLE IF EXISTS `scframeworkversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scframeworkversion` (
  `frameworkVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `url` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`frameworkVersionId`),
  KEY `IX_C98C0D78` (`companyId`),
  KEY `IX_272991FA` (`groupId`),
  KEY `IX_6E1764F` (`groupId`,`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scframeworkversion`
--

LOCK TABLES `scframeworkversion` WRITE;
/*!40000 ALTER TABLE `scframeworkversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `scframeworkversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sclicense`
--

DROP TABLE IF EXISTS `sclicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sclicense` (
  `licenseId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `url` longtext,
  `openSource` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `recommended` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`licenseId`),
  KEY `IX_1C841592` (`active_`),
  KEY `IX_5327BB79` (`active_`,`recommended`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sclicense`
--

LOCK TABLES `sclicense` WRITE;
/*!40000 ALTER TABLE `sclicense` DISABLE KEYS */;
/*!40000 ALTER TABLE `sclicense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sclicenses_scproductentries`
--

DROP TABLE IF EXISTS `sclicenses_scproductentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sclicenses_scproductentries` (
  `licenseId` bigint(20) NOT NULL,
  `productEntryId` bigint(20) NOT NULL,
  PRIMARY KEY (`licenseId`,`productEntryId`),
  KEY `IX_27006638` (`licenseId`),
  KEY `IX_D7710A66` (`productEntryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sclicenses_scproductentries`
--

LOCK TABLES `sclicenses_scproductentries` WRITE;
/*!40000 ALTER TABLE `sclicenses_scproductentries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sclicenses_scproductentries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scproductentry`
--

DROP TABLE IF EXISTS `scproductentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scproductentry` (
  `productEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `shortDescription` longtext,
  `longDescription` longtext,
  `pageURL` longtext,
  `author` varchar(75) DEFAULT NULL,
  `repoGroupId` varchar(75) DEFAULT NULL,
  `repoArtifactId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`productEntryId`),
  KEY `IX_5D25244F` (`companyId`),
  KEY `IX_72F87291` (`groupId`),
  KEY `IX_98E6A9CB` (`groupId`,`userId`),
  KEY `IX_7311E812` (`repoGroupId`,`repoArtifactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scproductentry`
--

LOCK TABLES `scproductentry` WRITE;
/*!40000 ALTER TABLE `scproductentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `scproductentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scproductscreenshot`
--

DROP TABLE IF EXISTS `scproductscreenshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scproductscreenshot` (
  `productScreenshotId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `productEntryId` bigint(20) DEFAULT NULL,
  `thumbnailId` bigint(20) DEFAULT NULL,
  `fullImageId` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`productScreenshotId`),
  KEY `IX_AE8224CC` (`fullImageId`),
  KEY `IX_467956FD` (`productEntryId`),
  KEY `IX_DA913A55` (`productEntryId`,`priority`),
  KEY `IX_6C572DAC` (`thumbnailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scproductscreenshot`
--

LOCK TABLES `scproductscreenshot` WRITE;
/*!40000 ALTER TABLE `scproductscreenshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `scproductscreenshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scproductversion`
--

DROP TABLE IF EXISTS `scproductversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scproductversion` (
  `productVersionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `productEntryId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `changeLog` longtext,
  `downloadPageURL` longtext,
  `directDownloadURL` varchar(2000) DEFAULT NULL,
  `repoStoreArtifact` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`productVersionId`),
  KEY `IX_8377A211` (`productEntryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scproductversion`
--

LOCK TABLES `scproductversion` WRITE;
/*!40000 ALTER TABLE `scproductversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `scproductversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicecomponent`
--

DROP TABLE IF EXISTS `servicecomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicecomponent` (
  `serviceComponentId` bigint(20) NOT NULL,
  `buildNamespace` varchar(75) DEFAULT NULL,
  `buildNumber` bigint(20) DEFAULT NULL,
  `buildDate` bigint(20) DEFAULT NULL,
  `data_` longtext,
  PRIMARY KEY (`serviceComponentId`),
  UNIQUE KEY `IX_4F0315B8` (`buildNamespace`,`buildNumber`),
  KEY `IX_7338606F` (`buildNamespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicecomponent`
--

LOCK TABLES `servicecomponent` WRITE;
/*!40000 ALTER TABLE `servicecomponent` DISABLE KEYS */;
INSERT INTO `servicecomponent` VALUES (20435,'Marketplace',4,1410828214125,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Marketplace_App (\n	uuid_ VARCHAR(75) null,\n	appId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	remoteAppId LONG,\n	title VARCHAR(75) null,\n	description STRING null,\n	category VARCHAR(75) null,\n	iconURL STRING null,\n	version VARCHAR(75) null\n);\n\ncreate table Marketplace_Module (\n	uuid_ VARCHAR(75) null,\n	moduleId LONG not null primary key,\n	appId LONG,\n	bundleSymbolicName VARCHAR(500) null,\n	bundleVersion VARCHAR(75) null,\n	contextName VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_94A7EF25 on Marketplace_App (category);\ncreate index IX_865B7BD5 on Marketplace_App (companyId);\ncreate index IX_20F14D93 on Marketplace_App (remoteAppId);\ncreate index IX_3E667FE1 on Marketplace_App (uuid_);\ncreate index IX_A7807DA7 on Marketplace_App (uuid_, companyId);\n\ncreate index IX_7DC16D26 on Marketplace_Module (appId);\ncreate index IX_5848F52D on Marketplace_Module (appId, bundleSymbolicName, bundleVersion);\ncreate index IX_C6938724 on Marketplace_Module (appId, contextName);\ncreate index IX_DD03D499 on Marketplace_Module (bundleSymbolicName);\ncreate index IX_F2F1E964 on Marketplace_Module (contextName);\ncreate index IX_A7EFD80E on Marketplace_Module (uuid_);]]></indexes-sql>\n</data>'),(20445,'Calendar',4,1424703239325,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Calendar (\n	uuid_ VARCHAR(75) null,\n	calendarId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	calendarResourceId LONG,\n	name STRING null,\n	description STRING null,\n	timeZoneId VARCHAR(75) null,\n	color INTEGER,\n	defaultCalendar BOOLEAN,\n	enableComments BOOLEAN,\n	enableRatings BOOLEAN\n);\n\ncreate table CalendarBooking (\n	uuid_ VARCHAR(75) null,\n	calendarBookingId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	calendarId LONG,\n	calendarResourceId LONG,\n	parentCalendarBookingId LONG,\n	vEventUid VARCHAR(255) null,\n	title STRING null,\n	description TEXT null,\n	location STRING null,\n	startTime LONG,\n	endTime LONG,\n	allDay BOOLEAN,\n	recurrence STRING null,\n	firstReminder LONG,\n	firstReminderType VARCHAR(75) null,\n	secondReminder LONG,\n	secondReminderType VARCHAR(75) null,\n	status INTEGER,\n	statusByUserId LONG,\n	statusByUserName VARCHAR(75) null,\n	statusDate DATE null\n);\n\ncreate table CalendarNotificationTemplate (\n	uuid_ VARCHAR(75) null,\n	calendarNotificationTemplateId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	calendarId LONG,\n	notificationType VARCHAR(75) null,\n	notificationTypeSettings VARCHAR(75) null,\n	notificationTemplateType VARCHAR(75) null,\n	subject VARCHAR(75) null,\n	body TEXT null\n);\n\ncreate table CalendarResource (\n	uuid_ VARCHAR(75) null,\n	calendarResourceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	classNameId LONG,\n	classPK LONG,\n	classUuid VARCHAR(75) null,\n	code_ VARCHAR(75) null,\n	name STRING null,\n	description STRING null,\n	active_ BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_B53EB0E1 on Calendar (groupId, calendarResourceId);\ncreate index IX_97FC174E on Calendar (groupId, calendarResourceId, defaultCalendar);\ncreate index IX_F0FAF226 on Calendar (resourceBlockId);\ncreate index IX_96C8590 on Calendar (uuid_);\ncreate index IX_97656498 on Calendar (uuid_, companyId);\ncreate unique index IX_3AE311A on Calendar (uuid_, groupId);\n\ncreate index IX_D300DFCE on CalendarBooking (calendarId);\ncreate unique index IX_113A264E on CalendarBooking (calendarId, parentCalendarBookingId);\ncreate index IX_470170B4 on CalendarBooking (calendarId, status);\ncreate unique index IX_8B23DA0E on CalendarBooking (calendarId, vEventUid);\ncreate index IX_B198FFC on CalendarBooking (calendarResourceId);\ncreate index IX_57EBF55B on CalendarBooking (parentCalendarBookingId);\ncreate index IX_F7B8A941 on CalendarBooking (parentCalendarBookingId, status);\ncreate index IX_22DFDB49 on CalendarBooking (resourceBlockId);\ncreate index IX_F6E8EE73 on CalendarBooking (uuid_);\ncreate index IX_A21D9FD5 on CalendarBooking (uuid_, companyId);\ncreate unique index IX_F4C61797 on CalendarBooking (uuid_, groupId);\n\ncreate index IX_A412E5B6 on CalendarNotificationTemplate (calendarId);\ncreate index IX_7727A482 on CalendarNotificationTemplate (calendarId, notificationType, notificationTemplateType);\ncreate index IX_A2D4D78B on CalendarNotificationTemplate (uuid_);\ncreate index IX_4D7D97BD on CalendarNotificationTemplate (uuid_, companyId);\ncreate unique index IX_4012E97F on CalendarNotificationTemplate (uuid_, groupId);\n\ncreate index IX_76DDD0F7 on CalendarResource (active_);\ncreate unique index IX_16A12327 on CalendarResource (classNameId, classPK);\ncreate index IX_4470A59D on CalendarResource (companyId, code_, active_);\ncreate index IX_1243D698 on CalendarResource (groupId);\ncreate index IX_40678371 on CalendarResource (groupId, active_);\ncreate index IX_55C2F8AA on CalendarResource (groupId, code_);\ncreate index IX_8BCB4D38 on CalendarResource (resourceBlockId);\ncreate index IX_150E2F22 on CalendarResource (uuid_);\ncreate index IX_56A06BC6 on CalendarResource (uuid_, companyId);\ncreate unique index IX_4ABD2BC8 on CalendarResource (uuid_, groupId);]]></indexes-sql>\n</data>'),(20464,'Kaleo',8,1425595080483,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table KaleoAction (\n	kaleoActionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	name VARCHAR(200) null,\n	description STRING null,\n	executionType VARCHAR(20) null,\n	script TEXT null,\n	scriptLanguage VARCHAR(75) null,\n	scriptRequiredContexts STRING null,\n	priority INTEGER\n);\n\ncreate table KaleoCondition (\n	kaleoConditionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	script TEXT null,\n	scriptLanguage VARCHAR(75) null,\n	scriptRequiredContexts STRING null\n);\n\ncreate table KaleoDefinition (\n	kaleoDefinitionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(200) null,\n	title STRING null,\n	description STRING null,\n	content TEXT null,\n	version INTEGER,\n	active_ BOOLEAN,\n	startKaleoNodeId LONG\n);\n\ncreate table KaleoInstance (\n	kaleoInstanceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoDefinitionName VARCHAR(200) null,\n	kaleoDefinitionVersion INTEGER,\n	rootKaleoInstanceTokenId LONG,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoInstanceToken (\n	kaleoInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	parentKaleoInstanceTokenId LONG,\n	currentKaleoNodeId LONG,\n	currentKaleoNodeName VARCHAR(200) null,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null\n);\n\ncreate table KaleoLog (\n	kaleoLogId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	terminalKaleoNode BOOLEAN,\n	kaleoActionId LONG,\n	kaleoActionName VARCHAR(200) null,\n	kaleoActionDescription STRING null,\n	previousKaleoNodeId LONG,\n	previousKaleoNodeName VARCHAR(200) null,\n	previousAssigneeClassName VARCHAR(200) null,\n	previousAssigneeClassPK LONG,\n	currentAssigneeClassName VARCHAR(200) null,\n	currentAssigneeClassPK LONG,\n	type_ VARCHAR(50) null,\n	comment_ TEXT null,\n	startDate DATE null,\n	endDate DATE null,\n	duration LONG,\n	workflowContext TEXT null\n);\n\ncreate table KaleoNode (\n	kaleoNodeId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	name VARCHAR(200) null,\n	metadata STRING null,\n	description STRING null,\n	type_ VARCHAR(20) null,\n	initial_ BOOLEAN,\n	terminal BOOLEAN\n);\n\ncreate table KaleoNotification (\n	kaleoNotificationId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	name VARCHAR(200) null,\n	description STRING null,\n	executionType VARCHAR(20) null,\n	template TEXT null,\n	templateLanguage VARCHAR(75) null,\n	notificationTypes VARCHAR(25) null\n);\n\ncreate table KaleoNotificationRecipient (\n	kaleoNotificationRecipientId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNotificationId LONG,\n	recipientClassName VARCHAR(200) null,\n	recipientClassPK LONG,\n	recipientRoleType INTEGER,\n	address VARCHAR(255) null\n);\n\ncreate table KaleoTask (\n	kaleoTaskId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	name VARCHAR(200) null,\n	description STRING null\n);\n\ncreate table KaleoTaskAssignment (\n	kaleoTaskAssignmentId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	assigneeClassName VARCHAR(200) null,\n	assigneeClassPK LONG,\n	assigneeActionId VARCHAR(75) null,\n	assigneeScript TEXT null,\n	assigneeScriptLanguage VARCHAR(75) null,\n	assigneeScriptRequiredContexts STRING null\n);\n\ncreate table KaleoTaskAssignmentInstance (\n	kaleoTaskAssignmentInstanceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoTaskId LONG,\n	kaleoTaskName VARCHAR(200) null,\n	assigneeClassName VARCHAR(200) null,\n	assigneeClassPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null\n);\n\ncreate table KaleoTaskInstanceToken (\n	kaleoTaskInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskId LONG,\n	kaleoTaskName VARCHAR(200) null,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completionUserId LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	dueDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoTimer (\n	kaleoTimerId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	name VARCHAR(75) null,\n	blocking BOOLEAN,\n	description STRING null,\n	duration DOUBLE,\n	scale VARCHAR(75) null,\n	recurrenceDuration DOUBLE,\n	recurrenceScale VARCHAR(75) null\n);\n\ncreate table KaleoTimerInstanceToken (\n	kaleoTimerInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoTimerId LONG,\n	kaleoTimerName VARCHAR(200) null,\n	blocking BOOLEAN,\n	completionUserId LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoTransition (\n	kaleoTransitionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	name VARCHAR(200) null,\n	description STRING null,\n	sourceKaleoNodeId LONG,\n	sourceKaleoNodeName VARCHAR(200) null,\n	targetKaleoNodeId LONG,\n	targetKaleoNodeName VARCHAR(200) null,\n	defaultTransition BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_50E9112C on KaleoAction (companyId);\ncreate index IX_170EFD7A on KaleoAction (kaleoClassName, kaleoClassPK);\ncreate index IX_4B2545E8 on KaleoAction (kaleoClassName, kaleoClassPK, executionType);\ncreate index IX_F95A622 on KaleoAction (kaleoDefinitionId);\n\ncreate index IX_FEE46067 on KaleoCondition (companyId);\ncreate index IX_DC978A5D on KaleoCondition (kaleoDefinitionId);\ncreate index IX_86CBD4C on KaleoCondition (kaleoNodeId);\n\ncreate index IX_40B9112F on KaleoDefinition (companyId);\ncreate index IX_408542BA on KaleoDefinition (companyId, active_);\ncreate index IX_76C781AE on KaleoDefinition (companyId, name);\ncreate index IX_4C23F11B on KaleoDefinition (companyId, name, active_);\ncreate index IX_EC14F81A on KaleoDefinition (companyId, name, version);\n\ncreate index IX_58D85ECB on KaleoInstance (className, classPK);\ncreate index IX_5F2FCD2D on KaleoInstance (companyId);\ncreate index IX_BF5839F8 on KaleoInstance (companyId, kaleoDefinitionName, kaleoDefinitionVersion, completionDate);\ncreate index IX_C6D7A867 on KaleoInstance (companyId, userId);\ncreate index IX_4DA4D123 on KaleoInstance (kaleoDefinitionId);\ncreate index IX_ACF16238 on KaleoInstance (kaleoDefinitionId, completed);\n\ncreate index IX_153721BE on KaleoInstanceToken (companyId);\ncreate index IX_4A86923B on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId);\ncreate index IX_360D34D9 on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId, completionDate);\ncreate index IX_7BDB04B4 on KaleoInstanceToken (kaleoDefinitionId);\ncreate index IX_F42AAFF6 on KaleoInstanceToken (kaleoInstanceId);\n\ncreate index IX_73B5F4DE on KaleoLog (companyId);\ncreate index IX_E66A153A on KaleoLog (kaleoClassName, kaleoClassPK, kaleoInstanceTokenId, type_);\ncreate index IX_6C64B7D4 on KaleoLog (kaleoDefinitionId);\ncreate index IX_5BC6AB16 on KaleoLog (kaleoInstanceId);\ncreate index IX_470B9FF8 on KaleoLog (kaleoInstanceTokenId, type_);\ncreate index IX_B0CDCA38 on KaleoLog (kaleoTaskInstanceTokenId);\n\ncreate index IX_C4E9ACE0 on KaleoNode (companyId);\ncreate index IX_F28C443E on KaleoNode (companyId, kaleoDefinitionId);\ncreate index IX_32E94DD6 on KaleoNode (kaleoDefinitionId);\n\ncreate index IX_38829497 on KaleoNotification (companyId);\ncreate index IX_902D342F on KaleoNotification (kaleoClassName, kaleoClassPK);\ncreate index IX_F3362E93 on KaleoNotification (kaleoClassName, kaleoClassPK, executionType);\ncreate index IX_4B968E8D on KaleoNotification (kaleoDefinitionId);\n\ncreate index IX_2C8C4AF4 on KaleoNotificationRecipient (companyId);\ncreate index IX_AA6697EA on KaleoNotificationRecipient (kaleoDefinitionId);\ncreate index IX_7F4FED02 on KaleoNotificationRecipient (kaleoNotificationId);\n\ncreate index IX_E1F8B23D on KaleoTask (companyId);\ncreate index IX_3FFA633 on KaleoTask (kaleoDefinitionId);\ncreate index IX_77B3F1A2 on KaleoTask (kaleoNodeId);\n\ncreate index IX_611732B0 on KaleoTaskAssignment (companyId);\ncreate index IX_D835C576 on KaleoTaskAssignment (kaleoClassName, kaleoClassPK);\ncreate index IX_1087068E on KaleoTaskAssignment (kaleoClassName, kaleoClassPK, assigneeClassName);\ncreate index IX_575C03A6 on KaleoTaskAssignment (kaleoDefinitionId);\n\ncreate index IX_945F4EB7 on KaleoTaskAssignmentInstance (assigneeClassName);\ncreate index IX_3BD436FD on KaleoTaskAssignmentInstance (assigneeClassName, assigneeClassPK);\ncreate index IX_6E3CDA1B on KaleoTaskAssignmentInstance (companyId);\ncreate index IX_38A47B17 on KaleoTaskAssignmentInstance (groupId, assigneeClassPK);\ncreate index IX_C851011 on KaleoTaskAssignmentInstance (kaleoDefinitionId);\ncreate index IX_67A9EE93 on KaleoTaskAssignmentInstance (kaleoInstanceId);\ncreate index IX_D4C2235B on KaleoTaskAssignmentInstance (kaleoTaskInstanceTokenId);\n\ncreate index IX_A3271995 on KaleoTaskInstanceToken (className, classPK);\ncreate index IX_997FE723 on KaleoTaskInstanceToken (companyId);\ncreate index IX_608E9519 on KaleoTaskInstanceToken (kaleoDefinitionId);\ncreate index IX_2CE1159B on KaleoTaskInstanceToken (kaleoInstanceId);\ncreate index IX_B857A115 on KaleoTaskInstanceToken (kaleoInstanceId, kaleoTaskId);\n\ncreate index IX_4DE6A889 on KaleoTimer (kaleoClassName, kaleoClassPK);\ncreate index IX_1A479F32 on KaleoTimer (kaleoClassName, kaleoClassPK, blocking);\n\ncreate index IX_DB96C55B on KaleoTimerInstanceToken (kaleoInstanceId);\ncreate index IX_DB279423 on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed);\ncreate index IX_9932524C on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed, blocking);\ncreate index IX_13A5BA2C on KaleoTimerInstanceToken (kaleoInstanceTokenId, kaleoTimerId);\n\ncreate index IX_41D6C6D on KaleoTransition (companyId);\ncreate index IX_479F3063 on KaleoTransition (kaleoDefinitionId);\ncreate index IX_A392DFD2 on KaleoTransition (kaleoNodeId);\ncreate index IX_A38E2194 on KaleoTransition (kaleoNodeId, defaultTransition);\ncreate index IX_85268A11 on KaleoTransition (kaleoNodeId, name);]]></indexes-sql>\n</data>'),(20496,'Notification',1,1409250476826,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Notifications_UserNotificationEvent (\n	notificationEventId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userNotificationEventId LONG,\n	timestamp LONG,\n	delivered BOOLEAN,\n	actionRequired BOOLEAN,\n	archived BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_93C52776 on Notifications_UserNotificationEvent (userId, actionRequired);\ncreate index IX_36E5AE4C on Notifications_UserNotificationEvent (userId, actionRequired, archived);\ncreate index IX_73C065F0 on Notifications_UserNotificationEvent (userId, delivered, actionRequired);\ncreate unique index IX_DC9FCEDC on Notifications_UserNotificationEvent (userNotificationEventId);]]></indexes-sql>\n</data>'),(20502,'OpenSocial',4,1343264401607,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table OpenSocial_Gadget (\n	uuid_ VARCHAR(75) null,\n	gadgetId LONG not null primary key,\n	companyId LONG,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(75) null,\n	url STRING null,\n	portletCategoryNames STRING null\n);\n\ncreate table OpenSocial_OAuthConsumer (\n	oAuthConsumerId LONG not null primary key,\n	companyId LONG,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gadgetKey VARCHAR(75) null,\n	serviceName VARCHAR(75) null,\n	consumerKey VARCHAR(75) null,\n	consumerSecret TEXT null,\n	keyType VARCHAR(75) null\n);\n\ncreate table OpenSocial_OAuthToken (\n	oAuthTokenId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gadgetKey VARCHAR(75) null,\n	serviceName VARCHAR(75) null,\n	moduleId LONG,\n	accessToken VARCHAR(75) null,\n	tokenName VARCHAR(75) null,\n	tokenSecret VARCHAR(75) null,\n	sessionHandle VARCHAR(75) null,\n	expiration LONG\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_729869EE on OpenSocial_Gadget (companyId);\ncreate unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);\ncreate index IX_E1F8627A on OpenSocial_Gadget (uuid_);\ncreate index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);\n\ncreate index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);\ncreate index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);\n\ncreate index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);\ncreate index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);]]></indexes-sql>\n</data>'),(20511,'Sync',6,1445034861916,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table SyncDLFileVersionDiff (\n	syncDLFileVersionDiffId LONG not null primary key,\n	fileEntryId LONG,\n	sourceFileVersionId LONG,\n	targetFileVersionId LONG,\n	dataFileEntryId LONG,\n	size_ LONG,\n	expirationDate DATE null\n);\n\ncreate table SyncDLObject (\n	syncDLObjectId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createTime LONG,\n	modifiedTime LONG,\n	repositoryId LONG,\n	parentFolderId LONG,\n	treePath STRING null,\n	name VARCHAR(255) null,\n	extension VARCHAR(75) null,\n	mimeType VARCHAR(75) null,\n	description STRING null,\n	changeLog VARCHAR(75) null,\n	extraSettings TEXT null,\n	version VARCHAR(75) null,\n	versionId LONG,\n	size_ LONG,\n	checksum VARCHAR(75) null,\n	event VARCHAR(75) null,\n	lastPermissionChangeDate DATE null,\n	lockExpirationDate DATE null,\n	lockUserId LONG,\n	lockUserName VARCHAR(75) null,\n	type_ VARCHAR(75) null,\n	typePK LONG,\n	typeUuid VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_A9B43C55 on SyncDLFileVersionDiff (expirationDate);\ncreate index IX_F832A75D on SyncDLFileVersionDiff (fileEntryId);\ncreate unique index IX_AC4C7667 on SyncDLFileVersionDiff (fileEntryId, sourceFileVersionId, targetFileVersionId);\n\ncreate index IX_980323CB on SyncDLObject (modifiedTime, repositoryId);\ncreate index IX_8D4FDC9F on SyncDLObject (modifiedTime, repositoryId, event);\ncreate index IX_A3ACE372 on SyncDLObject (modifiedTime, repositoryId, parentFolderId);\ncreate index IX_F174AD48 on SyncDLObject (repositoryId, parentFolderId);\ncreate index IX_3BE7BB8D on SyncDLObject (repositoryId, parentFolderId, type_);\ncreate index IX_57F62914 on SyncDLObject (repositoryId, type_);\ncreate unique index IX_E3F57BD6 on SyncDLObject (type_, typePK);\ncreate index IX_28CD54BB on SyncDLObject (type_, version);\ncreate index IX_1CCA3B5 on SyncDLObject (version, type_);]]></indexes-sql>\n</data>'),(22401,'TIIS',10,1477508933642,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(22601,'TIIS',11,1477511163518,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(22701,'TIIS',12,1477512876523,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(22801,'TIIS',13,1477513119895,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(23301,'TIIS',14,1477678414943,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(23601,'TIIS',15,1477942948386,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(23701,'TIIS',16,1477946905144,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(23801,'TIIS',17,1477957070698,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(24201,'TIIS',18,1478193561093,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>'),(24701,'TIIS',19,1479747793388,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table TIISBook (\n	bookId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gDriveId VARCHAR(75) null,\n	title VARCHAR(75) null,\n	description VARCHAR(750) null,\n	googleDriveLink VARCHAR(750) null,\n	bookLogo BLOB\n);\n\ncreate table TIISTest (\n	testId LONG not null primary key,\n	createDate DATE null,\n	modifiedDate DATE null,\n	isBookTest BOOLEAN,\n	bookId LONG,\n	content VARCHAR(950) null\n);\n\ncreate table TIISTestAttempt (\n	testId LONG not null primary key,\n	userId LONG,\n	startTime DATE null,\n	finishTime DATE null,\n	result DOUBLE\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[]]></indexes-sql>\n</data>');
/*!40000 ALTER TABLE `servicecomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shard`
--

DROP TABLE IF EXISTS `shard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shard` (
  `shardId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`shardId`),
  KEY `IX_DA5F4359` (`classNameId`,`classPK`),
  KEY `IX_941BA8C3` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shard`
--

LOCK TABLES `shard` WRITE;
/*!40000 ALTER TABLE `shard` DISABLE KEYS */;
INSERT INTO `shard` VALUES (20156,20025,20155,'default');
/*!40000 ALTER TABLE `shard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `cartId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `itemIds` longtext,
  `couponCodes` varchar(75) DEFAULT NULL,
  `altShipping` int(11) DEFAULT NULL,
  `insure` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  UNIQUE KEY `IX_FC46FE16` (`groupId`,`userId`),
  KEY `IX_C28B41DC` (`groupId`),
  KEY `IX_54101CC8` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcategory`
--

DROP TABLE IF EXISTS `shoppingcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcategory` (
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`categoryId`),
  KEY `IX_5F615D3E` (`groupId`),
  KEY `IX_6A84467D` (`groupId`,`name`),
  KEY `IX_1E6464F5` (`groupId`,`parentCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcategory`
--

LOCK TABLES `shoppingcategory` WRITE;
/*!40000 ALTER TABLE `shoppingcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcoupon`
--

DROP TABLE IF EXISTS `shoppingcoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcoupon` (
  `couponId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `code_` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `limitCategories` longtext,
  `limitSkus` longtext,
  `minOrder` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discountType` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`couponId`),
  UNIQUE KEY `IX_DC60CFAE` (`code_`),
  KEY `IX_3251AF16` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcoupon`
--

LOCK TABLES `shoppingcoupon` WRITE;
/*!40000 ALTER TABLE `shoppingcoupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingitem`
--

DROP TABLE IF EXISTS `shoppingitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingitem` (
  `itemId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `sku` varchar(75) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `properties` longtext,
  `fields_` tinyint(4) DEFAULT NULL,
  `fieldsQuantities` longtext,
  `minQuantity` int(11) DEFAULT NULL,
  `maxQuantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `taxable` tinyint(4) DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `useShippingFormula` tinyint(4) DEFAULT NULL,
  `requiresShipping` tinyint(4) DEFAULT NULL,
  `stockQuantity` int(11) DEFAULT NULL,
  `featured_` tinyint(4) DEFAULT NULL,
  `sale_` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `mediumImage` tinyint(4) DEFAULT NULL,
  `mediumImageId` bigint(20) DEFAULT NULL,
  `mediumImageURL` longtext,
  `largeImage` tinyint(4) DEFAULT NULL,
  `largeImageId` bigint(20) DEFAULT NULL,
  `largeImageURL` longtext,
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `IX_1C717CA6` (`companyId`,`sku`),
  KEY `IX_FEFE7D76` (`groupId`,`categoryId`),
  KEY `IX_903DC750` (`largeImageId`),
  KEY `IX_D217AB30` (`mediumImageId`),
  KEY `IX_FF203304` (`smallImageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingitem`
--

LOCK TABLES `shoppingitem` WRITE;
/*!40000 ALTER TABLE `shoppingitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingitemfield`
--

DROP TABLE IF EXISTS `shoppingitemfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingitemfield` (
  `itemFieldId` bigint(20) NOT NULL,
  `itemId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `values_` longtext,
  `description` longtext,
  PRIMARY KEY (`itemFieldId`),
  KEY `IX_6D5F9B87` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingitemfield`
--

LOCK TABLES `shoppingitemfield` WRITE;
/*!40000 ALTER TABLE `shoppingitemfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingitemfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingitemprice`
--

DROP TABLE IF EXISTS `shoppingitemprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingitemprice` (
  `itemPriceId` bigint(20) NOT NULL,
  `itemId` bigint(20) DEFAULT NULL,
  `minQuantity` int(11) DEFAULT NULL,
  `maxQuantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `taxable` tinyint(4) DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `useShippingFormula` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemPriceId`),
  KEY `IX_EA6FD516` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingitemprice`
--

LOCK TABLES `shoppingitemprice` WRITE;
/*!40000 ALTER TABLE `shoppingitemprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingitemprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingorder`
--

DROP TABLE IF EXISTS `shoppingorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingorder` (
  `orderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `altShipping` varchar(75) DEFAULT NULL,
  `requiresShipping` tinyint(4) DEFAULT NULL,
  `insure` tinyint(4) DEFAULT NULL,
  `insurance` double DEFAULT NULL,
  `couponCodes` varchar(75) DEFAULT NULL,
  `couponDiscount` double DEFAULT NULL,
  `billingFirstName` varchar(75) DEFAULT NULL,
  `billingLastName` varchar(75) DEFAULT NULL,
  `billingEmailAddress` varchar(75) DEFAULT NULL,
  `billingCompany` varchar(75) DEFAULT NULL,
  `billingStreet` varchar(75) DEFAULT NULL,
  `billingCity` varchar(75) DEFAULT NULL,
  `billingState` varchar(75) DEFAULT NULL,
  `billingZip` varchar(75) DEFAULT NULL,
  `billingCountry` varchar(75) DEFAULT NULL,
  `billingPhone` varchar(75) DEFAULT NULL,
  `shipToBilling` tinyint(4) DEFAULT NULL,
  `shippingFirstName` varchar(75) DEFAULT NULL,
  `shippingLastName` varchar(75) DEFAULT NULL,
  `shippingEmailAddress` varchar(75) DEFAULT NULL,
  `shippingCompany` varchar(75) DEFAULT NULL,
  `shippingStreet` varchar(75) DEFAULT NULL,
  `shippingCity` varchar(75) DEFAULT NULL,
  `shippingState` varchar(75) DEFAULT NULL,
  `shippingZip` varchar(75) DEFAULT NULL,
  `shippingCountry` varchar(75) DEFAULT NULL,
  `shippingPhone` varchar(75) DEFAULT NULL,
  `ccName` varchar(75) DEFAULT NULL,
  `ccType` varchar(75) DEFAULT NULL,
  `ccNumber` varchar(75) DEFAULT NULL,
  `ccExpMonth` int(11) DEFAULT NULL,
  `ccExpYear` int(11) DEFAULT NULL,
  `ccVerNumber` varchar(75) DEFAULT NULL,
  `comments` longtext,
  `ppTxnId` varchar(75) DEFAULT NULL,
  `ppPaymentStatus` varchar(75) DEFAULT NULL,
  `ppPaymentGross` double DEFAULT NULL,
  `ppReceiverEmail` varchar(75) DEFAULT NULL,
  `ppPayerEmail` varchar(75) DEFAULT NULL,
  `sendOrderEmail` tinyint(4) DEFAULT NULL,
  `sendShippingEmail` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `IX_D7D6E87A` (`number_`),
  KEY `IX_1D15553E` (`groupId`),
  KEY `IX_119B5630` (`groupId`,`userId`,`ppPaymentStatus`),
  KEY `IX_F474FD89` (`ppTxnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingorder`
--

LOCK TABLES `shoppingorder` WRITE;
/*!40000 ALTER TABLE `shoppingorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingorderitem`
--

DROP TABLE IF EXISTS `shoppingorderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingorderitem` (
  `orderItemId` bigint(20) NOT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `itemId` varchar(75) DEFAULT NULL,
  `sku` varchar(75) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `properties` longtext,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shippedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `IX_B5F82C7A` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingorderitem`
--

LOCK TABLES `shoppingorderitem` WRITE;
/*!40000 ALTER TABLE `shoppingorderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingorderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialactivity`
--

DROP TABLE IF EXISTS `socialactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialactivity` (
  `activityId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `activitySetId` bigint(20) DEFAULT NULL,
  `mirrorActivityId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `parentClassNameId` bigint(20) DEFAULT NULL,
  `parentClassPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `receiverUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityId`),
  UNIQUE KEY `IX_8F32DEC9` (`groupId`,`userId`,`createDate`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  KEY `IX_F542E9BC` (`activitySetId`),
  KEY `IX_82E39A0C` (`classNameId`),
  KEY `IX_A853C757` (`classNameId`,`classPK`),
  KEY `IX_D0E9029E` (`classNameId`,`classPK`,`type_`),
  KEY `IX_64B1BC66` (`companyId`),
  KEY `IX_2A2468` (`groupId`),
  KEY `IX_FB604DC7` (`groupId`,`userId`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  KEY `IX_1271F25F` (`mirrorActivityId`),
  KEY `IX_1F00C374` (`mirrorActivityId`,`classNameId`,`classPK`),
  KEY `IX_121CA3CB` (`receiverUserId`),
  KEY `IX_3504B8BC` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialactivity`
--

LOCK TABLES `socialactivity` WRITE;
/*!40000 ALTER TABLE `socialactivity` DISABLE KEYS */;
INSERT INTO `socialactivity` VALUES (201,20182,20155,20199,1477601751950,0,0,20109,23004,0,0,1,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(202,20182,20155,20199,1477602791849,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(203,20182,20155,20199,1477602976657,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(204,20182,20155,20199,1477603068815,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(205,20182,20155,20199,1477603438534,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(206,20182,20155,20199,1477603488960,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(301,20182,20155,20199,1477677199151,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(401,20182,20155,20199,1477677723285,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0),(501,20182,20155,20199,1487977976372,0,0,20109,23004,0,0,2,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"ru_RU\\\" default-locale=\\\"ru_RU\\\"><Title language-id=\\\"ru_RU\\\">Главная страница<\\/Title><\\/root>\"}',0);
/*!40000 ALTER TABLE `socialactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialactivityachievement`
--

DROP TABLE IF EXISTS `socialactivityachievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialactivityachievement` (
  `activityAchievementId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `firstInGroup` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`activityAchievementId`),
  UNIQUE KEY `IX_D4390CAA` (`groupId`,`userId`,`name`),
  KEY `IX_E14B1F1` (`groupId`),
  KEY `IX_83E16F2F` (`groupId`,`firstInGroup`),
  KEY `IX_8F6408F0` (`groupId`,`name`),
  KEY `IX_C8FD892B` (`groupId`,`userId`),
  KEY `IX_AABC18E9` (`groupId`,`userId`,`firstInGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialactivityachievement`
--

LOCK TABLES `socialactivityachievement` WRITE;
/*!40000 ALTER TABLE `socialactivityachievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialactivityachievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialactivitycounter`
--

DROP TABLE IF EXISTS `socialactivitycounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialactivitycounter` (
  `activityCounterId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `currentValue` int(11) DEFAULT NULL,
  `totalValue` int(11) DEFAULT NULL,
  `graceValue` int(11) DEFAULT NULL,
  `startPeriod` int(11) DEFAULT NULL,
  `endPeriod` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`activityCounterId`),
  UNIQUE KEY `IX_1B7E3B67` (`groupId`,`classNameId`,`classPK`,`name`,`ownerType`,`endPeriod`),
  UNIQUE KEY `IX_374B35AE` (`groupId`,`classNameId`,`classPK`,`name`,`ownerType`,`startPeriod`),
  KEY `IX_A4B9A23B` (`classNameId`,`classPK`),
  KEY `IX_D6666704` (`groupId`),
  KEY `IX_926CDD04` (`groupId`,`classNameId`,`classPK`,`ownerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialactivitycounter`
--

LOCK TABLES `socialactivitycounter` WRITE;
/*!40000 ALTER TABLE `socialactivitycounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialactivitycounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialactivitylimit`
--

DROP TABLE IF EXISTS `socialactivitylimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialactivitylimit` (
  `activityLimitId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `activityType` int(11) DEFAULT NULL,
  `activityCounterName` varchar(75) DEFAULT NULL,
  `value` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`activityLimitId`),
  UNIQUE KEY `IX_F1C1A617` (`groupId`,`userId`,`classNameId`,`classPK`,`activityType`,`activityCounterName`),
  KEY `IX_B15863FA` (`classNameId`,`classPK`),
  KEY `IX_18D4BAE5` (`groupId`),
  KEY `IX_6F9EDE9F` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialactivitylimit`
--

LOCK TABLES `socialactivitylimit` WRITE;
/*!40000 ALTER TABLE `socialactivitylimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialactivitylimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialactivityset`
--

DROP TABLE IF EXISTS `socialactivityset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialactivityset` (
  `activitySetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `modifiedDate` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `activityCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`activitySetId`),
  KEY `IX_4460FA14` (`classNameId`,`classPK`,`type_`),
  KEY `IX_9E13F2DE` (`groupId`),
  KEY `IX_9BE30DDF` (`groupId`,`userId`,`classNameId`,`type_`),
  KEY `IX_F71071BD` (`groupId`,`userId`,`type_`),
  KEY `IX_F80C4386` (`userId`),
  KEY `IX_62AC101A` (`userId`,`classNameId`,`classPK`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialactivityset`
--

LOCK TABLES `socialactivityset` WRITE;
/*!40000 ALTER TABLE `socialactivityset` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialactivityset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialactivitysetting`
--

DROP TABLE IF EXISTS `socialactivitysetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialactivitysetting` (
  `activitySettingId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `activityType` int(11) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`activitySettingId`),
  KEY `IX_8BE5F230` (`groupId`),
  KEY `IX_384788CD` (`groupId`,`activityType`),
  KEY `IX_9D22151E` (`groupId`,`classNameId`),
  KEY `IX_1E9CF33B` (`groupId`,`classNameId`,`activityType`),
  KEY `IX_D984AABA` (`groupId`,`classNameId`,`activityType`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialactivitysetting`
--

LOCK TABLES `socialactivitysetting` WRITE;
/*!40000 ALTER TABLE `socialactivitysetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialactivitysetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialrelation`
--

DROP TABLE IF EXISTS `socialrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialrelation` (
  `uuid_` varchar(75) DEFAULT NULL,
  `relationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `userId1` bigint(20) DEFAULT NULL,
  `userId2` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  PRIMARY KEY (`relationId`),
  UNIQUE KEY `IX_12A92145` (`userId1`,`userId2`,`type_`),
  KEY `IX_61171E99` (`companyId`),
  KEY `IX_95135D1C` (`companyId`,`type_`),
  KEY `IX_C31A64C6` (`type_`),
  KEY `IX_5A40CDCC` (`userId1`),
  KEY `IX_4B52BE89` (`userId1`,`type_`),
  KEY `IX_B5C9C690` (`userId1`,`userId2`),
  KEY `IX_5A40D18D` (`userId2`),
  KEY `IX_3F9C2FA8` (`userId2`,`type_`),
  KEY `IX_F0CA24A5` (`uuid_`),
  KEY `IX_5B30F663` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialrelation`
--

LOCK TABLES `socialrelation` WRITE;
/*!40000 ALTER TABLE `socialrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialrequest`
--

DROP TABLE IF EXISTS `socialrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialrequest` (
  `uuid_` varchar(75) DEFAULT NULL,
  `requestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `modifiedDate` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `receiverUserId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  UNIQUE KEY `IX_36A90CA7` (`userId`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  UNIQUE KEY `IX_4F973EFE` (`uuid_`,`groupId`),
  KEY `IX_D3425487` (`classNameId`,`classPK`,`type_`,`receiverUserId`,`status`),
  KEY `IX_A90FE5A0` (`companyId`),
  KEY `IX_32292ED1` (`receiverUserId`),
  KEY `IX_D9380CB7` (`receiverUserId`,`status`),
  KEY `IX_80F7A9C2` (`userId`),
  KEY `IX_CC86A444` (`userId`,`classNameId`,`classPK`,`type_`,`status`),
  KEY `IX_AB5906A8` (`userId`,`status`),
  KEY `IX_49D5872C` (`uuid_`),
  KEY `IX_8D42897C` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialrequest`
--

LOCK TABLES `socialrequest` WRITE;
/*!40000 ALTER TABLE `socialrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `subscriptionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `frequency` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`subscriptionId`),
  UNIQUE KEY `IX_2E1A92D4` (`companyId`,`userId`,`classNameId`,`classPK`),
  KEY `IX_786D171A` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_54243AFD` (`userId`),
  KEY `IX_E8F34171` (`userId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syncdlfileversiondiff`
--

DROP TABLE IF EXISTS `syncdlfileversiondiff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdlfileversiondiff` (
  `syncDLFileVersionDiffId` bigint(20) NOT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `sourceFileVersionId` bigint(20) DEFAULT NULL,
  `targetFileVersionId` bigint(20) DEFAULT NULL,
  `dataFileEntryId` bigint(20) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`syncDLFileVersionDiffId`),
  UNIQUE KEY `IX_AC4C7667` (`fileEntryId`,`sourceFileVersionId`,`targetFileVersionId`),
  KEY `IX_A9B43C55` (`expirationDate`),
  KEY `IX_F832A75D` (`fileEntryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syncdlfileversiondiff`
--

LOCK TABLES `syncdlfileversiondiff` WRITE;
/*!40000 ALTER TABLE `syncdlfileversiondiff` DISABLE KEYS */;
/*!40000 ALTER TABLE `syncdlfileversiondiff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syncdlobject`
--

DROP TABLE IF EXISTS `syncdlobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncdlobject` (
  `syncDLObjectId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createTime` bigint(20) DEFAULT NULL,
  `modifiedTime` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `description` longtext,
  `changeLog` varchar(75) DEFAULT NULL,
  `extraSettings` longtext,
  `version` varchar(75) DEFAULT NULL,
  `versionId` bigint(20) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `checksum` varchar(75) DEFAULT NULL,
  `event` varchar(75) DEFAULT NULL,
  `lastPermissionChangeDate` datetime DEFAULT NULL,
  `lockExpirationDate` datetime DEFAULT NULL,
  `lockUserId` bigint(20) DEFAULT NULL,
  `lockUserName` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  `typeUuid` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`syncDLObjectId`),
  UNIQUE KEY `IX_E3F57BD6` (`type_`,`typePK`),
  KEY `IX_980323CB` (`modifiedTime`,`repositoryId`),
  KEY `IX_8D4FDC9F` (`modifiedTime`,`repositoryId`,`event`),
  KEY `IX_A3ACE372` (`modifiedTime`,`repositoryId`,`parentFolderId`),
  KEY `IX_F174AD48` (`repositoryId`,`parentFolderId`),
  KEY `IX_3BE7BB8D` (`repositoryId`,`parentFolderId`,`type_`),
  KEY `IX_57F62914` (`repositoryId`,`type_`),
  KEY `IX_28CD54BB` (`type_`,`version`),
  KEY `IX_1CCA3B5` (`version`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syncdlobject`
--

LOCK TABLES `syncdlobject` WRITE;
/*!40000 ALTER TABLE `syncdlobject` DISABLE KEYS */;
INSERT INTO `syncdlobject` VALUES (22838,20155,20199,'Test Test',1477514052079,1477514052079,20201,0,'/22834/','OpenSocial Gadgets','','','','','','',0,0,'','add',NULL,NULL,0,'','folder',22834,'25eb237c-9a1f-4b82-ad2e-e2e57b9e8d91'),(24974,20155,20159,'',1479754872388,1479754872388,24855,0,'/0/','64_64','png','image/png','','','','1.0',24867,6409,'NIXgjwshC7SSTPLbtGNWumDZT0M=','add',NULL,NULL,0,'','file',24866,'7c3abf7b-91d1-47e1-adba-53530fe30e31'),(24983,20155,20159,'',1479754872566,1479754872566,24855,0,'/0/','avatar1','jpeg','image/jpeg','','','','1.0',24876,3718,'DpdIq3qF0n/8JT7Uk9fvZTjDf5E=','add',NULL,NULL,0,'','file',24875,'855d87ca-c560-451d-971c-ddafbdb7ab48'),(24984,20155,20159,'',1479754872652,1479754872652,24855,0,'/0/','197_203','png','image/png','','','','1.0',24884,10921,'cbslTkAdjE7syhX6URYp6by5rcI=','add',NULL,NULL,0,'','file',24883,'8ccbafbd-7799-4fb8-8790-c58c4647d821'),(24988,20155,20159,'',1479754872742,1479754872742,24855,0,'/0/','avatar2','jpeg','image/jpeg','','','','1.0',24892,2989,'UX1RLvfELu3BJo9f+CgGN0m/nfQ=','add',NULL,NULL,0,'','file',24891,'a674a96d-fb2e-45de-acd3-66111c31eb5d'),(24994,20155,20159,'',1479754872896,1479754872896,24855,0,'/0/','avatar3','jpeg','image/jpeg','','','','1.0',24900,912,'bHeMSnf01hr/Rl+AfrfpVGkeB/Y=','add',NULL,NULL,0,'','file',24899,'4d6bc0b3-950a-4b05-8c26-6f0f4f1631dc'),(24995,20155,20159,'',1479754873422,1479754873422,24855,0,'/0/','210_150','png','image/png','','','','1.0',24909,12214,'x3pAGkTtClG6ycR4seI8d/EK2M4=','add',NULL,NULL,0,'','file',24908,'eb0e6c25-927a-44f3-a610-b6085c1f47de'),(24997,20155,20159,'',1479754873508,1479754873508,24855,0,'/0/','900_350','png','image/png','','','','1.0',24917,34646,'Na5/xpkRhxq4ATtfRrRnIWeKkfI=','add',NULL,NULL,0,'','file',24916,'e1a093d1-f5af-473a-ba52-9513c19a8b10');
/*!40000 ALTER TABLE `syncdlobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemevent`
--

DROP TABLE IF EXISTS `systemevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemevent` (
  `systemEventId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `referrerClassNameId` bigint(20) DEFAULT NULL,
  `parentSystemEventId` bigint(20) DEFAULT NULL,
  `systemEventSetKey` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  PRIMARY KEY (`systemEventId`),
  KEY `IX_72D73D39` (`groupId`),
  KEY `IX_7A2F0ECE` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_FFCBB747` (`groupId`,`classNameId`,`classPK`,`type_`),
  KEY `IX_A19C89FF` (`groupId`,`systemEventSetKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemevent`
--

LOCK TABLES `systemevent` WRITE;
/*!40000 ALTER TABLE `systemevent` DISABLE KEYS */;
INSERT INTO `systemevent` VALUES (21512,20182,20155,20199,'Test Test','2016-10-26 13:47:57',20002,20701,'f5c0c78e-acd9-44f1-a4ec-9e6ef701eb73',0,0,21513,1,'{\"privateLayout\":\"false\"}'),(22809,20182,20155,20199,'Test Test','2016-10-26 23:21:17',20109,21137,'8beacf43-6d96-444e-b7c1-24a5e0ddde67',0,0,22810,1,''),(22813,20182,20155,20199,'Test Test','2016-10-26 23:21:21',20109,21171,'a8e5c8e3-c7b7-44c9-93aa-8721b050510d',0,0,22814,1,''),(22817,20182,20155,20199,'Test Test','2016-10-26 23:21:25',20109,21245,'fbdf9e1d-1d60-45a1-80f8-73e6dcf5239f',0,0,22818,1,''),(22843,20182,20155,20199,'Test Test','2016-10-27 22:23:48',20002,20707,'9c81dc49-6780-4d9a-aea5-e524dbd8e295',0,0,22844,1,'{\"privateLayout\":\"false\"}');
/*!40000 ALTER TABLE `systemevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `teamId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`teamId`),
  UNIQUE KEY `IX_143DC786` (`groupId`,`name`),
  KEY `IX_AE6E9907` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticketId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraInfo` longtext,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `IX_1E8DFB2E` (`classNameId`,`classPK`,`type_`),
  KEY `IX_B2468446` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiis_foo`
--

DROP TABLE IF EXISTS `tiis_foo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiis_foo` (
  `fooId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `field1` varchar(75) DEFAULT NULL,
  `field2` tinyint(4) DEFAULT NULL,
  `field3` int(11) DEFAULT NULL,
  `field4` datetime DEFAULT NULL,
  `field5` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`fooId`),
  KEY `IX_E2C00D18` (`field2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiis_foo`
--

LOCK TABLES `tiis_foo` WRITE;
/*!40000 ALTER TABLE `tiis_foo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiis_foo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiisbook`
--

DROP TABLE IF EXISTS `tiisbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiisbook` (
  `bookId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `gDriveId` varchar(75) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `description` varchar(750) DEFAULT NULL,
  `googleDriveLink` varchar(750) DEFAULT NULL,
  `bookLogo` longblob,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiisbook`
--

LOCK TABLES `tiisbook` WRITE;
/*!40000 ALTER TABLE `tiisbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiisbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiistest`
--

DROP TABLE IF EXISTS `tiistest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiistest` (
  `testId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `isBookTest` tinyint(4) DEFAULT NULL,
  `bookId` bigint(20) DEFAULT NULL,
  `content` varchar(950) DEFAULT NULL,
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiistest`
--

LOCK TABLES `tiistest` WRITE;
/*!40000 ALTER TABLE `tiistest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiistest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiistestattempt`
--

DROP TABLE IF EXISTS `tiistestattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiistestattempt` (
  `testId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `startTime` datetime NOT NULL,
  `finishTime` datetime NOT NULL,
  `result` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiistestattempt`
--

LOCK TABLES `tiistestattempt` WRITE;
/*!40000 ALTER TABLE `tiistestattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiistestattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trashentry`
--

DROP TABLE IF EXISTS `trashentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trashentry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `systemEventSetKey` bigint(20) DEFAULT NULL,
  `typeSettings` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_B35F73D5` (`classNameId`,`classPK`),
  KEY `IX_2674F2A8` (`companyId`),
  KEY `IX_526A032A` (`groupId`),
  KEY `IX_FC4EEA64` (`groupId`,`classNameId`),
  KEY `IX_6CAAE2E8` (`groupId`,`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trashentry`
--

LOCK TABLES `trashentry` WRITE;
/*!40000 ALTER TABLE `trashentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `trashentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trashversion`
--

DROP TABLE IF EXISTS `trashversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trashversion` (
  `versionId` bigint(20) NOT NULL,
  `entryId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `typeSettings` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionId`),
  UNIQUE KEY `IX_D639348C` (`entryId`,`classNameId`,`classPK`),
  KEY `IX_630A643B` (`classNameId`,`classPK`),
  KEY `IX_55D44577` (`entryId`),
  KEY `IX_72D58D37` (`entryId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trashversion`
--

LOCK TABLES `trashversion` WRITE;
/*!40000 ALTER TABLE `trashversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `trashversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_`
--

DROP TABLE IF EXISTS `user_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `defaultUser` tinyint(4) DEFAULT NULL,
  `contactId` bigint(20) DEFAULT NULL,
  `password_` varchar(75) DEFAULT NULL,
  `passwordEncrypted` tinyint(4) DEFAULT NULL,
  `passwordReset` tinyint(4) DEFAULT NULL,
  `passwordModifiedDate` datetime DEFAULT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `reminderQueryQuestion` varchar(75) DEFAULT NULL,
  `reminderQueryAnswer` varchar(75) DEFAULT NULL,
  `graceLoginCount` int(11) DEFAULT NULL,
  `screenName` varchar(75) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `facebookId` bigint(20) DEFAULT NULL,
  `ldapServerId` bigint(20) DEFAULT NULL,
  `openId` varchar(1024) DEFAULT NULL,
  `portraitId` bigint(20) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `timeZoneId` varchar(75) DEFAULT NULL,
  `greeting` varchar(255) DEFAULT NULL,
  `comments` longtext,
  `firstName` varchar(75) DEFAULT NULL,
  `middleName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginIP` varchar(75) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginIP` varchar(75) DEFAULT NULL,
  `lastFailedLoginDate` datetime DEFAULT NULL,
  `failedLoginAttempts` int(11) DEFAULT NULL,
  `lockout` tinyint(4) DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `agreedToTermsOfUse` tinyint(4) DEFAULT NULL,
  `emailAddressVerified` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `IX_615E9F7A` (`companyId`,`emailAddress`),
  UNIQUE KEY `IX_C5806019` (`companyId`,`screenName`),
  UNIQUE KEY `IX_9782AD88` (`companyId`,`userId`),
  UNIQUE KEY `IX_5ADBE171` (`contactId`),
  KEY `IX_3A1E834E` (`companyId`),
  KEY `IX_740C4D0C` (`companyId`,`createDate`),
  KEY `IX_BCFDA257` (`companyId`,`createDate`,`modifiedDate`),
  KEY `IX_6EF03E4E` (`companyId`,`defaultUser`),
  KEY `IX_1D731F03` (`companyId`,`facebookId`),
  KEY `IX_EE8ABD19` (`companyId`,`modifiedDate`),
  KEY `IX_F6039434` (`companyId`,`status`),
  KEY `IX_762F63C6` (`emailAddress`),
  KEY `IX_A18034A4` (`portraitId`),
  KEY `IX_E0422BDA` (`uuid_`),
  KEY `IX_405CC0E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_`
--

LOCK TABLES `user_` WRITE;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;
INSERT INTO `user_` VALUES ('abd1c001-cbca-4e54-8e7c-b4d88be68343',20159,20155,'2016-10-02 17:09:31','2016-10-02 17:09:31',1,20160,'password',0,0,NULL,'5533ed38b5e33c076a804bb4bca644f9,9590828507537743bc166fef8cff8748,9590828507537743bc166fef8cff8748','','',0,'20159','default@liferay.com',0,0,'',0,'en_US','Asia/Baghdad','Welcome!','','','','','','2016-10-02 17:09:31','',NULL,'',NULL,0,0,NULL,1,0,0),('679596ac-3571-4995-b186-007a71357925',20199,20155,'2016-10-02 17:09:32','2016-10-26 23:33:14',0,20200,'AAAAoAAB9AB2RsWepiG3k/bg3OB1NDd3O74mKPiy4QYBktrm',1,0,'2016-10-02 17:25:45','c465b0aecf9b32f731218f2521662b17,35125d9cfdcbfcac73889ecf2db58e4f,472e2e5266017a9046e53b1c70fac971','Bride\'s name','Ira',0,'test','test@liferay.com',0,-1,'',0,'en_US','UTC','Welcome Test Test!','','Test','','Test','','2017-02-24 18:28:15','127.0.0.1','2017-02-19 13:16:07','127.0.0.1','2017-02-07 19:09:04',0,0,NULL,1,1,0);
/*!40000 ALTER TABLE `user_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `uuid_` varchar(75) DEFAULT NULL,
  `userGroupId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentUserGroupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `addedByLDAPImport` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userGroupId`),
  UNIQUE KEY `IX_23EAD0D` (`companyId`,`name`),
  KEY `IX_524FEFCE` (`companyId`),
  KEY `IX_69771487` (`companyId`,`parentUserGroupId`),
  KEY `IX_5F1DD85A` (`uuid_`),
  KEY `IX_72394F8E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroupgrouprole`
--

DROP TABLE IF EXISTS `usergroupgrouprole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroupgrouprole` (
  `userGroupId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userGroupId`,`groupId`,`roleId`),
  KEY `IX_CCBE4063` (`groupId`),
  KEY `IX_CAB0CCC8` (`groupId`,`roleId`),
  KEY `IX_1CDF88C` (`roleId`),
  KEY `IX_DCDED558` (`userGroupId`),
  KEY `IX_73C52252` (`userGroupId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroupgrouprole`
--

LOCK TABLES `usergroupgrouprole` WRITE;
/*!40000 ALTER TABLE `usergroupgrouprole` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroupgrouprole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergrouprole`
--

DROP TABLE IF EXISTS `usergrouprole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergrouprole` (
  `userId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`groupId`,`roleId`),
  KEY `IX_1B988D7A` (`groupId`),
  KEY `IX_871412DF` (`groupId`,`roleId`),
  KEY `IX_887A2C95` (`roleId`),
  KEY `IX_887BE56A` (`userId`),
  KEY `IX_4D040680` (`userId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergrouprole`
--

LOCK TABLES `usergrouprole` WRITE;
/*!40000 ALTER TABLE `usergrouprole` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergrouprole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_teams`
--

DROP TABLE IF EXISTS `usergroups_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_teams` (
  `teamId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`teamId`,`userGroupId`),
  KEY `IX_31FB0B08` (`teamId`),
  KEY `IX_7F187E63` (`userGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_teams`
--

LOCK TABLES `usergroups_teams` WRITE;
/*!40000 ALTER TABLE `usergroups_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useridmapper`
--

DROP TABLE IF EXISTS `useridmapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useridmapper` (
  `userIdMapperId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `externalUserId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`userIdMapperId`),
  UNIQUE KEY `IX_41A32E0D` (`type_`,`externalUserId`),
  UNIQUE KEY `IX_D1C44A6E` (`userId`,`type_`),
  KEY `IX_E60EA987` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useridmapper`
--

LOCK TABLES `useridmapper` WRITE;
/*!40000 ALTER TABLE `useridmapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `useridmapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernotificationdelivery`
--

DROP TABLE IF EXISTS `usernotificationdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usernotificationdelivery` (
  `userNotificationDeliveryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `notificationType` int(11) DEFAULT NULL,
  `deliveryType` int(11) DEFAULT NULL,
  `deliver` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userNotificationDeliveryId`),
  UNIQUE KEY `IX_8B6E3ACE` (`userId`,`portletId`,`classNameId`,`notificationType`,`deliveryType`),
  KEY `IX_C648700A` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernotificationdelivery`
--

LOCK TABLES `usernotificationdelivery` WRITE;
/*!40000 ALTER TABLE `usernotificationdelivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernotificationdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernotificationevent`
--

DROP TABLE IF EXISTS `usernotificationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usernotificationevent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `userNotificationEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `deliverBy` bigint(20) DEFAULT NULL,
  `delivered` tinyint(4) DEFAULT NULL,
  `payload` longtext,
  `archived` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userNotificationEventId`),
  KEY `IX_3E5D78C4` (`userId`),
  KEY `IX_3DBB361A` (`userId`,`archived`),
  KEY `IX_24F1BF0` (`userId`,`delivered`),
  KEY `IX_ECD8CFEA` (`uuid_`),
  KEY `IX_A6BAFDFE` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernotificationevent`
--

LOCK TABLES `usernotificationevent` WRITE;
/*!40000 ALTER TABLE `usernotificationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernotificationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`userId`),
  KEY `IX_C4F9E699` (`groupId`),
  KEY `IX_F10B6C6B` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (20182,20199);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_orgs`
--

DROP TABLE IF EXISTS `users_orgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_orgs` (
  `organizationId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`organizationId`,`userId`),
  KEY `IX_7EF4EC0E` (`organizationId`),
  KEY `IX_FB646CA6` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_orgs`
--

LOCK TABLES `users_orgs` WRITE;
/*!40000 ALTER TABLE `users_orgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_orgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `IX_C19E5F31` (`roleId`),
  KEY `IX_C1A01806` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (20162,20199),(20163,20159),(20165,20199),(20166,20199);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teams`
--

DROP TABLE IF EXISTS `users_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_teams` (
  `teamId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`teamId`,`userId`),
  KEY `IX_4D06AD51` (`teamId`),
  KEY `IX_A098EFBF` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teams`
--

LOCK TABLES `users_teams` WRITE;
/*!40000 ALTER TABLE `users_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_usergroups`
--

DROP TABLE IF EXISTS `users_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_usergroups` (
  `userId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`userGroupId`),
  KEY `IX_66FF2503` (`userGroupId`),
  KEY `IX_BE8102D6` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_usergroups`
--

LOCK TABLES `users_usergroups` WRITE;
/*!40000 ALTER TABLE `users_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertracker`
--

DROP TABLE IF EXISTS `usertracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertracker` (
  `userTrackerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `sessionId` varchar(200) DEFAULT NULL,
  `remoteAddr` varchar(75) DEFAULT NULL,
  `remoteHost` varchar(75) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userTrackerId`),
  KEY `IX_29BA1CF5` (`companyId`),
  KEY `IX_46B0AE8E` (`sessionId`),
  KEY `IX_E4EFBA8D` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertracker`
--

LOCK TABLES `usertracker` WRITE;
/*!40000 ALTER TABLE `usertracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertrackerpath`
--

DROP TABLE IF EXISTS `usertrackerpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertrackerpath` (
  `userTrackerPathId` bigint(20) NOT NULL,
  `userTrackerId` bigint(20) DEFAULT NULL,
  `path_` longtext,
  `pathDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userTrackerPathId`),
  KEY `IX_14D8BCC0` (`userTrackerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertrackerpath`
--

LOCK TABLES `usertrackerpath` WRITE;
/*!40000 ALTER TABLE `usertrackerpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertrackerpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualhost`
--

DROP TABLE IF EXISTS `virtualhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualhost` (
  `virtualHostId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `layoutSetId` bigint(20) DEFAULT NULL,
  `hostname` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`virtualHostId`),
  UNIQUE KEY `IX_A083D394` (`companyId`,`layoutSetId`),
  UNIQUE KEY `IX_431A3960` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualhost`
--

LOCK TABLES `virtualhost` WRITE;
/*!40000 ALTER TABLE `virtualhost` DISABLE KEYS */;
INSERT INTO `virtualhost` VALUES (20158,20155,0,'localhost');
/*!40000 ALTER TABLE `virtualhost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webdavprops`
--

DROP TABLE IF EXISTS `webdavprops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webdavprops` (
  `webDavPropsId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `props` longtext,
  PRIMARY KEY (`webDavPropsId`),
  UNIQUE KEY `IX_97DFA146` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webdavprops`
--

LOCK TABLES `webdavprops` WRITE;
/*!40000 ALTER TABLE `webdavprops` DISABLE KEYS */;
/*!40000 ALTER TABLE `webdavprops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website` (
  `uuid_` varchar(75) DEFAULT NULL,
  `websiteId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `url` longtext,
  `typeId` int(11) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`websiteId`),
  KEY `IX_96F07007` (`companyId`),
  KEY `IX_4F0F0CA7` (`companyId`,`classNameId`),
  KEY `IX_F960131C` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_1AA07A6D` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_F75690BB` (`userId`),
  KEY `IX_76F15D13` (`uuid_`),
  KEY `IX_712BCD35` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikinode`
--

DROP TABLE IF EXISTS `wikinode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikinode` (
  `uuid_` varchar(75) DEFAULT NULL,
  `nodeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `lastPostDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`nodeId`),
  UNIQUE KEY `IX_920CD8B1` (`groupId`,`name`),
  UNIQUE KEY `IX_7609B2AE` (`uuid_`,`groupId`),
  KEY `IX_5D6FE3F0` (`companyId`),
  KEY `IX_B54332D6` (`companyId`,`status`),
  KEY `IX_B480A672` (`groupId`),
  KEY `IX_23325358` (`groupId`,`status`),
  KEY `IX_6C112D7C` (`uuid_`),
  KEY `IX_E0E6D12C` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikinode`
--

LOCK TABLES `wikinode` WRITE;
/*!40000 ALTER TABLE `wikinode` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikinode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikipage`
--

DROP TABLE IF EXISTS `wikipage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipage` (
  `uuid_` varchar(75) DEFAULT NULL,
  `pageId` bigint(20) NOT NULL,
  `resourcePrimKey` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `minorEdit` tinyint(4) DEFAULT NULL,
  `content` longtext,
  `summary` longtext,
  `format` varchar(75) DEFAULT NULL,
  `head` tinyint(4) DEFAULT NULL,
  `parentTitle` varchar(255) DEFAULT NULL,
  `redirectTitle` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pageId`),
  UNIQUE KEY `IX_3D4AF476` (`nodeId`,`title`,`version`),
  UNIQUE KEY `IX_2CD67C81` (`resourcePrimKey`,`nodeId`,`version`),
  UNIQUE KEY `IX_899D3DFB` (`uuid_`,`groupId`),
  KEY `IX_A2001730` (`format`),
  KEY `IX_16E99B0A` (`groupId`,`nodeId`,`head`),
  KEY `IX_BA72B89A` (`groupId`,`nodeId`,`head`,`parentTitle`,`status`),
  KEY `IX_E0092FF0` (`groupId`,`nodeId`,`head`,`status`),
  KEY `IX_941E429C` (`groupId`,`nodeId`,`status`),
  KEY `IX_5FF21CE6` (`groupId`,`nodeId`,`title`,`head`),
  KEY `IX_CAA451D6` (`groupId`,`userId`,`nodeId`,`status`),
  KEY `IX_C8A9C476` (`nodeId`),
  KEY `IX_E7F635CA` (`nodeId`,`head`),
  KEY `IX_65E84AF4` (`nodeId`,`head`,`parentTitle`),
  KEY `IX_9F7655DA` (`nodeId`,`head`,`parentTitle`,`status`),
  KEY `IX_64CCB282` (`nodeId`,`head`,`redirectTitle`),
  KEY `IX_40F94F68` (`nodeId`,`head`,`redirectTitle`,`status`),
  KEY `IX_432F0AB0` (`nodeId`,`head`,`status`),
  KEY `IX_46EEF3C8` (`nodeId`,`parentTitle`),
  KEY `IX_1ECC7656` (`nodeId`,`redirectTitle`),
  KEY `IX_546F2D5C` (`nodeId`,`status`),
  KEY `IX_997EEDD2` (`nodeId`,`title`),
  KEY `IX_E745EA26` (`nodeId`,`title`,`head`),
  KEY `IX_BEA33AB8` (`nodeId`,`title`,`status`),
  KEY `IX_85E7CC76` (`resourcePrimKey`),
  KEY `IX_B771D67` (`resourcePrimKey`,`nodeId`),
  KEY `IX_E1F55FB` (`resourcePrimKey`,`nodeId`,`head`),
  KEY `IX_94D1054D` (`resourcePrimKey`,`nodeId`,`status`),
  KEY `IX_1725355C` (`resourcePrimKey`,`status`),
  KEY `IX_FBBE7C96` (`userId`,`nodeId`,`status`),
  KEY `IX_9C0E478F` (`uuid_`),
  KEY `IX_5DC4BD39` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipage`
--

LOCK TABLES `wikipage` WRITE;
/*!40000 ALTER TABLE `wikipage` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikipageresource`
--

DROP TABLE IF EXISTS `wikipageresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipageresource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `resourcePrimKey` bigint(20) NOT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resourcePrimKey`),
  UNIQUE KEY `IX_21277664` (`nodeId`,`title`),
  KEY `IX_BE898221` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipageresource`
--

LOCK TABLES `wikipageresource` WRITE;
/*!40000 ALTER TABLE `wikipageresource` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipageresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowdefinitionlink`
--

DROP TABLE IF EXISTS `workflowdefinitionlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowdefinitionlink` (
  `workflowDefinitionLinkId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  `workflowDefinitionName` varchar(75) DEFAULT NULL,
  `workflowDefinitionVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`workflowDefinitionLinkId`),
  KEY `IX_A8B0D276` (`companyId`),
  KEY `IX_A4DB1F0F` (`companyId`,`workflowDefinitionName`,`workflowDefinitionVersion`),
  KEY `IX_B6EE8C9E` (`groupId`,`companyId`,`classNameId`),
  KEY `IX_1E5B9905` (`groupId`,`companyId`,`classNameId`,`classPK`),
  KEY `IX_705B40EE` (`groupId`,`companyId`,`classNameId`,`classPK`,`typePK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowdefinitionlink`
--

LOCK TABLES `workflowdefinitionlink` WRITE;
/*!40000 ALTER TABLE `workflowdefinitionlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowdefinitionlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowinstancelink`
--

DROP TABLE IF EXISTS `workflowinstancelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowinstancelink` (
  `workflowInstanceLinkId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`workflowInstanceLinkId`),
  KEY `IX_415A7007` (`groupId`,`companyId`,`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowinstancelink`
--

LOCK TABLES `workflowinstancelink` WRITE;
/*!40000 ALTER TABLE `workflowinstancelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowinstancelink` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-01 21:36:53