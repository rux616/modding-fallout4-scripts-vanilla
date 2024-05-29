Scriptname REChokepointCC01_WeaponOutCheck extends Quest

int WeaponOutTimerID = 654321
float WeaponOutTimerLength = 3.0

Function StartUp()
	debug.trace(self + "starting WeaponOutTimer")
	StartTimer(WeaponOutTimerLength, WeaponOutTimerID)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == WeaponOutTimerID
		debug.trace(self + "Is Weapon Drawn?")
		;check if the player has a weapon drawn
		if Game.GetPlayer().IsWeaponDrawn()
			debug.trace(self + "Weapon is out!")
			;check conditioned packages on all aliases to go aggro
			SetStage(11)
		endif
		;start the loop again, timer is killed when quest ends
		StartTimer(WeaponOutTimerLength, WeaponOutTimerID)
	endif
EndEvent