;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03DialogueFarHarborGe_0101EA26 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DialogueFarHarborGenericNPCsScript
DLC03:DialogueFarHarborGenericNPCsScript kmyQuest = GetOwningQuest() as DLC03:DialogueFarHarborGenericNPCsScript
;END AUTOCAST
;BEGIN CODE
; Signal you've heard this rumor
kmyQuest.bHeardOfRedDeath = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
