Scriptname ChemEffectDialogueScript extends ActiveMagicEffect

Keyword Property PlayerConsumeChem Auto Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Actor PlayerREF = Game.GetPlayer()
	If akTarget == PlayerREF
		PlayerREF.SayCustom(PlayerConsumeChem)
	EndIf
EndEvent