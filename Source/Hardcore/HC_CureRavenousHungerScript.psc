Scriptname Hardcore:HC_CureRavenousHungerScript extends activemagiceffect Const

Hardcore:HC_ManagerScript Property HC_Manager const auto mandatory
{autofill}

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	HC_Manager.CureRavenousHunger()
EndEvent
