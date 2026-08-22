	-- Pivot Treatment_Outcome counts per State	


SELECT
State,
SUM(CASE	WHEN	Treatment_Outcome	=	'Recovered'	THEN	1	ELSE	0	END)	AS	recovered,
SUM(CASE	WHEN	Treatment_Outcome	=	'Improved'		THEN	1	ELSE	0	END)	AS	improved,
SUM(CASE	WHEN	Treatment_Outcome	=	'Stable'				
THEN	1	ELSE	0	END)	AS	stable,
SUM(CASE	WHEN	Treatment_Outcome	=	'Referred'		THEN	1	ELSE	0	END)	AS	referred,
SUM(CASE	WHEN	Treatment_Outcome	=	'Worsened'		THEN	1	ELSE	0	END)	AS	worsened
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	State
ORDER	BY	State;