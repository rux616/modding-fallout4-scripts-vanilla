Scriptname SpellEffectImod extends ActiveMagicEffect
{Plays the selected Imod on begin effect}

ImageSpaceModifier Property StingwingPoisonImod Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    StingwingPoisonImod.Apply()
EndEvent
