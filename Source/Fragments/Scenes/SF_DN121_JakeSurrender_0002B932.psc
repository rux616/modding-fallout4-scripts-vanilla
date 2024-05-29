;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN121_JakeSurrender_0002B932 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE dn121questscript
dn121questscript kmyQuest = GetOwningQuest() as dn121questscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.JakeStartHandsUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE dn121questscript
dn121questscript kmyQuest = GetOwningQuest() as dn121questscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.JakeStopHandsUp()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
