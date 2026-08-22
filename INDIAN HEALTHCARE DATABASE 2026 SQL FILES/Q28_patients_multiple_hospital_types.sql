	-- Patients	who	visited	more than one Hospital_Type	
    
    SELECT DISTINCT t1.Patient_ID FROM  indian_healthcare_data_2026_analysis t1 JOIN indian_healthcare_data_2026_analysis t2
  ON t1.Patient_ID = t2.Patient_ID
 WHERE t1.Hospital_Type <> t2.Hospital_Type;
