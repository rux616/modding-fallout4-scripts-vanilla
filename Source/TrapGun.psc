ScriptName TrapGun extends TrapBase
;
;
;
;
weapon myGun
objectReference myGunRef
ammo myAmmo
;objectReference StartingWeapon
bool AlreadyInit = false
bool CellIsLoaded

Group GunLeveledLists CollapsedOnRef
	LeveledItem Property LL_TrapGunAuto Auto const Mandatory
	LeveledItem Property LL_TrapGunMissile Auto const Mandatory
	LeveledItem Property LL_TrapGunPistol Auto const Mandatory
	LeveledItem Property LL_TrapGunRifle Auto const Mandatory
	LeveledItem Property LL_TrapGunShotgun Auto const Mandatory

	int property WeaponType = 0 Auto
	{	0 = auto
	1 = missile
	2 = pistol
	3 = Rifle
	4 = Shotgun}
EndGroup

;==================================================
;		Child Functions - Define in extended script
;==================================================
Function ResolveLeveledDamage () 	;placeholder function, declared in children
EndFunction

;Put the local stuff in here
Function LocalFireTrap()
	debug.Trace(self + " is trying to fire")
	;myGun = GetLinkedRef().GetBaseObject() as Weapon
	debug.Trace(Self + ": AlreadyInit = " + AlreadyInit)
	myGun.Fire(myGunRef, myAmmo)
	;myGunRef.SetMotionType(Motion_Dynamic, false)
	GoToState("TrapFired")
EndFunction

;Put local disarm needs here
Function LocalDisarmTrap()
	myGunRef.SetMotionType(Motion_Dynamic, false)
	self.setDestroyed()
EndFunction

;Put local disarm rewards here
Function LocalDisarmReward()
EndFunction

;Use if the child needs specific timer events
Function LocalOnTimer(int aiTimerID)
endFunction



;-------------------------------------------


EVENT OnCellAttach()
	CellIsLoaded = true
	debug.Trace(Self + ": Running OnCellAttach")
	;StartingWeapon = GetLinkedRef()
	;Debug.Trace(self + " The Starting Weapon is " + StartingWeapon)
	
	;/
	if (StartingWeapon) && (StartingWeapon.GetBaseObject() as Weapon) && !AlreadyInit
		if StartingWeapon.Is3DLoaded()
			;if StartingWeapon.GetParentCell() == self.GetParentCell()
	/;
	if !AlreadyInit
		if GetLinkedRef()
			myGunRef = GetLinkedRef()
		else
			myGunRef = PlaceAtNode("GunNode", PickLeveledItem())
			SetLinkedRef(myGunRef)
		endif
		HandleStartingWeapon(myGunRef)
	else
		EnsureNodeMatch()
		;Debug.Trace("DARYL - " + self + " Doesn't have a starting weapon")
		;Do nothing
	endif
	
endEVENT

Event OnCellDetach()
	CellIsLoaded = false
EndEvent

Function HandleStartingWeapon(objectReference WeaponToLoad)
	debug.Trace(self + ": WeaponToLoad = " + WeaponToLoad)
	objectReference objSelf = self as objectReference
	if !AlreadyInit
		;myGunRef = WeaponToLoad
		;myGunRef = PlaceAtNode("GunNode", PickLeveledItem())
		while myGunRef.Is3DLoaded() != true && CellIsLoaded == true
			utility.wait(0.2)
		endwhile
		myGunRef.SetMotionType(Motion_Keyframed, false)
		utility.wait(0.2)
		float afX = objSelf.GetAngleX()
		float afY = objSelf.GetAngleY()
		float afZ = objSelf.GetAngleZ()
		myGunRef.SetAngle(afx, afy, afz)
		if myGunRef.HasKeyword(AnimsGripPistol) || myGunRef.HasKeyword(AnimsGripRifleAssault)
			myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
		elseif myGunRef.HasKeyword(AnimsGripRifleStraight)
			myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
		elseif myGunRef.HasKeyword(AnimsGripShoulderFired)
			;myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
			myGunRef.MoveToNode(objSelf, "GunNode", "MissileLauncherReceiver")
			;myGunRef.MoveToNode(objSelf, "GunNode", "WeaponTrigger")
		else
			;If we can't find the correct node, just give it as best a shot as we can.
			debug.Trace(self + ": ERROR - " + myGunRef + " does not have an expected grip keyword")
			myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
		endif
		;WeaponToLoad.MoveTo(objSelf)
		myGun = myGunRef.GetBaseObject() as Weapon
		RegisterForRemoteEvent(myGunRef, "OnActivate")
		RegisterForRemoteEvent(myGunRef, "OnReset")
		;StartingWeapon.Disable()
		AlreadyInit = TRUE
	endif
