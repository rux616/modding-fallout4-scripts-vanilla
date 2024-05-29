scriptName DLC03:TrapBear extends objectReference
;
;
;==========================================

DLC03:DLC03TrapHit hitBase
bool property StartOpen = True Auto
perk property LightFoot auto
bool property checkForLightFootPerk = true Auto
{default == true}
globalVariable property LightFootTriggerPercent auto

Weapon Property DLC03_ThrowingBearTrapWeapon Auto Const

Message Property DLC03_ThrowingWeaponBearTrapDisarm Auto Const
Message Property DLC03_ThrowingWeaponBearTrapTake Auto const

globalVariable property DLC03BearTrapBreakChance Auto Const
activator Property DLC03BearTrapTrigger Auto Const

Sound Property DLC03TRPBearTrapFire Auto Const Mandatory
Sound Property DLC03TRPBearTrapBreak Auto Const Mandatory

ObjectReference MyTrigger
Event onReset()
	goToState("Closed")
	self.reset()
endEvent


event onLoad()
	debug.Trace(self + ": onLoad")
	hitBase = (self as objectReference) as DLC03:DLC03TrapHit
	if StartOpen
		;playAnimation("StartOpen")
		goToState("Open")
	endif
	;MoveToNearestNavmeshLocation()
endEvent

event onCellAttach()
	debug.Trace(self + ": onCellAttach")
	
	;RegisterForRemoteEvent(MyTrigger, "OnTriggerEnter")
	if GetState() == "Open"
		MyTrigger = PlaceAtNode("REF_ATTACH_NODE", DLC03BearTrapTrigger, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = true, abAttach = true)
		hitBase.goToState("CanHit")

	endif
EndEvent


Event objectReference.OnTriggerEnter(ObjectReference akSender ,objectReference TriggerRef)
	debug.Trace(akSender + " has been entered by " + TriggerRef)
	OnTriggerEnter(TriggerRef)
EndEvent


state Closed
	Event OnBeginState(string asOldState)
		ObjectReference objSelf = self as ObjectReference
		debug.Trace(self + " has entered state Closed")
		MyTrigger.Delete()
		if asOldState != "Disarming"
			Debug.trace(self + ": Transitioned from Disarming")
			;PlaceAtMe(Test_ThrowingBearTrapDamageExplosion)
			if utility.RandomFloat(0.0, 100.0) <= DLC03BearTrapBreakChance.GetValue()
				Debug.trace(self + ": bearTrap BREAKS")
				DamageObject(100)
				DLC03TRPBearTrapBreak.Play(ObjSelf)
				SetDestroyed()
			else
				Debug.trace(self + ": closed but not broken")
				SetDestroyed()
				ObjSelf.SetActivateTextOverride(DLC03_ThrowingWeaponBearTrapTake)
				SetDestroyed(false)
			endif
		Elseif asOldState == "Disarming"
			Debug.trace(self + ": closed but not broken")
			SetDestroyed()
			ObjSelf.SetActivateTextOverride(DLC03_ThrowingWeaponBearTrapTake)
			SetDestroyed(false)
		EndIf
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
 		debug.Trace(self + " has been entered by " + TriggerRef)
 		debug.Trace(self + " is in state Closed")
	endEvent
	
	event OnActivate(objectReference TriggerRef)
 		debug.Trace(self + " has been activated by " + TriggerRef)
 		debug.Trace(self + " is in state Closed")
		if (TriggerRef as actor)
			GoToState("Busy")
			UnRegisterForRemoteEvent(MyTrigger, "OnTriggerEnter")
			MyTrigger.Delete()
			Self.Disable()
			(TriggerRef as actor).AddItem(DLC03_ThrowingBearTrapWeapon)
			self.Delete()
		;playAnimationAndWait("Reset01","Trans02")
		;goToState("Open")
		EndIf
	endEvent
	
endState

auto state Open
	Event OnBeginState(string asOldState)
		ObjectReference objSelf = self as ObjectReference
 		debug.Trace(self + " has entered state Open")
 		;MyTrigger = PlaceAtNode("REF_ATTACH_NODE", DLC03BearTrapTrigger, aiCount = 1, abForcePersist = false, abInitiallyDisabled = false, abDeleteWhenAble = true, abAttach = true)
		RegisterForRemoteEvent(MyTrigger, "OnTriggerEnter")
		ObjSelf.SetActivateTextOverride(DLC03_ThrowingWeaponBearTrapDisarm)
		hitBase.goToState("CanHit")
	endEvent

	event OnTriggerEnter(objectReference TriggerRef)
		if checkPerks(TriggerRef)
 			ObjectReference objSelf = self as ObjectReference
 			debug.Trace(self + " has been entered by " + TriggerRef)
 			debug.Trace(self + " is in state Open")
			;hitBase.goToState("CanHit")
			utility.wait(0.2)
			DLC03TRPBearTrapFire.Play(objSelf)
			playAnimation("Play01")
			GoToState("Busy")
			WaitForAnimationEvent("Done")
			utility.wait(0.2)
			hitBase.goToState("CannotHit")
			GoToState("Closed")
		endif
	endEvent

	event OnActivate(objectReference TriggerRef)
 		debug.Trace(self + " has been activated by " + TriggerRef)
 		debug.Trace(self + " is in state Open")
		GoToState("Disarming")
	endEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  					bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
		Debug.Trace(self + ": has been hit by akAggressor")
		DamageObject(5)

	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
		if aiCurrentStage == 1
			ObjectReference objSelf = self as ObjectReference
			debug.Trace(self + " has been shot")
 			debug.Trace(self + " is in state Open")
			hitBase.goToState("CannotHit")
			DLC03TRPBearTrapFire.Play(objSelf)
			playAnimationAndWait("Play01","Done")
			goToState("Closed")
		endif
	endevent
endState

State Disarming
	Event OnBeginState(string asOldState)
		ObjectReference objSelf = self as ObjectReference
		hitBase.goToState("CannotHit")
		DLC03TRPBearTrapFire.Play(objSelf)
		playAnimationAndWait("Play01","Done")
		goToState("Closed")
	EndEvent
EndState

State Busy	;Dummy state to prevent interaction while animating
	Event OnBeginState(string asOldState)
; 		debug.Trace(self + " has entered state Open")
	endEvent
EndState

event OnTriggerEnter(objectReference TriggerRef)
; 	debug.Trace(self + " has been entered by " + TriggerRef)
; 	debug.Trace(self + " default onEnter")
endEvent
	
event OnActivate(objectReference TriggerRef)
; 	debug.Trace(self + " has been activated by " + TriggerRef)
; 	debug.Trace(self + " default onTrigger")
endEvent

Bool function checkPerks(objectReference triggerRef)
	if checkForLightFootPerk
; 		;debug.Trace(self + " is checking if " + triggerRef + " has LightFoot Perk")
		if  (triggerRef as actor).hasPerk(LightFoot)
; 			;debug.Trace(self + " has found that " + triggerRef + " has LightFoot Perk")
			if utility.randomFloat(0.0,100.00) <= LightFootTriggerPercent.getValue()
; 				;debug.Trace(self + " is returning false due to failed lightfoot roll")
				return False
			else
; 				;debug.Trace(self + " is returning true due to successful lightfoot roll")
				return True
			endif
		Else
; 			debug.Trace(self + " has found that " + triggerRef + " doesn't have the LightFoot Perk")
			Return True
		EndIf
	else
		return True
	endif
endFunction

