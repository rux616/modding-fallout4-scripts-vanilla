;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRR09_00145F1A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRR09Script
Quest __temp = self as Quest
RRR09Script kmyQuest = __temp as RRR09Script
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
pRRQuestCarrington.SetValue(1)
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
pRRQuestCarrington.SetValue(0)

; Flag all post game quests to be available
pRailroadPostGameQuestsEnabled.SetValue(1)

; Make the rescue target appear
Alias_RescueTarget.GetActorRef().Enable()

; Give the player the Care Package
Game.GetPlayer().AddItem(Alias_CarePackage.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Remove the Care Package
Game.GetPlayer().RemoveItem(Alias_CarePackage.GetRef())
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
pRRR09Global.Mod(1)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()


; TODO: The Synth is added to the Workshop system
; TODO: The Synth gets a different outift

; Synth is added to the Mercer Safehouse faction (used for post-quest dialog)
Alias_RescueTarget.GetActorRef().AddToFaction(pRRMercerEscapedSynthFaction)

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

GlobalVariable Property pRRQuestCarrington Auto Const

GlobalVariable Property pRRR09Global Auto Const

ReferenceAlias Property Alias_RescueTarget Auto Const

ReferenceAlias Property Alias_CarePackage Auto Const

Faction Property pRRMercerEscapedSynthFaction Auto Const

GlobalVariable Property pRailroadPostGameQuestsEnabled Auto Const

LeveledItem Property pLL_Quest_Reward_Equippable Auto Const Mandatory
