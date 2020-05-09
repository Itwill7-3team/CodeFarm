CREATE DATABASE  IF NOT EXISTS `codefarm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `codefarm`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: codefarm
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `b_num` int(11) NOT NULL AUTO_INCREMENT,
  `b_m_id` varchar(45) NOT NULL,
  `b_l_num` int(11) NOT NULL,
  `b_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_l_price` int(11) NOT NULL DEFAULT '0',
  `b_l_name` varchar(45) NOT NULL,
  PRIMARY KEY (`b_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `writer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `re_lev` int(11) DEFAULT '0',
  `re_ref` int(11) DEFAULT '0',
  `re_seq` int(11) DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `l_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'askAnswer','제목1','내용1','작성자1',0,0,0,'2020-05-05 06:54:59','Vue.js 완벽 가이드 - 실습과 리팩토링으로 배우는 실전 개념'),(2,'askAnswer','제목2','내용2','작성자2',0,0,0,'2020-05-05 06:54:59','프로그래밍 시작하기 : 파이썬 입문 (Inflearn Original)'),(3,'askss','제목3','내용3','작성자3',0,0,0,'2020-05-05 06:55:27','따라하며 배우는 노드, 리액트 시리즈 - 기본 강의');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `c_num` int(11) NOT NULL AUTO_INCREMENT,
  `c_b_num` int(11) NOT NULL,
  `c_content` text COLLATE utf8_unicode_ci,
  `c_writer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`c_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmember`
--

DROP TABLE IF EXISTS `dmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dmember` (
  `m_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `m_pw` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `m_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_addr` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_rank` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '비회원',
  `m_intro` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`m_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmember`
--

LOCK TABLES `dmember` WRITE;
/*!40000 ALTER TABLE `dmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `dmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `l_number` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `l_m_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `l_m_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `l_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `l_content` text COLLATE utf8_unicode_ci NOT NULL,
  `l_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `l_type2` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `l_type3` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `l_price` int(11) NOT NULL,
  `l_pct` int(11) NOT NULL DEFAULT '0',
  `l_img` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_tag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_goods` int(11) NOT NULL DEFAULT '0',
  `l_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pct_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`l_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `m_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `m_pw` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `m_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_addr` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_rank` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '비회원',
  `m_intro` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`m_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_board`
--

DROP TABLE IF EXISTS `n_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_board` (
  `n_num` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `n_content` text COLLATE utf8_unicode_ci NOT NULL,
  `n_writer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `n_re_lev` int(11) DEFAULT '0',
  `n_re_ref` int(11) DEFAULT '0',
  `n_re_seq` int(11) DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_board`
--

LOCK TABLES `n_board` WRITE;
/*!40000 ALTER TABLE `n_board` DISABLE KEYS */;
INSERT INTO `n_board` VALUES (1,'라즈베리파이4 초보자라서요..현재 갖고 잇는 보는 라즈베리파이 4입니다.','라즈베리파이4로 이용하여 지금 강의를 듣고 이용 가능할까요..','작성자1',0,0,0,'2020-05-05 06:54:59'),(2,'제목2','내용2','작성자2',0,0,0,'2020-05-01 06:54:59'),(3,'제목3','내용3','작성자3',0,0,0,'2020-05-05 06:55:27');
/*!40000 ALTER TABLE `n_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `o_num` int(11) NOT NULL AUTO_INCREMENT,
  `o_b_num` varchar(45) DEFAULT NULL,
  `o_l_price` int(11) NOT NULL,
  `o_l_num` int(11) NOT NULL,
  `o_l_name` varchar(45) NOT NULL,
  `o_m_id` varchar(45) NOT NULL,
  `o_t_type` varchar(45) NOT NULL,
  `o_t_bank` varchar(45) NOT NULL,
  `o_t_payer` varchar(45) NOT NULL,
  `o_t_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `o_sum_money` int(11) NOT NULL,
  `o_status` int(11) NOT NULL DEFAULT '0',
  `orderlistcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`o_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q_board`
--

DROP TABLE IF EXISTS `q_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `q_board` (
  `q_num` int(11) NOT NULL AUTO_INCREMENT,
  `q_l_num` int(11) NOT NULL,
  `q_l_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `q_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `q_content` text COLLATE utf8_unicode_ci NOT NULL,
  `q_writer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `q_re_lev` int(11) NOT NULL DEFAULT '0',
  `q_re_ref` int(11) NOT NULL DEFAULT '0',
  `q_re_seq` int(11) NOT NULL DEFAULT '0',
  `q_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`q_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q_board`
--

LOCK TABLES `q_board` WRITE;
/*!40000 ALTER TABLE `q_board` DISABLE KEYS */;
INSERT INTO `q_board` VALUES (1,1,'Django, 데이터 분석, 프론트엔드까지 내 손으로 만드는 페이스북 클론 강의',' 자동완성 기능','html:5 탭해도 자동완성 이 안되는데 따로 설정해주어야하나요?',' holy_now ',0,0,0,'2020-05-08 05:39:09');
/*!40000 ALTER TABLE `q_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_board`
--

DROP TABLE IF EXISTS `r_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_board` (
  `r_num` int(11) NOT NULL AUTO_INCREMENT,
  `r_l_num` int(11) NOT NULL,
  `r_l_title` varchar(200) NOT NULL,
  `r_content` text NOT NULL,
  `r_writer` varchar(45) NOT NULL,
  `r_rating` int(11) NOT NULL DEFAULT '1',
  `r_re_lev` int(11) NOT NULL DEFAULT '0',
  `r_re_ref` int(11) NOT NULL DEFAULT '0',
  `r_re_seq` int(11) NOT NULL DEFAULT '0',
  `r_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`r_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_board`
--

LOCK TABLES `r_board` WRITE;
/*!40000 ALTER TABLE `r_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `s_num` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(200) NOT NULL,
  PRIMARY KEY (`s_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `s_number` int(11) NOT NULL,
  `s_l_number` int(11) DEFAULT NULL,
  `s_point` int(11) DEFAULT NULL,
  `s_content` text COLLATE utf8_unicode_ci,
  `s_writer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `w_num` int(11) NOT NULL AUTO_INCREMENT,
  `w_m_id` varchar(45) NOT NULL,
  `w_l_num` int(11) NOT NULL,
  `w_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`w_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'codefarm'
--

--
-- Dumping routines for database 'codefarm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 15:00:18
