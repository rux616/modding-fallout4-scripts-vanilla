;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01RETravelSC02_01010977 Extends Quest Hidden Const

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

;This encounter is 1 Sentry and 2-4 Eyebots.
;The Sentry, Eyebot01, and Eyebot02 all start enabled. Roll for 3 & 4, based on player level.
if ((Game.GetPlayer().GetLevel() > 30) && (Utility.RandomInt(0, 1) == 0))
     Alias_Eyebot03.TryToEnable()
     if ((Game.GetPlayer().GetLevel() > 40) && (Utility.RandomInt(0, 1) == 0))
          Alias_Eyebot04.TryToEnable()
     EndIf
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

ReferenceAlias Property Alias_EyeBot03 Auto Const Mandatory

ReferenceAlias Property Alias_EyeBot04 Auto Const Mandatory
