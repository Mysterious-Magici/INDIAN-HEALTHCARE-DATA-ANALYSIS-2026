-- Reconstruct	the	original flat view (lossless-join	check)

CREATE OR REPLACE VIEW patient_visits_reconstructed AS
SELECT
    p.Patient_ID,
    p.Age,
    p.Gender,
    p.State,
    p.Socioeconomic_Status,
    p.Occupation,

    v.Visit_Date,

    d.Diagnosis_Name AS Primary_Diagnosis,

    v.Fasting_Blood_Glucose__mg_dl,
    v.Glycemic_Status,
    v.HbA1c_mmol_mol,
    v.Total_Cholesterol_mg_dL,

    t.Treatment_Type,
    t.Treatment_Outcome,

    im.Imaging_Type,
    im.Imaging_Findings,

    h.Hospital_Type,
    v.Insurance_Covered,

    v.BMI_kg_meter_square,
    v.BMI_Status,

    GROUP_CONCAT(
        DISTINCT s.Symptom_Name
        ORDER BY s.Symptom_Name
        SEPARATOR ', '
    ) AS Symptoms

FROM visits v

JOIN patients p
    ON v.Patient_ID = p.Patient_ID

JOIN hospitals h
    ON v.Hospital_ID = h.Hospital_ID

JOIN diagnoses d
    ON v.Diagnosis_ID = d.Diagnosis_ID

JOIN treatments t
    ON v.Visit_ID = t.Visit_ID

JOIN imaging im
    ON v.Visit_ID = im.Visit_ID

JOIN visit_symptoms vs
    ON v.Visit_ID = vs.Visit_ID

JOIN symptoms s
    ON vs.Symptom_ID = s.Symptom_ID

GROUP BY
    p.Patient_ID,
    p.Age,
    p.Gender,
    p.State,
    p.Socioeconomic_Status,
    p.Occupation,
    v.Visit_Date,
    d.Diagnosis_Name,
    v.Fasting_Blood_Glucose__mg_dl,
    v.Glycemic_Status,
    v.HbA1c_mmol_mol,
    v.Total_Cholesterol_mg_dL,
    t.Treatment_Type,
    t.Treatment_Outcome,
    im.Imaging_Type,
    im.Imaging_Findings,
    h.Hospital_Type,
    v.Insurance_Covered,
    v.BMI_kg_meter_square,
    v.BMI_Status;