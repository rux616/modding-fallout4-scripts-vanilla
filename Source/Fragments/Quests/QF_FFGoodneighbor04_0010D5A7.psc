;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor04_0010D5A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;display objective unless the player already did the quest
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;if we're on the quest, update objectives
If GetStageDone(10) == 1
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor04Script
Quest __temp = self as Quest
FFGoodneighbor04Script kmyQuest = __temp as FFGoodneighbor04Script
;END AUTOCAST
;BEGIN CODE
;make sure stage 10 is set so quest giver doesn't offer the quest again
SetStage(10)
CompleteAllObjectives()

;reward XP
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;hand out money
Actor PlayerREF = Game.GetPlayer()
If kmyquest.var_reward == 0
  PlayerREF.AddItem(Caps001, 200)
ElseIf kmyquest.var_reward == 1
  PlayerREF.AddItem(Caps001, 250)
ElseIf kmyquest.var_reward == 2
  PlayerREF.AddItem(Caps001, 300)
ElseIf kmyquest.var_reward == 3
  PlayerREF.AddItem(Caps001, 400)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

LeveledItem Property LL_Chems_Any Auto Const

GlobalVariable Property XPRadiant Auto Const
