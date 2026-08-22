-- Top	5 diagnoses	by average Fasting_Blood_Glucose__mg_dl

SELECT	Primary_Diagnosis,	ROUND(AVG(Fasting_Blood_Glucose__mg_dl),	1)	AS	avg_glucose
FROM	indian_healthcare_data_2026_analysis
GROUP	BY	Primary_Diagnosis
ORDER	BY	avg_glucose	DESC
LIMIT	5;