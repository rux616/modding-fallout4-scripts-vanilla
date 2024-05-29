Scriptname PushActorAwayScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.PushActorAway(aktarget, Magnitude)
EndEvent

Float Property Magnitude Auto Const
