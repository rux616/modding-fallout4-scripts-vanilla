;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity06_00035D03 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
SetObjectiveDisplayed(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_03
Function Fragment_Stage_0010_Item_03()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_04
Function Fragment_Stage_0010_Item_04()
;BEGIN CODE
;advance quest
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity06Script
Quest __temp = self as Quest
FFDiamondCity06Script kmyQuest = __temp as FFDiamondCity06Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10, 1)

;increment tracker
kmyquest.Num_Relics += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
;advance quest if we've found everything
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity06Script
Quest __temp = self as Quest
FFDiamondCity06Script kmyQuest = __temp as FFDiamondCity06Script
;END AUTOCAST
;BEGIN CODE
;adjust trackers
kmyquest.Num_Relics -= 1
kmyquest.Num_TurnIns += 1

;remove item and give rewards
Game.GetPlayer().RemoveItem(Alias_Baseball.GetRef())
kmyquest.RewardForRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity06Script
Quest __temp = self as Quest
FFDiamondCity06Script kmyQuest = __temp as FFDiamondCity06Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20, 1)

;increment tracker
kmyquest.Num_Relics += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
;advance quest if we've found everything
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity06Script
Quest __temp = self as Quest
FFDiamondCity06Script kmyQuest = __temp as FFDiamondCity06Script
;END AUTOCAST
;BEGIN CODE
;adjust trackers
kmyquest.Num_Relics -= 1
kmyquest.Num_TurnIns += 1

Game.GetPlayer().RemoveItem(Alias_Mitt.GetRef())
kmyquest.RewardForRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity06Script
Quest __temp = self as Quest
FFDiamondCity06Script kmyQuest = __temp as FFDiamondCity06Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)

;increment tracker
kmyquest.Num_Relics += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
;advance quest if we've found everything
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity06Script
Quest __temp = self as Quest
FFDiamondCity06Script kmyQuest = __temp as FFDiamondCity06Script
;END AUTOCAST
;BEGIN CODE
;adjust trackers
kmyquest.Num_Relics -= 1
kmyquest.Num_TurnIns += 1

Game.GetPlayer().RemoveItem(Alias_Card.GetRef())
kmyquest.RewardForRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;make sure objectives are complete
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveCompleted(30, 1)

;don't display if we aren't on the quest
If GetStageDone(10) == 1
  SetObjectiveDisplayed(40, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

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

ReferenceAlias Property Alias_Baseball Auto Const

ReferenceAlias Property Alias_Mitt Auto Const

ReferenceAlias Property Alias_Card Auto Const

LeveledItem Property pCapsRewardMedium Auto Const

GlobalVariable Property XPRadiant Auto Const
