;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01MQ01_2400_AdaIntro_0100FDA1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Set global to track player asked about Mechanist.
DLC01MQ01_PlayerAskedAboutMechanist.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC01MQ01_PlayerAskedAboutMechanist Auto Const
