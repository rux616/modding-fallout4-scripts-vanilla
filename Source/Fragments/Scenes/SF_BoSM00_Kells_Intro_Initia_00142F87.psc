;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSM00_Kells_Intro_Initia_00142F87 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;Ready BoSM02 if appropriate.
if (BoSM01.GetStage() >= 200)
     BoSM02.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoSM01 Auto Const

Scene Property BoSM01_Kells_Main1 Auto Const

Scene Property BoSM00_Kells_Transition Auto Const

Quest Property BoSM02 Auto Const

Scene Property BoSM02_KellsStage010Main1 Auto Const
