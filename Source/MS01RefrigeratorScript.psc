Scriptname MS01RefrigeratorScript extends ObjectReference Const

Quest Property MS01 Auto Const
Scene Property MS01BillyStart Auto Const

Event OnLoad()
	debug.trace("MS01: Door loaded")
	if MS01.GetStage() < 100
		BlockActivation(true)
		debug.trace("MS01: Door blocked")
	else
		BlockActivation(false)
	endif
EndEvent

Event OnActivate(ObjectReference ActionRef)
	debug.trace("MS01: Door activated")
	if ActionRef == game.GetPlayer()
		if MS01.GetStage() < 100
			debug.trace("MS01: starting scene")
			MS01BillyStart.Start()
		endif	
	endif
EndEvent

