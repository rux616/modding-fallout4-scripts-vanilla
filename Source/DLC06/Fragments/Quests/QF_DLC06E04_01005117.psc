;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06E04_01005117 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC06E03.SetStage(0)
pDLC06E03.SetStage(500)
pDLC06E02.SetStage(900)

SetStage(50)
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

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06experimentquestscript
Quest __temp = self as Quest
dlc06:dlc06experimentquestscript kmyQuest = __temp as dlc06:dlc06experimentquestscript
;END AUTOCAST
;BEGIN CODE
; End the previous quest
pDLC06E03.SetStage(600)

kmyQuest.RegisterForWorkshopEvents(true)

; unlock recipe
DLC06RecipeUnlockSlotMachine.SetValue(1)

; objective to build slot machine
SetObjectiveDisplayed(100)
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
;BEGIN AUTOCAST TYPE dlc06:dlc06e04script
Quest __temp = self as Quest
dlc06:dlc06e04script kmyQuest = __temp as dlc06:dlc06e04script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Wait for an hour timer
kmyQuest.StartWaitTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
DLC06RecipeUnlockSlotMachineExperimental.SetValue(1)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
DLC06RecipeUnlockSlotMachineExperimental.SetValue(2)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
DLC06RecipeUnlockSlotMachineExperimental.SetValue(3)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06experimentquestscript
Quest __temp = self as Quest
dlc06:dlc06experimentquestscript kmyQuest = __temp as dlc06:dlc06experimentquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
kmyQuest.RegisterForWorkshopEvents(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

; Now you can build with Vault kit anywhere
pDLC06AllowVaultAnywhere.SetValue(1)

; Get the final reward
ObjectReference oItem = Game.GetPlayer().PlaceAtMe(pDLC06Vault88Reward)
oItem.AttachMod(pmod_Legendary_Armor_LessDMGGhouls)
Game.GetPlayer().AddItem(oItem)

; End the quest
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; Rename the Overseer
Alias_OverseerRename.ForceRefTo(Alias_Overseer.GetActorRef())

; player is overseer
DLC06WorkshopParent.SetPlayerOverseer()

; Remove the Overseer from the workshop, too
(pWorkshopParent as WorkshopParentScript).UnassignActor(Alias_Overseer.GetActorRef() as WorkshopNPCScript, TRUE)

; Have the Overseer start leaving
pDLC06DialogueVault88.SetStage(225)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; allow assignment on prototype now
(Alias_SlotMachine.GetRef() as WorkshopObjectScript).bAllowPlayerAssignment = true

DLC06OverseerDeskGreeting.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8000_Item_00
Function Fragment_Stage_8000_Item_00()
;BEGIN CODE
pDLC06DialogueVault88.SetStage(8000)
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

Quest Property pDLC06E03 Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockSlotMachine Auto Const Mandatory

ReferenceAlias Property Alias_OverseerRename Auto Const Mandatory

ReferenceAlias Property Alias_Overseer Auto Const Mandatory

GlobalVariable Property pDLC06PlayerIsOverseer Auto Const Mandatory

Quest Property pWorkshopParent Auto Const Mandatory

Quest Property pDLC06DialogueVault88 Auto Const Mandatory

Quest Property pDLC06MQ02 Auto Const Mandatory

Quest Property pDLC06MQ03 Auto Const Mandatory

ReferenceAlias Property Alias_Clem Auto Const Mandatory

ObjectReference Property pDLC06VaultWorkshopRef Auto Const Mandatory

GlobalVariable Property pDLC06AllowVaultAnywhere Auto Const Mandatory

Quest Property pDLC06E02 Auto Const Mandatory

ReferenceAlias Property Alias_SlotMachine Auto Const Mandatory

Quest Property DLC06OverseerDeskGreeting Auto Const Mandatory

DLC06:DLC06WorkshopParent Property DLC06WorkshopParent Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockSlotMachineExperimental Auto Const Mandatory

LeveledItem Property pDLC06Vault88Reward Auto Const Mandatory

ObjectMod Property pmod_Legendary_Armor_LessDMGGhouls Auto Const Mandatory
