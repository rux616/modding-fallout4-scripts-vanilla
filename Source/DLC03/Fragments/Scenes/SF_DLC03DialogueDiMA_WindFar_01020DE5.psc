;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03DialogueDiMA_WindFar_01020DE5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
QSTMS07cKelloggProcessData.Play(DiMA.GetRef())
DiMA.GetActorRef().PlayIdle(DLC03DiMA_Remembering)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTMS07cKelloggProcessData Auto Const Mandatory

ReferenceAlias Property DiMA Auto Const

Idle Property DLC03DiMA_Remembering Auto Const Mandatory
