Scriptname DN047TempSensorScript extends ObjectReference

ObjectReference property tempSensorTrig auto hidden

function disableSensor()
	tempSensorTrig.disable()
endFunction

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

auto State waiting
Event OnInit()
    tempSensorTrig = getLinkedRef()
EndEvent

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self) ; ready for a hit
	endIf
EndEvent

event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    disableSensor()
    goToState("Disabled")
endEvent

endState

state Disabled
	Event OnBeginState(string asOldState)
	  	utility.wait(9)
		tempSensorTrig.enable()
		goToState("waiting")  
		if Is3dLoaded() ; only register for another hit if we have 3d to be hit
			RegisterForHitEvent(self) ; ready for another hit
		endIf
	EndEvent
endState


