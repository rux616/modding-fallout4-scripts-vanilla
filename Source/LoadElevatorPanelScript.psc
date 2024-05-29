Scriptname LoadElevatorPanelScript extends ObjectReference Hidden

Group Optional_Properties
	Bool Property bStartDeactivated = FALSE Auto
{
Whether this elevator starts "off" or not.
If set to TRUE then LinkCustom01 this button to the ElevatorMeter above the door.
}

Message Property DeactivatedMessage Auto
	{Message that shows up when any elevator button is pressed while it's deactivated.}
EndGroup

Group No_Touchy CollapsedOnRef
	Bool Property InteriorPanel = FALSE Auto Const
	{Only for the button inside the elevator.}

	Keyword Property LinkCustom01 Auto Const
	{Only used if you want this elevator to start in the "off" state, to be turned on later.}
	
	;Keyword Property LinkCustom02 Auto Const
	;{Only used if you want this elevator to start in the "off" state, to be turned on later.}

EndGroup

Bool bHasAlreadyLoaded = FALSE



Event OnLoad()
	if !bHasAlreadyLoaded
		bHasAlreadyLoaded = TRUE
	    if InteriorPanel
	    	PlayAnimation("Play01")
	    endif
	    utility.Wait(0.1)
	    if bStartDeactivated
	    	ObjectReference Link01 = GetLinkedRef(LinkCustom01)
	    	if Link01
	    		if !Link01.Is3DLoaded()
					Link01.Waitfor3dLoad()
				endif
				Link01.PlayAnimation("Play02")
			endif
			if GetLinkedRef().GetLinkedRef()
	    		RegisterForRemoteEvent(GetLinkedRef().GetLinkedRef(), "OnActivate")
	    		GetLinkedRef().GetLinkedRef().BlockActivation()
	    	endif
			Playanimation("StartOff")
		else
			;Do Nothing
		endif
	endif

EndEvent





Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if akSender == GetLinkedRef().GetLinkedRef()
		if bStartDeactivated
			if akActionRef == Game.GetPlayer()
    			DeactivatedMessage.Show()
    		endif
    	endif
	endif
	
EndEVENT


Event OnActivate(ObjectReference akActionRef)
    if bStartDeactivated
		if akActionRef == Game.GetPlayer()
			DeactivatedMessage.Show()
		endif
    else
    	if InteriorPanel
    		if GetLinkedRef().GetOpenState() == 1
    			GetLinkedRef().Activate(Game.GetPlayer())
    		endif
    	else
	    	if GetLinkedRef().GetOpenState() == 3
	    		(GetLinkedRef() as LoadElevatorDoorScript).ActivatedFromButton = TRUE
	    		GetLinkedRef().Activate(Game.GetPlayer())
	    	endif
	    endif
	endif
EndEvent

Function MakeElevatorFunctional()
	bStartDeactivated = FALSE
	if GetLinkedRef(LinkCustom01)
		GetLinkedRef(LinkCustom01).PlayAnimation("StartOn")
		GetLinkedRef().SetLockLevel(0)
	endif
	if GetLinkedRef().GetLinkedRef()
		UnRegisterForRemoteEvent(GetLinkedRef().GetLinkedRef(), "OnActivate")
		GetLinkedRef().GetLinkedRef().BlockActivation(FALSE)
	endif
	Playanimation("Play02")
EndFunction

Function MakeElevatorNonFunctional(bool ShouldDoorClose = TRUE)
	bStartDeactivated = TRUE
	if GetLinkedRef().GetLinkedRef(LinkCustom01)
		GetLinkedRef().GetLinkedRef(LinkCustom01).PlayAnimation("Play02")
	endif
	if GetLinkedRef()
		if ShouldDoorClose
			GetLinkedRef().SetOpen(FALSE)
			GetLinkedRef().SetLockLevel(254)
		else
			GetLinkedRef().SetOpen(TRUE)
		endif
	endif
	if GetLinkedRef().GetLinkedRef()
		RegisterForRemoteEvent(GetLinkedRef().GetLinkedRef(), "OnActivate")
		if ShouldDoorClose
			GetLinkedRef().GetLinkedRef().SetOpen(FALSE)
		else
			GetLinkedRef().GetLinkedRef().SetOpen(TRUE)
		endif
		GetLinkedRef().GetLinkedRef().BlockActivation()
	endif
	Playanimation("StartOff")

	utility.Wait(1)

	if GetLinkedRef()
		if !ShouldDoorClose
			GetLinkedRef().SetOpen(TRUE)
		endif
	endif
	if GetLinkedRef().GetLinkedRef()
		if !ShouldDoorClose
			GetLinkedRef().GetLinkedRef().SetOpen(TRUE)
		endif
	endif
EndFunction