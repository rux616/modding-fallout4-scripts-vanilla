;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN102_HalluciGenTest5_000E6248 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN102_Lab5Lights.Disable()
DN102_LabDemo5Ref.StopDemo()
DN102.ReactivateButton(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
QSTDN102HallucigenLabDemoLightsOn.Play(DN102_Lab5DemoButton)
DN102_Lab5Lights.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DN102_LabDemo5Ref.StartDemo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property DN102_Lab5Lights Auto Const

DN102_LabDemo5Script Property DN102_LabDemo5Ref Auto Const

DN102QuestScript Property DN102 Auto Const

ObjectReference Property DN102_Lab5DemoButton Auto Const

Sound Property QSTDN102HallucigenLabDemoLightsOn Auto Const
