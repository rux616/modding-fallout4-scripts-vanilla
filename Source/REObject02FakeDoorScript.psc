Scriptname REObject02FakeDoorScript extends ObjectReference Const
{door script to link two doors as a fake load door}

Event OnActivate(ObjectReference akActionRef)
    if (akActionRef as Actor)
    	; move to linked marker
    	akActionRef.MoveTo(GetLinkedRef())
    endif
EndEvent