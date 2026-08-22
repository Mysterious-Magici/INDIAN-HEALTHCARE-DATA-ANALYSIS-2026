	-- Diagnoses with more than 5,000 recorded visits
    
SELECT	Primary_Diagnosis,	COUNT(*)	AS	visit_count
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Primary_Diagnosis
HAVING	COUNT(*)> 5000
ORDER BY visit_count DESC;