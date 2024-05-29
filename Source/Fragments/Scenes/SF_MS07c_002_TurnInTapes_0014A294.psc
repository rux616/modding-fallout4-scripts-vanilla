;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS07c_002_TurnInTapes_0014A294 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
MS07c_NickRemovedFromService.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
QSTMS07cKelloggProcessData.Play(NickValentine.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTMS07cKelloggProcessData Auto Const

ReferenceAlias Property NickValentine Auto Const

Message Property MS07c_NickRemovedFromService Auto Const
