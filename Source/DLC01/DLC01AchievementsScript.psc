Scriptname DLC01:DLC01AchievementsScript extends Quest

bool initialized

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForTrackedStatsEvent("Robots Improved", 10)
	RegisterForTrackedStatsEvent("HSAutomatron", 10)

	;Debug.Trace("DLC01 Achievements Intialized")

	initialized = true
endFunction

event OnTrackedStatsEvent(string statFilter, int statValue)

	;Debug.Trace("DLC01 Stat Event Sent for " + statFilter + " at " + statValue)

	if statFilter == "Robots Improved"
		if statValue >= 10
			Game.AddAchievement(55)
		endif
	endif

	if statFilter == "HSAutomatron"
		Game.AddAchievement(35)
	endif

EndEvent