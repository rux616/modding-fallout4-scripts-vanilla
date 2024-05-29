Scriptname TestKurtAmbushTriggerScript extends ObjectReference Conditional

int Property Triggered Auto Conditional
{
	1 = suspicious
	2 = released from trigger
}
Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + " triggered by " + akActionRef)
	if Triggered < 2 && akActionRef == Game.GetPlayer()
		Triggered = 2
	endif
endEvent