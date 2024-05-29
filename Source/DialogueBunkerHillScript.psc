Scriptname DialogueBunkerHillScript extends Quest Conditional

; called once by startup stage
function InitializeQuest()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)

	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		if akNewLoc == pBunkerHillLocation
			
			; This code block is making sure no caravan people are currently loaded
			; Do not start the Caravan visiting quest unless all of the caravan peeps have already left
			bool bCarlaLoaded = Alias_Carla.GetActorReference().Is3DLoaded()
			bool bCricketLoaded = Alias_Cricket.GetActorReference().Is3DLoaded()
			bool bDocLoaded = Alias_DocWeathers.GetActorReference().Is3DLoaded()
			bool bLucasLoaded = Alias_LucasMiller.GetActorReference().Is3DLoaded()
			;bool bCarlaLoaded = pCarlaREF.Is3DLoaded()
			;bool bCricketLoaded = pCricketREF.Is3DLoaded()
			;bool bDocLoaded = pDocWeathersREF.Is3DLoaded()
			;bool bLucasLoaded = pLucasMillerREF.Is3DLoaded()

			if ( !bCarlaLoaded && !bCricketLoaded && !bDocLoaded && !bLucasLoaded )
	    		pCaravanBH01.SetStage(100)		; Set up the Caravan visiting quest
	    	endif
		endif

		if akOldLoc == pBunkerHillLocation
	    	if ( pCaravanBH01.GetStageDone(100) )	; If the quest is open...
	    		pCaravanBH01.SetStage(200)		; ...close it
	    	endif
		endif
	endif

EndEvent

Quest Property pCaravanBH01 Auto Const

Location Property pBunkerHillLocation Auto Const

ReferenceAlias Property Alias_Carla Auto Conditional
ReferenceAlias Property Alias_Cricket Auto Conditional
ReferenceAlias Property Alias_DocWeathers Auto Conditional
ReferenceAlias Property Alias_LucasMiller Auto Conditional
