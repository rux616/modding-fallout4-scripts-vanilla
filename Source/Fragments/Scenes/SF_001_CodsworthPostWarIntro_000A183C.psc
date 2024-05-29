;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_001_CodsworthPostWarIntro_000A183C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DialogueCodsworthPostWarScript
DialogueCodsworthPostWarScript kmyQuest = GetOwningQuest() as DialogueCodsworthPostWarScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerPCAPSceneStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DialogueCodsworthPostWarScript
DialogueCodsworthPostWarScript kmyQuest = GetOwningQuest() as DialogueCodsworthPostWarScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerPCAPSceneEnd()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_Begin
Function Fragment_Phase_11_Begin()
;BEGIN AUTOCAST TYPE DialogueCodsworthPostWarScript
DialogueCodsworthPostWarScript kmyQuest = GetOwningQuest() as DialogueCodsworthPostWarScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerPCAPSceneEnd()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
