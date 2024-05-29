Scriptname TestElectricFenceScript extends ObjectReference Const

SPELL Property TestElectricFenceShock Auto Const

Event OnPowerOn(ObjectReference akPowerGenerator)
    StartTimer(utility.RandomFloat(0.0, 2.0))
EndEvent

Event OnPowerOff()
    CancelTimer()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	Actor theActor = akActionRef as Actor
	debug.trace(self + " actor=" + theActor + ", IsPowered()=" + ispowered())
	if theActor && isPowered()
		debug.trace(self + " SHOCK ME")
		Animate()
    	TestElectricFenceShock.Cast(theActor, theActor)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if isPowered()
    	Animate()
    	StartTimer(utility.RandomFloat(3.0, 10.0))
    endif
EndEvent

function Animate()
   	PlayAnimation("reset")
   	PlayAnimation("stage2")
endFunction
