;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_V81_00_Intro_Overseer_Int_00153857 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_13_Begin
Function Fragment_Phase_13_Begin()
;BEGIN CODE
If V81_00_Intro.GetStageDone(400)
   V81_00_Intro.SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property V81_00_Intro Auto Const
