-- Top	3 symptoms per diagnosis	

WITH symptom_counts AS (
    SELECT
        Primary_Diagnosis,
        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Symptoms, ',', n.n), ',', -1)) AS Symptom,
        COUNT(*) AS Symptom_Count
    FROM indian_healthcare_data_2026_analysis
    JOIN (
        SELECT 1 AS n
        UNION ALL SELECT 2
        UNION ALL SELECT 3
        UNION ALL SELECT 4
        UNION ALL SELECT 5
        UNION ALL SELECT 6
        UNION ALL SELECT 7
        UNION ALL SELECT 8
        UNION ALL SELECT 9
        UNION ALL SELECT 10
    ) n
    ON n.n <= 1 + LENGTH(Symptoms) - LENGTH(REPLACE(Symptoms, ',', ''))
    GROUP BY
        Primary_Diagnosis,
        Symptom
),

ranked_symptoms AS (
    SELECT
        Primary_Diagnosis,
        Symptom,
        Symptom_Count,
        ROW_NUMBER() OVER (
            PARTITION BY Primary_Diagnosis
            ORDER BY Symptom_Count DESC
        ) AS symptom_rank
    FROM symptom_counts
)
SELECT
    Primary_Diagnosis,
    Symptom,
    Symptom_Count,
    symptom_rank
FROM ranked_symptoms
WHERE symptom_rank <= 3
ORDER BY
    Primary_Diagnosis,
    symptom_rank;