;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestFollowerDialogue_00027411 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Bring MacCready to Friendship with Player to test
Game.GetPlayer().MoveTo(COMMacQuestAStart)
utility.wait(2)
Alias_MacCreadyAlias.GetActorRef().MoveTo(Game.GetPlayer())
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
COMMacCreadyGoodneighborStart.Start()
Alias_MacCreadyAlias.GetActorRef().RemoveFromFaction(CrimeGoodneighbor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
COMMacCready.SetStage(80)
Alias_MacCreadyAlias.GetActorReference().SetAvailableToBeCompanion()
Alias_MacCreadyAlias.GetActorRef().SetCrimeFaction(CrimeGoodneighbor)

;Remove Caps
Game.GetPlayer().RemoveItem(Caps001,250)

;complete the misc objective to talk to him
FFGoodneighbor06.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
COMMacCready.SetStage(80)
Alias_MacCreadyAlias.GetActorReference().SetAvailableToBeCompanion()
Alias_MacCreadyAlias.GetActorRef().SetCrimeFaction(CrimeGoodneighbor)

;Remove Caps
Game.GetPlayer().RemoveItem(Caps001,200)

;complete the misc objective to talk to him
FFGoodneighbor06.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
COMMacCready.SetStage(80)
Alias_MacCreadyAlias.GetActorReference().SetAvailableToBeCompanion()
Alias_MacCreadyAlias.GetActorRef().SetCrimeFaction(CrimeGoodneighbor)

;Remove Caps
Game.GetPlayer().RemoveItem(Caps001,100)

;complete the misc objective to talk to him
FFGoodneighbor06.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)

;MassPike Added to Map
MassPikeInterchangeMapMarkerRef.AddToMap()

;Reset Encounter Zone
MassPikeInterchangeZone.Reset()

;Gunner Enemy Setups
Alias_GunnerBarnesAlias.GetActorRef().MoveTo(COMMacBarnesMarker)
Alias_GunnerBarnesAlias.GetActorRef().RemoveFromFaction(SettlementGoodneighbor)
Alias_GunnerBarnesAlias.GetActorRef().RemoveFromFaction(CrimeGoodneighbor)
Alias_GunnerBarnesAlias.GetActorRef().AddToFaction(GunnerFaction)
GunnerBarnes.SetEssential(false)
GunnerBarnes.SetProtected(true)
Alias_GunnerWinlockAlias.GetActorRef().MoveTo(COMMacWinlockMarker)
Alias_GunnerWinlockAlias.GetActorRef().RemoveFromFaction(SettlementGoodneighbor)
Alias_GunnerWinlockAlias.GetActorRef().RemoveFromFaction(CrimeGoodneighbor)
Alias_GunnerWinlockAlias.GetActorRef().AddToFaction(GunnerFaction)
GunnerWinlock.SetEssential(false)
GunnerWinlock.SetProtected(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Enable Targets
Alias_GunnerBarnesAlias.GetActorRef().Enable()
Alias_GunnerBarnesAlias.GetActorRef().EvaluatePackage()
Alias_GunnerWinlockAlias.GetActorRef().Enable()
Alias_GunnerWinlockAlias.GetActorRef().EvaluatePackage()

;Assign targets
COMMacCreadyQuestAScene01.Start()
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)

COMMacCreadyGunnersDead.SetValue(COMMacCreadyGunnersDead.GetValue() + 1)

if COMMacCreadyGunnersDead.GetValue() == 2
SetStage(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)

COMMacCreadyGunnersDead.SetValue(COMMacCreadyGunnersDead.GetValue() + 1)

if COMMacCreadyGunnersDead.GetValue() == 2
SetStage(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Affinity Hold Released
MacCready_AffinityCondition_PlayerCompletedQuestA.SetValue(1)
SetObjectiveDisplayed(50,1)

;Return Caps
if GetStageDone(30) == 1
Game.GetPlayer().AddItem(Caps001,250)
elseif GetStageDone(40) == 1
Game.GetPlayer().AddItem(Caps001,200)
elseif GetStageDone(50) == 1
Game.GetPlayer().AddItem(Caps001,100)
endif

;Objectives
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Player reached Confidant with MacCready
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
MedTekResearchMapMarker.AddToMap()

;Reset Encounter Zone
MedTekResearchZone.Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
COMMacCreadyQuestBScene01.Start()
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
COMMacCreadyQuestBScene02.Start()
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
COMMacCreadyQuestBScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DN066_ExecTermPassword)
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
COMMacCreadyQuestBScene04.Start()
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
COMMacCreadyQuestBScene05.Start()
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_COMMacBDaisy.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(120,1)
SetObjectiveDisplayed(130,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130,1)
;Remove Prevent Sample
Game.GetPlayer().RemoveItem(Alias_COMMacBCure.GetRef())
;Affinity Hold Released
MacCready_AffinityCondition_PlayerCompletedQuestB.SetValue(1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Companion hit Hatred or Essential was removed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FollowersScript Property Followers Auto Const

ReferenceAlias Property Alias_MacCreadyAlias Auto Const

GlobalVariable Property pCompMacCready Auto Const

ReferenceAlias Property Alias_GunnerWinlockAlias Auto Const

ReferenceAlias Property Alias_GunnerBarnesAlias Auto Const

Scene Property COMMacCreadyGoodneighborStart Auto Const

Quest Property FFGoodneighbor06 Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property COMMacCreadyGunnersDead Auto Const

Scene Property COMMacCreadyQuestAScene01 Auto Const

Scene Property COMMacCreadyQuestBScene01 Auto Const

Scene Property COMMacCreadyQuestBScene02 Auto Const

Scene Property COMMacCreadyQuestBScene03 Auto Const

Scene Property COMMacCreadyQuestBScene04 Auto Const

Scene Property COMMacCreadyQuestBScene05 Auto Const

Key Property DN066_ExecTermPassword Auto Const

ReferenceAlias Property Alias_COMMacBDaisy Auto Const

Quest Property COMMacCready Auto Const

ObjectReference Property COMMacWinlockMarker Auto Const

ObjectReference Property COMMacBarnesMarker Auto Const

GlobalVariable Property MacCready_AffinityCondition_PlayerCompletedQuestA Auto Const

GlobalVariable Property MacCready_AffinityCondition_PlayerCompletedQuestB Auto Const

Faction Property SettlementGoodneighbor Auto Const

Faction Property GunnerFaction Auto Const

ActorBase Property GunnerBarnes Auto Const

ActorBase Property GunnerWinlock Auto Const

ObjectReference Property MassPikeInterchangeMapMarkerRef Auto Const

ObjectReference Property COMMacQuestAStart Auto Const

EncounterZone Property MassPikeInterchangeZone Auto Const

EncounterZone Property MedTekResearchZone Auto Const

ObjectReference Property MedTekResearchMapMarker Auto Const

Faction Property CrimeGoodneighbor Auto Const

ReferenceAlias Property Alias_COMMacBCure Auto Const Mandatory
