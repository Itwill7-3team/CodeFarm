CREATE DATABASE  IF NOT EXISTS `codefarm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `codefarm`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (3,'test',4,'2020-05-09 12:17:09',50000,'vue.js'),(4,'test',5,'2020-05-09 12:32:06',50000,'react'),(5,'qsz78547@naver.com',2,'2020-05-18 01:48:10',50000,'Nodejs');
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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `f_num` int(11) NOT NULL AUTO_INCREMENT,
  `f_l_num` int(11) DEFAULT NULL,
  `f_sec_list` int(11) DEFAULT NULL,
  `f_sec_name` varchar(100) DEFAULT NULL,
  `f_col_list` int(11) DEFAULT NULL,
  `f_col_name` varchar(100) DEFAULT NULL,
  `f_name` varchar(300) DEFAULT NULL,
  `f_o_name` varchar(300) DEFAULT NULL,
  `f_playtime` double DEFAULT NULL,
  `f_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `f_m_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`f_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,2,0,'기초',1,'미코새','aweg.mp4','aweg.mp4',15.156,'2020-05-14 07:23:04',NULL),(2,2,0,'기초',2,'왜파','ajg.mp4','ajg.mp4',56.65,'2020-05-14 07:23:04',NULL),(3,2,0,'기초',3,'설치하기','hsrtare.mp4','hsrtare.mp4',51.6961,'2020-05-14 07:23:04',NULL),(4,2,0,'기초',4,'주석주석','hnisj.mp4','hnisj.mp4',84.616,'2020-05-14 07:23:04',NULL),(5,2,1,'입력',1,'변수','iueg.mp4','iueg.mp4',612.15,'2020-05-14 07:23:04',NULL),(6,2,1,'입력',2,'기본재료','ngieru.mp4','ngieru.mp4',65.159,'2020-05-14 07:23:04',NULL),(7,2,1,'입력',3,'주석','gioe4u.mp4','gioe4u.mp4',75.65,'2020-05-14 07:23:04',NULL),(8,3,0,'출력',1,'튜플','ganieu.mp4','	gioe4u.mp4',98.415,'2020-05-14 07:23:04',NULL),(9,3,0,'출력',2,'연산자','iurb.mp4','iurb.mp4',17.65,'2020-05-14 07:23:04',NULL);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `l_number` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `l_m_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_abilities` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_targets` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_based` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_content` text COLLATE utf8_unicode_ci,
  `l_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_type2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_level` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_img` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_price` int(11) NOT NULL DEFAULT '0',
  `l_goods` int(11) NOT NULL DEFAULT '0',
  `l_pct` int(11) NOT NULL DEFAULT '0',
  `record` tinyint(1) NOT NULL DEFAULT '0',
  `l_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pct_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pay_count` int(11) NOT NULL DEFAULT '0',
  `start_msg` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_msg` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`l_number`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'admin@naver.com','SpringFrameWork','lee','','','','SpringFrameWork','웹개발','웹개발','','lect_64.png,null,null,null',50000,0,0,1,'2020-05-09 09:32:04','2020-05-09 09:32:04',0,NULL,NULL),(2,'admin@naver.com','Nodejs','lee','','','','Nodejs','웹개발','웹개발','','lect_71.png,null,null,null',50000,0,0,1,'2020-05-09 09:36:49','2020-05-09 09:36:49',0,NULL,NULL),(3,'admin@naver.com','Phython','lee','','','','Phython','웹개발','웹개발','','lect_81.png,null,null,null',50000,0,0,1,'2020-05-09 09:42:57','2020-05-09 09:42:57',0,NULL,NULL),(4,'admin@naver.com','vue.js','lee','','','','vue.js','웹개발','웹개발','','lect_91.png,null,null,null',50000,0,0,1,'2020-05-09 09:43:13','2020-05-09 09:43:13',0,NULL,NULL),(5,'admin@naver.com','react','lee','','','','react','웹개발','웹개발','','lect_101.png,null,null,null',50000,0,0,1,'2020-05-09 09:43:29','2020-05-09 09:43:29',0,NULL,NULL),(6,'admin@naver.com','Java','lee','','','','Java','웹개발','웹개발','','lect_11.png,null,null,null',50000,0,0,1,'2020-05-09 09:45:03','2020-05-09 09:45:03',0,NULL,NULL),(7,'admin@naver.com','lecture','lee','','','','lecture','웹개발','웹개발','','lect_21.png,null,null,null',50000,0,0,1,'2020-05-09 09:45:23','2020-05-09 09:45:23',0,NULL,NULL),(8,'admin@naver.com','lecture','lee','','','','lecture','웹개발','웹개발','','lect_31.png,null,null,null',50000,0,0,1,'2020-05-09 09:45:33','2020-05-09 09:45:33',0,NULL,NULL),(9,'admin@naver.com','html&css3','lee','','','','html&css3','웹개발','웹개발','','lect_41.png,null,null,null',50000,0,0,1,'2020-05-09 09:45:54','2020-05-09 09:45:54',0,NULL,NULL),(10,'admin@naver.com','lecture','lee','','','','lecture','웹개발','웹개발','','lect_51.png,null,null,null',50000,0,0,1,'2020-05-09 09:46:14','2020-05-09 09:46:14',0,NULL,NULL),(11,'admin@naver.com','알고리즘','lee','','','','알고리즘','알고리즘','알고리즘','','inf_11.png,null,null,null',50000,0,0,1,'2020-05-09 09:46:57','2020-05-09 09:46:57',0,NULL,NULL),(12,'admin@naver.com','머신러닝','lee','','','','머신러닝','머신러닝','머신러닝','','inf_21.png,null,null,null',50000,0,0,1,'2020-05-09 09:47:24','2020-05-09 09:47:24',0,NULL,NULL),(13,'admin@naver.com','포토샵','lee','','','','포토샵','포토샵','포토샵','','inf_31.png,null,null,null',50000,0,0,1,'2020-05-09 13:05:20','2020-05-09 13:05:20',0,NULL,NULL),(14,'admin@naver.com','C언어','lee','','','','C언어','C','C','','inf_41.png,null,null,null',50000,0,0,1,'2020-05-09 13:05:52','2020-05-09 13:05:52',0,NULL,NULL),(15,'admin@naver.com','자바스크립트','lee','','','','자바스크립트','웹개발','웹개발','','inf_51.png,null,null,null',50000,0,0,1,'2020-05-09 13:06:25','2020-05-09 13:06:25',0,NULL,NULL),(19,'qsz78547@naver.com','asdasd','asdasd/','asdasd/','asdas/','asdasd','<p>asdasd</p>','IT프로그래밍','','입문','stainsort.png',3000,0,0,0,'2020-05-19 09:11:31','2020-05-19 09:11:31',0,NULL,NULL);
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
  `m_emailHash` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_emailCheck` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`m_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin@naver.com','cjswo15935778','2020-05-10 08:25:09',NULL,NULL,NULL,'정회원',NULL,'4f96c32aaa821492',1),('mimimido12@naver.com','1234','2020-05-11 02:07:51',NULL,NULL,NULL,'비회원',NULL,'1e5653d53da40af7',1),('qsz78547@naver.com','1234','2020-05-10 08:25:09',NULL,NULL,NULL,'정회원',NULL,'4f96c32aaa821492',1);
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
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
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
  PRIMARY KEY (`o_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
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
INSERT INTO `q_board` VALUES (1,1,' 자동완성 기능','html:5 탭해도 자동완성 이 안되는데 따로 설정해주어야하나요?',' holy_now ',0,0,0,'2020-05-08 05:39:09');
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
  `r_content` text NOT NULL,
  `r_writer` varchar(45) NOT NULL,
  `r_rating` int(11) NOT NULL DEFAULT '1',
  `r_re_lev` int(11) NOT NULL DEFAULT '0',
  `r_re_ref` int(11) NOT NULL DEFAULT '0',
  `r_re_seq` int(11) NOT NULL DEFAULT '0',
  `r_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`r_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_board`
--

LOCK TABLES `r_board` WRITE;
/*!40000 ALTER TABLE `r_board` DISABLE KEYS */;
INSERT INTO `r_board` VALUES (1,1,'ssss','변재정',5,0,0,0,'2020-05-11 08:24:57'),(2,1,'ㄴㄴㄴㄴㄴ','변재정',3,0,0,0,'2020-05-11 08:26:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (2,'test',2,'2020-05-09 11:55:58'),(3,'test',3,'2020-05-11 03:56:53'),(4,'qsz78547@naver.com',1,'2020-05-18 01:47:54');
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

-- Dump completed on 2020-05-19 19:05:59
