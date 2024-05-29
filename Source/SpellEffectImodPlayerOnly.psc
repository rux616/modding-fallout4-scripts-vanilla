Scriptname SpellEffectImodPlayerOnly extends ActiveMagicEffect
{Plays the selected Imod on begin effect}

ImageSpaceModifier Property myImod Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == Game.GetPlayer()
		myImod.Apply()
	endif
EndEvent
