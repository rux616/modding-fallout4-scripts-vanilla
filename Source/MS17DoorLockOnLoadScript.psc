Scriptname MS17DoorLockOnLoadScript extends ObjectReference

Event OnLoad()

	float gameHour = (Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime()))*24
    
	if ( bClosedAndLockedAtNight == 0 )
		SetOpen(False)
		Lock()
	elseif ( bClosedAndLockedAtNight == 1 && (gameHour < 7 || gameHour > 21) )
		SetOpen(False)
		Lock()
		SetFactionOwner(pCovenantFaction)
	endif
EndEvent

Event OnOpen (ObjectReference akActionRef)
	if ( akActionRef == Game.GetPlayer() )
		if bClosedAndLockedAtNight == 1		; If it's closed and locked at night need some special handling
			float gameHour = (Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime()))*24
			if (gameHour < 7 || gameHour > 21)
				bPCOpened = 1
			endif
		else
			bPCOpened = 1
		endif
	endif

EndEvent

Int Property bPCOpened Auto

Int Property bClosedAndLockedAtNight Auto

Faction Property pCovenantFaction Auto Const
