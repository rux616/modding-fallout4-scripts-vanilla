Scriptname DefaultSetActorValueEffectScript extends ActiveMagicEffect Const
;talk to jduvall before modifying this script, thanks! :)

Group Data
ActorValue Property ActorValueToSet const auto
{AUTOFILL}

float Property ValueToSetOnStart = 1.0 const auto

float Property ValueToSetOnFinish = 0.0 const auto
EndGroup

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectStart() akTarget: " + akTarget + ", akCaster: " + akCaster)
	akTarget.SetValue(ActorValueToSet, ValueToSetOnStart)

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectFinish() akTarget: " + akTarget + ", akCaster: " + akCaster)
	akTarget.SetValue(ActorValueToSet, ValueToSetOnFinish)

EndEvent

