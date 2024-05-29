Scriptname RECorpseSwarmCreatorScript extends Quest Conditional Const

function InitializeSwarm(Actor Corpse, BugSwarmFXScript swarm, bool randomEnable = false)
	; if no corpse, bail
	if Corpse == None
		return
	endif

	; tag vulture prey with keywords so they won't get picked again
;	Corpse.AddKeyword(REVulturePreyKeyword)

	; if random enable, roll and then bail if roll fails
	if randomEnable
		if Utility.RandomInt() <= RandomEnablePercent
			debug.trace(self + " enabling swarm " + swarm)
			; enable
			swarm.Enable()
		else
			debug.trace(self + " deleting swarm " + swarm)
			swarm.Delete()
			return
		endif
	endif
	
	; move to corpse
	swarm.Moveto(Corpse)
	
	; reset that to "home"
	swarm.ResetHomeCoords()

	; make swarm clean itself up on unload
	swarm.CleanMyselfUp = true 

endFunction

;Keyword property REVulturePreyKeyword auto const
int Property RandomEnablePercent = 75 auto const


