;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity04_00142434 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;display objective only if the quest has been handed out
If GetStageDone(10) == 1
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity04Script
Quest __temp = self as Quest
FFDiamondCity04Script kmyQuest = __temp as FFDiamondCity04Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

If kmyquest.var_Speech == 1
  Game.GetPlayer().AddItem(Caps001, 125)
ElseIf kmyquest.var_Speech == 2
  Game.GetPlayer().AddItem(Caps001, 150)
ElseIf kmyquest.var_Speech == 3
  Game.GetPlayer().AddItem(Caps001, 200)
Else
  Game.GetPlayer().AddItem(Caps001, 100)
EndIf

;make sure stage 10 was set for dialogue conditions
SetStage(10)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property XPRadiant Auto Const

MiscObject Property Caps001 Auto Const
