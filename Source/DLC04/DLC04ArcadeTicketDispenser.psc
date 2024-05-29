scriptname DLC04:DLC04ArcadeTicketDispenser extends objectReference
{Ticket Dispenser for use with Arcade game, placed by the arcade game}

state Empty
	Event OnBeginState(string asOldState)
		if asOldState == "Dispensed"
			playAnimation("Play02")
		endif
		self.setDestroyed(true)    
	EndEvent
endState

bool canBeCollected
bool waitingToDispense
State Dispensed
	Event OnBeginState(string asOldState)
		canBeCollected = false
		if asOldState == "Empty" || waitingToDispense
			if is3dLoaded()
				playAnimationAndWait("Play01", "Done")
				waitingToDispense = false
			else
				waitingToDispense = true
			endif
		EndIf
		self.setDestroyed(False)
		canBeCollected = true
	EndEvent

	Event OnActivate(objectReference akActivator)
		if canBeCollected && akActivator == game.getPlayer()
			game.getPlayer().addItem(DLC04_Nukacade_Ticket01, currentTickets, false)
			currentTickets = 0
			GoToState("Empty")
		endif
	endEvent
EndState

function PayoutTickets(int ticketsToPayout)
	currentTickets += ticketsToPayout
	if getState() == "empty" && currentTickets > 0
		GoToState("Dispensed")
	endif
endFunction

int property currentTickets = 0 auto hidden
MiscObject Property DLC04_Nukacade_Ticket01 auto Const Mandatory

Event OnCellAttach()
	Debug.trace(Self + "OnCellAttach")
	if currentTickets > 0
		GoToState("Dispensed")
	else
		GoToState("Empty")
	endif
EndEvent

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent

Event ObjectReference.OnReset(ObjectReference akSender)
	Debug.Trace(self + ": Has Received OnReset !!!!!")
	Delete()
EndEvent

; Anim list
;	Stage1 is the dormant stage – no tickets showing
;	Stage2 is the anim stage – tickets roll out
;	Stage3 is for if you walk away from the machine and the cell resets, the tickets will remain rolled out, and not reset to the stage1 dormant stage.
;
;