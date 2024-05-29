Scriptname V111CompanionFailsafeWarpScript extends ObjectReference Const
;when the player is ascending the elevator, and someone following is ascending with him, they can get stuck
;when anyone following the player enters this trigger, warp them

ObjectReference Property V111FailsafeWarpMarker Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	If (akActionRef != Game.GetPlayer())
		;check if the actor entering the trigger is following the player
		Actor[] playerFollowers = Game.GetPlayerFollowers()
		If playerFollowers.Find(akActionRef as Actor) < 0
			;actor is not in the follower array, so do nothing
		Else
			akActionRef.Moveto(V111FailsafeWarpMarker)
		EndIf
	EndIf
EndEvent