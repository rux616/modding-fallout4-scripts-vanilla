;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ06a_DiMATakesTapes_0203177A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest myquest = GetOwningQuest()

if myQuest.GetStageDone(35) && !myQuest.GetStageDone(37)
  myquest.SetStage(37)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
QSTMS07cKelloggProcessData.Play(DiMA.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTMS07cKelloggProcessData Auto Const Mandatory

ReferenceAlias Property DiMA Auto Const Mandatory
