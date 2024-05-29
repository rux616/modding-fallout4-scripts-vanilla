Scriptname Hardcore:HC_DiseaseSleepinessEffectScript extends activemagiceffect

Hardcore:HC_ManagerScript Property HC_Manager const auto
{autofill}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	HC_Manager.SleepinessEffectToggle(true)
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	HC_Manager.SleepinessEffectToggle(false)
EndEvent
