;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Hardcore:Fragments:Quests:QF_HC_ChangeLocationRainingH_0100089C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.trace(self + "Startup stage 0")
HC_Manager.Trace(self, "starting up because player changed location in an interior and it's raining. Starting scene with timer.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
debug.trace(self + "Shutdown stage 255")

;if it's still raining (after scene with timer in it finishes):
HC_Manager.Trace(self, "Shutting down because scene timer expired, will check for rain.")

if Game.GetPlayer().IsInInterior() == false &&  Weather.GetCurrentWeather().GetClassification() >= 2  ;raining or snowing
	HC_Manager.trace(self, "player is outside and it's raining or snowing. Will call HandleDiseaseRiskEvent() and SetNextRainEventAllowed()")
	HC_Manager.HandleDiseaseRiskEvent(HC_Manager.DiseaseRiskRainAmount)
	HC_Manager.SetNextRainEventAllowed()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Hardcore:HC_ManagerScript Property HC_Manager Auto Const Mandatory
