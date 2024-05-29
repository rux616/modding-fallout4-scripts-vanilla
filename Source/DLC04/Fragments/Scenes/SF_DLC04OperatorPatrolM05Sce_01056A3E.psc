;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04OperatorPatrolM05Sce_01056A3E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
Alias_OperatorPatrol01.GetActorRef().PlayIdle(DLC04PreppingRifle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
DLC04OperatorPatrolRifleGlobal.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property DLC04PreppingRifle Auto Const Mandatory

ReferenceAlias Property Alias_OperatorPatrol01 Auto Const

GlobalVariable Property DLC04OperatorPatrolRifleGlobal Auto Const Mandatory
