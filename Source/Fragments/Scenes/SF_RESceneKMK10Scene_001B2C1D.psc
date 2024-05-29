;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RESceneKMK10Scene_001B2C1D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
RESceneKMK10Counter.SetValue(RESceneKMK10Counter.GetValue() + 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
DeathClaw01.GetActorRef().PlayIdle(DeathclawIdleTaunt)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
DeathClaw02.GetActorRef().PlayIdle(DeathclawIdleTaunt)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Deathclaw01 Auto Const

Idle Property DeathclawIdleTaunt Auto Const

ReferenceAlias Property Deathclaw02 Auto Const

GlobalVariable Property RESceneKMK10Counter Auto Const
