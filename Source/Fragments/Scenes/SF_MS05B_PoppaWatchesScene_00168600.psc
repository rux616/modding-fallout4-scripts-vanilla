;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS05B_PoppaWatchesScene_00168600 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;If the player has initiated the final section of the scene
;close out quest when this scene ends

if pMS05B.GetStageDone(500)
  pMS05B.SetStage(510)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
;pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawShout)
;debug.messagebox("Phase 1 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawShout)
;pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawSniff)
;debug.messagebox("Phase 2 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
;debug.messagebox("Phase 3 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
;debug.messagebox("Phase 5 begins!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawShout)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_Begin
Function Fragment_Phase_10_Begin()
;BEGIN CODE
pPoppaDeathclaw.GetActorRef().PlayIdle(pDeathclawDig)
DeathclawDiggingDirtFXE.Play(pPoppaDeathclaw.GetActorRef())
Utility.Wait(15.0)
DeathclawDiggingDirtFXE.Stop(pPoppaDeathclaw.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_12_End
Function Fragment_Phase_12_End()
;BEGIN CODE
if pMS05b.GetStageDone(500)
  pMS05b.SetStage(510)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property pDeathclawShout Auto Const

ReferenceAlias Property pPoppaDeathclaw Auto Const

Quest Property pMS05B Auto Const

Idle Property pDeathclawDig Auto Const

Idle Property pDeathclawSniff Auto Const

Idle Property pDeathclawCombat Auto Const

VisualEffect Property DeathclawDiggingDirtFXE Auto Const
