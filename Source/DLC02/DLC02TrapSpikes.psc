ScriptName DLC02:DLC02TrapSpikes Extends ObjectReference

;	This trap is a large pressure plate that extends spikes when depressed
;	it is intended for workshop only.
;
;	This is different than normal traps which have an external trigger.
;	It handles keeping track of the number of objects in the pressure plate and 
;	tells its version of DLC02WorkshopTrapHit when it can deal damage.
;
;	After doing X number of hits the TrapHit script will tell it to break till you repair it
;================================================================


Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Stage2" auto Const
	String Property TriggerEvent = "TransitionComplete" auto Const
	String Property ResetAnim = "Stage1" auto Const
	String Property ResetEvent = "TransitionComplete" auto Const
	String Property RepairAnim = "Repair" auto Const
	String Property RepairEvent = "TransitionComplete" auto Const

	bool property WaitForAnimEnd = false Auto Const
	bool Property NoHitAfterAnim = false Auto Const
EndGroup

Group Disarmed CollapsedOnRef
	;bool Property DisarmOnActivate = true Auto Const
	LeveledItem property TrapDisarmedReward auto Const
	{This is given to the disarming actor}
	Sound Property DisarmSound Auto Const
	{This is the sound to play when disarming
		TRPDisarmHiTech & TRPDisarmLoTech are the usual choices
		This may be baked into the anim, if so this should be NONE}
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
		DLC02TrapSpikesHit HitBase = ((Self as ObjectReference) as DLC02TrapSpikesHit)
		debug.Trace(self + ": Setting PlateLowered to >> " + SetLowered)
		;If the plate is raised, and we are told it should not be, then lower it
		if !PlateLoweredActual && SetLowered
			debug.Trace(self + ": Lowering Pressure Plate")
			;Tell the Hit Script that we can hit actors now
			;Do this BEFORE the anim so it can hit as coming up

			if HitBase
				HitBase.SetCanHit(true)
			endif
			if !WaitForAnimEnd
				playAnimation(TriggerAnim)
			else
				debug.Trace(self + ": Waiting for AnimEnd on TriggerAnim")	
				playAnimationAndWait(TriggerAnim,TriggerEvent)
				debug.Trace(self + ": Recieved AnimEnd on TriggerAnim")	
				if HitBase && NoHitAfterAnim
					debug.Trace(self + ": Should not be able to hit")	
					HitBase.SetCanHit(false)
				endif
			endif
			PlateLoweredActual = SetLowered
			
		;If the plate is lowered, and we are told it should not be, then raise it and trigger
		elseif PlateLoweredActual && !SetLowered
			debug.Trace(self + ": Raising Pressure Plate")
			if !WaitForAnimEnd
				playAnimation(ResetAnim)
			else
				debug.Trace(self + ": Waiting for AnimEnd on ResetAnim")
				playAnimationAndWait(ResetAnim,ResetEvent)	
				debug.Trace(self + ": Recieved AnimEnd on ResetAnim")
			endif
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

;This is only left in so that if modders want to use it in a non workshop capacity they can do so
;	it would be set on the reference, but we are not using this in the base DLC
bool Property IsWorkshopVersion = true Auto Const
;==================================================
;		Functions Block
;==================================================

Function CheckCount()
	GoToState("busy")
	count = GetTriggerObjectCount()
	if !isDestroyed()
		GoToState("Ready")
	endif
EndFunction



;This handles 'disarming' the trigger
;	either by the player activating it if it is NOT a workshop version
;	or if it is a workshop version and 'breaks' due to hitting X number of actors
;	(defined in the relevant TrapHit Script)
Function DisarmTrigger(Actor DisarmingActor = NONE)
	;If this is disarmed by an actor, give that actor the reward
	if DisarmingActor && TrapDisarmedReward
		DisarmingActor.AddItem(TrapDisarmedReward)
	Endif

	ObjectReference ObjSelf = self as ObjectReference
	if DisarmSound
		DisarmSound.Play(ObjSelf)
	endif

	if !IsWorkshopVersion && DisarmingActor == game.GetPlayer()
		Game.RewardPlayerXP(TrapDisarmXPReward.GetValueInt())
	endif
	setDestroyed()

	GoToState("Broken")
EndFunction

;==================================================
;		Events Block
;==================================================

;This is the state for when the trap is functional
;	it breaks after hitting several actors (controlled by the hit script)
Auto State Ready
	Event OnBeginState(string asOldState)
		if asOldState == "Broken"
			;This is what sets it to appear repaired
			

			
			CheckCount()
		endif
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		debug.Trace(self + ": Entered by >> " + akActionRef)
	    CheckCount()
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		debug.Trace(self + ": Exited by >> " + akActionRef)
		CheckCount()
	endEvent


	Event onCellLoad()
		CheckCount()
		
	endEvent

	Event onActivate(objectReference akActivator)
		;Only allow actor activation if this is not depressed, if so tell it to depress
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
				CheckCount()
			endif
			;/
		elseif !PlateLowered
			;countActual += 1
			;PlateLowered = true
			CheckCount()
			/;
		endif
	EndEvent

EndState

State Busy
EndState

;State this is in when broken/Disarmed
State Broken
	Event OnBeginState(string asOldState)
		;This is what sets it to appear broken
		SetAnimationVariableBool("bDestroyed", 1)

		;Tell the Hit Script that we cannot hit actors now
		DLC02TrapSpikesHit HitBase = ((Self as ObjectReference) as DLC02TrapSpikesHit)
		if HitBase
			HitBase.SetCanHit(false)
		endif
	EndEvent
EndState


event onCellAttach()
	self.blockActivation(true)
endEvent


Event OnReset()
	self.setdestroyed(false)
	Self.Enable()
    reset()
	CheckCount()
EndEvent

Event OnWorkshopObjectRepaired(ObjectReference akReference)
	debug.Trace(self + ": Recieved OnWorkshopObjectRepaired from >> " + akReference)
	utility.wait(0.1)
	playAnimationAndWait(RepairAnim, RepairEvent)
	SetAnimationVariableBool("bDestroyed", 0)
	debug.Trace(Self + ": Has recieved   RepairAnim <<<<<<")
			;Tell the hit script to reset the hit counter
			DLC02TrapSpikesHit HitBase = ((Self as ObjectReference) as DLC02TrapSpikesHit)
			if HitBase
				HitBase.SetRepaired()
			endif
	GoToState("Ready")
EndEvent

