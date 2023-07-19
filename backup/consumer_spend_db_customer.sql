-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: consumer_spend_db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `num` int DEFAULT NULL,
  `customer` varchar(64) NOT NULL,
  `age` int DEFAULT NULL,
  `city` text,
  `card_type` text,
  `card_limit` int DEFAULT NULL,
  `company` text,
  `job_segment` text,
  PRIMARY KEY (`customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'A1',76,'BANGALORE','Gold',500000,'Self Employed','Self Employed'),(10,'A10',54,'CALCUTTA','Gold',500000,'C10','Normal Salary'),(100,'A100',36,'COCHIN','Silver',100000,'C5','Salaried_MNC'),(11,'A11',35,'COCHIN','Gold',500000,'C11','Normal Salary'),(12,'A12',51,'MUMBAI','Gold',500000,'Self Employed','Self Employed'),(13,'A13',29,'BANGALORE','Gold',500000,'C13','Salaried_MNC'),(14,'A14',18,'BANGALORE','Gold',500000,'C14','Salaried_Pvt'),(15,'A15',25,'CALCUTTA','Gold',500000,'C15','Govt'),(16,'A16',52,'COCHIN','Gold',500000,'C16','Normal Salary'),(17,'A17',78,'MUMBAI','Gold',500000,'Self Employed','Self Employed'),(18,'A18',34,'BANGALORE','Silver',100000,'C18','Salaried_MNC'),(19,'A19',27,'BANGALORE','Platimum',10000,'C19','Salaried_Pvt'),(2,'A2',71,'CALCUTTA','Silver',100000,'C2','Salaried_MNC'),(20,'A20',27,'CALCUTTA','Platimum',10001,'C20','Govt'),(21,'A21',57,'COCHIN','Platimum',10002,'C21','Normal Salary'),(22,'A22',27,'MUMBAI','Silver',100000,'Self Employed','Self Employed'),(23,'A23',51,'BANGALORE','Silver',100001,'C5','Salaried_MNC'),(24,'A24',53,'DELHI','Silver',100002,'C6','Salaried_Pvt'),(25,'A25',35,'COCHIN','Silver',100003,'C7','Govt'),(26,'A26',38,'PATNA','Gold',500000,'C8','Normal Salary'),(27,'A27',24,'CHENNAI','Gold',500000,'Self Employed','Self Employed'),(28,'A28',36,'TRIVANDRUM','Gold',500000,'C10','Salaried_MNC'),(29,'A29',72,'CALCUTTA','Gold',500000,'C11','Salaried_Pvt'),(3,'A3',34,'COCHIN','Platimum',10000,'C3','Salaried_Pvt'),(30,'A30',25,'BANGALORE','Gold',500000,'C12','Govt'),(31,'A31',63,'CALCUTTA','Gold',500000,'C13','Normal Salary'),(32,'A32',41,'COCHIN','Gold',500000,'Self Employed','Self Employed'),(33,'A33',19,'MUMBAI','Platimum',10002,'C15','Salaried_MNC'),(34,'A34',34,'CALCUTTA','Platimum',100000,'C16','Salaried_Pvt'),(35,'A35',55,'COCHIN','Platimum',100001,'C17','Govt'),(36,'A36',60,'MUMBAI','Platimum',100002,'C18','Normal Salary'),(37,'A37',61,'BANGALORE','Platimum',100003,'C19','Normal Salary'),(38,'A38',47,'CHENNAI','Platimum',500000,'Self Employed','Self Employed'),(39,'A39',78,'TRIVANDRUM','Platimum',500000,'C21','Salaried_MNC'),(4,'A4',47,'MUMBAI','Platimum',10001,'C4','Govt'),(40,'A40',37,'CALCUTTA','Platimum',500000,'C22','Salaried_Pvt'),(41,'A41',18,'COCHIN','Platimum',500000,'C23','Govt'),(42,'A42',50,'MUMBAI','Gold',500000,'C24','Normal Salary'),(43,'A43',21,'BANGALORE','Gold',500000,'Self Employed','Self Employed'),(44,'A44',28,'DELHI','Gold',500000,'C6','Salaried_MNC'),(45,'A45',67,'COCHIN','Gold',500000,'C7','Salaried_Pvt'),(46,'A46',49,'PATNA','Silver',100000,'C8','Govt'),(47,'A47',28,'CHENNAI','Platimum',10000,'C9','Normal Salary'),(48,'A48',42,'TRIVANDRUM','Platimum',10001,'Self Employed','Self Employed'),(49,'A49',39,'CALCUTTA','Platimum',10002,'C11','Salaried_MNC'),(5,'A5',56,'BANGALORE','Platimum',10002,'C5','Normal Salary'),(50,'A50',69,'COCHIN','Platimum',100000,'C12','Salaried_Pvt'),(51,'A51',59,'MUMBAI','Platimum',100001,'C13','Govt'),(52,'A52',50,'BANGALORE','Platimum',100002,'C14','Normal Salary'),(53,'A53',21,'DELHI','Platimum',100003,'C15','Normal Salary'),(54,'A54',46,'COCHIN','Platimum',500000,'C16','Normal Salary'),(55,'A55',43,'PATNA','Platimum',500000,'C17','Normal Salary'),(56,'A56',60,'CHENNAI','Platimum',500000,'C18','Normal Salary'),(57,'A57',37,'TRIVANDRUM','Silver',100001,'C19','Normal Salary'),(58,'A58',32,'CALCUTTA','Silver',100002,'C20','Normal Salary'),(59,'A59',74,'BANGALORE','Silver',100003,'C21','Normal Salary'),(6,'A6',70,'DELHI','Silver',100000,'Self Employed','Self Employed'),(60,'A60',28,'CALCUTTA','Gold',500000,'C22','Salaried_Pvt'),(61,'A61',44,'COCHIN','Gold',500000,'C23','Govt'),(62,'A62',39,'MUMBAI','Gold',500000,'C24','Normal Salary'),(63,'A63',18,'BANGALORE','Gold',500000,'Self Employed','Self Employed'),(64,'A64',77,'DELHI','Gold',500000,'C26','Salaried_MNC'),(65,'A65',41,'COCHIN','Gold',500000,'C27','Salaried_Pvt'),(66,'A66',77,'PATNA','Gold',500000,'C28','Govt'),(67,'A67',54,'CHENNAI','Gold',500000,'C29','Normal Salary'),(68,'A68',18,'TRIVANDRUM','Silver',100000,'Self Employed','Self Employed'),(69,'A69',33,'CALCUTTA','Platimum',10000,'Self Employed','Self Employed'),(7,'A7',26,'COCHIN','Silver',100001,'C7','Salaried_MNC'),(70,'A70',18,'MUMBAI','Platimum',10001,'Self Employed','Self Employed'),(71,'A71',34,'MUMBAI','Platimum',10002,'Self Employed','Self Employed'),(72,'A72',63,'BANGALORE','Silver',100000,'Self Employed','Self Employed'),(73,'A73',75,'CALCUTTA','Silver',100001,'Self Employed','Self Employed'),(74,'A74',51,'COCHIN','Silver',100002,'Self Employed','Self Employed'),(75,'A75',36,'MUMBAI','Silver',100003,'Self Employed','Self Employed'),(76,'A76',66,'BANGALORE','Silver',500000,'Self Employed','Self Employed'),(77,'A77',35,'BANGALORE','Silver',500000,'Self Employed','Self Employed'),(78,'A78',71,'CALCUTTA','Silver',500000,'Self Employed','Self Employed'),(79,'A79',60,'COCHIN','Silver',500000,'C41','Govt'),(8,'A8',67,'PATNA','Silver',100002,'C8','Salaried_Pvt'),(80,'A80',39,'MUMBAI','Silver',500000,'C3','Govt'),(81,'A81',65,'BANGALORE','Gold',500000,'C4','Govt'),(82,'A82',52,'DELHI','Gold',500000,'C5','Govt'),(83,'A83',37,'COCHIN','Platimum',10002,'C6','Govt'),(84,'A84',70,'PATNA','Silver',100000,'C7','Govt'),(85,'A85',59,'CHENNAI','Silver',100001,'C8','Govt'),(86,'A86',25,'TRIVANDRUM','Silver',100002,'C9','Govt'),(87,'A87',27,'CALCUTTA','Silver',100003,'C10','Govt'),(88,'A88',63,'BANGALORE','Gold',500000,'C11','Govt'),(89,'A89',72,'CALCUTTA','Gold',500000,'C12','Govt'),(9,'A9',79,'CHENNAI','Silver',100003,'C9','Govt'),(90,'A90',18,'COCHIN','Gold',500000,'C13','Govt'),(91,'A91',41,'MUMBAI','Gold',500000,'C14','Govt'),(92,'A92',78,'BANGALORE','Gold',500000,'C15','Govt'),(93,'A93',56,'DELHI','Gold',500000,'C16','Govt'),(94,'A94',31,'COCHIN','Gold',500000,'C17','Govt'),(95,'A95',62,'PATNA','Gold',500000,'C18','Salaried_MNC'),(96,'A96',54,'CHENNAI','Silver',100000,'C19','Salaried_Pvt'),(97,'A97',58,'TRIVANDRUM','Platimum',10000,'C20','Govt'),(98,'A98',51,'CALCUTTA','Platimum',10001,'C21','Normal Salary'),(99,'A99',35,'CALCUTTA','Platimum',10002,'Self Employed','Self Employed');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-19 18:05:50
