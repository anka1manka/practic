-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pracic
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_categories` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slug` varchar(250) CHARACTER SET utf8mb3 NOT NULL COMMENT 'url',
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Косметика','cosmetics',NULL),(2,'Лицо','face',1),(3,'Уход за кожей','skincare',2),(4,'Тональные средства','foundation',2),(5,'Пудра','powder',2),(6,'Глаза','eyes',1),(7,'Тени для век','eyeshadows',6),(8,'Тушь','mascara',6),(9,'Подводка','eyeliner',6),(10,'Губы','lips',1),(11,'Помада','lipstick',10),(12,'Блеск для губ','lipgloss',10),(13,'Уход за телом','bodycare',NULL),(14,'Кремы для тела','bodycream',13),(15,'Скрабы','scrub',13);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slug` varchar(250) NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` enum('draft','published','archived') NOT NULL COMMENT 'отложенная публикация, публикация, черновик',
  `published_at` datetime DEFAULT NULL,
  `user_id_user` int NOT NULL,
  `categories_id_categories` int NOT NULL,
  PRIMARY KEY (`id_content`),
  KEY `fk_content_user1_idx` (`user_id_user`),
  KEY `fk_content_categories1_idx` (`categories_id_categories`),
  CONSTRAINT `fk_content_categories1` FOREIGN KEY (`categories_id_categories`) REFERENCES `categories` (`id_categories`),
  CONSTRAINT `fk_content_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'Лучшие увлажняющие кремы 2024','best-moisturizers-2024','Топ-10 увлажняющих кремов для лица','<h1>Увлажняющие кремы</h1><p>Обзор лучших средств...</p>','published','2024-11-15 10:00:00',1,3),(2,'Как выбрать тональную основу','how-to-choose-foundation','Руководство по подбору тонального средства','<h1>Выбор тональной основы</h1><p>Советы экспертов...</p>','published','2024-11-20 14:30:00',2,4),(3,'Тренды помад осень-зима 2024','lipstick-trends-2024','Актуальные оттенки помад в этом сезоне','<h1>Тренды помад</h1><p>Модные цвета...</p>','published','2024-10-05 09:15:00',3,11),(4,'Уход за чувствительной кожей','sensitive-skin-care','Полный гайд по уходу','<h1>Чувствительная кожа</h1><p>Рекомендации...</p>','draft',NULL,1,3),(5,'Обзор люксовой туши','luxury-mascara-review','Тестируем премиальную тушь','<h1>Люксовая тушь</h1><p>Наши впечатления...</p>','published','2024-09-10 16:45:00',2,8),(6,'Натуральные скрабы для тела','natural-body-scrubs','Домашние рецепты и готовые средства','<h1>Натуральные скрабы</h1><p>Экологичный уход...</p>','published','2024-12-01 11:30:00',3,15);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id_permission` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_permission`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'Создание записей'),(2,'Редактирование записей'),(3,'Удаление записей'),(4,'Просмотр логов'),(5,'Бан пользователей'),(6,'Изменение ролей'),(7,'Комментирование'),(8,'Загрузка файлов');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Админ'),(2,'Модератор'),(3,'Пользователь'),(4,'Гость'),(5,'Редактор');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permission`
--

