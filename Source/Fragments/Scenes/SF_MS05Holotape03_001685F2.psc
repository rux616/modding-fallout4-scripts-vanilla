;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS05Holotape03_001685F2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if !pMS05B.GetStageDone(150) && pMS05B.GetStageDone(250) && !pMS05B.GetStageDone(400) && !pMS05B.GetStageDone(500)
  pMS05B.SetStage(225)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS05B Auto Const
