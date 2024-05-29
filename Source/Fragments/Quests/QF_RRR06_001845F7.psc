;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR06_001845F7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR06Script
Quest __temp = self as Quest
RRR06Script kmyQuest = __temp as RRR06Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Disable the dead drop
Alias_DeadDrop.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Make the "Dead Drop" rail sign appear
Alias_DeadDrop.GetReference().GetLinkedRef(pRRSign).Enable()

; Let Drummer Boy know about the quest
pRRQuestsAvailable.Mod(1)
pRRQuestRandolph.SetValue(1)

; Disable enemy bosses so you can't do the quest out of order
Alias_EnemyBosses.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Drummer Boy no longer points to quest
pRRQuestsAvailable.Mod(-1)
pRRQuestRandolph.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

SetStage(75)    ; Clean up Drummer

; Enable enemy bosses
Alias_EnemyBosses.EnableAll()

; Disable the dead drop
Alias_DeadDrop.GetRef().Enable()
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
; Dead drop objective failsafe
SetStage(200)

SetStage(75)    ; Clean up Drummer

; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; If this is the final radiant quest bring in Mr. Tims
if ( pRRR06Global.GetValue() == 5 )
  Alias_MrTims.GetActorRef().Enable()
  Alias_MrTims.GetActorRef().MoveTo(pRR303GloryDebriefMarker)
endif

; Make it so that Dez will speak to the player
(pRR201 as RR201Script).bBlockRR201fromRRR06 = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)

SetStage(500)

; Dez will continue speaking to the player now
(pRR201 as RR201Script).bBlockRR201fromRRR06 = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
CompleteAllObjectives()

; Make the "Dead Drop" rail sign disappear
Alias_DeadDrop.GetReference().GetLinkedRef(pRRSign).Disable()

; Reward for each iteration
if ( pRRR06Global.GetValue() == 0 )
  Game.GivePlayerCaps(100)
elseif ( pRRR06Global.GetValue() == 1 )
  Game.GivePlayerCaps(150)
  Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable)
elseif ( pRRR06Global.GetValue() == 2 )
  Game.GivePlayerCaps(200)
elseif ( pRRR06Global.GetValue() == 3 )
  Game.GivePlayerCaps(130)
  Game.GetPlayer().AddItem(pLL_Quest_Reward_Weapon)
elseif ( pRRR06Global.GetValue() == 4 )
  Game.GivePlayerCaps(175)
elseif ( pRRR06Global.GetValue() == 5 )
  Game.GivePlayerCaps(200)
  Game.GetPlayer().AddItem(pLL_RRInstituteKillerMod)
  SetStage(510)   ; This is for the final log
endif

; Increment the RRR06 tracker
pRRR06Global.Mod(1)
pRRR06DisplayNumber.Mod(1)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

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

ReferenceAlias Property Alias_DeadDrop Auto Const

Keyword Property pRRSign Auto Const

GlobalVariable Property pRRR06Global Auto Const

GlobalVariable Property pXPRadiant Auto Const

GlobalVariable Property pRRQuestRandolph Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

ReferenceAlias Property Alias_MrTims Auto Const

ObjectReference Property pRR303GloryDebriefMarker Auto Const

GlobalVariable Property pRRR06DisplayNumber Auto Const

Perk Property pRRTheHeavyPerk Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

LeveledItem Property pLL_RRInstituteKillerMod Auto Const

LeveledItem Property pLL_Quest_Reward_Weapon Auto Const Mandatory

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory

RefCollectionAlias Property Alias_EnemyBosses Auto Const Mandatory

Quest Property pRR201 Auto Const Mandatory
