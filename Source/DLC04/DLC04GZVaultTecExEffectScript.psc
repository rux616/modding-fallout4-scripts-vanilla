Scriptname DLC04:DLC04GZVaultTecExEffectScript extends ActiveMagicEffect

ImageSpaceModifier Property StingwingPoisonImod Auto Const Mandatory
Message Property ExperimentMessage Auto Const Mandatory
Keyword Property ExperimentKeyword Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddKeyword(ExperimentKeyword)
	StingwingPoisonImod.Apply()
	;ExperimentMessage.Show()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveKeyword(ExperimentKeyword)    
EndEvent