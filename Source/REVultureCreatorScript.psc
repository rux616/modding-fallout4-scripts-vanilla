Scriptname REVultureCreatorScript extends Quest Conditional Const

function InitializeVulture(Actor Corpse, VultureCritterScript Vulture, bool randomEnable = false)
	; if no corpse, bail
	if Corpse == None
		return
	endif

	; tag vulture prey with keywords so they won't get picked again
	Corpse.AddKeyword(REVulturePreyKeyword)

	; if random enable, roll and then bail if roll fails
	if randomEnable
		if Utility.RandomInt() <= RandomEnablePercent
			debug.trace(self + " enabling vulture " + vulture)
			; enable
			Vulture.Enable()
		else
			debug.trace(self + " deleting vulture " + vulture)
			Vulture.Delete()
			return
		endif
	endif
	
	; move to corpse
	Vulture.Moveto(Corpse)
	
	; try randomly making the vultures fly or not
	if (Utility.RandomInt() <= StartFlyingPercent)
		debug.trace(self + " start flying " + Vulture)
		Vulture.Takeoff() 
	endif

	; make vulture clean itself up on unload
	Vulture.CleanMyselfUp = true 

endFunction

Keyword property REVulturePreyKeyword auto const
int Property StartFlyingPercent = 50 auto const
int Property RandomEnablePercent = 50 auto const
