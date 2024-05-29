Scriptname DialogueCovenantScript extends Quest Conditional

Scene Property pDialogueCovenant_CloseShop Auto Const
Scene Property pDialogueCovenant_CloseOffice Auto Const

Location Property pCovenantLocation Auto Const

ReferenceAlias Property Alias_Penny Auto Const
ReferenceAlias Property Alias_Jacob Auto Const

ObjectReference Property pMS17OfficeDoor Auto Const
ObjectReference Property pMS17ShopDoor Auto Const

Int Property PennySpooked Auto Conditional
Int Property TaliaSpooked Auto Conditional
Int Property InsideShop01 Auto Conditional
Int Property InsideShop02 Auto Conditional
Int Property InsideOffice01 Auto Conditional
Int Property InsideOffice02 Auto Conditional

float OpeningTime = 0.2917   ; Around 7am 
float ClosingTime = 0.8333   ; Around 8pm

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()

		if ( akNewLoc == pCovenantLocation )    ; Entered Covenant
			StartTimerGameTime(0.1, 17)

			; Check the time
			float myTime = Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime())
			Debug.Trace("DialogueCovenantScript - myTime = " + myTime)
			if ( myTime > ClosingTime || myTime < OpeningTime )   ; Should the Office and Shop be closed?
				MS17HandleDoors(TRUE)    ; If so lock up
			else
				MS17HandleDoors(FALSE)   ; Otherwise open and unlock the door
			endif
		endif

		if ( akOldLoc == pCovenantLocation )    ; Leaving Covenant
			CancelTimer(17)
		endif

	endif
EndEvent

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, shut the doors
	;debug.messagebox("OnTimer fired")
	if iTimer == 17
			float myTime = Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime())
			Debug.Trace("Covenant Time: " + myTime)
			if ( myTime > ClosingTime && myTime < 0.896 )   ; Around 9pm is when Penny will shut and lock her door
				if ( !Alias_Penny.GetActorREF().IsInScene() )   ; If Penny isn't in a scene play here closing scene
				  pDialogueCovenant_CloseShop.Start()
				endif

				if ( !Alias_Jacob.GetActorREF().IsInScene() )   ; If Penny isn't in a scene play here closing scene
				  pDialogueCovenant_CloseOffice.Start()
				endif
			endif		
			StartTimerGameTime(0.03, 17)
	endif

EndEvent

function MS17HandleDoors(bool bCloseShop = true)

	ObjectReference oDoor

	if ( bCloseShop )
		oDoor = pMS17OfficeDoor
		oDoor.SetOpen(FALSE)
		oDoor.Lock(TRUE)

		oDoor = pMS17ShopDoor
		oDoor.SetOpen(FALSE)
		oDoor.Lock(TRUE)
	else
		oDoor = pMS17OfficeDoor
		oDoor.SetOpen(TRUE)
		oDoor.Lock(FALSE)

		oDoor = pMS17ShopDoor
		oDoor.SetOpen(TRUE)
		oDoor.Lock(FALSE)
	endif

endfunction


