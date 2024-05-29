Scriptname Hardcore:HC_ImmunodeficiencyEffectScript extends activemagiceffect

Hardcore:HC_ManagerScript Property HC_Manager Auto Const Mandatory
{autofill}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	HC_Manager.ImmunodeficiencyEffectToggle(true)
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	HC_Manager.ImmunodeficiencyEffectToggle(false)
EndEvent

