-- Retrieve all visits	where Treatment_Outcome	is 'Recovered' or 'Improved'

SELECT * FROM indian_healthcare_data_2026_analysis WHERE Treatment_Outcome IN	('Recovered', 'Improved');