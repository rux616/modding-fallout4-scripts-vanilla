Scriptname V111PipboySkeletonScript extends ObjectReference

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			If Game.GetPlayer().IsInCombat()
				;do nothing if the player is in combat 
			Else
				gotostate("hasbeentriggered")
				GetLinkedRef().Activate(game.Getplayer()) ;have the player activate the linkedref furniture
				SetDestroyed() ; you cannot activate this again
			EndIf
		EndIf
	EndEvent

	Event OnGrab()
			If Game.GetPlayer().IsInCombat()
				;do nothing if the player is in combat 
			Else
				gotostate("hasbeentriggered")
				GetLinkedRef().Activate(game.Getplayer()) ;have the player activate the linkedref furniture
				SetDestroyed() ; you cannot activate this again
			EndIf
	EndEvent
EndState

STATE hasbeentriggered
	;empty State state
EndState