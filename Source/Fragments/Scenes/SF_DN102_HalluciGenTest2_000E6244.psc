;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN102_HalluciGenTest2_000E6244 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN102_Lab2Lights.Disable()
DN102_LabDemo2Ref.StopDemo()
DN102.ReactivateButton(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
QSTDN102HallucigenLabDemoLightsOn.Play(DN102_Lab2DemoButton)
DN102_Lab2Lights.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
DN102_LabDemo2Ref.StartDemo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN102_Lab2Lights Auto Const

DN102_LabDemo2Script Property DN102_LabDemo2Ref Auto Const

DN102QuestScript Property DN102 Auto Const

ObjectReference Property DN102_Lab2DemoButton Auto Const

Sound Property QSTDN102HallucigenLabDemoLightsOn Auto Const
