Scriptname DLC04:DLC04TicketStackScript extends ObjectReference Const
{add a random number of Nuka-Cade Tickets to the player and disable self.}

LeveledItem Property DLC04_LL_TicketStack Auto Const Mandatory

EVENT OnLoad()    
	blockActivation()
endEVENT

EVENT OnActivate(ObjectReference akActionRef)
	;debug.trace("bobby pin box taken by "+akActionRef)
    ;if akActionRef == game.GetPlayer()
    	akActionRef.addItem(DLC04_LL_TicketStack)
    	disable()
    	delete()
    ;endif
endEVENT