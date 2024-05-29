ScriptName TrapIED Extends TrapBase
;
;
;
;


;==================================================
;		Child Functions - Define in extended script
;==================================================

Explosion Property TrapIEDExplosion Auto
float property ExplosionWarnTimer = 0.5 auto hidden


;Unneeded here
Function ResolveLeveledDamage ()
EndFunction

;Put the local stuff in here
Function LocalFireTrap()
	PlayAnimation(FireTrapAnim)
	StartTimer(ExplosionWarnTimer, 200)
EndFunction

;Put local disarm needs here
Function LocalDisarmTrap()
EndFunction

;Put local disarm rewards here
Function LocalDisarmReward()
EndFunction

;Use if the child needs specific timer events
Function LocalOnTimer(int aiTimerID)
	if aiTimerID == 200
		DamageObject(50)
	endif
endFunction

;/
Function ResolveLeveledDamage () 	;placeholder function, declared in children

EndFunction

Function initialize() 	; Placeholder - replaced with trap specific function
endFunction

Function fireTrap() 		; Placeholder - replaced with trap specific function
	ResolveLeveledDamage()
	PlayAnimation("Alert")
	StartTimer(WarnTime, 100)
	;PlaceAtMe(TrapIEDExplosion)
endFunction



Event OnTimer(int aiTimerID)
	if aiTimerID == 100
		PlayAnimation("Trip")
		StartTimer(ExplosionWarnTimer, 200)
	elseif aiTimerID == 200
		DamageObject(50)
	endif
EndEvent
/;
;;;;;;;;;;;;;;;;;;;;;;;;;;;