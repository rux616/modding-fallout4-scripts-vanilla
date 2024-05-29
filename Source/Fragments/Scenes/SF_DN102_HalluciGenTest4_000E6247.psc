;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN102_HalluciGenTest4_000E6247 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN102_Lab4Lights.Disable()
DN102_LabDemo4Ref.StopDemo()
DN102.ReactivateButton(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
QSTDN102HallucigenLabDemoLightsOn.Play(DN102_Lab4DemoButton)
DN102_Lab4Lights.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
DN102_LabDemo4Ref.StartDemo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
DN102_LabDemo4Ref.StopDemo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DN102_LabDemo4Script Property DN102_LabDemo4Ref Auto Const

ObjectReference Property DN102_Lab4Lights Auto Const

DN102QuestScript Property DN102 Auto Const

ObjectReference Property DN102_Lab4DemoButton Auto Const

Sound Property QSTDN102HallucigenLabDemoLightsOn Auto Const
