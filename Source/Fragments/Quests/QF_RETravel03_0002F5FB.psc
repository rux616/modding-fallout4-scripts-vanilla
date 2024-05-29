;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravel03_0002F5FB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move Merchant into position
Alias_Merchant.GetRef().MoveTo(Alias_TravelMarkerA1.GetRef())
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

; move merchant back to holding cell if not in workshop faction
actor merchant = Alias_Merchant.GetActorRef()
if merchant.IsInFaction(WorkshopNPCFaction) == false
	merchant.MoveToMyEditorLocation()
else
	; set workshop flags
	WorkshopNPCScript workshopNPC = merchant as WorkshopNPCScript
	workshopNPC.SetCommandable(true)
	workshopNPC.SetAllowCaravan(true)
	workshopNPC.SetAllowMove(true)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Merchant Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

Faction Property WorkshopNPCFaction Auto Const Mandatory
