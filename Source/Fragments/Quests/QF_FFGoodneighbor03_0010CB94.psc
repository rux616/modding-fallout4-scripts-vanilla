;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor03_0010CB94 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;display objective unless the player already did the quest
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10)
EndIf

Alias_DungeonMapMarker.GetRef().AddToMap()

;enable failsafe canister
Alias_Canister.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor03Script
Quest __temp = self as Quest
FFGoodneighbor03Script kmyQuest = __temp as FFGoodneighbor03Script
;END AUTOCAST
;BEGIN CODE
;make sure stage 10 is set so quest giver doesn't offer the quest again
SetStage(10)
CompleteAllObjectives()

;reward XP
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;hand out money
Actor PlayerREF = Game.GetPlayer()
PlayerREF.RemoveItem(DN102_HalluciGenGasCanister, 1)

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

ReferenceAlias Property Alias_Canister Auto Const

MiscObject Property DN102_HalluciGenGasCanister Auto Const Mandatory
