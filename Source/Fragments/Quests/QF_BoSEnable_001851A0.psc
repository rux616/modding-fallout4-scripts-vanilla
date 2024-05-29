;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSEnable_001851A0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Turn on Airport and Prydwen over Airport
BoSBase.Enable()
BoSBaseInt.Enable()
BoSPreBoS.Disable()
BoSHalfGantryRef.Enable()
BoSAirportGuards.Enable()
BoSAirportScene.Enable()
BoSAirportSceneTrigger.Enable()
BoSGantryScribes.Enable()
BoSAirport_ExteriorDoorsMain.Enable()
BoSAirportSupplyDepotSoldiers.Enable()
BoSAirport_BaseSpotlights.Enable()
BoSAirport_SupplyDepotDoor.SetOpen(True)
BoSAirport_TeleportJammersState01Enable.Enable()
LibertyPrimeHangarDoor.SetOpen(True)
if (!Inst307Fight.IsRunning())
     BoSAirport_RadarDish.Enable()
EndIf
Utility.Wait(2)
BoSDScribeEnablerRef.Enable()

;Enable the side wall and the gate, which have seperate enable markers to support special events.
BoSAirport_Gate_EnableMarker.Enable()
Inst307Fight_BoSSideWallDisableMarker.Enable()
Inst307Fight_Phase1_Disable.Enable()

;Disable the door in the lower-level hallway leading to the vertibird pad.
AirportTerminalHallwayDoor.Disable()

;Enable Maxson and Kells, who can't be enable-parented because BoSMarshal needs to
;be able to enable and disable them individually.
Alias_BoSMaxson.TryToEnable()
Alias_BoSKells.TryToEnable()

;Shut down the tracking quest for the Pre-BoS Airport.
if (DN165Exterior.IsRunning())
     DN165Exterior.SetStage(255)
EndIf

;Workshop Enable and Setup
BostonAirportWorkshopRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Prydwen enables seperately
BoSPrydwen.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
BoSParts.Disable()
BoSGantryScribes.Disable()
BoSHalfGantryRef.Disable()
BoSGantry.Enable()
BoSPrimeST01.Enable()
BoSAirport_TeleportJammersState01Enable.Disable()
BoSAirport_TeleportJammersState02Enable.Enable()

;Setup Prime Scribes
Utility.Wait(5)
Alias_BoSPrimeScribe01.GetActorRef().MoveTo(BoSPScribe01Area02)
Alias_BoSPrimeScribe01.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe02.GetActorRef().MoveTo(BoSPScribe02Area02)
Alias_BoSPrimeScribe02.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe03.GetActorRef().MoveTo(BoSPScribe03Area02)
Alias_BoSPrimeScribe03.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe04.GetActorRef().MoveTo(BoSPScribe04Area02)
Alias_BoSPrimeScribe04.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe05.GetActorRef().MoveTo(BoSPScribe05Area02)
Alias_BoSPrimeScribe05.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Turn on Gantry and all related effects
BoSPrimeST01.Disable()
BoSPrydwenCable.Enable()
BoSHatch.Enable()

;Setup Prime
Alias_BoSLibertyPrimeAlias.GetActorRef().Enable()
Alias_BoSLibertyPrimeAlias.GetActorRef().SetRestrained()

;Setup Prime Scribes
BoSPrimeScribe05MarkerEnabler.Disable()
Alias_BoSPrimeScribe01.GetActorRef().MoveTo(BoSPScribe01Area03)
Alias_BoSPrimeScribe01.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe02.GetActorRef().MoveTo(BoSPScribe02Area03)
Alias_BoSPrimeScribe02.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe03.GetActorRef().MoveTo(BoSPScribe03Area03)
Alias_BoSPrimeScribe03.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe04.GetActorRef().MoveTo(BoSPScribe04Area03)
Alias_BoSPrimeScribe04.GetActorRef().EvaluatePackage()
Alias_BoSPrimeScribe05.GetActorRef().MoveTo(BoSPScribe05Area03)
Alias_BoSPrimeScribe05.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
BoSPrimeST02.Enable()

