Scriptname PAStealthSoundScript extends activemagiceffect

Sound Property OBJArmorStealthActivate Auto Const Mandatory
Sound Property OBJArmorStealthDeactivate Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	OBJArmorStealthActivate.Play(akCaster)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	OBJArmorStealthDeactivate.Play(akCaster)
EndEvent
