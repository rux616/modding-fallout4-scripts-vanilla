;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04WorkshopVassalRaider_0102963F Extends Quest Hidden Const

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
; get gang value
int gangValue = Alias_Workshop.GetRef().GetValue(DLC04WorkshopRaiderGangValue) as int

; at least 2
; more as you get more outposts
int outpostCount = OutpostCountGlobals[gangValue-1].GetValueInt()

int max = Math.Min(Raiders[gangValue-1].GetCount(), outpostCount) as int
max = Math.Max(max, 2) as int

debug.trace(self + " max = " + max)

int enableCount = Utility.RandomInt(2, max)
int i = 0
while i < enableCount
	Raiders[gangValue-1].GetAt(i).Enable()
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias[] Property Raiders Auto Const

ReferenceAlias Property Alias_Workshop Auto Const Mandatory

ActorValue Property DLC04WorkshopRaiderGangValue Auto Const Mandatory

GlobalVariable[] Property OutpostCountGlobals Auto Const
