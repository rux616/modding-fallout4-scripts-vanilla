Scriptname DN143TempLockedTerminal extends ObjectReference Hidden Const

Event OnLockStateChanged()
    GetLinkedRef().Lock(FALSE)
    if GetLinkedRef().GetOpenState() == 3
    	GetLinkedRef().SetOpen()
    else
    	GetLinkedRef().SetOpen(FALSE)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if IsLocked() == FALSE
	    if GetLinkedRef().GetOpenState() == 3
	    	GetLinkedRef().SetOpen()
	    else
	    	GetLinkedRef().SetOpen(FALSE)
	    endif
	endif
EndEvent