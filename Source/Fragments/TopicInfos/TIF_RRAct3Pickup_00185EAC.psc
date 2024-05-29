;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RRAct3Pickup_00185EAC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RRAct3PickupScript
RRAct3PickupScript kmyQuest = GetOwningQuest() as RRAct3PickupScript
;END AUTOCAST
;BEGIN CODE
; You've heard Dez's spiel
kmyQuest.bTalkedWithDez = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
