;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR301_0007CC61 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE rr301script
Quest __temp = self as Quest
rr301script kmyQuest = __temp as rr301script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Queuing up the quest
pRR101.SetStage(1100)
pRR102.SetStage(800)
pRR102.SetStage(900)
pRR102.SetStage(1000)
pRR301.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Drummer Boy bothers PC
pRRQuestsAvailable.Mod(1)
pRRQuestDesdemona.SetValue(1)

;Activate Ticonderoga Station Elevator
(pElevatorObject as LoadElevatorPanelScript).MakeElevatorFunctional()

; Disable H2-22
Alias_H222.GetActorRef().Disable()

;Enable Map Marker
pTiconderogaMapMarker.Enable()

;Unlock Ticon Door
pTiconderogaStationDoor.setlocklevel(0)
pTiconderogaStationDoor.unlock()
pTiconerogaDoorBlocker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Close off the scripting checking to see if Dez is available to chat
(pDialogueRailroad as DialogueRailroadScript).bDezBusyWithMQ = 2

; Some chit chat between Dez and Glory after the player's conversation
pRR301_110_Post_Intro_Chatter.Start()

; Drummer Boy no longer bothers PC
pRRQuestsAvailable.Mod(-1)
pRRQuestDesdemona.SetValue(0)

; Set up the objectives
SetObjectiveDisplayed(100)

; Change the state of Ticonderoga
; Disables everyone from before, enables all the synths
pTiconderogaEncounterEnableMarker.Enable()

; Port Low Road to his death spot, die die ide
actor aTarg = Alias_LowRoadFranklin.GetActorRef()
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.GetActorBase().SetProtected(FALSE)
aTarg.MoveTo(pRR301DeadLowRoadMarker)
Utility.Wait(0.1)
aTarg.Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;Deactivate Elevator
pTiconElevatorLoadDoorEnableMarker.Enable()
PTiconElevatorLoadDoor_Interior001.setOpen()
(pElevatorObject as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectInsidePanel as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectInt as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectIntInsidePanel as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
pRR301ElevatorNavcut.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Deactivate Elevator
(pElevatorObject as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectInsidePanel as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectInt as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectIntInsidePanel as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
pTiconElevatorLoadDoorEnableMarker.Enable()
pRR301ElevatorNavcut.enable()

; Set up the objectives
SetObjectiveDisplayed(200)
SetObjectiveCompleted(100)

; Enable the outside Synths
pRR301OutsideSynthsEnableMarker.Enable()

; Get X9 in his package
Alias_X927.GetActorRef().EvaluatePackage()

utility.wait(1)
pRR301LightsEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Safety net - you can't talk to X9-27 if you're fighting him
SetStage(200)

pRR301_210_X9CutPower.start()

;Deactivate Elevator
(pElevatorObject as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectInsidePanel as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectInt as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
(pElevatorObjectIntInsidePanel as LoadElevatorPanelScript).MakeElevatorNonFunctional(ShouldDoorClose = FALSE)
pTiconElevatorLoadDoorEnableMarker.Enable()
pRR301ElevatorNavcut.Enable()

; Make all of the synths on this quest go hostile
pRR301SynthFaction.SetEnemy(pPlayerFaction)

; Enable the outside Synths
pRR301OutsideSynthsEnableMarker.Enable()


utility.wait(1)
pRR301LightsEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set up the objectives
SetObjectiveDisplayed(300)
SetObjectiveCompleted(200)

; Set up a blocking topic for RR201
pRR201.bBlockRR201fromRR301 = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Give the player some caps
Game.GivePlayerCaps(500)
Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable)

; Give final XP
;Game.RewardPlayerXP(pXPFactionFinal.GetValue() as int)

; Objectives
SetObjectiveCompleted(300)

;Update Global for Radio News
RadioDCRR301Ready.SetValue((GameDaysPassed.GetValue() + 1))

; Unblock RR201
pRR201.bBlockRR201fromRR301 = 0

; Close the quest
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Disable things we don't want in play
Alias_X927.GetActorRef().Disable()
Alias_Coursers.DisableAll()

; Fail all objectives and end
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pRR301_110_Post_Intro_Chatter Auto Const

ObjectReference Property pTiconderogaEncounterEnableMarker Auto Const

Faction Property pPlayerFaction Auto Const

Faction Property pRR301SynthFaction Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

ReferenceAlias Property Alias_X927 Auto Const

RefCollectionAlias Property Alias_Coursers Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCRR301Ready Auto Const

GlobalVariable Property pRRQuestDesdemona Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

ObjectReference Property pRR301OutsideSynthsEnableMarker Auto Const

ObjectReference Property pRR301DeadLowRoadMarker Auto Const

ReferenceAlias Property Alias_LowRoadFranklin Auto Const

Quest Property pDialogueRailroad Auto Const

ObjectReference Property pElevatorObject Auto Const

ObjectReference Property pTiconderogaMapMarker Auto Const

ObjectReference Property pTiconderogaStationDoor Auto Const

ObjectReference Property pTiconerogaDoorBlocker Auto Const

ObjectReference Property pRR301LightsEnableMarker Auto Const

Scene Property pRR301_210_X9CutPower Auto Const

Scene Property pRR301_Ambient_Warnings Auto Const

RR201Script Property pRR201 Auto Const

ObjectReference Property pElevatorObjectInt Auto Const

Quest Property pRR301 Auto Const

ObjectReference Property pElevatorObjectInsidePanel Auto Const

ObjectReference Property pElevatorObjectIntInsidePanel Auto Const

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory

ObjectReference Property pRR301ElevatorNavcut Auto Const Mandatory

ReferenceAlias Property Alias_H222 Auto Const Mandatory

ObjectReference Property PTiconElevatorLoadDoor_Interior Auto Const Mandatory

ObjectReference Property PTiconElevatorLoadDoor_Exterior Auto Const Mandatory

ObjectReference Property PTiconElevatorLoadDoorEnableMarker Auto Const Mandatory

ObjectReference Property PTiconElevatorLoadDoor_Interior001 Auto Const Mandatory
