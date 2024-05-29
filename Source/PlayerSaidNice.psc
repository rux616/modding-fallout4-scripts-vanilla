Scriptname PlayerSaidNice extends TopicInfo
{Used to send events to Companion Affinity system.}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	FollowersScript.PlayerSaidNice(self)
EndEvent