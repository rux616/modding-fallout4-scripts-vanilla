;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RETravelCT02_01013835 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Roll to spawn Raider gang.
Int Roll = Utility.RandomInt(0, 2)
If (Roll == 0)
   Alias_RaidersDisciples.EnableAll()
ElseIf (Roll == 1)
   Alias_RaidersOperators.EnableAll()
ElseIf (Roll == 2)
   Alias_RaidersPack.EnableAll()
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

RefCollectionAlias Property Alias_RaidersDisciples Auto Const Mandatory

RefCollectionAlias Property Alias_RaidersOperators Auto Const Mandatory

RefCollectionAlias Property Alias_RaidersPack Auto Const Mandatory
