ScriptName TrapFlamethrower Extends TrapBase
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

	Form property WorkshopTrapFlamethrowerDummy Auto Const

	Float Property firingTime = 8.0 Auto Const

	Sound Property TRPFlamethrowerFireLPM Auto Const
EndGroup

;Unneeded here
Function ResolveLeveledDamage ()
EndFunction



;Put the local stuff in here
Function LocalFireTrap()
	objectReference myWeapon1
	objectReference myWeapon2
	int myFiringSound
	;if !IsWorkshopVersion
		Self.SetDestroyed()
	;endif
	objectReference objSelf = self as objectReference
	myFiringSound = TRPFlamethrowerFireLPM.Play(objSelf)
	myWeapon1 = objSelf.PlaceAtNode("FlameNozzleUpper", WorkshopTrapFlamethrowerDummy, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = false, abAttach = True)
	(myWeapon1 as TrapFlamethrowerDummy).RegisterMyFlamethrower(objSelf)
	myWeapon2 = objSelf.PlaceAtNode("FlameNozzleLower", WorkshopTrapFlamethrowerDummy, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = false, abAttach = True)
	(myWeapon2 as TrapFlamethrowerDummy).RegisterMyFlamethrower(objSelf)

	utility.wait(firingTime)


	PlayAnimation(FireTrapAnim)
	myWeapon1.Delete()
	myWeapon2.Delete()
	Sound.StopInstance(myFiringSound)
	
	;if IsWorkshopVersion
	;	Self.SetDestroyed()
	;endif
	utility.wait(0.1)
	PlayAnimation("TransitionComplete")

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

;/
Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	myWeapon1.Delete()
	myWeapon2.Delete()
	Sound.StopInstance(myFiringSound)
	debug.Trace(self + ": Recieved OnWorkshopObjectDestroyed from >> " + akActionRef)
EndEvent

Event OnUnload()
	debug.Trace(self + ": Recieved OnUnload")
	myWeapon1.Delete()
	myWeapon2.Delete()
	Sound.StopInstance(myFiringSound)
EndEvent
/;

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