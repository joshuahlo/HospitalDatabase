CREATE DATABASE  IF NOT EXISTS `hospitaldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospitaldb`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` time NOT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (1,1,1,'2023-10-10','09:00:00','Routine Checkup'),(2,2,2,'2023-10-11','10:30:00','Follow-up Visit'),(3,3,3,'2023-10-12','11:00:00','Treatment Review'),(4,4,4,'2023-10-13','13:00:00','Emergency Consultation'),(5,5,5,'2023-10-14','14:30:00','Prescription Renewal'),(6,6,6,'2023-10-15','15:00:00','Physical Therapy Session'),(7,7,7,'2023-10-16','16:00:00','Skin Examination'),(8,8,8,'2023-10-17','08:30:00','Psychiatric Evaluation'),(9,9,9,'2023-10-18','10:00:00','Gastroenterology Consultation');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `DepartmentName` varchar(255) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DepartmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Cardiology','Building A'),('Dermatology','Building G'),('Emergency','Building E'),('Gastroenterology','Building I'),('Neurology','Building B'),('Oncology','Building C'),('Orthopedics','Building F'),('Pediatrics','Building D'),('Psychiatry','Building H');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DepartmentName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `DepartmentName` (`DepartmentName`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`DepartmentName`) REFERENCES `Department` (`DepartmentName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'John','Doe','Cardiology'),(2,'Joshua','Lo','Pediatrics'),(3,'Emily','Jones','Oncology'),(4,'Michael','Brown','Pediatrics'),(5,'David','Davis','Emergency'),(6,'Olivia','White','Orthopedics'),(7,'William','Taylor','Dermatology'),(8,'Sophia','Lee','Psychiatry'),(9,'James','Wilson','Gastroenterology');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `EquipmentID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`EquipmentID`),
  KEY `DepartmentName` (`DepartmentName`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`DepartmentName`) REFERENCES `Department` (`DepartmentName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'X-Ray Machine','Cardiology','Available'),(2,'MRI Scanner','Neurology','In Use'),(3,'CT Scanner','Oncology','Maintenance'),(4,'Ultrasound Machine','Cardiology','Available'),(5,'EKG Machine','Cardiology','In Use'),(6,'Ventilator','Emergency','Available'),(7,'Defibrillator','Emergency','In Use'),(8,'Operating Table','Pediatrics','Available'),(9,'Anesthesia Machine','Pediatrics','Maintenance');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalRecord`
--

DROP TABLE IF EXISTS `MedicalRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MedicalRecord` (
  `RecordID` int NOT NULL AUTO_INCREMENT,
  `VisitDate` date DEFAULT NULL,
  `Diagnosis` varchar(255) NOT NULL,
  `Treatment` varchar(255) NOT NULL,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `medicalrecord_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medicalrecord_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalRecord`
--

LOCK TABLES `MedicalRecord` WRITE;
/*!40000 ALTER TABLE `MedicalRecord` DISABLE KEYS */;
INSERT INTO `MedicalRecord` VALUES (1,'2023-01-01','Hypertension','Medication',1,1),(2,'2023-02-15','Migraine','Medication and Rest',2,2),(3,'2023-03-20','Cancer','Chemotherapy',3,3),(4,'2023-04-10','Fracture','Casting',4,4),(5,'2023-05-05','Asthma','Inhaler',5,5),(6,'2023-06-01','Arthritis','Physical Therapy',6,6),(7,'2023-07-15','Eczema','Topical Cream',7,7),(8,'2023-08-20','Depression','Counseling',8,8),(9,'2023-09-10','Ulcer','Medication',9,9);
/*!40000 ALTER TABLE `MedicalRecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_medical_update` AFTER INSERT ON `medicalrecord` FOR EACH ROW BEGIN
    UPDATE Status
    SET CurrentStatus = 'Admitted'
    WHERE PatientID = NEW.PatientID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nurse` (
  `NurseID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NurseID`),
  KEY `DepartmentName` (`DepartmentName`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`DepartmentName`) REFERENCES `Department` (`DepartmentName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse`
--

LOCK TABLES `Nurse` WRITE;
/*!40000 ALTER TABLE `Nurse` DISABLE KEYS */;
INSERT INTO `Nurse` VALUES (1,'Sarah','Wilson','Cardiology','678-901-2345','sarahwilson@example.com'),(2,'James','Moore','Neurology','789-012-3456','jamesmoore@example.com'),(3,'Linda','Taylor','Oncology','890-123-4567','lindataylor@example.com'),(4,'Robert','Anderson','Pediatrics','901-234-5678','robertanderson@example.com'),(5,'Patricia','Thomas','Emergency','012-345-6789','patriciathomas@example.com'),(6,'Lisa','Martinez','Orthopedics','123-456-7890','lisamartinez@example.com'),(7,'Mark','Robinson','Dermatology','234-567-8901','markrobinson@example.com'),(8,'Nancy','Clark','Psychiatry','345-678-9012','nancyclark@example.com'),(9,'Steven','Lewis','Gastroenterology','456-789-0123','stevenlewis@example.com');
/*!40000 ALTER TABLE `Nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(10) NOT NULL,
  `HomeAddress` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`DoctorID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'Alice','Martin','1980-05-01','Female','123 Main St','555-123-4567','alicemartin@example.com',1),(2,'Bob','Lewis','1992-11-12','Male','456 Maple Ave','555-234-5678','boblewis@example.com',2),(3,'Carol','Clark','1975-07-23','Female','789 Oak Dr','555-345-6789','carolclark@example.com',3),(4,'Dan','Rodriguez','1988-02-17','Male','321 Pine Ln','555-456-7890','danrodriguez@example.com',4),(5,'Eve','Lopez','1990-09-30','Female','654 Elm St','555-567-8901','evelopez@example.com',5),(6,'Frank','Gonzalez','1965-08-09','Male','987 Cedar Rd','555-678-9012','frankgonzalez@example.com',6),(7,'Grace','Patel','1983-03-15','Female','210 Spruce St','555-789-0123','gracepatel@example.com',7),(8,'Henry','Wright','1971-06-28','Male','468 Birch Ave','555-890-1234','henrywright@example.com',8),(9,'Isla','Murphy','1999-12-30','Female','159 Willow Ln','555-901-2345','islamurphy@example.com',9);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PatientNurse`
--

DROP TABLE IF EXISTS `PatientNurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PatientNurse` (
  `PatientID` int NOT NULL,
  `NurseID` int NOT NULL,
  PRIMARY KEY (`PatientID`,`NurseID`),
  KEY `NurseID` (`NurseID`),
  CONSTRAINT `patientnurse_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patientnurse_ibfk_2` FOREIGN KEY (`NurseID`) REFERENCES `Nurse` (`NurseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PatientNurse`
--

LOCK TABLES `PatientNurse` WRITE;
/*!40000 ALTER TABLE `PatientNurse` DISABLE KEYS */;
/*!40000 ALTER TABLE `PatientNurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescription` (
  `PrescriptionID` int NOT NULL AUTO_INCREMENT,
  `Medication` varchar(255) NOT NULL,
  `Dosage` varchar(255) NOT NULL,
  `Duration` varchar(255) NOT NULL,
  `PatientID` int NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` VALUES (1,'Medicine A','50mg','30 days',1),(2,'Medicine B','100mg','14 days',2),(3,'Medicine C','200mg','60 days',3),(4,'Medicine D','25mg','7 days',4),(5,'Medicine E','10mg','5 days',5),(6,'Medicine F','75mg','20 days',6),(7,'Medicine G','150mg','10 days',7),(8,'Medicine H','120mg','45 days',8),(9,'Medicine I','80mg','25 days',9);
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Status` (
  `PatientID` int NOT NULL,
  `CurrentStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`PatientID`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES (1,'Admitted'),(2,'Ready for Discharge'),(3,'Discharged'),(4,'Admitted'),(5,'Discharged'),(6,'Ready for Discharge'),(7,'Admitted'),(8,'Discharged'),(9,'Expired');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospitaldb'
--
/*!50003 DROP FUNCTION IF EXISTS `avg_patient_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `avg_patient_age`() RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN 
    DECLARE result decimal(9,2);
    SELECT AVG(TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE())) INTO result
    FROM Patient;
    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointments_by_department` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `appointments_by_department`()
BEGIN
    SELECT DepartmentName, COUNT(AppointmentID) AS num_appointments
    FROM Appointment
    JOIN Doctor ON Appointment.DoctorID = Doctor.DoctorID
    GROUP BY DepartmentName
    ORDER BY num_appointments DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_appointment`(
    IN patientID_p INT,
    IN doctorID_p INT,
    IN appointmentDate_p DATE,
    IN appointmentTime_p TIME,
    IN purpose_p VARCHAR(255)
)
BEGIN
    DECLARE patient_check INT DEFAULT 0;
    DECLARE doctor_check INT DEFAULT 0;

    -- Check if the patient exists
    SELECT COUNT(*) INTO patient_check
    FROM Patient
    WHERE PatientID = patientID_p;

    -- Check if the doctor exists
    SELECT COUNT(*) INTO doctor_check
    FROM Doctor
    WHERE DoctorID = doctorID_p;

    -- If either does not exist, raise an error and terminate
    IF patient_check = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The specified patient does not exist.';
    ELSEIF doctor_check = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The specified doctor does not exist.';
    ELSE
        -- Insert the new appointment
        INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, AppointmentTime, Purpose)
        VALUES (patientID_p, doctorID_p, appointmentDate_p, appointmentTime_p, purpose_p);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_doc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_doc`(

    IN doctorfn_p VARCHAR(50),
    IN doctorln_p VARCHAR(50),
    IN department_p varchar(50)
)
BEGIN
    DECLARE department_check INT DEFAULT 0;

    -- Check if the department exists
    SELECT COUNT(*) INTO department_check
    FROM Department
    WHERE DepartmentName = department_p;

    -- If department does not exist, raise an error and terminate
    IF department_check = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The specified department does not exist.';
    ELSE

        -- Insert the new doctor
        INSERT INTO Doctor (FirstName, LastName, DepartmentName)
        VALUES (doctorfn_p, doctorln_p, department_p);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_patient2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_patient2`(
    IN firstname_p VARCHAR(50),
    IN lastname_p VARCHAR(50),
    IN dateofbirth_p DATE,
    IN gender_p VARCHAR(50),
    IN homeaddress_p VARCHAR(50),
    IN phonenum_p VARCHAR(50),
    IN email_p VARCHAR(50),
    IN doctorfn_p VARCHAR(50),
    IN doctorln_p VARCHAR(50)
)
BEGIN
    DECLARE d_id INT DEFAULT 0;
    DECLARE p_id INT DEFAULT 0;
    DECLARE doctor_check INT DEFAULT 0;
    DECLARE patient_check INT DEFAULT 0;

    -- Check if the doctor exists
    SELECT COUNT(*) INTO doctor_check
    FROM Doctor
    WHERE FirstName = doctorfn_p AND LastName = doctorln_p;

    -- If doctor does not exist, raise an error and terminate
    IF doctor_check = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The specified doctor does not exist.';
    ELSE
        -- Fetch the DoctorID
        SELECT DoctorID INTO d_id
        FROM Doctor
        WHERE FirstName = doctorfn_p AND LastName = doctorln_p;

        -- Check if the patient exists
        SELECT COUNT(*) INTO patient_check
        FROM Patient
        WHERE FirstName = firstname_p AND LastName = lastname_p AND DateOfBirth = dateofbirth_p;

        -- Insert patient if not exists
        IF patient_check = 0 THEN
            INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, HomeAddress, PhoneNumber, Email, DoctorID)
            VALUES (firstname_p, lastname_p, dateofbirth_p, gender_p, homeaddress_p, phonenum_p, email_p, d_id);

            -- Optionally, fetch the new patient ID if needed for further processing
            SELECT LAST_INSERT_ID() INTO p_id;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePatientRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePatientRecord`(
    IN fn_p VARCHAR(50),
    IN ln_p VARCHAR(50),
    IN dob_p DATE
)
BEGIN
    DECLARE _PatientID INT DEFAULT 0;
    START TRANSACTION;

    SELECT PatientID INTO _PatientID FROM Patient
    WHERE FirstName = fn_p AND LastName = ln_p AND DateOfBirth = dob_p;

    IF _PatientID = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No patient found with the given details';
    ELSE
        DELETE FROM Appointment
        WHERE PatientID = _PatientID;

        DELETE FROM Patient
        WHERE PatientID = _PatientID;

        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `doctors_patients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doctors_patients`(in doctorfn_p varchar(50), doctorln_p varchar(50))
begin   
    DECLARE doctor_check INT DEFAULT 0;

    -- Check if the doctor exists
    SELECT COUNT(*) INTO doctor_check
    FROM Doctor
    WHERE FirstName = doctorfn_p AND LastName = doctorln_p;

    IF doctor_check = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The specified doctor does not exist.';
	else
		select p.FirstName, p.LastName, p.DateOfBirth, p.Gender, p.HomeAddress, p.PhoneNumber
		from Patient p
		join Doctor d
		on d.DoctorID=p.DoctorID
		where doctorfn_p=d.FirstName and doctorln_p=d.LastName;
    end if; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prescription_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prescription_patient`()
BEGIN
    SELECT p.FirstName, p.LastName, Medication, Dosage, Duration
    FROM Prescription a
    JOIN Patient p
    ON p.PatientID = a.PatientID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDoctor`(
    IN docID INT,
    IN fName VARCHAR(255),
    IN lName VARCHAR(255),
    IN deptName VARCHAR(255)
)
BEGIN
    UPDATE Doctor SET
        FirstName = fName,
        LastName = lName,
        DepartmentName = deptName
    WHERE DoctorID = docID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMedicalRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMedicalRecord`(
    IN recID INT,
    IN visitDate DATE,
    IN diagnosis VARCHAR(255),
    IN treatment VARCHAR(255),
    IN patID INT,
    IN docID INT
)
BEGIN
    UPDATE MedicalRecord SET
        VisitDate = visitDate,
        Diagnosis = diagnosis,
        Treatment = treatment,
        PatientID = patID,
        DoctorID = docID
    WHERE RecordID = recID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePatient`(
    IN patID INT,
    IN fName VARCHAR(255),
    IN lName VARCHAR(255),
    IN dob DATE,
    IN gender VARCHAR(10),
    IN address VARCHAR(255),
    IN phone VARCHAR(20),
    IN email VARCHAR(255),
    IN docID INT
)
BEGIN
    UPDATE Patient SET
        FirstName = fName,
        LastName = lName,
        DateOfBirth = dob,
        Gender = gender,
        HomeAddress = address,
        PhoneNumber = phone,
        Email = email,
        DoctorID = docID
    WHERE PatientID = patID;
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

-- Dump completed on 2024-04-17 22:40:48
