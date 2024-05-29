Scriptname DNPrime_BridgeExplosionScript extends ObjectReference
{Places an explosion when activated}

Explosion Property myExplosion01 auto Const
{first small explosion}

Explosion Property myExplosion02 auto Const
{large explosion}

bool doOnce = false

;**********************************************

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if(doOnce)
			gotoState("doNothing")
			self.PlaceAtMe(myExplosion02)
		else
			doOnce = true
			self.PlaceAtMe(myExplosion01)
		endif
	EndEvent
endState

;**********************************************

State doNothing
	Event onActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
endState

;**********************************************