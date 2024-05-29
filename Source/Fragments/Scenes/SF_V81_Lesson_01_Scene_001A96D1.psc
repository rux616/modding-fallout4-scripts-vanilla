;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_V81_Lesson_01_Scene_001A96D1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
(ProjectorRef as ProjectorScript).ShowSlide(0)
V81_Lesson_01.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
(ProjectorRef as ProjectorScript).ShowSlide(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
(ProjectorRef as ProjectorScript).ShowSlide(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN CODE
(ProjectorRef as ProjectorScript).ShowSlide(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_14_End
Function Fragment_Phase_14_End()
;BEGIN CODE
(ProjectorRef as ProjectorScript).ShowSlide(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_21_End
Function Fragment_Phase_21_End()
;BEGIN CODE
(ProjectorRef as ProjectorScript).ShowSlide(0)
V81_Lesson_01.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ProjectorRef Auto Const

Quest Property V81_Lesson_01 Auto Const
