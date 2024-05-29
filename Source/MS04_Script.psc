Scriptname MS04_Script extends Quest Conditional
{This is the main quest script for the Silver Shroud}

int Property nOverrideAvailable auto Conditional
Int Property EvilShroud Auto Conditional
Int Property bEndMinionsAfraid Auto Conditional
Location Property pGoodneighborTheMemoryDenLocation Auto Const

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	
	; watch for player to change location
	Debug.Trace("MS04Script has detected player changing location")

	; When the player leaves the Memory Den for the first time after receiving activities
	;if akSender == Game.GetPlayer() && akOldLoc == pGoodneighborTheMemoryDenLocation
	;	SetStage(403)    ; Told about Wayne Delancy
	;endif

EndEvent

Int Property bHancockGaveReward Auto Conditional
