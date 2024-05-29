;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ01Gauntlet_Overbos_0100A550 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
DLC04MQ01Gauntlet.SetRaiderOverbossResistanceMult(1)
RaiderOverboss.GetActorRef().PlaceAtMe(DLC04RaiderOverboss_ExplosionDischargeSmall)
RaiderOverboss.TryToEvaluatePackage()
kMyQuest.RegisterForRaiderOverbossHitEvent()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Explosion Property DLC04RaiderOverboss_ExplosionDischargeSmall Auto Const Mandatory

ReferenceAlias Property RaiderOverboss Auto Const

ActorValue Property DLC04RaiderOverbossResistanceMult Auto Const Mandatory

Explosion Property DLC04RaiderOverboss_ExplosionDischargeLarge Auto Const Mandatory

DLC04:DLC04MQ01GauntletQuestScript Property DLC04MQ01Gauntlet Auto Const Mandatory
