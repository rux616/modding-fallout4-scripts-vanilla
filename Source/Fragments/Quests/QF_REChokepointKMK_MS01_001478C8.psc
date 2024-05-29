;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepointKMK_MS01_001478C8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move "boss" (Bullet or friend) to marker and enable
actor boss = Alias_Boss.GetActorRef()
boss.moveTo(Alias_ChokepointMarkerA1.GetRef())
boss.SetValue(Game.GetAggressionAV(), 0)
boss.enable()
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

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Boss.TryToSetValue(Game.GetAggressionAV(), 1)
Alias_Thug01.TryToSetValue(Game.GetAggressionAV(), 1)
Alias_Thug02.TryToSetValue(Game.GetAggressionAV(), 1)
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
; disable bullet, if he was here
Alias_Bullet.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Boss Auto Const

ReferenceAlias Property Alias_ChokepointMarkerA1 Auto Const

ReferenceAlias Property Alias_Thug01 Auto Const

ReferenceAlias Property Alias_Thug02 Auto Const

ReferenceAlias Property Alias_Bullet Auto Const
