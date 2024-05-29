;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CZ_Arena_Combat_Post_A_0010C012 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE arenascript
arenascript kmyQuest = GetOwningQuest() as arenascript
;END AUTOCAST
;BEGIN CODE
(kmyquest.RingMaster.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE arenascript
arenascript kmyQuest = GetOwningQuest() as arenascript
;END AUTOCAST
;BEGIN CODE
(kmyquest.RingMaster.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
