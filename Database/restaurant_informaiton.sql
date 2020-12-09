-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurantinformation
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `contact_method`
--

DROP TABLE IF EXISTS `contact_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeOfContact` varchar(10) DEFAULT NULL,
  `theContact` varchar(50) DEFAULT NULL,
  `restaurant_ID` int NOT NULL,
  `location_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_restaurant_ID` (`restaurant_ID`),
  KEY `location_ID` (`location_ID`),
  CONSTRAINT `contact_method_ibfk_1` FOREIGN KEY (`location_ID`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_restaurant_ID` FOREIGN KEY (`restaurant_ID`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_method`
--

LOCK TABLES `contact_method` WRITE;
/*!40000 ALTER TABLE `contact_method` DISABLE KEYS */;
INSERT INTO `contact_method` VALUES (1,'phone','814-899-4611',1,1),(2,'phone','814-455-0640',1,2),(3,'phone','814-825-5897',1,3),(4,'phone','814-868-8557',2,4),(5,'phone','814-898*1212',3,5),(6,'phone','814-864-0497',3,6),(7,'phone','814-824-8282',4,7),(8,'phone','814-864-8282',4,8),(9,'phone','814-864-9494',5,9);
/*!40000 ALTER TABLE `contact_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_of_the_week` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` VALUES (1,'M'),(2,'T'),(3,'W'),(4,'TR'),(5,'F'),(6,'SA'),(7,'SU');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dinning_options`
--

DROP TABLE IF EXISTS `dinning_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dinning_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_method` varchar(15) DEFAULT NULL,
  `restaurant_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_ID` (`restaurant_ID`),
  CONSTRAINT `dinning_options_ibfk_1` FOREIGN KEY (`restaurant_ID`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dinning_options`
--

LOCK TABLES `dinning_options` WRITE;
/*!40000 ALTER TABLE `dinning_options` DISABLE KEYS */;
INSERT INTO `dinning_options` VALUES (1,'Dine in',1),(2,'Dine in',2),(3,'Dine in',3),(4,'Dine in',5),(5,'Carry-out',1),(6,'Carry-out',2),(7,'Carry-out',3),(8,'Carry-out',4),(9,'Carry-out',5),(20,'Delivery',4);
/*!40000 ALTER TABLE `dinning_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_ID` int DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_ID` (`restaurant_ID`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`restaurant_ID`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,'4186 Buffalo Rd','Erie','PA',16510),(2,1,'105 E 12th St','Erie','PA',16501),(3,1,'5902 Wattsburg Rd','Erie','PA',16509),(4,2,'7160 Peach St','Erie','PA',16509),(5,3,'434 Buffalo Road','Erie','PA',16510),(6,3,'4403 Peach Street','Erie','PA',16509),(7,4,'1713 E 38th ST','Erie','PA',16510),(8,4,'3870 peach St','Erie','PA',16509),(9,5,'7475 Peach St','Erie','PA',16509);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operating_hours`
--

DROP TABLE IF EXISTS `operating_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operating_hours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_ID` int DEFAULT NULL,
  `day_open_ID` int DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_ID` (`restaurant_ID`),
  KEY `day_open_ID` (`day_open_ID`),
  KEY `location_ID` (`location_ID`),
  CONSTRAINT `operating_hours_ibfk_1` FOREIGN KEY (`restaurant_ID`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `operating_hours_ibfk_2` FOREIGN KEY (`day_open_ID`) REFERENCES `days` (`id`),
  CONSTRAINT `operating_hours_ibfk_3` FOREIGN KEY (`location_ID`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operating_hours`
--

LOCK TABLES `operating_hours` WRITE;
/*!40000 ALTER TABLE `operating_hours` DISABLE KEYS */;
INSERT INTO `operating_hours` VALUES (125,5,1,'15:00:00','21:30:00',9),(126,5,2,'15:00:00','21:30:00',9),(127,5,3,'15:00:00','21:30:00',9),(128,5,4,'15:00:00','21:30:00',9),(129,5,5,'11:30:00','22:00:00',9),(130,5,6,'11:30:00','22:00:00',9),(131,5,7,'11:30:00','21:30:00',9),(132,1,1,'06:30:00','22:00:00',1),(133,1,2,'06:30:00','22:00:00',1),(134,1,3,'06:30:00','22:00:00',1),(135,1,4,'06:30:00','22:00:00',1),(136,1,5,'06:30:00','22:00:00',1),(137,1,6,'06:30:00','22:00:00',1),(138,1,7,'08:00:00','22:00:00',1),(139,1,1,'06:30:00','01:00:00',2),(140,1,2,'06:30:00','01:00:00',2),(141,1,3,'06:30:00','01:00:00',2),(142,1,4,'06:30:00','01:00:00',2),(143,1,5,'06:30:00','01:00:00',2),(144,1,6,'06:30:00','01:00:00',2),(145,1,7,'06:30:00','01:00:00',2),(146,1,1,'06:30:00','01:00:00',3),(147,1,2,'06:30:00','01:00:00',3),(148,1,3,'06:30:00','01:00:00',3),(149,1,4,'06:30:00','01:00:00',3),(150,1,5,'06:30:00','00:00:00',3),(151,1,6,'06:30:00','00:00:00',3),(152,1,7,'06:30:00','01:00:00',3),(153,2,1,'06:30:00','22:00:00',4),(154,2,2,'06:30:00','22:00:00',4),(155,2,3,'06:30:00','22:00:00',4),(156,2,4,'06:30:00','22:00:00',4),(157,2,5,'06:30:00','22:00:00',4),(158,2,6,'06:30:00','22:00:00',4),(159,3,1,'07:00:00','22:00:00',5),(160,3,2,'07:00:00','22:00:00',5),(161,3,3,'07:00:00','22:00:00',5),(162,3,4,'07:00:00','22:00:00',5),(163,3,5,'07:00:00','22:00:00',5),(164,3,6,'07:00:00','22:00:00',5),(165,3,7,'07:00:00','22:00:00',5),(166,3,1,'07:00:00','22:00:00',6),(167,3,2,'07:00:00','22:00:00',6),(168,3,3,'07:00:00','22:00:00',6),(169,3,4,'07:00:00','22:00:00',6),(170,3,5,'07:00:00','22:00:00',6),(171,3,6,'07:00:00','22:00:00',6),(172,3,7,'07:00:00','22:00:00',6),(173,4,1,'09:45:00','23:30:00',7),(174,4,2,'09:45:00','23:30:00',7),(175,4,3,'09:45:00','23:30:00',7),(176,4,4,'09:45:00','23:30:00',7),(177,4,5,'09:45:00','00:30:00',7),(178,4,6,'09:45:00','00:30:00',7),(179,4,7,'09:45:00','23:30:00',7),(180,4,1,'10:15:00','00:15:00',8),(181,4,2,'10:15:00','00:15:00',8),(182,4,3,'10:15:00','00:15:00',8),(183,4,4,'10:15:00','00:15:00',8),(184,4,5,'10:15:00','01:15:00',8),(185,4,6,'10:00:00','01:15:00',8),(186,4,7,'10:00:00','23:15:00',8);
/*!40000 ALTER TABLE `operating_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Wendy\'s'),(2,'Chick-Fil-A'),(3,'Perkins'),(4,'Papa Johns'),(5,'Texas Road House');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_type`
--

DROP TABLE IF EXISTS `restaurant_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_type` varchar(25) DEFAULT NULL,
  `restaurant_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_ID` (`restaurant_ID`),
  CONSTRAINT `restaurant_type_ibfk_1` FOREIGN KEY (`restaurant_ID`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_type`
--

LOCK TABLES `restaurant_type` WRITE;
/*!40000 ALTER TABLE `restaurant_type` DISABLE KEYS */;
INSERT INTO `restaurant_type` VALUES (1,'fast-food',1),(2,'sit-down',3),(3,'fast-food',2),(4,'pizzaria',4),(5,'sit-down',5);
/*!40000 ALTER TABLE `restaurant_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-09 15:02:00
