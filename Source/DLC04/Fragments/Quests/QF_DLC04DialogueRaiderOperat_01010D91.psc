;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DialogueRaiderOperat_01010D91 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Throw objective if the Operators aren't the enemy
if DLC04EnemyGang.GetValue() != 2
  SetObjectiveDisplayed(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC04IntimidateGrenade, 1)
Game.GetPlayer().AddItem(DLC04IntimdationGrenadeRecipe, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC04SmoothOperator, 1)
Game.GetPlayer().AddItem(DLC04SmoothOperatorRecipe, 1)

;Close out this conversation
DLC04OperatorToolsConversationComplete.SetValue(1)

SetObjectiveCompleted(10)

;Throw the appropriate Coerce objective if quest is in the right state
if DLC04RaidCoerce.IsRunning() && DLC04RaidCoerce.GetStageDone(21) && !DLC04RaidCoerce.GetStageDone(100)
  DLC04RaidCoerce.SetStage(23)
endif

;Throw the appropriate Chase Off Objective if quest is in the right state
if DLC04RaidChaseOff.IsRunning() && DLC04RaidChaseOff.GetStageDone(21) && !DLC04RaidChaseoff.GetStageDone(100)
  DLC04RaidChaseOff.SetStage(23)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property DLC04IntimidateGrenade Auto Const Mandatory

Potion Property DLC04SmoothOperator Auto Const Mandatory

GlobalVariable Property DLC04OperatorToolsConversationComplete Auto Const Mandatory

Book Property DLC04IntimdationGrenadeRecipe Auto Const Mandatory

Book Property DLC04SmoothOperatorRecipe Auto Const Mandatory

Quest Property DLC04RaidChaseOff Auto Const Mandatory

Quest Property DLC04RaidCoerce Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
