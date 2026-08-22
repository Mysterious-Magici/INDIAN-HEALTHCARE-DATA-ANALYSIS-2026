	-- Rank patients within each diagnosis	by HbA1c_mmol_mol
    
    SELECT Patient_ID, Primary_Diagnosis, HbA1c_mmol_mol, 
    RANK() OVER (
        PARTITION BY Primary_Diagnosis 
        ORDER BY HbA1c_mmol_mol DESC
    ) AS hba1c_rank 
FROM 
    indian_healthcare_data_2026_analysis 
ORDER BY 
    hba1c_rank ASC;
