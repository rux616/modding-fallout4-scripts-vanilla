Scriptname DLC03:DLC03ModFriendLevel extends TopicInfo


ActorValue Property DLC03_FriendRanking Auto Const Mandatory

int Property FriendValueMod Auto Const
{This is the value by which to change the DLC03_FriendRanking actor value
	That value default to 30 normally and caps at 100
	Min actor value = 1
	Increments of 10 should be used to determine how they view the player
	use negative values for things the actor doesn't like

	This is NOT used globally, but only on certain actors}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if !abHasBeenSaid
		akSpeakerRef.ModValue(DLC03_FriendRanking, FriendValueMod)
	endif
EndEvent