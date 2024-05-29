Scriptname DiamondCityElevatorScript extends ObjectReference Conditional

Keyword Property LinkCustom01 const auto
Keyword Property LinkCustom02 const auto
Keyword Property LinkCustom03 const auto
Keyword Property LinkCustom04 const auto
Keyword Property LinkCustom05 const auto
Keyword Property LinkElevatorCutBottomNavmesh const auto
Keyword Property LinkElevatorCutUpperNavmesh const auto
Message Property CallElevatorMSG const Auto

;allow other things to listen for when the elevator is up or down
GlobalVariable Property DmndMayorElevatorUp Auto

ObjectReference ButtonBottom
ObjectReference ButtonTop
ObjectReference ButtonPlatform
ObjectReference Platform
ObjectReference PlatformDoor
ObjectReference CutNavmeshBottom
ObjectReference CutNavmeshUpper

Bool property ElevatorAtTop = FALSE Auto Conditional

Bool AlreadyLoaded = FALSE

Event OnInit()
    ButtonBottom = GetLinkedRef(LinkCustom01)
    ButtonTop = GetLinkedRef(LinkCustom02)
    ButtonPlatform = GetLinkedRef(LinkCustom03)
    Platform = GetLinkedRef(LinkCustom04)
    PlatformDoor = GetLinkedRef(LinkCustom05)
    CutNavmeshBottom = GetLinkedRef(LinkElevatorCutBottomNavmesh)
    CutNavmeshUpper = GetLinkedRef(LinkElevatorCutUpperNavmesh)
EndEvent

Event OnLoad()
    if !AlreadyLoaded
    	AlreadyLoaded=TRUE
    	RegisterForRemoteEvent(ButtonBottom, "OnActivate")
    	RegisterForRemoteEvent(ButtonTop, "OnActivate")
    	RegisterForRemoteEvent(ButtonPlatform, "OnActivate")
    	PlatformDoor.PlayAnimation("StartDown")
    	Platform.PlayAnimation("StartPressBoxDown")
    	CutNavmeshUpper.Enable()
    endif	
EndEvent

auto STATE WaitingForActivation
	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
		GoToState("DoNothing")
		if akSender == ButtonBottom && ElevatorAtTop
			MoveElevatorDown()
		ElseIf akSender == ButtonBottom && !ElevatorAtTop
			CallElevatorMSG.Show()
			utility.wait(0.25)
			GoToState("WaitingForActivation")
		elseif akSender == ButtonTop && !ElevatorAtTop
			MoveelevatorUp()
		ElseIf akSender == ButtonTop && ElevatorAtTop
			CallElevatorMSG.Show()
			utility.wait(0.25)
			GoToState("WaitingForActivation")
		elseif akSender == ButtonPlatform
			if ElevatorAtTop
				;Utility.Wait(2)
				MoveElevatorDown()
			else
				;Utility.Wait(2)
				MoveElevatorUp()
			endif
		else
			GoToState("WaitingForActivation")
		endif
	EndEvent
ENDSTATE

Function MoveElevatorDown()
	utility.wait(0.25)
	;retract platform bridge
	PlatformDoor.PlayAnimation("Play01")
	;cut navmesh
	CutNavmeshUpper.Enable()
	utility.wait(0.5)
	;elevator arms extend outward for drop
	Platform.PlayAnimationAndWait("Extend", "done")
	;elevator starts moving down
	Platform.PlayAnimationAndWait("PressBoxDown", "done")
	;enable bottom navmesh
	CutNavmeshBottom.Disable()
	;extend platform bridge
	PlatformDoor.PlayAnimationAndWait("Play01", "done")
	ElevatorAtTop = FALSE
	DmndMayorElevatorUp.SetValueInt(0)
	GoToState("WaitingForActivation")
EndFunction

Function MoveElevatorUp()
	utility.wait(0.25)
	;retract platform bridge
	PlatformDoor.PlayAnimation("Play01")
	;cut navmesh
	CutNavmeshBottom.Enable()
	utility.wait(0.5)
	;elevator goes up
	Platform.PlayAnimationAndWait("PressBoxUp", "done")
	;elevator arms retract
	Platform.PlayAnimation("Retract")
	utility.wait(0.5)	
	;enable navmesh
	CutNavmeshUpper.Disable()
	;extend platform bridge
	PlatformDoor.PlayAnimationAndWait("Play01", "done")
	ElevatorAtTop = TRUE
	DmndMayorElevatorUp.SetValueInt(1)
	GoToState("WaitingForActivation")
EndFunction

STATE DoNothing
	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
		;Do Nothing
	EndEvent
ENDSTATE

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	;Do Nothing
EndEvent