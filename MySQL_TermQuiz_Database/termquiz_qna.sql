-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: termquiz
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qnaNo` int NOT NULL AUTO_INCREMENT,
  `qnaId` varchar(20) NOT NULL,
  `qnaTitle` varchar(100) NOT NULL,
  `qnaContent` varchar(1000) NOT NULL,
  `qnaAnswer` varchar(300) DEFAULT NULL,
  `qnaTime` date NOT NULL,
  `extra` varchar(45) DEFAULT NULL,
  `extra2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`qnaNo`),
  KEY `qnaid_idx` (`qnaId`),
  CONSTRAINT `qnaid` FOREIGN KEY (`qnaId`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (31,'test','hwerhwah','Hshagsahshfdgfdg',NULL,'2022-11-24',NULL,NULL),(33,'test','gsegsegsegse','gsdgshsgsfdgsg\r\n\r\nsg','asdsa','2022-11-24',NULL,NULL),(34,'test','asdasdwqd','dqwd<br>wqd<br>wqd<br>wqd<br>wqd<br><br>wqd<br>qw<br>wq<br>dq<br>wfwq<br>g<br>q<br>gwq<br>gq<br>wg<br>wqg<br>wqg<br>wg<br>wq<br>gqwg<br>wqg<br>wq<br>gwq<br>g<br>g<br>qgq<br>wg<br>q<br>gwqg',NULL,'2022-11-24',NULL,NULL),(36,'test12','test','test',NULL,'2022-11-28',NULL,NULL),(37,'test','fwf','asfsafasf',NULL,'2022-12-02',NULL,NULL),(38,'test','wegwa','gwaegeag',NULL,'2022-12-02',NULL,NULL),(39,'test','aegsdg','ag',NULL,'2022-12-02',NULL,NULL),(40,'test','wegwegweg','wgeweg',NULL,'2022-12-02',NULL,NULL),(41,'test','wegwegweg','wegweg',NULL,'2022-12-02',NULL,NULL),(42,'test','wegweg','wegweg',NULL,'2022-12-02',NULL,NULL),(43,'test','wegweg','wegweg',NULL,'2022-12-02',NULL,NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05  9:56:45
