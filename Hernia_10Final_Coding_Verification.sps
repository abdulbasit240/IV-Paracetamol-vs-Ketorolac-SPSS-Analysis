* Encoding: UTF-8.
*4.1 Coding Demographic Variables.
COMPUTE Age_Code = $SYSMIS.
IF (Age = "18-25 years") Age_Code = 1.
IF (Age = "26-40 years") Age_Code = 2.
IF (Age = "41-60 years") Age_Code = 3.
IF (Age = "Above 60 years") Age_Code = 4.
VARIABLE LABELS Age_Code "Patient Age Group".
VALUE LABELS Age_Code
1 "18-25 years"
2 "26-40 years"
3 "41-60 years"
4 "Above 60 years".
COMPUTE Gender_Code = $SYSMIS.
IF (Gender = "Female") Gender_Code = 1.
IF (Gender = "Male") Gender_Code = 2.
VARIABLE LABELS Gender_Code "Patient Gender".
VALUE LABELS Gender_Code
1 "Female"
2 "Male".
FORMATS Age_Code Gender_Code (F1.0).
VARIABLE LEVEL Age_Code (ORDINAL).
VARIABLE LEVEL Gender_Code (NOMINAL).
EXECUTE.
FREQUENCIES VARIABLES=Age_Code Gender_Code.
*4.2 Coding Clinical Variables.

