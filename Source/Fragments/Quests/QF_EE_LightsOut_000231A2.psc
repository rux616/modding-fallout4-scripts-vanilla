;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_EE_LightsOut_000231A2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 0 startup")

;this quest runs when player take a light near an NPC
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_objectToInvestigate.GetRef().CreateDetectionEvent(Game.GetPlayer(), 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; increment suspicious counter
EEScript.GetScript().IncrementSuspicionEventCount(Alias_respondingActor.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;disable and delete the marker so no one else remarks on the light being out
Alias_ObjectToInvestigate.GetReference().Disable()
Alias_ObjectToInvestigate.GetReference().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_01
Function Fragment_Stage_0255_Item_01()
;BEGIN AUTOCAST TYPE EE_LightChangeState_Hostile
Quest __temp = self as Quest
EE_LightChangeState_Hostile kmyQuest = __temp as EE_LightChangeState_Hostile
;END AUTOCAST
;BEGIN CODE
; if nobody responded to detection event, place temporary AO marker
debug.trace(self + " nobody noticed detection event - placing AO marker")
if kmyQuest.bLightTurningOn
	EEScript.GetScript().PlaceTemporaryMarker(Alias_ObjectToInvestigate.GetRef(), AO_LightOnMarker)
else
	EEScript.GetScript().PlaceTemporaryMarker(Alias_ObjectToInvestigate.GetRef(), AO_LightOffMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ObjectToInvestigate Auto Const

ReferenceAlias Property Alias_RespondingActor Auto Const

RefCollectionAlias Property Alias_ActorAllies Auto Const

Activator Property AO_LightOffMarker Auto Const
Activator Property AO_LightOnMarker Auto Const
