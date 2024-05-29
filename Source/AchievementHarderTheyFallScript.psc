Scriptname AchievementHarderTheyFallScript extends Actor

Quest Property pAchievements Auto Const Mandatory

Event OnDeath(Actor akKiller)
	if akKiller == Game.GetPlayer()
		pAchievements.SetStage(360)
	endif
EndEvent