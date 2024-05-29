Scriptname DLC01:DLC01BotSetVoiceType extends ActiveMagicEffect

VoiceType Property newVoiceType Auto
{VoiceType to set on actor when mod is installed.}

VoiceType oldVoiceType

Event OnEffectStart(Actor akTarget, Actor akCaster)
	oldVoiceType = (akTarget as Actor).GetVoiceType()
	(akTarget as Actor).SetOverrideVoiceType(newVoiceType)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	(akTarget as Actor).SetOverrideVoiceType(oldVoiceType)
EndEvent