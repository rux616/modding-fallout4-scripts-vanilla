;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRM01_0005FD90 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRM01Script
Quest __temp = self as Quest
RRM01Script kmyQuest = __temp as RRM01Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(50, FALSE)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(50)

; Let Drummer Boy know about the quest
;pRRQuestsAvailable.Mod(1)
;pRRQuestCarrington.SetValue(1)

; Make Low Road Franklin essential
Alias_LowRoadFranklin.GetActorRef().GetActorBase().SetEssential(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

; Drummer Boy no longer bothers PC
;pRRQuestsAvailable.Mod(-1)
;pRRQuestCarrington.SetValue(0)

; Make Old Man Stockton essential
Alias_OldManStockton.GetActorRef().GetActorBase().SetEssential()

; Make the dead drop sign appear
Alias_DeadDropMailbox.GetReference().GetLinkedRef(pRRSign).Enable()

;Fire tutorial event for "Player can fast travel from RRHQ"
Tutorial.SetStage(1940)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Failsafe - mark the dead drop as being picked up
SetStage(200)

; 89253 - Force a reset of all the raiders at the church
Alias_RVRaiders.ResetAll()

; Make the raiders appear now
Alias_RVRaiders.EnableAll()

; Disable the ghouls in the Church
pRRM01GhoulEnableMarker.Disable()

; Objectives
SetObjectiveFailed(100)          ; If you didn't get the Dead Drop, fail it
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; This is called from "RRM01RendezvousScript"

ObjectReference oSynth = Alias_H222.GetReference()
ObjectReference oOldManStockton = Alias_OldManStockton.GetReference()

; Enable H2-22
; TODO: Make sure player can't see the ports
oOldManStockton.MoveTo(pRRM01OldManAtRVMarker)
oSynth.Enable()
oSynth.IgnoreFriendlyHits()
Utility.Wait(1.0)
oSynth.MoveTo(pRRM01SynthAtRVMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(450)

; TODO: Make Old Man Stockton go home naturally
;Alias_OldManStockton.GetReference().MoveTo(pOldManStocktonHomeMarker)

; Low Road teleports into his spot
Alias_LowRoadFranklin.GetReference().MoveTo(pRRM01LowRoadAtRVMarker001)
Alias_LowRoadFranklin.GetActorRef().EvaluatePackage()

; Make Old Man Stockton non-essential
Alias_OldManStockton.GetActorRef().GetActorBase().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(450)
SetObjectiveDisplayed(500)

; Spawn the raiders that are coming
Alias_RaidersEnRoute.EnableAll()

; Run the escort scene
pRRM01_0500_FranklinEscort.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; Queue up Butcher's Bill 1
pRRR01a.SetStage(50)

;Make Ticonderoga Elevator Functional
(pElevatorObject as LoadElevatorPanelScript).MakeElevatorFunctional()

;Enable Map Marker for Ticon
pTiconderogaMapMarker.enable()

;Unlock Ticon Door
pTiconderogaStationDoor.setlocklevel(0)
pTiconderogaStationDoor.unlock()
pTiconerogaDoorBlocker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Complete objectives
CompleteAllObjectives()

; Low Road Franklin is no longer essential
Alias_LowRoadFranklin.GetActorRef().GetActorBase().SetEssential(FALSE)

; Give the player some caps
Game.GivePlayerCaps(180)
Game.GetPlayer().AddItem(pBobbyPin, 5)
Game.GetPlayer().AddItem(pLL_CombatRifle_Sniper)

; Give final XP
;Game.RewardPlayerXP(pXPFactionFinal.GetValue() as int)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
; Make the dead drop sign appear
Alias_DeadDropMailbox.GetReference().GetLinkedRef(pRRSign).Disable()

; Re-Enable the ghouls in the Church
pRRM01GhoulEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Disable H2-22
Alias_H222.GetActorRef().Disable()

; Fail objectives and end quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pRRM01OldManAtRVMarker Auto Const

ObjectReference Property pRRM01SynthAtRVMarker Auto Const

ReferenceAlias Property Alias_H222 Auto Const

ReferenceAlias Property Alias_OldManStockton Auto Const

Scene Property pRRM01_0400_H222Arrives Auto Const

ObjectReference Property pOldManStocktonHomeMarker Auto Const

ObjectReference Property pRRM01LowRoadAtRVMarker001 Auto Const

ReferenceAlias Property Alias_LowRoadFranklin Auto Const

Quest Property pRRR01a Auto Const

Scene Property pRRM01_0500_FranklinEscort Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestCarrington Auto Const

RefCollectionAlias Property Alias_RVRaiders Auto Const

ObjectReference Property pElevatorObject Auto Const

ObjectReference Property pTiconderogaMapMarker Auto Const

ObjectReference Property pTiconderogaStationDoor Auto Const

ObjectReference Property pTiconerogaDoorBlocker Auto Const

ReferenceAlias Property Alias_DeadDropMailbox Auto Const

Keyword Property pRRSign Auto Const

ObjectReference Property pRRM01GhoulEnableMarker Auto Const

MiscObject Property pBobbyPin Auto Const

LeveledItem Property pLL_CombatRifle_Sniper Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

Quest Property Tutorial Auto Const

RefCollectionAlias Property Alias_RaidersEnRoute Auto Const
