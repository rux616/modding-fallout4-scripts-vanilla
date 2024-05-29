;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR201_0023D9BE Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RR201Script
RR201Script kmyQuest = GetOwningQuest() as RR201Script
;END AUTOCAST
;BEGIN CODE
; Add a new holotape to the player
kmyQuest.MaybeGiveHolotape()

;Game.GetPlayer().AddItem(pMQ206HolotapeRR)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Holotape Property pMQ206HolotapeRR Auto Const Mandatory
