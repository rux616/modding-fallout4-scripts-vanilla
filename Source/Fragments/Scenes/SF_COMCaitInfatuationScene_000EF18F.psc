;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COMCaitInfatuationScene_000EF18F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
(Alias_Cait.GetActorReference() as CompanionActorScript).SetAffinityBetweenThresholds(CA_T1_Infatuation, CA_T2_Admiration)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CA_T1_Infatuation Auto Const

GlobalVariable Property CA_T2_Admiration Auto Const

ReferenceAlias Property Alias_Cait Auto Const

