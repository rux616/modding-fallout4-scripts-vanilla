;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF__0200E8C4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
RaiderOverboss.TryToEvaluatePackage()
DLC04MQ01Gauntlet.RegisterForRaiderOverbossHitEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
RaiderOverboss.GetActorRef().PlayIdle(MQ101Soldier)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DLC04MQ01Gauntlet.SetRaiderOverbossResistanceMult(1)
RaiderOverboss.GetActorRef().PlaceAtMe(DLC04RaiderOverboss_ExplosionDischargeLarge)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property MQ101Soldier Auto Const Mandatory

ReferenceAlias Property RaiderOverboss Auto Const

Explosion Property pulseGrenadeExplosion Auto Const Mandatory

ActorValue Property DLC04RaiderOverbossResistanceMult Auto Const Mandatory

Explosion Property JammerExplosion Auto Const Mandatory

Explosion Property DLC04RaiderOverboss_ExplosionDischargeLarge Auto Const Mandatory

DLC04:DLC04MQ01GauntletQuestScript Property DLC04MQ01Gauntlet Auto Const Mandatory
