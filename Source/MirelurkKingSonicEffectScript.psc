Scriptname MirelurkKingSonicEffectScript extends ActiveMagicEffect

ActorValue Property PerceptionCondition auto const
Float Property MKHurtValue auto const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.DamageValue(PerceptionCondition, MKHurtValue)
EndEvent
