Scriptname MS19DiseaseScript extends ActiveMagicEffect

Potion Property MS19MoleratPoison Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	game.getplayer().equipitem(MS19MoleratPoison, false, true)
EndEvent
