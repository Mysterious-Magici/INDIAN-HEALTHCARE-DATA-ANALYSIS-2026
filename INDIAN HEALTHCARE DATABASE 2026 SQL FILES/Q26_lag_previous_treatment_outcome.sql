	-- Compare	Treatment_Outcome to previous visit (LAG)
    
    WITH ranked_visits AS (
    SELECT 
        Patient_ID, 
        Visit_Date, 
        Treatment_Outcome, 
        LAG(Treatment_Outcome) OVER (
            PARTITION BY Patient_ID 
            ORDER BY Visit_Date
        ) AS previous_outcome 
    FROM indian_healthcare_data_2026_analysis
) 
SELECT * 
FROM ranked_visits 
WHERE previous_outcome IS NOT NULL;
