;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelKMK12_001A0A47 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move trader patrol markers to workshop center markers
ObjectReference marker1 = alias_workshop01centermarker.Getref()
ObjectReference marker2 = alias_workshop02centermarker.Getref()
if marker1 && marker2
	REBrahminVendorPatrolMarker01.MoveTo(marker1)
	REBrahminVendorPatrolMarker02.MoveTo(marker2)
endif
; move trader to marker
Alias_trader.TryToMoveTo(Alias_TravelMarkerA1.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; player buys a brahmin
Game.GetPlayer().RemoveItem(game.GetCaps(), REBrahminVendorPrice.GetValueInt(), false, Alias_Trader.GetRef())
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
; delete brahmin if player doesn't buy
if getStageDone(200) == false
  Alias_Brahmin.GetRef().Delete()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ObjectReference Property CovenantMapMarker Auto Const

Quest Property MS17MiscCovenant Auto Const

Quest Property BoS100MiscCambridge Auto Const

Quest Property MS01MiscObj Auto Const

Quest Property MS05MiscSalem Auto Const

Quest Property MS11MiscCharleston Auto Const

ObjectReference Property REBrahminVendorPatrolMarker01 Auto Const

ObjectReference Property REBrahminVendorPatrolMarker02 Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

ReferenceAlias Property Alias_Trader Auto Const

ReferenceAlias Property Alias_Workshop01CenterMarker Auto Const

ReferenceAlias Property Alias_Workshop02CenterMarker Auto Const

ReferenceAlias Property Alias_Brahmin Auto Const

GlobalVariable Property REBrahminVendorPrice Auto Const
