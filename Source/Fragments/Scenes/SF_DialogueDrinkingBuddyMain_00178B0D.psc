;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueDrinkingBuddyMain_00178B0D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
DialogueDrinkingBuddyScript kmyQuest = GetOwningQuest() as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckBeerForDispensing()
kmyQuest.CheckForJokeReset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
