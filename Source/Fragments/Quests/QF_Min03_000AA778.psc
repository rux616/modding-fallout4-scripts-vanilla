;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Min03_000AA778 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
;clear out mirelurks
DN133.SetStage(10)
Min02.SetStage(0)
Min02.SetStage(50)
Min02.setStage(500)
Min02.setStage(570)
Min02.setStage(600)
Min02.SetStage(1000)
;bypass waiting for Ronnie to show up
SetStage(5)

; start receiving workshop build events
kmyQuest.RegisterForWorkshopEvents()
; make sure workshop is player owned
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)

; repair radio station and force to be always on
MinutemenCentralQuest.UpdateRadioStationStatus(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.BypassInitialize()
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_RonnieShaw.TryToEnable()
; generic Minutemen also
Min03GenericMinutemenEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; set active
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
if Game.IsPlayerListening(kmyQuest.MinutemenCentralQuest.MinutemenRadioFrequency)
	setObjectiveDisplayed(10)
	SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
; restart main loop
MinutemenCentralQuest.UpdateRadioStationStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
setObjectiveDisplayed(10)
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
  setObjectiveCompleted(10)
  setObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
; register for stage set events on brawl quest
kmyQuest.RegisterForRemoteEvent(GenericBrawl, "OnStageSet")
; start brawl
GenericBrawlStart.SendStoryEvent(akRef1 = Alias_RonnieShaw.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
setObjectiveDisplayed(20)
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
setObjectiveCompleted(10)
setObjectiveCompleted(20)
setObjectiveDisplayed(30)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min03ShawKnowsTheWayAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Min03RonnieArmoryScene01.Stop()
Min03RonnieSearchGeneralsOfficeScene.Stop()
utility.wait(1)
Min03RonnieWallCleared.Start()
Min03_MusicReveal.Activate(Min03_MusicReveal)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
;If the sentry was already killed, jump ahead
if DN133.GetStageDone(700)
	setStage(470)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
Min03SecurityTerminalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
;Triggered through scene
Min03_PasswordEntered.setValue(1)
Default2StateActivator doorScript = Alias_SecurityDoor.getReference() as Default2StateActivator
doorScript.SetOpen(true)
Min03_SecurityDoorOpen.setValue(1)
Alias_SecretTunnelTerminal.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; enable load door on exterior side - initially disabled to prevent NPCs from using it when unloaded
TheCastleWestTo01.Enable()
Min03RonnieInsideArmoryDoor.Start()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min03EnteredArmoryAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Ronnie opens armory door
Alias_ArmoryDoor.GetRef().SetOpen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
Alias_ArmoryDoor.GetReference().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckArmoryState()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

if GetStageDone(550) == 0
	SetObjectiveDisplayed(60)
endif
if GetStageDone(560) == 0
	SetObjectiveDisplayed(65)
endif
if GetStageDone(550) == 1 && GetStageDone(560) == 1
	SetStage(570)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
alias_ArtillerySchematic.getRef().disable()
MinCanBuildArtillery.SetValue(1)
SetObjectiveCompleted(60)
if GetStageDone(560)
  setStage(570)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
SetObjectiveCompleted(65)
if GetStageDone(550)
  setStage(570)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
kmyQuest.InitializeArtilleryObjective()
MinCanBuildArtillery.SetValue(1)
; start receiving workshop build events
kmyQuest.RegisterForWorkshopEvents()
; make Ronnie a workshop NPC
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_RonnieShaw.GetActorRef(), (Alias_Workshop.GetRef() as WorkshopScript).GetWorkshopID(), bAutoAssign = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)

SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
; turn on artillery test fire
MinArtilleryTestFire.SetValue(1)
; turn on artillery support
MinArtilleryCanUse.SetValue(1)

SetObjectiveCompleted(90)
SetObjectiveCompleted(95)
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(101)
; run timer for radio objective
kmyQuest.StartRadioObjectiveTimer()
kmyQuest.UpdateArtilleryObjective()

; enable stage 810 trigger
Min03SetStage810.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
SetObjectiveCompleted(101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(100)
kmyQuest.UpdateArtilleryObjective()
Min03RadioTestFireScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN AUTOCAST TYPE Min03Script
Quest __temp = self as Quest
Min03Script kmyQuest = __temp as Min03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateArtilleryObjective()
; make sure to restart normal radio
kmyQuest.MinutemenCentralQuest.UpdateRadioStationStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
setObjectiveCompleted(101)
setObjectiveCompleted(110)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min03ArtilleryFiredAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
; test fire done
MinArtilleryTestFire.SetValue(0)
setstage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)

; assign Ronnie to armory
WorkshopNPCScript ronnie = Alias_RonnieShaw.GetActorRef() as WorkshopNPCScript
WorkshopObjectScript armory =  (Alias_ArmoryVendorFurniture.GetRef() as WorkshopObjectScript)
debug.trace(self + " armory =" + armory )
debug.trace(self + " MIN03: assigning Ronnie " + ronnie + " to armory " + armory)
WorkshopParent.AssignActorToObjectPUBLIC(ronnie, armory)
; remove from Min03 faction so she stays in armory
ronnie.RemoveFromFaction(Min03RonnieSandboxFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
; update recruitment quests
MinutemenCentralQuest.SetProgress(5)
CompleteAllObjectives()
Game.AddAchievement(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; make sure objectives are completed
SetStage(980)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RadioTransmitter Auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

ReferenceAlias Property Alias_PrestonGarvey Auto Const

Quest Property Min02 Auto Const

ReferenceAlias Property Alias_RonnieShaw Auto Const

Keyword Property GenericBrawlStart Auto Const

Quest Property GenericBrawl Auto Const

ReferenceAlias Property Alias_SecretTunnelLoadDoor Auto Const

ReferenceAlias Property Alias_ArmoryDoor Auto Const

GlobalVariable Property MinCanBuildArtillery Auto Const

ReferenceAlias Property Alias_CastleRadioTransmitter Auto Const

ReferenceAlias Property Alias_MinutemenRadioAnnouncer Auto Const

workshopparentscript Property WorkshopParent Auto Const

Quest Property DN133 Auto Const

Scene Property Min03RonnieWallCleared Auto Const

Scene Property Min03RonnieSearchGeneralsOfficeScene Auto Const

Scene Property Min03RonnieArmoryScene01 Auto Const



Scene Property Min03SecurityTerminalScene Auto Const

Scene Property Min03RonnieInsideArmoryDoor Auto Const

ReferenceAlias Property Alias_SecurityDoor Auto Const

GlobalVariable Property Min03_PasswordEntered Auto Const

GlobalVariable Property Min03_SecurityDoorOpen Auto Const

ReferenceAlias Property Alias_ArtillerySchematic Auto Const

Ammo Property AmmoFlareSignal01 Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

Scene Property Min03RadioTestFireScene01 Auto Const

Scene Property Min03RonnieBuildArtillery Auto Const

ObjectReference Property Min03GenericMinutemenEnableMarker Auto Const

GlobalVariable Property MinArtilleryCanUse Auto Const

GlobalVariable Property MinArtilleryTestFire Auto Const

GlobalVariable Property XPFactionSmall Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ObjectReference Property TheCastleWestTo01 Auto Const

ReferenceAlias Property Alias_ArmoryVendorFurniture Auto Const

ReferenceAlias Property Alias_SecretTunnelTerminal Auto Const

Faction Property Min03RonnieSandboxFaction Auto Const

ObjectReference Property Min03_MusicReveal Auto Const

ActorValue Property COMQC_Min03ShawKnowsTheWayAV Auto Const

ActorValue Property COMQC_Min03EnteredArmoryAV Auto Const

ActorValue Property COMQC_Min03ArtilleryFiredAV Auto Const

ObjectReference Property Min03SetStage810 Auto Const Mandatory
