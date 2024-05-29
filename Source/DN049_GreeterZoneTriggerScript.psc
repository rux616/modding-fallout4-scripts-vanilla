ScriptName DN049_GreeterZoneTriggerScript extends ObjectReference Hidden
{Script on three triggers around DN049. Sets a conditional quest variable based on the player's location, which the Greeter's packages use to follow them.}

DN049QuestScript property DN049 Auto Const Mandatory
{DN049}

int property myTriggerID Auto Const
{The ID of this trigger.}


Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		DN049.UpdateGreeterZone(myTriggerID)
	EndIf
EndEvent