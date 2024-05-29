Scriptname DLC03:DLC03_HC_DiseaseRiskEventEffectScript extends activemagiceffect

Hardcore:HC_ManagerScript Property HC_Manager const auto mandatory
float Property DiseaseRiskChance = 0.2 Auto Const


Event OnEffectStart(Actor akTarget, Actor akCaster)
	HC_Manager.HandleDiseaseRiskEvent(DiseaseRiskChance)
EndEvent