DROP TABLE IF EXISTS `role_has_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permission` (
  `role_id_role` int NOT NULL,
  `permission_id_permission` int NOT NULL,
  PRIMARY KEY (`role_id_role`,`permission_id_permission`),
  KEY `fk_role_has_permission_permission1_idx` (`permission_id_permission`),
  KEY `fk_role_has_permission_role_idx` (`role_id_role`),
  CONSTRAINT `fk_role_has_permission_permission1` FOREIGN KEY (`permission_id_permission`) REFERENCES `permission` (`id_permission`),
  CONSTRAINT `fk_role_has_permission_role` FOREIGN KEY (`role_id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permission`
--

LOCK TABLES `role_has_permission` WRITE;
/*!40000 ALTER TABLE `role_has_permission` DISABLE KEYS */;
INSERT INTO `role_has_permission` VALUES (1,1),(2,1),(3,1),(5,1),(1,2),(2,2),(3,2),(5,2),(1,3),(5,3),(1,4),(1,5),(2,5),(1,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(3,8),(5,8);
/*!40000 ALTER TABLE `role_has_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_user`
--

DROP TABLE IF EXISTS `role_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_user` (
  `role_id_role` int NOT NULL,
  `user_id_user` int NOT NULL,
  PRIMARY KEY (`role_id_role`,`user_id_user`),
  KEY `fk_role_has_user_user1_idx` (`user_id_user`),
  KEY `fk_role_has_user_role1_idx` (`role_id_role`),
  CONSTRAINT `fk_role_has_user_role1` FOREIGN KEY (`role_id_role`) REFERENCES `role` (`id_role`),
  CONSTRAINT `fk_role_has_user_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_user`
--

LOCK TABLES `role_has_user` WRITE;
/*!40000 ALTER TABLE `role_has_user` DISABLE KEYS */;
INSERT INTO `role_has_user` VALUES (1,1),(2,2),(3,2),(3,3),(5,4),(3,5),(4,5);
/*!40000 ALTER TABLE `role_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id_tags` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slug` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_tags`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Увлажняющее','moisturizing'),(2,'Матирующее','matte'),(3,'Стойкое','longlasting'),(4,'Натуральное','natural'),(5,'Гипоаллергенное','hypoallergenic'),(6,'Для чувствительной кожи','sensitive-skin'),(7,'Акне','acne'),(8,'Омолаживающее','anti-aging'),(9,'SPF защита','spf'),(10,'Веганское','vegan'),(11,'Бюджетное','budget'),(12,'Люкс','luxury'),(13,'Новинка','new'),(14,'Хит продаж','bestseller');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_has_content`
--

DROP TABLE IF EXISTS `tags_has_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_has_content` (
  `tags_id_tags` int NOT NULL,
  `content_id_content` int NOT NULL,
  PRIMARY KEY (`tags_id_tags`,`content_id_content`),
  KEY `fk_tags_has_content_content1_idx` (`content_id_content`),
  KEY `fk_tags_has_content_tags1_idx` (`tags_id_tags`),
  CONSTRAINT `fk_tags_has_content_content1` FOREIGN KEY (`content_id_content`) REFERENCES `content` (`id_content`),
  CONSTRAINT `fk_tags_has_content_tags1` FOREIGN KEY (`tags_id_tags`) REFERENCES `tags` (`id_tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_has_content`
--

LOCK TABLES `tags_has_content` WRITE;
/*!40000 ALTER TABLE `tags_has_content` DISABLE KEYS */;
INSERT INTO `tags_has_content` VALUES (1,1),(8,1),(14,1),(2,2),(3,2),(6,2),(3,3),(12,3),(13,3),(4,4),(5,4),(6,4),(3,5),(12,5),(14,5),(4,6),(10,6),(11,6);
/*!40000 ALTER TABLE `tags_has_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_registration` date NOT NULL,
  `last_visit` date NOT NULL,
  `password` varchar(45) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Иван','Иванов','79151234567','ivanyska144HD@mail.ru','2025-01-15','2025-12-08','vankavstanka305',NULL),(2,'Мария','Петрова','79167654325','Gta5MariaLove@mail.ru','2025-02-20','2025-12-07','mariapepe',NULL),(3,'Алексей','Сидоров','79159876543','SIDR7@mail.ru','2025-03-10','2025-12-06','sidralex',NULL),(4,'Елена','Смирнова','79151112233','Smirilas18@mail.ru','2025-04-05','2025-12-05','elenaSmirilas',NULL),(5,'Дмитрий','Козлов','79154445566','dmitryKoz22@mail.ru','2025-05-12','2025-12-04','kozel22yltra',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11 10:52:22
