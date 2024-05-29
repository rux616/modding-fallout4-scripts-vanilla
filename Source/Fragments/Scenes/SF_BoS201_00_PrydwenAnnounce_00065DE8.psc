;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS201_00_PrydwenAnnounce_00065DE8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE BoS201QuestScript
BoS201QuestScript kmyQuest = GetOwningQuest() as BoS201QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FlyoverStuff()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
