CREATE DATABASE  IF NOT EXISTS `codefarm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `codefarm`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: codefarm
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `b_num` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `b_img` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b_content` text COLLATE utf8_unicode_ci NOT NULL,
  `b_writer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `b_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_ip` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`b_num`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (59,'블로그 테스트',NULL,'<p>블로그테스트</p>',' 까군','2020-05-23 08:21:41','0:0:0:0:0:0:0:1'),(60,'블로그 테스트',NULL,'<p>블로그테스트</p>','qsz78547@naver.com','2020-05-23 08:22:38','0:0:0:0:0:0:0:1'),(61,'블로그 테스트',NULL,'<p>블로그테스트</p>','qsz78547@naver.com','2020-05-23 08:22:44','0:0:0:0:0:0:0:1'),(89,'blog','d.png','<p>blogblog입니다 블로그블로그블로그</p>','qsz78547@naver.com','2020-05-23 09:06:53','0:0:0:0:0:0:0:1'),(90,'blog','e.jpg','<p>블로그 글이 잘 나오나요????????????</p>','qsz78547@naver.com','2020-05-23 09:06:54','0:0:0:0:0:0:0:1'),(91,'blog','f.jpg','<p>블로그테스트중입니다. 글이잘나오나요?</p>','qsz78547@naver.com','2020-05-23 09:06:54','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-23 22:14:38
