-- Verify referential integrity	of visit_symptoms after	migration


SELECT
    vs.Visit_ID,
    vs.Symptom_ID
FROM visit_symptoms AS vs
LEFT JOIN visits AS v
    ON vs.Visit_ID = v.Visit_ID
WHERE v.Visit_ID IS NULL;

-- An empty result confirms referential integrity (no orphaned	rows).