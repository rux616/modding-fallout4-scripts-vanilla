Scriptname FuseBox_BoxScript extends ObjectReference Hidden
Group Required_Properties
	Int Property NumberOfMissingFuses = 1 Auto
	{How many missing fuses are there in this box?  From 1 to 9}
EndGroup
Group Optional_Properties CollapsedOnRef
	MiscObject Property Fuse Auto
	Keyword Property LinkCustom01 Auto
	Keyword Property LinkCustom02 Auto
	Keyword Property LinkCustom03 Auto
	Keyword Property LinkCustom04 Auto
	Message Property FuseBox_Notification Auto
EndGroup

Bool bAlreadySetUp = FALSE

Event OnLoad()
    if !bAlreadySetUp
    	bAlreadySetUp = TRUE
    	if (GetLinkedRef(LinkCustom04)as FuseBox_Properties).NumberOfMissingFuses > 0 && (GetLinkedRef(LinkCustom04)as FuseBox_Properties).NumberOfMissingFuses < 10
    		NumberOfMissingFuses = (GetLinkedRef(LinkCustom04)as FuseBox_Properties).NumberOfMissingFuses
    	elseif (GetLinkedRef(LinkCustom04)as FuseBox_Properties).NumberOfMissingFuses < 1
    		NumberOfMissingFuses = 1
    	elseif (GetLinkedRef(LinkCustom04)as FuseBox_Properties).NumberOfMissingFuses > 9
    		NumberOfMissingFuses = 9
    	endif

		int count = 1
		while (count <= NumberOfMissingFuses)
			int RandomNumber = Utility.RandomInt(1,9)
			if !GetNthLinkedRef(RandomNumber,LinkCustom02).IsDisabled()
				GetNthLinkedref(RandomNumber,LinkCustom02).DisableNoWait()
				count += 1
			endif
		endwhile

	endif
EndEvent


auto STATE WaitingForActivation

	Event OnActivate(ObjectReference akActionRef)
		if GetLinkedRef(LinkCustom01).GetOpenState() < 3
		    if akActionRef == Game.GetPlayer() || akActionRef == GetLinkedRef(LinkCustom03)
		    	GoToState("PlacingFuse")
		    	if NumberOfMissingFuses > 0
			    	if Game.GetPlayer().GetItemCount(Fuse) > 0
			    		Game.GetPlayer().RemoveItem(Fuse)
			    		PlaceFuseInBox()
			    	else
			    		GoToState("WaitingForActivation")
			    		FuseBox_Notification.Show()
			    	endif
			    else
			    	GoToState("WaitingForActivation")
			    endif
		    endif
		else
			GetLinkedRef(LinkCustom01).SetOpen()
		endif
	EndEvent

EndSTATE


STATE PlacingFuse

	Function PlaceFuseInBox()
		int count = 1
		while (count < 10)
			if GetNthLinkedRef(count,LinkCustom02).IsDisabled()
				GetNthLinkedref(count,LinkCustom02).EnableNoWait()
				NumberOfMissingFuses -= 1
				count = 10
			else
				count += 1
			endif
		endwhile
		if NumberOfMissingFuses == 0
			GetLinkedRef(LinkCustom04).Activate(Game.GetPlayer())
		endif
		GoToState("WaitingForActivation")
	EndFunction

EndSTATE


Function PlaceFuseInBox()
	;Empty Function
EndFunction