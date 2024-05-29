Scriptname AskedForMoreCaps extends TopicInfo
{Used for getting companions to respond to player speech challenging for more caps.

Put this on the player's info when he first tries.}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	FollowersScript.AskedForMoreCaps(Sender = self)
EndEvent