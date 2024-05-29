Scriptname DN136_ElevatorNewScript extends ObjectReference
{Controls the elevator for the Institute. There are two bottom floors the elevator can go to depending on outcome of MQ207}

Group Required_Properties
	ObjectReference Property myElevator Auto Mandatory Const
	ObjectReference Property CallButtonTop Auto Mandatory Const
	ObjectReference Property CallButtonBottom Auto Mandatory Const
	ObjectReference Property CallButtonConcourse Auto Mandatory Const
	ObjectReference Property OuterDoorTop Auto Mandatory Const
	ObjectReference Property OuterDoorBottom Auto Mandatory Const
	ObjectReference Property OuterDoorConcourse Auto Mandatory Const
	ObjectReference Property ElevatorPanel Auto Mandatory Const
	ObjectReference Property TopTrigger Auto Mandatory Const
	ObjectReference Property BottomTrigger Auto Mandatory Const
	ObjectReference Property DN136_ElevatorTrigger Auto Mandatory Const
EndGroup

Group No_Touchy CollapsedOnRef
	Quest Property MQ207 Auto Mandatory Const
	{MQ207}

	Quest Property DN136_Attack Auto Mandatory Const
	{DN136_Attack}

	Quest Property InstKickOut Auto Mandatory Const
	{InstKickOut}

	Quest Property MQ302 Auto Mandatory Const
	{MQ302}

	Quest Property MQ302RR Auto Mandatory Const
	{MQ302RR}

	Message Property DeactivatedMessage Auto Mandatory Const
	{Used as a safety messure in case player tries to activate one of the "non-functioning" bottom elevator buttons}

	Message Property BusyMessage Auto Mandatory Const
	{Displayed whenever a button is pressed while the elevator is busy}

	Message Property BrokenMessage Auto Mandatory Const
	{Displayed whenever a button is pressed and the button is broken}

	Sound Property ElevatorSoundLoop Auto Mandatory Const
	{Looping sound for when elevator is moving}

	GlobalVariable Property PlayerAtTop Auto Mandatory
	{Global value if player is at the top of the elevator or not}
EndGroup

InputEnableLayer myLayer

Bool bStartAtTop = TRUE Const ;If TRUE(DEFAULT) then this elevator is starting at the top.
Bool bElevatorIsMoving = FALSE
Bool bElevatorIsAtTop = FALSE
Bool bElevatorIsAtBottom = FALSE
Bool bHasAlreadyLoaded = FALSE
Bool bBeingActivated = FALSE
Bool bElevatorUsedForAttack = FALSE
Bool bElevatorMovingForRR = FALSE

Int ElevatorSoundID
Int myStageAccept = 150 Const ;Player has accepted the Institute
Int myStageLeave = 180 Const ;Player is given objective to leave Institute
Int myStageAttack = 5 Const ;The Player is attacking the Institute (Minutemen and Railroad)
Int myStageAttack2 = 10 Const ;The Player is attacking the Institute
Int myStageAttack3 = 435 Const ;The Player is attacking the Institute and has gone down to the bottom level
Int myStageAttack4 = 425 Const ;The Player is attacking the Institute and the Concourse has been cleared
Int myStageAttackRR01 = 326 Const ;The Player is attacking the Institute with the RR and has hit one of the scientist in the relay room
Int myStageAttackRR02 = 400 Const ;The Player is attacking the Institute with the RR and has the objective to reach reactor

;elevator graph variables for when calling elevator
Float fLevelOneSpeedFast = 5.0 Const
Float fLevelFiveSpeedFast = 5.0 Const
Float fFirstDescentSpeedFast = 5.0 Const

;elevator graph variables for when riding in elevator
Float fLevelOneSpeedSlow = 10.0 Const
Float fLevelFiveSpeedSlow = 30.0 Const
Float fFirstDescentSpeedSlow = 60.0 Const

;********************************************************************************

