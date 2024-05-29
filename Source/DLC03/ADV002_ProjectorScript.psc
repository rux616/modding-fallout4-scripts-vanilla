Scriptname DLC03:ADV002_ProjectorScript extends ObjectReference

Group SoundProperties collapsedOnRef

	Sound Property SoundStartShow auto Const mandatory	;running/idle
	;originally OBJProjectorRunLPM

EndGroup

ObjectReference Property MovietoEnable auto
ObjectReference Property MovietoDisable auto

ADV002_ProjectorScript Property ProjectorToStop Auto
;the other projector

;Bool Property StartOn Auto
;needs to coordinate with OnPostition from CircuitBreaker

int mySound

Event OnLoad()

	debug.trace(self + " is loaded")


EndEvent

Event OnActivate(objectReference akActionRef)
	debug.trace(self + " Activated")
	StartMovie()
	StopOtherMovie()
EndEvent

Function StartMovie()

	MovietoEnable.Enable()
	mySound = SoundStartShow.Play(Self)

EndFunction


function StopOtherMovie()

	MovietoDisable.Disable()

EndFunction
