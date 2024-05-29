Scriptname MQ102SpousePodScript extends ReferenceAlias

int DoOnce
bool Property CryoPodOpenOnce Auto
ReferenceAlias Property SpouseLever Auto

Event OnAliasInit()
	If DoOnce == 0
		Self.GetRef().BlockActivation(True)
	EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If CryoPodOpenOnce == True
			SpouseLever.GetRef().Activate(Game.GetPlayer())
		EndIf
	EndIf
EndEvent