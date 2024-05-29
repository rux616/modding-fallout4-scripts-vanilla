;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COMHancock_03_AdmirationT_0012CE7A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
;Set affinity between Infat and Admir
(Alias_Hancock.GetActorReference() as CompanionActorScript).SetAffinityBetweenThresholds(CA_T1_Infatuation, CA_T2_Admiration)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CA_T1_Infatuation Auto Const

GlobalVariable Property CA_T2_Admiration Auto Const

ReferenceAlias Property Alias_Hancock Auto Const
