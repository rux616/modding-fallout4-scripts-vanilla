;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ05_01000805 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Make Disciples the Enemy
DLC04RankDisciples.SetValue(3)
Game.GetPlayer().MoveTo(DLC04MQ05Start)
SetStage(5)
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Make Operators the Enemy
DLC04RankOperators.SetValue(3)
Game.GetPlayer().MoveTo(DLC04MQ05Start)
SetStage(5)
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Make Pack the Enemy
DLC04RankPack.SetValue(3)
Game.GetPlayer().MoveTo(DLC04MQ05Start)
SetStage(5)
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Make Disciples the Enemy
DLC04RankDisciples.SetValue(3)
Game.GetPlayer().MoveTo(DLC04MQ05PPTest)
SetStage(5)
SetStage(8)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ05QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ05QuestScript kmyQuest = __temp as DLC04:DLC04MQ05QuestScript
;END AUTOCAST
;BEGIN CODE
;Set up enemy gang
kmyQuest.DLC04MakeEnemy()

;Point player towards Shank
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ05QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ05QuestScript kmyQuest = __temp as DLC04:DLC04MQ05QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ParkPowerOn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ05QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ05QuestScript kmyQuest = __temp as DLC04:DLC04MQ05QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ParkPowerOff()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ05QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ05QuestScript kmyQuest = __temp as DLC04:DLC04MQ05QuestScript
;END AUTOCAST
;BEGIN CODE
;In case the PPH Stage never fired, fire it now - this populates the zones directly
DLC04ParkPopulationHandler.SetStage(10)

;Make enemy gang hostile
kmyQuest.DLC04GangSetup()
DLC04MQ05Stage20Trigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Determine which scene to launch
if DLC04EnemyGang.GetValue() == 1
DLC04MQ05Stage020BossScene01.Start()
elseif DLC04EnemyGang.GetValue() == 2
DLC04MQ05Stage020BossScene02.Start()
elseif DLC04EnemyGang.GetValue() == 3
DLC04MQ05Stage020BossScene03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5,1)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_01
Function Fragment_Stage_0025_Item_01()
;BEGIN CODE
SetObjectiveCompleted(5,1)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_02
Function Fragment_Stage_0025_Item_02()
;BEGIN CODE
SetObjectiveCompleted(5,1)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(5) == 1
SetObjectiveCompleted(5,1)
EndIf
If IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
EndIf
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(5) == 1
SetObjectiveCompleted(5,1)
EndIf
If IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
EndIf
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(60,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(5) == 1
SetObjectiveCompleted(5,1)
EndIf
If IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
EndIf
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(90,1)

;Place Key On Corpse
Alias_DLC04MQ05Nisha.GetActorRef().AddItem(Alias_DLC04ControlRoomKey.GetRef())

;Mark "Boss dead" stage
SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)

;Check if both Operators Killed to Advance Quest
if DLC04OpKills.GetValue() < 2
DLC04OpKills.SetValue(DLC04OpKills.GetValue() + 1)
endif
if DLC04OpKills.GetValue() >= 2
SetStage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70,1)

;Check if both Operators Killed to Advance Quest
if DLC04OpKills.GetValue() < 2
DLC04OpKills.SetValue(DLC04OpKills.GetValue() + 1)
endif
if DLC04OpKills.GetValue() >= 2
SetStage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(90,1)

;Place Key On Corpse
Alias_DLC04MQ05Mags.GetActorRef().AddItem(Alias_DLC04ControlRoomKey.GetRef())

;Mark "Boss dead" stage
SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)

;Place Key On Corpse
Alias_DLC04MQ05Mason.GetActorRef().AddItem(Alias_DLC04ControlRoomKey.GetRef())

;Mark "Boss dead" stage
SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ05QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ05QuestScript kmyQuest = __temp as DLC04:DLC04MQ05QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)

;Shut Down Power Tracker Quest
DLC04PowerTracker.Stop()

;Turn On Park Power
kmyQuest.ParkPowerOn()

;Disable Enemy Gang Members in Town
if DLC04EnemyGang.GetValue() == 1
DLC04DialogueSettlement.SetStage(600)
elseif DLC04EnemyGang.GetValue() == 2
DLC04DialogueSettlement.SetStage(610)
elseif DLC04EnemyGang.GetValue() == 3
DLC04DialogueSettlement.SetStage(620)
endif

;Calm the Traders/Travelers
kmyQuest.SendStopFighting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ05QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ05QuestScript kmyQuest = __temp as DLC04:DLC04MQ05QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(120,1)
DLC04MQ05Cleanup.Start()
Game.AddAchievement(84)

;Start up Mag's post-quest scene
DLC04DialogueMagsPostMQ05Quest01.SetStage(10)

;Backup Override Release for Weather
Weather.ReleaseOverride()

;Give player new misc objective pointing at Shank
DLC04ShankMiscObjective.SetStage(10)

;Add New Perk Rewards
kmyQuest.FinalRank()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Backup Override Release for Weather
Weather.ReleaseOverride()

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04MQ05Stage20Trigger Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Scene Property DLC04MQ05Stage020BossScene01 Auto Const Mandatory

Scene Property DLC04MQ05Stage020BossScene02 Auto Const Mandatory

Scene Property DLC04MQ05Stage020BossScene03 Auto Const Mandatory

GlobalVariable Property DLC04OpKills Auto Const Mandatory

ReferenceAlias Property Alias_DLC04MQ05Nisha Auto Const Mandatory

ReferenceAlias Property Alias_DLC04MQ05Mags Auto Const Mandatory

ReferenceAlias Property Alias_DLC04MQ05Nathan Auto Const Mandatory

ReferenceAlias Property Alias_DLC04MQ05Mason Auto Const Mandatory

ReferenceAlias Property Alias_DLC04ControlRoomKey Auto Const Mandatory

GlobalVariable Property DLC04RankDisciples Auto Const Mandatory

GlobalVariable Property DLC04RankOperators Auto Const Mandatory

GlobalVariable Property DLC04RankPack Auto Const Mandatory

Quest Property DLC04GZTrackingQuest Auto Const Mandatory

Quest Property DLC04PowerTracker Auto Const Mandatory

ObjectReference Property DLC04MQ05Start Auto Const Mandatory

Quest Property DLC04PostQuestFlags Auto Const Mandatory

Quest Property DLC04MQ05Cleanup Auto Const Mandatory

Quest Property DLC04DialogueMagsPostMQ05Quest01 Auto Const Mandatory

ObjectReference Property DLC04MQ05PPTest Auto Const Mandatory

Quest Property DLC04ParkPopulationHandler Auto Const Mandatory

Quest Property DLC04ShankMiscObjective Auto Const Mandatory

Quest Property DLC04DialogueSettlement Auto Const Mandatory
