

;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04_KiddieKingdomStageS_02018622 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TeleportOswaldTo(DLC04_KK_StageMarker_GroundLeft)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04_KK_StageMarker_GroundLeft Auto Const Mandatory
