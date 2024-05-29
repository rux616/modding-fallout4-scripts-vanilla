Scriptname DLC06:DLC06CompanionTrackerScript extends Quest

GlobalVariable Property pDLC06TrackerToggleAll Auto Const Mandatory
GlobalVariable Property pDLC06TrackerTokensOnly Auto Const Mandatory
Faction Property pHasBeenCompanionFaction Auto Const Mandatory
ObjectReference Property oTerminal Auto  
Message Property DLC06TrackerMessageHide Auto Const Mandatory
Message Property DLC06TrackerMessageShow Auto Const Mandatory



Function ToggleObjectives( actor aRef, int nObjective )
	bool bDisplay = TRUE
	Message mDisplay = DLC06TrackerMessageHide

	if ( pDLC06TrackerTokensOnly.GetValue() == 0 )		; As long as other things are being updated go for it
		if ( IsObjectiveDisplayed(nObjective) && pDLC06TrackerToggleAll.GetValue() == 0 )
			bDisplay = FALSE
			mDisplay = DLC06TrackerMessageShow
		endif

		; If you aren't an available companion - hide the objective in all cases
		if ( !aRef.IsInFaction(pHasBeenCompanionFaction) || pDLC06TrackerToggleAll.GetValue() == 2 )
			bDisplay = FALSE
			mDisplay = DLC06TrackerMessageShow
		endif

		oTerminal.AddTextReplacementData("Comp"+nObjective, mDisplay)	

		SetObjectiveDisplayed(nObjective, bDisplay)
	else
		Debug.Trace("CompTrack: " + aRef + ", " + nObjective)
		if ( IsObjectiveDisplayed(nObjective) )
			oTerminal.AddTextReplacementData("Comp"+nObjective, DLC06TrackerMessageHide)	
		else
			oTerminal.AddTextReplacementData("Comp"+nObjective, DLC06TrackerMessageShow)	
		endif
	endif
EndFunction

Function SetTerminal( ObjectReference akTerminalREF )
	oTerminal = akTerminalREF
	SetStage(50)
EndFunction

