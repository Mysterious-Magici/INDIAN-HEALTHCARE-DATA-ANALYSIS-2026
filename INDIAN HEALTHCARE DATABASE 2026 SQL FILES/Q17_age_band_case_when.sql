	-- Classify patients into age bands using CASE	WHEN and count each	group
    
    SELECT
        CASE
           WHEN Age	< 18 THEN 'Minor'
           WHEN	 Age BETWEEN 18	AND	59 THEN 'Adult'
           ELSE	'Senior'
        END	AS	age_band, COUNT(*)	AS	patient_count
        FROM	indian_healthcare_data_2026_analysis
GROUP	BY
CASE
     WHEN	Age	<	18	THEN 'Minor'
     WHEN	Age	BETWEEN	18	AND	59	THEN 'Adult'
     ELSE   'Senior'
END;