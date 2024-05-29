Scriptname DN084_ReactorBeamTriggerScript extends ObjectReference Hidden
{Trigger around the active reactor beam in DN084 - Mass Fusion. Touching this is bad.}

;When anyone touches the reactor beam, kill them.
Event OnTriggerEnter(ObjectReference akActivator)
	akActivator.DamageValue(Game.GetHealthAV(), 1000000)
EndEvent