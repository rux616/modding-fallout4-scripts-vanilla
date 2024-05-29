;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04_KiddieKingdomPA_0200B196 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest script that the current PA scene has ended
kmyQuest.PASceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

