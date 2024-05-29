Scriptname POISC16_ExplosionScript extends ObjectReference Hidden
{Script for the Moonshiner's Shack explosion in POISC16.}

Explosion property POISC16_Explosion Auto Const Mandatory
ObjectReference property POISC16_ExplosionSource Auto Const Mandatory
ObjectReference property POISC16_CharDecals Auto Const Mandatory

Auto State Waiting
	Event OnTriggerEnter(ObjectReference obj)
		if (obj == Game.GetPlayer())
			GoToState("Done")
			POISC16_ExplosionSource.PlaceAtMe(POISC16_Explosion)
			Utility.Wait(1)
			POISC16_CharDecals.EnableNoWait()
		EndIf
	EndEvent
EndState

State Done
	Event OnTriggerEnter(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState