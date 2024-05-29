;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06E03_01004F72 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC06E02.SetStage(0)
pDLC06E02.SetStage(700)
pDLC06E01.SetStage(1100)

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
; Finish the previous quest
pDLC06E02.SetStage(800)

kmyQuest.RegisterForWorkshopEvents(true)

; unlock recipe
DLC06RecipeUnlockPhoropter.SetValue(1)

; Objectives
SetObjectiveDisplayed(100)

; start MQ04 now if it isn't already
DLC06MQ04.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE DLC06:DLC06E03Script
Quest __temp = self as Quest
DLC06:DLC06E03Script kmyQuest = __temp as DLC06:DLC06E03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckForNuclearMaterial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
DLC06RecipeUnlockPhoropterExperimental.SetValue(1)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
DLC06RecipeUnlockPhoropterExperimental.SetValue(2)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
DLC06RecipeUnlockPhoropterExperimental.SetValue(3)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Alias_Phoropter.GetRef().SetActorRefOwner(Alias_CandidateOne.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
DLC06OBJPhoropterRadBlast.Play(alias_Phoropter.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

; set ownership back to Clem
Alias_Phoropter.GetRef().SetActorRefOwner(Alias_Clem.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Start the final quest
pDLC06E04.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
SetStage(500)

; Make Candy One not a settler any more
pWorkshopParent.UnassignActor(Alias_CandidateOne.GetActorRef() as WorkshopNPCScript, TRUE)

; Now Candy One is done with this quest
Alias_CandidateOne.Clear()

; Queues up Candy One to leave
pDLC06DialogueVault88.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)

; End quest
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; allow assignment on prototype now
(Alias_Phoropter.GetRef() as WorkshopObjectScript).bAllowPlayerAssignment = true

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

Quest Property pDLC06E02 Auto Const Mandatory

ReferenceAlias Property Alias_Clem Auto Const Mandatory

ReferenceAlias Property Alias_CandidateOne Auto Const Mandatory

ObjectReference Property pDLC06VaultWorkshopRef Auto Const Mandatory

Quest Property pDLC06MQ02 Auto Const Mandatory

Quest Property pDLC06MQ03 Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockPhoropter Auto Const Mandatory

Quest Property DLC06MQ04 Auto Const Mandatory

Quest Property PDLC06E04 Auto Const Mandatory

Quest Property pDLC06DialogueVault88 Auto Const Mandatory

workshopparentscript Property pWorkshopParent Auto Const Mandatory

Quest Property pDLC06E01 Auto Const Mandatory

ReferenceAlias Property Alias_Phoropter Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockPhoropterExperimental Auto Const Mandatory

Sound Property DLC06OBJPhoropterRadBlast Auto Const Mandatory
