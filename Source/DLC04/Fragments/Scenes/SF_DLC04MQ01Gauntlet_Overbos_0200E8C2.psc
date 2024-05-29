;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ01Gauntlet_Overbos_0200E8C2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
RaiderOverboss.GetActorRef().PlaceAtMe(InstituteBeaconExplosionDUPLICATE000)
RaiderOverboss.GetActorRef().SetValue(DLC04RaiderOverbossResistanceMult, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
RaiderOverboss.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property RaiderOverboss Auto Const Mandatory 

Explosion Property InstituteBeaconExplosionDUPLICATE000 Auto Const Mandatory

ActorValue Property DLC04RaiderOverbossResistanceMult Auto Const Mandatory
