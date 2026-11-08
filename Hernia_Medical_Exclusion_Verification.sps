* Encoding: UTF-8.
COMPUTE Medical_Exclusion_Flag =
(INDEX(UPCASE(Relevantmedicalhistory),
"KIDNEY FAILURE") > 0 OR
INDEX(UPCASE(Relevantmedicalhistory),
"BLEEDING DISORDER") > 0).
VARIABLE LABELS Medical_Exclusion_Flag
"Recorded Kidney Failure or Bleeding Disorder".
VALUE LABELS Medical_Exclusion_Flag
0 "Not Recorded"
1 "Recorded".
FORMATS Medical_Exclusion_Flag (F1.0).
EXECUTE.
FREQUENCIES VARIABLES=Medical_Exclusion_Flag.
CROSSTABS
/TABLES=Age_ASA_Eligible BY Medical_Exclusion_Flag
/CELLS=COUNT.

