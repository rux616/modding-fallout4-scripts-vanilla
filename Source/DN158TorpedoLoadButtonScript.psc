Scriptname DN158TorpedoLoadButtonScript extends ObjectReference

int property TorpedoTubeNumber = 1 auto
{Default == 1
	2	3
	1	4}

;LinkedRefSetup
;	1 - Red Light
;	2 - Yellow Light
;	3 - Green Light
;	4 - Launch Button

Function InitSetUp()
	GetNthLinkedRef(1).enable()			;Red Light
	GetNthLinkedRef(2).disable()		;Yellow Light
	GetNthLinkedRef(3).disable()		;Green Light
endFunction

auto State Waiting
	Event onActivate(objectReference akActivator)
		playAnimation("Play01")
		GoToState("Busy")
		GetNthLinkedRef(1).disable()	;Red Light
		GetNthLinkedRef(2).enable()		;Yellow Light
		GetNthLinkedRef(3).disable()	;Green Light
		playAnimation("yellow")
		(GetLinkedRef(LinkCustom01) as DN158TorpedoLaunchButtonScript).SetTubeLoading()
		StartTimer(7, 1)
	EndEvent
endState


State Busy
	Event onTimer(int aiTimerID)
		Debug.Trace(self + ": TORPEDO LOADED # " + TorpedoTubeNumber)
		GetNthLinkedRef(1).disable()	;Red Light
		GetNthLinkedRef(2).disable()	;Yellow Light
		GetNthLinkedRef(3).enable()		;Green Light
		(GetLinkedRef(LinkCustom01) as DN158TorpedoLaunchButtonScript).SetTubeLoaded()
		GoToState("Loaded")
		playAnimation("red")
	EndEvent
EndState

State Loaded
EndState

Function SetTorpedoTubeClear()
	GetNthLinkedRef(1).enable()			;Red Light
	GetNthLinkedRef(2).disable()		;Yellow Light
	GetNthLinkedRef(3).disable()		;Green Light
	GoToState("Waiting")
	playAnimation("green")
EndFunction

Event onActivate(objectReference akActivator)
	GoToState("Busy")
	playAnimation("Play01")
	GoToState("Waiting")
endEvent
Keyword Property LinkCustom01 auto hidden