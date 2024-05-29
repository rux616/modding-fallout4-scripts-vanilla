;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03DialogueFarHarbor_01005C4E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueFarHarborScript
DLC03:DLC03DialogueFarHarborScript kmyQuest = GetOwningQuest() as DLC03:DLC03DialogueFarHarborScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bAllenCanTalkAboutChildren = 0
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
