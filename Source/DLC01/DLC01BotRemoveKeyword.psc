Scriptname DLC01:DLC01BotRemoveKeyword extends ActiveMagicEffect

Keyword Property myKeyword Auto
{Keyword to remove while mod is installed.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.RemoveKeyword(myKeyword)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.AddKeyword(myKeyword)
EndEvent