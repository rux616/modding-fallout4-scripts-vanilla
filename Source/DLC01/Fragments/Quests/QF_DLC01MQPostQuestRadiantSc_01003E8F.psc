;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQPostQuestRadiantSc_01003E8F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; turn off trigger
(Alias_Trigger.GetRef() as RETriggerScript).QuestStarted(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; first objective
SetObjectiveDisplayed(100)

DLC01PlayerOnRadiant.SetValue(1)

; affinity event
CompanionAffinityEventQuestScript.GetScript().SendAffinityBumpEvent(DLC01MQPostQuestRadiantAssault01, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01RadiantQuestScript
Quest __temp = self as Quest
DLC01:DLC01RadiantQuestScript kmyQuest = __temp as DLC01:DLC01RadiantQuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyQuest.CompleteQuest()
SetStage(500)

DLC01PlayerOnRadiant.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

GlobalVariable Property DLC01PlayerOnRadiant Auto Const Mandatory

Quest Property DLC01MQPostQuestRadiantAssault01 Auto Const Mandatory
