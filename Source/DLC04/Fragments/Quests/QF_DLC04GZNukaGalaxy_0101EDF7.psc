;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04GZNukaGalaxy_0101EDF7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart to the Nuka-Galaxy Coaster.
SetStage(2000)
SetStage(2010)
SetStage(2011)
Game.GetPlayer().Moveto(DLC04NukaGalaxyStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZNukaGalaxyQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZNukaGalaxyQuestScript kmyQuest = __temp as DLC04:DLC04GZNukaGalaxyQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RestartColonyCombatants()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZNukaGalaxyQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZNukaGalaxyQuestScript kmyQuest = __temp as DLC04:DLC04GZNukaGalaxyQuestScript
;END AUTOCAST
;BEGIN CODE
;Switch to Ride Mode lighting.
kMyQuest.ToggleNukaGalaxyLighting(True)

;Swap the dungeon enable state.
DLC04GZNukaGalaxy_PowerDisableMarker.DisableNoWait()
DLC04GZNukaGalaxy_PowerEnableMarker.EnableNoWait()
DLC04GZNukaGalaxy_BoardingAreaCommentMarker.EnableNoWait()

;Stop the Pre-Power scenes.
kMyQuest.StopPrePowerScenes()

;If power has been restored [Tracking 2000] and the Mainframe has been repaired [Main 210],
;reset the robots in Nuka-Galaxy so the player can see the full ride experience.
if (DLC04GZTrackingQuest.GetStageDone(2000) && DLC04GZMainQuest.GetStageDone(210))
     SetStage(2010) 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
;Reset the dungeon.
DLC04GZNukaGalaxy01.Reset()

;Swap the Colony Combatants. The Post-Power group has more actors to make the ride look better.
DLC04GZNukaGalaxy_PowerDisableRobotsMarker.DisableNoWait()
DLC04GZNukaGalaxy_PowerEnableRobotsMarker.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04GZMainQuest Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_PowerEnableMarker Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_PowerDisableMarker Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_PowerDisableRobotsMarker Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_PowerEnableRobotsMarker Auto Const Mandatory

Cell Property DLC04GZNukaGalaxy01 Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_RideOnLightsAndFixtures Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_RideOffLightsAndFixtures Auto Const Mandatory

ObjectReference Property DLC04NukaGalaxyStart Auto Const Mandatory

Quest Property DLC04GZNukaGalaxyProcessing Auto Const Mandatory

ObjectReference Property DLC04GZ_QuantumSpeed1StarStreaks Auto Const Mandatory

ObjectReference Property DLC04GZ_QuantumSpeed2StarStreaks Auto Const Mandatory

Quest Property DLC04GZTrackingQuest Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxy_BoardingAreaCommentMarker Auto Const Mandatory
