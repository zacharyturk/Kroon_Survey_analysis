*Generating average response for each response category and regressions on each:
*Importance of building characteristics indicators:
corr Importance*
gen ave=0
gen n=0
foreach i of varlist Importance_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_Importance=ave/n
drop ave
drop n
svy: reg ave_Importance KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
title(Summary Table of OLS regressions on response averages) ctitle(ave_Importance) replace
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
title(Summary Table of OLS regressions on response averages) ctitle(ave_Importance) replace
*Satisfaction with building:
corr Satisfaction*
gen ave=0
gen n=0
foreach i of varlist Satisfaction_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_Satisfaction=ave/n
drop ave
drop n
svy: reg ave_Satisfaction KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
ctitle(ave_Satisfaction) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
ctitle(ave_Satisfaction) append
*Work impact of building:
corr WorkImpact_*
gen ave=0
gen n=0
foreach i of varlist WorkImpact_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_WorkImpact=ave/n
drop ave
drop n
svy: reg ave_WorkImpact KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
ctitle(ave_WorkImpact) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
ctitle(ave_WorkImpact) append
*Time impact of building:
corr TimeImpact_*
gen ave=0
gen n=0
foreach i of varlist TimeImpact_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_TimeImpact=ave/n
drop ave
drop n
svy: reg ave_TimeImpact KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
ctitle(ave_TimeImpact) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
ctitle(ave_TimeImpact) append
*Behavior impact of building:
corr Behavior_*
gen ave=0
gen n=0
foreach i of varlist Behavior_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_Behavior=ave/n
drop ave
drop n
svy: reg ave_Behavior KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
ctitle(ave_Behavior) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
ctitle(ave_Behavior) append
*Kroon usage:
corr KroonUse_*
gen ave=0
gen n=0
foreach i of varlist KroonUse_*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_KroonUse=ave/n
drop ave
drop n
svy: reg ave_KroonUse KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
ctitle(ave_KroonUse) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
ctitle(ave_KroonUse) append
*Kroon knowledge:
corr KroonKnowledge*
gen ave=0
gen n=0
foreach i of varlist KroonKnowledge*{
replace ave=ave+`i' if `i'!=.
replace n=n+1 if `i'!=.
}
gen ave_KroonKnowledge=ave/n
drop ave
drop n
svy: reg ave_KroonKnowledge KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.xls", ///
ctitle(ave_KroonKnowledge) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions.doc", ///
ctitle(ave_KroonKnowledge) append
*Repeating average regressions w/o FacStaffOther and KroonFacStaffOther:
*Importance of building characteristics indicators:
svy: reg ave_Importance KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
title(Summary Table of OLS regressions on response averages) ctitle(ave_Importance) replace
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
title(Summary Table of OLS regressions on response averages) ctitle(ave_Importance) replace
*Satisfaction with building:
svy: reg ave_Satisfaction KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
ctitle(ave_Satisfaction) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
ctitle(ave_Satisfaction) append
*Work impact of building:
svy: reg ave_WorkImpact KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
ctitle(ave_WorkImpact) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
ctitle(ave_WorkImpact) append
*Time impact of building:
svy: reg ave_TimeImpact KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
ctitle(ave_TimeImpact) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
ctitle(ave_TimeImpact) append
*Behavior impact of building:
svy: reg ave_Behavior KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
ctitle(ave_Behavior) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
ctitle(ave_Behavior) append
*Kroon usage:
svy: reg ave_KroonUse KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
ctitle(ave_KroonUse) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
ctitle(ave_KroonUse) append
*Kroon knowledge:
svy: reg ave_KroonKnowledge KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.xls", ///
ctitle(ave_KroonKnowledge) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Averages OLS regressions without FacStaffOther.doc", ///
ctitle(ave_KroonKnowledge) append
*Running a set of satisfaction ordered probits, logits, and naive OLS:
foreach j of varlist Importance_* Satisfaction_* WorkImpact_* TimeImpact_* ///
/*Behavior_**/ KroonUse_* /*KroonSatisfaction* KroonTimeImpact**/ KroonKnowledge* ///
/*KroonLearnMore* KroonMoreInfo**/{  
sum `j'
tab `j'
foreach i of varlist `j' {
svy: reg `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(OLS) replace
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\OLS Summary table.xls", ctitle(`i') append
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(oprobit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\oprobit Summary table.xls", ctitle(`i') append
svy: ologit `i' KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(ologit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit Summary table.xls", ctitle(`i') append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", eform ctitle(odds ratio) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit odds ratios Summary table.xls", eform ctitle(`i') append
}
}
*Running the set of ordered probits, logits, and naive OLS again w/ FacStaffOther included (highly corr. w/ Office):
foreach j of varlist Importance_* Satisfaction_* WorkImpact_* TimeImpact_* ///
/*Behavior_**/ KroonUse_* /*KroonSatisfaction* KroonTimeImpact**/ KroonKnowledge* ///
/*KroonLearnMore* KroonMoreInfo**/{  
sum `j'
tab `j'
foreach i of varlist `j' {
svy: reg `i' KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", title(`i') ctitle(OLS) append /*replace*/
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\OLS Summary table.xls", title(Summary Table of OLS regressions) ctitle(`i') append
/*
svy: reg `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(OLS2) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\OLS Summary table.xls", ctitle(`i'2) append
*/
svy: oprobit `i' KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(oprobit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\oprobit Summary table.xls", title(Summary Table of oprobit regressions) ctitle(`i') append
/*
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(oprobit2) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\oprobit Summary table.xls", ctitle(`i'2) append
*/
svy: ologit `i' KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(ologit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit Summary table.xls", title(Summary Table of ologit regressions) ctitle(`i') append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", eform ctitle(odds ratio) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit odds ratios Summary table.xls", title(Summary Table of ologit odds ratio regressions) eform ctitle(`i') append
/*svy: ologit `i' KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(ologit2) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit Summary table.xls", ctitle(`i'2) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", eform ctitle(oadds ratios2) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit odds ratios Summary table.xls", eform ctitle(`i'2) append
*/
}
}
*Running separately for Behavior* since it's 0/1 instead of ordinal in responses, 
*still a set of satisfaction probits, logits, and naive OLS:
foreach j of varlist Behavior_* {  
sum `j'
tab `j'
foreach i of varlist `j' {
svy: reg `i' KroonPrimary Office KroonOffice Age Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(OLS) replace
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\OLS Summary table.xls", ctitle(`i') append
svy: probit `i' KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(oprobit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\oprobit Summary table.xls", ctitle(`i') append
/*svy: logit `i' KroonPrimary Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", ctitle(ologit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit Summary table.xls", ctitle(`i') append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Individual output tables\Table_`j'.doc", eform ctitle(odds ratio) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\ologit odds ratios Summary table.xls", eform ctitle(`i') append
*/
}
}
*Including lincom results:

