;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRandomPatrolChangeLoc_0015CE45 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; startup
kmyQuest.Startup()
; how many to enable?
; at least 2
; more as you get more settlements
float settlementCount = MinutemenOwnedSettlements.GetValue()
int max = Math.Min(alias_Minutemen.GetCount(), settlementCount/2) as int
max = Math.Max(max, 2) as int

debug.trace(self + " max = " + max)

int enableCount = Utility.RandomInt(2, max)
int i = 0
while i < enableCount
	 alias_Minutemen.GetAt(i).Enable()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Minutemen Auto Const

GlobalVariable Property MinutemenOwnedSettlements Auto Const
