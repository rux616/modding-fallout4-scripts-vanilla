;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FreeformDiamondCity03_0002125F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;enable map marker
Alias_ForestGroveMapMarker.GetRef().AddtoMap()

;enable failsafe fern
Alias_FernQT.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity03Script
Quest __temp = self as Quest
FFDiamondCity03Script kmyQuest = __temp as FFDiamondCity03Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

Game.GetPlayer().RemoveItem(FernFlower, 1)
Game.GetPlayer().AddItem(Buffout, 1)
Game.GetPlayer().AddItem(Psycho, 1)
Game.GetPlayer().AddItem(Jet, 1)

If kmyquest.var_Speech == 1
  Game.GetPlayer().AddItem(Caps001, 125)
ElseIf kmyquest.var_Speech == 2
  Game.GetPlayer().AddItem(Caps001, 150)
ElseIf kmyquest.var_Speech == 3
  Game.GetPlayer().AddItem(Caps001, 200)
Else
  Game.GetPlayer().AddItem(Caps001, 100)
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

ReferenceAlias Property Alias_ForestGroveMapMarker Auto Const

Ingredient Property pMutatedFern Auto Const

Potion Property pRadX Auto Const

Potion Property pRadAway Auto Const

Potion Property pStimpak Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property XPRadiant Auto Const

Potion Property FernFlower Auto Const

ReferenceAlias Property Alias_FernQT Auto Const

Potion Property Buffout Auto Const

Potion Property Psycho Auto Const

Potion Property Jet Auto Const