COMPUTE BMI_Code = $SYSMIS.
IF (BMI = "Less than 18.5") BMI_Code = 1.
IF (BMI = "18.5 - 24.9") BMI_Code = 2.
IF (BMI = "25.0 - 29.9") BMI_Code = 3.
IF (BMI = "30.0 - 39.9") BMI_Code = 4.
IF (BMI = "Above 40") BMI_Code = 5.
VARIABLE LABELS BMI_Code "Patient BMI Category".
VALUE LABELS BMI_Code
1 "Less than 18.5"
2 "18.5 - 24.9"
3 "25.0 - 29.9"
4 "30.0 - 39.9"
5 "Above 40".
COMPUTE ASA_Code = $SYSMIS.
IF (ASAstatus = "ASA 1") ASA_Code = 1.
IF (ASAstatus = "ASA 2") ASA_Code = 2.
IF (ASAstatus = "ASA 3") ASA_Code = 3.
IF (ASAstatus = "ASA 4") ASA_Code = 4.
VARIABLE LABELS ASA_Code "Patient ASA Physical Status".
VALUE LABELS ASA_Code
1 "ASA 1"
2 "ASA 2"
3 "ASA 3"
4 "ASA 4".
FORMATS BMI_Code ASA_Code (F1.0).
VARIABLE LEVEL BMI_Code ASA_Code (ORDINAL).
EXECUTE.
FREQUENCIES VARIABLES=BMI_Code ASA_Code.
*4.3 Coding Treatment Groups.
COMPUTE Treatment_Group_Clean = $SYSMIS.
IF (RTRIM(LTRIM(Studygroupanddrugadministration))
= "Group A : IV paracetamol")
Treatment_Group_Clean = 1.
IF (RTRIM(LTRIM(Studygroupanddrugadministration))
= "Group B : IV Ketorolac")
Treatment_Group_Clean = 2.
IF (RTRIM(LTRIM(Studygroupanddrugadministration))
= "Grouop B : IV Ketorolac")
Treatment_Group_Clean = 2.
VARIABLE LABELS Treatment_Group_Clean
"Cleaned IV Treatment Group".
VALUE LABELS Treatment_Group_Clean
1 "IV Paracetamol"
2 "IV Ketorolac".
FORMATS Treatment_Group_Clean (F1.0).
VARIABLE LEVEL Treatment_Group_Clean (NOMINAL).
EXECUTE.
FREQUENCIES VARIABLES=Treatment_Group_Clean.
CROSSTABS
/TABLES=Studygroupanddrugadministration
BY Treatment_Group_Clean
/CELLS=COUNT.
*4.4 Coding VAS Pain Severity.
COMPUTE VAS_Code = $SYSMIS.
IF (CHAR.INDEX(UPCASE(PostoperativepainmanagementassessmentthroughVAS), "MILD") > 0) VAS_Code = 1.
IF (CHAR.INDEX(UPCASE(PostoperativepainmanagementassessmentthroughVAS), "MODERATE") > 0) VAS_Code = 2.
IF (CHAR.INDEX(UPCASE(PostoperativepainmanagementassessmentthroughVAS), "SEVERE") > 0) VAS_Code = 3.
IF (CHAR.INDEX(UPCASE(PostoperativepainmanagementassessmentthroughVAS), "WORST") > 0) VAS_Code = 4.
VARIABLE LABELS VAS_Code
"Postoperative VAS Pain Severity".
VALUE LABELS VAS_Code
1 "Mild (1-3)"
2 "Moderate (4-6)"
3 "Severe (7-8)"
4 "Worst Pain (9-10)".
FORMATS VAS_Code (F1.0).
VARIABLE LEVEL VAS_Code (ORDINAL).
EXECUTE.
FREQUENCIES VARIABLES=VAS_Code.
CROSSTABS
/TABLES=PostoperativepainmanagementassessmentthroughVAS
BY VAS_Code
/CELLS=COUNT.
*4.5: Coding Patient Satisfaction.
COMPUTE Satisfaction_Code = $SYSMIS.
IF (RTRIM(LTRIM(Overallpatientsatisfaction)) = "Very dissatisfied") Satisfaction_Code = 1.
IF (RTRIM(LTRIM(Overallpatientsatisfaction)) = "Dissatisfied") Satisfaction_Code = 2.
IF (RTRIM(LTRIM(Overallpatientsatisfaction)) = "Neutral") Satisfaction_Code = 3.
IF (RTRIM(LTRIM(Overallpatientsatisfaction)) = "Satisfied") Satisfaction_Code = 4.
IF (RTRIM(LTRIM(Overallpatientsatisfaction)) = "Very satisfied") Satisfaction_Code = 5.
VARIABLE LABELS Satisfaction_Code
"Patient Satisfaction Level".
VALUE LABELS Satisfaction_Code
1 "Very dissatisfied"
2 "Dissatisfied"
3 "Neutral"
4 "Satisfied"
5 "Very satisfied".
FORMATS Satisfaction_Code (F1.0).
VARIABLE LEVEL Satisfaction_Code (ORDINAL).
EXECUTE.
FREQUENCIES VARIABLES=Satisfaction_Code.
CROSSTABS
/TABLES=Overallpatientsatisfaction
BY Satisfaction_Code
/CELLS=COUNT.
*4.6 Coding Adequate Pain Relief.
COMPUTE Pain_Relief_Code = $SYSMIS.
IF (RTRIM(LTRIM(Waspainreliefadequate)) = "No")
Pain_Relief_Code = 1.
IF (RTRIM(LTRIM(Waspainreliefadequate)) = "Uncertain")
Pain_Relief_Code = 2.
IF (RTRIM(LTRIM(Waspainreliefadequate)) = "Yes")
Pain_Relief_Code = 3.
VARIABLE LABELS Pain_Relief_Code
"Adequacy of Postoperative Pain Relief".
VALUE LABELS Pain_Relief_Code
1 "No"
2 "Uncertain"
3 "Yes".
FORMATS Pain_Relief_Code (F1.0).
VARIABLE LEVEL Pain_Relief_Code (ORDINAL).
EXECUTE.
FREQUENCIES VARIABLES=Pain_Relief_Code.
CROSSTABS
/TABLES=Waspainreliefadequate BY Pain_Relief_Code
/CELLS=COUNT.
*4.7 Coding Adverse Effects.
COMPUTE Adverse_Effect_Code = $SYSMIS.
IF (RTRIM(LTRIM(Didpatientexperiencedanyadverseeffects)) = "No")
Adverse_Effect_Code = 0.
IF (RTRIM(LTRIM(Didpatientexperiencedanyadverseeffects)) = "Yes")
Adverse_Effect_Code = 1.
VARIABLE LABELS Adverse_Effect_Code
"Postoperative Adverse Effects".
VALUE LABELS Adverse_Effect_Code
0 "No Adverse Effects"
1 "Adverse Effects Reported".
FORMATS Adverse_Effect_Code (F1.0).
VARIABLE LEVEL Adverse_Effect_Code (NOMINAL).
EXECUTE.
FREQUENCIES VARIABLES=Adverse_Effect_Code.
CROSSTABS
/TABLES=Didpatientexperiencedanyadverseeffects
BY Adverse_Effect_Code
/CELLS=COUNT.
*4.8 Applying Compute Variable Formulas.
COMPUTE Ketorolac_Indicator = $SYSMIS.
IF (NOT MISSING(Treatment_Group_Clean))
Ketorolac_Indicator = (Treatment_Group_Clean = 2).
VARIABLE LABELS Ketorolac_Indicator
"IV Ketorolac Treatment Indicator".
VALUE LABELS Ketorolac_Indicator
0 "IV Paracetamol"
1 "IV Ketorolac".
COMPUTE High_Pain_Flag = $SYSMIS.
IF (NOT MISSING(VAS_Code))
High_Pain_Flag = (VAS_Code >= 3).
VARIABLE LABELS High_Pain_Flag
"Severe or Worst Postoperative Pain".
VALUE LABELS High_Pain_Flag
0 "Mild or Moderate Pain"
1 "Severe or Worst Pain".
COMPUTE Positive_Satisfaction_Flag = $SYSMIS.
IF (NOT MISSING(Satisfaction_Code))
Positive_Satisfaction_Flag = (Satisfaction_Code >= 4).
VARIABLE LABELS Positive_Satisfaction_Flag
"Positive Patient Satisfaction".
VALUE LABELS Positive_Satisfaction_Flag
0 "Not Satisfied or Neutral"
1 "Satisfied or Very Satisfied".
FORMATS Ketorolac_Indicator
High_Pain_Flag Positive_Satisfaction_Flag (F1.0).
VARIABLE LEVEL Ketorolac_Indicator
High_Pain_Flag Positive_Satisfaction_Flag (NOMINAL).
EXECUTE.
FREQUENCIES VARIABLES=
Ketorolac_Indicator
High_Pain_Flag
Positive_Satisfaction_Flag.
CROSSTABS
/TABLES=Treatment_Group_Clean BY Ketorolac_Indicator
/CELLS=COUNT.
CROSSTABS
/TABLES=VAS_Code BY High_Pain_Flag
/CELLS=COUNT.
CROSSTABS
/TABLES=Satisfaction_Code BY Positive_Satisfaction_Flag
/CELLS=COUNT.
*4.9 Recode into Different Variables.
RECODE Satisfaction_Code
(1,2=1)
(3=2)
(4,5=3)
(ELSE=SYSMIS)
INTO Satisfaction_3Level.
VARIABLE LABELS Satisfaction_3Level
"Recoded Patient Satisfaction (3 Levels)".
VALUE LABELS Satisfaction_3Level
1 "Dissatisfied"
2 "Neutral"
3 "Satisfied".
RECODE VAS_Code
(1=1)
(2=2)
(3,4=3)
(ELSE=SYSMIS)
INTO VAS_3Level.
VARIABLE LABELS VAS_3Level
"Recoded VAS Pain Severity (3 Levels)".
VALUE LABELS VAS_3Level
1 "Mild Pain"
2 "Moderate Pain"
3 "Severe or Worst Pain".
FORMATS Satisfaction_3Level VAS_3Level (F1.0).
VARIABLE LEVEL Satisfaction_3Level VAS_3Level (ORDINAL).
EXECUTE.
FREQUENCIES VARIABLES=
Satisfaction_3Level
VAS_3Level.
CROSSTABS
/TABLES=Satisfaction_Code BY Satisfaction_3Level
/CELLS=COUNT.
CROSSTABS
/TABLES=VAS_Code BY VAS_3Level
/CELLS=COUNT.
*4.10 Verification of Coded Data.
COMPUTE Coding_Verification =
(NVALID(Age_Code, Gender_Code, BMI_Code,
ASA_Code, Treatment_Group_Clean, VAS_Code,
Satisfaction_Code, Pain_Relief_Code,
Adverse_Effect_Code, Ketorolac_Indicator,
High_Pain_Flag, Positive_Satisfaction_Flag,
Satisfaction_3Level, VAS_3Level) = 14).
IF (NOT RANGE(Age_Code,1,4))
Coding_Verification = 0.
IF (NOT RANGE(Gender_Code,1,2))
Coding_Verification = 0.
IF (NOT RANGE(BMI_Code,1,5))
Coding_Verification = 0.
IF (NOT RANGE(ASA_Code,1,4))
Coding_Verification = 0.
IF (NOT RANGE(Treatment_Group_Clean,1,2))
Coding_Verification = 0.
IF (NOT RANGE(VAS_Code,1,4))
Coding_Verification = 0.
IF (NOT RANGE(Satisfaction_Code,1,5))
Coding_Verification = 0.
IF (NOT RANGE(Pain_Relief_Code,1,3))
Coding_Verification = 0.
IF (NOT RANGE(Adverse_Effect_Code,0,1))
Coding_Verification = 0.
IF (NOT RANGE(Ketorolac_Indicator,0,1))
Coding_Verification = 0.
IF (NOT RANGE(High_Pain_Flag,0,1))
Coding_Verification = 0.
IF (NOT RANGE(Positive_Satisfaction_Flag,0,1))
Coding_Verification = 0.
IF (NOT RANGE(Satisfaction_3Level,1,3))
Coding_Verification = 0.
IF (NOT RANGE(VAS_3Level,1,3))
Coding_Verification = 0.
IF (Ketorolac_Indicator <>
(Treatment_Group_Clean = 2))
Coding_Verification = 0.
IF (High_Pain_Flag <> (VAS_Code >= 3))
Coding_Verification = 0.
IF (Positive_Satisfaction_Flag <>
(Satisfaction_Code >= 4))
Coding_Verification = 0.
IF (Satisfaction_Code <= 2 AND
Satisfaction_3Level <> 1)
Coding_Verification = 0.
IF (Satisfaction_Code = 3 AND
Satisfaction_3Level <> 2)
Coding_Verification = 0.
IF (Satisfaction_Code >= 4 AND
Satisfaction_3Level <> 3)
Coding_Verification = 0.
IF (VAS_Code <= 2 AND
VAS_3Level <> VAS_Code)
Coding_Verification = 0.
IF (VAS_Code >= 3 AND
VAS_3Level <> 3)
Coding_Verification = 0.
VARIABLE LABELS Coding_Verification
"Final Verification of Coded Data".
VALUE LABELS Coding_Verification
0 "Review Required"
1 "Coding Verified".
FORMATS Coding_Verification (F1.0).
VARIABLE LEVEL Coding_Verification (NOMINAL).
EXECUTE.
FREQUENCIES VARIABLES=Coding_Verification.
CROSSTABS
/TABLES=Treatment_Group_Clean
BY Coding_Verification
/CELLS=COUNT.

