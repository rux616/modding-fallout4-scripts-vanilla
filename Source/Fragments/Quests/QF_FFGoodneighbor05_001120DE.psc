;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor05_001120DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;display objective unless the player already did the quest
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10)
EndIf

Alias_DungeonMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;check if Hancock is present when you complete the mission
If Alias_QuestGiver.GetActorRef().GetCurrentLocation() == Alias_Dungeon.GetLocation()
  SetStage(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor05Script
Quest __temp = self as Quest
FFGoodneighbor05Script kmyQuest = __temp as FFGoodneighbor05Script
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

LocationAlias Property Alias_Dungeon Auto Const

ReferenceAlias Property Alias_QuestGiver Auto Const