;Setup Prime Scribes
Alias_BoSPrimeScribe01.GetActorRef().MoveTo(BoSPScribe01Area04)
Alias_BoSPrimeScribe01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;When the Prydwen crashes into the airport, everything outside the terminal needs to be disabled.
BoSDoors.Disable()
BoSAirportGuards.DisableNoWait()
BoSGantryScribes.DisableNoWait()
BoSDScribeEnablerRef.DisableNoWait()
BoSAirportSupplyDepotSoldiers.DisableNoWait()
BoSAirport_BaseSpotlights.DisableNoWait()
BoSAirport_BaseSpotlights_01Light.DisableNoWait()
BoSAirport_BaseSpotlights_02Light.DisableNoWait()
BoSAirport_BaseSpotlights_03Light.DisableNoWait()
BoSAirport_BaseSpotlights_04Light.DisableNoWait()
BoSAirport_BaseSpotlights_05Light.DisableNoWait()
BoSAirport_BaseSpotlights_06Light.DisableNoWait()
BoSAirport_BaseSpotlights_07Light.DisableNoWait()
BoSAirport_BaseSpotlights_08Light.DisableNoWait()

BoSPreBoS.DisableNoWait()
BoSBase.DisableNoWait()
BoSAirport_ExteriorDoorsMain.DisableNoWait()
BoSAirport_Gate_EnableMarker.DisableNoWait()
BoS304GateOpen.DisableNoWait()
Inst307Fight_BoSSideWallDisableMarker.DisableNoWait()
Inst307Fight_Phase1_Disable.DisableNoWait()
BoSParts.DisableNoWait()
BoSAirport_TeleportJammersState01Enable.DisableNoWait()
BoSAirport_TeleportJammersState02Enable.DisableNoWait()
BoSAirport_RadarDish.DisableNoWait()
BoSHalfGantryRef.DisableNoWait()
BoSGantry.DisableNoWait()
LibertyPrimeGantry01Ref.DisableNoWait()
PrimeStatic.DisableNoWait()
BoSHatch.DisableNoWait()
BoSPrimeST01.DisableNoWait()
BoSPrimeST02.DisableNoWait()
BoSAirportScene.DisableNoWait()
BoSAirportSceneTrigger.DisableNoWait()

;Reenable the door in the lower-level hallway leading to the vertibird pad.
AirportTerminalHallwayDoor.EnableNoWait()

;Enable the destroyed state of the base.
BosDestroyed.Enable()

;Enable the fire effects.
(BoSPrydwenFire as PrydwenFireEffectsManager).EnablePrydwenFireFX()

;Change the map marker teleport point.
BoSAirportMapMarker.SetLinkedRef(BoSAirportMapMarkerHeadingRef02)

;Workshop Handler
WorkshopScript workshopRef = (BostonAirportWorkshopRef as WorkshopScript)
workshopRef.EnableAutomaticPlayerOwnership = true
workshopRef.MinrecruitmentAllowRandomAfterPlayerOwned = true
workshopRef.MinrecruitmentProhibitRandom = false

