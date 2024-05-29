;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Arena_Announcement_Pre_0002347D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
(kmyquest.RingMaster.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(True)
if kmyquest.IsPlayerInRing == false
   kmyquest.PlayerFailedToEnterRing()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetPlaceWagerObjective(IsAcceptingWagers = false)
kmyquest.AnnounceFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetPlaceWagerObjective(IsAcceptingWagers = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
(kmyquest.RingMaster.GetActorReference() as BroadcastSpeakerActorScript).ToggleSpeakers(false)
kmyquest.SetPlaceWagerObjective(IsAcceptingWagers = false)
kmyquest.AnnounceFight()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CZ Auto Const
