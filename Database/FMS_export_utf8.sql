-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: FMS
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `SeatID` int NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `BookingDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookingID`),
  UNIQUE KEY `TransactionID` (`TransactionID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SeatID` (`SeatID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `registered_user` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (2,2,2,'TXN1002','2025-10-10 23:50:30'),(3,3,10,'TXN1003','2025-10-10 23:50:30');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `FlightID` int NOT NULL AUTO_INCREMENT,
  `RouteID` int NOT NULL,
  `TotalSeats` int NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `DepartureTime` datetime NOT NULL,
  `FlightName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FlightID`),
  KEY `RouteID` (`RouteID`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,1,5,'2025-10-12 11:00:00','2025-10-12 09:00:00','Indigo'),(2,1,5,'2025-10-12 16:00:00','2025-10-12 14:00:00','Air India'),(3,2,5,'2025-10-12 13:30:00','2025-10-12 10:00:00','Spice Jet'),(4,3,5,'2025-10-12 15:00:00','2025-10-12 12:30:00','Vistara');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `TransactionID` varchar(50) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Status` enum('Success','Pending','Failed') NOT NULL,
  `PaymentMode` enum('Card','UPI','NetBanking') NOT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('TXN1002',5000.00,'Success','UPI'),('TXN1003',8000.00,'Pending','NetBanking');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `PilotID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`PilotID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (1,'Captain Rajesh Kumar'),(2,'Captain Priya Sharma'),(3,'Captain Anil Verma');
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot_assignment`
--

DROP TABLE IF EXISTS `pilot_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot_assignment` (
  `FlightID` int NOT NULL,
  `PilotID` int NOT NULL,
  PRIMARY KEY (`FlightID`,`PilotID`),
  KEY `PilotID` (`PilotID`),
  CONSTRAINT `pilot_assignment_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`) ON DELETE CASCADE,
  CONSTRAINT `pilot_assignment_ibfk_2` FOREIGN KEY (`PilotID`) REFERENCES `pilot` (`PilotID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot_assignment`
--

LOCK TABLES `pilot_assignment` WRITE;
/*!40000 ALTER TABLE `pilot_assignment` DISABLE KEYS */;
INSERT INTO `pilot_assignment` VALUES (1,1),(4,1),(2,2),(3,3);
/*!40000 ALTER TABLE `pilot_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_user`
--

DROP TABLE IF EXISTS `registered_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registered_user` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_user`
--

LOCK TABLES `registered_user` WRITE;
/*!40000 ALTER TABLE `registered_user` DISABLE KEYS */;
INSERT INTO `registered_user` VALUES (1,'Rahul Sharma','rahul@example.com','pass123'),(2,'Anjali Mehta','anjali@example.com','pass456'),(3,'Vikram Singh','vikram@example.com','pass789');
/*!40000 ALTER TABLE `registered_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `RouteID` int NOT NULL AUTO_INCREMENT,
  `Source` varchar(100) NOT NULL,
  `Destination` varchar(100) NOT NULL,
  `Duration` time DEFAULT NULL,
  `Distance` float DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Delhi','Mumbai','02:00:00',1400),(2,'Delhi','Bangalore','03:30:00',2150),(3,'Mumbai','Chennai','02:30:00',1230),(4,'Kolkata','Delhi','02:45:00',1500),(5,'Hyderabad','Mumbai','01:50:00',710);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` int NOT NULL AUTO_INCREMENT,
  `FlightID` int NOT NULL,
  `SeatNumber` varchar(10) NOT NULL,
  `Category` enum('Economy','Business','First') NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Status` enum('Available','Booked') NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`SeatID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'1A','Economy',5000.00,'Available'),(2,1,'2A','Economy',5000.00,'Available'),(3,1,'3A','Economy',5000.00,'Available'),(4,1,'1B','Business',8000.00,'Available'),(5,1,'2B','Business',8000.00,'Booked'),(6,2,'3B','Economy',5000.00,'Booked'),(7,2,'1A','Economy',5000.00,'Available'),(8,2,'2A','Economy',5000.00,'Available'),(9,2,'3A','Business',8000.00,'Available'),(10,2,'1B','Business',8000.00,'Available'),(11,3,'2B','Economy',6000.00,'Available'),(12,3,'3B','Economy',6000.00,'Available'),(13,3,'1A','Business',9000.00,'Available'),(14,3,'2A','Business',9000.00,'Booked'),(15,3,'3A','Business',9000.00,'Available'),(16,4,'1B','Economy',4500.00,'Available'),(17,4,'2B','Economy',4500.00,'Booked'),(18,4,'3B','Business',7000.00,'Available'),(19,4,'1A','Business',7000.00,'Available'),(20,4,'2A','Business',7000.00,'Available');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'FMS'
--
/*!50003 DROP PROCEDURE IF EXISTS `available_seats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_seats`(
    IN p_flightId INT
)
BEGIN
    SELECT SeatID, SeatNumber, Category, Price
    FROM Seat
    WHERE FlightID = p_flightId
      AND Status = 'Available';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `booked_seats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `booked_seats`(
    IN p_flightId INT
)
BEGIN
    SELECT SeatID, SeatNumber, Category, Price
    FROM Seat
    WHERE FlightID = p_flightId
      AND Status = 'Booked';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `book_seat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `book_seat`(
    IN p_customerId INT,
    IN p_seatId INT,
    IN p_transactionId VARCHAR(50),
    IN p_amount DECIMAL(10,2),
    IN p_paymentMode ENUM('Card','UPI','NetBanking')
)
BEGIN
    DECLARE seatStatus ENUM('Available','Booked');

    
    SELECT Status INTO seatStatus
    FROM Seat
    WHERE SeatID = p_seatId;

    IF seatStatus = 'Available' THEN
        
        UPDATE Seat
        SET Status = 'Booked'
        WHERE SeatID = p_seatId;

        
        INSERT INTO Booking (CustomerID, SeatID, TransactionID, BookingDate)
        VALUES (p_customerId, p_seatId, p_transactionId, NOW());

        
        INSERT INTO Payment (TransactionID, Amount, Status, PaymentMode)
        VALUES (p_transactionId, p_amount, 'Success', p_paymentMode);

        SELECT 'Booking Successful' AS Message;
    ELSE
        SELECT 'Seat already booked' AS Message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_booking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_booking`(
    IN p_bookingId INT
)
BEGIN
    DECLARE seat INT;
    DECLARE txn VARCHAR(50);

    
    SELECT SeatID, TransactionID INTO seat, txn
    FROM Booking
    WHERE BookingID = p_bookingId;

    
    UPDATE Seat
    SET Status = 'Available'
    WHERE SeatID = seat;

    
    DELETE FROM Booking
    WHERE BookingID = p_bookingId;

    
    DELETE FROM Payment
    WHERE TransactionID = txn;

    SELECT 'Booking Cancelled Successfully' AS Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_flight`(
    IN p_src VARCHAR(50),
    IN p_dst VARCHAR(50),
    IN p_date DATE
)
BEGIN
    SELECT
        f.FlightID,
        f.FlightName,
        r.Source,
        r.Destination,
        f.DepartureTime,
        f.ArrivalTime,
        COUNT(s.SeatID) AS AvailableSeats
    FROM Flight f
    JOIN Route r ON f.RouteID = r.RouteID
    JOIN Seat s ON s.FlightID = f.FlightID
    WHERE r.Source = p_src
      AND r.Destination = p_dst
      AND DATE(f.DepartureTime) = p_date
    GROUP BY f.FlightID, f.FlightName, r.Source, r.Destination, f.DepartureTime, f.ArrivalTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_pilot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_pilot`(
    IN p_flightId INT,
    IN p_pilotId INT
)
BEGIN
    
    DELETE FROM Pilot_Assignment
    WHERE FlightID = p_flightId;

    
    INSERT INTO Pilot_Assignment (FlightID, PilotID)
    VALUES (p_flightId, p_pilotId);

    SELECT 'Pilot Updated Successfully' AS Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-23 11:51:38
