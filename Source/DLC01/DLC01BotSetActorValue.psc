Scriptname DLC01:DLC01BotSetActorValue extends ActiveMagicEffect

ActorValue Property myActorValue Auto
{Actor value to set when mod is installed.}

Float Property myEffectStartValue = 1.0 Auto
{Value when mod is installed.}

Float Property myEffectFinishValue = 0.0 Auto
{Value when mod is uninstalled.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetValue(myActorValue, myEffectStartValue)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.SetValue(myActorValue, myEffectFinishValue)
EndEvent