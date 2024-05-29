;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04_KiddieKingdomMain_01049683 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetOwningQuest().GetStageDone(570)
	kmyQuest.TeleportOswaldTo(DLC04_KK_StageMarker_GroundLeft)
	DLC04_KiddieKingdomShowNewB.Start()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04_KK_StageMarker_GroundLeft Auto Const Mandatory

Scene Property DLC04_KiddieKingdomShowNewB Auto Const Mandatory
