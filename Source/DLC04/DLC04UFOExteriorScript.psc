Scriptname DLC04:DLC04UFOExteriorScript extends ObjectReference


GlobalVariable Property DLC04MS02_UFOIsPowered auto const Mandatory

String Property PoweredAnim = "Play01" auto const

int mySound
Function CheckPower()
	if DLC04MS02_UFOIsPowered.GetValue() >= 1
		SetToPowered()
	Endif
EndFunction

Function SetToPowered()
	PlayAnimation(PoweredAnim)
	ObjectReference mySoundMarker = GetLinkedRef()
	if mySoundMarker
		mySoundMarker.EnableNoWait()
	endif
	GoToState("Powered")
EndFunction

Auto State Unpowered
	Event OnCellAttach()
		PlayAnimation("StartAtStart01")
	EndEvent
EndState

State Powered
	Event OnCellAttach()
		PlayAnimation("StartOn01")
		ObjectReference mySoundMarker = GetLinkedRef()
		if mySoundMarker
			mySoundMarker.EnableNoWait()
		endif
	EndEvent
EndState