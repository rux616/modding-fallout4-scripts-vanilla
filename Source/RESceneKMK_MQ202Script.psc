Scriptname RESceneKMK_MQ202Script extends Quest

int Property maxKelloggCount auto
int Property currentKelloggCount auto

Faction Property RESceneKMK_MQ202Faction auto const mandatory

function Startup()
	; initialize maxKelloggCount
	; how many registered aliases?
	REScript myselfREScript = (self as Quest) as REScript
	maxKelloggCount = utility.RandomInt(2, myselfREScript.registeredAliasCount)
	; sometimes enable one extra Kellogg
	if utility.RandomInt() >= 50
		int enableIndex = utility.RandomInt(0, myselfREScript.registeredAliasCount-1)
		debug.trace(self + " enabling extra starting Kellogg! index=" + enableIndex)
		myselfReScript.RegisteredAliases[enableIndex].TryToEnable()
		IncrementKelloggCount()
	endif
endFunction

function IncrementKelloggCount()
	currentKelloggCount += 1
endFunction