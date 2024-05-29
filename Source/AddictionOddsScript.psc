Scriptname AddictionOddsScript extends ActiveMagicEffect

Float Property Magnitude Auto
ActorValue Property TrackingActorValue Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.ModValue(TrackingActorValue, Magnitude)
EndEvent
