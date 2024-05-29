Scriptname DN009_FireWeapScript extends ObjectReference Hidden
{Fires a weapon or explosion and also activates its linked ref if it has one}

Ammo Property myAmmo Auto Mandatory Const
Weapon Property myWeapon Auto Mandatory Const
Explosion Property myExplosion Auto Mandatory Const
Bool Property SmallBattle = TRUE Auto Const
{Default = true, if big battle set to False}
Int Property SmallBattleTimer = 5 Auto Const
Int Property LargeBattleTimer = 15 Auto Const
Bool Property useExplosion = FALSE Auto Const
{Default = false, mark True if you want random explosions}
Bool Property useMissile = FALSE Auto Const
{Deafult = false, mark True if you are shooting missiles}
Sound Property myWeaponSound Auto Mandatory Const

ObjectReference LinkedRef
int myTimer ;how long
int myTimerID = 1 ;ID number for timer
Bool TimerActive = FALSE
Float myRandom

;**********************************************************

Event OnInit()
    LinkedRef = GetLinkedRef()
    if(SmallBattle == TRUE)
    	myTimer = SmallBattleTimer
    else
    	myTimer = LargeBattleTimer
    endif
EndEvent

;**********************************************************

Event OnTimer(int aiTimerID)
   	if (aiTimerID == myTimerID)
   		TimerActive = FALSE
	endif
EndEvent

;**********************************************************
Event OnActivate(ObjectReference akActionRef)
	if(TimerActive == FALSE && self.isDisabled() == FALSE)
		if(LinkedRef != none)
			;if there's a linked ref, then activate it
			LinkedRef.activate(self)
		endif
		TimerActive = TRUE
		StartTimer(myTimer, myTimerID)
		While(TimerActive == TRUE && self.isDisabled() == FALSE)
			myWeaponSound.play(self)
			myWeapon.Fire(self, myAmmo)
			if(useMissile == TRUE)
				myRandom = utility.RandomFloat(4.0, 5.0)
			else
				myRandom = utility.RandomFloat(0.1, 1.0)
			endif
			Utility.wait(myRandom)
			if(useExplosion == TRUE)
				myRandom = Utility.RandomFloat(0.0, 1.0)
				if(myRandom >= 0.75)
					placeAtMe(myExplosion, 1)
				endif
			endif
		endWhile
	endif
EndEvent

;**********************************************************