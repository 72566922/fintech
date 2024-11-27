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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL,
  `celular` varchar(9) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgmjuky8o7hx4nbdhg8jvspy0k` (`correo`),
  UNIQUE KEY `UKplf8ctke992i5j3vkkxyt80jc` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_curso`
--

DROP TABLE IF EXISTS `alumno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_curso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alumno_id` bigint NOT NULL,
  `curso_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr44lwkj2g6xp76jg0p19dqqcw` (`alumno_id`),
  KEY `FKowxkqfb2u3f989w71rflxqi86` (`curso_id`),
  CONSTRAINT `FKowxkqfb2u3f989w71rflxqi86` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  CONSTRAINT `FKr44lwkj2g6xp76jg0p19dqqcw` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_curso`
--

LOCK TABLES `alumno_curso` WRITE;
/*!40000 ALTER TABLE `alumno_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) NOT NULL,
  `publicacion_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrm1kqaag6sc6t8qrq7vvvcjnt` (`publicacion_id`),
  KEY `FKsn53lyh11hoc4hlwohd0jh6e8` (`user_id`),
  CONSTRAINT `FKrm1kqaag6sc6t8qrq7vvvcjnt` FOREIGN KEY (`publicacion_id`) REFERENCES `publicaciones` (`id`),
  CONSTRAINT `FKsn53lyh11hoc4hlwohd0jh6e8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (21,'aea',23,2),(22,'fff',23,2),(23,'bbb',23,2),(24,'yatusabebs',24,2),(25,'mmmmmm',25,2),(26,'vvv',26,2);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `iniciativa` varchar(255) DEFAULT NULL,
  `modalidad` enum('PRESENCIAL','VIRTUAL') DEFAULT NULL,
  `organizador` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'abierto','2025-03-25','Bootcamp de Analisis de Datos','VIRTUAL','Laboratoria',160,'https://bootcamp.laboratoria.la/es/data?utm_source=laboratoria_web&utm_campaign=data_analytics-laboratoria_web&utm_medium=proximos_bootcamps'),(3,'abierto','2024-11-28','Women CEO Program','PRESENCIAL','Centrum PUCP',250,'https://centrum.pucp.edu.pe/programas/educacion-ejecutiva/alta-direccion/women-ceo-program/'),(4,'abierto','2025-01-24','Herramientas Financieras para Pymes','VIRTUAL','Leads Mujer',110,'https://www.leadsmujer.com/cursos/herramientas-financieras-pymes/'),(5,'abierto','2025-01-15','Bootcamp de Desarrollo Web','VIRTUAL','Laboratoria',180,'https://bootcamp.laboratoria.la/es/web-dev?utm_source=laboratoria_web&utm_campaign=web_dev-laboratoria_web&utm_medium=proximos_bootcamps');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,100,'2024-12-01','Concierto de Rock',_binary '','Presencial',150.5,100,'22:00:00.000000','20:00:00.000000','Rock Fest',1,1),(2,200,'2024-12-15','Taller de Programación',_binary '','Virtual',50,150,'18:00:00.000000','14:00:00.000000','Código para Todos',2,2),(3,150,'2025-01-10','Como invertir de mejor manera',_binary '','virtual',0,129,'22:00:00.000000','19:30:00.000000','Charla economica',3,2),(4,100,'2025-01-15','Foro sobre Innovación en Fintech',_binary '','virtual',0,100,'20:00:00.000000','18:00:00.000000','Foro Fintech 2025',1,1),(5,150,'2025-02-10','Cumbre de Líderes Tecnológicos',_binary '','presencial',50,150,'22:00:00.000000','19:00:00.000000','Tech Leaders Summit',1,2),(6,80,'2025-03-05','Presentación de Estudio sobre Nuevas Tecnologías',_binary '','virtual',10,80,'21:00:00.000000','19:00:00.000000','Estudio Tecnológico 2025',2,1),(7,120,'2025-04-01','Radar de Innovaciones Financieras',_binary '','presencial',0,120,'21:30:00.000000','18:30:00.000000','Radar FinTech',2,2),(8,50,'2025-06-12','Ronda de Inversión para Startups Fintech',_binary '','virtual',0,50,'20:00:00.000000','17:00:00.000000','Ronda de Inversión 2025',3,1),(9,200,'2025-06-10','Seminario de Gestión de Fondos de Inversión',_binary '','presencial',30,200,'23:00:00.000000','20:00:00.000000','Seminario de Fondos',3,2),(10,70,'2025-07-01','Bootcamp para Emprendedores Tecnológicos',_binary '','virtual',20,70,'22:00:00.000000','19:00:00.000000','Tech Bootcamp',4,1),(11,150,'2025-08-20','Feria de Conexión con Aceleradoras',_binary '','presencial',15,150,'22:30:00.000000','18:00:00.000000','Feria Aceleradoras 2025',4,2),(12,100,'2025-09-05','Taller de Liderazgo en Tecnología',_binary '','virtual',10,100,'21:00:00.000000','18:30:00.000000','Taller de Liderazgo',5,1),(13,80,'2025-09-15','Capacitación Técnica en Blockchain',_binary '','presencial',25,80,'21:30:00.000000','19:00:00.000000','Blockchain Básico',5,2),(14,150,'2025-10-10','Congreso Académico de Fintech',_binary '','presencial',50,150,'23:00:00.000000','20:00:00.000000','Congreso FinTech',6,1),(15,200,'2025-11-01','Hackathon Universitario de Innovación',_binary '','virtual',0,200,'21:00:00.000000','18:00:00.000000','Hackathon 2025',6,2),(16,300,'2025-12-15','Premios a la Innovación en Fintech',_binary '','presencial',0,300,'22:00:00.000000','19:30:00.000000','Premios Innovación',7,1),(17,100,'2025-12-20','Premios a Mujeres Líderes en Tecnología',_binary '','virtual',0,100,'21:00:00.000000','19:00:00.000000','Premios Tecnología 2025',7,2),(18,200,'2025-12-25','Encuentro de Comunidades FinTech',_binary '','presencial',10,200,'23:00:00.000000','20:00:00.000000','Encuentro FinTech',8,1),(19,150,'2025-12-30','Red de Mujeres en Tecnología',_binary '','virtual',5,150,'22:00:00.000000','18:30:00.000000','Red Mujeres Tech',8,2),(20,150,'2026-01-15','Reunión Anual de Comunidades Fintech para discutir avances tecnológicos',_binary '','virtual',0,150,'20:30:00.000000','18:00:00.000000','Comunidades Fintech 2026',8,1),(21,200,'2026-02-20','Encuentro Interuniversitario sobre Innovación en Finanzas y Tecnología',_binary '','presencial',25,200,'22:00:00.000000','19:00:00.000000','Encuentro Universitario Fintech',8,2),(22,180,'2026-03-10','Taller colaborativo entre gremios para compartir mejores prácticas',_binary '','virtual',10,180,'21:30:00.000000','19:30:00.000000','Taller Gremios 2026',8,1),(23,250,'2026-04-05','Cumbre de Comunidades sobre Impacto del Fintech en Mercados Emergentes',_binary '','presencial',15,250,'23:00:00.000000','20:00:00.000000','Cumbre de Comunidades Fintech',8,2),(24,300,'2026-05-25','Congreso Internacional de Gremios Fintech',_binary '','presencial',20,300,'22:30:00.000000','18:30:00.000000','Congreso Internacional Fintech',8,1),(25,100,'2026-06-15','Sesión de Networking con Incubadoras de Startups',_binary '','virtual',10,100,'21:00:00.000000','19:00:00.000000','Networking Incubadoras 2026',4,1),(26,150,'2026-07-20','Demo Day para Nuevas Startups Fintech',_binary '','presencial',25,150,'22:00:00.000000','18:00:00.000000','Demo Day 2026',4,2),(27,200,'2026-08-10','Capacitación sobre Crecimiento y Escalamiento para Startups',_binary '','virtual',15,200,'20:30:00.000000','17:30:00.000000','Capacitación Escalamiento',4,1),(28,80,'2026-09-05','Taller de Financiación para Startups Fintech',_binary '','virtual',20,80,'22:00:00.000000','19:00:00.000000','Financiación para Startups',4,2),(29,120,'2026-10-18','Foro de Colaboración entre Incubadoras Regionales',_binary '','presencial',30,120,'21:30:00.000000','18:30:00.000000','Colaboración Incubadoras',4,1),(30,150,'2025-06-15','Como invertir de mejor manera',_binary '','virtual',0,150,'20:00:00.000000','18:00:00.000000','Charla economica II',3,1),(31,180,'2026-10-18','Bootcamp para Emprendedores Tencológicos',_binary '','virtual',20,180,'18:00:00.000000','16:00:00.000000','Tech Bootcamp II',4,1),(32,180,'2026-09-09','Taller de Financiación para Startups Fintech',_binary '','virtual',0,180,'18:00:00.000000','16:00:00.000000','Financiación para Startups II',4,1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacion_concurso`
