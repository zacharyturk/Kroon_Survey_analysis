/*This file contains code for generating final summary tables for the published
paper.  It involves combining key data from previous regressions such as averages
probits with oprobits on individual categories as in the first pair of loops*/
/*Note can predict probabilities for oprobits in a number of ways:
margins, dydx(_all) post
margeff at(mean) replace
*margins, atmeans post
*margins, dydx(*) atmeans post
*margins, predict (outcome(5)) atmeans post
*/
*Importance table:
gen ave=0
gen n=0
foreach i of varlist Importance_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_Importance_p=ave/n
drop ave
drop n
svy: reg ave_Importance_p KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub importance table.xls", ///
title(Summary Table on Importance Responses) ctitle(OLS Average) replace
foreach i of varlist Importance_* {
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub importance table.xls", ///
ctitle(`i') append
}
drop ave_Importance_p
*Satisfaction table:
gen ave=0
gen n=0
foreach i of varlist Satisfaction_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_Satisfaction_p=ave/n
drop ave
drop n
svy: reg ave_Satisfaction_p KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub satisfaction table.xls", ///
title(Summary Table on Satisfaction Responses) ctitle(OLS Average) replace
foreach i of varlist Satisfaction_* {
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub satisfaction table.xls", ///
ctitle(`i') append
}
drop ave_Satisfaction_p
*Work impact:
gen ave=0
gen n=0
foreach i of varlist WorkImpact_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_WorkImpact_p=ave/n
drop ave
drop n
svy: reg ave_WorkImpact_p KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub work impact table.xls", ///
title(Summary Table on Work Impact Responses) ctitle(OLS Average) replace
foreach i of varlist WorkImpact_* {
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub work impact table.xls", ///
ctitle(`i') append
}
drop ave_WorkImpact_p
*Time impact:
gen ave=0
gen n=0
foreach i of varlist TimeImpact_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_TimeImpact_p=ave/n
drop ave
drop n
svy: reg ave_TimeImpact_p KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub time impact table.xls", ///
title(Summary Table on Time Impact Responses) ctitle(OLS Average) replace
foreach i of varlist TimeImpact_* {
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub time impact table.xls", ///
ctitle(`i') append
}
drop ave_TimeImpact_p
*Behavioral response:
gen ave=0
gen n=0
foreach i of varlist Behavior_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_Behavior_p=ave/n
drop ave
drop n
svy: reg ave_Behavior_p KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub behavior table.xls", ///
title(Summary Table on Behavior Responses) ctitle(OLS Average) replace
foreach i of varlist Behavior_* {
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub behavior table.xls", ///
ctitle(`i') append
}
drop ave_Behavior_p
*
*Getting margins for adaptivecostlybeh:
svy: reg adaptivecostlybeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Margins Adaptivecostly Behavior.doc", ///
title(Engages in at least one costly adaptive behavior (heater or fan)) ctitle(OLS) replace
svy: probit adaptivecostlybeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Margins Adaptivecostly Behavior.doc", ///
ctitle(Probit) append
margins, dydx(*) post
outreg2 using "C:\data\Kroon Survey Data\Output tables\Margins Adaptivecostly Behavior.doc", ///
ctitle(Marginal effects) append
/*svy: probit adaptivecostlybeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
margins, dydx(*) atmeans post
outreg2 using "C:\data\Kroon Survey Data\Output tables\Margins Adaptivecostly Behavior.doc", ///
ctitle(Predicted prob) append
*/
*Auxiliary reg adding KroonPrimary*Female interaction for Table 1.
gen KroonPrimaryFemale=KroonPrimary*Female
svy: oprobit Importance_ThermalComfort KroonPrimary Office KroonOffice Age Female KroonPrimaryFemale
svy: oprobit Importance_ThermalComfort KroonPrimary Office KroonOffice Age Female
*Auxiliary reg with added KroonPrimary*Age interaction for Table 2.
gen KroonPrimaryAge=KroonPrimary*Age
svy: oprobit Satisfaction_Functionality KroonPrimary Office KroonOffice Age Female KroonPrimaryAge
svy: oprobit Satisfaction_Functionality KroonPrimary Office KroonOffice Age Female
*Additional analysis on Behavior_None
tab Behavior_None
sum Behavior_None
