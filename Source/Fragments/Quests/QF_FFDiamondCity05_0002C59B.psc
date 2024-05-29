;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity05_0002C59B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If GetStageDone(100) == 0
  SetObjectiveDisplayed(10,1)
  Alias_DungeonMapMarker.GetRef().AddToMap()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
ObjectReference BloatflyGlandREF = Alias_BloatflyGland.GetRef()
Actor BloatflyREF = Alias_Bloatfly.GetActorRef()

BloatflyGlandREF.Enable()
BloatflyREF.Additem(BloatflyGlandREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity05Script
Quest __temp = self as Quest
FFDiamondCity05Script kmyQuest = __temp as FFDiamondCity05Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(pBloatflyGland, 1)
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

;make sure stage 10 gets set for dialogue conditions
SetStage(10)
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


MiscObject Property pBloatflyGland Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property XPRadiant Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

ReferenceAlias Property Alias_BloatflyGland Auto Const Mandatory

ReferenceAlias Property Alias_Bloatfly Auto Const Mandatory
