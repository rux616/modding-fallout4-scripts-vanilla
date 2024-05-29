;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueTraderRyleeJoin_00190E58 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
; show assignment menu
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(TraderRylee.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

workshopparentscript Property WorkshopParent Auto Const

ReferenceAlias Property TraderRylee Auto Const
