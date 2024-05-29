;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS05Holotape02_001685F1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
if !pMS05B.GetStageDone(50) && !pMS05B.GetStageDone(100) && !pMS05B.GetStageDone(150) && !pMS05B.GetStageDone(250)
  pMS05B.SetStage(50)
;  debug.messagebox("Holotape 2 done!")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS05B Auto Const
