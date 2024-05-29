;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04PackScentGrenadeQues_01025AE7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04PackScentGrenadeQuestScript
Quest __temp = self as Quest
DLC04:DLC04PackScentGrenadeQuestScript kmyQuest = __temp as DLC04:DLC04PackScentGrenadeQuestScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyquest.Initialize()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0998_Item_00
Function Fragment_Stage_0998_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04PackScentGrenadeQuestScript
Quest __temp = self as Quest
DLC04:DLC04PackScentGrenadeQuestScript kmyQuest = __temp as DLC04:DLC04PackScentGrenadeQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Shutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
