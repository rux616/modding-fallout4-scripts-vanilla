;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueDiamondCity_00003648 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
pMQ103.SetStage(30)

SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(PublickOccurencesArticle01, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
pMQ103.SetStage(30)
SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Myrna scene done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;player orders noodles from Takahashi
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0064_Item_00
Function Fragment_Stage_0064_Item_00()
;BEGIN CODE
pFFDiamondCity02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;player has talked to John
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DialogueDiamondCityScript
Quest __temp = self as Quest
DialogueDiamondCityScript kmyQuest = __temp as DialogueDiamondCityScript
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.RemoveItem(CustomItem_WorldSeriesBat.GetRef(), 1)

If kmyquest.WorldSeriesBatSP == 0
  PlayerREF.AddItem(Caps001, 200)
ElseIf kmyquest.WorldSeriesBatSP == 1
  PlayerREF.AddItem(Caps001, 250)
ElseIf kmyquest.WorldSeriesBatSP == 2
  PlayerREF.AddItem(Caps001, 300)
ElseIf kmyquest.WorldSeriesBatSP == 3
  PlayerREF.AddItem(Caps001, 400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN CODE
SetStage(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
SetStage(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0113_Item_00
Function Fragment_Stage_0113_Item_00()
;BEGIN CODE
SetStage(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
;advance MQ04
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;this is now handled in a separate quest
;DugoutInnIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
FFDiamondCity02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
pMQ103.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
pMQ103.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ04 Auto Const

Quest Property pFFDiamondCity02 Auto Const

MiscObject Property pCaps001 Auto Const

Quest Property pMQ103 Auto Const

Book Property PublickOccurencesArticle01 Auto Const

Quest Property FFDiamondCity02 Auto Const

Quest Property BoS301 Auto Const

Weapon Property DN070WorldSeriesBat Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property ServiceCostBuyHouse Auto Const
ReferenceAlias Property CustomItem_WorldSeriesBat Auto Const
