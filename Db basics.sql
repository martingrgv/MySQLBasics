-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `datetimetest`
--

DROP TABLE IF EXISTS `datetimetest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datetimetest` (
  `my_date` date DEFAULT NULL,
  `my_time` time DEFAULT NULL,
  `my_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datetimetest`
--

LOCK TABLES `datetimetest` WRITE;
/*!40000 ALTER TABLE `datetimetest` DISABLE KEYS */;
INSERT INTO `datetimetest` VALUES ('2023-10-02','16:03:48','2023-10-02 16:03:48');
/*!40000 ALTER TABLE `datetimetest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donators`
--

DROP TABLE IF EXISTS `donators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donators` (
  `donator_id` int NOT NULL AUTO_INCREMENT,
  `donator_name` varchar(20) DEFAULT 'UNKNOWN',
  PRIMARY KEY (`donator_id`),
  KEY `first_name_idx` (`donator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donators`
--

LOCK TABLES `donators` WRITE;
/*!40000 ALTER TABLE `donators` DISABLE KEYS */;
INSERT INTO `donators` VALUES (1,'Appple'),(4,'BogOS'),(2,'CostaCoffe'),(3,'Gabroveca');
/*!40000 ALTER TABLE `donators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `email`
--

DROP TABLE IF EXISTS `email`;
/*!50001 DROP VIEW IF EXISTS `email`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `email` AS SELECT 
 1 AS `email_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_attendance`
--

DROP TABLE IF EXISTS `employee_attendance`;
/*!50001 DROP VIEW IF EXISTS `employee_attendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_attendance` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `hourly_pay` decimal(5,2) DEFAULT '10.00',
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `referral_id` int DEFAULT NULL,
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `chk_hourly_pay` CHECK ((`hourly_pay` >= 10.00))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Eugene','Krabs',180.00,374400.00,'1999-05-01','krabby.patty@BikiniBottom.com','0898433921',NULL),(2,'Squidward','Tentacles',100.00,208000.00,'1995-05-01','music.squid@BikiniBottom.com','897939200',1),(3,'SpongeBob','SquarePants',100.00,208000.00,'1995-05-01','square.sponge@BikiniBottom.com','893214453',1),(4,'Patrick','Star',10.00,20800.00,NULL,NULL,NULL,3),(5,'Sandra','Cheeks',25.25,52520.00,'2001-03-23','wild.squirrel@BikiniBottom.com',NULL,3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `expense_name` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'Food',30.00),(2,'Food',15.99),(3,'Food',13.24),(4,'Bills',145.00),(5,'Rent',750.00);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `income_id` int NOT NULL AUTO_INCREMENT,
  `income_name` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`income_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'Card',500.00),(2,'Card',300.00),(3,'Card',1500.00),(4,'Job',4200.00);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int DEFAULT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  UNIQUE KEY `product_name` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop',1999.00),(2,'Computer',2450.00),(3,'Keyboard',319.99),(4,'Mouse',124.99),(6,'Mouse pad',50.00),(7,'Led lights',19.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT '0.00',
  `date_time` date DEFAULT NULL,
  `donator_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transactions_id` (`donator_id`),
  CONSTRAINT `fk_transactions_id` FOREIGN KEY (`donator_id`) REFERENCES `donators` (`donator_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1400.00,NULL,2),(2,3800.00,NULL,1),(3,1000.00,NULL,3),(4,1000.00,NULL,4);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `email`
--

/*!50001 DROP VIEW IF EXISTS `email`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `email` AS select `employees`.`email_address` AS `email_address` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_attendance`
--

/*!50001 DROP VIEW IF EXISTS `employee_attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_attendance` AS select `employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name` from `employees` */;
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

-- Dump completed on 2023-10-04 16:55:05
