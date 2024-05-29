;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Quests:QF_VRWorkshopShared_AttackQu_0024A38D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;terminal calls quest script, quest script starts/sets stages/stops
;Init, doesn't really do anything
debug.trace("VR WORKSHOP: Enemy attacks starting")

VRAttackQuest.SpawnEnemiesAtMarkers()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;stage is set by main quest script
debug.trace("VR WORKSHOP: Enemies spawned, attack set.")

SetObjectiveDisplayed(0, true, true) ;show enemy markers (for now)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;stage is set by main quest script
;as each hostile is killed their OnDeath event runs a check in the main quest script
debug.trace("VR WORKSHOP: All hostiles eliminated")
SetObjectiveCompleted(0) ;player has successfully killed all enemies
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;if the player is downed into bleedout, the quest fails
debug.trace("VR WORKSHOP: Player entered bleedout, fail attack quest")
SetObjectiveFailed(0) ;player has entered bleedout, call stopquest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;/This stage stops attacks when called, by either:
- stage 50 (killing all hostiles)
- via terminal 
- exiting a VR Worldspace
- entering bleedout
/;
debug.trace("VR WORKSHOP: Enemy attacks stopping")
SetObjectiveDisplayed(0, false, true) ;hide the marker
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CreationClub:VRWorkshops:VRWorkshopAttacksQuestScript Property VRAttackQuest Auto Const Mandatory
