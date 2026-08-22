CREATE DATABASE  IF NOT EXISTS `indian_healthcare_data_2026_analysis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `indian_healthcare_data_2026_analysis`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: indian_healthcare_data_2026_analysis
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Temporary view structure for view `patient_visits_reconstructed`
--

DROP TABLE IF EXISTS `patient_visits_reconstructed`;
/*!50001 DROP VIEW IF EXISTS `patient_visits_reconstructed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_visits_reconstructed` AS SELECT 
 1 AS `Patient_ID`,
 1 AS `Age`,
 1 AS `Gender`,
 1 AS `State`,
 1 AS `Socioeconomic_Status`,
 1 AS `Occupation`,
 1 AS `Visit_Date`,
 1 AS `Primary_Diagnosis`,
 1 AS `Fasting_Blood_Glucose__mg_dl`,
 1 AS `Glycemic_Status`,
 1 AS `HbA1c_mmol_mol`,
 1 AS `Total_Cholesterol_mg_dL`,
 1 AS `Treatment_Type`,
 1 AS `Treatment_Outcome`,
 1 AS `Imaging_Type`,
 1 AS `Imaging_Findings`,
 1 AS `Hospital_Type`,
 1 AS `Insurance_Covered`,
 1 AS `BMI_kg_meter_square`,
 1 AS `BMI_Status`,
 1 AS `Symptoms`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `patient_visits_reconstructed`
--

/*!50001 DROP VIEW IF EXISTS `patient_visits_reconstructed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_visits_reconstructed` AS select `p`.`Patient_ID` AS `Patient_ID`,`p`.`Age` AS `Age`,`p`.`Gender` AS `Gender`,`p`.`State` AS `State`,`p`.`Socioeconomic_Status` AS `Socioeconomic_Status`,`p`.`Occupation` AS `Occupation`,`v`.`Visit_Date` AS `Visit_Date`,`d`.`Diagnosis_Name` AS `Primary_Diagnosis`,`v`.`Fasting_Blood_Glucose__mg_dl` AS `Fasting_Blood_Glucose__mg_dl`,`v`.`Glycemic_Status` AS `Glycemic_Status`,`v`.`HbA1c_mmol_mol` AS `HbA1c_mmol_mol`,`v`.`Total_Cholesterol_mg_dL` AS `Total_Cholesterol_mg_dL`,`t`.`Treatment_Type` AS `Treatment_Type`,`t`.`Treatment_Outcome` AS `Treatment_Outcome`,`im`.`Imaging_Type` AS `Imaging_Type`,`im`.`Imaging_Findings` AS `Imaging_Findings`,`h`.`Hospital_Type` AS `Hospital_Type`,`v`.`Insurance_Covered` AS `Insurance_Covered`,`v`.`BMI_kg_meter_square` AS `BMI_kg_meter_square`,`v`.`BMI_Status` AS `BMI_Status`,group_concat(distinct `s`.`Symptom_Name` order by `s`.`Symptom_Name` ASC separator ', ') AS `Symptoms` from (((((((`visits` `v` join `patients` `p` on((`v`.`Patient_ID` = `p`.`Patient_ID`))) join `hospitals` `h` on((`v`.`Hospital_ID` = `h`.`Hospital_ID`))) join `diagnoses` `d` on((`v`.`Diagnosis_ID` = `d`.`Diagnosis_ID`))) join `treatments` `t` on((`v`.`Visit_ID` = `t`.`Visit_ID`))) join `imaging` `im` on((`v`.`Visit_ID` = `im`.`Visit_ID`))) join `visit_symptoms` `vs` on((`v`.`Visit_ID` = `vs`.`Visit_ID`))) join `symptoms` `s` on((`vs`.`Symptom_ID` = `s`.`Symptom_ID`))) group by `p`.`Patient_ID`,`p`.`Age`,`p`.`Gender`,`p`.`State`,`p`.`Socioeconomic_Status`,`p`.`Occupation`,`v`.`Visit_Date`,`d`.`Diagnosis_Name`,`v`.`Fasting_Blood_Glucose__mg_dl`,`v`.`Glycemic_Status`,`v`.`HbA1c_mmol_mol`,`v`.`Total_Cholesterol_mg_dL`,`t`.`Treatment_Type`,`t`.`Treatment_Outcome`,`im`.`Imaging_Type`,`im`.`Imaging_Findings`,`h`.`Hospital_Type`,`v`.`Insurance_Covered`,`v`.`BMI_kg_meter_square`,`v`.`BMI_Status` */;
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

-- Dump completed on 2026-08-22 16:33:05
