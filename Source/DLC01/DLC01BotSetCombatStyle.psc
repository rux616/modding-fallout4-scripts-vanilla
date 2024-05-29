Scriptname DLC01:DLC01BotSetCombatStyle extends ActiveMagicEffect

CombatStyle Property myCombatStyle Auto
{Combat style to put actor in when mod is installed.}

CombatStyle Property DLC01csWorkbenchBot Auto
{Combat style to put actor in when mod is removed.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(akTarget as Actor).SetCombatStyle(myCombatStyle)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	(akTarget as Actor).SetCombatStyle(DLC01csWorkbenchBot)
EndEvent