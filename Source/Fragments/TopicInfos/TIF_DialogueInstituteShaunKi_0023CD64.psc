;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueInstituteShaunKi_0023CD64 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(LLC_MiscMod_AllGuns, 2)
Game.GetPlayer().AddItem(LLC_MiscMod_AllGuns_75,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LLC_MiscMod_AllGuns Auto Const Mandatory

LeveledItem Property LLC_MiscMod_AllGuns_75 Auto Const Mandatory
