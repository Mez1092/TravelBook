-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dbtravel
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add location',7,'add_location'),(20,'Can change location',7,'change_location'),(21,'Can delete location',7,'delete_location'),(22,'Can add room',8,'add_room'),(23,'Can change room',8,'change_room'),(24,'Can delete room',8,'delete_room'),(25,'Can add room waiting list',9,'add_roomwaitinglist'),(26,'Can change room waiting list',9,'change_roomwaitinglist'),(27,'Can delete room waiting list',9,'delete_roomwaitinglist'),(28,'Can add room favorite',10,'add_roomfavorite'),(29,'Can change room favorite',10,'change_roomfavorite'),(30,'Can delete room favorite',10,'delete_roomfavorite'),(31,'Can add prenotation',11,'add_prenotation'),(32,'Can change prenotation',11,'change_prenotation'),(33,'Can delete prenotation',11,'delete_prenotation'),(34,'Can add vote',12,'add_vote'),(35,'Can change vote',12,'change_vote'),(36,'Can delete vote',12,'delete_vote');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$ZnH7m8U3ArkJ$o6Mlr2GkkxMNyzYcpjBJMWxpCdiNotqY9CVApLaGDC0=','2016-08-23 13:11:53.092000',1,'admin','','','',1,1,'2016-08-08 08:43:45.887000'),(2,'pbkdf2_sha256$20000$bNwyqkfHlEYr$0RACRAzJ+jn/tdFiTJjHRIPk3u7j9uPpNjisx2Iq5ms=','2016-08-23 13:11:15.118000',0,'marco','','','',0,1,'2016-08-08 09:11:41.000000'),(3,'pbkdf2_sha256$20000$zdIPveacp8ld$ONjVCFx4TR1a95gBIgdjgj0hzJF7tvSXElX08Q0QWu8=','2016-08-23 13:21:32.991000',0,'paolo','','','',0,1,'2016-08-08 09:11:49.644000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,22);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-08-08 08:47:05.201000','1','Hotel Maranello Village',1,'',7,1),(2,'2016-08-08 08:48:53.677000','2','Abitalia tower plaza',1,'',7,1),(3,'2016-08-08 08:51:53.903000','3','Palace hotel',1,'',7,1),(4,'2016-08-08 08:54:32.773000','4','Hotel Plaza',1,'',7,1),(5,'2016-08-08 08:56:24.149000','5','Panoramic Hotel Plaza',1,'',7,1),(6,'2016-08-08 08:59:24.131000','6','Hilton Prague',1,'',7,1),(7,'2016-08-08 09:01:32.597000','7','Hotel La Vela',1,'',7,1),(8,'2016-08-08 09:02:12.467000','1','Panoramic Hotel Plaza camera num 1',1,'',8,1),(9,'2016-08-08 09:02:34.804000','2','Panoramic Hotel Plaza camera num 2',1,'',8,1),(10,'2016-08-08 09:03:00.851000','3','Panoramic Hotel Plaza camera num 3',1,'',8,1),(11,'2016-08-08 09:03:15.569000','4','Abitalia tower plaza camera num 1',1,'',8,1),(12,'2016-08-08 09:03:33.345000','5','Abitalia tower plaza camera num 2',1,'',8,1),(13,'2016-08-08 09:03:51.271000','6','Hotel Maranello Village camera num 1',1,'',8,1),(14,'2016-08-08 09:04:09.847000','7','Hotel Maranello Village camera num 2',1,'',8,1),(15,'2016-08-08 09:04:32.652000','8','Hotel Maranello Village camera num 3',1,'',8,1),(16,'2016-08-08 09:04:49.852000','9','Hilton Prague camera num 1',1,'',8,1),(17,'2016-08-08 09:05:14.399000','10','Palace hotel camera num 1',1,'',8,1),(18,'2016-08-08 09:05:32.742000','11','Palace hotel camera num 2',1,'',8,1),(19,'2016-08-08 09:11:41.795000','2','marco',1,'',4,1),(20,'2016-08-08 09:11:49.691000','3','paolo',1,'',4,1),(21,'2016-08-08 09:12:10.538000','2','marco',2,'Changed user_permissions.',4,1),(22,'2016-08-08 09:12:38.284000','1','Hotel Maranello Villagecamera num 1',2,'Changed user_reservetion.',9,1),(23,'2016-08-10 08:01:37.313000','18','Hotel Maranello Village camera num 6',3,'',8,1),(24,'2016-08-10 08:01:37.390000','17','Hotel Maranello Village camera num 6',3,'',8,1),(25,'2016-08-10 08:01:37.434000','16','Hotel Maranello Village camera num 6',3,'',8,1),(26,'2016-08-12 09:41:26.778000','1','Abitalia tower plaza',3,'',12,1),(27,'2016-08-12 09:41:35.424000','2','Abitalia tower plaza',3,'',12,1),(28,'2016-08-12 12:21:04.835000','4','Abitalia tower plaza',2,'Changed user_vote.',12,1),(29,'2016-08-17 20:17:22.439000','7','Hotel Maranello Village',3,'',11,1),(30,'2016-08-17 20:17:22.559000','4','Hotel Maranello Village',3,'',11,1),(31,'2016-08-18 08:57:11.512000','8','Hotel Maranello Village',3,'',11,1),(32,'2016-08-18 08:57:33.090000','15','Hotel Maranello Village camera num 5',3,'',8,1),(33,'2016-08-18 08:57:33.155000','14','Hotel Maranello Village camera num 4',3,'',8,1),(34,'2016-08-18 09:00:11.400000','10','Hotel Maranello Village',3,'',11,1),(35,'2016-08-18 09:00:11.546000','3','Abitalia tower plaza',3,'',11,1),(36,'2016-08-18 09:20:36.900000','9','Hotel Maranello Village',3,'',12,1),(37,'2016-08-18 09:20:36.971000','8','Abitalia tower plaza',3,'',12,1),(38,'2016-08-18 09:20:37.018000','7','Abitalia tower plaza',3,'',12,1),(39,'2016-08-18 09:20:37.081000','6','Abitalia tower plaza',3,'',12,1),(40,'2016-08-18 09:20:37.147000','5','Abitalia tower plaza',3,'',12,1),(41,'2016-08-18 09:20:37.287000','4','Abitalia tower plaza',3,'',12,1),(42,'2016-08-18 09:20:37.326000','3','Abitalia tower plaza',3,'',12,1),(43,'2016-08-21 22:32:38.402000','24','Hotel Maranello Village',3,'',12,1),(44,'2016-08-21 22:32:38.504000','23','Hotel Maranello Village',3,'',12,1),(45,'2016-08-21 22:32:38.541000','22','Hotel Maranello Village',3,'',12,1),(46,'2016-08-21 22:32:38.596000','21','Abitalia tower plaza',3,'',12,1),(47,'2016-08-21 22:32:38.793000','18','Hotel Maranello Village',3,'',12,1),(48,'2016-08-21 22:32:38.919000','17','Hotel Maranello Village',3,'',12,1),(49,'2016-08-21 22:32:38.998000','16','Hilton Prague',3,'',12,1),(50,'2016-08-21 22:32:39.072000','15','Hotel Maranello Village',3,'',12,1),(51,'2016-08-21 22:32:39.140000','13','Hilton Prague',3,'',12,1),(52,'2016-08-21 22:32:39.226000','12','Hotel Maranello Village',3,'',12,1),(53,'2016-08-21 22:32:39.315000','11','Abitalia tower plaza',3,'',12,1),(54,'2016-08-21 22:32:39.386000','10','Hotel Maranello Village',3,'',12,1),(55,'2016-08-22 13:22:31.649000','15','Hotel Nizza',3,'',7,1),(56,'2016-08-22 13:22:31.731000','14','Hotel Nizza',3,'',7,1),(57,'2016-08-22 13:22:31.765000','13','Hotel Nizza',3,'',7,1),(58,'2016-08-22 13:22:31.809000','12','Hotel Nizza',3,'',7,1),(59,'2016-08-22 13:22:31.853000','11','Hotel Nizza',3,'',7,1),(60,'2016-08-22 13:22:31.901000','10','Hotel Nizza',3,'',7,1),(61,'2016-08-23 13:05:54.762000','17','Abitalia tower plaza',3,'',11,1),(62,'2016-08-23 13:06:11.747000','20','Abitalia tower plaza',3,'',11,1),(63,'2016-08-23 13:08:58.274000','16','Abitalia tower plaza camera num 9',3,'',8,1),(64,'2016-08-23 13:16:21.375000','28','Hotel Al Cavallino Bianco',1,'',12,1),(65,'2016-08-23 13:18:35.860000','9','Hotel Nizza',2,'Changed site_web.',7,1),(66,'2016-08-23 13:20:08.246000','6','Hilton Prague',2,'Changed address.',7,1),(67,'2016-08-23 13:20:36.883000','6','Hilton Prague',2,'Changed municipality.',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'TravelBook','location'),(11,'TravelBook','prenotation'),(8,'TravelBook','room'),(10,'TravelBook','roomfavorite'),(9,'TravelBook','roomwaitinglist'),(12,'TravelBook','vote');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-08-08 08:39:55.468000'),(2,'auth','0001_initial','2016-08-08 08:40:05.465000'),(3,'TravelBook','0001_initial','2016-08-08 08:40:21.855000'),(4,'admin','0001_initial','2016-08-08 08:40:25.089000'),(5,'contenttypes','0002_remove_content_type_name','2016-08-08 08:40:27.449000'),(6,'auth','0002_alter_permission_name_max_length','2016-08-08 08:40:28.699000'),(7,'auth','0003_alter_user_email_max_length','2016-08-08 08:40:30.574000'),(8,'auth','0004_alter_user_username_opts','2016-08-08 08:40:30.714000'),(9,'auth','0005_alter_user_last_login_null','2016-08-08 08:40:31.884000'),(10,'auth','0006_require_contenttypes_0002','2016-08-08 08:40:31.946000'),(11,'sessions','0001_initial','2016-08-08 08:40:32.603000'),(12,'TravelBook','0002_room_price_holiday','2016-08-10 11:46:43.756000'),(13,'TravelBook','0003_vote','2016-08-12 09:39:11.318000'),(14,'TravelBook','0004_location_media_vote','2016-08-18 09:22:42.564000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('804gpnrnbgbllqcq79hxb2u94cor60su','NWM4NDdjYjkyYzMxYjhmMjI2MTIwNzIxMzVjNTkzMTU0NDAyMmI1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwZTk3YzEzMDIzNzU0N2ZlZDk1ZjhjY2U1YmU5M2M5ZDVkMTkxNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-09-06 13:21:33.036000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbook_location`
--

DROP TABLE IF EXISTS `travelbook_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelbook_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `municipality` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `cap` int(11) NOT NULL,
  `telephone` varchar(200) NOT NULL,
  `stars` int(11) NOT NULL,
  `pool` tinyint(1) NOT NULL,
  `WiFi` tinyint(1) NOT NULL,
  `disabled_services` tinyint(1) NOT NULL,
  `resturant` tinyint(1) NOT NULL,
  `car_parking` tinyint(1) NOT NULL,
  `gym` tinyint(1) NOT NULL,
  `bar` tinyint(1) NOT NULL,
  `sports_activities` tinyint(1) NOT NULL,
  `spa_services` tinyint(1) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `site_web` varchar(600) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `media_vote` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbook_location`
--

LOCK TABLES `travelbook_location` WRITE;
/*!40000 ALTER TABLE `travelbook_location` DISABLE KEYS */;
INSERT INTO `travelbook_location` VALUES (1,'Hotel Maranello Village','Via Terra delle Rosse, 12','Maranello','Modena','Italy',41053,'0536073300',4,1,1,0,1,1,0,1,1,0,'Questo moderno hotel, ispirato al mondo Ferrari, che espone una vera auto di Formula 1 nella hall, si trova a 3,5 km dal Museo Ferrari e a 5 km dal Modena Golf & Country Club. ','http://www.hotelmaranellovillage.com/','2016-08-08 08:47:01.000000',3),(2,'Abitalia tower plaza','Via Caduti del Lavoro, 46','Pisa','Pisa','Italy',56122,'0507846444',4,1,1,1,1,1,0,1,0,0,'Il Tower Plaza, per la sua felice posizione unica davanti alla Torre di Pisa, è un ineguagliabile punto di partenza per la visita delle città d\'arte toscane ed, in alternativa, offre itinerari in auto ed in mountain bike alla ricerca di paesini caratteristici e ricchi di storia, immersi nella tipica campagna toscana. Con i Monti Pisani e le Alpi Apuane alle spalle, con il meraviglioso patrimonio naturale del Parco di San Rossore, offriamo ai nostri turisti la possibilità di fare bellissime escursioni a piedi, passeggiate a cavallo ed anche in carrozza, alla scoperta di mete uniche a contatto con la natura.','http://www.abitaliatowerplaza.it/','2016-08-08 08:48:52.000000',2),(3,'Palace hotel','Viale II Giugno, 60','Milano Marittima','Ravenna','Italy',48015,'0544993618',5,1,1,1,1,1,1,1,1,1,'Situato nel cuore di Milano Marittima, affacciato sul mare e a due passi dal centro cittadino, il Palace Hotel rappresenta la meta d’obbligo per una clientela d’élite alla ricerca di un ambiente prestigioso ed esclusivo.','http://www.selecthotels.it/it-IT/palace-hotel','2016-08-08 08:51:18.000000',0),(4,'Hotel Plaza','768 5th Ave','New York','New York','USA',10019,'12127593000',5,1,1,1,1,1,1,0,0,1,'Situato di fronte a Central Park, questo centenario hotel di lusso sfoggia una facciata in stile castello.   Le eleganti camere, in stile francese, sono dotate di biancheria italiana, angolo relax, TV a schermo piatto, WiFi (a pagamento), iPad e, in alcuni casi, terrazze private. I bagni dispongono di arredi con finiture dorate, con doccia e vasca separate. Le suite, alcune delle quali sono duplex, vantano vista sulla città, servizi igienici privati e dispense.','http://www.fairmont.com/the-plaza-new-york/','2016-08-08 08:54:27.000000',0),(5,'Panoramic Hotel Plaza','Piazza repubblica, 23','Abano Terme','Padova','Italy',35031,'0498669333',4,1,1,0,1,1,0,1,0,1,'Questo moderno hotel con Spa dista 12 km dall\'Orto botanico di Padova e 13 km dalla cappella degli Scrovegni.   Le camere, le suite e gli appartamenti in stile classico o moderno offrono WiFi gratuito, TV a schermo piatto e minibar. Alcune camere godono di vista sui colli Euganei. Le suite hanno un angolo relax separato e gli appartamenti includono l\'angolo cottura. È disponibile il servizio in camera.','http://www.plaza.it/','2016-08-08 08:56:22.000000',0),(6,'Hilton Prague','Pobřežní 1, 186 00','Praha 8','Praha','Repubblica Ceca',81542,'420224841111',3,1,0,0,0,1,0,1,0,1,'An ideal location, between the historic Old Town and the business district, combines with great service at Hilton Prague. All of Prague’s major attractions and shopping centers are within easy reach and the airport is just a 25 minute drive away. From delicious cuisine and stylish guest rooms, to our health club and meeting facilities, you’ll find an impressive list of amenities here at the hotel. But just don’t take our word for it – plan your stay and see why we’ve been awarded ‘Best Hotel in the Czech Republic’ for six consecutive years now.','http://www3.hilton.com/en/hotels/czech-republic/hilton-prague-PRGHITW/index.html?WT.mc_id=zELWAKN0EMEA1HI2DMH3LocalSearch4DGGenericx6PRGHITW','2016-08-08 08:58:50.000000',3),(7,'Hotel La Vela','Via Montanara, 36','Castelnuovo Rangone','Modena','Italy',41051,'059536302',2,0,0,0,1,1,0,1,0,0,'è stato costruito negli anni 80 e recentemente rinnovato con gusto. Si trova a Castelnuovo Rangone (MO) in Via  Montanara, 36. L\' Hotel Ristorante Pizzeria La Vela 2 offre un servizio completo con camere confortevoli, accoglienti e dotate di bagno in camera, televisore, aria condizionata e telefono.','http://www.lavela2.it/','2016-08-08 09:01:31.000000',0),(8,'Hotel Al Cavallino Bianco','Viale Dante, 105','Riccione','Rimini','Italy',47838,'0541600216',4,1,1,0,1,1,0,1,1,0,'Situato a 3 minuti a piedi dalla spiaggia di Riccione, questo hotel moderno con arredi sui toni del bianco dista 10 minuti a piedi dalla fs della citta e 6 km dal parco.','www.hotelcavallinobianco.com','2016-08-08 19:06:25.862000',3),(9,'Hotel Nizza','Viale Gabriele D\'Annunzio, 165','Riccione','Rimini','Italy',47838,'0541641493',2,0,1,0,0,1,1,1,0,0,'sorge sul lungomare di Riccione, di fronte ad una splendida spiaggia che, ogni anno, diventa la meta balneare preferita da turisti stranieri ed italiani.Oltre ad essere ad un passo dalla spiaggia, si sviluppa su 4 piani consentendo così alle stanze di avere una fantastica vista sul mare. Se la vista dalla camera non dovesse bastare, potrete recarvi sul terrazzo/solarium per gustarvi un panorama a 360°','http://www.hotelnizza.it/','2016-08-21 12:51:08.000000',0);
/*!40000 ALTER TABLE `travelbook_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbook_prenotation`
--

DROP TABLE IF EXISTS `travelbook_prenotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelbook_prenotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_in` datetime(6) NOT NULL,
  `check_out` datetime(6) NOT NULL,
  `id_room_id` int(11) NOT NULL,
  `id_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TravelBook_prenotation_25895466` (`id_room_id`),
  KEY `TravelBook_prenotation_3002e0f2` (`id_user_id`),
  CONSTRAINT `TravelBook_prenotation_id_room_id_cc0a8af_fk_TravelBook_room_id` FOREIGN KEY (`id_room_id`) REFERENCES `travelbook_room` (`id`),
  CONSTRAINT `TravelBook_prenotation_id_user_id_5f2a4d0d_fk_auth_user_id` FOREIGN KEY (`id_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbook_prenotation`
--

LOCK TABLES `travelbook_prenotation` WRITE;
/*!40000 ALTER TABLE `travelbook_prenotation` DISABLE KEYS */;
INSERT INTO `travelbook_prenotation` VALUES (11,'2016-10-21 22:00:00.000000','2016-11-05 23:00:00.000000',8,1),(12,'2016-08-25 22:00:00.000000','2016-08-26 22:00:00.000000',4,1),(13,'2016-10-05 22:00:00.000000','2016-10-08 22:00:00.000000',9,1),(14,'2016-08-31 22:00:00.000000','2016-09-02 22:00:00.000000',12,1),(18,'2016-07-19 22:00:00.000000','2016-07-21 22:00:00.000000',5,2),(19,'2016-08-19 22:00:00.000000','2016-08-20 22:00:00.000000',13,3),(21,'2016-07-31 22:00:00.000000','2016-08-30 22:00:00.000000',3,1);
/*!40000 ALTER TABLE `travelbook_prenotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbook_room`
--

DROP TABLE IF EXISTS `travelbook_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelbook_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_room` int(11) NOT NULL,
  `price` double NOT NULL,
  `n_people` int(11) NOT NULL,
  `conditioner` tinyint(1) NOT NULL,
  `kitchenette` tinyint(1) NOT NULL,
  `smoker_room` tinyint(1) NOT NULL,
  `animals_accept` tinyint(1) NOT NULL,
  `id_location_id` int(11) NOT NULL,
  `price_holiday` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TravelBook_roo_id_location_id_25a4a592_fk_TravelBook_location_id` (`id_location_id`),
  CONSTRAINT `TravelBook_roo_id_location_id_25a4a592_fk_TravelBook_location_id` FOREIGN KEY (`id_location_id`) REFERENCES `travelbook_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbook_room`
--

LOCK TABLES `travelbook_room` WRITE;
/*!40000 ALTER TABLE `travelbook_room` DISABLE KEYS */;
INSERT INTO `travelbook_room` VALUES (1,1,120.5,4,1,0,1,0,5,0),(2,2,91.3,2,1,1,0,0,5,0),(3,3,100.3,4,1,1,1,1,5,0),(4,1,70.4,3,1,0,1,0,2,0),(5,2,64.3,6,1,1,0,0,2,0),(6,1,150.3,4,1,1,1,1,1,0),(7,2,140.3,4,0,1,1,0,1,0),(8,3,170.5,6,1,1,1,1,1,0),(9,1,71.3,4,0,1,0,1,6,0),(10,1,116.2,4,1,0,1,1,3,0),(11,2,214.3,6,1,1,1,1,3,0),(12,6,58.2,4,1,0,0,0,8,0),(13,7,61.2,3,0,1,1,0,8,0),(17,9,45.5,6,0,0,0,0,2,0),(18,6,43.4,2,0,0,0,0,4,0);
/*!40000 ALTER TABLE `travelbook_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbook_roomfavorite`
--

DROP TABLE IF EXISTS `travelbook_roomfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelbook_roomfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_favorite_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TravelBook_roomf_room_favorite_id_5c406347_fk_TravelBook_room_id` (`room_favorite_id`),
  KEY `TravelBook_roomfavorite_user_name_id_3e60e002_fk_auth_user_id` (`user_name_id`),
  CONSTRAINT `TravelBook_roomf_room_favorite_id_5c406347_fk_TravelBook_room_id` FOREIGN KEY (`room_favorite_id`) REFERENCES `travelbook_room` (`id`),
  CONSTRAINT `TravelBook_roomfavorite_user_name_id_3e60e002_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbook_roomfavorite`
--

LOCK TABLES `travelbook_roomfavorite` WRITE;
/*!40000 ALTER TABLE `travelbook_roomfavorite` DISABLE KEYS */;
INSERT INTO `travelbook_roomfavorite` VALUES (1,8,3),(2,5,3),(6,8,1);
/*!40000 ALTER TABLE `travelbook_roomfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbook_roomwaitinglist`
--

DROP TABLE IF EXISTS `travelbook_roomwaitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelbook_roomwaitinglist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_in_waitinglist` datetime(6) NOT NULL,
  `check_out_waitinglist` datetime(6) NOT NULL,
  `room_waiting_list_id` int(11) NOT NULL,
  `user_reservetion_id` int(11) NOT NULL,
  `user_waiting_list_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TravelBook_roo_room_waiting_list_id_4b5ea5_fk_TravelBook_room_id` (`room_waiting_list_id`),
  KEY `TravelBook_roomwait_user_reservetion_id_72b1f4ba_fk_auth_user_id` (`user_reservetion_id`),
  KEY `TravelBook_roomwai_user_waiting_list_id_351b3deb_fk_auth_user_id` (`user_waiting_list_id`),
  CONSTRAINT `TravelBook_roo_room_waiting_list_id_4b5ea5_fk_TravelBook_room_id` FOREIGN KEY (`room_waiting_list_id`) REFERENCES `travelbook_room` (`id`),
  CONSTRAINT `TravelBook_roomwai_user_waiting_list_id_351b3deb_fk_auth_user_id` FOREIGN KEY (`user_waiting_list_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `TravelBook_roomwait_user_reservetion_id_72b1f4ba_fk_auth_user_id` FOREIGN KEY (`user_reservetion_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbook_roomwaitinglist`
--

LOCK TABLES `travelbook_roomwaitinglist` WRITE;
/*!40000 ALTER TABLE `travelbook_roomwaitinglist` DISABLE KEYS */;
INSERT INTO `travelbook_roomwaitinglist` VALUES (3,'2016-08-02 22:00:00.000000','2016-08-27 22:00:00.000000',11,3,3),(5,'2016-08-15 22:00:00.000000','2016-09-02 22:00:00.000000',12,2,3),(6,'2016-08-16 22:00:00.000000','2016-08-25 22:00:00.000000',6,2,3),(10,'2016-05-09 22:00:00.000000','2016-05-31 22:00:00.000000',5,1,2),(11,'2016-05-03 22:00:00.000000','2016-05-11 22:00:00.000000',6,1,2),(13,'2016-07-31 22:00:00.000000','2016-08-26 22:00:00.000000',13,3,1);
/*!40000 ALTER TABLE `travelbook_roomwaitinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelbook_vote`
--

DROP TABLE IF EXISTS `travelbook_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travelbook_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_value` double NOT NULL,
  `location_vote_id` int(11) NOT NULL,
  `user_vote_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TravelBook_v_location_vote_id_58e63f3a_fk_TravelBook_location_id` (`location_vote_id`),
  KEY `TravelBook_vote_user_vote_id_589de642_fk_auth_user_id` (`user_vote_id`),
  CONSTRAINT `TravelBook_v_location_vote_id_58e63f3a_fk_TravelBook_location_id` FOREIGN KEY (`location_vote_id`) REFERENCES `travelbook_location` (`id`),
  CONSTRAINT `TravelBook_vote_user_vote_id_589de642_fk_auth_user_id` FOREIGN KEY (`user_vote_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelbook_vote`
--

LOCK TABLES `travelbook_vote` WRITE;
/*!40000 ALTER TABLE `travelbook_vote` DISABLE KEYS */;
INSERT INTO `travelbook_vote` VALUES (14,3,8,1),(19,3,6,1),(20,5,2,1),(25,2,1,2),(26,2,2,2),(27,5,8,3),(28,5,8,3);
/*!40000 ALTER TABLE `travelbook_vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-23 15:38:26
