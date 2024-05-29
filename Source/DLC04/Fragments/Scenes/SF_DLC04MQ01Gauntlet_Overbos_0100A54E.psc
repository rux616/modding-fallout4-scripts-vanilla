;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ01Gauntlet_Overbos_0100A54E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
RaiderOverboss.TryToEvaluatePackage()
kMyQuest.RegisterForRaiderOverbossHitEvent()
kMyQuest.PlayShieldDownScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
RaiderOverboss.GetActorRef().PlayIdle(DLC04OverBossShortCircuit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DLC04MQ01Gauntlet.SetRaiderOverbossResistanceMult(1)
RaiderOverboss.GetActorRef().PlaceAtMe(DLC04RaiderOverboss_ExplosionDischargeMAX)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property MQ101Soldier Auto Const Mandatory

ReferenceAlias Property RaiderOverboss Auto Const

Explosion Property pulseGrenadeExplosion Auto Const Mandatory

ActorValue Property DLC04RaiderOverbossResistanceMult Auto Const Mandatory

Explosion Property DLC04RaiderOverboss_ExplosionDischargeSmall Auto Const Mandatory

Explosion Property DLC04RaiderOverboss_ExplosionDischargeMAX Auto Const Mandatory

DLC04:DLC04MQ01GauntletQuestScript Property DLC04MQ01Gauntlet Auto Const Mandatory

Idle Property DLC04OverBossShortCircuit Auto Const Mandatory
