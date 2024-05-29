;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelKMK_MS17_00143A16 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
actor swanson = Alias_Swanson.GetActorRef()
swanson.MoveTo(Alias_TravelMarkerA1.GetRef())
swanson.Enable()
; he's crazed melee guy now
swanson.SetCombatStyle(csRaider01AllOffenseMelee)
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
; disable swanson if still alive
actor swanson = Alias_Swanson.GetActorRef()
if swanson.IsDead() == false
	swanson.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Swanson Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

CombatStyle Property csRaider01AllOffenseMelee Auto Const
