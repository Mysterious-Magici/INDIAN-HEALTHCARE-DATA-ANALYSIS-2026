	-- Count total	visits per State
    
    SELECT	State,	COUNT(*) AS	total_visits FROM indian_healthcare_data_2026_analysis GROUP BY	State ORDER	BY	total_visits DESC;