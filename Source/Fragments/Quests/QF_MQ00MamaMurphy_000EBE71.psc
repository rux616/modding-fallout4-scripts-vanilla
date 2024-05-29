;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ00MamaMurphy_000EBE71 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
If GetStageDone(30) == 0
  SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetStage(20)

Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;run visions - this is now done in dialogue
;MQ00MamaMurphy_Visions.Start()

kmyquest.UsedSight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
Game.RewardPlayerXP(XPRadiant.GetValue() as int)
Alias_MamaMurphy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(30)
SetObjectiveCompleted(30)
Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;run visions - this is now done in dialogue
;MQ00MamaMurphy_Visions.Start()
kmyquest.UsedSight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(40)
SetObjectiveCompleted(40)
Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;run visions - this is now done in dialogue
;MQ00MamaMurphy_Visions.Start()
kmyquest.UsedSight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(50)
SetObjectiveCompleted(50)
Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;run visions - this is now done in dialogue
;MQ00MamaMurphy_Visions.Start()
kmyquest.UsedSight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE mq00mamamurphyscript
Quest __temp = self as Quest
mq00mamamurphyscript kmyQuest = __temp as mq00mamamurphyscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(60)
SetObjectiveCompleted(60)
Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;run visions - this is now done in dialogue
;MQ00MamaMurphy_Visions.Start()
kmyquest.UsedSight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
MQ105HiddenCacheEnableREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DmndKelloggKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().AddSpell(AbMQTheSightPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_MamaMurphy.GetActorRef().KillEssential()

Utility.Wait(3.0)

MQ00MamaMurphy_DeadScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.RewardPlayerXP(XPRadiant.GetValue() as int)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_MamaMurphy.GetActorRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ00MamaMurphy_Visions Auto Const

Key Property DmndKelloggKey Auto Const

ObjectReference Property MQ105HiddenCacheEnableREF Auto Const

SPELL Property AbMQTheSightPerk Auto Const

GlobalVariable Property XPRadiant Auto Const

ReferenceAlias Property Alias_MamaMurphy Auto Const


Scene Property MQ00MamaMurphy_DeadScene Auto Const
