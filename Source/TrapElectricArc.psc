ScriptName TrapElectricArc Extends TrapBase
;
;
;
;
import utility


;==================================================
;		Child Functions - Define in extended script
;==================================================

Group LocalProperties CollapsedOnRef
	;LaserMusketBeamLtBlue
	Spell property TrapElectricArcSpell Auto
	int property maxProjectiles = 25 auto
	form property xmarker auto hidden
	float property TargetDistance = 256.0 auto hidden
EndGroup

int projectiles = 0
objectReference[] Targets
bool fireAtTarget = true

;Unneeded here
Function ResolveLeveledDamage ()
EndFunction

;Put the local stuff in here
Function LocalFireTrap()
	objectReference akTargetRange
	objectReference akTarget
	objectReference objSelf = self as objectReference
	projectiles = 0
	if GetLinkedRef()
		akTargetRange = GetLinkedRef()
	else
		akTargetRange = objSelf
	endif
	objectReference myXmarker 
	myXmarker = akTargetRange.placeAtMe(xmarker)
	PlayAnimation(FireTrapAnim)
	float currentTargetDistance = (TargetDistance * akTargetRange.GetScale())
	While projectiles < maxProjectiles && is3dLoaded()
		;akTarget.moveToNode( game.FindRandomActorFromRef(objSelf, TargetDistance), "Torso")
		akTarget = game.FindRandomActorFromRef(akTargetRange, currentTargetDistance)
		
		;if we have a target and this is not a dummy fire, half the time fire at the dummy
		if akTarget && randomint(1, 100) <= 50 
			debug.trace(self + ": firing at actor >> " + akTarget)
			TrapElectricArcSpell.Cast(objSelf, akTarget)

		else 		
			debug.trace(self + ": firing at dummy >> " + myXmarker)
			myXmarker.moveto(akTargetRange, afXOffset = randomfloat(-200.0, 200.0),  afYOffset = randomfloat(-200.0, 200.0), afZOffset = randomfloat(-200.0, 200.0))
			TrapElectricArcSpell.Cast(objSelf, myXmarker)
		endif
		
		wait(randomfloat(0.05, 0.2))
		projectiles += 1
	endWhile
	akTarget = none
	myXmarker.delete()
	Self.SetDestroyed()
EndFunction

;Put local disarm needs here
Function LocalDisarmTrap()
	self.setDestroyed()
EndFunction

;Put local disarm rewards here
Function LocalDisarmReward()
EndFunction

;Use if the child needs specific timer events
Function LocalOnTimer(int aiTimerID)
endFunction


;/	May put targetting info here
Event onLoad()
	if getLinkedRef()
		objectReference currentRef
		Targets
	endif
EndEvent
/;



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