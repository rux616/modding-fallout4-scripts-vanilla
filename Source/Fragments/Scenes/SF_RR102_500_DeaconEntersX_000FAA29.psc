;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RR102_500_DeaconEntersX_000FAA29 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
; Kill the start scene trigger
pRR102FailsafeSceneTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pRR102FailsafeSceneTrigger Auto Const
