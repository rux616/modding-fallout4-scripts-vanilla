Scriptname ProtectronDamaged extends Actor Const

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	;Debug.Trace("OnCripple Received: " + akActorValue+ ", " + abCrippled)
	increaseNoise()
EndEvent

function increaseNoise()	
	SetAnimationVariableFloat("fCrippledNoiseRamp", 1.0)
	;Debug.Trace("setting noise ramp variable")
endFunction