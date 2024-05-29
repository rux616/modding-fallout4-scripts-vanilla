Scriptname DLC01:DLC01Lair_LaserTripwireScript extends TrapTripwire
{Event scripting for the Laser Tripwire system in the Mechanist's Lair Entrance area.}

DLC01:DLC01LairQuestScript property DLC01Lair Auto Const Mandatory
{DLC01Lair}

;During DLC01Lair's startup stage, each tripwire registers for the DisableTripwiresEvent.
Function InitializeTripwire()
	RegisterForCustomEvent(DLC01Lair, "DLC01LairENT_DisableTripwiresEvent")
EndFunction

;When the event is received, each tripwire delays the base amount in akArgs[0], plus a small random amount.
Event DLC01:DLC01LairQuestScript.DLC01LairENT_DisableTripwiresEvent(DLC01:DLC01LairQuestScript akSender, Var[] akArgs)
	float additionalDelay = 0
	if ((akArgs != None) && (akArgs.Length > 0))
		additionalDelay = akArgs[0] as int
	EndIf
	StartTimer(Utility.RandomFloat(0, 2) + additionalDelay, 1)
EndEvent

Event OnTimer(int timerID)
	if (timerID == 1)
		DisarmTrigger(None)
	EndIf
EndEvent

;These tripwires set DLC01Lair Stage 220 (to disable the tripwire system) in addition to the normal tripwire behavior.
Function Trigger()
	TriggerSound.play(self)
	DLC01Lair.SetStage(220)
	Parent.Trigger()
EndFunction