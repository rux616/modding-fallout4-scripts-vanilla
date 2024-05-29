;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_RQ_DefendCache_0102191C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 0 - Startup")

;*** DOUBLE CHECK PARAMS IF COPYING AND PASTING***
kmyquest.FillAliasesIfNeededAndSetQuestData( allowHelpSettlement = true, allowMischief = FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 9 - Player Refused Quest")
kmyquest.PlayerRefusedQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 10 - Player Accepted Quest")

kmyquest.PlayerAcceptedQuest()
SetObjectiveDisplayed(10)

;tell the trigger that a quest started, so that it doesn't spawn an encounter when the player arrives
(Alias_Trigger.GetReference() as RETriggerScript).QuestStarted(self)

;add items to container
Alias_Container.GetReference().Additem(DLC04_LL_RQ_CacheSupplies)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;REMINDER:
;THIS BASED ON REAssault_Template

debug.trace(self + " STARTING")
((self as Quest) as REAssaultQuestScript).InitAssault()
kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as REAssaultQuestScript).StartAssault()
kmyquest.MakeEnemyCrimeFactionAngry()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Debug.Trace("Defending faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Debug.Trace("Attacking faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 100 - Player Completed All Objectives")

SetObjectiveCompleted(10)
SetObjectiveCompleted(11)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 150 - Player Received Reward")
kmyquest.RewardPlayer()
kmyquest.PlayerCompletedQuest()
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
failAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_RQ_QuestScript kmyQuest = __temp as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.trace(self, "Stage 255 - Shutdown")
kmyquest.DeleteSpawnedReferences()

Alias_Container.GetReference().Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_01
Function Fragment_Stage_0255_Item_01()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
((Self as Quest) as REAssaultQuestScript).CleanupAssault()
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Attacker01Links Auto Const
ReferenceAlias Property Alias_Attacker02Links Auto Const
ReferenceAlias Property Alias_Attacker03Links Auto Const
ReferenceAlias Property Alias_Attacker04Links Auto Const
ReferenceAlias Property Alias_Attacker05Links Auto Const
ReferenceAlias Property Alias_Defender01Links Auto Const
ReferenceAlias Property Alias_Defender02Links Auto Const
ReferenceAlias Property Alias_Defender03Links Auto Const
ReferenceAlias Property Alias_Defender04Links Auto Const
ReferenceAlias Property Alias_Defender05Links Auto Const

ReferenceAlias Property Alias_Container Auto Const Mandatory

LeveledItem Property DLC04_LL_RQ_CacheSupplies Auto Const Mandatory
