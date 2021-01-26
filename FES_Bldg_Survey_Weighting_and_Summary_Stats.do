/*Weight is the product of Sampling weight, Nonresponse weight, and 
Post-stratification weight.  In this case, the entire population is sampled
so Sampling weight=1.  Nonresponse weight is the proportion of the two groups,
faculty, staff, and other; and students and visitors, that respond to the survey.
The post-stratification weight is used to adjust for differences in response by
Female as Female, not Female is found to be significant in previous unweighted
regressions*/

***preliminary weights, awaiting final stats from F&ES***
*Generating nonresponse weight
gen NRweight=.
replace NRweight=(291/160) if FacStaffOther==1 /*original estimate (266/160)*/
replace NRweight=(311/163) if FacStaffOther==0 /*original estimate (355/163)*/
*Generating post-stratification weight for Female
gen PSweight=.
replace PSweight=(311/185) if Female==1 & FacStaffOther==0 /*original estimate (294/173)*/
replace PSweight=(311/126) if Female==0 & FacStaffOther==0 /*original estimate (294/121)*/
replace PSweight=(291/123) if Female==1 & FacStaffOther==1 /*original estimate (266/104)*/
replace PSweight=(291/173) if Female==0 & FacStaffOther==1 /*original estimate (266/162)*/
*Generating weight used for pweight as product.
gen ProbWeight=NRweight*PSweight
svyset _n [pweight=ProbWeight]
*
/*
Provided statistics from the administration:
Total # of faculty - 186 faculty (49 female/137 male)
Total # of staff - 105 staff (74 female/36 male)
*/

/*Displaying some preliminary summary statistics comparing Kroon Hall to the
other F&ES buildings used by the respondents as their primary building:*/
sum adaptivebeh adaptivecostlybeh
svy: mean adaptivebeh adaptivecostlybeh
sum adaptivebeh adaptivecostlybeh if KroonPrimary==1
svy: mean adaptivebeh adaptivecostlybeh if KroonPrimary==1
sum adaptivebeh adaptivecostlybeh if KroonPrimary==0
svy: mean adaptivebeh adaptivecostlybeh if KroonPrimary==0
*Note high level of correlation between FacStaffOther and Office:
corr FacStaffOther Office

svy: mean KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\data means.doc", ///
title(Countadaptivebehavior summary stats) ctitle(Overall) noaster replace
