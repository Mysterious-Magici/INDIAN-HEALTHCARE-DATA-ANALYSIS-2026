	-- Occupation with	the	highest	average	HbA1c_mmol_mol
    
SELECT	Occupation,	ROUND(AVG(HbA1c_mmol_mol),	2)	AS	avg_hba1c
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Occupation
ORDER	BY	avg_hba1c	DESC
LIMIT	1;