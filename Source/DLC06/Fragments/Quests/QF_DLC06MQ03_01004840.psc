;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06MQ03_01004840 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pDLC06MQ02.SetStage(600)

(pDLC06VaultWorkshopRef as WorkshopScript).SetOwnedByPlayer(TRUE)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq03script
Quest __temp = self as Quest
dlc06:dlc06mq03script kmyQuest = __temp as dlc06:dlc06mq03script
;END AUTOCAST
;BEGIN CODE
SetActive()
; update ghouls collection with Julian - only if alive
actor julian = Alias_FeralGhoulScene.GetActorRef()
if julian.IsDead() == false
  Alias_FeralGhouls.AddRef(julian)
  ; doesn't help anybody else
  julian.SetValue(Assistance, 0)
endif
; if all ghouls are already dead, set stage
kmyQuest.CheckFeralGhoulStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Debug.Trace("DLC06MQ03 - 11 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Debug.Trace("DLC06MQ03 - 12 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Debug.Trace("DLC06MQ03 - 13 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Debug.Trace("DLC06MQ03 - 14 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Debug.Trace("DLC06MQ03 - 15 Set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
pDLC06MQ02.SetStage(575)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq03script
Quest __temp = self as Quest
dlc06:dlc06mq03script kmyQuest = __temp as dlc06:dlc06mq03script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(50)
SetObjectiveCompleted(75)
SetObjectiveDisplayed(100)

kmyQuest.RegisterForWorkshopEvents(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
if GetStageDone(150) && GetStageDone(100) == false
  SetObjectiveDisplayed(75)
endif
; remove Overseer from CaptiveFaction
Alias_Overseer.GetActorRef().RemoveFromFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; Complete MQ02
pDLC06MQ02.SetStage(600)

SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq03script
Quest __temp = self as Quest
dlc06:dlc06mq03script kmyQuest = __temp as dlc06:dlc06mq03script
;END AUTOCAST
;BEGIN CODE
; if all ghouls are already dead, set stage
kmyQuest.CheckFeralGhoulStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
Alias_FeralGhoulScene.GetActorref().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Alias_FeralGhoulScene.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
; objective to kill ferals if they aren't already dead
if GetStageDone(110) == false
  SetObjectiveDisplayed(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq03script
Quest __temp = self as Quest
dlc06:dlc06mq03script kmyQuest = __temp as dlc06:dlc06mq03script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(50)

; if all ghouls are already dead, set stage
kmyQuest.CheckFeralGhoulStatus()

if GetStageDone(110)
  SetObjectiveDisplayed(75)
else
  SetStage(145) ; make sure player gets feral ghouls objective
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pPreWarMoney, 115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
; Get the Vault-Tec Prototype schematics
Game.GetPlayer().AddItem(pDLC06VaultTecPrototypes)

; Kick out from all the quests
; ** This quest also handles the Overseer packaging away and disappearing when appropriate
pDLC06DialogueVault88.SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

DLC06MQ03_ReactDesk.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq03script
Quest __temp = self as Quest
dlc06:dlc06mq03script kmyQuest = __temp as dlc06:dlc06mq03script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
kmyQuest.CheckRadioBeaconStatus()
; blocking greetings for missing desk now valid
DLC06OverseerDeskGreeting.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE dlc06:dlc06mq03script
Quest __temp = self as Quest
dlc06:dlc06mq03script kmyQuest = __temp as dlc06:dlc06mq03script
;END AUTOCAST
;BEGIN CODE
if ( GetStageDone(300) )
  SetObjectiveCompleted(300)
  SetObjectiveDisplayed(450)
endif

pDLC06MQ04.SetStage(50)

kmyQuest.StartInterviewTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(450)
SetObjectiveDisplayed(500)

; Enable all the candidates to arrive
Alias_CandidateOne.GetActorRef().Enable()
Alias_CandidateTwo.GetActorRef().Enable()
Alias_Clem.GetActorRef().Enable()

; start reaction scene
DLC06MQ03_ReactCandidates.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; add as workshop NPC
WorkshopScript workshopRef = Alias_workshop.GetRef() as WorkshopScript
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_CandidateOne.GetActorRef(), workshopRef.GetWorkshopID(), false) ; don't auto assign
Alias_CandidateOne.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Queues up Candy 2 to leave forever
Alias_CandidateTwo.GetActorRef().GetActorBase().SetEssential(FALSE)

Alias_CandidateTwo.Clear()
pDLC06DialogueVault88.SetStage(125)
Game.StopDialogueCamera()

SetStage(630)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
; add as workshop NPCs
Alias_CandidateTwo.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_CandidateTwo.GetActorRef().GetActorBase().SetProtected(FALSE)

WorkshopScript workshopRef = Alias_workshop.GetRef() as WorkshopScript
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_CandidateTwo.GetActorRef(), workshopRef.GetWorkshopID(), false) ; don't auto assign
Game.StopDialogueCamera()

SetStage(630)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; Start up the next quest
DLC06E01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
CompleteAllObjectives()
SetObjectiveDisplayed(700)

; Now make Clem have a proper name
Alias_ClemName.ForceRefTo(Alias_Clem.GetActorRef())

; add as workshop NPC
WorkshopScript workshopRef = Alias_workshop.GetRef() as WorkshopScript
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Clem.GetActorRef(), workshopRef.GetWorkshopID(), false) ; don't auto assign

; Start up the next quest
DLC06E01.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

; vault workshop - allow attacks now
WorkshopScript workshopref = Alias_Workshop.GetRef() as WorkshopScript
workshopRef.AllowAttacks = true

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

Quest Property pDLC06MQ02 Auto Const Mandatory

ReferenceAlias Property Alias_CandidateOne Auto Const Mandatory

ReferenceAlias Property Alias_CandidateTwo Auto Const Mandatory

ReferenceAlias Property Alias_Clem Auto Const Mandatory

ReferenceAlias Property Alias_ClemName Auto Const Mandatory

Quest Property pDLC06MQ04 Auto Const Mandatory

workshopparentscript Property WorkshopParent Auto Const Mandatory

ReferenceAlias Property Alias_Workshop Auto Const Mandatory

Scene Property pDLC06MQ03_125a_WalkNTalk Auto Const Mandatory

Quest Property pDLC06DialogueVault88 Auto Const Mandatory

Book Property pDLC06VaultTecPrototypes Auto Const Mandatory

ObjectReference Property pDLC06VaultWorkshopRef Auto Const Mandatory

ReferenceAlias Property Alias_FeralGhoulScene Auto Const Mandatory

RefCollectionAlias Property Alias_FeralGhouls Auto Const Mandatory

ActorValue Property Assistance Auto Const Mandatory

Scene Property DLC06MQ03_125b_WalkNTalk02 Auto Const Mandatory

Quest Property DLC06E01 Auto Const Mandatory

Scene Property DLC06MQ03_ReactDesk Auto Const Mandatory

Scene Property DLC06MQ03_ReactCandidates Auto Const Mandatory

MiscObject Property pPrewarMoney Auto Const Mandatory

Quest Property DLC06OverseerDeskGreeting Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

ReferenceAlias Property Alias_Overseer Auto Const Mandatory
