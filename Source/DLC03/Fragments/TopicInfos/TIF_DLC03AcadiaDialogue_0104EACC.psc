;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03AcadiaDialogue_0104EACC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03AcadiaDialogueScript
DLC03:DLC03AcadiaDialogueScript kmyQuest = GetOwningQuest() as DLC03:DLC03AcadiaDialogueScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DLC03AcadiaFaradayConfront=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
