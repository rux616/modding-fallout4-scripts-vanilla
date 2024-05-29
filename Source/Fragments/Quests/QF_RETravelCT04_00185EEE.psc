;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelCT04_00185EEE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

Utility.Wait(4)
Int Chaser = Utility.RandomInt(1, 2)
If (Chaser == 2)
Alias_YaoGuai01.GetRef().Enable()
Alias_YaoGuai01.GetActorRef().StartCombat(Alias_ViciousDog01.GetActorRef())
EndIf
If(Chaser == 1)
Alias_Deathclaw01.GetRef().Enable()
Alias_Deathclaw01.GetActorRef().StartCombat(Alias_ViciousDog01.GetActorRef())
EndIf
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

ReferenceAlias Property Alias_YaoGuai01 Auto Const

ReferenceAlias Property Alias_ViciousDog01 Auto Const

ReferenceAlias Property Alias_Deathclaw01 Auto Const
