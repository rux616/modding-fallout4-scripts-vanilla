;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS07bHolotapeMartyBullfin_00147D4F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if MS07b.GetStage() < 20
  MS07b.SetStage(10)
endif

if !pMS07.GetStageDone(80)
  pMS07.SetStage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS07b Auto Const

Quest Property pMS07 Auto Const
