-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: ikmyeong
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(10) NOT NULL,
  `productgrade` char(1) DEFAULT NULL,
  `productId` varchar(8) NOT NULL,
  `reviewtitle` varchar(50) DEFAULT NULL,
  `reviewcontent` varchar(255) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  `reviewCount` int(11) DEFAULT '0',
  `reviewParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewId`,`UserId`,`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:10:40','2019-11-25 17:10:40',0,NULL),(2,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:26:23','2019-11-25 17:26:23',2,NULL),(3,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:26:23','2019-11-25 17:26:23',0,NULL),(5,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:26:24','2019-11-25 17:26:24',2,NULL),(6,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:26:24','2019-11-25 17:26:24',0,NULL),(7,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:26:24','2019-11-25 17:26:24',0,NULL),(8,'12345','5','1','상품후기 테스트','테스트상품후기입니다','2019-11-25 17:26:41','2019-11-25 17:26:41',2,NULL),(9,'1219759300','5','6','1234','TestTestTest','2019-12-02 19:50:02','2019-12-02 19:50:02',1,NULL),(10,'1219759300','5','6','익명이 카와이잉 ','아아앗 카와이이잉','2019-12-02 19:51:58','2019-12-02 19:51:58',2,NULL),(11,'1219759300','4','7','1234','123312','2019-12-02 20:47:45','2019-12-02 20:47:45',4,NULL),(12,'1227995662','1','1','TEst','TEst','2019-12-03 16:59:52','2019-12-03 16:59:52',4,NULL),(13,'1228043345','5','6','네이스네이스 ','믿고있었다구','2019-12-03 18:03:12','2019-12-03 18:03:12',5,NULL),(14,'1228043345','5','6','네이스네이스','네이스네이스 ','2019-12-03 18:03:31','2019-12-03 18:03:31',3,NULL),(15,'1228043345','5','6','네이스네이스','쥐엔장 믿고있었다구','2019-12-03 18:05:24','2019-12-03 18:05:24',6,NULL),(16,'1230916600','5','6','오우 너ㅁ나 \\','테스트테스트\r\n','2019-12-07 17:30:37','2019-12-07 17:30:37',0,NULL),(17,'12345','5','7','익명이 너무 기여워영','으아아아아아아아아아ㅏ아아아아아아아아아앙아ㅏㅇ아ㅏ아앙앙 ','2019-12-08 22:08:55','2019-12-08 22:08:55',2,NULL),(18,'12345','5','7','익명이 너무 기여워영','으아아아아아아아아아ㅏ아아아아아아아아아앙아ㅏㅇ아ㅏ아앙앙 ','2019-12-08 22:08:55','2019-12-08 22:08:55',1,NULL),(19,'12345','5','7','익명이 너무 기여워영','아으ㅏㅡ아ㅣ믄ㅇ;ㅡㅁ니아ㅡ','2019-12-08 22:11:42','2019-12-08 22:11:42',0,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13  4:34:59
