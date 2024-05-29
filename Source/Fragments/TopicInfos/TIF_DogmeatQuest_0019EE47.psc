;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DogmeatQuest_0019EE47 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getPlayer().playIdleWithTarget(pairedDogmeatHumanGreetPetKneel, alias_Dogmeat.getActorRef())
getOwningQuest().setObjectiveCompleted(50,true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property PairedDogmeatHumanGreetPetKneel Auto Const Mandatory

ReferenceAlias Property Alias_Dogmeat Auto Const
