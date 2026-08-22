	-- Percentage	of visits per Treatment_Outcome
    
SELECT Treatment_Outcome, COUNT(*)	AS	outcome_count,
ROUND(100.0	*	COUNT(*)/SUM(COUNT(*))OVER(),2)	AS	pct_of_total
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Treatment_Outcome
ORDER	BY	pct_of_total DESC;