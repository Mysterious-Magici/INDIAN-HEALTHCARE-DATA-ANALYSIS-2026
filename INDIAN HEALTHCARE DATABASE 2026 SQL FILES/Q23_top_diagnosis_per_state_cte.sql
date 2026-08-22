-- Top	diagnosis per state	(CTE)

WITH diagnosis_counts AS (
    SELECT 
        State, 
        Primary_Diagnosis, 
        COUNT(*) AS cnt, 
        RANK() OVER (PARTITION BY State ORDER BY COUNT(*) DESC) AS rnk 
    FROM indian_healthcare_data_2026_analysis
    GROUP BY State, Primary_Diagnosis
) 
SELECT 
    State, 
	Primary_Diagnosis, 
    cnt 
FROM diagnosis_counts 
WHERE rnk = 1 
ORDER BY State;

