;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueDrinkingBuddySetH_00178B29 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(DrinkingBuddy.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

workshopparentscript Property WorkshopParent Auto Const

ReferenceAlias Property DrinkingBuddy Auto Const
