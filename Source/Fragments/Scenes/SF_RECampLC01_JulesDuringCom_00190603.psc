;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RECampLC01_JulesDuringCom_00190603 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
Jules.GetActorRef().PlayIdle(CowerLooping)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Jules.GetActorRef().PlayIdle(IdleStop)

RECampLC01.SetStage(630)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Jules Auto Const

Idle Property CowerLooping Auto Const

Idle Property IdleStop Auto Const

Quest Property RECampLC01 Auto Const
