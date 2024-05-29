;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN102_HalluciGenTest1_000E623C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN102_Lab1Lights.Disable()
DN102_LabDemo1Ref.StopDemo()
DN102.ReactivateButton(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
QSTDN102HallucigenLabDemoLightsOn.Play(DN102_Lab1DemoButton)
DN102_Lab1Lights.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DN102_LabDemo1Ref.StartDemo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN102_Lab1Lights Auto Const

DN102_LabDemo1Script Property DN102_LabDemo1Ref Auto Const

DN102QuestScript Property DN102 Auto Const

Sound Property QSTDN102HallucigenLabDemoLightsOn Auto Const

ObjectReference Property DN102_Lab1DemoButton Auto Const
