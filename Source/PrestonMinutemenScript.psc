Scriptname PrestonMinutemenScript extends Actor Const

MinutemenCentralScript property MinutemenCentralQuest auto const mandatory

keyword property LocTypeWorkshopSettlement auto const mandatory

Event OnLoad()
    if MinutemenCentralQuest.MinutemenProgress >= 1
    	Location currentLocation = GetCurrentLocation()
    	if currentLocation && currentLocation.HasKeyword(LocTypeWorkshopSettlement)
	    	debug.trace(self + " OnLoad - update recruitment quests")
	    	; clean up recruitment quests
	    	MinutemenCentralQuest.UpdateActiveRecruitmentQuests()

	    	; try to start recruitment quests if Min02 not done, OR Min301 is running
	    	if MinutemenCentralQuest.MinutemenProgress < 4 || MinutemenCentralQuest.Min301.IsRunning()
		    	debug.trace(self + " OnLoad - try to start a recruitment quest")
		    	; try to start a recruitment quest
		    	MinutemenCentralQuest.TryToStartRecruitmentQuest()
		    endif
	    endif
    endif
EndEvent