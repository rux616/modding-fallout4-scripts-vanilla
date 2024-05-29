;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_REChokepoint02_MrGutsyFor_0003AA80 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
REChokepoint02_MrGutsyAnnouncement.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if (GetOwningQuest().GetStage() < 30)
     REChokepoint02_MrGutsyAnnouncement.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property REChokepoint02_MrGutsyAnnouncement Auto Const
