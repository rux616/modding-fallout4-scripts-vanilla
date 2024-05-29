;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF__02001EE4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;We want 3-5 MechBots. 1-3 are always enabled, so we just need to roll for 4 & 5.
if (Utility.RandomInt(0, 1) == 0)
     Alias_DeadMechBot04.TryToEnableNoWait()
EndIf
if (Utility.RandomInt(0, 2) == 0)
     Alias_DeadMechBot05.TryToEnableNoWait()
EndIf

;We want 3-5 RoboRaiders. 1-3 are always enabled, so we just need to roll for 4 & 5.
if (Utility.RandomInt(0, 1) == 0)
     Alias_RoboRaider04.TryToEnableNoWait()
EndIf
if (Utility.RandomInt(0, 2) == 0)
     Alias_RoboRaider05.TryToEnableNoWait()
EndIf
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

ReferenceAlias Property Alias_DeadMechBot01 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider05 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider04 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider03 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider02 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider01 Auto Const Mandatory

ReferenceAlias Property Alias_DeadMechBot03 Auto Const Mandatory

ReferenceAlias Property Alias_DeadMechBot04 Auto Const Mandatory

ReferenceAlias Property Alias_DeadMechBot02 Auto Const Mandatory

ReferenceAlias Property Alias_DeadMechBot05 Auto Const Mandatory
