Scriptname TestPowerScript extends ObjectReference Const

Event OnPowerOff()
	debug.trace(self + " TestPowerScript OnPowerOff")    
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " TestPowerScript OnPowerOn")
endEvent