STATE AlreadyLoaded
	Event OnLoad()
		if (MQ302.getStageDone(10) == TRUE) && (DN136_Attack.getStageDone(myStageAttack4) == FALSE)
			;move elevator to top and open the door
			myElevator.SetAnimationVariableFloat("fLevelFiveSpeed",fLevelFiveSpeedFast)
		    myElevator.playAnimationAndWait("Level05", "done")
		    HandleElevatorDoor(OuterDoorTop, 1, 0)
		    bElevatorIsAtTop = TRUE
		endif
	EndEvent
ENDSTATE

;********************************************************************************

Event OnLoad()
	GoToState("AlreadyLoaded")

	RegisterForRemoteEvent(ElevatorPanel, "OnActivate")
	RegisterForRemoteEvent(CallButtonTop, "OnActivate")
	RegisterForRemoteEvent(CallButtonBottom, "OnActivate")
	RegisterForRemoteEvent(CallButtonConcourse, "OnActivate")
	RegisterForRemoteEvent(TopTrigger, "OnActivate")
	RegisterForRemoteEvent(BottomTrigger, "OnActivate")
	RegisterForRemoteEvent(DN136_ElevatorTrigger, "OnActivate")

	if !bHasAlreadyLoaded
	    if bStartAtTop
	    	myElevator.SetAnimationVariableFloat("fLevelFiveSpeed",fLevelFiveSpeedFast)
	    	myElevator.playAnimationAndWait("Level05", "done")
	    	HandleElevatorDoor(OuterDoorTop, 0, 0)
	    	bElevatorIsAtTop = TRUE
	    else
	    	myElevator.SetAnimationVariableFloat("fLevelFiveSpeed", fLevelFiveSpeedSlow)
	    	myElevator.playAnimationAndWait("FirstDescent", "done")
	    	bElevatorIsAtTop = FALSE
	    endif
	    bHasAlreadyLoaded = TRUE
	endif
EndEvent

