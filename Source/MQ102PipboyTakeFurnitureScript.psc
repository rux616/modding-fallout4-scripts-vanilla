Scriptname MQ102PipboyTakeFurnitureScript extends ObjectReference Const

;rolling a custom version of DefaultRefEnableLinkedRefOnActivate so we can control for player being in combat
Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	If akActionRef == PlayerREF
		IF PlayerREF.IsInCombat()
			;do nothing
		Else
			Self.GetLinkedRef().Disable()
		EndIf
	EndIf
EndEvent