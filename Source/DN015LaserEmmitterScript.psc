ScriptName DN015LaserEmmitterScript Extends ObjectReference

Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Trip" auto const
	;String Property TriggerEvent = "TransitionComplete" auto
	;String Property ResetAnim = "Stage1" auto
	;String Property ResetEvent = "TransitionComplete" auto
	;String Property DisarmAnim = "stage1" auto
	;String Property DisarmEvent = "TransitionComplete" auto
EndGroup

Sound Property TriggerSound auto const
bool isArmed = true

Group Disarmed CollapsedOnRef
	LeveledItem property TrapDisarmedReward auto Const
	{This is given to the disarming actor}
	Sound Property DisarmSound Auto Const
	{This is the sound to play when disarming
		TRPDisarmHiTech & TRPDisarmLoTech are the usual choices}
EndGroup
;==================================================
;		Events Block
;==================================================

Event OnReset()
    self.setdestroyed(false)
    ;Self.Enable()
    PlayAnimation("Reset")
    reset()
    GoToState("Active")
    isArmed = true
EndEvent

Event OnLoad()
	Self.BlockActivation()
EndEvent

;==================================================
;		Events Block
;==================================================

Auto state Active
EndState

;Centralized
Function Trigger()
	TriggerSound.play(self)
	playAnimation(TriggerAnim)
	self.Activate(self, true)
	gotostate("Inactive")
	isArmed = false
EndFunction


state Inactive
	Event OnBeginState(string asOldState)
		isArmed = false
	    self.setdestroyed(true)
	EndEvent
EndState

State Busy
EndState

Function DisarmTrigger(Actor DisarmingActor)
	DisarmingActor.AddItem(TrapDisarmedReward)
	GoToState("Disarmed")
EndFunction

State Disarmed
	Event onBeginState(string previousState)
		isArmed = false
		PlayAnimation("Trip")
		ObjectReference ObjSelf = self as ObjectReference
		DisarmSound.Play(ObjSelf)
		setDestroyed()
		;Self.Disable()
	endEvent
EndState

Function SetArmed(bool shouldBeArmed = true)
	if shouldBeArmed
		OnReset()
	else
		GoToState("Disarmed")
	endif
EndFunction

bool Function GetIsArmed()
	return isArmed
EndFunction
