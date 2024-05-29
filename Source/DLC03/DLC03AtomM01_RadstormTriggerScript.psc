Scriptname DLC03:DLC03AtomM01_RadstormTriggerScript extends ObjectReference Const

Quest Property DLC03AtomM01 Auto Const Mandatory
Weather Property DLC03AtomM01_RadStorm Auto Const Mandatory
int Property iShutdownStage = 100 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	;When player enters trigger, if DLC03 hasn't reached shutdown stage, set weather to Radstorm
	if akActionRef == Game.GetPlayer() && DLC03AtomM01.IsRunning() && !DLC03AtomM01.GetStageDone(iShutdownStage)
		debug.trace(self + "AtomM01: Triggering radstorm")
		DLC03AtomM01_RadStorm.SetActive()
	endif
EndEvent