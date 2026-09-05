-- Average	Total_Cholesterol_mg_dL	grouped	by	BMI_Status

SELECT	BMI_Status,	ROUND(AVG(Total_Cholesterol_mg_dL),	1)	AS	avg_cholesterol
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	BMI_Status
ORDER	BY	avg_cholesterol	DESC;