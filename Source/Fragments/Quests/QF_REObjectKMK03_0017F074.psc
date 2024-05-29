;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObjectKMK03_0017F074 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

kmyQuest.REParent.RandomlyEnableOrKill(Alias_FeralGhoul01)
kmyQuest.REParent.RandomlyEnableOrKill(Alias_FeralGhoul02)
kmyQuest.REParent.RandomlyEnableOrKill(Alias_FeralGhoul03)
kmyQuest.REParent.RandomlyEnableOrKill(Alias_FeralGhoul04)
kmyQuest.REParent.RandomlyEnableOrKill(Alias_FeralGhoul05)
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
; OK TO REARM TRIGGER - no permanent object created here
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_FeralGhoul01 Auto Const

ReferenceAlias Property Alias_FeralGhoul02 Auto Const

ReferenceAlias Property Alias_FeralGhoul03 Auto Const

ReferenceAlias Property Alias_FeralGhoul04 Auto Const

ReferenceAlias Property Alias_FeralGhoul05 Auto Const
