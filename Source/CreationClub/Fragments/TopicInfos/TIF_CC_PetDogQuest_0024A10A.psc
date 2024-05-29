;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:TopicInfos:TIF_CC_PetDogQuest_0024A10A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().playIdleWithTarget(PairedDogmeatHumanGreetPetKneel, akSpeakerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property PairedDogmeatHumanGreetPetKneel Auto Const
