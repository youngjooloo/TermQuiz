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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bNo` int NOT NULL AUTO_INCREMENT,
  `bId` varchar(20) NOT NULL,
  `bTitle` varchar(100) NOT NULL,
  `bContent` varchar(1000) NOT NULL,
  `bTime` datetime NOT NULL,
  `bCount` int NOT NULL DEFAULT '0',
  `extra` varchar(45) DEFAULT NULL,
  `extra2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bNo`),
  KEY `bno_idx` (`bNo`),
  KEY `boardid_idx` (`bId`),
  CONSTRAINT `boardid` FOREIGN KEY (`bId`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (15,'test','sdhsdhs','22','2022-11-24 13:28:12',34,NULL,NULL),(16,'hikim95','sfsdfsdf','sfsdfsdfsf','2022-11-24 15:28:14',32,NULL,NULL),(17,'hikim95','sdgsgsdgsdgsg','sg','2022-11-24 15:28:18',27,NULL,NULL),(18,'testtest','ddd','ddd','2022-11-24 16:14:27',15,NULL,NULL),(19,'testtest','ddd','ddd','2022-11-24 16:14:31',20,NULL,NULL),(20,'testtest','ggg','ggg','2022-11-24 16:14:36',39,NULL,NULL),(22,'test','gsgsdg','sdgsdgsd','2022-11-25 13:59:13',15,NULL,NULL),(23,'test','56756','757','2022-11-25 14:16:42',15,NULL,NULL),(24,'test','test','test','2022-11-28 11:17:04',71,NULL,NULL),(26,'test','wetwet','wwetwet','2022-12-02 15:43:35',24,NULL,NULL),(27,'test','wetwet','wetwet','2022-12-02 15:43:41',20,NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
