;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04REObjectCT03_01014B5A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move Harvey to marker and remove collar.
Alias_Harvey.GetRef().MoveTo(Alias_CenterMarker.GetRef())
Alias_Harvey.GetActorRef().RemoveItem(DLC04_ShockCollar, 1)
DLC04REObjectCT03_HarveyLoop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
DLC04DialogueHarvey.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
DLC04REObjectCT03_HarveyLoop.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;Companion affinity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
;Companion affinity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0043_Item_00
Function Fragment_Stage_0043_Item_00()
;BEGIN CODE
;Companion affinity
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
;If player didn't free Harvey, move him back to Nuka-World. 

If GetStageDone(30) == 0
   Alias_Harvey.GetRef().MoveTo(DLC04MHubMarketCenterMarker)
EndIf

debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Harvey Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

Scene Property DLC04REObjectCT03_HarveyLoop Auto Const Mandatory

Quest Property DLC04DialogueHarvey Auto Const Mandatory

ObjectReference Property DLC04MHubMarketCenterMarker Auto Const Mandatory

Armor Property DLC04_ShockCollar Auto Const Mandatory

Quest Property DLC04RaiderKickout Auto Const Mandatory
