* Encoding: UTF-8.
COMPUTE Preliminary_Eligibility =
(Age_ASA_Eligible = 1 AND Medical_Exclusion_Flag = 0).
VARIABLE LABELS Preliminary_Eligibility
"Preliminary Patient Eligibility".
VALUE LABELS Preliminary_Eligibility
0 "Does Not Meet Checked Criteria"
1 "Meets Checked Criteria".
FORMATS Preliminary_Eligibility (F1.0).
EXECUTE.
FREQUENCIES VARIABLES=Preliminary_Eligibility.
CROSSTABS
/TABLES=Preliminary_Eligibility BY Treatment_Group_Clean
/CELLS=COUNT ROW.
