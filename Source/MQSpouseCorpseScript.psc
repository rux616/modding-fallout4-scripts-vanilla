ScriptName MQSpouseCorpseScript extends ObjectReference

MiscObject Property WeddingRing01 auto

auto STATE waitingForPlayer
	;don't allow normal looting on the corpse
	Event OnInit()
		BlockActivation()
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			gotoState("hasBeenTriggered")
			Game.GetPlayer().AddItem(WeddingRing01, 1)
		EndIf
	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE