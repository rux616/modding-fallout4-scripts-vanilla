;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06DialogueVault88_0100514C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Make Candy Two go away
Alias_CandidateTwo.GetActorref().Disable()
Alias_CandidateTwo.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Alias_CandidateTwo.GetActorRef().GetActorBase().SetEssential(FALSE)

WorkshopNPCScript aTemp = ( Alias_CandidateTwo.GetActorRef() as WorkshopNPCScript)
aTemp.SetCommandable(FALSE)
aTemp.SetAllowCaravan(FALSE)
aTemp.SetAllowMove(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
actor overseer = Alias_Overseer.GetActorRef()
if pDLC06AllowVaultAnywhere.GetValue() == 1
  overseer.Disable()
endif
; so body can clean up
Alias_Overseer.Clear()
WorkshopParentOverseer.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
DLC06OverseerDeskGreeting.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
pDLC06RecipeUnlockPowerbike.SetValue(1)
pDLC06RecipeUnlockSodaStation.SetValue(1)
pDLC06RecipeUnlockPhoropter.SetValue(1)
pDLC06RecipeUnlockSlotMachine.SetValue(1)

pDLC06AllowVaultAnywhere.SetValue(1)

pDLC06PrototypesUnlockedMessage.Show()

; allow base versions to be built if experiments haven't proceeded
if DLC06RecipeUnlockPhoropterExperimental.GetValue() == 0
	DLC06RecipeUnlockPhoropterExperimental.SetValue(-1)
endif
if DLC06RecipeUnlockPowerbikeExperimental.GetValue() == 0
	DLC06RecipeUnlockPowerbikeExperimental.SetValue(-1)
endif
if DLC06RecipeUnlockSlotMachineExperimental.GetValue() == 0
	DLC06RecipeUnlockSlotMachineExperimental.SetValue(-1)
endif
if DLC06RecipeUnlockSodaStationExperimental.GetValue() == 0
	DLC06RecipeUnlockSodaStationExperimental.SetValue(-1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_CandidateOne.GetActorRef().GetActorBase().SetEssential(FALSE)

WorkshopNPCScript aTemp = ( Alias_CandidateOne.GetActorRef() as WorkshopNPCScript)
aTemp.SetCommandable(FALSE)
aTemp.SetAllowCaravan(FALSE)
aTemp.SetAllowMove(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Make Candy One go away
Alias_CandidateOne.GetActorref().Disable()
Alias_CandidateOne.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Make Clem go away
Alias_Clem.GetActorref().Disable()
Alias_Clem.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8000_Item_00
Function Fragment_Stage_8000_Item_00()
;BEGIN CODE
Alias_Clem.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Clem.GetActorRef().GetActorBase().SetProtected(TRUE)
Alias_CandidateOne.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_CandidateOne.GetActorRef().GetActorBase().SetProtected(TRUE)
Alias_CandidateTwo.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_CandidateTwo.GetActorRef().GetActorBase().SetProtected(TRUE)
Alias_Overseer.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Overseer.GetActorRef().GetActorBase().SetProtected(TRUE)

; Make everyone proper citizens nows
WorkshopNPCScript aTemp = ( Alias_Clem.GetActorRef() as WorkshopNPCScript)
aTemp.SetCommandable(true)
aTemp.SetAllowCaravan(true)
aTemp.SetAllowMove(true)

aTemp = ( Alias_CandidateOne.GetActorRef() as WorkshopNPCScript)
aTemp.SetCommandable(true)
aTemp.SetAllowCaravan(true)
aTemp.SetAllowMove(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Remove the Overseer from the workshop, too
(pWorkshopParent as WorkshopParentScript).UnassignActor(Alias_Overseer.GetActorRef() as WorkshopNPCScript, TRUE)

; Close off all the quests
pDLC06E01.SetStage(9000)
pDLC06E02.SetStage(9000)
pDLC06E03.SetStage(9000)
pDLC06E04.SetStage(9000)
pDLC06MQ02.SetStage(9000)
pDLC06MQ03.SetStage(9000)
DLC06OverseerDeskGreeting.Stop()

; Make everyone unessential
SetStage(8000)

; player is overseer
DLC06WorkshopParent.SetPlayerOverseer()

; vault workshop - allow attacks now
DLC06WorkshopParent.VaultWorkshop.AllowAttacks = true

; add prototype if player doesn't already have
if GetStageDone(250) == false
	Alias_Overseer.GetRef().AddItem(Alias_Prototypes.GetRef())
	Alias_Prototypes.TryToEnable()
endif
; Overseer is leaving
SetStage(225)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_01
Function Fragment_Stage_9000_Item_01()
;BEGIN CODE
if Alias_Clem.GetRef().GetLinkedRef(WorkshopItemKeyword) == NONE
  SetStage(525)
endif
if Alias_CandidateTwo.GetRef().GetLinkedRef(WorkshopItemKeyword) == NONE
  SetStage(125)
endif
if Alias_CandidateOne.GetRef().GetLinkedRef(WorkshopItemKeyword) == NONE
  SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CandidateTwo Auto Const Mandatory

Quest Property pDLC06E01 Auto Const Mandatory

Quest Property pDLC06E02 Auto Const Mandatory

Quest Property pDLC06E03 Auto Const Mandatory

Quest Property PDLC06E04 Auto Const Mandatory

Quest Property pDLC06MQ02 Auto Const Mandatory

Quest Property pDLC06MQ03 Auto Const Mandatory

ReferenceAlias Property Alias_Overseer Auto Const Mandatory

GlobalVariable Property pDLC06RecipeUnlockPowerbike Auto Const Mandatory

GlobalVariable Property pDLC06RecipeUnlockSodaStation Auto Const Mandatory

GlobalVariable Property pDLC06RecipeUnlockPhoropter Auto Const Mandatory

GlobalVariable Property pDLC06RecipeUnlockSlotMachine Auto Const Mandatory

Message Property pDLC06PrototypesUnlockedMessage Auto Const Mandatory

Quest Property pWorkshopParent Auto Const Mandatory

ReferenceAlias Property Alias_CandidateOne Auto Const Mandatory

GlobalVariable Property pDLC06AllowVaultAnywhere Auto Const Mandatory

ReferenceAlias Property Alias_Clem Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockPhoropterExperimental Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockPowerbikeExperimental Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockSlotMachineExperimental Auto Const Mandatory

GlobalVariable Property DLC06RecipeUnlockSodaStationExperimental Auto Const Mandatory

Quest Property DLC06OverseerDeskGreeting Auto Const Mandatory

DLC06:DLC06WorkshopParent Property DLC06WorkshopParent Auto Const Mandatory

GlobalVariable Property DLC06CandidateOneLeave Auto Const Mandatory

GlobalVariable Property DLC06CandidateTwoLeave Auto Const Mandatory

Keyword Property WorkshopItemKeyword Auto Const Mandatory

ReferenceAlias Property Alias_Prototypes Auto Const Mandatory

ReferenceAlias Property WorkshopParentOverseer Auto Const
