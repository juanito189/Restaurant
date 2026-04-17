/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.1.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `alimentos`
--

DROP TABLE IF EXISTS `alimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimentos` (
  `idAlimentos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idAlimentos`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimentos`
--

LOCK TABLES `alimentos` WRITE;
/*!40000 ALTER TABLE `alimentos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `alimentos` VALUES
(1,'Manzanas',10.50),
(2,'Pl├ítanos',25.00),
(3,'Naranjas',15.30),
(4,'Peras',12.40),
(5,'Uvas',18.75),
(6,'Mangos',20.00),
(7,'Fresas',8.90),
(8,'Melones',13.20),
(9,'Sand├¡as',30.00),
(10,'Limones',5.50),
(11,'Tomates',22.10),
(12,'Zanahorias',18.25),
(13,'Papayas',19.60),
(14,'Cebollas',14.30),
(15,'Aguacates',24.50),
(16,'Pepinos',11.00),
(17,'Calabacines',16.70),
(18,'Espinacas',7.80),
(19,'Lechugas',9.30),
(20,'Papas',26.40),
(21,'Batatas',15.00),
(22,'Champi├▒ones',13.50),
(23,'Pimientos',21.00),
(24,'Chiles',10.80),
(25,'Br├│coli',14.90),
(26,'Coliflor',12.60),
(27,'Garbanzo',9.40),
(28,'Lentejas',20.70),
(29,'Frijoles',18.90),
(30,'Arroz',50.00),
(31,'Quinua',22.30),
(32,'Pollo',45.60),
(33,'Cerdo',35.00),
(34,'Res',55.70),
(35,'Pescado',48.90),
(36,'Mariscos',40.30),
(37,'Huevos',12.00),
(38,'Leche',25.50),
(39,'Yogur',18.00),
(40,'Queso',29.40),
(41,'Mantequilla',11.90),
(42,'Aceite de oliva',35.60),
(43,'Vinagre',15.70),
(44,'Sal',5.00),
(45,'Az├║car',20.00),
(46,'Miel',22.50),
(47,'Harina',40.00),
(48,'Pan',18.20),
(49,'Pasteles',50.00),
(50,'Galletas',30.80),
(51,'Cereales',28.00),
(52,'Chocolate',35.50),
(53,'Caf├⌐',40.00),
(54,'T├⌐',22.00),
(55,'Jugos',15.90),
(56,'Refrescos',25.00),
(57,'Agua',10.00),
(58,'Helados',45.80),
(59,'Caramelos',12.40),
(60,'Sopas',30.30),
(61,'Salsas',15.60),
(62,'Especias',9.90),
(63,'Hierbas',8.50),
(64,'Almendras',22.00),
(65,'Nueces',28.00),
(66,'Avellanas',25.90),
(67,'Pistachos',30.10),
(68,'Anacardos',35.00),
(69,'Semillas',18.50),
(70,'Avena',20.20),
(71,'Granola',22.30),
(72,'Tortillas',15.00),
(73,'Pizzas',50.00),
(74,'Hamburguesas',45.00),
(75,'Hot dogs',35.00),
(76,'Pasta',40.00),
(77,'Lasa├▒a',48.00),
(78,'Empanadas',30.60),
(79,'Tacos',25.00),
(80,'Sushi',40.00),
(81,'Ceviche',35.50),
(82,'Tamales',20.00),
(83,'Arepas',15.00),
(84,'Churros',28.00),
(85,'Donas',25.50),
(86,'Croissants',30.00),
(87,'Mermeladas',18.40),
(88,'Gelatinas',15.90),
(89,'Pastas de man├¡',20.50),
(90,'Snacks',22.00),
(91,'Barritas',28.00),
(92,'Frutas secas',35.00),
(93,'Vegetales congelados',40.00),
(94,'Carnes procesadas',50.00),
(95,'Alimentos org├ínicos',60.00),
(96,'Suplementos',55.00),
(97,'Tofu',12.00),
(98,'Seitan',15.00),
(99,'Tempeh',18.00),
(100,'Yuca',20.00);
/*!40000 ALTER TABLE `alimentos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `alimentos_platos`
--

DROP TABLE IF EXISTS `alimentos_platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimentos_platos` (
  `id_alimentosPlatos` int(11) NOT NULL AUTO_INCREMENT,
  `id_plato` int(11) NOT NULL,
  `idAlimentos` int(11) NOT NULL,
  `cantidad_utilizada` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_alimentosPlatos`),
  KEY `id_plato` (`id_plato`),
  KEY `idAlimentos` (`idAlimentos`),
  CONSTRAINT `alimentos_platos_ibfk_1` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`),
  CONSTRAINT `alimentos_platos_ibfk_2` FOREIGN KEY (`idAlimentos`) REFERENCES `alimentos` (`idAlimentos`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimentos_platos`
--

LOCK TABLES `alimentos_platos` WRITE;
/*!40000 ALTER TABLE `alimentos_platos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `alimentos_platos` VALUES
(28,36,1,2.00),
(29,36,3,1.50),
(30,36,5,0.80),
(31,37,73,1.00),
(32,38,74,1.00),
(33,38,42,0.05),
(34,38,14,0.10),
(35,39,36,1.20),
(36,39,10,0.30),
(37,39,61,0.10),
(38,40,79,2.00),
(39,40,42,0.05),
(40,40,14,0.10),
(41,41,77,1.50),
(42,41,34,1.00),
(43,41,14,0.10),
(44,42,12,1.20),
(45,42,18,0.80),
(46,42,19,1.00),
(47,43,32,1.50),
(48,43,42,0.20),
(49,44,76,2.00),
(50,44,40,0.50),
(51,44,42,0.10),
(52,45,34,2.00),
(53,45,42,0.20),
(54,45,14,0.10);
/*!40000 ALTER TABLE `alimentos_platos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',3,'add_permission'),
(6,'Can change permission',3,'change_permission'),
(7,'Can delete permission',3,'delete_permission'),
(8,'Can view permission',3,'view_permission'),
(9,'Can add group',2,'add_group'),
(10,'Can change group',2,'change_group'),
(11,'Can delete group',2,'delete_group'),
(12,'Can view group',2,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add alimentos',8,'add_alimentos'),
(26,'Can change alimentos',8,'change_alimentos'),
(27,'Can delete alimentos',8,'delete_alimentos'),
(28,'Can view alimentos',8,'view_alimentos'),
(29,'Can add alimentos platos',9,'add_alimentosplatos'),
(30,'Can change alimentos platos',9,'change_alimentosplatos'),
(31,'Can delete alimentos platos',9,'delete_alimentosplatos'),
(32,'Can view alimentos platos',9,'view_alimentosplatos'),
(33,'Can add cliente',10,'add_cliente'),
(34,'Can change cliente',10,'change_cliente'),
(35,'Can delete cliente',10,'delete_cliente'),
(36,'Can view cliente',10,'view_cliente'),
(37,'Can add domicilios',12,'add_domicilios'),
(38,'Can change domicilios',12,'change_domicilios'),
(39,'Can delete domicilios',12,'delete_domicilios'),
(40,'Can view domicilios',12,'view_domicilios'),
(41,'Can add empleados',7,'add_empleados'),
(42,'Can change empleados',7,'change_empleados'),
(43,'Can delete empleados',7,'delete_empleados'),
(44,'Can view empleados',7,'view_empleados'),
(45,'Can add estadopedido',14,'add_estadopedido'),
(46,'Can change estadopedido',14,'change_estadopedido'),
(47,'Can delete estadopedido',14,'delete_estadopedido'),
(48,'Can view estadopedido',14,'view_estadopedido'),
(49,'Can add item pedido',15,'add_itempedido'),
(50,'Can change item pedido',15,'change_itempedido'),
(51,'Can delete item pedido',15,'delete_itempedido'),
(52,'Can view item pedido',15,'view_itempedido'),
(53,'Can add pedido',16,'add_pedido'),
(54,'Can change pedido',16,'change_pedido'),
(55,'Can delete pedido',16,'delete_pedido'),
(56,'Can view pedido',16,'view_pedido'),
(57,'Can add pedidos',17,'add_pedidos'),
(58,'Can change pedidos',17,'change_pedidos'),
(59,'Can delete pedidos',17,'delete_pedidos'),
(60,'Can view pedidos',17,'view_pedidos'),
(61,'Can add persona',11,'add_persona'),
(62,'Can change persona',11,'change_persona'),
(63,'Can delete persona',11,'delete_persona'),
(64,'Can view persona',11,'view_persona'),
(65,'Can add platos',19,'add_platos'),
(66,'Can change platos',19,'change_platos'),
(67,'Can delete platos',19,'delete_platos'),
(68,'Can view platos',19,'view_platos'),
(69,'Can add platos pedidos',20,'add_platospedidos'),
(70,'Can change platos pedidos',20,'change_platospedidos'),
(71,'Can delete platos pedidos',20,'delete_platospedidos'),
(72,'Can view platos pedidos',20,'view_platospedidos'),
(73,'Can add tiposdedocumentos',13,'add_tiposdedocumentos'),
(74,'Can change tiposdedocumentos',13,'change_tiposdedocumentos'),
(75,'Can delete tiposdedocumentos',13,'delete_tiposdedocumentos'),
(76,'Can view tiposdedocumentos',13,'view_tiposdedocumentos'),
(77,'Can add perfil usuario',18,'add_perfilusuario'),
(78,'Can change perfil usuario',18,'change_perfilusuario'),
(79,'Can delete perfil usuario',18,'delete_perfilusuario'),
(80,'Can view perfil usuario',18,'view_perfilusuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1200000$57BFv0eTWomfNTFaTeDWZL$sapg+g9LmNTkiDtIVwa3MinZSj8ptUUFcRVqLq2C2e4=','2026-03-26 21:51:09.266492',1,'Juanito','','','Jramirezcotacio@gmail.com',1,1,'2026-03-24 23:16:23.768793'),
(2,'pbkdf2_sha256$1200000$LlFecxzTLcxkutIomWJ7GG$64+IW5uXQp+8VWqDx61KhS2QGIyzZxp6fSN/Lszxpfc=','2026-04-16 03:38:15.207546',1,'admin','','','admin@restaurante.com',1,1,'2026-03-26 19:40:18.530634'),
(3,'pbkdf2_sha256$1200000$kffGqEpcoCloYHrO1q6ETO$vKP71ZJhPrVeOZqgQ4oHLo/QulIhVfzD/Tcuzb5KgqY=','2026-04-16 03:40:41.861646',0,'cliente','Juan','','cliente@ejemplo.com',0,1,'2026-03-26 19:45:12.697857');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `puntos_acumulados` int(11) DEFAULT 0,
  PRIMARY KEY (`id_cliente`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cliente` VALUES
(58,1,400),
(59,2,0),
(60,3,0),
(61,4,0),
(62,5,0),
(63,6,0),
(64,7,0),
(65,8,0),
(66,9,0),
(67,10,0),
(68,11,0),
(69,12,0),
(70,13,0),
(71,14,0),
(72,15,0),
(73,16,0),
(74,17,0),
(75,18,0),
(76,19,0),
(77,20,0),
(78,21,0),
(79,22,0),
(80,23,0),
(81,24,0),
(82,25,0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(2,'auth','group'),
(3,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(8,'gestion','alimentos'),
(9,'gestion','alimentosplatos'),
(10,'gestion','cliente'),
(12,'gestion','domicilios'),
(7,'gestion','empleados'),
(14,'gestion','estadopedido'),
(15,'gestion','itempedido'),
(16,'gestion','pedido'),
(17,'gestion','pedidos'),
(18,'gestion','perfilusuario'),
(11,'gestion','persona'),
(19,'gestion','platos'),
(20,'gestion','platospedidos'),
(13,'gestion','tiposdedocumentos'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-03-24 23:14:08.579977'),
(2,'auth','0001_initial','2026-03-24 23:14:09.111186'),
(3,'admin','0001_initial','2026-03-24 23:14:09.217900'),
(4,'admin','0002_logentry_remove_auto_add','2026-03-24 23:14:09.224159'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-03-24 23:14:09.230914'),
(6,'contenttypes','0002_remove_content_type_name','2026-03-24 23:14:09.303855'),
(7,'auth','0002_alter_permission_name_max_length','2026-03-24 23:14:09.352164'),
(8,'auth','0003_alter_user_email_max_length','2026-03-24 23:14:09.384184'),
(9,'auth','0004_alter_user_username_opts','2026-03-24 23:14:09.392879'),
(10,'auth','0005_alter_user_last_login_null','2026-03-24 23:14:09.436126'),
(11,'auth','0006_require_contenttypes_0002','2026-03-24 23:14:09.438449'),
(12,'auth','0007_alter_validators_add_error_messages','2026-03-24 23:14:09.452131'),
(13,'auth','0008_alter_user_username_max_length','2026-03-24 23:14:09.480342'),
(14,'auth','0009_alter_user_last_name_max_length','2026-03-24 23:14:09.508004'),
(15,'auth','0010_alter_group_name_max_length','2026-03-24 23:14:09.536430'),
(16,'auth','0011_update_proxy_permissions','2026-03-24 23:14:09.544134'),
(17,'auth','0012_alter_user_first_name_max_length','2026-03-24 23:14:09.573772'),
(18,'sessions','0001_initial','2026-03-24 23:14:09.617259'),
(19,'gestion','0001_initial','2026-03-26 19:39:46.421513');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `django_session` VALUES
('92jrpl8ufh1jdptjmu4dmk0es4yjbyq4','.eJxVjEEOwiAQAP_C2ZCywJb16L1vICxspWrapLQn499Nkx70OjOZt4pp32rcm6xxKuqqrLr8Mk75KfMhyiPN90XnZd7WifWR6NM2PSxFXrez_RvU1OqxBUNsRwxiKHjpQRBCwEwoXYe5Iw5Ueka23oyOSGwA8AgOvPPOsPp8AbYxNkY:1wDDar:QZce50ESMENFABVE9MHfR0WxBS6Hp1NTpkztVAJV-zo','2026-04-30 03:40:41.863796'),
('iqfh0rj9k81ydadqz1qlneukiwhnnbjc','.eJxVjEEOwiAQAP_C2ZCywJb16L1vICxspWrapLQn499Nkx70OjOZt4pp32rcm6xxKuqqrLr8Mk75KfMhyiPN90XnZd7WifWR6NM2PSxFXrez_RvU1OqxBUNsRwxiKHjpQRBCwEwoXYe5Iw5Ueka23oyOSGwA8AgOvPPOsPp8AbYxNkY:1w5sbp:3E6lhGhJmGes2r2tlocAkV5Cyh-ckIdp6OpDrCjBHgA','2026-04-09 21:51:21.122016');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `id_domicilios` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empleados` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_domicilios`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleados` (`id_empleados`),
  CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `domicilios_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `domicilios_ibfk_3` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `domicilios` VALUES
(1,12,58,9,'Carrera 10 #20-30, Bogot├í'),
(2,13,59,10,'Calle 45 #12-15, Bogot├í'),
(3,14,60,11,'Avenida 68 #34-56, Bogot├í'),
(4,15,61,12,'Calle 80 #22-10, Bogot├í'),
(5,16,62,13,'Carrera 7 #45-20, Bogot├í'),
(6,17,63,14,'Calle 26 #30-40, Bogot├í'),
(7,18,64,15,'Avenida Suba #100-50, Bogot├í'),
(8,19,65,16,'Carrera 15 #120-30, Bogot├í'),
(9,20,66,17,'Calle 170 #25-45, Bogot├í'),
(10,21,67,18,'Avenida Caracas #75-80, Bogot├í'),
(11,22,58,18,'Calle 123, Bogot├í'),
(12,23,58,9,'Calle 123, Bogot├í'),
(13,24,58,10,'Calle 123, Bogot├í'),
(14,25,58,11,'Calle 123, Bogot├í'),
(15,26,58,12,'Calle 123, Bogot├í'),
(16,27,58,13,'Calle 123, Bogot├í'),
(17,28,58,14,'Calle 123, Bogot├í');
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleados` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `salario_mensual` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id_empleados`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `empleados` VALUES
(9,26,2000000.00),
(10,27,2000000.00),
(11,28,2000000.00),
(12,29,2000000.00),
(13,30,2000000.00),
(14,31,2000000.00),
(15,32,2000000.00),
(16,33,2000000.00),
(17,34,2000000.00),
(18,35,2000000.00),
(19,36,2000000.00),
(20,37,2000000.00),
(21,38,2000000.00),
(22,39,2000000.00),
(23,40,2000000.00),
(24,41,2000000.00),
(25,42,2000000.00),
(26,43,2000000.00),
(27,44,2000000.00),
(28,45,2000000.00),
(29,46,2000000.00),
(30,47,2000000.00),
(31,48,2000000.00),
(32,49,2000000.00),
(33,50,2000000.00);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `estadopedido`
--

DROP TABLE IF EXISTS `estadopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadopedido` (
  `idEstadoPedido` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(25) NOT NULL,
  PRIMARY KEY (`idEstadoPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadopedido`
--

LOCK TABLES `estadopedido` WRITE;
/*!40000 ALTER TABLE `estadopedido` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `estadopedido` VALUES
(1,'solicitado'),
(2,'Despachado'),
(3,'Entregado'),
(4,'Cancelado');
/*!40000 ALTER TABLE `estadopedido` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `gestion_perfilusuario`
--

DROP TABLE IF EXISTS `gestion_perfilusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_perfilusuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `gestion_perfilusuario_usuario_id_1876e12e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_perfilusuario`
--

LOCK TABLES `gestion_perfilusuario` WRITE;
/*!40000 ALTER TABLE `gestion_perfilusuario` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gestion_perfilusuario` VALUES
(1,'admin','2026-03-26 19:40:19.472736',2),
(2,'cliente','2026-03-26 19:45:13.597469',3);
/*!40000 ALTER TABLE `gestion_perfilusuario` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `items_pedidos`
--

DROP TABLE IF EXISTS `items_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_pedidos` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(10) unsigned NOT NULL CHECK (`cantidad` >= 0),
  `precio_unitario` decimal(10,2) NOT NULL,
  `plato_id` int(11) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_pedidos`
--

LOCK TABLES `items_pedidos` WRITE;
/*!40000 ALTER TABLE `items_pedidos` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `items_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `id_EstadoPedido` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_EstadoPedido` (`id_EstadoPedido`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_EstadoPedido`) REFERENCES `estadopedido` (`idEstadoPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `pedidos` VALUES
(12,58,'2025-01-20',1),
(13,59,'2025-01-21',2),
(14,60,'2025-01-22',3),
(15,61,'2025-01-23',4),
(16,62,'2025-01-24',1),
(17,63,'2025-01-25',2),
(18,64,'2025-01-26',3),
(19,65,'2025-01-27',4),
(20,66,'2025-01-28',1),
(21,67,'2025-01-29',2),
(22,58,'2025-01-26',1),
(23,58,'2025-01-26',1),
(24,58,'2025-01-26',1),
(25,58,'2025-01-26',1),
(26,58,'2025-01-26',1),
(27,58,'2025-01-26',1),
(28,58,'2025-01-26',1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `TipoDeDocumento_id` int(11) DEFAULT NULL,
  `NumeroDocumento` varchar(10) NOT NULL,
  `PrimerNombre` varchar(25) NOT NULL,
  `SegundoNombre` varchar(25) DEFAULT NULL,
  `PrimerApellido` varchar(25) NOT NULL,
  `SegundoApellido` varchar(25) DEFAULT NULL,
  `FechaDeNacimiento` varchar(25) DEFAULT NULL,
  `Correo` varchar(70) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `TiposDeDocumentos_id` int(11) DEFAULT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `NumeroDocumento` (`NumeroDocumento`),
  KEY `fk_TiposDeDocumentos` (`TiposDeDocumentos_id`),
  CONSTRAINT `fk_TiposDeDocumentos` FOREIGN KEY (`TiposDeDocumentos_id`) REFERENCES `tiposdedocumentos` (`TiposDeDocumentos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `persona` VALUES
(1,'100000001','Juan','Carlos','P├⌐rez','G├│mez','1990-01-15','juan.carlos1@example.com','3001234567',1,1),
(2,'100000002','Mar├¡a',NULL,'L├│pez','Rodr├¡guez','1995-03-22','maria.lopez@example.com','3012345678',2,2),
(1,'100000003','Pedro','Andr├⌐s','Garc├¡a','Mart├¡nez','1988-11-10','pedro.andres@example.com','3023456789',1,3),
(3,'100000004','Ana',NULL,'Ram├¡rez','Hern├índez','2000-07-30','ana.ramirez@example.com','3034567890',3,4),
(2,'100000005','Luis','Miguel','Torres',NULL,'1992-09-12','luis.torres@example.com','3045678901',2,5),
(1,'100000006','Sof├¡a',NULL,'Moreno','Castro','1998-05-25','sofia.moreno@example.com','3056789012',1,6),
(3,'100000007','Andr├⌐s',NULL,'Cruz','Ruiz','1985-12-03','andres.cruz@example.com','3067890123',3,7),
(2,'100000008','Laura','Isabel','S├ínchez','Ortiz','1996-04-18','laura.isabel@example.com','3078901234',2,8),
(1,'100000009','Carlos','Alberto','Jim├⌐nez',NULL,'1993-02-14','carlos.alberto@example.com','3089012345',1,9),
(3,'100000010','Gabriela',NULL,'Vargas','Salazar','1999-10-21','gabriela.vargas@example.com','3090123456',3,10),
(1,'100000011','Felipe','Javier','Castillo','Ruiz','1991-06-08','felipe.castillo@example.com','3101234567',1,11),
(2,'100000012','Camila',NULL,'Pineda','Fern├índez','1994-08-19','camila.pineda@example.com','3112345678',2,12),
(3,'100000013','Mateo',NULL,'Nieto','Vel├ísquez','1997-12-25','mateo.nieto@example.com','3123456789',3,13),
(1,'100000014','Valeria','Beatriz','Rojas','Cabrera','2001-03-03','valeria.rojas@example.com','3134567890',1,14),
(2,'100000015','Jorge',NULL,'Guerrero','Maldonado','1989-07-11','jorge.guerrero@example.com','3145678901',2,15),
(3,'100000016','Isabella','Carolina','Bautista','Morales','1995-05-20','isabella.bautista@example.com','3156789012',3,16),
(1,'100000017','Diego',NULL,'Navarro','Vera','1990-09-15','diego.navarro@example.com','3167890123',1,17),
(2,'100000018','Paula','Andrea','Mu├▒oz','L├│pez','1992-12-29','paula.andrea@example.com','3178901234',2,18),
(3,'100000019','Sebasti├ín',NULL,'Espinoza','Campos','1993-04-04','sebastian.espinoza@example.com','3189012345',3,19),
(1,'100000020','Luc├¡a','Mariana','Mendoza','R├¡os','1996-10-07','lucia.mariana@example.com','3190123456',1,20),
(2,'100000021','Natalia','Fernanda','Hern├índez','Gonz├ílez','1993-08-10','natalia.hernandez@example.com','3201234567',2,21),
(3,'100000022','Mart├¡n','Esteban','C├írdenas','Arias','1987-02-20','martin.cardenas@example.com','3212345678',3,22),
(1,'100000023','Samuel','Tom├ís','Su├írez','Peralta','1991-06-19','samuel.suarez@example.com','3223456789',1,23),
(1,'100001000','Fernanda',NULL,'Morales','P├⌐rez','1999-12-31','fernanda.morales@example.com','3991234567',1,24),
(2,'100000024','Antonio','Luis','Gonz├ílez','Mart├¡nez','1983-11-25','antonio.gonzalez@example.com','3209876543',2,25),
(3,'100000025','Claudia','Beatriz','Fern├índez','Ruiz','1991-04-12','claudia.fernandez@example.com','3210987654',3,26),
(1,'100000026','Ra├║l','Eduardo','Vargas','Soto','1985-07-18','raul.vargas@example.com','3221098765',1,27),
(2,'100000027','Sonia','Mariela','Ram├¡rez','P├⌐rez','1994-08-22','sonia.ramirez@example.com','3232109876',2,28),
(3,'100000028','Julio','C├⌐sar','Torres','M├⌐ndez','1989-01-14','julio.torres@example.com','3243210987',3,29),
(1,'100000029','Diana','Patricia','Mu├▒oz','Rojas','1992-03-08','diana.munoz@example.com','3254321098',1,30),
(2,'100000030','Marta','Elena','Garc├¡a','L├│pez','1987-09-30','marta.garcia@example.com','3265432109',2,31),
(3,'100000031','Felipe','Santiago','Hern├índez','Cordero','1984-11-05','felipe.hernandez@example.com','3276543210',3,32),
(1,'100000032','Carolina','Isabel','G├│mez','Torres','1996-12-15','carolina.gomez@example.com','3287654321',1,33),
(2,'100000033','Eduardo','Jos├⌐','P├⌐rez','Gonz├ílez','1990-06-19','eduardo.perez@example.com','3298765432',2,34),
(3,'100000034','Luc├¡a','Alejandra','Su├írez','Rodr├¡guez','1997-02-08','lucia.suarez@example.com','3309876543',3,35),
(1,'100000035','Joaqu├¡n','Emilio','Mendoza','Salazar','1986-10-12','joaquin.mendoza@example.com','3310987654',1,36),
(2,'100000036','Monica','Alejandra','Mart├¡nez','Vargas','1991-05-26','monica.martinez@example.com','3321098765',2,37),
(3,'100000037','Javier','H├⌐ctor','Escobar','Ram├¡rez','1988-12-01','javier.escobar@example.com','3332109876',3,38),
(1,'100000038','Beatriz','Mar├¡a','L├│pez','Gonz├ílez','1995-08-14','beatriz.lopez@example.com','3343210987',1,39),
(2,'100000039','Carlos','Antonio','├ülvarez','Fuentes','1983-04-19','carlos.alvarez@example.com','3354321098',2,40),
(3,'100000040','Ana','Carolina','S├ínchez','Vargas','1992-07-22','ana.sanchez@example.com','3365432109',3,41),
(1,'100000041','Ricardo','Alejandro','Jim├⌐nez','Paredes','1990-11-11','ricardo.jimenez@example.com','3376543210',1,42),
(2,'100000042','Patricia','Silvia','Gonz├ílez','Morales','1984-02-28','patricia.gonzalez@example.com','3387654321',2,43),
(3,'100000043','Arturo','Ram├│n','Vega','Castro','1987-06-23','arturo.vega@example.com','3398765432',3,44),
(1,'100000044','Isabel','Carmen','Cordero','R├¡os','1998-03-09','isabel.cordero@example.com','3409876543',1,45),
(2,'100000045','Luis','Fernando','Torres','Mendoza','1991-01-17','luis.torres@example.com','3410987654',2,46),
(3,'100000046','Jorge','Luis','V├ísquez','S├ínchez','1989-05-20','jorge.vasquez@example.com','3421098765',3,47),
(1,'100000047','Esteban','Gabriel','Ram├¡rez','M├⌐ndez','1993-07-02','esteban.ramirez@example.com','3432109876',1,48),
(2,'100000048','Ver├│nica','Isabel','Reyes','Mart├¡nez','1996-10-15','veronica.reyes@example.com','3443210987',2,49),
(3,'100000049','Ricardo','Javier','Flores','P├⌐rez','1988-09-28','ricardo.flores@example.com','3454321098',3,50),
(1,'100000050','Gabriela','Estefan├¡a','Ram├¡rez','Gonz├ílez','1992-02-01','gabriela.ramirez@example.com','3465432109',1,51),
(1,'1000100010','Juan','Carlos','P├⌐rez','G├│mez','1990-01-15','juan.perez@gmail.com','3001234567',1,52),
(2,'2000200020','Mar├¡a',NULL,'L├│pez','Mart├¡nez','1992-05-20','maria.lopez@gmail.com','3012345678',2,53),
(3,'3000300030','Andr├⌐s','Felipe','Ram├¡rez','Torres','1995-07-10','andres.ramirez@gmail.com','3023456789',3,54),
(1,'4000400040','Carolina','Andrea','Rodr├¡guez',NULL,'1998-03-25','carolina.rodriguez@gmail.com','3034567890',1,55),
(3,'5000500050','Jorge',NULL,'Hern├índez','Castro','1988-09-12','jorge.hernandez@gmail.com','3045678901',3,56),
(2,'6000600060','M├│nica','Paola','Garc├¡a','Ruiz','1993-11-30','monica.garcia@gmail.com','3056789012',2,57),
(1,'7000700070','Fernando',NULL,'G├│mez','Moreno','1990-06-15','fernando.gomez@gmail.com','3067890123',1,58),
(3,'8000800080','Claudia','Natalia','S├ínchez','Rojas','1997-01-05','claudia.sanchez@gmail.com','3078901234',3,59),
(2,'9000900090','Pedro','Miguel','D├¡az',NULL,'1994-08-22','pedro.diaz@gmail.com','3089012345',2,60),
(1,'1000101010','Luisa','Fernanda','Paredes','Castillo','1992-12-17','luisa.paredes@gmail.com','3090123456',1,61),
(3,'1100110011','Sergio',NULL,'Mej├¡a','P├⌐rez','1991-04-09','sergio.mejia@gmail.com','3101234567',3,62),
(2,'1200120012','Valentina','Alejandra','Castro','Guzm├ín','1996-10-03','valentina.castro@gmail.com','3112345678',2,63),
(1,'1300130013','Camilo','Esteban','Cruz','Herrera','1990-02-21','camilo.cruz@gmail.com','3123456789',1,64),
(3,'1400140014','Natalia',NULL,'Morales','Ortega','1989-07-19','natalia.morales@gmail.com','3134567890',3,65),
(2,'1500150015','Carlos','David','Su├írez','Santos','1993-11-28','carlos.suarez@gmail.com','3145678901',2,66),
(1,'1600160016','Andrea','Paula','R├¡os','Rodr├¡guez','1994-06-06','andrea.rios@gmail.com','3156789012',1,67),
(3,'1700170017','Felipe',NULL,'Guti├⌐rrez','Vargas','1995-03-14','felipe.gutierrez@gmail.com','3167890123',3,68),
(2,'1800180018','Sof├¡a','Isabel','Vel├ísquez','Ram├¡rez','1992-10-23','sofia.velasquez@gmail.com','3178901234',2,69),
(1,'1900190019','Daniel','Alejandro','Mendoza',NULL,'1991-05-01','daniel.mendoza@gmail.com','3189012345',1,70),
(3,'2000200021','Paula','Andrea','Villalba','Garc├¡a','1996-12-11','paula.villalba@gmail.com','3190123456',3,71),
(2,'2100210021','Diego','Fernando','Ortiz','Mart├¡nez','1990-03-16','diego.ortiz@gmail.com','3201234567',2,72),
(1,'2200220022','Alejandra','Luc├¡a','Casta├▒o','G├│mez','1993-09-27','alejandra.castano@gmail.com','3212345678',1,73),
(3,'2300230023','Miguel',NULL,'G├ílvez','C├írdenas','1997-02-07','miguel.galvez@gmail.com','3223456789',3,74),
(2,'2400240024','Clara','Mar├¡a','Rojas','Fern├índez','1994-08-30','clara.rojas@gmail.com','3234567890',2,75),
(1,'2500250025','Jos├⌐','Manuel','Pino','Rodr├¡guez','1992-11-22','jose.pino@gmail.com','3245678901',1,76),
(2,'2600260026','Laura','Estefan├¡a','Arango','Lozano','1995-05-10','laura.arango@gmail.com','3256789012',2,77),
(3,'2700270027','Cristian','Juli├ín','Zapata','Mej├¡a','1994-03-25','cristian.zapata@gmail.com','3267890123',3,78),
(1,'2800280028','Sara','Valentina','Ospina','Ruiz','1998-12-15','sara.ospina@gmail.com','3278901234',1,79),
(3,'2900290029','Juan','David','C├írdenas',NULL,'1993-07-08','juan.cardenas@gmail.com','3289012345',3,80),
(2,'3000300031','Isabella','Mar├¡a','G├│mez','Torres','1992-04-19','isabella.gomez@gmail.com','3290123456',2,81),
(1,'3100310032','Luis','Carlos','Mart├¡nez','Guzm├ín','1991-09-22','luis.martinez@gmail.com','3301234567',1,82),
(3,'3200320033','Daniela',NULL,'Mora','Hern├índez','1996-01-31','daniela.mora@gmail.com','3312345678',3,83),
(2,'3300330034','Sebasti├ín','Felipe','P├⌐rez',NULL,'1990-11-15','sebastian.perez@gmail.com','3323456789',2,84),
(1,'3400340035','Camila','Alejandra','Castro','Moreno','1997-06-10','camila.castro@gmail.com','3334567890',1,85),
(3,'3500350036','Jorge','Luis','Hern├índez','Ram├¡rez','1994-03-03','jorge.luis@gmail.com','3345678901',3,86),
(2,'3600360037','Paola','Andrea','Santos','Rojas','1993-12-20','paola.santos@gmail.com','3356789012',2,87),
(1,'3700370038','Alejandro','Esteban','Ortiz','Vargas','1990-08-05','alejandro.ortiz@gmail.com','3367890123',1,88),
(3,'3800380039','Natalia','Fernanda','L├│pez','Sierra','1992-02-17','natalia.lopez@gmail.com','3378901234',3,89),
(2,'3900390040','Carlos','Andr├⌐s','Ruiz','C├írdenas','1995-09-25','carlos.ruiz@gmail.com','3389012345',2,90),
(1,'4000400041','Valeria',NULL,'Rodr├¡guez','M├⌐ndez','1996-07-30','valeria.rodriguez@gmail.com','3390123456',1,91),
(3,'4100410042','Samuel','Eduardo','Garc├¡a','Lozano','1991-10-18','samuel.garcia@gmail.com','3401234567',3,92),
(2,'4200420043','Juliana','Andrea','Moreno','G├│mez','1994-04-04','juliana.moreno@gmail.com','3412345678',2,93),
(1,'4300430044','Miguel','Antonio','Vargas','Cruz','1993-03-19','miguel.vargas@gmail.com','3423456789',1,94),
(3,'4400440045','Adriana','Paola','Torres','L├│pez','1998-06-23','adriana.torres@gmail.com','3434567890',3,95),
(2,'4500450046','Santiago','David','Mej├¡a','├ülvarez','1997-05-28','santiago.mejia@gmail.com','3445678901',2,96),
(1,'4600460047','Mariana','Isabel','S├ínchez','Ruiz','1992-11-02','mariana.sanchez@gmail.com','3456789012',1,97),
(3,'4700470048','Andr├⌐s','Mauricio','Mu├▒oz','P├⌐rez','1994-08-07','andres.munoz@gmail.com','3467890123',3,98),
(2,'4800480049','Claudia',NULL,'Hern├índez','Gonz├ílez','1991-12-14','claudia.hernandez@gmail.com','3478901234',2,99),
(1,'4900490050','Diego','Fernando','Morales','Ortiz','1990-09-26','diego.morales@gmail.com','3489012345',1,100),
(3,'5000500051','Luc├¡a','Mar├¡a','Rojas','Guzm├ín','1997-01-10','lucia.rojas@gmail.com','3490123456',3,101);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `id_plato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_plato`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `platos` VALUES
(36,'Ensalada de frutas',10000.00),
(37,'Pizza hawaiana',35000.00),
(38,'Hamburguesa especial',28000.00),
(39,'Ceviche de camar├│n',40000.00),
(40,'Tacos al pastor',26000.00),
(41,'Lasa├▒a de carne',42000.00),
(42,'Sopa de verduras',18000.00),
(43,'Pollo asado',30000.00),
(44,'Pasta Alfredo',30000.00),
(45,'Churrasco',45000.00);
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `platos_pedidos`
--

DROP TABLE IF EXISTS `platos_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos_pedidos` (
  `id_platos_pedidos` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_plato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_platos_pedidos`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_plato` (`id_plato`),
  CONSTRAINT `platos_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `platos_pedidos_ibfk_2` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos_pedidos`
--

LOCK TABLES `platos_pedidos` WRITE;
/*!40000 ALTER TABLE `platos_pedidos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `platos_pedidos` VALUES
(1,12,36,2,15000.00),
(2,12,37,1,35000.00),
(3,13,38,3,28000.00),
(4,13,39,1,40000.00),
(5,14,40,4,25000.00),
(6,14,41,1,42000.00),
(7,15,42,2,18000.00),
(8,15,43,1,32000.00),
(9,16,44,3,30000.00),
(10,16,45,1,45000.00),
(11,17,36,1,15000.00),
(12,18,37,2,35000.00),
(13,19,38,1,28000.00),
(14,20,39,2,40000.00),
(15,21,40,1,25000.00),
(16,22,36,2,15000.00),
(17,23,36,2,15000.00),
(18,24,36,2,15000.00),
(19,25,36,2,15000.00),
(20,26,36,2,15000.00),
(21,27,36,2,15000.00),
(22,28,36,2,15000.00);
/*!40000 ALTER TABLE `platos_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tiposdedocumentos`
--

DROP TABLE IF EXISTS `tiposdedocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdedocumentos` (
  `TiposDeDocumentos_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`TiposDeDocumentos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdedocumentos`
--

LOCK TABLES `tiposdedocumentos` WRITE;
/*!40000 ALTER TABLE `tiposdedocumentos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tiposdedocumentos` VALUES
(1,'Cedula De Ciudadania'),
(2,'Cedula De Extrangeria'),
(3,'Tarjeta De Identidad');
/*!40000 ALTER TABLE `tiposdedocumentos` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-15 23:25:11
