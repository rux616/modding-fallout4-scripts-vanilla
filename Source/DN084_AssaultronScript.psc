ScriptName DN084_AssaultronScript extends Actor Hidden
{Script for the Assaultrons in MassFusion02. Open their doors when they become conscious.}

Keyword property LinkCustom01 Auto Const Mandatory
{LinkCustom01; link to the Assaultron's door.}

Auto State Ready
	Event OnConsciousnessStateChanged(bool abUnconscious)
		if (!abUnconscious)
			(Self.GetLinkedRef(LinkCustom01) as default2StateActivator).SetOpenNoWait(True)
		EndIf
	EndEvent
EndState

State Done
	;Do nothing.
EndState