CREATE DATABASE  IF NOT EXISTS `helpdesk_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `helpdesk_schema`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: helpdesk_schema
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ticket_table`
--

DROP TABLE IF EXISTS `ticket_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticket_table` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_title` varchar(60) NOT NULL,
  `ticket_description` varchar(5000) NOT NULL,
  `ticket_number` int(11) NOT NULL,
  `ticket_status` varchar(60) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_reply` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_table`
--

LOCK TABLES `ticket_table` WRITE;
/*!40000 ALTER TABLE `ticket_table` DISABLE KEYS */;
INSERT INTO `ticket_table` VALUES (2,'Title-1','My description regarding the issue I have with...',1,'Client Reply',4,'This is a reply with an admin solution to the issue.'),(3,'Title-2','My description regarding the issue I have with...',2,'Awaiting Reply',4,NULL),(4,'Title-1','My description regarding the issue I have with...',1,'Awaiting Reply',5,NULL),(5,'Title-2','My description regarding the issue I have with...',2,'Admin Reply',5,'This is a reply with an admin solution to the issue.'),(6,'Title-3','My reply to your solution regarding the issue...',3,'Client Reply',5,'This is a reply with an admin solution to the issue.'),(7,'Title-1','Thank you for providing the solution, it worked!',1,'Client Reply',6,'This is a reply with an admin solution to the issue.');
/*!40000 ALTER TABLE `ticket_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_noOfTickets` int(11) NOT NULL DEFAULT '0',
  `user_priority` int(100) NOT NULL DEFAULT '0',
  `user_firstName` varchar(60) NOT NULL,
  `user_lastName` varchar(60) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (3,'Tim','pass123',0,0,'Tim','Arnold','javaHelpdeskService@gmail.com'),(4,'Abbie','pass123',2,2,'Abbie','Bell','TEST'),(5,'John','pass123',3,5,'John','Smith','TEST'),(6,'Lewis','pass123',1,0,'Lisa','Gray','TEST'),(7,'admin','admin123',0,0,'Admin','Admin','ADMIN');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `User_ID`,
 1 AS `User_Name`,
 1 AS `Total Tickets`,
 1 AS `Ticket Priority`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `user_table`.`user_id` AS `User_ID`,`user_table`.`user_name` AS `User_Name`,`user_table`.`user_noOfTickets` AS `Total Tickets`,`user_table`.`user_priority` AS `Ticket Priority` from `user_table` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-29 12:43:06
