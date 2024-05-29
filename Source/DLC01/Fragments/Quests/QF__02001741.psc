;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF__02001741 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STARTING")
kmyQuest.Startup()
ObjectReference temp

;This encounter is either 4 RoboRaiders, 4 Mechbots, or 3 RoboRaiders vs. 3 MechBots.
int roll = Utility.RandomInt(0, 2)
if (roll == 0)
     ;4 RoboRaiders.
     Alias_RoboRaider01.TryToEnableNoWait()
     Alias_RoboRaider02.TryToEnableNoWait()
     Alias_RoboRaider03.TryToEnableNoWait()
     Alias_RoboRaider04.TryToEnableNoWait()
ElseIf (roll == 1)
     ;4 MechBots.
     Alias_MechBot01.TryToEnableNoWait()
     Alias_MechBot02.TryToEnableNoWait()
     Alias_MechBot03.TryToEnableNoWait()
     Alias_MechBot04.TryToEnableNoWait()
Else ;roll == 2
     ;3 RoboRaiders vs. 3 MechBots
     Alias_RoboRaider01.TryToEnableNoWait()
     Alias_RoboRaider02.TryToEnableNoWait()
     Alias_RoboRaider03.TryToEnableNoWait()
     Alias_MechBot01.TryToEnableNoWait()
     Alias_MechBot02.TryToEnableNoWait()
     Alias_MechBot03.TryToEnableNoWait()
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

RefCollectionAlias Property Alias_RadStags Auto Const

ReferenceAlias Property Alias_RoboRaider01 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider02 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider04 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider03 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot01 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot02 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot03 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot04 Auto Const Mandatory
