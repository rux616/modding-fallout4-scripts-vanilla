;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03DialogueFarHarbor_01005C46 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; If the player is being screwed by Allen, add the overcharge Perk
if ( GetOwningQuest().GetStageDone(410) )
 Game.GetPlayer().AddPerk(pDLC03AllenMarkUpPerk)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property pDLC03AllenMarkUpPerk Auto Const Mandatory