EndFunction

LeveledItem Function PickLeveledItem()
	if WeaponType == 0
		Return LL_TrapGunAuto
	elseif WeaponType == 1
		Return LL_TrapGunMissile
	elseif WeaponType == 2
		Return LL_TrapGunPistol
	elseif WeaponType == 3
		Return LL_TrapGunRifle
	elseif WeaponType == 4
		Return LL_TrapGunShotgun
	endif
EndFunction

Function EnsureNodeMatch()
	objectReference objSelf = self as objectReference
	if myGunRef != none && GetState() != "Disarm"
		myGunRef.SetMotionType(Motion_Keyframed, false)
		float afX = objSelf.GetAngleX()
		float afY = objSelf.GetAngleY()
		float afZ = objSelf.GetAngleZ()
		myGunRef.SetAngle(afx, afy, afz)
		if myGunRef.HasKeyword(AnimsGripPistol) || myGunRef.HasKeyword(AnimsGripRifleAssault)
			myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
		elseif myGunRef.HasKeyword(AnimsGripRifleStraight)
			myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
		elseif myGunRef.HasKeyword(AnimsGripShoulderFired)
			;myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
			myGunRef.MoveToNode(objSelf, "GunNode", "MissileLauncherReceiver")
			;myGunRef.MoveToNode(objSelf, "GunNode", "WeaponTrigger")
		else
			;If we can't find the correct node, just give it as best a shot as we can.
			debug.Trace(self + ": ERROR - " + myGunRef + " does not have an expected grip keyword")
			myGunRef.MoveToNode(objSelf, "GunNode", "P-Grip")
		endif
	endif
endFunction

Group GripPositionKeywords CollapsedOnRef
	Keyword Property AnimsGripPistol Auto Const Mandatory
	Keyword Property AnimsGripRifleAssault Auto Const Mandatory
	Keyword Property AnimsGripRifleStraight Auto Const Mandatory
	Keyword Property AnimsGripShoulderFired Auto Const Mandatory
EndGroup

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  Debug.Trace(self + " :::: " + akSender + " was activated by " + akActionRef)
  if akSender == myGunRef
  	Debug.Trace(Self + ": my linkedRef == " + GetLinkedRef())
  	GoToState("Disarm")
  	UnregisterForRemoteEvent(myGunRef, "OnActivate")
  	UnregisterForRemoteEvent(myGunRef, "OnReset")
  	SetLinkedRef(NONE, NONE)
  	Debug.Trace(Self + ": my linkedRef == " + GetLinkedRef())
  	myGunRef = NONE
  	myGun = NONE
  endif
EndEvent

;/
Event ObjectReference.OnReset(ObjectReference akSender)
	Debug.Trace(self + " :::: " + akSender + " sent OnReset")
  	if akSender == myGunRef
  		UnregisterForRemoteEvent(myGunRef, "OnReset")
  		myGunRef.Disable()
  		myGunRef.Delete()
  	Endif
EndEvent
/;

Event onReset()
	Debug.trace(Self + " : OnReset")
	;/
	if myGunRef
		Debug.trace(Self + " ::: myGunRef = " + myGunRef)
		UnregisterForRemoteEvent(myGunRef, "OnActivate")
		myGunRef.Disable()
		myGunRef.Delete()
	else
		Debug.trace(Self + " ::: myGunRef = " + myGunRef)
	endif
	/;
	goToState("Idle")
	self.Enable()
	Self.SetDestroyed(false)
	self.reset()
	;StartingWeapon = GetLinkedRef()
	;StartingWeapon.Enable()
	;StartingWeapon.Reset()
	;HandleStartingWeapon(StartingWeapon)
endEvent