Scriptname DN131_BoathouseTriggerScript extends ObjectReference Hidden Const
{Trigger for the Swan's Pond boathouse. If the player enters the boathouse, it triggers Swan immediately.}

DN131_SwanAliasScript property Swan Auto Const Mandatory
{Swan alias on DN131.}

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		Swan.PlayerEnteredBoathouse()
		Self.Disable()
		Self.Delete()
	EndIf
EndEvent