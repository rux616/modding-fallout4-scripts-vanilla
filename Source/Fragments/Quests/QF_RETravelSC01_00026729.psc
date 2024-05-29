;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelSC01_00026729 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
ObjectReference temp

;We want 2-4 Radstags, with 4 only rarely at higher levels.
;50% flat chance of removing a RadStag.
if (Utility.RandomInt(0, 1) == 0)
     temp = Alias_RadStags.GetAt(Alias_Radstags.GetCount() - 1)
     Alias_Radstags.RemoveRef(temp)
     temp.Disable()
     temp.Delete()
EndIf
;If player is below Level 20, or 50% chance, cut another RadStag.
if ((Game.GetPlayer().GetLevel() < 20) || (Utility.RandomInt(0, 1) == 0))
     temp = Alias_RadStags.GetAt(Alias_Radstags.GetCount() - 1)
     Alias_Radstags.RemoveRef(temp)
     temp.Disable()
     temp.Delete()
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
