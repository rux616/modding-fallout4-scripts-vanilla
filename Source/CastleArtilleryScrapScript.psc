Scriptname CastleArtilleryScrapScript extends ObjectReference
{give player scrap when this is activated}

LeveledItem Property CastleArtilleryScrapItems Auto Const Mandatory

auto state ready
	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef is Actor 
	    	gotoState("done")
	    	akActionRef.AddItem(CastleArtilleryScrapItems)
	    	disable()
	    	delete()
	    endif
	EndEvent
endState

state done

endState

