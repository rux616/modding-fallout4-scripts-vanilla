ScriptName DNSC_MusicActivatorScript Extends DefaultMusicTriggerScript Hidden

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
		Music[MusicTypeToPlay].Add()
	EndEvent
EndState

State Done

EndState