* Encoding: UTF-8.
*7.1 Pie Chart of Patient Satisfaction.
FREQUENCIES VARIABLES=Satisfaction_Code
/PIECHART PERCENT
/ORDER=ANALYSIS.
*7.2 Bar Chart of VAS Pain Severity.
FREQUENCIES VARIABLES=VAS_Code
/BARCHART FREQ
/ORDER=ANALYSIS.
*7.3 Bar Chart of Age Distribution.
FREQUENCIES VARIABLES=Age_Code
/BARCHART FREQ
/ORDER=ANALYSIS.
*7.4 Bar Chart of BMI Categories.
FREQUENCIES VARIABLES=BMI_Code
/BARCHART FREQ
/ORDER=ANALYSIS.
*7.5 Bar Chart of Adequate Pain Relief.
FREQUENCIES VARIABLES=Pain_Relief_Code
/BARCHART FREQ
/ORDER=ANALYSIS.
*7.6 Grouped Bar Chart Comparing Paracetamol and Ketorolac.
CROSSTABS
/TABLES=Treatment_Group_Clean BY VAS_Code
/FORMAT=AVALUE TABLES
/CELLS=COUNT ROW COLUMN.
GRAPH
/BAR(GROUPED)=COUNT BY VAS_Code BY Treatment_Group_Clean.
*7.7 Bar Chart of Adverse Effects.
FREQUENCIES VARIABLES=Adverse_Effect_Code
/BARCHART FREQ
/ORDER=ANALYSIS.
