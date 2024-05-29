;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS14BullyPostBarFightScen_000E83B4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MS14QuestScript
MS14QuestScript kmyQuest = GetOwningQuest() as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.BullyFightWon = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
