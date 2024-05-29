;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06_PlayerExitWindF_01040AF0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06_PlayerExitWindFarmScript
Quest __temp = self as Quest
DLC03:DLC03MQ06_PlayerExitWindFarmScript kmyQuest = __temp as DLC03:DLC03MQ06_PlayerExitWindFarmScript
;END AUTOCAST
;BEGIN CODE
Actor PA = Game.GetPlayer()
Location PALoc = PA.GetCurrentLocation()

;If player's already made it to Far Harbor, shut it down
if PA.IsInLocation(DLC03FarHarborSettlementLocation) && !GetStageDone(200)
    SetStage(200)

;Otherwise, if the player's already left the wind farm, trigger stage
elseif !GetStageDone(200) && !GetStageDone(100) && PA.GetCurrentLocation() != DLC03WindFarmBuildingInteriorLocation && !PA.IsInLocation(DLC03FarHarborSettlementLocation)
  SetStage(100)
endif

;Register player for distance event
kmyquest.DistanceEventPlayerObjMarker()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Play distant monster sound
Utility.Wait(4.0)
NPCMirelurkQueenAmbushB.Play(RoarMarker)

Utility.Wait(2.0)

;Ensure the player isn't already in Far Harbor before throwing obj
if !Game.GetPlayer().IsInLocation(DLC03FarHarborSettlementLocation) && !GetStageDone(200)
  SetObjectiveDisplayed(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

Utility.Wait(1.0)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property DLC03WindFarmBuildingInteriorLocation Auto Const Mandatory

Sound Property NPCMirelurkQueenAmbushB Auto Const Mandatory

ObjectReference Property RoarMarker Auto Const Mandatory

Location Property DLC03FarHarborSettlementLocation Auto Const Mandatory
