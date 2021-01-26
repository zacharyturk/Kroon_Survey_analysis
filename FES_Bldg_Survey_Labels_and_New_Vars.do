/*Gen our most general dependent variable where the respondent takes at least 
one action to adapt to the climate in their primary use building:*/
gen adaptivebeh =0
replace adaptivebeh=1 if Behavior_OpenCloseWindows==1
replace adaptivebeh=1 if Behavior_RaiseLowerBlinds==1
replace adaptivebeh=1 if Behavior_AdjustThermostats==1
replace adaptivebeh=1 if Behavior_PortableHeater==1
replace adaptivebeh=1 if Behavior_PortableFan==1
replace adaptivebeh=1 if Behavior_AdjustAirVents==1
replace adaptivebeh=1 if Behavior_OpenCloseDoors==1
replace adaptivebeh=1 if Behavior_Other==1
replace adaptivebeh=1 if Behavior_DifferentClothing==1
/*Gen a more specific depedent variable indicating the respondent uses at least
one energy consuming personal appliance to adjust their primary building climate.
This variable is found, naturally, to only be true for respondents with offices:*/
gen adaptivecostlybeh =0
replace adaptivecostlybeh=1 if Behavior_PortableHeater==1
replace adaptivecostlybeh=1 if Behavior_PortableFan==1
/*Gen alternative dependent variable where clothing isn't included as an 
adaptive behavior:*/
gen altadaptivebeh =0
replace altadaptivebeh=1 if Behavior_OpenCloseWindows==1
replace altadaptivebeh=1 if Behavior_RaiseLowerBlinds==1
replace altadaptivebeh=1 if Behavior_AdjustThermostats==1
replace altadaptivebeh=1 if Behavior_PortableHeater==1
replace altadaptivebeh=1 if Behavior_PortableFan==1
replace altadaptivebeh=1 if Behavior_AdjustAirVents==1
replace altadaptivebeh=1 if Behavior_OpenCloseDoors==1
replace altadaptivebeh=1 if Behavior_Other==1
*Gen an interaction variable for Kroon Hall and FacStaffOther
gen KroonFacStaffOther=KroonPrimary*FacStaffOther
*Alternately, gen an interaction bewtween Office and Kroon Hall
gen KroonOffice=KroonPrimary*Office
*Generating count variable for LHS:
gen countadaptivebeh =0
replace countadaptivebeh=1 if Behavior_OpenCloseWindows==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_RaiseLowerBlinds==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_AdjustThermostats==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_PortableHeater==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_PortableFan==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_AdjustAirVents==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_OpenCloseDoors==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_Other==1
replace countadaptivebeh=countadaptivebeh+1 if Behavior_DifferentClothing==1

*Renaming some data variables to run loops easier
rename Importance_SustainabilityFeature Importance_SusFeature
rename *_OtherText str*_OtherText
rename Gender Female

*Renaming some variables due to cap letter discrepancies
rename PKSpace_3_Burke PKspace_3_Burke
rename PKSpace_3_Classrooms PKspace_3_Classrooms
rename PKSpace_3_BYO_Cafe PKspace_3_BYO_Cafe
rename PKSpace_3_TheKnob PKspace_3_TheKnob
rename PKSpace_2_Offices_NW PKspace_2_Offices_NW
rename PKSpace_2_Offices_S PKspace_2_Offices_S
rename PKSpace_2_Offices_SE PKspace_2_Offices_SE

rename KSpace_3_Burke Kspace_3_Burke
rename KSpace_3_Classrooms Kspace_3_Classrooms
rename KSpace_3_BYO_Cafe Kspace_3_BYO_Cafe
rename KSpace_3_TheKnob Kspace_3_TheKnob
rename KSpace_2_Offices_NW Kspace_2_Offices_NW
rename KSpace_2_Offices_S Kspace_2_Offices_S
rename KSpace_2_Offices_SE Kspace_2_Offices_SE

