Scriptname LegendaryMagicEffectSlowTimeScript extends ActiveMagicEffect Const

Spell Property SlowTime Auto Const
Message Property modLegendarySlowTimeMsg Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectStart() akTarget: " + akTarget + ", akCaster:" + akCaster)
	modLegendarySlowTimeMsg.Show()
	SlowTime.Cast(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace(self + "OnEffectFinish() akTarget: " + akTarget + ", akCaster:" + akCaster)
EndEvent
