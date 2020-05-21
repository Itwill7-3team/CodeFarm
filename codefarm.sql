<<<<<<< HEAD
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
  `o_t_b_num` varchar(45) DEFAULT NULL,
  `o_status` int(11) DEFAULT '0',
  `o_t_b_reg_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`o_num`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (8,'20200520-8',50000,3,'Phython','qsz78547@naver.com','무통장 입금','shinhan','조수아','2020-05-20 08:23:07',50000,NULL,0,NULL),(9,'20200520-8',50000,2,'Nodejs','qsz78547@naver.com','무통장 입금','shinhan','조수아','2020-05-20 08:23:07',50000,NULL,0,NULL),(10,'20200521-10',50000,15,'자바스크립트','qsz78547@naver.com','무통장 입금','카카오뱅크','코딩이','2020-05-21 07:31:49',50000,'0',NULL,'2020-05-21 17:01:49'),(11,'20200521-11',50000,2,'Nodejs','qsz78547@naver.com','무통장 입금','하나은행','11','2020-05-21 09:14:50',50000,'0',NULL,'2020-05-21 18:44:50');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
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

-- Dump completed on 2020-05-21 18:37:08
=======
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (4,'test',5,'2020-05-09 12:32:06',50000,'react'),(12,'admin@naver.com',12,'2020-05-21 08:31:37',50000,'머신러닝'),(15,'qsz78547@naver.com',2,'2020-05-21 09:31:32',50000,'Nodejs'),(16,'qsz78547@naver.com',4,'2020-05-21 09:31:41',50000,'vue.js'),(19,'qsz78547@naver.com',3,'2020-05-21 09:32:26',50000,'Phython');
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
  `l_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'askAnswer','제목1','내용1','작성자1',0,0,0,'2020-05-05 06:54:59',1),(2,'askAnswer','제목2','내용2','작성자2',0,0,0,'2020-05-05 06:54:59',2),(3,'askss','제목3','내용3','작성자3',0,0,0,'2020-05-05 06:55:27',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'admin@naver.com','SpringFrameWork','lee','','','','SpringFrameWork','웹개발','웹개발','','lect_64.png',50000,0,0,1,'2020-05-09 09:32:04','2020-05-09 09:32:04',0,NULL,NULL),(2,'admin@naver.com','Nodejs','lee','','','','Nodejs','웹개발','웹개발','','lect_71.png',50000,0,0,1,'2020-05-09 09:36:49','2020-05-09 09:36:49',0,NULL,NULL),(3,'admin@naver.com','Phython','lee','','','','Phython','웹개발','웹개발','','lect_81.png',50000,0,0,1,'2020-05-09 09:42:57','2020-05-09 09:42:57',0,NULL,NULL),(4,'admin@naver.com','vue.js','lee','','','','vue.js','웹개발','웹개발','','lect_91.png',50000,0,0,1,'2020-05-09 09:43:13','2020-05-09 09:43:13',0,NULL,NULL),(5,'admin@naver.com','react','lee','','','','react','웹개발','웹개발','','lect_101.png',50000,0,0,1,'2020-05-09 09:43:29','2020-05-09 09:43:29',0,NULL,NULL),(6,'admin@naver.com','Java','lee','','','','Java','웹개발','웹개발','','lect_11.png',50000,0,0,1,'2020-05-09 09:45:03','2020-05-09 09:45:03',0,NULL,NULL),(7,'admin@naver.com','lecture','lee','','','','lecture','웹개발','웹개발','','lect_21.png',50000,0,0,1,'2020-05-09 09:45:23','2020-05-09 09:45:23',0,NULL,NULL),(8,'admin@naver.com','lecture','lee','','','','lecture','웹개발','웹개발','','lect_31.png',50000,0,0,1,'2020-05-09 09:45:33','2020-05-09 09:45:33',0,NULL,NULL),(9,'admin@naver.com','html&css3','lee','','','','html&css3','웹개발','웹개발','','lect_41.png',50000,0,0,1,'2020-05-09 09:45:54','2020-05-09 09:45:54',0,NULL,NULL),(10,'admin@naver.com','lecture','lee','','','','lecture','웹개발','웹개발','','lect_51.png',50000,0,0,1,'2020-05-09 09:46:14','2020-05-09 09:46:14',0,NULL,NULL),(11,'admin@naver.com','알고리즘','lee','','','','알고리즘','알고리즘','알고리즘','','inf_11.png',50000,0,0,1,'2020-05-09 09:46:57','2020-05-09 09:46:57',0,NULL,NULL),(12,'admin@naver.com','머신러닝','lee','','','','머신러닝','머신러닝','머신러닝','','inf_21.png',50000,0,0,1,'2020-05-09 09:47:24','2020-05-09 09:47:24',0,NULL,NULL),(13,'admin@naver.com','포토샵','lee','','','','포토샵','포토샵','포토샵','','inf_31.png',50000,0,0,1,'2020-05-09 13:05:20','2020-05-09 13:05:20',0,NULL,NULL),(14,'admin@naver.com','C언어','lee','','','','C언어','C','C','','inf_41.png',50000,0,0,1,'2020-05-09 13:05:52','2020-05-09 13:05:52',0,NULL,NULL),(15,'admin@naver.com','자바스크립트','lee','','','','자바스크립트','웹개발','웹개발','','inf_51.png',50000,0,0,1,'2020-05-09 13:06:25','2020-05-09 13:06:25',0,NULL,NULL),(19,'qsz78547@naver.com','asdasd','asdasd/','asdasd/','asdas/','asdasd','<p>asdasd</p>','IT프로그래밍','','입문','stainsort.png',3000,0,0,0,'2020-05-19 09:11:31','2020-05-19 09:11:31',0,NULL,NULL),(20,'qsz78547@naver.com','','','','','','<p><br></p>','undefined','','입문','업로드 할 파일을 선택해주세요',0,0,0,0,'2020-05-20 00:24:27','2020-05-20 00:24:27',0,NULL,NULL),(21,'qsz78547@naver.com','김왼손의 미운코딩새끼: 4시간만에 끝내는 파이썬 기초 (전자책 포함)','파이썬의 기초를 쉽게 배울 수 있습니다./파이썬이 뭔지, 코딩이 뭔지 감을 잡게 됩니다./혼자서도 코딩을 공부할 수 있는 법을 배웁니다./다음 단계를 위한 준비를 할 수 있습니다./컴퓨터처럼 문제를 해결하는 방법을 배웁니다./나도 할 수 있다는 자신감을 얻게 됩니다.','코딩을 한 번도 해본 적 없는 분/아무리 열심히 해도 코딩이 어려운 분/코딩이라는게 뭔지 맛보고 싶은 분/반복되는 포기로 코딩이 미워지려고 하는 분','HTML/CSS/Javascript','대학 새내기 시절 코딩이 너무 어려웠습니다. 잘해보려 아등바등 노력해 봤지만 매번 실패하다가 결국 미워하게돼버렸습니다. 지금 돌아보면 그렇게 미워할 정도는 아니었는데 말이죠. 지금도 저와 같은 고민을 하는 분들이 많을','<div class=\"iframe_container\" style=\"padding:56.25% 0 0 0; position: relative;\"> <iframe src=\"https://www.youtube.com/embed/UrwFkNRzzT4?list=PLGPF8gvWLYyontH0PECIUFFUdvATXWQEL?rel=0&amp;modestbranding=1&amp;vq=hd720\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen=\"allowfullscreen\" style=\"position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px; height: 100%; width: 100%;\" data-gtm-yt-inspected-8964582_7=\"true\" id=\"669956749\"></iframe></div><div><h2>김왼손의 한입에 쏙 파이썬 - 파이썬 입문</h2>한입에 쏙 파이썬은 미운코딩새끼의 업그레이드 버전 강의입니다. 자세한 내용은 <a href=\"https://www.inflearn.com/course/%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EC%9E%85%EB%AC%B8-hello-coding/\"> [저자직강]	Hello Coding 한입에 쏙 파이썬: 크리에이터 김왼손의 쉽고 빠른 파이썬 강의</a>에서 확인하실 수	있습니다.=====&nbsp;<div class=\"iframe_container\" style=\"padding:56.25% 0 0 0; position: relative;\"> <iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/c2mpe9Xcp0I?rel=0&amp;modestbranding=1&amp;vq=hd720\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\" style=\"position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px; height: 100%; width: 100%;\" data-gtm-yt-inspected-8964582_7=\"true\" id=\"830993609\"></iframe></div> * 인스타그램 김왼손(<a href=\"https://www.instagram.com/lefty_khim/\">@lefty_khim</a>)을 팔로우하세요!* 미운코딩새끼 전자책 ▶ <a href=\"https://wikidocs.net/book/1421\" target=\"_blank\" rel=\"noopener\">https://wikidocs.net/book/1421</a> * 더 많은 무료 강의 ▶ <a href=\"https://goo.gl/AwAwUT\" target=\"_blank\" rel=\"noopener\">https://goo.gl/AwAwUT</a><h3></h3> 대학 새내기 시절 코딩이 너무 어려웠습니다. 잘해보려 아등바등 노력해 봤지만 매번 실패하다가 결국 미워하게돼버렸습니다. 지금 돌아보면 그렇게 미워할 정도는 아니었는데 말이죠. 지금도 저와 같은 고민을 하는 분들이 많을 거라고 생각합니다. 그 때 그 시절 이런 강의가 있었으면 어땠을까 하는 마음으로 만든 강의가 바로미운코딩새끼입니다.미운코딩새끼는 코딩이 너무 어려워 포기한 분, 또는 코딩을 처음 접하는 분을 위한 강의입니다.?파이썬이라는 프로그래밍 언어의 기초 문법을 쉽게 배울 수 있습니다. 코딩을 왜 배워야 하는지, 왜필요한지에 대해서 답을 주지는 않지만?코딩이란 이런 거구나, 파이썬이란 이런 거구나 하는 정도의 감을 잡을 수?있습니다.코딩은 쉽지 않습니다. 그렇기 때문에 처음 시작하는 분들에게는 정말 쉬운 강의가 필요합니다.미운코딩새끼는 파이썬의 모든 것을 가르쳐 주지 않습니다. 대신?가장?중요하고 자주 쓰는 문법만 빠르고 가볍게 다룹니다. 코딩을 처음 접하는?분들도 단숨에 끝낼 수 있습니다. 과정 후 파이썬을 더 공부할 마음이 든다면혼자서 얼마든지 공부할 수 있습니다.자, 그럼 이제 잉끼유튜버 김왼손과 함께 파이썬의 매력속으로?풍덩?빠져볼까요? :^)','IT프로그래밍','프로그래밍 언어','','lect_8.png',50000,0,0,1,'2020-05-21 06:37:06','2020-05-21 06:37:06',12053,NULL,NULL);
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
  `m_nick` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_addr` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_rank` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `member` VALUES ('admin@naver.com','12345','2020-05-10 08:25:09','admin','admin',NULL,NULL,3,'자신을 소개를 해주세요.\r\n            	','4f96c32aaa821492',1),('mimimido12@naver.com','1234','2020-05-11 02:07:51','민수','mimimido12',NULL,NULL,0,NULL,'1e5653d53da40af7',1),('qsz78547@naver.com','1234','2020-05-10 08:25:09','변재정','까군',NULL,NULL,2,'자신을 소개를 해주세요.\r\n            	','4f96c32aaa821492',1);
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
  `o_t_b_num` varchar(45) DEFAULT NULL,
  `o_status` int(11) DEFAULT '0',
  `o_t_b_reg_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`o_num`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (8,'20200520-8',50000,3,'Phython','qsz78547@naver.com','무통장 입금','shinhan','조수아','2020-05-20 08:23:07',50000,NULL,0,NULL),(9,'20200520-8',50000,2,'Nodejs','qsz78547@naver.com','무통장 입금','shinhan','조수아','2020-05-20 08:23:07',50000,NULL,0,NULL),(10,'20200521-10',50000,15,'자바스크립트','qsz78547@naver.com','무통장 입금','카카오뱅크','코딩이','2020-05-21 07:31:49',50000,'0',NULL,'2020-05-21 17:01:49'),(11,'20200521-11',50000,2,'Nodejs','qsz78547@naver.com','무통장 입금','하나은행','11','2020-05-21 09:14:50',50000,'0',NULL,'2020-05-21 18:44:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (16,'qsz78547@naver.com',1,'2020-05-21 09:28:49'),(17,'qsz78547@naver.com',4,'2020-05-21 09:31:41'),(18,'qsz78547@naver.com',5,'2020-05-21 09:31:50'),(19,'qsz78547@naver.com',21,'2020-05-21 09:31:55'),(20,'qsz78547@naver.com',3,'2020-05-21 09:32:25');
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

-- Dump completed on 2020-05-21 18:38:59
>>>>>>> branch 'Team2' of https://github.com/Itwill7-3team/CodeFarm.git
