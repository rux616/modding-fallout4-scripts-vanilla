Scriptname DN033_PlaySoundScript extends ObjectReference Hidden
{Plays a sound when activated}

Sound Property mySound Auto Mandatory Const

;**********************************************************

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		gotoState("DoNothing")
		mySound.play(self)
	EndEvent
EndState

;**********************************************************

State DoNothing
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

;**********************************************************