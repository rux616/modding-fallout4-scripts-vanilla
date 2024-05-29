Scriptname MessageOnEffectStart extends ActiveMagicEffect

Message Property MyMessage Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	MyMessage.Show()
EndEvent