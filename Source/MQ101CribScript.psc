Scriptname MQ101CribScript extends ReferenceAlias

ReferenceAlias Property PlayerCribAnim Auto

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	if akActionRef == PlayerREF
		Self.GetRef().BlockActivation(True, True)
		PlayerCribAnim.GetRef().Activate(PlayerREF)
	EndIf
EndEvent