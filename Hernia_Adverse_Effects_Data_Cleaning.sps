* Encoding: UTF-8.
STRING Adverse_Effect_Clean (A200).
COMPUTE Adverse_Effect_Clean =
    RTRIM(LTRIM(Ifyesindicatetheadverseeffect)).
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, "Vomitting", "Vomiting").
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, "retension", "retention").
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, "Head ache", "Headache").
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, "low SPO2", "Low SpO2").
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, "Low SPO2", "Low SpO2").
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, "  ", " ").
COMPUTE Adverse_Effect_Clean =
    REPLACE(Adverse_Effect_Clean, " ,", ",").
VARIABLE LABELS Adverse_Effect_Clean
    "Standardised Adverse Effect Descriptions".
EXECUTE.
FREQUENCIES VARIABLES=Adverse_Effect_Clean.
COMPUTE Adverse_Effect_Clean =
REPLACE(Adverse_Effect_Clean,
"Low SpO2, difficult breathing",
"Difficult breathing, Low SpO2").
EXECUTE.
FREQUENCIES VARIABLES=Adverse_Effect_Clean.

