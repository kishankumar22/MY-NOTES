-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: todoapp
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (10,1,'Completed p from react',0,'2025-01-08 11:59:57'),(13,2,'Study ',1,'2025-01-10 07:16:06'),(14,2,'Meditation ',0,'2025-01-10 07:16:34'),(15,2,'new  task added',1,'2025-01-10 10:07:41'),(19,1,'exercise',1,'2025-01-10 12:19:46'),(20,1,' play cricket',1,'2025-01-10 12:27:16'),(21,1,'add task',0,'2025-01-10 12:27:44'),(22,2,'go to company',1,'2025-01-10 12:31:07'),(23,2,'go to walk ',0,'2025-01-10 12:33:31'),(24,2,'go to market',1,'2025-01-10 12:43:36'),(25,2,'super sunday',0,'2025-01-10 12:44:07'),(26,1,'go to cinema',0,'2025-01-11 06:00:23'),(27,1,'long drivefdf',1,'2025-01-11 06:34:39'),(28,1,'add task 2',1,'2025-01-11 10:00:31'),(29,1,'sleeping time 1',0,'2025-01-11 10:23:02'),(30,1,'sunday off',1,'2025-01-11 10:33:38'),(32,1,'monday off',1,'2025-01-12 00:20:45'),(33,1,'go to Ram Mandir 34',1,'2025-01-13 00:25:45'),(34,1,'go to school',1,'2025-01-11 11:33:33'),(35,1,'new day',0,'2025-01-12 00:25:45'),(37,1,'weekend comes',0,'2025-01-11 11:55:12'),(47,2,'project completedss',1,'2025-01-12 00:20:45'),(48,2,'task 123332d',0,'2025-01-12 00:20:45'),(49,2,'task 4',1,'2025-01-13 07:15:10'),(50,2,'task 5',1,'2025-01-13 07:15:35'),(51,1,'task 2d',0,'2025-01-13 09:07:51'),(53,2,'task 6',0,'2025-01-13 12:07:54'),(56,1,'task 14',1,'2025-01-14 05:35:58'),(57,2,'task 12',0,'2025-01-14 07:40:51'),(58,1,'task 15',1,'2025-01-14 09:16:16'),(59,1,'task 16',1,'2025-01-14 10:08:12'),(60,1,'task 17',1,'2025-01-14 10:08:23'),(62,1,'task 19',1,'2025-01-15 05:12:54'),(64,1,'going for company',0,'2025-01-15 11:23:03'),(66,1,'task adeddsdf',1,'2025-01-16 08:36:59'),(67,1,'task2',1,'2025-01-16 08:37:23'),(68,1,'project completed',0,'2025-01-18 12:53:03');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kishan kumar','kishankumar73001@gmail.com','6387478842','$2b$10$WU2oTJK83vlXJxQNlaeuX.BiIJaevTJEilSBBbDQSSen4dQO675mO','2025-01-06 10:03:20'),(2,'shivam kumar','shivam3@gmail.com','9839180448','$2b$10$pwwogpQjfBcDmMaYikIh3ea.gbl1zE71CJYkBWQeJy6x7U8bpNFy2','2025-01-06 10:05:04'),(3,'Rahul Viswakarma ','rv31431@gmail.com','9839180448','$2b$10$ZiXQeQ3qgard1l7ZFGKTVe7/xIfqg4aVRz2tODL2/kiDQVDgBLLzi','2025-01-07 12:05:10'),(9,'Kishan Kumar','kishankumar73@gmail.com','6387478842','$2b$10$4IgPBPEbTjGCPhWjd8nXMOXzNEhkZcK0GGyjkkVXFuxkgE0RTtire','2025-07-01 05:06:09');
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

-- Dump completed on 2025-07-12 18:16:24
