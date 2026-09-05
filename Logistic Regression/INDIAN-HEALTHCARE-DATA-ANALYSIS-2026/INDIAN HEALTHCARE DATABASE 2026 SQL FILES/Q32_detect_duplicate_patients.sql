	-- Detect potential	duplicate patient records
    
SELECT
    Age,
    Gender,
    State,
    Occupation,
    COUNT(DISTINCT Patient_ID) AS id_count,
    GROUP_CONCAT(DISTINCT Patient_ID ORDER BY Patient_ID SEPARATOR ', ') AS patient_ids
FROM indian_healthcare_data_2026_analysis
GROUP BY
    Age,
    Gender,
    State,
    Occupation
HAVING COUNT(DISTINCT Patient_ID) > 1;