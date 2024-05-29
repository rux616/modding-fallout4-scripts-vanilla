;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR04_000B26C2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR04Script
Quest __temp = self as Quest
RRR04Script kmyQuest = __temp as RRR04Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Let Drummer Boy know about the quest
pRRQuestsAvailable.Mod(1)
pRRQuestPAM.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Drummer Boy no longer bothers PC
pRRQuestsAvailable.Mod(-1)
pRRQuestPAM.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RRR04Script
Quest __temp = self as Quest
RRR04Script kmyQuest = __temp as RRR04Script
;END AUTOCAST
;BEGIN CODE
; Coordinating with the Workshop & Initializing
kmyQuest.RegisterForWorkshopEvents()
kmyQuest.InitializeObjective()

SetStage(75)    ; Clean up Drummer

; KMK - complete MQ206 objective if appropriate
if MQ206.IsObjectiveDisplayed(105)
	MQ206.SetObjectiveCompleted(105)
endif

; Check to see if the Workshop is already owned by the player
if ( (Alias_Workshop.GetRef() as workshopscript).OwnedByPlayer == TRUE )
  SetStage(200)
else
  ; Objectives
  SetObjectiveDisplayed(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

SetStage(75)    ; Clean up Drummer
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

SetStage(75)    ; Clean up Drummer

; Queue up RRR03 (where this quest ends)
pRRR03.SetStage(50)

; Move the new map marker here
ObjectReference oMapMarker =  Alias_MercerMapMarker.GetReference()
oMapMarker.MoveTo(Alias_ChosenWorkshopMarker.GetReference(), 3000.0)
oMapMarker.Enable()
oMapMarker.SetLinkedRef(Alias_Workshop.GetRef().GetLinkedRef(pWorkshopLinkCenter))
Utility.Wait(0.1)
oMapMarker.AddToMap(TRUE)

; Move Caretaker to the right spot
; First get the proper spawn point
ObjectReference oSpawnPoint = Alias_Workshop.GetReference().GetLinkedRef(pWorkshopLinkSpawn)
Alias_Caretaker.GetReference().Enable()
Alias_Caretaker.GetReference().MoveTo(oSpawnPoint)
Alias_Caretaker.GetReference().SetPersistLoc(Alias_ChosenWorkshopLocation.GetLocation())

; Set up the Mercer Dialogue quest & Concierge Quest
pDialogueRailroadMercer.SetStage(100)
pRRR02a.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)

; Give some caps
Game.GivePlayerCaps(200)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

; add teleporter build items if working on MQ206 with Railroad
MQ206Script myMQ206 = MQ206 as MQ206Script
if myMQ206.MQ206TeleporterFaction.GetValue() == myMQ206.MQ00.Faction03_Railroad
	myMQ206.AddPlatformItems()
endif

; Don't close this quest - Caretaker uses it for his packages
;Stop()
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

GlobalVariable Property pXPRadiant Auto Const

ReferenceAlias Property Alias_MercerMapMarker Auto Const

ReferenceAlias Property Alias_ChosenWorkshopMarker Auto Const

ReferenceAlias Property Alias_Caretaker Auto Const

LocationAlias Property Alias_ChosenWorkshopLocation Auto Const

Quest Property pDialogueRailroadMercer Auto Const

Quest Property pRRR02a Auto Const

Quest Property pRRR03 Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestPAM Auto Const

Quest Property MQ206 Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

Keyword Property pWorkshopLinkSpawn Auto Const

Perk Property pRRStationMasterPerk Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

Keyword Property pWorkshopLinkCenter Auto Const

mq00script Property MQ00 Auto Const
