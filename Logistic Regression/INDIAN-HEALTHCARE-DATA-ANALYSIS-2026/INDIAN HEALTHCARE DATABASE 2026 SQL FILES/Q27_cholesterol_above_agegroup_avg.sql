-- Patients above the average cholesterol for their own age group (correlated subquery)

WITH RankedPatients AS (
    SELECT 
        Patient_ID, 
        Age_Group, 
        Total_Cholesterol_mg_dL,
        AVG(Total_Cholesterol_mg_dL) OVER(PARTITION BY Age_Group) AS Avg_Cholesterol_Age_Group
    FROM 
        indian_healthcare_data_2026_analysis
)
SELECT 
    Patient_ID, 
    Age_Group, 
    Total_Cholesterol_mg_dL
FROM 
    RankedPatients
WHERE 
    Total_Cholesterol_mg_dL > Avg_Cholesterol_Age_Group;
