;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CZ_Scene_TommyIntro_00107D85 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE CZScript
CZScript kmyQuest = GetOwningQuest() as CZScript
;END AUTOCAST
;BEGIN CODE
(kmyquest.Tommy.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
