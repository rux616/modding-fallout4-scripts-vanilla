;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CIS_ChatWithNPC_Valentin_01061B7A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE CIS_ChatWithNPC_ValentineScript
CIS_ChatWithNPC_ValentineScript kmyQuest = GetOwningQuest() as CIS_ChatWithNPC_ValentineScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.iDialogueCount = 6
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
