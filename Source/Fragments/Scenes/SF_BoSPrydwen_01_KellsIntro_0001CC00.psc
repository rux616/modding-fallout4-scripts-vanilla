;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_01_KellsIntro_0001CC00 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
BoSKellsIntroDone.SetValue(1)
if (!BoSM00.GetStageDone(20))
     BoSM00_Kells_Intro_Initial.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSKellsIntroDone Auto Const Mandatory

Scene Property BoSM00_Kells_Intro_Initial Auto Const

Quest Property BoSM00 Auto Const Mandatory
