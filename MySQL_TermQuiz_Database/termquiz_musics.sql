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
-- Table structure for table `musics`
--

DROP TABLE IF EXISTS `musics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musics` (
  `musicqNo` int NOT NULL,
  `musicqId` varchar(20) NOT NULL,
  `score` int NOT NULL,
  `extra` varchar(45) DEFAULT NULL,
  `extra2` varchar(45) DEFAULT NULL,
  KEY `qno_idx` (`musicqNo`),
  KEY `musicsid_idx` (`musicqId`),
  CONSTRAINT `musicsid` FOREIGN KEY (`musicqId`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `musicsqno` FOREIGN KEY (`musicqNo`) REFERENCES `musicq` (`musicqNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musics`
--

LOCK TABLES `musics` WRITE;
/*!40000 ALTER TABLE `musics` DISABLE KEYS */;
INSERT INTO `musics` VALUES (1,'test12',1,NULL,NULL),(2,'test12',1,NULL,NULL),(3,'test12',1,NULL,NULL),(4,'test12',1,NULL,NULL),(5,'test12',1,NULL,NULL),(6,'test12',1,NULL,NULL),(7,'test12',1,NULL,NULL),(8,'test12',5,NULL,NULL),(9,'test12',10,NULL,NULL),(10,'test12',10,NULL,NULL),(1,'testtest',10,NULL,NULL),(2,'testtest',10,NULL,NULL),(3,'testtest',10,NULL,NULL),(4,'testtest',10,NULL,NULL),(5,'testtest',10,NULL,NULL),(6,'testtest',7,NULL,NULL),(7,'testtest',10,NULL,NULL),(8,'testtest',10,NULL,NULL),(1,'test',1,NULL,NULL),(2,'test',1,NULL,NULL),(3,'test',1,NULL,NULL),(4,'test',5,NULL,NULL),(5,'test',1,NULL,NULL);
/*!40000 ALTER TABLE `musics` ENABLE KEYS */;
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
