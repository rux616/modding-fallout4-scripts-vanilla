;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepointMS13Marowski_00084E41 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; set up faction relations with player
; if Marowski is sending thugs, make hostile
if MS13MarowskiRevenge.SendThugs
	REChokepointMS13Faction.SetEnemy(PlayerFaction)
else
	; otherwise, make friends to prevent aggro
	REChokepointMS13Faction.SetAlly(PlayerFaction, true, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; go talk to Marowski
MS13MarowskiRevenge.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; make enemies
REChokepointMS13Faction.SetEnemy(PlayerFaction)
; trigger Marowski hostility
MS13MarowskiRevenge.SetStage(150)
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

ReferenceAlias Property Alias_Raider01 Auto Const

ReferenceAlias Property Alias_Raider02 Auto Const

ReferenceAlias Property Alias_Raider03 Auto Const

MS13MarowskiRevengeScript Property MS13MarowskiRevenge Auto Const

Faction Property PlayerFaction Auto Const

Faction Property REChokepointMS13Faction Auto Const
