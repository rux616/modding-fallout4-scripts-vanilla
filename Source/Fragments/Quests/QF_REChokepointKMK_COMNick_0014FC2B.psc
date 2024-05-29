;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepointKMK_COMNick_0014FC2B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
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
REChokepointKMK_COMNickFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
REChokepointKMK_COMNickFaction.SetAlly(PlayerFaction)
Alias_RaiderBoss.GetActorRef().StopCombatAlarm()
Alias_Raider01.GetActorRef().StopCombatAlarm()
Alias_Raider02.GetActorRef().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_RaiderBoss.GetActorRef().StopCombatAlarm()
Alias_Raider01.GetActorRef().StopCombatAlarm()
Alias_Raider02.GetActorRef().StopCombatAlarm()
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

Faction Property REPlayerAlly Auto Const

Faction Property REPlayerEnemy Auto Const

ReferenceAlias Property Alias_RaiderBoss Auto Const

Faction Property REChokepointKMK_COMNickFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Alias_Raider01 Auto Const

ReferenceAlias Property Alias_Raider02 Auto Const
