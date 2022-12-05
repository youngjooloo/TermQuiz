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
-- Table structure for table `musicq`
--

DROP TABLE IF EXISTS `musicq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicq` (
  `musicqNo` int NOT NULL AUTO_INCREMENT,
  `musicqAnswer` varchar(45) NOT NULL,
  `musicqHint1` varchar(200) NOT NULL,
  `musicqHint2` varchar(200) NOT NULL,
  `musicqHint3` varchar(200) NOT NULL,
  `musicqHint4` varchar(200) NOT NULL,
  `musicqHint5` varchar(200) NOT NULL,
  `extra` varchar(45) DEFAULT NULL,
  `extra2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`musicqNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicq`
--

LOCK TABLES `musicq` WRITE;
/*!40000 ALTER TABLE `musicq` DISABLE KEYS */;
INSERT INTO `musicq` VALUES (1,'잊어야 한다는 마음으로','resources/quizhint/music/music1/hint1.mp3','resources/quizhint/music/music1/hint2.jpg','resources/quizhint/music/music1/hint3.png','resources/quizhint/music/music1/hint4.png','resources/quizhint/music/music1/hint5.jpg',NULL,NULL),(2,'pray','resources/quizhint/music/music2/hint4.mp3','resources/quizhint/music/music2/hint1.jpg','resources/quizhint/music/music2/hint5.png','resources/quizhint/music/music2/hint3.png','resources/quizhint/music/music2/hint2.png',NULL,NULL),(3,'see you again','resources/quizhint/music/music3/hint4.mp3','resources/quizhint/music/music3/hint1.jpg','resources/quizhint/music/music3/hint5.png','resources/quizhint/music/music3/hint3.png','resources/quizhint/music/music3/hint2.png',NULL,NULL),(4,'너에게 난 나에게 넌','resources/quizhint/music/music4/hint4.mp3','resources/quizhint/music/music4/hint1.png','resources/quizhint/music/music4/hint5.png','resources/quizhint/music/music4/hint3.png','resources/quizhint/music/music4/hint2.png',NULL,NULL),(5,'say yes','resources/quizhint/music/music5/hint5.mp3','resources/quizhint/music/music5/hint1.jpg','resources/quizhint/music/music5/hint4.jpg','resources/quizhint/music/music5/hint2.jpg','resources/quizhint/music/music5/hint3.jpg',NULL,NULL),(6,'Nessun dorma,네순 도르마','resources/quizhint/music/music6/hint5.mp3','resources/quizhint/music/music6/hint1.jpg','resources/quizhint/music/music6/hint3.jpg','resources/quizhint/music/music6/hint2.jpg','resources/quizhint/music/music6/hint4.jpg',NULL,NULL),(7,'돌덩이','resources/quizhint/music/music7/hint5.mp3','resources/quizhint/music/music7/hint1.jpg','resources/quizhint/music/music7/hint3.jpg','resources/quizhint/music/music7/hint2.jpg','resources/quizhint/music/music7/hint4.jpg',NULL,NULL),(8,'소녀','resources/quizhint/music/music8/hint5.mp3','resources/quizhint/music/music8/hint1.jpg','resources/quizhint/music/music8/hint4.jpg','resources/quizhint/music/music8/hint2.jpg','resources/quizhint/music/music8/hint3.jpg',NULL,NULL),(9,'해요','resources/quizhint/music/music9/hint5.mp3','resources/quizhint/music/music9/hint1.jpg','resources/quizhint/music/music9/hint4.jpg','resources/quizhint/music/music9/hint2.jpg','resources/quizhint/music/music9/hint3.jpg',NULL,NULL),(10,'첫 눈처럼 너에게 가겠다','resources/quizhint/music/music10/hint5.mp3','resources/quizhint/music/music10/hint1.jpg','resources/quizhint/music/music10/hint4.jpg','resources/quizhint/music/music10/hint2.jpg','resources/quizhint/music/music10/hint3.jpg',NULL,NULL);
/*!40000 ALTER TABLE `musicq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05  9:56:44
