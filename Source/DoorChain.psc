Scriptname DoorChain extends ObjectReference

bool Property abStartOpen = False auto
message Property ChainedMSG auto
keyword Property ChainedDoorNavCutKeyword auto

bool abInitialized = False
ChainedDoor DoorScript
ObjectReference myLink
ObjectReference myNavCutLink

Event OnCellLoad()
	myLink = GetLinkedRef()
	if(GetLinkedRef(ChainedDoorNavCutKeyword))
    	myNavCutLink = GetLinkedRef(ChainedDoorNavCutKeyword)
    endif
    DoorScript = myLink as ChainedDoor
    ;initialize the chain, but only once
    if (!abInitialized)
    	abInitialized = True
    	if abStartOpen == True
    		GoToState("Chained")
    		OnActivate(Self)
    	else
    		myLink.Lock()
    		myLink.SetLockLevel(252)
    		myLink.BlockActivation(True)
    		GoToState("Chained")
    	endif
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if !abInitialized && akActionRef == Game.GetPlayer()
		;The player has activated the chain without it being initialized, so initialize both the door and the chain
		OnCellLoad()
		DoorScript.OnCellLoad()
		OnActivate(Game.GetPlayer())
	endif
EndEvent

State Chained
	Event OnActivate(ObjectReference akActionRef)
			DoorScript.abBusy = True
			;enable nav
			if(myNavCutLink)
				myNavCutLink.Disable()
			endif
			;TODO need art support
			;PlayAnimationAndWait("Unchain", "Done")
			;allow player to activate
			DoorScript.abChained = False
			myLink.Lock(FALSE)
			myLink.BlockActivation(False)
			GoToState("Unchained")
			;TODO can't turn off 'Activate' prompt, so for now, disable
			Self.Disable()
			;open the door when the chain is removed
			DoorScript.abBusy = False
			mylink.Activate(myLink)
	EndEvent
EndState

Event OnReset()
    if(myNavCutLink)
		myNavCutLink.Enable()
	endif
	Self.Enable()
EndEvent

;TODO Allow unchained doors to become chained
State Unchained
;	Event SetChain(bool abChained)
;		if myLink.GetOpenState() == 1
;			;close the door and prevent opening
;			myNavCutLink.Enable()
;			myLink.Activate(Self)
;			myLink.BlockActivation(True)
;			;turn on the chain
;			GoToState("Chained")
;			Self.Enable()
;		endif
;	EndEvent
EndState

;Event SetChain(bool abChained)
;	;Unless unchained, do nothing
;EndEvent