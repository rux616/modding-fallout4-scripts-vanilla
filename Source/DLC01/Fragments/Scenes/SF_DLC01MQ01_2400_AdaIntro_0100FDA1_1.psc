;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01MQ01_2400_AdaIntro_0100FDA1_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_12_End
Function Fragment_Phase_12_End()
;BEGIN CODE
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(DLC01AdaRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC01AdaRef Auto Const Mandatory
workshopparentscript Property WorkshopParent Auto Const
