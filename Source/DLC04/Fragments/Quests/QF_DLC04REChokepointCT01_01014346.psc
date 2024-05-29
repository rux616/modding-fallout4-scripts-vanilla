;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04REChokepointCT01_01014346 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Spawn enemy Raider gang based on global.
If DLC04EnemyGang.GetValue() == 1
   Alias_EnemyDisciples.EnableAll()
ElseIf DLC04EnemyGang.GetValue() == 2
   Alias_EnemyOperators.EnableAll()
ElseIf DLC04EnemyGang.GetValue() == 3
   Alias_EnemyPack.EnableAll()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set when the player enters the trigger volume, representing
;the guarded/checkpoint area.
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

RefCollectionAlias Property Alias_EnemyDisciples Auto Const Mandatory

RefCollectionAlias Property Alias_EnemyOperators Auto Const Mandatory

RefCollectionAlias Property Alias_EnemyPack Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
