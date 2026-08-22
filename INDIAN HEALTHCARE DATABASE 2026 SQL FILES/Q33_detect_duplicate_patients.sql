-- Convert	the	14	Symptom_*	flag columns into rows (UNPIVOT	via	UNION	ALL)

INSERT INTO visit_symptoms (Visit_ID, Symptom_ID)
SELECT v.Visit_ID, s.Symptom_ID
FROM (
    SELECT Patient_ID, Visit_Date, 'Blurred Vision' AS Symptom_Name
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Blurred_Vision = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Chest Pain'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Chest_Pain = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Cough'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Cough = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Fatigue'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Fatigue = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Fever'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Fever = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Frequent Urination'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Frequent_Urination = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Headache'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Headache = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'High BP'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_High_Bp = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'High Fever'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_High_Fever = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Increased Thirst'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Increased_Thirst = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Joint Pain'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Joint_Pain = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Night Sweats'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Night_Sweats = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Shortness Of Breath'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Shortness_Of_Breath = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Swelling In Legs'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Swelling_In_Legs = 1

    UNION ALL

    SELECT Patient_ID, Visit_Date, 'Weight Loss'
    FROM indian_healthcare_data_2026_analysis
    WHERE Symptom_Weight_Loss = 1
) AS unpivoted
JOIN visits v
    ON v.Patient_ID = unpivoted.Patient_ID
    AND v.Visit_Date = unpivoted.Visit_Date
JOIN symptoms s
    ON s.Symptom_Name = unpivoted.Symptom_Name;