foreach j of varlist Importance_* Satisfaction_* WorkImpact_* TimeImpact_* ///
/*Behavior_**/ KroonUse_* /*KroonSatisfaction* KroonTimeImpact**/ KroonKnowledge* ///
/*KroonLearnMore* KroonMoreInfo**/{  
sum `j'
tab `j'
foreach i of varlist `j' {
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female
lincom KroonPrimary+KroonOffice
}
}


foreach i of varlist Importance_ThermalComfort Satisfaction_ThermalComfort WorkImpact_ThermalComfort TimeImpact_ThermalComfort{
svy: oprobit `i' KroonPrimary Office KroonOffice Age Female
lincom KroonPrimary+KroonOffice+Office
}




*Adaptive behaviors:
foreach j of varlist Behavior_* {  
di `j'
foreach i of varlist `j' {
svy: probit `i' KroonPrimary KroonOffice Office Age Female
lincom KroonPrimary+KroonOffice
}
}

foreach j of varlist Behavior_* {  
di `j'
svy: tab `j'
}

svy: oprobit Satisfaction_ThermalComfort KroonPrimary Office KroonOffice Age Female
margins, at(KroonPrimary==1 KroonOffice==0)
margins, at(KroonPrimary==1 KroonOffice==1)


*Running regressions separately for office holders and non office holders:
foreach i of varlist Importance_ThermalComfort Satisfaction_ThermalComfort WorkImpact_ThermalComfort TimeImpact_ThermalComfort{
di "Non office:"  
svy: oprobit `i' KroonPrimary KroonOffice Office Age Female if Office==0
di "Yes office:"
svy: oprobit `i' KroonPrimary KroonOffice Office Age Female if Office==1
}

