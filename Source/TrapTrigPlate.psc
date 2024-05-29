scriptName TrapTrigPlate extends objectReference
;TrapTrigBase
;
;
;
;================================================================

weapon property pressEffect auto Const
ammo property pressEffectAmmo auto Const
keyword Property LocTypeWorkshop Auto Const

Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Stage2" auto Const
	String Property TriggerEvent = "TransitionComplete" auto Const
	String Property ResetAnim = "Stage1" auto Const
	String Property ResetEvent = "TransitionComplete" auto Const
	;String Property DisarmAnim = "stage1" auto
	;String Property DisarmEvent = "TransitionComplete" auto
EndGroup

Group Disarmed CollapsedOnRef
	;bool Property DisarmOnActivate = true Auto Const
	LeveledItem property TrapDisarmedReward auto Const
	{This is given to the disarming actor}
	Sound Property DisarmSound Auto Const
	{This is the sound to play when disarming
		TRPDisarmHiTech & TRPDisarmLoTech are the usual choices}
	GlobalVariable Property TrapDisarmXPReward Auto Const
EndGroup

int CountActual
int Property Count hidden
	int function get()
		return CountActual
	endFunction
	Function Set(int NewCount)
		debug.Trace(self + ": Setting Count to >> " + NewCount)
		debug.Trace(self + ": PlateLowered == " + PlateLowered)
		if NewCount > 0 && !PlateLowered
			PlateLowered = true
		ElseIf NewCount == 0 && PlateLowered
			PlateLowered = false
		endif
		CountActual = NewCount
	endFunction
EndProperty

bool PlateLoweredActual
bool property PlateLowered hidden
	bool function Get()
		return PlateLoweredActual
	endFunction
	function Set(bool SetLowered)
		debug.Trace(self + ": Setting PlateLowered to >> " + SetLowered)
		;If the plate is raised, and we are told it should not be, then lower it
		if !PlateLoweredActual && SetLowered
			debug.Trace(self + ": Lowering Pressure Plate")
			playAnimation(TriggerAnim)
			PlateLoweredActual = SetLowered
		;If the plate is lowered, and we are told it should not be, then raise it and trigger
		elseif PlateLoweredActual && !SetLowered
			debug.Trace(self + ": Raising Pressure Plate")
			playAnimation(ResetAnim)
			self.Activate(self, true) ;Activate ignoring blockActivate
			PlateLoweredActual = SetLowered
		endif
		CheckCount()
	endFunction
endProperty

bool IsWorkshopVersion = false
;==================================================
;		Functions Block
;==================================================

; These may not end up being used
Group TriggerOwnership CollapsedOnRef
	faction property owningFaction Auto
	actorBase property owningActorBase Auto
EndGroup

Function CheckCount()
	int NewCount = GetTriggerObjectCount()
	Debug.Trace(self + "NewCount = " + NewCount)
	Debug.Trace(self + "Count = " + Count)
	if NewCount != Count
		Count = NewCount
	endif
EndFunction

Function RecheckCount()
	count = GetTriggerObjectCount()
endFunction

Function DisarmTrigger(Actor DisarmingActor)
	DisarmingActor.AddItem(TrapDisarmedReward)
	;PlayAnimation("Trip")
	ObjectReference ObjSelf = self as ObjectReference
	DisarmSound.Play(ObjSelf)
	if !IsWorkshopVersion
		Game.RewardPlayerXP(TrapDisarmXPReward.GetValueInt())
	endif
	setDestroyed()
	Self.Disable()

EndFunction

;==================================================
;		Events Block
;==================================================


Event OnTriggerEnter(ObjectReference akActionRef)
	debug.Trace(self + ": Entered by >> " + akActionRef)
    CheckCount()
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	debug.Trace(self + ": Exited by >> " + akActionRef)
	CheckCount()
endEvent

event onCellAttach()
	if self.GetFactionOwner()
		owningFaction = self.GetFactionOwner()
	ElseIf self.GetActorOwner()
		owningActorBase = (self.GetActorOwner() as actorBase)
	endif

	;if blockActivate
		self.blockActivation(true)
	;endif
	
	;/
	if !doOnceBase
		StoredTriggerType = TriggerType
		doOnceBase = True
	endif
	/;
endEvent

Event onCellLoad()
	CheckCount()
	CheckForWorkshop()
	
endEvent



Event onActivate(objectReference akActivator)
	;Only allow actor activation if this is not depressed, if so tell it to depress
	;if (akActivator as Actor) && PlateLowered
	;	PlateLowered = false
	;endif
	Debug.Trace(Self + ":-------------------------------")
	if akActivator as Actor
		Debug.Trace(Self + ": has been activated by an actor")
		if !IsWorkshopVersion
			DisarmTrigger(akActivator as Actor)
		elseif !PlateLowered
			Debug.Trace(Self + ": Plate lowered == " + PlateLowered)
			;countActual += 1
			PlateLowered = true
			utility.Wait(0.3)
			RecheckCount()
			;CheckCount()
		endif
	elseif !PlateLowered
		;countActual += 1
		PlateLowered = true
		CheckCount()
	endif
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	Debug.Trace(Self + ": TRAP WAS PLACED IN WORKSHOP MODE")
	IsWorkshopVersion = True
EndEvent

Function CheckForWorkshop()
	if GetCurrentLocation().HasKeyword(LocTypeWorkshop)
		IsWorkshopVersion = True
	endif
EndFunction

Event OnReset()
	self.setdestroyed(false)
	Self.Enable()
    reset()
	CheckCount()
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
    IsWorkshopVersion = true
EndEvent