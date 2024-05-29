ScriptName DefaultRefFireAmmo extends objectReference Default
{Default script that shoots on activate}

import game
import debug

int property myTimer = 5 auto
{default = 5 seconds, how long to shoot for}

Ammo property myAmmo auto

weapon property myWeapon auto

bool shooting = false


;************************************

Event OnTimer(int aiTimerID)		
  if aiTimerID >= myTimer ; The five second timer we started just expired
	  shooting = false
  endIf
EndEvent

;************************************

auto STATE Waiting
	Event onActivate(objectReference triggerRef)
		gotoState("Done")
  		;StartTimer(5, mytimer)
		;shooting = true
		;while (shooting)
		myWeapon.Fire(self, myAmmo)
		;endWhile
	endEvent
endSTATE

;************************************

STATE Done
	;do nothing
endSTATE

;************************************