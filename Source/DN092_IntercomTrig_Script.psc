Scriptname DN092_IntercomTrig_Script extends ObjectReference const

scene property myScene auto const

; okay thinking again...

Event onTriggerEnter(ObjectReference akActionRef)
	if akActionRef as actor == game.getPlayer()
		if myScene.isPlaying()
			; scene is already playing.  Do nothing.
		else
			myScene.start()
		endif	
	endif
endEVENT