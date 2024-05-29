Scriptname PlayerSaidPeaceful extends TopicInfo
{Used to send events to Companion Affinity system.}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	FollowersScript.PlayerSaidPeaceful(self)
EndEvent