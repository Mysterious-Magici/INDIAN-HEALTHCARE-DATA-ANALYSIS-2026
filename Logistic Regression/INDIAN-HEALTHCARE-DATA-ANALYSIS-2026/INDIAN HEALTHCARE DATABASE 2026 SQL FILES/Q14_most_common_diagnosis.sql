	-- Most common	Primary_Diagnosis overall
    
SELECT	Primary_Diagnosis,	COUNT(*)	AS	visit_count
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Primary_Diagnosis
ORDER	BY	visit_count	DESC
LIMIT	1;