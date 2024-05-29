Scriptname DLC04:GrandchesterFlamethrowerScript extends ObjectReference
;
;
import utility


;==================================================
;		Child Functions - Define in extended script
;==================================================

Group LocalProperties CollapsedOnRef
	;LaserMusketBeamLtBlue

	ObjectReference property GMM_Switch Auto Const
	ObjectReference property GMM_Trigger Auto Const

	;Float Property firingTime = 8.0 Auto Const

	String Property FireTrapAnim = "Trip" Auto Const


	Form property WorkshopTrapFlamethrowerDummy Auto Const

	Sound Property TRPFlamethrowerFireLPM Auto Const
EndGroup

	objectReference myWeapon1
	objectReference myWeapon2
	int myFiringSound

;Unneeded here
Function ResolveLeveledDamage ()
EndFunction



;Put the local stuff in here
Event OnActivate(ObjectReference akActionRef)
    
	
	debug.trace("Activated by = " + akActionRef)


	;if !IsWorkshopVersion
	;	Self.SetDestroyed()
	;endif
	objectReference objSelf = self as objectReference


	if (akActionRef == GMM_Trigger)
			
		myFiringSound = TRPFlamethrowerFireLPM.Play(objSelf)
		myWeapon1 = objSelf.PlaceAtNode("FlameNozzleUpper", WorkshopTrapFlamethrowerDummy, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = false, abAttach = True)
		(myWeapon1 as TrapFlamethrowerDummy).RegisterMyFlamethrower(objSelf)
		myWeapon2 = objSelf.PlaceAtNode("FlameNozzleLower", WorkshopTrapFlamethrowerDummy, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = false, abAttach = True)
		(myWeapon2 as TrapFlamethrowerDummy).RegisterMyFlamethrower(objSelf)


	elseif	(akActionRef == GMM_Switch)
		PlayAnimation(FireTrapAnim)
		(myWeapon1 as TrapFlamethrowerDummy).OnCellDetach()
		;myWeapon1.Delete()
		(myWeapon2 as TrapFlamethrowerDummy).OnCellDetach()
		;myWeapon2.Delete()
		Sound.StopInstance(myFiringSound)
	endif


	
	;if IsWorkshopVersion
	;	Self.SetDestroyed()
	;endif
	;utility.wait(0.1)
	;PlayAnimation("TransitionComplete")

EndEvent


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