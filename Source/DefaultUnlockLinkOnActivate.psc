Scriptname DefaultUnlockLinkOnActivate extends ObjectReference Const
{Default script for opening it's linked ref on activate.  Optionally opens the door as well.}

Bool Property bShouldOpenDoor = TRUE Auto Const
{Whether the door should open when unlocked.  Default = TRUE}

Event OnActivate(ObjectReference akActionRef)
    if GetLinkedRef().IsLocked()
    	GetLinkedRef().Unlock()
    	if bShouldOpenDoor
    		GetLinkedRef().SetOpen()
    	endif
    endif
EndEvent