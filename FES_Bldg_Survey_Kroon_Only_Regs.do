/*This .do file delves into the Kroon Hall only analysis*/

sum KroonPrimary
tab KroonPrimary
sum Office Age Female FacStaffOther if KroonPrimary==1
sum Office Age Female FacStaffOther if KroonPrimary==0
tab FacStaffOther if KroonPrimary==1 & Office==1
tab FacStaffOther if KroonPrimary==1 & Office==0
corr Office FacStaffOther if KroonPrimary==1
*FacStaffOther is nearly synonymous w/ Office for Kroon Hall (45/46 Obs.)
svy: oprobit Satisfaction_ThermalComfort Office Age Female if KroonPrimary==1
*svy: oprobit Satisfaction_ThermalComfort FacStaffOther Age Female if KroonPrimary==1
*svy: oprobit Satisfaction_ThermalComfort Office Age Female Usage* PK* if KroonPrimary==1
gen GroundFloorOffice=0
foreach i of varlist PKspace_0_Office* Kspace_0_Office* {
replace GroundFloorOffice=1 if `i'==1
}
gen FirstFloorOffice=0
foreach i of varlist PKspace_1_Office* Kspace_1_Office* {
replace FirstFloorOffice=1 if `i'==1
}
gen SecondFloorOffice=0
foreach i of varlist PKspace_2_Office* Kspace_2_Office* {
replace SecondFloorOffice=1 if `i'==1
}
gen GroundFloor=0
foreach i of varlist PKspace_0* Kspace_0* {
replace GroundFloor=1 if `i'==1
}
gen FirstFloor=0
foreach i of varlist PKspace_1* Kspace_1* {
replace FirstFloor=1 if `i'==1
}
gen SecondFloor=0
foreach i of varlist PKspace_2* Kspace_2* {
replace SecondFloor=1 if `i'==1
}
gen ThirdFloor=0
foreach i of varlist PKspace_3* Kspace_3* {
replace ThirdFloor=1 if `i'==1
}

sum GroundFloor* FirstFloor* SecondFloor* ThirdFloor*
tab GroundFloor
tab GroundFloorOffice
svy: oprobit Satisfaction_ThermalComfort Office Age Female GroundFloor FirstFloor SecondFloor ThirdFloor if KroonPrimary==1
sum SecondFloor
tab SecondFloor
tab SecondFloorOffice
gen SecondFloorIOffice=SecondFloor*Office
**:
svy: oprobit Satisfaction_ThermalComfort Office Age Female GroundFloor FirstFloor SecondFloor ThirdFloor if KroonPrimary==1
svy: oprobit Satisfaction_ThermalComfort Office Age Female GroundFloor FirstFloor SecondFloor ThirdFloor SecondFloorIOffice if KroonPrimary==1
svy: oprobit Satisfaction_ThermalComfort Office Age Female SecondFloor if KroonPrimary==1
*
sum KroonUse_NotInSession
tab KroonUse_NotInSession

svy: oprobit Satisfaction_ThermalComfort Office Age Female SecondFloor KroonUse_NotInSession if KroonPrimary==1
svy: reg adaptivecostlybeh Office Age Female SecondFloor KroonUse_NotInSession if KroonPrimary==1
svy: reg adaptivecostlybeh Office Age Female GroundFloor FirstFloorOffice SecondFloorOffice ThirdFloor KroonUse_NotInSession if KroonPrimary==1
svy: reg adaptivecostlybeh Office Age Female KroonUse_NotInSession if KroonPrimary==1

svy: reg adaptivecostlybeh Office Age Female SecondFloorOffice KroonUse_NotInSession if KroonPrimary==1
svy: probit adaptivecostlybeh /*Office*/ Age Female SecondFloorOffice KroonUse_NotInSession if KroonPrimary==1
svy: probit adaptivecostlybeh /*Office*/ Age Female GroundFloor FirstFloor SecondFloor ThirdFloor KroonUse_NotInSession if KroonPrimary==1 
svy: reg adaptivecostlybeh /*Office*/ Age Female GroundFloor FirstFloor SecondFloor ThirdFloor KroonUse_NotInSession if KroonPrimary==1 & Office==1
svy: probit adaptivecostlybeh /*Office*/ Age Female GroundFloor FirstFloor SecondFloor ThirdFloor KroonUse_NotInSession if KroonPrimary==1 & Office==1


*drop GroundFloor* FirstFloor* SecondFloor* ThirdFloor* 
