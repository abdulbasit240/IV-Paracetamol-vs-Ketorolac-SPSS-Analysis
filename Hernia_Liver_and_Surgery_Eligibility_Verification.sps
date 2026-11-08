* Encoding: UTF-8.
COMPUTE Liver_Review_Flag =
(CHAR.INDEX(UPCASE(Relevantmedicalhistory), "LIVER") > 0
OR CHAR.INDEX(UPCASE(Relevantmedicalhistory), "HCV") > 0).
VARIABLE LABELS Liver_Review_Flag
"Liver-Related Medical History Requiring Review".
VALUE LABELS Liver_Review_Flag
0 "Not Mentioned"
1 "Requires Review".
FORMATS Liver_Review_Flag (F1.0).
EXECUTE.
FREQUENCIES VARIABLES=Liver_Review_Flag.
CROSSTABS
/TABLES=Preliminary_Eligibility BY Liver_Review_Flag
/CELLS=COUNT.
CROSSTABS
/TABLES=Preliminary_Eligibility BY Typeofsurgery
/CELLS=COUNT.

