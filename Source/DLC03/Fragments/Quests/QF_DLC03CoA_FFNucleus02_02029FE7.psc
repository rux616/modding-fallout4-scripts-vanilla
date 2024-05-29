;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_FFNucleus02_02029FE7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Game.GetPlayer().AddItem(Alias_HighConfessorNote.GetRef())

;Enable Edgar's note
Alias_EdgarsNote.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_FFNucleus02Script
Quest __temp = self as Quest
DLC03:DLC03CoA_FFNucleus02Script kmyQuest = __temp as DLC03:DLC03CoA_FFNucleus02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)

Actor Player = Game.GetPlayer()

;if the player hasn't yet read Aubert's note...
if !GetStageDone(200)

  ;If player hasn't already spoke to Aubert, send them there now
  if !DLC03CoA_DialogueNucleus.GetStageDone(130)
    SetObjectiveDisplayed(20)
  endif

  kmyquest.CheckObjectives()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_FFNucleus02Script
Quest __temp = self as Quest
DLC03:DLC03CoA_FFNucleus02Script kmyQuest = __temp as DLC03:DLC03CoA_FFNucleus02Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)

;Reflash active objective
kmyquest.CheckObjectives(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

;If player hasn't gotten Aubert's note yet
if !DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(70)
  SetObjectiveDisplayed(50)
endif

;if the player hasn't yet read Aubert's note...
if !GetStageDone(200)

  ;And player hasn't already spoke to Aubert, send them there now
  if !DLC03CoA_DialogueNucleus.GetStageDone(130)
    SetObjectiveDisplayed(20)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;If player doesn't yet have Aubert's note, but has read Edgar's and the Hgh Confessor's, reflash objective
if !DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(70) && DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(50) && GetStageDone(20)
  SetObjectiveDisplayed(50, true, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Close out all earlier objectives
CompleteAllObjectives()

;Set new objectives
SetObjectiveDisplayed(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_AubertNote.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Caps_Reward_Medium_and_Change)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Give player cowl
Game.GetPlayer().AddItem(DLC03_CoA_InquisitorsCowl)

;Send to wrap up stage
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set stage in Nucleus script to watch for player change location event
DLC03CoA_DialogueNucleus.SetStage(131)

;Give player cowl
Game.GetPlayer().AddItem(DLC03_CoA_InquisitorsCowl)

;Send to wrap up stage
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Set stage in Nucleus script to watch for player change location event
DLC03CoA_DialogueNucleus.SetStage(131)

;Send to wrap up stage
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;If player convinced Aubert to flee, turn her off now
if GetStageDone(240)
  Alias_Aubert.GetRef().Disable()

; Or if the player told Aubert about the note, but never gave her an answer about their plan, disable her
elseif GetStageDone(210) && !GetStageDone(240) && !GetStageDone(220)
    Alias_Aubert.GetRef().Disable()
endif

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HighConfessorNote Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

ReferenceAlias Property Alias_FootLockerKey Auto Const Mandatory

ReferenceAlias Property Alias_EdgarsNote Auto Const Mandatory

ReferenceAlias Property Alias_AubertNote Auto Const Mandatory

Quest Property DLC03CoA_FFNucleusQuestObjHandler Auto Const Mandatory

LeveledItem Property LL_Caps_Reward_Medium_and_Change Auto Const Mandatory

ReferenceAlias Property Alias_Aubert Auto Const Mandatory

Armor Property DLC03_CoA_InquisitorsCowl Auto Const Mandatory
