;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06E02_01004AD5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC06E01.SetStage(0)
pDLC06E01.SetStage(1000)

SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
pDLC06E01.SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06experimentquestscript
Quest __temp = self as Quest
dlc06:dlc06experimentquestscript kmyQuest = __temp as dlc06:dlc06experimentquestscript
;END AUTOCAST
;BEGIN CODE
; End the previous quest
SetStage(50)

SetObjectiveDisplayed(100)
kmyQuest.RegisterForWorkshopEvents(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pAmmoMissile, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
DLC06RecipeUnlockSodaStation.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06e02script
Quest __temp = self as Quest
dlc06:dlc06e02script kmyQuest = __temp as dlc06:dlc06e02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Wait for an hour
kmyQuest.StartWaitTimer()

; Clem reacts
pDLC06E02_500_SodaFountainBuilt.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
DLC06RecipeUnlockSodaStationExperimental.SetValue(1)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
DLC06RecipeUnlockSodaStationExperimental.SetValue(2)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
DLC06RecipeUnlockSodaStationExperimental.SetValue(3)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; move marker to node
DLC06:WorkshopIdleObjectScript idleObject = Alias_SodaFountain.GetRef() as DLC06:WorkshopIdleObjectScript
ObjectReference targetMarker = Alias_SodaFountainTargetMarker.GetRef()
targetMarker.Enable()
targetMarker.MoveToNode(idleObject, idleObject.TargetMarkerNode)
; make sure marker is on navmesh
targetMarker.MoveToNearestNavmeshLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06experimentquestscript
Quest __temp = self as Quest
dlc06:dlc06experimentquestscript kmyQuest = __temp as dlc06:dlc06experimentquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
kmyQuest.RegisterForWorkshopEvents(false)

; move marker to node
DLC06:WorkshopIdleObjectScript idleObject = Alias_SodaFountain.GetRef() as DLC06:WorkshopIdleObjectScript
ObjectReference targetMarker = Alias_SodaFountainTargetMarker.GetRef()
targetMarker.Enable()
targetMarker.MoveToNode(idleObject, idleObject.TargetMarkerNode)
; make sure marker is on navmesh
targetMarker.MoveToNearestNavmeshLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; E03 is where this quest is actually turned in
pDLC06E03.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; TODO -  Quest Reward

SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; allow assignment on prototype now
(Alias_SodaFountain.GetRef() as WorkshopObjectScript).bAllowPlayerAssignment = true

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC06E01 Auto Const Mandatory

Ammo Property pAmmoMissile Auto Const Mandatory

Scene Property pDLC06E02_500_SodaFountainBuilt Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockSodaStationExperimental Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockSodaStation Auto Const Mandatory

Quest Property pDLC06MQ02 Auto Const Mandatory

ReferenceAlias Property Alias_Clem Auto Const Mandatory

Quest Property pDLC06MQ03 Auto Const Mandatory

ObjectReference Property pDLC06VaultWorkshopRef Auto Const Mandatory

Quest Property pDLC06E03 Auto Const Mandatory

ReferenceAlias Property Alias_VaultResident Auto Const Mandatory

ReferenceAlias Property Alias_SodaFountain Auto Const Mandatory

ReferenceAlias Property Alias_SodaFountainTargetMarker Auto Const Mandatory
