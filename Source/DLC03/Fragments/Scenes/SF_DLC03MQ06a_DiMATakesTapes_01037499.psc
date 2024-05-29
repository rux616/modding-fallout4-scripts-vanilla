;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ06a_DiMATakesTapes_01037499 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if DLC03MQ06a.GetStageDone(35) && !DLC03MQ06a.GetStageDone(37)
  DLC03MQ06a.SetStage(37)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06a Auto Const Mandatory

ReferenceAlias Property DiMA Auto Const Mandatory

Sound Property QSTMS07cKelloggProcessData Auto Const Mandatory
