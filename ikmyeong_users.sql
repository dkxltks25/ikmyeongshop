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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `usernumber` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(14) DEFAULT NULL,
  `userpassword` varchar(12) DEFAULT NULL,
  `useremail` varchar(50) DEFAULT NULL,
  `userphone` char(12) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `userZipcode` varchar(5) DEFAULT NULL,
  `userAdress` varchar(50) DEFAULT NULL,
  `userAdress1` varchar(45) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAT` datetime DEFAULT NULL,
  PRIMARY KEY (`usernumber`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1234','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'12345','1234','1234','01041645367','1234','1234','1234',NULL,'2019-11-19 02:35:00','2019-11-19 02:35:00'),(5,'1219759300',NULL,'dkxltks25@naver.com',NULL,'박재홍',NULL,NULL,NULL,'2019-11-29 22:43:18','2019-11-29 22:43:18'),(6,'1227995662',NULL,'heg1308@naver.com',NULL,'임정진',NULL,NULL,NULL,'2019-12-03 16:58:39','2019-12-03 16:58:39'),(7,'1228043345',NULL,'wogus6969@naver.com',NULL,'김재현',NULL,NULL,NULL,'2019-12-03 18:01:48','2019-12-03 18:01:48'),(8,'1229951190',NULL,'hhero@kakao.com',NULL,'황영웅',NULL,NULL,NULL,'2019-12-06 10:52:47','2019-12-06 10:52:47'),(9,'1230916600',NULL,'tlsgpdud1541@naver.com',NULL,'신혜영',NULL,NULL,NULL,'2019-12-07 17:26:52','2019-12-07 17:26:52'),(10,'1233699329',NULL,'yklee0406@naver.com',NULL,'이왕근',NULL,NULL,NULL,'2019-12-11 15:48:49','2019-12-11 15:48:49'),(11,'dkxltks2','qkrwoghd99!','dkxltks25@naver.com','01041645367','박재홍','12345','12345',NULL,'2019-12-13 02:50:21','2019-12-13 02:50:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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