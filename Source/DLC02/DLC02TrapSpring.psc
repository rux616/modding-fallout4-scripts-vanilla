ScriptName DLC02:DLC02TrapSpring Extends ObjectReference

;TrapTrigBase
;
;
;
;================================================================


Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Stage2" auto Const Mandatory
	String Property TriggerEvent = "TransitionComplete" auto Const Mandatory
	String Property ResetAnim = "Stage1" auto Const Mandatory
	String Property ResetEvent = "TransitionComplete" auto Const Mandatory
	;String Property DisarmAnim = "stage1" auto
	;String Property DisarmEvent = "TransitionComplete" auto
EndGroup

Group Disarmed CollapsedOnRef
	;bool Property DisarmOnActivate = true Auto Const
	LeveledItem property TrapDisarmedReward auto Const Mandatory
	{This is given to the disarming actor}
	Sound Property DisarmSound Auto Const Mandatory
	{This is the sound to play when disarming
		TRPDisarmHiTech & TRPDisarmLoTech are the usual choices}
	GlobalVariable Property TrapDisarmXPReward Auto Const Mandatory
	{Xp rewarded to player on disarm if this is not a workshop trap}
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
		DLC02TrapSpringHit HitBase = ((Self as ObjectReference) as DLC02TrapSpringHit)
		debug.Trace(self + ": Setting PlateLowered to >> " + SetLowered)
		;If the plate is raised, and we are told it should not be, then lower it
		if !PlateLoweredActual && SetLowered
			debug.Trace(self + ": Lowering Pressure Plate")
			playAnimation(TriggerAnim)
			PlateLoweredActual = SetLowered
			;Tell the Hit Script that we can hit actors now
			if HitBase
				HitBase.SetCanHit(true)
			endif
		;If the plate is lowered, and we are told it should not be, then raise it and trigger
		elseif PlateLoweredActual && !SetLowered
			debug.Trace(self + ": Raising Pressure Plate")
			playAnimation(ResetAnim)
			self.Activate(self, true) ;Activate ignoring blockActivate
			PlateLoweredActual = SetLowered
			;Tell the Hit Script that we cannot hit actors now
			if HitBase
				HitBase.SetCanHit(false)
			endif
		endif
		CheckCount()
	endFunction
endProperty

bool IsWorkshopVersion = true
;==================================================
;		Functions Block
;==================================================

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
	;If this is disarmed by an actor, give that actor the reward
	if DisarmingActor && TrapDisarmedReward
		DisarmingActor.AddItem(TrapDisarmedReward)
	Endif
	;PlayAnimation("Trip")
	ObjectReference ObjSelf = self as ObjectReference
	DisarmSound.Play(ObjSelf)
	if !IsWorkshopVersion && DisarmingActor == game.GetPlayer()
		Game.RewardPlayerXP(TrapDisarmXPReward.GetValueInt())
	endif
	setDestroyed()
	;Whatever disarm anim we need will be played below
	;PlayAnimation(DisarmAnim)

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
	;if blockActivate
		self.blockActivation(true)
	;endif
endEvent

Event onCellLoad()
	CheckCount()
	
endEvent

Event onActivate(objectReference akActivator)
	;Only allow actor activation if this is not depressed, if so tell it to depress
	;if (akActivator as Actor) && PlateLowered
	;	PlateLowered = false
	;endif
	Debug.Trace(Self + ":-------------------------------")
	if akActivator as Actor
		Debug.Trace(Self + ": has been activated by an actor")
		;If this is not a workshop version then "disarm" it by the actor
		if !IsWorkshopVersion
			DisarmTrigger(akActivator as Actor)
		;If this IS a workshop trap and the pressure plate is not already down
		;	Lower the plate briefly then recheck that number of actors
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


Event OnReset()
	self.setdestroyed(false)
	Self.Enable()
    reset()
	CheckCount()
EndEvent