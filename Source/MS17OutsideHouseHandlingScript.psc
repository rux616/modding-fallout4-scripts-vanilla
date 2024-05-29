Scriptname MS17OutsideHouseHandlingScript extends ObjectReference Conditional

Faction Property ownerFaction Auto Conditional
ObjectReference[] Property DoorREFs Auto
Int Property PennyShop Auto Conditional

float OpeningTime = 0.2917   ; Around 7am 
float ClosingTime = 0.8333   ; Around 8pm


Event OnTriggerEnter(ObjectReference akActionRef)
	if ( (akActionRef as Actor).IsInFaction(ownerFaction) == TRUE )
		Debug.Trace(akActionRef + " has entered the Covenant House trigger")

		if ( PennyShop == 0 )
			StartTimerGameTime(0.03, 17)
		else
			float myTime = Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime())
			Debug.Trace(myTime)

			; If it's in the window of time the office/shop should be closed
			if ( myTime > ClosingTime || myTime < OpeningTime )   
				StartTimerGameTime(0.03, 17)   ; If so, start the close door timer
			else
				DoorREFs[0].SetFactionOwner(NONE)  ; Otherwise it's no crime to use the door
			endif
		endif
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if ( (akActionRef as Actor).IsInFaction(ownerFaction) == TRUE )
		Debug.Trace(akActionRef + " has left the Covenant House trigger")

		if ( PennyShop == 0 )
			StartTimerGameTime(0.03, 17)
		else
			float myTime = Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime())
			Debug.Trace(myTime)

			; If it's in the window of time the office/shop should be closed
			if ( myTime > ClosingTime || myTime < OpeningTime )   
				StartTimerGameTime(0.03, 17)  ; If so, start the close door timer
			else
				DoorREFs[0].SetFactionOwner(NONE)  ; Otherwise it's no crime to use the door
			endif
		endif
	EndIf
EndEvent

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, shut the doors
	;debug.messagebox("OnTimer fired")
	if iTimer == 17
		int i = 0
		while (i < DoorREFs.Length )
			ObjectReference SpecificDoorREF = DoorREFs[i]
			; PCOpened = has the never opened the door
			if SpecificDoorREF && (SpecificDoorREF as MS17DoorLockOnLoadScript).bPCOpened == 0
				SpecificDoorREF.SetOpen(false)
				SpecificDoorREF.Lock()

				if ( PennyShop != 0 )    ; And if it's not the generic door, make it a crime to open/pick it
					SpecificDoorREF.SetFactionOwner(ownerFaction)
				endif
			endif
			i += 1
		endwhile		
	endif

EndEvent


