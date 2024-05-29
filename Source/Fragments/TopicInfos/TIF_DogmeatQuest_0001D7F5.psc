;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DogmeatQuest_0001D7F5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
debug.trace("Dogmeat: shared bark: alert")
bool bPassed = akSpeaker.playIdle(dogmeat_bark_alert)
if !bPassed
	debug.trace("Dogmeat: failed alert anim.  Play raw audio")
	NPCDogmeatArchAlertBark.play(akSpeaker)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property Dogmeat_Bark_Alert Auto Const

Sound Property NPCDogmeatArchAlertBark Auto Const
