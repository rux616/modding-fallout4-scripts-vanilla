Scriptname TestTreatAsFollowerScript extends Actor
{Put a flag over the mailbox if we're a player follower, and the wall chunk if not.}

ObjectReference Property FlagForFollower Auto
ObjectReference Property FlagForNonFollower Auto

int iTimer_Tick = 1
int iInterval_Tick = 1

Event OnLoad()
    StartTimer( iInterval_Tick , iTimer_Tick )
EndEvent

Event OnTimer(int aiTimerID)
	Actor actorSelf = (Self As Actor)
	if aiTimerID == iTimer_Tick
		Actor[] playerFollowers = Game.GetPlayerFollowers( )
		if playerFollowers.Find( actorSelf ) >= 0
			FlagForFollower.Enable()
			FlagForNonFollower.Disable()
		else
			FlagForFollower.Disable()
			FlagForNonFollower.Enable()
		endif
		startTimer( iInterval_Tick, iTimer_Tick )
	endif
EndEvent