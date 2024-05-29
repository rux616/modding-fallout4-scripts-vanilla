;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborS01Defend_0100AB19 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopSettlementDefendScript
Quest __temp = self as Quest
DLC03:WorkshopSettlementDefendScript kmyQuest = __temp as DLC03:WorkshopSettlementDefendScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
setStage(20)
Alias_SettlementMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopSettlementDefendScript
Quest __temp = self as Quest
DLC03:WorkshopSettlementDefendScript kmyQuest = __temp as DLC03:WorkshopSettlementDefendScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForWorkshopEvents()
setStage(20)
; make workshop owned
kmyQuest.PlayerOwnsWorkshop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; trigger attack now
kmyQuest.TryToStartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopSettlementDefendScript
Quest __temp = self as Quest
DLC03:WorkshopSettlementDefendScript kmyQuest = __temp as DLC03:WorkshopSettlementDefendScript
;END AUTOCAST
;BEGIN CODE
; failsafe
kmyQuest.RegisterForWorkshopEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_01
Function Fragment_Stage_0130_Item_01()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
setStage(20) ; failsafe
setStage(120) ; no more building defenses
; failsafe - give objective if you never talked to Ken
DLC03FarHarborS01.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopSettlementDefendScript
Quest __temp = self as Quest
DLC03:WorkshopSettlementDefendScript kmyQuest = __temp as DLC03:WorkshopSettlementDefendScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 200")
setStage(20) ; failsafe
setStage(150) ; failsafe
; tell parent quest we won
DLC03FarHarborS01.SetStage(300)
; can now just stop this quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; not sure we care about this, but just in case
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE WorkshopAttackScript
Quest __temp = self as Quest
WorkshopAttackScript kmyQuest = __temp as WorkshopAttackScript
;END AUTOCAST
;BEGIN CODE
; check to see if attack needs to be resolved by script
kmyQuest.CheckResolveAttack()
; kill Uncle Ken?
Alias_SettlementSpokesman.GetActorRef().KillEssential()
; stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE DLC03:WorkshopSettlementDefendScript
Quest __temp = self as Quest
DLC03:WorkshopSettlementDefendScript kmyQuest = __temp as DLC03:WorkshopSettlementDefendScript
;END AUTOCAST
;BEGIN CODE
DLC03FarHarborS01.SetStage(9000) ; fail quest?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
debug.trace(self + " stage 500")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RaiderMapMarker Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

RefCollectionAlias Property Alias_Raiders Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

ReferenceAlias Property Alias_SettlementSpokesman Auto Const

Quest Property DLC03FarHarborS01 Auto Const Mandatory
