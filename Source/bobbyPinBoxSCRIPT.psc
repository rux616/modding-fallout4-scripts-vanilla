Scriptname bobbyPinBoxSCRIPT extends ObjectReference Const
{add a random number of bobby pins to the player and disable self.}

LeveledItem Property LL_BobbyPinBox Auto Const

EVENT OnLoad()    
	blockActivation()
endEVENT

EVENT OnActivate(ObjectReference akActionRef)
	;debug.trace("bobby pin box taken by "+akActionRef)
    ;if akActionRef == game.GetPlayer()
    	akActionRef.addItem(LL_BobbyPinBox)
    	disable()
    	delete()
    ;endif
endEVENT