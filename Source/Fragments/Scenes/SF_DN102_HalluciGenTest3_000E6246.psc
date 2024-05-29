;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN102_HalluciGenTest3_000E6246 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN102_Lab3Lights.Disable()
DN102_LabDemo3Ref.StopDemo()
DN102.ReactivateButton(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
QSTDN102HallucigenLabDemoLightsOn.Play(DN102_Lab3DemoButton)
DN102_Lab3Lights.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DN102_LabDemo3Ref.StartDemo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN102_Lab3Lights Auto Const

DN102_LabDemo3Script Property DN102_LabDemo3Ref Auto Const

DN102QuestScript Property DN102 Auto Const

Sound Property QSTDN102HallucigenLabDemoLightsOn Auto Const

ObjectReference Property DN102_Lab3DemoButton Auto Const
