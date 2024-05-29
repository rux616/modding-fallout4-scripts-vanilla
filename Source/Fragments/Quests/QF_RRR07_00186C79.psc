;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR07_00186C79 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR07Script
Quest __temp = self as Quest
RRR07Script kmyQuest = __temp as RRR07Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Start up the quest
SetStage(50)
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

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)

; Drummer Boy no longer points to quest
pRRQuestsAvailable.Mod(-1)
pRRQuestPAM.SetValue(0)

; Enable the Courser now
Alias_CourserTarget.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Close the quest
Stop()
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
; Objectives
SetObjectiveCompleted(200)

; Give some XPs
;int nReward = pXPRadiant.GetValueInt()
;Game.RewardPlayerXP(nReward)

; Give other rewards
int nCaps = 100 + Utility.RandomInt(0, 20)*10   ; Anywhere from 100-300 caps
Game.GivePlayerCaps(nCaps)
if ( Utility.RandomInt(0,100) < 33 )    ; 1/3 chance of getting some loot
  Game.GetPlayer().AddItem(pLL_Quest_Reward_Equippable)
endif

; Increment the tracker for the number of times the quest has been completed
pRRR07Global.Mod(1)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

; End quest
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
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

GlobalVariable Property pXPRadiant Auto Const

GlobalVariable Property pRRR07Global Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestPAM Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory

ReferenceAlias Property Alias_CourserTarget Auto Const Mandatory
