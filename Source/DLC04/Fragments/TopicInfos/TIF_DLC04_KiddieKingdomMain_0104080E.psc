;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04_KiddieKingdomMain_0104080E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TeleportOswaldToStageChair()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
