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
-- Table structure for table `movieq`
--

DROP TABLE IF EXISTS `movieq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieq` (
  `movieqNo` int NOT NULL AUTO_INCREMENT,
  `movieqAnswer` varchar(45) NOT NULL,
  `movieqHint1` varchar(200) NOT NULL,
  `movieqHint2` varchar(200) NOT NULL,
  `movieqHint3` varchar(200) NOT NULL,
  `movieqHint4` varchar(200) NOT NULL,
  `movieqHint5` varchar(200) NOT NULL,
  `extra` varchar(45) DEFAULT NULL,
  `extra2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`movieqNo`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieq`
--

LOCK TABLES `movieq` WRITE;
/*!40000 ALTER TABLE `movieq` DISABLE KEYS */;
INSERT INTO `movieq` VALUES (1,'대부, God father','resources/quizhint/movie/movie1/hint1.jpg','resources/quizhint/movie/movie1/hint2.jpg','resources/quizhint/movie/movie1/hint3.jpg','resources/quizhint/movie/movie1/hint4.mp3','resources/quizhint/movie/movie1/hint5.jpg',NULL,NULL),(2,'내부자들','resources/quizhint/movie/movie2/hint1.jpg','resources/quizhint/movie/movie2/hint2.jpg','resources/quizhint/movie/movie2/hint3.jpg','resources/quizhint/movie/movie2/hint4.mp3','resources/quizhint/movie/movie2/hint5.jpg',NULL,NULL),(3,'아이언맨, Iron Man','resources/quizhint/movie/movie3/hint1.jpg','resources/quizhint/movie/movie3/hint2.jpg','resources/quizhint/movie/movie3/hint3.jpg','resources/quizhint/movie/movie3/hint4.mp3','resources/quizhint/movie/movie3/hint5.jpg',NULL,NULL),(4,'테이큰, Taken','resources/quizhint/movie/movie4/hint1.jpg','resources/quizhint/movie/movie4/hint2.jpg','resources/quizhint/movie/movie4/hint3.jpg','resources/quizhint/movie/movie4/hint4.mp3','resources/quizhint/movie/movie4/hint5.jpg',NULL,NULL),(5,'태극기 휘날리며','resources/quizhint/movie/movie5/hint1.jpg','resources/quizhint/movie/movie5/hint2.jpg','resources/quizhint/movie/movie5/hint3.jpg','resources/quizhint/movie/movie5/hint4.mp3','resources/quizhint/movie/movie5/hint5.jpg',NULL,NULL),(6,'터미네이터, Terminator','resources/quizhint/movie/movie6/hint1.jpg','resources/quizhint/movie/movie6/hint2.jpg','resources/quizhint/movie/movie6/hint3.jpg','resources/quizhint/movie/movie6/hint4.mp3','resources/quizhint/movie/movie6/hint5.png',NULL,NULL),(7,'트랜스포머, Transformers','resources/quizhint/movie/movie7/hint1.jpg','resources/quizhint/movie/movie7/hint2.jpg','resources/quizhint/movie/movie7/hint3.jpg','resources/quizhint/movie/movie7/hint4.mp3','resources/quizhint/movie/movie7/hint5.png',NULL,NULL),(8,'레미제라블, Les Misérables','resources/quizhint/movie/movie8/hint1.jpg','resources/quizhint/movie/movie8/hint2.png','resources/quizhint/movie/movie8/hint3.jpg','resources/quizhint/movie/movie8/hint4.mp3','resources/quizhint/movie/movie8/hint5.jpg',NULL,NULL),(9,'쉬리','resources/quizhint/movie/movie9/hint1.jpg','resources/quizhint/movie/movie9/hint2.png','resources/quizhint/movie/movie9/hint3.jpg','resources/quizhint/movie/movie9/hint4.mp3','resources/quizhint/movie/movie9/hint5.jpg',NULL,NULL),(10,'토이스토리, Toy Story','resources/quizhint/movie/movie10/hint1.jpg','resources/quizhint/movie/movie10/hint2.png','resources/quizhint/movie/movie10/hint3.jpg','resources/quizhint/movie/movie10/hint4.mp3','resources/quizhint/movie/movie10/hint5.jpg',NULL,NULL);
/*!40000 ALTER TABLE `movieq` ENABLE KEYS */;
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
