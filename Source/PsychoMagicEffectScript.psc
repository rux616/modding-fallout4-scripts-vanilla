Scriptname PsychoMagicEffectScript extends ActiveMagicEffect

Keyword Property PlayerConsumePsycho Auto Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor PlayerREF = Game.GetPlayer()
	If akTarget == PlayerREF
		PlayerREF.SayCustom(PlayerConsumePsycho)
	EndIf
EndEvent