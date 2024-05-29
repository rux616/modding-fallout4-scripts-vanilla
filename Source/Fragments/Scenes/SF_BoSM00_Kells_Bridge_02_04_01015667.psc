;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSM00_Kells_Bridge_02_04_01015667 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
;Transfer control to BoSM04
BoSM04.SetStage(10)
BoSM04_Kells_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BoSM04_Kells_Intro Auto Const

Quest Property BoSM04 Auto Const
