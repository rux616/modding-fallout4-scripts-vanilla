Scriptname DN129WorkshopOnUnloadDisable extends Actor Const

ActorValue Property WorkshopPlayerOwned Auto Const
ObjectReference Property SunshineTidingsWorkshopREF Auto Const

Event OnUnload()
	if ((SunshineTidingsWorkshopREF).GetValue(WorkshopPlayerOwned) > 0)
		Self.Disable()
	EndIf
EndEvent