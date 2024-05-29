;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_QuestHookRE2_0104B128 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

Alias_Pearl.GetReference().MoveTo(Alias_TravelMarkerA1.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Pearl.GetActorRef().RemoveItem(Alias_Note.GetReference(), 1, Game.GetPlayer())
DLC03_V118_Quest2.SetStage(10)
utility.wait(1.0)
Alias_Pearl.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Pearl Auto Const Mandatory

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const Mandatory

ReferenceAlias Property Alias_TRIGGER Auto Const Mandatory


ReferenceAlias Property Alias_Note Auto Const Mandatory

Quest Property DLC03_V118_Quest2 Auto Const Mandatory