label data "Dataset from FEB building survey conducted 04/09/2015-05/01/2015"
label variable ID "Numeric value from 1-323 assigned to respondent"
label variable FinishedSurvey "Dumym whether respondent finished survey"
label define FinishedSurvey 1 "Finished survey=1" 0 "Incomplete=0"
label values FinishedSurvey FinishedSurvey
la var PrimaryBuilding "String identifying respondent's primary building" 
la var KroonPrimary "Dummy whether respondent's primary building is Kroon Hall"
la de KroonPrimary 1 "Kroon Hall=1" 0 "Other F&ES Building=0"
la val KroonPrimary KroonPrimary
la var CurrentRoleAtFES "String identifying respondent's role with F&ES"
la var FacStaffOther "Dummy whether respondent identifies as faculty, staff, or other"
la de FacStaffOther 1 "Faculty, Staff or Other=1" 0 "Student or Visitor=0"
la val FacStaffOther FacStaffOther
la var OfficeType "String whether respondent has an office and if so, whether it's share or private"
la var Office "Dummy whether respondent has an office"
la de Office 1 "Has an office=1" 0 "No office=0"
la val Office Office

la var Behavior_OpenCloseWindows "Dummy whether respondent opens and closes windows to adjust room climate"
la de Behavior_OpenCloseWindows 1 "Opens and closes windows=1" 0 "Not indicated=0"
la val Behavior_OpenCloseWindows Behavior_OpenCloseWindows
la var Behavior_RaiseLowerBlinds "Dummy whether respondent raises and lowers blinds to adjust room climate"
la de Behavior_RaiseLowerBlinds 1 "Raises and lowers blinds=1" 0 "Not indicated=0"
la val Behavior_RaiseLowerBlinds Behavior_RaiseLowerBlinds
la var Behavior_AdjustThermostats "Dummy whether respondent adjusts thermostats"
la de Behavior_AdjustThermostats 1 "Adjusts thermostats=1" 0 "Not indicated=0"
la val Behavior_AdjustThermostats Behavior_AdjustThermostats
la var Behavior_PortableHeater "Dummy whether respondent uses a portable personal heater"
la de Behavior_PortableHeater 1 "Uses a heater=1" 0 "Not indicated=0"
la val Behavior_PortableHeater Behavior_PortableHeater
la var Behavior_PortableFan "Dummy whether respondent uses a portable personal fan"
la de Behavior_PortableFan 1 "Uses a fan=1" 0 "Not indicated=0"
la val Behavior_PortableFan Behavior_PortableFan
la var Behavior_AdjustAirVents "Dummy whether respondent adjusts building air vents"
la de Behavior_AdjustAirVents 1 "Adjusts vents=1" 0 "Not indicated=0"
la val Behavior_AdjustAirVents Behavior_AdjustAirVents
la var Behavior_OpenCloseDoors "Dummy whether respondent opens and closes doors to adjust climate"
la de Behavior_OpenCloseDoors 1 "Opens and closes doors=1" 0 "Not indicated=0"
la val Behavior_OpenCloseDoors Behavior_OpenCloseDoors
la var Behavior_None "Dummy indicating that respondent doesn't do anything to adjust climate"
la de Behavior_None 1 "No actions taken=1" 0 "Not indicated=0"
la val Behavior_None Behavior_None
la var Behavior_Other "Dummy indicating that respondent takes other actions to adjust climate indicated in text"
la de Behavior_Other 1 "Other action taken=1" 0 "Not indicated=0"
la val Behavior_Other Behavior_Other
la var Behavior_DifferentClothing "Dummy indicating respondent chooses clothing to adjust for building conditions"
la de Behavior_DifferentClothing 1 "Wears different clothing=1" 0 "Not indicated=0"
la val Behavior_DifferentClothing Behavior_DifferentClothing

la var WarmerColderThanOthers "Does the respondent generally feel the same, warmer, or colder than others?"
la de WarmerColderThanOthers 1 "Feels the same=1" 2 "Tends to feel cooler=2" 3 "Tends to feel warmer=3"
la val WarmerColderThanOthers WarmerColderThanOthers
la var Female "Dummy with 1=Female, else=0"
la de Female 1 "Female=1" 0 "Other=0"
la val Female Female
la var Age "Age of respondent, capped at 70"
