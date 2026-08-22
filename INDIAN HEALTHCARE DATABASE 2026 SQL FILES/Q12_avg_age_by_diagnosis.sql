	-- Average	Age	of patients	per	Primary_Diagnosis
    
    SELECT	Primary_Diagnosis,	ROUND(AVG(Age),	1)	AS	avg_age FROM indian_healthcare_data_2026_analysis GROUP BY Primary_Diagnosis ORDER BY avg_age DESC;