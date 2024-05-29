scriptName defaultDisableOnResetIfLocWasCleared extends ScriptedResetRef 
{This script disables its object on reset if the location has been cleared once
	it requires a linkRef to an xmarker to track this state}

float GameTimeCleared

event onCellDetach()
 	debug.Trace(self + ": has run onCellDetach")
 	debug.Trace(self + ":::: Current location " + self.getCurrentLocation() + " hasBeenCleared = " + self.getCurrentLocation().isCleared())
	if self.getCurrentLocation().isCleared()
 		debug.Trace(self + ": cell is cleared - setting hasBeenCleared")
		getLinkedRef().disable()
		;Store the game time in case this doesn't get a reset event
		GameTimeCleared = utility.GetCurrentGameTime()
	endIf
	RegisterForReset()
endEvent

;;;;;;;;;;;;;This uses a linkedRef instead of a property because properties are reset when the cell is;;;;;;;;;;
Function ScriptedReset()
 	debug.Trace(self + ": has called onReset"); - hasBeenCleared = " + hasBeenCleared)
	if getLinkedRef().isEnabled()
 		debug.Trace(self + ": has found that my linkedRef is enabled, enabling self")
		Self.Enable()
	Else
 		debug.Trace(self + ": has found that my linkedRef is disabled, disabling self")
		Self.Disable()
	EndIf
EndFunction

;;;;;;;;;;;;If this is an enable marker in a NO RESET zone
;	we won't get the reset event, but can check against the game time logged previously
;	If this IS a reseting location, the var will be cleared, but OnReset should handle it
Event onCellAttach()
	debug.Trace(self + ": has called onCellAttach")
	debug.Trace(Self + "::: GameTimeCleared == " + GameTimeCleared)
	;Check if the time we logged a cleared OnCellDetach + the iHoursToClearCorpses game setting 
	; is less than the current game time, If so check if the linkedRef is enabled
	if GameTimeCleared != 0.0
		if (GameTimeCleared + ((Game.GetGameSettingint("iHoursToClearCorpses") as float)/24.0)) <= utility.GetCurrentGameTime()
			debug.Trace(self + "::::: Has passed cleared time check, check for disable")
			if getLinkedRef().isEnabled()
		 		debug.Trace(self + ": has found that my linkedRef is enabled, enabling self")
				Self.Enable()
			Else
		 		debug.Trace(self + ": has found that my linkedRef is disabled, disabling self")
				Self.Disable()
			EndIf
		Endif
	Endif

EndEvent