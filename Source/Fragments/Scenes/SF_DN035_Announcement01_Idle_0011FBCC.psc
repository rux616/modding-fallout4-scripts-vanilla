;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN035_Announcement01_Idle_0011FBCC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
;Increment the announcement global.
DN035_RacetrackAnnouncement01Global.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN CODE
;Increment the announcement global.
DN035_RacetrackAnnouncement01Global.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN CODE
;Reset the announcement global.
DN035_RacetrackAnnouncement01Global.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN035_RacetrackAnnouncement01Global Auto Const
