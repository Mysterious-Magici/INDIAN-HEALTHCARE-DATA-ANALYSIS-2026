-- Per	State,	count of Covered vs	Not	Covered	visits

SELECT State,
SUM(CASE	WHEN	Insurance_Covered	=	'Covered'	THEN	1	ELSE	0	END)	AS	covered,
SUM(CASE	WHEN	Insurance_Covered	=	'Not	Covered'	THEN	1	ELSE	0	END)	AS	not_covered
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	State
ORDER	BY	State;