--

DROP TABLE IF EXISTS `formacion_concurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formacion_concurso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_convocatoria` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `iniciativa` varchar(255) DEFAULT NULL,
  `modalidad` enum('PRESENCIAL','VIRTUAL') DEFAULT NULL,
  `organizador` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `resumen` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion_concurso`
--

LOCK TABLES `formacion_concurso` WRITE;
/*!40000 ALTER TABLE `formacion_concurso` DISABLE KEYS */;
INSERT INTO `formacion_concurso` VALUES (2,'2024-04-20','2024-05-11','2024-04-25','Start Path Empodera','VIRTUAL','Mastercard & USAID',0,'responsable','Start Path Empodera busca fomentar oportunidades económicas para las mujeres y promover una economía digital más inclusiva en el país, a través de un programa diseñado para acelerar a empresas fundadas por mujeres, durante sus etapas iniciales.','https://www.startpathempodera.com/'),(3,'2024-06-20','2024-08-10','2024-06-25','Desafío KUNAN','VIRTUAL','KUNAN',0,'responsable','Categorias de concursos.','https://desafio.kunan.org/categorias/#:~:text=2%20ganadores.,para%20emprendimiento%20en%20zonas%20rurales.'),(4,'2024-07-19','2024-10-10','2024-07-30','World Summit Awards','VIRTUAL','WSA',0,'responsable','La WSA es un sistema de premios basado en nominaciones, que invita a todos los Estados miembros de la ONU a nominar sus mejores soluciones digitales locales, contribuyendo a la consecución de los ODS de la ONU y a una sociedad del conocimiento inclusiva.','https://wsa-global.org/contest/submission-guide/');
/*!40000 ALTER TABLE `formacion_concurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (1,'1f0eafd5-f9db-45f1-a6ce-1b0691db3da6_hospedajes.jpg','/img/publicaciones/1f0eafd5-f9db-45f1-a6ce-1b0691db3da6_hospedajes.jpg'),(2,'030de28c-d3ae-46f4-84c7-0858e70cb6f9_sodimac.jpg','/img/publicaciones/030de28c-d3ae-46f4-84c7-0858e70cb6f9_sodimac.jpg'),(3,'f2351db5-6ab1-45d2-b1e7-5a249da74f84_Captura.PNG','/img/publicaciones/f2351db5-6ab1-45d2-b1e7-5a249da74f84_Captura.PNG'),(4,'5ed9ef65-cd77-49c6-827d-8cddb6225ac6_colgador.PNG','/img/publicaciones/5ed9ef65-cd77-49c6-827d-8cddb6225ac6_colgador.PNG'),(5,'25d5f6de-c57e-437a-87f5-6299b854cb56_sodimac.jpg','/img/publicaciones/25d5f6de-c57e-437a-87f5-6299b854cb56_sodimac.jpg'),(6,'02ab096b-cb61-4c05-bb1a-022838a249b5_hogar.jpg','/img/publicaciones/02ab096b-cb61-4c05-bb1a-022838a249b5_hogar.jpg'),(7,'bcd7082e-1261-4184-9a46-236b8285d904_mayor-menor.jpg','/img/publicaciones/bcd7082e-1261-4184-9a46-236b8285d904_mayor-menor.jpg'),(8,'a8de11bf-5a62-4bde-85e2-1508adb2229c_mayor-menor.jpg','/img/publicaciones/a8de11bf-5a62-4bde-85e2-1508adb2229c_mayor-menor.jpg'),(9,'dbaca27d-cc46-4deb-9753-1c005602561c_mayor-menor.jpg','/img/publicaciones/dbaca27d-cc46-4deb-9753-1c005602561c_mayor-menor.jpg'),(10,'6adf7d7d-4004-428d-9a25-11c8844cd22b_Captura.PNG','/img/publicaciones/6adf7d7d-4004-428d-9a25-11c8844cd22b_Captura.PNG'),(11,'1b2034d8-5cdf-42d2-b53a-cd15e11b2715_hogar.jpg','/img/publicaciones/1b2034d8-5cdf-42d2-b53a-cd15e11b2715_hogar.jpg'),(12,'cd0cf315-ab81-4742-84c7-165d717254c7_hospedajes.jpg','/img/publicaciones/cd0cf315-ab81-4742-84c7-165d717254c7_hospedajes.jpg'),(13,'e51ec80a-8881-4263-bdac-3606b021652e_colgador.PNG','/img/publicaciones/e51ec80a-8881-4263-bdac-3606b021652e_colgador.PNG'),(14,'af806869-7645-4a71-ad66-5d92a2e407fa_Captura.PNG','/img/publicaciones/af806869-7645-4a71-ad66-5d92a2e407fa_Captura.PNG'),(15,'fd9e0450-f4e8-4840-972f-fe068cd1d361_sodimac.jpg','/img/publicaciones/fd9e0450-f4e8-4840-972f-fe068cd1d361_sodimac.jpg'),(16,'c3cd302f-dcfd-4c0c-b7a4-b54beb99387f_colgador.PNG','/img/publicaciones/c3cd302f-dcfd-4c0c-b7a4-b54beb99387f_colgador.PNG'),(17,'58476245-0e6e-4244-81e7-c5b6878b55b5_hospedajes.jpg','/img/publicaciones/58476245-0e6e-4244-81e7-c5b6878b55b5_hospedajes.jpg'),(18,'734fada3-8823-4959-845f-4331a1a81021_mayor-menor.jpg','/img/publicaciones/734fada3-8823-4959-845f-4331a1a81021_mayor-menor.jpg'),(19,'a15e9d2f-bba4-47ba-8485-1b5cb0592e46_sodimac.jpg','/img/publicaciones/a15e9d2f-bba4-47ba-8485-1b5cb0592e46_sodimac.jpg'),(20,'1a4b6992-cb00-4d81-af3d-b39159c24eea_hospedajes.jpg','/img/publicaciones/1a4b6992-cb00-4d81-af3d-b39159c24eea_hospedajes.jpg'),(21,'485cc9e9-a731-4ff4-9798-d1258886478d_hogar.jpg','/img/publicaciones/485cc9e9-a731-4ff4-9798-d1258886478d_hogar.jpg'),(22,'4dcfded0-a99f-40bb-a476-d0fbc6389ed1_sodimac.jpg','/img/publicaciones/4dcfded0-a99f-40bb-a476-d0fbc6389ed1_sodimac.jpg'),(23,'3df6d4a7-300f-49d5-8241-10e8d227062f_colgador.PNG','/img/publicaciones/3df6d4a7-300f-49d5-8241-10e8d227062f_colgador.PNG'),(24,'36080a8d-3083-4a2e-ac89-1e2cac90c1a4_hospedajes.jpg','/img/publicaciones/36080a8d-3083-4a2e-ac89-1e2cac90c1a4_hospedajes.jpg'),(25,'5bc6b4a1-897f-461f-bde8-a10431b97111_sodimac.jpg','/img/publicaciones/5bc6b4a1-897f-461f-bde8-a10431b97111_sodimac.jpg'),(26,'563e9acd-5f15-4963-a039-420fb0ca74ee_hogar.jpg','/img/publicaciones/563e9acd-5f15-4963-a039-420fb0ca74ee_hogar.jpg'),(27,'238d6ec5-99c6-45ae-8478-e0373ca33bf4_hospedajes.jpg','/img/publicaciones/238d6ec5-99c6-45ae-8478-e0373ca33bf4_hospedajes.jpg'),(28,'84a7232a-3b3b-4ff7-b2f8-6f414cfb08c5_sodimac.jpg','/img/publicaciones/84a7232a-3b3b-4ff7-b2f8-6f414cfb08c5_sodimac.jpg'),(29,'3f363ace-f73d-48fd-8d3c-83b10a5e06d1_hospedajes.jpg','/img/publicaciones/3f363ace-f73d-48fd-8d3c-83b10a5e06d1_hospedajes.jpg'),(30,'cbd1cfcc-5a12-44cc-a6e0-e8da3ce16b88_colgador.PNG','/img/publicaciones/cbd1cfcc-5a12-44cc-a6e0-e8da3ce16b88_colgador.PNG'),(31,'bf2ff2a8-9714-4fd2-9ec1-af4622339f63_hogar.jpg','/img/publicaciones/bf2ff2a8-9714-4fd2-9ec1-af4622339f63_hogar.jpg'),(32,'8a57beb2-c965-405e-8077-764d6c22232f_sodimac.jpg','/img/publicaciones/8a57beb2-c965-405e-8077-764d6c22232f_sodimac.jpg'),(33,'d023ce04-3ab9-4e18-959e-f8b095934142_proximoeventos.jpg','/img/publicaciones/d023ce04-3ab9-4e18-959e-f8b095934142_proximoeventos.jpg'),(34,'a0a98f83-aa0a-4494-88c6-8b8c8fc7a985_fintech-mujer.jpg','/img/publicaciones/a0a98f83-aa0a-4494-88c6-8b8c8fc7a985_fintech-mujer.jpg'),(35,'71a483af-1d74-4056-beea-3a3c6aea7e2f_ganadoresreciente.jpg','/img/publicaciones/71a483af-1d74-4056-beea-3a3c6aea7e2f_ganadoresreciente.jpg'),(36,'8996cb18-6f7b-427d-9934-f40973807de9_proximoeventos.jpg','/img/publicaciones/8996cb18-6f7b-427d-9934-f40973807de9_proximoeventos.jpg'),(37,'702d0614-5715-4bc9-b28b-e53b82e6fa46_ganadoresreciente.jpg','/img/publicaciones/702d0614-5715-4bc9-b28b-e53b82e6fa46_ganadoresreciente.jpg');
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `responsable` varchar(255) NOT NULL,
  `resumen` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (1,'radiografia@gmail.com','2024-12-14','Funds Society','El Informe Fintech Women Network que promueve la asociación desde hace siete años concluye que el 37% de los empleados en fintech son mujeres. El 43% de las mujeres profesionales del fintech ven la regulación como la principal barrera para emprender. El 60% de las compañías considera que el sector fintech es mucho más conciliador que los sectores tradicionales.','Radiografía de las mujeres en el mundo fintech un ejemplo para la industria financiera','https://www.fundssociety.com/es/noticias/negocio/radiografia-de-las-mujeres-en-el-mundo-fintech-un-ejemplo-para-la-industria-financiera/'),(2,'mintic123@gmail.com','2024-12-11','Mintic','La presidenta de Asoface señaló que existe una brecha de género en la industria y que entre las causas están la aversión al riesgo y factores culturales.','La participación y liderazgo femenino en el ecosistema fintech','https://www.mintic.gov.co/portal/inicio/Sala-de-prensa/Noticias/327050:La-participacion-y-liderazgo-femenino-en-el-ecosistema-Fintech'),(3,'infobae123@gmail.com','2024-12-02','Infobae','La profesora de Fintech de Pacífico Business School opinó sobre cómo se pueden abrir puertas y tener éxito en un sector que está en constante evolución.','5 claves para que una mujer entre al mundo Fintech','https://www.infobae.com/peru/2024/03/13/5-claves-para-que-una-mujer-entre-al-mundo-fintech/'),(4,'lanacion123@gmail.com','2024-12-22','La Nación','El jueves 7 de marzo, en Cinemark del Paseo La Galería, el Grupo Fintech Inversiones realizó un evento para homenajear a sus colaboradoras y celebrar el empoderamiento femenino.','Compartieron espacio de Mujer a Mujer','https://www.lanacion.com.py/negocios_edicion_impresa/2024/03/21/compartieron-espacio-de-mujer-a-mujer/');
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
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
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  `image_id` bigint NOT NULL,
  `me_encanta` int NOT NULL,
  `me_gusta` int NOT NULL,
  `no_me_gusta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK53hcyfh0s5ugnk70ma0js725v` (`user_id`),
  KEY `FKi4dscxi84gma9qtoq3s8r0ojn` (`image_id`),
  CONSTRAINT `FK53hcyfh0s5ugnk70ma0js725v` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKi4dscxi84gma9qtoq3s8r0ojn` FOREIGN KEY (`image_id`) REFERENCES `imagenes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
