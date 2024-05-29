;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203VoiceoverMemoryFSpou_000D76E0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MQ203Script
MQ203Script kmyQuest = GetOwningQuest() as MQ203Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndVoiceover()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
