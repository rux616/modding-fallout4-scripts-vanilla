;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR03_000B926B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR03Script
Quest __temp = self as Quest
RRR03Script kmyQuest = __temp as RRR03Script
;END AUTOCAST
;BEGIN CODE
; Register for the changing location event (needed to properly end the quest)
RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

; Initialize the quest
kmyQuest.InitializeQuest()

; Set stage 50
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Have you done this quest more than once?
if ( pRRR03Completed.GetValue() > 0 )
  ; Let Drummer Boy know about the quest
  pRRQuestsAvailable.Mod(1)
  pRRQuestPAM.SetValue(1)
  pRRQuestDrummerBoyComing.SetValue(1) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100, true)

; Have you done this quest more than once?
if ( pRRR03Completed.GetValue() > 0 )
  ; Drummer Boy no longer points to quest
  pRRQuestsAvailable.Mod(-1)
  pRRQuestPAM.SetValue(0)
endif

; Give the player the special RFID Device
if ( Game.GetPlayer().GetItemCount(pRRR03RFIDDevice) == 0 )  ; Check to see if the player doesn't have one
  ObjectReference pRFID = Game.GetPlayer().PlaceAtMe(pRRR03RFIDDevice)
  Alias_RFID.ForceRefTo(pRFID)
  Game.GetPlayer().AddItem(pRFID)
;Game.GetPlayer().AddItem(pRRR03RFIDDevice)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Finish the previous quest
pRRR04.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Remove the LocRef so this area won't be pulled up again by RRR03
Alias_QuestDoor.GetRef().RemoveKeyword(pDIACache)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)

; Give Reward
Game.RewardPlayerXP(pXPRadiant.GetValue() as int)
Game.GivePlayerCaps(300)
Game.GetPlayer().AddItem(pRR_PrewarSweaterVest_01)

; Set the global to indicate it's been done once
pRRR03Completed.SetValue(1)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

; Keep track of how many times the quest has completed
pRRR03Global.Mod(1)

; Remove the RFID device on quest turn in
Game.GetPlayer().RemoveItem(Alias_RFID.GetRef())

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Fail objectives and end quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnQuestInit()
    ; register for events
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    ; watch for player to change location
    Debug.Trace(pRRR03)
    if akSender == Game.GetPlayer() && akOldLoc == RailroadHQLocation && pRRR03.GetStageDone(300)
            ; CHECK FOR old/new location matching whatever you want, quest stage, etc.- then DO SOMETHING!!
    	pRRR03.Stop()
    	; if quest RRR03 is on stage 300 (completion stage), stop the quest
    	; This allows the quest to restart when the player returns to the Institute later
    endif
EndEvent

MiscObject Property pRRR03RFIDDevice Auto Const

GlobalVariable Property pRRR03Completed Auto Const

GlobalVariable Property pXPRadiant Auto Const

Location Property RailroadHQLocation Auto Const

Quest Property pRRR03 Auto Const

Armor Property pRR_PrewarSweaterVest_01 Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

ReferenceAlias Property Alias_RFID Auto Const

Quest Property pRRR04 Auto Const Mandatory

GlobalVariable Property pRRQuestsAvailable Auto Const Mandatory

GlobalVariable Property pRRQuestPAM Auto Const Mandatory

ReferenceAlias Property Alias_QuestDoor Auto Const Mandatory

LocationRefType Property pDIACache Auto Const Mandatory

GlobalVariable Property pRRQuestDrummerBoyComing Auto Const Mandatory

GlobalVariable Property pRRR03Global Auto Const Mandatory
