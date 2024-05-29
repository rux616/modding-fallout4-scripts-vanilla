;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06E01_01004A7E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC06MQ03.SetStage(0)
pDLC06MQ03.SetStage(100)
pDLC06MQ03.SetStage(400)
pDLC06MQ03.SetStage(450)
pDLC06MQ03.SetStage(500)
pDLC06MQ03.SetStage(600)
pDLC06MQ03.SetStage(700)
pDLC06MQ03.SetStage(800)
pDLC06MQ02.SetStage(600)

SetStage(100)
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

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06E01Script
Quest __temp = self as Quest
DLC06:DLC06E01Script kmyQuest = __temp as DLC06:DLC06E01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(150)

; respawn vault suits in container
(Alias_VaultSuitContainer.GetRef() as DLC06:RefillInventoryOnUnloadScript).RefreshInventory()

kmyQuest.CheckForVaultSuit()

; End the previous quest
pDLC06MQ03.SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06experimentquestscript
Quest __temp = self as Quest
dlc06:dlc06experimentquestscript kmyQuest = __temp as dlc06:dlc06experimentquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

kmyQuest.RegisterForWorkshopEvents(true)

; Flag that you have access to the Power Cycle 1000
pDLC06RecipeUnlockPowerbike.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN AUTOCAST TYPE DLC06:DLC06OverseerDeskTrackingScript
Quest __temp = self as Quest
DLC06:DLC06OverseerDeskTrackingScript kmyQuest = __temp as DLC06:DLC06OverseerDeskTrackingScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForWorkshopEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

if ( GetStageDone(500) )
  SetStage(550)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06E01Script
Quest __temp = self as Quest
DLC06:DLC06E01Script kmyQuest = __temp as DLC06:DLC06E01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Start a timer
kmyQuest.StartWaitTimer(500)

if ( GetStageDone(400) )
  SetStage(550)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)

; Clem reacts to experiment choices
pDLC06E01_550_ClemReactsToExperiment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06E01Script
Quest __temp = self as Quest
DLC06:DLC06E01Script kmyQuest = __temp as DLC06:DLC06E01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

ObjectReference bike = Alias_PowerCycle1000.GetRef()
; make bike unscrappable for now
bike.AddKeyword(UnscrappableObject)

; blow everything up
kmyQuest.DamageAllGenerators()
bike.DamageObject(9999)

; start repair generator timer
kmyQuest.StartWaitTimer(800)

; stop bike animation
bike.PlayAnimation("furnitureExitSlave")

; move repair marker to bike (since effect shader causes visible movement of QT on bike)
Alias_RepairTargetMarker.GetRef().MoveTo(bike)

setStage(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
alias_overseer.GetActorRef().EvaluatePackage()
alias_clem.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

ObjectReference bike = Alias_PowerCycle1000.GetRef()
bike.RemoveKeyword(UnscrappableObject)

SetStage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)

if ( GetStageDone(800) )
  SetStage(950)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06E01Script
Quest __temp = self as Quest
DLC06:DLC06E01Script kmyQuest = __temp as DLC06:DLC06E01Script
;END AUTOCAST
;BEGIN CODE
; Now just skip to the ending
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06experimentquestscript
Quest __temp = self as Quest
dlc06:dlc06experimentquestscript kmyQuest = __temp as dlc06:dlc06experimentquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

kmyQuest.RegisterForWorkshopEvents(false)

; Queue up E02 to end this quest (and start the next)
pDLC06E02.SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN AUTOCAST TYPE DLC06:DLC06E01Script
Quest __temp = self as Quest
DLC06:DLC06E01Script kmyQuest = __temp as DLC06:DLC06E01Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.MainGeneratorRef.Repair()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; set correct value for "real" powerbike
if GetStageDone(510)
  DLC06RecipeUnlockPowerbikeExperimental.SetValue(1)
elseif GetStageDone(520)
  DLC06RecipeUnlockPowerbikeExperimental.SetValue(2)
else
  DLC06RecipeUnlockPowerbikeExperimental.SetValue(3)
endif

; allow assignment on prototype now
(Alias_PowerCycle1000.GetRef() as WorkshopObjectScript).bAllowPlayerAssignment = true

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06E01Script
Quest __temp = self as Quest
DLC06:DLC06E01Script kmyQuest = __temp as DLC06:DLC06E01Script
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.MainGeneratorRef.Repair() ; failsafe
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC06RecipeUnlockPowerbike Auto Const Mandatory

Quest Property pDLC06MQ02 Auto Const Mandatory

Quest Property pDLC06MQ03 Auto Const Mandatory

ObjectReference Property pDLC06VaultWorkshopRef Auto Const Mandatory

ReferenceAlias Property Alias_Clem Auto Const Mandatory

Scene Property pDLC06E01_550_ClemReactsToExperiment Auto Const Mandatory

Quest Property pDLC06E02 Auto Const Mandatory

ReferenceAlias Property Alias_PowerCycle1000 Auto Const Mandatory

MiscObject Property pPrewarMoney Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockPowerbikeExperimental Auto Const Mandatory

Quest Property pDLC06MQ01 Auto Const Mandatory

ReferenceAlias Property Alias_VaultSuitContainer Auto Const Mandatory

ReferenceAlias Property Alias_Overseer Auto Const Mandatory

Keyword Property UnscrappableObject Auto Const Mandatory

ReferenceAlias Property Alias_RepairTargetMarker Auto Const Mandatory
