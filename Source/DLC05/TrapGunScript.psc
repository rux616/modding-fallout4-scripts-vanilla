Scriptname DLC05:TrapGunScript extends TrapBase

;
;
;
;
import utility


;==================================================
;		Child Functions - Define in extended script
;==================================================

struct weaponData 
	Weapon weaponToFire
	Sound weaponSound
endStruct 

Group LocalProperties CollapsedOnRef
	weaponData[] property myWeapons auto const mandatory

	;Form property WorkshopTrapFlamethrowerDummy Auto Const

	Float Property firingTime = 1.0 Auto Const
	{ time between shots }

	int property firingCountMax = 20 auto const 
	{ how many times can this fire when triggered? }
EndGroup

int firingTimerID = 1 const ; for running firing timer
int firingCount = 0			; how many times have I fired?

;Unneeded here
Function ResolveLeveledDamage ()
EndFunction



;Put the local stuff in here
Function LocalFireTrap()
	debug.trace(self + "LocalFireTrap")
	
	firingCount = 0
	; start firing
	StartTimer(0.1, firingTimerID)
EndFunction

;Put local disarm needs here
Function LocalDisarmTrap()
	SetDestroyed()
EndFunction

;Put local disarm rewards here
Function LocalDisarmReward()
EndFunction

;Use if the child needs specific timer events
Function LocalOnTimer(int aiTimerID)
	if aiTimerID == firingTimerID
		firingCount += 1
		debug.trace(self + " Firing shot " + firingCount)
		WeaponData theWeapon = GetWeaponData()
		debug.trace(self + "   firing weapon " + theWeapon.weaponToFire)
		theWeapon.WeaponSound.Play(self)
		theWeapon.weaponToFire.Fire(self)

		if firingCount < firingCountMax
			StartTimer(firingTime, firingTimerID)
		else
			GoToState("Disarm")
		endif
	endif
endFunction

WeaponData function GetWeaponData()
	if myWeapons.Length == 1
		return myWeapons[0]
	else
		int randomRoll = RandomInt(0, myWeapons.Length-1)
		return myWeapons[randomRoll]
	endif
endFunction

Function RepairTrap()
	self.SetDestroyed(False)
	PlayAnimationAndWait("Repair", "TransitionComplete")
	GoToState("Idle")
EndFunction


Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
    CancelTimer(firingTimerID)
EndEvent