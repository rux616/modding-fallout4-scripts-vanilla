Scriptname Hardcore:HC_JetUseScript extends ActiveMagicEffect

HC_ManagerScript Property HC_Manager const auto mandatory
Potion Property Jet const auto mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	HC_Manager.AddFoodItem(Jet)
EndEvent
