Scriptname DLC03:DLC03AchievementsScript extends Quest Conditional

struct StatAchievement
	string StatName
	{Name of the stat}
	int Threshold
	{If the stat is equal to or greater than this, unlock the achievement}
	int AchievementNumber
	{The achievement to unlock}
endStruct

bool initialized

StatAchievement[] Property StatAchievements auto const mandatory
{All the simple "stat is equal or larger than x" achivements - must be unique stats and not overlap with future retro or other achivements}

function InitializeQuest()
	if initialized
		return
	endif

	RegisterEvents()

	Debug.Trace("DLC03Achievements Intialized")

	initialized = true
endFunction

; Function that does all the registration for events that we care about
; It's seperate from InitializeQuest so that it can easily be called from
; the console to 'fix' old save games made before the stat events were
; changed to single-shot
; This could also be used if we change the thresholds for the achivements
; as the thresholds are saved into the save game, so we'd need to update
; them.
function RegisterEvents()
	; Register all the simple ones
	int index = 0
	while (index < StatAchievements.Length)
		StatAchievement curAchivement = StatAchievements[index]
		RegisterForTrackedStatsEvent(curAchivement.StatName, curAchivement.Threshold)
		index += 1
	endWhile
endFunction

EVENT OnTrackedStatsEvent(string statFilter, int statValue)
	Debug.Trace(statFilter + " is " + statValue)

	; Note that once we find a stat, we stop looking to see if it is used in other achivements under
	; the assumption that a stat is never used in more than one achivement. If this changes, this
	; code will need to change as well.

	int achievementIndex = StatAchievements.FindStruct("StatName", statFilter)
	Game.GivePlayerCaps(achievementIndex)
	Game.AddAchievement(StatAchievements[achievementIndex].AchievementNumber)

endEvent