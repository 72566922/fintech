-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mujer_fintech
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `event_user_role`
--

DROP TABLE IF EXISTS `event_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `enabled` bit(1) NOT NULL,
  `event_id` bigint NOT NULL,
  `user_role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrsyfkgyaqq9pg4u640l04titx` (`event_id`),
  KEY `FKrmy3mcmxmc3muoqggown26n6b` (`user_role_id`),
  CONSTRAINT `FKrmy3mcmxmc3muoqggown26n6b` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`),
  CONSTRAINT `FKrsyfkgyaqq9pg4u640l04titx` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_user_role`
--

LOCK TABLES `event_user_role` WRITE;
/*!40000 ALTER TABLE `event_user_role` DISABLE KEYS */;
INSERT INTO `event_user_role` VALUES (3,10,_binary '',1,1),(4,15,_binary '',2,2);
/*!40000 ALTER TABLE `event_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_userrole_ticket`
--

DROP TABLE IF EXISTS `event_userrole_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_userrole_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `event_user_role_id` bigint NOT NULL,
  `ticket` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqvo3ndpyedwtq44w9tmrn5ji0` (`event_user_role_id`),
  KEY `FKpk7jxd345tg3gt896e5e04tn9` (`ticket`),
  CONSTRAINT `FKpk7jxd345tg3gt896e5e04tn9` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`),
  CONSTRAINT `FKqvo3ndpyedwtq44w9tmrn5ji0` FOREIGN KEY (`event_user_role_id`) REFERENCES `event_user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_userrole_ticket`
--

LOCK TABLES `event_userrole_ticket` WRITE;
/*!40000 ALTER TABLE `event_userrole_ticket` DISABLE KEYS */;
INSERT INTO `event_userrole_ticket` VALUES (1,_binary '',3,2),(2,_binary '',4,1);
/*!40000 ALTER TABLE `event_userrole_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `mode` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `remaining_capacity` int NOT NULL,
  `time_end` time(6) NOT NULL,
  `time_start` time(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `categoria_event` bigint NOT NULL,
  `user_role` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKehyi01sxcfhk1osjntpmh2oe2` (`categoria_event`),
  KEY `FK9xy8iuldjklvqea7xpb2mqn28` (`user_role`),
  CONSTRAINT `FK9xy8iuldjklvqea7xpb2mqn28` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`id`),
  CONSTRAINT `FKehyi01sxcfhk1osjntpmh2oe2` FOREIGN KEY (`categoria_event`) REFERENCES `type_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,100,'2024-12-01','Concierto de Rock',_binary '','Presencial',150.5,100,'22:00:00.000000','20:00:00.000000','Rock Fest',1,1),(2,200,'2024-12-15','Taller de Programación',_binary '','Virtual',50,150,'18:00:00.000000','14:00:00.000000','Código para Todos',2,2);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkxvufx13wi6icen4i2wltdj02` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'primera descripcion',_binary '','efectivo'),(2,'segunda descripcion',_binary '','tarjeta debito'),(3,'tercera descripcion',_binary '','transferencia');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `image_cover` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_role` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj0n6bd04mksoobh8oosrgc8fd` (`user_role`),
  CONSTRAINT `FKj0n6bd04mksoobh8oosrgc8fd` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'primera descripcion',_binary '','coordinador'),(2,'segunda descripcion',_binary '','atencion cliente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `enabled` bit(1) NOT NULL,
  `igv` double NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `event_id` bigint NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `user_role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3utafe14rupaypjocldjaj4ol` (`event_id`),
  KEY `FK57m3eru3bbe5u9ggs57an3wwb` (`payment_method_id`),
  KEY `FK7o1gx7s53hgohs7sbro023fug` (`user_role_id`),
  CONSTRAINT `FK3utafe14rupaypjocldjaj4ol` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `FK57m3eru3bbe5u9ggs57an3wwb` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `FK7o1gx7s53hgohs7sbro023fug` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'2024-12-01',_binary '',18,150,168,1,1,1),(2,'2024-12-12',_binary '',9,50,59,2,2,2);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_event`
--

DROP TABLE IF EXISTS `type_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_event`
--

LOCK TABLES `type_event` WRITE;
/*!40000 ALTER TABLE `type_event` DISABLE KEYS */;
INSERT INTO `type_event` VALUES (1,'primera decripcion',_binary '','forum-summit-webinar'),(2,'segunda decripcion',_binary '','investigacion-radar'),(3,'tercera decripcion',_binary '','inversionistas-fondos'),(4,'tercera decripcion',_binary '','aceleradoras-incubadoras'),(5,'quinta decripcion',_binary '','formacion de habilidades blandas o tecnicas'),(6,'sexta decripcion',_binary '','academia'),(7,'septima decripcion',_binary '','premios'),(8,'octaba decripcion',_binary '','gremio-comunidades');
/*!40000 ALTER TABLE `type_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`),
  KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`),
  CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,_binary '',2,1),(2,_binary '',1,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKvtw3e1ckw5b71xwpbkb2as9s` (`gmail`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','kevin morales arango','kevin123@gmail.com','$2a$10$Mrgk2InlndJ/JKbYkxgKSuK0voGDq.0hRiyw3DF6FFkIiuFZJn2QG','kevin123'),(2,_binary '','ricardo suarez','ricardo123@gmail.com','$2a$10$UbONkAYLmZsYCF0dWwVrKeRY53BHsaU425UsF4VTIdp9boPGRKDeq','ricardo123');
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

-- Dump completed on 2024-10-22 20:46:59
