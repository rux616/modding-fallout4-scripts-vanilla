;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS16JulesJobDone_000521B9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE MS16QuestScript
MS16QuestScript kmyQuest = GetOwningQuest() as MS16QuestScript
;END AUTOCAST
;BEGIN CODE
; Game.GetPlayer().AddItem(kmyQuest.TempRewardItem, kmyQuest.TempRewardAmount)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
