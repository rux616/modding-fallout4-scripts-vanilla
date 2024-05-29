Scriptname PowerLiftMiniCartScript extends ObjectReference Hidden

Group Required_Properties
	Int Property TopLevel Auto
	{1-17, must be LOWER than what BottomLevel is set to.}
	Int Property BottomLevel Auto
	{1-17, must be HIGHER than what TopLevel is set to.}
EndGroup

Group Optional_Properties
	Bool Property StartAtTop = False Auto
	{Whether the Cart starts at the top or not.}

	Float Property TopLevelOverride = -1.0 Auto
	{Only use this if you know the exact perecentage/float value you want the top level to stop at.  Must be higher than Bottom Level.}

	Float Property BottomLevelOverride = -1.0 Auto
	{Only use this if you know the exact perecentage/float value you want the top level to stop at.  Must be lower than Top Level.}

	Float Property SpeedOverride = -1.0 Auto
	{Must use this if you set the Overrides above.  This is the seconds it takes for the lift to move from one point to the other. Normal speed is roughly a smidge over a second per level.}
EndGroup

Group No_Touchy CollapsedOnRef
	Keyword Property LinkCustom01 Auto
	Keyword Property LinkCustom02 Auto
	Keyword Property LinkCustom03 Auto
	Keyword Property LinkCustom04 Auto
EndGroup


Event OnLoad()
	ObjectReference Cart = GetLinkedRef()
	ObjectReference CartButton = GetLinkedRef(LinkCustom01)
	ObjectReference TopButton = GetLinkedRef(LinkCustom02)
	ObjectReference BottomButton = GetLinkedRef(LinkCustom03)

		; Put the cart at it's starting point.
	if StartAtTop
		if TopLevelOverride != -1.0
    		Cart.SetAnimationVariableFloat("fvalue", TopLevelOverride)
		else
    		Cart.SetAnimationVariableFloat("fvalue", GetLevelFloat(TopLevel))
    	endif
    else
    	if BottomLevelOverride != -1.0
    		Cart.SetAnimationVariableFloat("fvalue", BottomLevelOverride)
		else
    		Cart.SetAnimationVariableFloat("fvalue", GetLevelFloat(BottomLevel))
    	endif
    endif
    Cart.SetAnimationVariableFloat("fspeed", 0)
    Cart.PlayAnimation("Play01")

    RegisterForRemoteEvent(CartButton, "OnActivate")
    RegisterForRemoteEvent(TopButton, "OnActivate")
    RegisterForRemoteEvent(BottomButton, "OnActivate")
EndEvent


auto STATE WaitingForActivation
	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
		GoToState("Busy")
		;BlockButtonActivation(TRUE)

		ObjectReference CartButton = GetLinkedRef(LinkCustom01)
		ObjectReference TopButton = GetLinkedRef(LinkCustom02)
		ObjectReference BottomButton = GetLinkedRef(LinkCustom03)

			; No matter which button is pressed, moved the cart
		if akSender == CartButton || akSender == TopButton || akSender == BottomButton
			MoveCart()
		endif

		GoToState("WaitingForActivation")

	EndEvent
EndSTATE


STATE Busy
	Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	; Do Nothing
	EndEvent
EndSTATE

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	; Because I have to
EndEvent


Function BlockButtonActivation(Bool bShouldBlock = TRUE)
	ObjectReference CartButton = GetLinkedRef(LinkCustom01)
	ObjectReference TopButton = GetLinkedRef(LinkCustom02)
	ObjectReference BottomButton = GetLinkedRef(LinkCustom03)

		; Block, or don't, the use of the buttons.
	if bShouldBlock
		CartButton.BlockActivation(TRUE, TRUE)
		TopButton.BlockActivation(TRUE, TRUE)
		BottomButton.BlockActivation(TRUE, TRUE)
	else
		CartButton.BlockActivation(FALSE, FALSE)
		TopButton.BlockActivation(FALSE, FALSE)
		BottomButton.BlockActivation(FALSE, FALSE)
	endif
EndFunction


Function MoveCart()
	ObjectReference Cart = GetLinkedRef()

	ShakeItUp()

		; Set the carts next stopping point to the opposite of the one it's currently at.
	if Cart.GetAnimationVariableFloat("fvalue") == GetLevelFloat(TopLevel) && TopLevelOverride == -1.0
		Cart.SetAnimationVariableFloat("fvalue", GetLevelFloat(BottomLevel))
	elseif Cart.GetAnimationVariableFloat("fvalue") == GetLevelFloat(BottomLevel) && BottomLevelOverride == -1.0
		Cart.SetAnimationVariableFloat("fvalue", GetLevelFloat(TopLevel))
	endif

		; If overrides are set then use those instead.
	if TopLevelOverride != -1.0 && BottomLevelOverride != -1.0
		if Cart.GetAnimationVariableFloat("fvalue") == TopLevelOverride
			Cart.SetAnimationVariableFloat("fvalue", BottomLevelOverride)
		elseif Cart.GetAnimationVariableFloat("fvalue") == BottomLevelOverride
			Cart.SetAnimationVariableFloat("fvalue", TopLevelOverride)
		endif
	endif

	if SpeedOverride != -1.0
		Cart.SetAnimationVariableFloat("fspeed", SpeedOverride)
	else
		Cart.SetAnimationVariableFloat("fspeed", (BottomLevel - TopLevel) * 1.15)
	endif
	Cart.PlayAnimationAndWait("Play01", "Done")

	ShakeItUp()

	;BlockButtonActivation(FALSE)
EndFunction


Function ShakeItUp()
	ObjectReference ShakePoint = GetLinkedRef(LinkCustom04)

	if Game.GetPlayer().GetDistance(ShakePoint) < 256
		game.ShakeCamera(ShakePoint, 0.2, 0.5)
		game.ShakeController(0.1, 0.1, 0.5)
	endif
EndFunction


Float Function GetLevelFloat(int iLevel)
	if iLevel == 1
		return 0.0
	elseif iLevel == 2
		return 0.0625
	elseif iLevel == 3
		return 0.125
	elseif iLevel == 4
		return 0.1875
	elseif iLevel == 5
		return 0.25
	elseif iLevel == 6
		return 0.3125
	elseif iLevel == 7
		return 0.375
	elseif iLevel == 8
		return 0.4375
	elseif iLevel == 9
		return 0.5
	elseif iLevel == 10
		return 0.5625
	elseif iLevel == 11
		return 0.625
	elseif iLevel == 12
		return 0.6875
	elseif iLevel == 13
		return 0.75
	elseif iLevel == 14
		return 0.8125
	elseif iLevel == 15
		return 0.875
	elseif iLevel == 16
		return 0.9375
	elseif iLevel == 17
		return 1.0
	endif
EndFunction