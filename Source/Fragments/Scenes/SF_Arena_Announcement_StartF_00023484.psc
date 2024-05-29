;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Arena_Announcement_StartF_00023484 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
kmyquest.startFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
(kmyquest.RingMaster.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
(kmyquest.RingMaster.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
