clear all
set more off, permanently
log using "C:\data\Kroon Survey Data\FES_Bldg_Survey_Log.smcl", replace
import excel "C:\data\Kroon Survey Data\FES_Building_Survey3.xlsx", sheet("FES_Building_Survey3") firstrow

cd "C:\data\Kroon Survey Data\"

*Labeling data and generating variables for FES building survey analysis
do "FES_Bldg_Survey_Labels_and_New_Vars"

*Summary stats, survey weighting, and survey set procedures
do "FES_Bldg_Survey_Weighting_and_Summary_Stats"

/*Initial set of regressions analyzing whether respondents react differently by
changing behavior including bringing in electrical appliances to work to adapt
to the conditions in Kroon Hall versus other buildings in the F&ES inventory.*/
do "FES_Bldg_Survey_Reg_Adaptive_Behaviors"

/*Regressions (Svy OLS, Probits & Logits) on qualitative responses on whether 
respondents like the buildings and how they behave in the buildings.  This
includes both averages generated across related categories and regressions on 
several individual categories*/
do "FES_Bldg_Survey_Reg_Qualitative_Responses"

/*The next .do delves exclusively into Kroon Hall's data*/
do "FES_Bldg_Survey_Kroon_Only_Regs"

*Satisfaction summary table:
do "FES_Bldg_Survey_Final_Summary_Tables"

*Some alternate tables for comparison
do "FES_Bldg_Survey_Final_Alternate_Tables"


*Explore suest command...
log close
set more on, permanently
translate FES_Bldg_Survey_Log.smcl FES_Bldg_Survey_Log.pdf, replace
clear all
