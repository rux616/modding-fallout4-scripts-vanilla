;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_GJDialogue_0102B60E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE gamejam:GJDialogueScript
gamejam:GJDialogueScript kmyQuest = GetOwningQuest() as gamejam:GJDialogueScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetChoice(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