BostonAirportLocation.SetCleared(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoSBase Auto Const
ObjectReference Property BoSPrydwen Auto Const
ObjectReference Property BoSGantry Auto Const
ObjectReference Property BoSAirport_Gate_EnableMarker Auto Const
ObjectReference Property Inst307Fight_BoSSideWallDisableMarker Auto Const
ReferenceAlias Property Alias_BoSMaxson Auto Const
ReferenceAlias Property Alias_BoSKells Auto Const
ObjectReference Property PrimeStatic Auto Const
ObjectReference Property BoSAirportGuards Auto Const
ObjectReference Property BoSHalfGantryRef Auto Const
ObjectReference Property BoSParts Auto Const
ObjectReference Property BoSPrimeST01 Auto Const
ObjectReference Property BoSPrimeST02 Auto Const
ObjectReference Property BoSHatch Auto Const
ObjectReference Property Inst307Fight_Phase1_Disable Auto Const
ObjectReference Property BoSPScribe01Area02 Auto Const
ObjectReference Property BoSPScribe02Area02 Auto Const
ObjectReference Property BoSPScribe03Area02 Auto Const
ObjectReference Property BoSPScribe04Area02 Auto Const
ObjectReference Property BoSPScribe05Area02 Auto Const
ObjectReference Property BoSPScribe01Area03 Auto Const
ObjectReference Property BoSPScribe02Area03 Auto Const
ObjectReference Property BoSPScribe03Area03 Auto Const
ObjectReference Property BoSPScribe04Area03 Auto Const
ObjectReference Property BoSPScribe05Area03 Auto Const
ObjectReference Property BoSPScribe01Area04 Auto Const
ReferenceAlias Property Alias_BoSPrimeScribe01 Auto Const
ReferenceAlias Property Alias_BoSPrimeScribe03 Auto Const
ReferenceAlias Property Alias_BoSPrimeScribe02 Auto Const
ReferenceAlias Property Alias_BoSPrimeScribe04 Auto Const
ReferenceAlias Property Alias_BoSPrimeScribe05 Auto Const

ObjectReference Property BoSPrimeScribe05MarkerEnabler Auto Const

ObjectReference Property BoSAirportSupplyDepotSoldiers Auto Const

ObjectReference Property BoSDScribeEnablerRef Auto Const

ObjectReference Property BoSGantryScribes Auto Const

ObjectReference Property BoSBase_TeleportJammersState01Enable Auto Const

ObjectReference Property BoSAirport_TeleportJammersState01Enable Auto Const

ObjectReference Property BoSAirport_TeleportJammersState02Enable Auto Const

ObjectReference Property BoSAirport_BaseSpotlights Auto Const

ObjectReference Property BoSAirport_SupplyDepotDoor Auto Const

ObjectReference Property LibertyPrimeGantry01Ref Auto Const

ObjectReference Property BoSPreBoS Auto Const

ObjectReference Property BoSDestroyed Auto Const

Quest Property DN165Exterior Auto Const

ObjectReference Property BoSAirport_ExteriorDoorsMain Auto Const

ObjectReference Property LibertyPrimeHangarDoor Auto Const

ObjectReference Property BoS304GateOpen Auto Const

PrydwenFireEffectsManager Property BoSPrydwenFire Auto Const

ObjectReference Property BoSBaseInt Auto Const

ObjectReference Property BoSAirport_RadarDish Auto Const

Quest Property Inst307Fight Auto Const

ObjectReference Property BoSLibertyPrimeStaticREFlights Auto Const

ObjectReference Property inst307PrimeRefHackingLightRef Auto Const

ObjectReference Property BoSAirportMapMarker Auto Const Mandatory

ObjectReference Property BoSAirportMapMarkerHeadingRef Auto Const Mandatory

ObjectReference Property BoSAirportMapMarkerHeadingRef02 Auto Const Mandatory

ObjectReference Property BoSPrydwenCable Auto Const

ReferenceAlias Property Alias_BoSLibertyPrimeAlias Auto Const Mandatory

workshopscript Property BostonAirportWorkshopRef Auto Const Mandatory

ObjectReference Property BoSAirportScene Auto Const

ObjectReference Property BoSAirportSceneTrigger Auto Const

Location Property BostonAirportLocation Auto Const

ObjectReference Property BoSAirport_BaseSpotlights_01Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_02Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_03Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_04Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_05Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_06Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_07Light Auto Const Mandatory

ObjectReference Property BoSAirport_BaseSpotlights_08Light Auto Const Mandatory

ObjectReference Property AirportTerminalHallwayDoor Auto Const Mandatory

ObjectReference Property BoSDoors Auto Const
