*OLS versions:
svy: reg adaptivebeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptive Behavior.doc", ///
title(Engages in at least one adaptive behavior) ctitle(OLS) replace
*test KroonPrimary KroonFacStaffOther
svy: reg altadaptivebeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Altadaptive Behavior.doc", ///
title(Engages in at least one adaptive behavior excluding clothing) ctitle(OLS) replace
svy: reg adaptivecostlybeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptivecostly Behavior.doc", ///
title(Engages in at least one costly adaptive behavior (heater or fan)) ctitle(OLS) replace
*test KroonPrimary KroonFacStaffOther
*Probit versions:
svy: probit adaptivebeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptive Behavior.doc", ///
ctitle(Probit) append
svy: probit altadaptivebeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Altadaptive Behavior.doc", ///
ctitle(Probit) append
svy: probit adaptivecostlybeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptivecostly Behavior.doc", ///
ctitle(Probit) append
*Logit version:
svy: logit adaptivebeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptive Behavior.doc", ///
ctitle(Logit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptive Behavior.doc", ///
eform ctitle(Logit OR) append
svy: logit, or
svy: logit altadaptivebeh KroonPrimary /*FacStaffOther KroonFacStaffOther*/ Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Altadaptive Behavior.doc", ///
ctitle(Logit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Altadaptive Behavior.doc", ///
eform ctitle(Logit OR) append
svy: logit, or
*test KroonPrimary KroonFacStaffOther
svy: logit adaptivecostlybeh KroonPrimary FacStaffOther KroonFacStaffOther Office KroonOffice Age Female
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptivecostly Behavior.doc", ///
ctitle(Logit) append
outreg2 using "C:\data\Kroon Survey Data\Output tables\Adaptivecostly Behavior.doc", ///
eform ctitle(Logit OR) append
/*Now instead using neg binomial to assess probability of using
more adaptive behaviors*/
sum countadaptivebeh
tab countadaptivebeh
svy: nbreg countadaptivebeh KroonPrimary Office KroonOffice /*FacStaffOther KroonFacStaffOther*/ Age Female
lincom KroonPrimary+KroonOffice
outreg2 using "C:\data\Kroon Survey Data\Output tables\Table_nbreg.doc", ///
title(count adaptive beh) ctitle(nbreg) replace
outreg2 using "C:\data\Kroon Survey Data\Output tables\Table_nbreg.doc", ///
eform ctitle(nbreg, IRR) append
svy: nbreg, irr
svy: mean countadaptivebeh
outreg2 using "C:\data\Kroon Survey Data\Output tables\adaptivebeh_summary_stats.doc", ///
title(Countadaptivebehavior summary stats) ctitle(Overall) noaster replace
svy: mean countadaptivebeh if FacStaffOther==1
*outreg2 using "C:\data\Kroon Survey Data\Output tables\adaptivebeh_summary_stats.doc", ctitle(All FacStaffOther) noaster append
svy: mean countadaptivebeh if FacStaffOther==0
*outreg2 using "C:\data\Kroon Survey Data\Output tables\adaptivebeh_summary_stats.doc", ctitle(All Students) noaster append
svy: mean countadaptivebeh if KroonFacStaffOther==1 
*outreg2 using "C:\data\Kroon Survey Data\Output tables\adaptivebeh_summary_stats.doc", ctitle(Kroon FacStaffOther) noaster append
svy: mean countadaptivebeh if KroonPrimary==1
outreg2 using "C:\data\Kroon Survey Data\Output tables\adaptivebeh_summary_stats.doc", ctitle(Kroon Primary) noaster append
svy: mean countadaptivebeh if KroonPrimary==0
outreg2 using "C:\data\Kroon Survey Data\Output tables\adaptivebeh_summary_stats.doc", ctitle (Not Kroon) noaster append
hist countadaptivebeh
graph export "C:\data\Kroon Survey Data\Output tables\count_adaptivebeh_hist.tif", as(tif) replace
hist countadaptivebeh if KroonPrimary==1
graph export "C:\data\Kroon Survey Data\Output tables\count_adaptivebeh_hist_Kroon_only.tif", as(tif) replace
hist countadaptivebeh if KroonPrimary==0
graph export "C:\data\Kroon Survey Data\Output tables\count_adaptivebeh_hist_non_Kroon.tif", as(tif) replace

