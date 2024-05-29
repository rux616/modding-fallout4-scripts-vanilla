Scriptname DLC01:DLC01BotAddActorValue extends ActiveMagicEffect

ActorValue Property myActorValue Auto
{Actor value to set when mod is installed.}

Float Property myEffectStartValue = 1.0 Auto
{Value used to mod when installed.}

Float Property myEffectFinishValue = -1.0 Auto
{Value used to mod when uninstalled.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.ModValue(myActorValue, myEffectStartValue)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.ModValue(myActorValue, myEffectFinishValue)
EndEvent