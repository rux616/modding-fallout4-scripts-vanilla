;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RESceneCT10_0104AA26 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

DLC04RESceneCT10RaiderFaction.SetPlayerEnemy()

;Spawn the correct Raider gang based on least favored
If DLC04RankDisciples.GetValue() == 3
   Alias_TraitorDiscipleBoss.TryToEnable()
   Alias_TraitorDisciples.EnableAll()
ElseIf DLC04RankOperators.GetValue() == 3
   Alias_TraitorOperatorBoss.TryToEnable()
   Alias_TraitorOperators.Enableall()
ElseIf DLC04RankPack.GetValue() == 3
   Alias_TraitorPackBoss.TryToEnable()
   Alias_TraitorPack.EnableAll()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC04RESceneCT10_LeaderAttacks.Start()
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

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

GlobalVariable Property DLC04RankDisciples Auto Const Mandatory

GlobalVariable Property DLC04RankOperators Auto Const Mandatory

ReferenceAlias Property Alias_TraitorDiscipleBoss Auto Const Mandatory

RefCollectionAlias Property Alias_TraitorDisciples Auto Const Mandatory

ReferenceAlias Property Alias_TraitorOperatorBoss Auto Const Mandatory

RefCollectionAlias Property Alias_TraitorOperators Auto Const Mandatory

ReferenceAlias Property Alias_TraitorPackBoss Auto Const Mandatory

RefCollectionAlias Property Alias_TraitorPack Auto Const Mandatory

Scene Property DLC04RESceneCT10_LeaderAttacks Auto Const Mandatory

Faction Property DLC04RESceneCT10RaiderFaction Auto Const Mandatory

GlobalVariable Property DLC04RankPack Auto Const Mandatory
