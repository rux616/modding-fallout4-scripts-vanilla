;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CreatureDialogueProtectr_001C5A23 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getPlayer().removeItem(subwayTicket, 1, false, akSpeaker)
ProtectronRequestingSubwayToken.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property SubwayTicket Auto Const

Scene Property ProtectronRequestingSubwayToken Auto Const
