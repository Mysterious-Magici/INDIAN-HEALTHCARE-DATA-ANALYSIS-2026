	-- Month with the highest number of visits, per year
    
    SELECT	Visit_Year,	Visit_Month,	COUNT(*)	AS	visit_count
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Visit_Year,	Visit_Month
QUALIFY	RANK()	OVER	(PARTITION	BY	Visit_Year	ORDER	BY	COUNT(*)	DESC)	=	1;
WITH	monthly	AS	(
SELECT	Visit_Year,	Visit_Month,	COUNT(*)	AS	visit_count,
RANK()	OVER	(PARTITION	BY	Visit_Year	ORDER	BY	COUNT(*)	DESC)	AS	rnk
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Visit_Year,	Visit_Month
)
SELECT	Visit_Year,	Visit_Month,	visit_count
FROM	monthly
WHERE	rnk	=	1;