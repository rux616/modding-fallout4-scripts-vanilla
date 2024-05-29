Scriptname MQ106InvestigationSiteTriggerScript extends ObjectReference const

int property siteNumber auto const
Scene Property Site04_JabberingRobot Auto Const
Scene property DogmeatFindsClue auto const
scene property DogmeatLostTrail auto Const
quest property MQ106Investigations auto const
quest property MQ106 auto const
ObjectReference Property myClue auto const
ObjectReference property dogmeat auto const
referenceAlias property nextClue auto const
float property clueTimer auto const
{How long before we update the objective marker?}
globalvariable property MQ106clueTimerRunning auto const
{this global denotes if a timer is running.  Used for objective conditions in MQ106}

Event OnTimer(int aiTimerID)
    debug.trace("MQ106 investigation site #"+siteNumber+" timer has expired.  Mark the objective, unless we've leapfrogged ahead.")
    MQ106clueTimerRunning.setValue(0)
    if siteNumber == 1 && MQ106Investigations.getStage() < 10
    	MQ106.setObjectiveDisplayed(11)
    endif
    if siteNumber == 2 && MQ106Investigations.getStage() < 20
    	MQ106.setObjectiveDisplayed(12)
    	MQ106.setObjectiveDisplayed(11, false)
    endif
    if siteNumber == 3 && MQ106Investigations.getStage() < 30
    	MQ106.setObjectiveDisplayed(13)
    	MQ106.setObjectiveDisplayed(12, false)
    	MQ106.setObjectiveDisplayed(11, false)
    endif
    if siteNumber == 4 && MQ106Investigations.getStage() < 40
    	MQ106.setObjectiveDisplayed(14)
    	MQ106.setObjectiveDisplayed(13, false)
    	MQ106.setObjectiveDisplayed(12, false)
    	MQ106.setObjectiveDisplayed(11, false)
    endif
    if siteNumber == 5 && MQ106Investigations.getStage() < 50
    	MQ106.setObjectiveDisplayed(15)
    	MQ106.setObjectiveDisplayed(14, false)
    	MQ106.setObjectiveDisplayed(13, false)
    	MQ106.setObjectiveDisplayed(12, false)
    	MQ106.setObjectiveDisplayed(11, false)
    endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == game.getPlayer() && MQ106Investigations.getStageDone(1)

		if MQ106clueTimerRunning.getValue() == 0
			MQ106clueTimerRunning.setValue(1)
			startTimer(clueTimer)
			debug.trace("MQ106: Started "+clueTimer+" timer")
		endif
		
		debug.trace("MQ106: Entering Site0"+siteNumber)
		MQ106InvestigationsScript questScript = MQ106Investigations as MQ106InvestigationsScript
		(dogmeat as actor).evaluatePackage()

		; set "sniff" vars up to high values
		debug.trace("Attempt to start the scene: "+DogmeatFindsClue)
		;ObjectReference akClue = self.getLinkedRef()
		;debug.trace("My clue object is: "+akClue)
		(dogmeat as DogmeatActorScript).makeDogmeatSniffy(TRUE)
		nextClue.forceRefTo(myClue)
		dogmeatIdles.setDogmeatPlayful()
		DogmeatFindsClue.start()

		if siteNumber == 1 && !MQ106Investigations.getStageDone(10)
			questScript.bSite01Active = TRUE
			questScript.bAnySiteActive = TRUE
			if !MQ106Investigations.getStageDone(9)
				DogmeatLostTrail.start()
				MQ106Investigations.setStage(9)
			endif
		endif

		if siteNumber == 2 && !MQ106Investigations.getStageDone(20)
			questScript.bSite02Active = TRUE
			questScript.bAnySiteActive = TRUE
			if !MQ106Investigations.getStageDone(19)
				DogmeatLostTrail.start()
				MQ106Investigations.setStage(19)
			endif
		endif

		if siteNumber == 3 && !MQ106Investigations.getStageDone(30)
			questScript.bSite03Active = TRUE
			questScript.bAnySiteActive = TRUE
			if !MQ106Investigations.getStageDone(29)
				DogmeatLostTrail.start()
				MQ106Investigations.setStage(29)
			endif
		endif
	
		if siteNumber == 4  && !MQ106Investigations.getStageDone(40)
			debug.trace("MQ106Inv: Entering site04")
		    questScript.bSite04active = TRUE
		    questScript.bAnySiteActive = TRUE
		    if!(Site04_JabberingRobot.isPlaying())
		    	Site04_JabberingRobot.start()
		    endif
		    if !MQ106Investigations.getStageDone(39)
				DogmeatLostTrail.start()
				MQ106Investigations.setStage(39)
			endif
	    endif

	    if siteNumber == 5 && !MQ106Investigations.getStageDone(50)
				questScript.bSite05Active = TRUE
				questScript.bAnySiteActive = TRUE
				if !MQ106Investigations.getStageDone(49)
					DogmeatLostTrail.start()
					MQ106Investigations.setStage(49)
				endif
			endif
		endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionref == game.getPlayer()

		; set "sniff" vars back to normal values
		(dogmeat as DogmeatActorScript).makeDogmeatSniffy(FALSE)
	
		debug.trace("MQ106: Exiting Site0"+siteNumber)
		MQ106InvestigationsScript questScript = MQ106Investigations as MQ106InvestigationsScript
		(dogmeat as actor).evaluatePackage()
	    questScript.bAnySiteActive = FALSE

		if siteNumber == 1
			questScript.bSite01Active = FALSE
		endif

		if siteNumber == 2
			questScript.bSite02Active = FALSE
		endif

		if siteNumber == 3
			questScript.bSite03Active = FALSE
		endif

		if siteNumber == 4
			debug.trace("MQ106Inv: Leaving site04")
			questScript.bSite04active = FALSE
		    if(Site04_JabberingRobot.isPlaying())
		    	Site04_JabberingRobot.stop()
		    endif
	    endif

	    if siteNumber == 5
			questScript.bSite05Active = FALSE
		endif
    endif
EndEvent