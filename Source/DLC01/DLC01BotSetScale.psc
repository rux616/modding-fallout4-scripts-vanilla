Scriptname DLC01:DLC01BotSetScale extends ActiveMagicEffect

Float Property myScale auto const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetScale(myScale)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetScale(1.0)
EndEvent