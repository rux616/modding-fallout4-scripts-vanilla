;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR05_000B926A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR05Script
Quest __temp = self as Quest
RRR05Script kmyQuest = __temp as RRR05Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Put the MILA state at 0
pPRRR05MILAState.SetValue(0)

; Also, determine if there's going to be an item reward
kmyQuest.bGiveItemReward = Utility.RandomInt(0, 1)

; Set stage 50
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RRR05Script
Quest __temp = self as Quest
RRR05Script kmyQuest = __temp as RRR05Script
;END AUTOCAST
;BEGIN CODE
; If this is the 1st time through let Drummer Boy know about the quest
if ( pRRR05MILAsPlaced.GetValue() == 0 )
  pRRQuestsAvailable.Mod(1)
  pRRQuestTinkerTom.SetValue(1)
endif

; Also, determine if there's going to be an item reward
kmyQuest.bGiveItemReward = Utility.RandomInt(0, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Give the player the quest object
if ( pRRR05MILAsPlaced.GetValue() == 0 )
  Alias_TinkerTom.GetActorRef().RemoveItem(Alias_MILA.GetRef(), 1, false, Game.GetPlayer() )

  ; Drummer Boy no longer bothers PC
  pRRQuestsAvailable.Mod(-1)
  pRRQuestTinkerTom.SetValue(0)
else
  Game.GetPlayer().AddItem(pRRR05MILAObject)
endif

; Put the MILA state at 1 (Haven't placed MILA)
pPRRR05MILAState.SetValue(1)

; Enable the vantage point
(Alias_HighPointActivator.GetRef() as RRR05BlockActivationOnLoad).HasLoaded = TRUE
Alias_HighPointActivator.GetRef().Enable()
Alias_HighPointActivator.GetRef().BlockActivation(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Remove the keyword from the activator
; (Ensuring this spot won't be chosen again)
ObjectReference oHighPoint = Alias_HighPointActivator.GetRef()
oHighPoint.RemoveKeyword(pHighPointTinkerTomDevice)

; Place MILA and disable the activator
oHighPoint.GetLinkedRef().Enable()
oHighPoint.GetLinkedRef().BlockActivation(TRUE, TRUE)
oHighPoint.Disable()

; Take away MILA
Game.GetPlayer().RemoveItem(pRRR05MILAObject)

; Indicate another MILA has been placed
pRRR05MILAsPlaced.Mod(1)

; Put the MILA state at 2 (MILA placed)
pPRRR05MILAState.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE RRR05Script
Quest __temp = self as Quest
RRR05Script kmyQuest = __temp as RRR05Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)

; Rewards
int nCapsToGive = 150 + Utility.RandomInt(0,8)*5
Game.GivePlayerCaps(nCapsToGive)

if ( kmyQuest.bGiveItemReward )   ; Check if we're dropping loot this time
  Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable)
endif

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

; Get the quest tracker global back to default values
pPRRR05MILAState.SetValue(0)

; Queue up this quest again
if ( !GetStageDone(275) )
   pDialogueRailroad.RunRRR05Again()
endif

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

MiscObject Property pRRR05MILAObject Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestTinkerTom Auto Const

GlobalVariable Property pXPRadiant Auto Const

ReferenceAlias Property Alias_MILA Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

ReferenceAlias Property Alias_HighPointActivator Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

GlobalVariable Property pRRR05MILAsPlaced Auto Const

GlobalVariable Property pPRRR05MILAState Auto Const

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory

LocationRefType Property pHighPointTinkerTomDevice Auto Const Mandatory
