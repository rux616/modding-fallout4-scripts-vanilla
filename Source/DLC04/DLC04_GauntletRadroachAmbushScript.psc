ScriptName DLC04:DLC04_GauntletRadroachAmbushScript extends MasterAmbushActorScript

Event OnInit()
	Self.SetGhost(True)
EndEvent

Auto State waiting

	Event OnLoad()
		;Block the parent script from registering for hit events.
	endEvent

	;Handle Activation
	Event OnActivate(ObjectReference triggerRef)
		Self.SetGhost(False)
		Parent.OnActivate(triggerRef)
	EndEvent
EndState