;********************************************************************************

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if bElevatorIsMoving == TRUE
		BusyMessage.Show()
	else
		if bBeingActivated == FALSE
			bBeingActivated = TRUE
			if(akSender == DN136_ElevatorTrigger)
				;player is attacking Institute and has cleared the concourse, need to move elevator to concourse level
				if(bElevatorIsAtBottom == FALSE) && (bElevatorIsAtTop == FALSE)
					;DN136_AttackTrigger activated, and elevator is at concourse level. Open door.
					utility.Wait(0.5)
					HandleElevatorDoor(OuterDoorConcourse, 1, 0)
					bBeingActivated = FALSE
				else
					;DN136_AttackTrigger activated, and elevator is not at concourse level. Close doors and move elevator.
					SetElevatorVars(TRUE) ;player waiting for elevator, so speed it up
					HandleElevatorDoor(OuterDoorTop, 0, 0)
					HandleElevatorDoor(OuterDoorConcourse, 0, 0)
					HandleElevatorDoor(OuterDoorBottom, 0, 0)

					utility.Wait(0.5)
					MoveElevator(DN136_ElevatorTrigger)
				endif
			elseif (MQ207.getStageDone(myStageAccept) == FALSE) && (MQ207.getStageDone(myStageLeave) == FALSE) && (InstKickOut.IsRunning() == FALSE) && (akSender != TopTrigger) && (akSender != BottomTrigger) && (DN136_Attack.getStageDone(myStageAttack) == FALSE) && (DN136_Attack.getStageDone(myStageAttack2) == FALSE)
				;the player hasn't acccepted the invitation, so tell the player they don't have access to the elevator
				;and player hasn't gotten objective to leave Institute
				;and Institute Kick Out Quest is not running
				;and the top or bottom trigger is not the activator
				;and the attack on the Institute isn't in progress
				;so tell the player they don't have access to the elevator
				DeactivatedMessage.Show()
				bBeingActivated = FALSE
				
			elseif ((DN136_Attack.getStageDone(myStageAttack) == TRUE) || (DN136_Attack.getStageDone(myStageAttack2) == TRUE)) && (PlayerAtTop.GetValue() == 1)
				;player is attacking Institute and still at top of elevator
				DeactivatedMessage.Show()
				bBeingActivated = FALSE

			elseif akSender == ElevatorPanel
				;Panel activated
				if (MQ302.getStageDone(myStageAttack3) == TRUE)
					;player has already used the elevator during the attack and is in the lower level
					BrokenMessage.Show()
					bBeingActivated = FALSE
				else
					;ElevatorPanel.PlayAnimation("play01")
					
					;close all three outer doors
					;if this is during the attack we need to disable player controls
					if (((DN136_Attack.getStageDone(myStageAttack) == TRUE) || (DN136_Attack.getStageDone(myStageAttack2) == TRUE)) && ((MQ302.getStageDone(myStageAttack3) == FALSE) && (MQ302.getStageDone(myStageAttack4) == TRUE)))
						;don't think we need to disable player controls, so setting to 0 for now
						HandleElevatorDoor(OuterDoorTop, 0, 0)
						HandleElevatorDoor(OuterDoorConcourse, 0, 0)
						HandleElevatorDoor(OuterDoorBottom, 0, 0)
					else
						;if we're activated from Elevator Panel and it's not during the attack, then we don't care about players getting out before doors closes, so no need to disable player controls
						HandleElevatorDoor(OuterDoorTop, 0, 0)
						HandleElevatorDoor(OuterDoorConcourse, 0, 0)
						HandleElevatorDoor(OuterDoorBottom, 0, 0)
					endif

					;we're in the elevator so move at the regular speed
					SetElevatorVars(FALSE) 

					utility.Wait(0.5)
					MoveElevator(ElevatorPanel)
				endif

			elseif akSender == CallButtonTop
				if (DN136_Attack.getStageDone(myStageAttack) == TRUE) || (DN136_Attack.getStageDone(myStageAttack2) == TRUE)
					;player is attacking the Institute
					BrokenMessage.Show()
					bBeingActivated = FALSE
				else
					;CallButtonTop.PlayAnimation("play01")
					if bElevatorIsAtTop == TRUE
						;Top call button activated, and elevator at top. Open doors.
						utility.Wait(0.5)
						;CallButtonTop.PlayAnimation("play01")
						HandleElevatorDoor(OuterDoorTop, 1, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))

						bBeingActivated = FALSE
					else
						;Top call button activated, and elevator at bottom. Close doors and move elevator.
						SetElevatorVars(TRUE) ;player waiting for elevator, so speed it up
						HandleElevatorDoor(OuterDoorTop, 0, 0)
						HandleElevatorDoor(OuterDoorConcourse, 0, 0)
						HandleElevatorDoor(OuterDoorBottom, 0, 0)
						utility.Wait(0.5)
						MoveElevator(CallButtonTop)
						;CallButtonTop.PlayAnimation("play01")
					endif
				endif

			elseif akSender == CallButtonBottom
				if ((DN136_Attack.getStageDone(myStageAttack) == TRUE) || (DN136_Attack.getStageDone(myStageAttack2) == TRUE))
					;player is attacking the Institute
					BrokenMessage.Show()
					bBeingActivated = FALSE
				else
					if bElevatorIsAtBottom == TRUE
						;Bottom call button activated, and elevator at bottom. Open door.
						utility.Wait(0.5)
						HandleElevatorDoor(OuterDoorBottom, 1, 0)	
						bBeingActivated = FALSE
					else
						;Bottom call button activated, and elevator is not at bottom. Close doors and move elevator.
						SetElevatorVars(TRUE) ;player waiting for elevator, so speed it up
						HandleElevatorDoor(OuterDoorTop, 0, 0)
						HandleElevatorDoor(OuterDoorConcourse, 0, 0)
						HandleElevatorDoor(OuterDoorBottom, 0, 0)

						utility.Wait(0.5)
						MoveElevator(CallButtonBottom)
					endif
				endif
			elseif (akSender == CallButtonConcourse)
				if(akSender == CallButtonConcourse) && ((DN136_Attack.getStageDone(myStageAttack) == TRUE) || (DN136_Attack.getStageDone(myStageAttack2) == TRUE))
					;player is attacking the Institute
					if(MQ302.getStageDone(myStageAttack3) == TRUE)
						;player has already made it down to the bottom level
						BrokenMessage.Show()
						bBeingActivated = FALSE
					else
						if(MQ302.getStageDone(myStageAttack4) == FALSE)
							;player hasn't made it to the bottom and also has not cleared the concourse
							BrokenMessage.Show()
							bBeingActivated = FALSE
						else
							;make the elevator only go to the concourse
							if(bElevatorIsAtBottom == FALSE) && (bElevatorIsAtTop == FALSE)
								;Concourse button is activated, and elevator is at concourse level. Open door.
								utility.Wait(0.5)
								HandleElevatorDoor(OuterDoorConcourse, 1, 0)
								bBeingActivated = FALSE
							else
								;Concourse call button activated, and elevator is not at concourse level. Close doors and move elevator.
								SetElevatorVars(TRUE) ;player waiting for elevator, so speed it up
								HandleElevatorDoor(OuterDoorTop, 0, 0)
								HandleElevatorDoor(OuterDoorConcourse, 0, 0)
								HandleElevatorDoor(OuterDoorBottom, 0, 0)

								utility.Wait(0.5)
								MoveElevator(CallButtonConcourse)
							endif
						endif
					endif
				else
					;player is not attacking the Institute
					if(bElevatorIsAtTop == FALSE) && (bElevatorIsAtBottom == FALSE)
						;Concourse button is activated, and elevator is at concourse level. Open door.
						utility.Wait(0.5)
						HandleElevatorDoor(OuterDoorConcourse, 1, 0)
						bBeingActivated = FALSE
					else
						;Concourse call button activated, and elevator is not at concourse level. Close doors and move elevator.
						SetElevatorVars(TRUE) ;player waiting for elevator, so speed it up
						HandleElevatorDoor(OuterDoorTop, 0, 0)
						HandleElevatorDoor(OuterDoorConcourse, 0, 0)
						HandleElevatorDoor(OuterDoorBottom, 0, 0)

						utility.Wait(0.5)
						MoveElevator(CallButtonConcourse)
					endif
				endif
			elseif (akSender == TopTrigger)
				;means player has entered the Institute for the first time
				;close all three outer doors
				;we do care about players trying to jump out before door closes, so disable player controls
				myLayer = InputEnableLayer.Create()
				myLayer.DisablePlayerControls()
				HandleElevatorDoor(OuterDoorTop, 0, 1)
				HandleElevatorDoor(OuterDoorConcourse, 0, 1)
				HandleElevatorDoor(OuterDoorBottom, 0, 1)
				Utility.wait(2.0)
				myLayer.EnablePlayerControls()
				myLayer = none

				;we're in the elevator so move at the regular speed
				SetElevatorVars(FALSE) 

				utility.Wait(0.5)
				MoveElevator(TopTrigger)
			elseif (akSender == BottomTrigger)
				;means player declined invitation and is heading out
				;close all three outer doors
				;we do care about players trying to jump out before door closes, so disable player controls
				myLayer = InputEnableLayer.Create()
				myLayer.DisablePlayerControls()
				HandleElevatorDoor(OuterDoorTop, 0, 1)
				HandleElevatorDoor(OuterDoorConcourse, 0, 1)
				HandleElevatorDoor(OuterDoorBottom, 0, 1)
				Utility.wait(2.0)
				myLayer.EnablePlayerControls()
				myLayer = none

				;we're in the elevator so move at the regular speed
				SetElevatorVars(FALSE) 

				utility.Wait(0.5)
				MoveElevator(BottomTrigger)
			endif
		endif
	endif
EndEvent

;********************************************************************************

Function HandleElevatorDoor(ObjectReference akDoor, Bool bOpen, Bool bDisableControls)
	if bOpen == TRUE
		;...and the door is closed...
		if akDoor.GetOpenState() >= 3
				; ...then open the door.
			akDoor.SetOpen()
		else
			; ...don't open the door, it's already opened.
		endif
	else
		; If we are supposed to close this door...
		if akDoor.GetOpenState() <= 2
			; ...and the door is open...
			;myLayer = InputEnableLayer.Create()
			if bDisableControls == TRUE
			;	myLayer.DisablePlayerControls()
			endif
			while(akDoor.GetOpenState() == 2)
				;can't close the door if it's still animating opening
				utility.Wait(0.5)
			endWhile
			akDoor.SetOpen(FALSE)
			;Utility.Wait(2.0)
			if bDisableControls == TRUE
			;	myLayer.EnablePlayerControls()
			endif
		else
			; ...don't close the door, it's already closed.
		endif
	endif
EndFunction

;********************************************************************************

Function MoveElevator(ObjectReference myCallButton)
	;Function for moving the elevator

	bElevatorIsMoving = TRUE
	ElevatorSoundID = ElevatorSoundLoop.play(ElevatorPanel)  
	Sound.SetInstanceVolume(ElevatorSoundID, 1)
	if(myCallButton == DN136_ElevatorTrigger)
		;player is attacking Institute and has cleared the concourse, need to move elevator to concourse level
		bElevatorIsAtTop = FALSE
		bElevatorIsAtBottom = FALSE
		myElevator.playAnimationAndWait("Level01", "done")
	elseif(myCallButton == ElevatorPanel) && ((DN136_Attack.getStageDone(myStageAttack) == TRUE) || (DN136_Attack.getStageDone(myStageAttack2) == TRUE))
		;player is in the elevator during the attack, need to move the elevator down to bottom level
		bElevatorIsAtTop = FALSE
		bElevatorIsAtBottom = TRUE
		myElevator.playAnimationAndWait("FirstDescent", "done")
	elseif(myCallButton == CallButtonTop) || (myCallButton == BottomTrigger) || (myCallButton == ElevatorPanel && bElevatorIsAtTop == FALSE)
		;player is at the top and waiting for elevator, or player is in elevator heading out after declining invitation, or player is in elevator and not at the top
		bElevatorIsAtTop = TRUE
		bElevatorIsAtBottom = FALSE
		myElevator.playAnimationAndWait("Level05", "done")
	elseif(myCallButton == CallButtonConcourse) || (myCallButton == ElevatorPanel && bElevatorIsAtTop == TRUE)
		;player is at the concourse and waiting for elevator, or player is in elevator and is part of Institute (because the elevator panel was the activator and is at the top)
		bElevatorIsAtTop = FALSE
		if((MQ207.getStageDone(myStageLeave) == TRUE) || (InstKickOut.IsRunning() == TRUE)) && (DN136_Attack.getStageDone(myStageAttack2) == FALSE)
			if(myCallButton == CallButtonConcourse)
				;player is at concourse level and needs to get out of Institute
				bElevatorIsAtBottom = FALSE
				myElevator.playAnimationAndWait("Level01", "done")
			else
				;Player is at top and player has current objective to leave Institute and it's not during the attack, so go to bottom level instead of concourse
				bElevatorIsAtBottom = TRUE
				myElevator.playAnimationAndWait("FirstDescent", "done")
			endif
		else
			bElevatorIsAtBottom = FALSE
			myElevator.playAnimationAndWait("Level01", "done")
		endif
	elseif(myCallButton == CallButtonBottom || myCallButton == TopTrigger)
		;player is at bottom waiting for elevator, or player is in elevator for the first time
		bElevatorIsAtTop = FALSE
		bElevatorIsAtBottom = TRUE
		myElevator.playAnimationAndWait("FirstDescent", "done")
	endif

	Sound.StopInstance(ElevatorSoundID)

	utility.Wait(0.5)

	;the elevator is done moving, so now open correct door 
	if bElevatorIsAtTop == TRUE
		HandleElevatorDoor(OuterDoorTop, 1, 0)
		HandleElevatorDoor(OuterDoorBottom, 0, 0) ;make sure bottom door is closed
		HandleElevatorDoor(OuterDoorConcourse, 0, 0) ;make sure other bottom door is closed
	else
		if bElevatorIsAtBottom == FALSE
			;need to handle edge case of someone throwing a grenade in the relay room and then quickly using elevator
			if(MQ302RR.getStageDone(myStageAttackRR01) == TRUE && MQ302RR.getStageDone(myStageAttackRR02) == FALSE)
				;need to move elevator back up
				bElevatorMovingForRR = TRUE
			else
				;elevator is at concourse level
				HandleElevatorDoor(OuterDoorConcourse, 1, 0)
				HandleElevatorDoor(OuterDoorBottom, 0, 0) ;make sure other bottom door is closed
				HandleElevatorDoor(OuterDoorTop, 0, 0) ;make sure top door is closed
			endif
		else
			;need to handle edge case of someone throwing a grenade in the relay room and then quickly using elevator
			if(MQ302RR.getStageDone(myStageAttackRR01) == TRUE && MQ302RR.getStageDone(myStageAttackRR02) == FALSE)
				;need to move elevator back up
				bElevatorMovingForRR = TRUE
			else
				;elevator is at bottom level
				HandleElevatorDoor(OuterDoorBottom, 1, 0)
				HandleElevatorDoor(OuterDoorConcourse, 0, 0) ;make sure other bottom door is closed
				HandleElevatorDoor(OuterDoorTop, 0, 0) ;make sure top door is closed
			endif
		endif
	endif

	utility.Wait(utility.RandomFloat(0.1, 0.3))

	utility.Wait(1.2)
	bBeingActivated = FALSE
	bElevatorIsMoving = FALSE
	;check edge case for player throwing a grenade and then using elevator during RR
	if(bElevatorMovingForRR == TRUE)
		bElevatorMovingForRR = FALSE
		bElevatorIsMoving = TRUE
		ElevatorSoundID = ElevatorSoundLoop.play(ElevatorPanel)  
		Sound.SetInstanceVolume(ElevatorSoundID, 1)
		bElevatorIsAtTop = TRUE
		bElevatorIsAtBottom = FALSE
		myElevator.playAnimationAndWait("Level05", "done")
		Sound.StopInstance(ElevatorSoundID)
		utility.Wait(0.5)
		HandleElevatorDoor(OuterDoorTop, 1, 0)
		HandleElevatorDoor(OuterDoorBottom, 0, 0) ;make sure bottom door is closed
		HandleElevatorDoor(OuterDoorConcourse, 0, 0) ;make sure other bottom door is closed
		utility.Wait(utility.RandomFloat(0.1, 0.3))
		utility.Wait(1.2)
		bBeingActivated = FALSE
		bElevatorIsMoving = FALSE
	endif	
	GoToState("")
EndFunction

;********************************************************************************

Function SetElevatorVars(bool bCallElevator)
	if(bCallElevator)
		;means we're calling the elevator, so speed it up
		myElevator.SetAnimationVariableFloat("fLevelOneSpeed", fLevelOneSpeedFast)
		myElevator.SetAnimationVariableFloat("fLevelFiveSpeed", fLevelFiveSpeedFast)
		myElevator.SetAnimationVariableFloat("fFirstDescentSpeed", fFirstDescentSpeedFast)
	else
		;means we're in elevator, so slow it down
		myElevator.SetAnimationVariableFloat("fLevelOneSpeed", fLevelOneSpeedSlow)
		myElevator.SetAnimationVariableFloat("fLevelFiveSpeed", fLevelFiveSpeedSlow)
		if(MQ302.getStageDone(myStageAttack3) == FALSE) && (MQ302.getStageDone(myStageAttack4) == TRUE)
			;need to speed up the descent
			myElevator.SetAnimationVariableFloat("fFirstDescentSpeed", fFirstDescentSpeedFast)
		else
			myElevator.SetAnimationVariableFloat("fFirstDescentSpeed", fFirstDescentSpeedSlow)
		endif
	endif
endFunction

;********************************************************************************