Scriptname MirelurkHunterSpitScript extends ActiveMagicEffect

ActorValue Property LeftMobilityCondition auto const
ActorValue Property RightMobilityCondition auto const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.DamageValue(LeftMobilityCondition, 10)
    akTarget.DamageValue(RightMobilityCondition, 10)
EndEvent
