-- Running	total of visits	per	month

WITH monthly AS (
    SELECT 
        Visit_Year, 
        Visit_Month, 
        COUNT(*) AS visit_count
    FROM 
        indian_healthcare_data_2026_analysis
    GROUP BY 
        Visit_Year, 
        Visit_Month
)
SELECT
    Visit_Year, 
    Visit_Month, 
    visit_count,
    SUM(visit_count) OVER (
        ORDER BY Visit_Year, Visit_Month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM 
    monthly
ORDER BY 
    Visit_Year, 
    Visit_Month;
