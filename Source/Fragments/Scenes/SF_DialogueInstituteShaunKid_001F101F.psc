;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueInstituteShaunKid_001F101F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(ShaunChild.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

workshopparentscript Property WorkshopParent Auto Const

ReferenceAlias Property ShaunChild Auto Const
