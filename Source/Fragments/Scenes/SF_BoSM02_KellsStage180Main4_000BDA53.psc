;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSM02_KellsStage180Main4_000BDA53 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if (GetOwningQuest().GetStageDone(430))
     GetOwningQuest().SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
BoSR03.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
;Make sure BoSM02 completes, even at the lowest reward level.
GetOwningQuest().SetStage(430)

;Transfer control to BoSM00.
BoSM00_Kells_Bridge_02_04.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoSM00 Auto Const

Scene Property BoSM00_Kells_Bridge_02_04 Auto Const

Scene Property BoSM00_Kells_BoSM02_to_BoSR03 Auto Const

Quest Property BoSR03 Auto Const
