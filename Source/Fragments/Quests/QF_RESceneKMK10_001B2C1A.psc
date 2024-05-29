;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneKMK10_001B2C1A Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Deathclaw01.GetActorRef().StartCombat(Alias_DeathClaw02.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_DeathClaw01.GetActorRef().SetValue(GenericBrawlLoser, 1)
setstage(300)

utility.wait(2.0)

Alias_DeathClaw02.GetActorRef().PlayIdle(DeathclawIdleTaunt)

; deathclaw 2 now very aggressive again
Alias_Deathclaw02.TryToSetValue(Game.GetAggressionAV(), 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_DeathClaw02.GetActorRef().SetValue(GenericBrawlLoser, 1)
setstage(300)

utility.wait(2.0)

Alias_DeathClaw01.GetActorRef().PlayIdle(DeathclawIdleTaunt)

; deathclaw 1 now very aggressive again
Alias_Deathclaw01.TryToSetValue(Game.GetAggressionAV(), 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
actor deathclaw1 = Alias_Deathclaw01.GetActorRef()
actor deathclaw2 = Alias_Deathclaw02.GetActorRef()

deathclaw1.RemoveFromFaction(RESceneKMK10DeathclawFaction)
deathclaw2.RemoveFromFaction(RESceneKMK10DeathclawFaction)

deathclaw1.stopcombatalarm()
deathclaw2.stopcombatalarm()

RESceneKMK10Scene.Stop()

deathclaw1.EvaluatePackage()
deathclaw2.EvaluatePackage()
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

ReferenceAlias Property Alias_Deathclaw01 Auto Const

ReferenceAlias Property Alias_Deathclaw02 Auto Const

Faction Property RESceneKMK10DeathclawFaction Auto Const

Scene Property RESceneKMK10Scene Auto Const

Idle Property DeathclawIdleTaunt Auto Const

ActorValue Property GenericBrawlLoser Auto Const
