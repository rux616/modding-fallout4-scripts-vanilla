Scriptname Hardcore:HC_CaffeinatedEffectScript extends activemagiceffect

Hardcore:HC_ManagerScript Property HC_Manager const auto
{autofill}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	HC_Manager.CaffeinatedEffectToggle(self)
EndEvent