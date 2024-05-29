ScriptName DN102_LabDemo2TriggerScript extends ObjectReference Hidden
{Script for HalluciGen Lab Demo 2 trigger.}

Spell property DN102_LabDemo2Spell Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace("LAB DEMO 2: " + akActionRef + " is in the trigger.")
	DN102_LabDemo2Spell.RemoteCast(akActionRef, None, akActionRef)
EndEvent