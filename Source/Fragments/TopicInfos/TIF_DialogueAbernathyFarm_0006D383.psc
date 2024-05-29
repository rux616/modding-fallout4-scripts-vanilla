;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueAbernathyFarm_0006D383 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueAbernathyFarmScripts
DialogueAbernathyFarmScripts kmyQuest = GetOwningQuest() as DialogueAbernathyFarmScripts
;END AUTOCAST
;BEGIN CODE
pPlayerKnowsRaiders.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pPlayerKnowsRaiders Auto Const
