;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ207ChildShaunScene_000570C2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE mq206questscript
mq206questscript kmyQuest = GetOwningQuest() as mq206questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerPCAPSceneStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mq206questscript
mq206questscript kmyQuest = GetOwningQuest() as mq206questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerPCAPSceneEnd()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE mq206questscript
mq206questscript kmyQuest = GetOwningQuest() as mq206questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.KidConvStarted=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
