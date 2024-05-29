Scriptname DLC03:DLC03MQ02Script extends Quest Conditional

Int Property bRefusedLongfellow Auto Conditional
Int Property bBusinessAcadia Auto Conditional
Int Property bBusinessKasumi Auto Conditional

Int Property bKilledTrappersWithoutLongfellow Auto Conditional

Int Property bKilledCrittersWithoutLongfellow Auto Conditional

Int Property bReactivityInterrogationComment Auto Conditional
Int Property bReactivityPCAgainstChildren Auto Conditional
Int Property bReactivityRespectfulToAvery Auto Conditional
Int Property bReactivityPCDidntNeedAGuide Auto Conditional

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	
	; watch for player to change location
	Debug.Trace("MS04Script has detected player changing location")

	; When the player leaves the Memory Den for the first time after receiving activities
	;if akSender == Game.GetPlayer() && akOldLoc == pGoodneighborTheMemoryDenLocation
	;	SetStage(403)    ; Told about Wayne Delancy
	;endif

EndEvent