INSERT INTO `publicaciones` VALUES (23,'Bienvenidos',2,29,1,1,1),(24,'wwww',2,30,1,0,0),(25,'agagaga',2,31,2,2,1),(26,'frfrfr',2,32,3,4,2),(27,'Hoy es martes',2,33,0,0,0),(28,'fintech',2,34,0,1,0),(29,'ololololol',2,35,0,0,0),(30,'hyhyhyh',2,36,0,0,0),(31,'ggggg',2,37,0,0,0);
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reacciones`
--

DROP TABLE IF EXISTS `reacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reacciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `me_encanta` bit(1) NOT NULL,
  `me_gusta` bit(1) NOT NULL,
  `no_me_gusta` bit(1) NOT NULL,
  `publication_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl6axl5df334q90ntnu4qaiex3` (`publication_id`),
  KEY `FKavuoylox6ljij4l0b06yqfh12` (`user_id`),
  CONSTRAINT `FKavuoylox6ljij4l0b06yqfh12` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKl6axl5df334q90ntnu4qaiex3` FOREIGN KEY (`publication_id`) REFERENCES `publicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reacciones`
--

LOCK TABLES `reacciones` WRITE;
/*!40000 ALTER TABLE `reacciones` DISABLE KEYS */;
INSERT INTO `reacciones` VALUES (9,_binary '',_binary '\0',_binary '\0',23,2),(10,_binary '\0',_binary '',_binary '\0',23,1),(11,_binary '\0',_binary '\0',_binary '',23,1),(12,_binary '',_binary '\0',_binary '\0',26,1),(13,_binary '\0',_binary '\0',_binary '',25,1),(14,_binary '',_binary '\0',_binary '\0',25,1),(15,_binary '\0',_binary '',_binary '\0',25,1),(16,_binary '',_binary '\0',_binary '\0',26,1),(17,_binary '\0',_binary '',_binary '\0',26,1),(18,_binary '\0',_binary '\0',_binary '',26,1),(19,_binary '\0',_binary '\0',_binary '',26,1),(20,_binary '',_binary '\0',_binary '\0',24,1),(21,_binary '\0',_binary '',_binary '\0',26,1),(22,_binary '\0',_binary '',_binary '\0',25,1),(23,_binary '',_binary '\0',_binary '\0',25,1),(24,_binary '\0',_binary '',_binary '\0',26,1),(25,_binary '',_binary '\0',_binary '\0',26,1),(26,_binary '\0',_binary '',_binary '\0',26,1),(27,_binary '\0',_binary '',_binary '\0',28,1);
/*!40000 ALTER TABLE `reacciones` ENABLE KEYS */;
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

-- Dump completed on 2024-11-26 22:35:57
