Scriptname CompanionGivePlayerItemInfoScript extends TopicInfo Const

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	(akSpeakerRef as CompanionActorScript).GivePlayerItem()
EndEvent
