Scriptname ChipBoard_Base extends ObjectReference Hidden Conditional

Keyword Property LinkCustom01 Auto
MiscObject Property Chip Auto
Message Property MissingChipMessage Auto

auto STATE AcceptingChip
	Event OnActivate(ObjectReference akActionRef)
	    if akActionRef == Game.GetPlayer()
	    	if Game.GetPlayer().GetItemCount(Chip) > 0
	    		GoToState("Done")
	    		Game.GetPlayer().RemoveItem(Chip)
	    		PlayAnimation("Stage2")
	    		utility.Wait(0.5)
	    		GetLinkedRef(LinkCustom01).Activate(Game.GetPlayer())
	    	else
	    		MissingChipMessage.Show()
	    	endif
	    endif
	EndEvent
EndSTATE

STATE Done
	;Do Nothing
EndSTATE