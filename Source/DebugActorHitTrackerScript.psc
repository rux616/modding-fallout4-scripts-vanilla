Scriptname DebugActorHitTrackerScript extends actor

float Health

float LeftAttackCondition
float LeftMobilityCondition

float RightAttackCondition
float RightMobilityCondition

float PerceptionCondition

Event OnLoad()
	debug.trace(self + "OnLoad()")

	Health = GetValue(Game.GetHealthAV())
	LeftAttackCondition = GetValue(Game.GetCommonProperties().LeftAttackCondition)
	LeftMobilityCondition = GetValue(Game.GetCommonProperties().LeftMobilityCondition)
	RightAttackCondition = GetValue(Game.GetCommonProperties().RightAttackCondition)
	RightMobilityCondition = GetValue(Game.GetCommonProperties().RightMobilityCondition)
	PerceptionCondition = GetValue(Game.GetCommonProperties().PerceptionCondition)

	if Is3DLoaded()
		RegisterForHitEvent(self) ; get one hit, any source
	endIf
EndEvent

Event onUnload()
	UnregisterForAllHitEvents()
endEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace(self + "OnHit()")
    SetTrackingVars(akAggressor)
    RegisterForHitEvent(self) ; ready for another hit
EndEvent

Event OnDeath(Actor akKiller)
    debug.trace(self + "OnDeath()")
    Reset()


EndEvent

Function TraceAndMessage(String Text)
	debug.trace(self)
	debug.messageBox(Text)

EndFunction

Function SetTrackingVars(ObjectReference akAggressor)
	float NewHealth = GetValue(Game.GetHealthAV())
	float NewLeftAttackCondition = GetValue(Game.GetCommonProperties().LeftAttackCondition)
	float NewLeftMobilityCondition = GetValue(Game.GetCommonProperties().LeftMobilityCondition)
	float NewRightAttackCondition = GetValue(Game.GetCommonProperties().RightAttackCondition)
	float NewRightMobilityCondition = GetValue(Game.GetCommonProperties().RightMobilityCondition)
	float NewPerceptionCondition = GetValue(Game.GetCommonProperties().PerceptionCondition)

	string Text

	if NewLeftAttackCondition != LeftAttackCondition
		text += "Left Arm \n "
	endif

	if NewLeftMobilityCondition != LeftMobilityCondition
		text += "Left Leg \n"
	endif

	if NewRightAttackCondition != RightAttackCondition
		text += "Right Arm \n"
	endif

	if NewRightMobilityCondition != RightMobilityCondition
		text += "Right Leg \n"
	endif

	if NewPerceptionCondition != PerceptionCondition
		text += "Head \n"
	endif

	text += "Distance: " + GetDistance(akAggressor) + "\n"

	text += "Damage: " + (Health - NewHealth)

	TraceAndMessage(text)

	Health = NewHealth
	LeftAttackCondition = NewLeftAttackCondition
	LeftMobilityCondition = NewLeftMobilityCondition
	RightAttackCondition = NewRightAttackCondition
	RightMobilityCondition = NewRightMobilityCondition
	PerceptionCondition = NewPerceptionCondition


EndFunction