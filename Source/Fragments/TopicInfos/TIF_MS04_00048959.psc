;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS04_00048959 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MS04_Script
MS04_Script kmyQuest = GetOwningQuest() as MS04_Script
;END AUTOCAST
;BEGIN CODE
; Give the PC a reward
Game.GivePlayerCaps(750)

; Flag to indicate player has been reward
kmyQuest.bHancockGaveReward = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
