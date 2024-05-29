;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS05B_PoppaWatchesScene_0102FC78 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawShout)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawShout)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property pDeathclawShout Auto Const

ReferenceAlias Property pPoppaDeathclaw Auto Const

Quest Property pMS05B Auto Const
