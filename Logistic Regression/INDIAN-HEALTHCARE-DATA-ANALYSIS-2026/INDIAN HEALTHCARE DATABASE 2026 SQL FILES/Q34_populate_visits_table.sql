-- Populate visits	using surrogate	keys from patients,	hospitals,	diagnoses

INSERT INTO visits (
    Patient_ID,
    Hospital_ID,
    Diagnosis_ID,
    Visit_Date,
    Insurance_Covered,
    Fasting_Blood_Glucose__mg_dl,
    Glycemic_Status,
    HbA1c_mmol_mol,
    Total_Cholesterol_mg_dL,
    BMI_kg_meter_square,
    BMI_Status
)
SELECT
    pv.Patient_ID,
    h.Hospital_ID,
    d.Diagnosis_ID,
    pv.Visit_Date,
    pv.Insurance_Covered,
    pv.Fasting_Blood_Glucose__mg_dl,
    pv.Glycemic_Status,
    pv.HbA1c_mmol_mol,
    pv.Total_Cholesterol_mg_dL,
    pv.BMI_kg_meter_square,
    pv.BMI_Status
FROM indian_healthcare_data_2026_analysis AS pv
JOIN hospitals AS h
    ON h.Hospital_Type = pv.Hospital_Type
JOIN diagnoses AS d
    ON d.Diagnosis_Name = pv.Primary_Diagnosis;