Scriptname DLC04:DLC04AchievementQuestScript extends Quest Conditional

bool initialized

function InitializeQuest()
        if initialized
                return
        endif

        RegisterForTrackedStatsEvent("Nuka World Creatures Killed", 40)
        Debug.Trace("DLC04 Achievements Intialized")

        initialized = true
endFunction

event OnTrackedStatsEvent(string statFilter, int statValue)

        ;Debug.Trace("DLC04 Stat Event Sent for " + statFilter + " at " + statValue)

        if statFilter == "Nuka World Creatures Killed"
                if statValue >= 40
                        Game.AddAchievement(79)
                endif
        endif

EndEvent