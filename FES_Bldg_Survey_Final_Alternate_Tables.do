*Alternative tables w/o KroonOffice


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
svy: reg ave_Satisfaction_p KroonPrimary Office KroonOffice /*Age*/ Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate satisfaction table.xls", ///
title(Summary Table on Satisfaction Responses) ctitle(OLS Average) replace
svy: reg ave_Satisfaction_p KroonPrimary Office /*Age*/ Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate satisfaction table.xls", ///
ctitle(OLS Average) append
foreach i of varlist Satisfaction_* {
svy: oprobit `i' KroonPrimary Office KroonOffice /*Age*/ Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate satisfaction table.xls", ///
ctitle(`i') append
svy: oprobit `i' KroonPrimary Office /*Age*/ Female 
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate satisfaction table.xls", ///
ctitle(`i') append
}
drop ave_Satisfaction_p


gen newbasecat=0
replace newbasecat=1 if PrimaryBuilding=="Sage Hall"
replace newbasecat=1 if PrimaryBuilding=="Kroon Hall"


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
svy: reg ave_Satisfaction_p KroonPrimary Office KroonOffice /*Age*/ Female if newbasecat==1
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate base satisfaction table.xls", ///
title(Summary Table on Satisfaction Responses) ctitle(OLS Average) replace
svy: reg ave_Satisfaction_p KroonPrimary Office /*Age*/ Female if newbasecat==1
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate base satisfaction table.xls", ///
ctitle(OLS Average) append
foreach i of varlist Satisfaction_* {
svy: oprobit `i' KroonPrimary Office KroonOffice /*Age*/ Female if newbasecat==1
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate base satisfaction table.xls", ///
ctitle(`i') append
svy: oprobit `i' KroonPrimary Office /*Age*/ Female if newbasecat==1
outreg2 using "C:\data\Kroon Survey Data\Output tables\Summary output tables\Pub alternate base satisfaction table.xls", ///
ctitle(`i') append
}
drop ave_Satisfaction_p

tab Importance_Thermal
tab Satisfaction_Thermal
tab WorkImpact_Thermal
tab TimeImpact_Thermal
tab KroonPrimary
tab Office
tab KroonOffice
tab Age
tab Female

