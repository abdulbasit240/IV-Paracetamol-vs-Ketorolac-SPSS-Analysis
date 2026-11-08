* Encoding: UTF-8.
*6.1 Selection and Assumptions of Statistical Tests.
FREQUENCIES VARIABLES=Treatment_Group_Clean
/ORDER=ANALYSIS.
CROSSTABS
/TABLES=Treatment_Group_Clean BY VAS_Code
/CELLS=COUNT EXPECTED ROW.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Satisfaction_Code
/CELLS=COUNT EXPECTED ROW.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Pain_Relief_Code
/CELLS=COUNT EXPECTED ROW.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Adverse_Effect_Code
/CELLS=COUNT EXPECTED ROW.
*6.2 Chi-Square Test for VAS Pain Severity.
CROSSTABS
/TABLES=Treatment_Group_Clean BY VAS_Code
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT EXPECTED ROW COLUMN
/COUNT ROUND CELL.
*6.3 Fisher's Exact Test.
CROSSTABS
/TABLES=Treatment_Group_Clean BY VAS_Code
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT EXPECTED ROW COLUMN
/METHOD=EXACT TIMER(5).
*6.4 Mann-Whitney U Test.
NPAR TESTS
/M-W=VAS_Code BY Treatment_Group_Clean(1 2)
/MISSING ANALYSIS.
*6.5 Chi-Square Test for Patient Satisfaction.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Satisfaction_Code
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT EXPECTED ROW COLUMN
/COUNT ROUND CELL
/METHOD=EXACT TIMER(5).
*6.6 Chi-Square Test for Adequate Pain Relief.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Pain_Relief_Code
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT EXPECTED ROW COLUMN
/COUNT ROUND CELL.
*6.7 Chi-Square Test for Adverse Effects.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Adverse_Effect_Code
/FORMAT=AVALUE TABLES
/STATISTICS=CHISQ
/CELLS=COUNT EXPECTED ROW COLUMN
/COUNT ROUND CELL.


