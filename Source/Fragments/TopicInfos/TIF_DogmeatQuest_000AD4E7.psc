;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DogmeatQuest_000AD4E7 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(0)

if DogmeatIntroScene.isplaying()
	DogmeatIntroScene.stop()
endif
;tility.wait(0.1)
;game.getPlayer()).playIdleWithTarget(pairedDogmeatHumanGreetPetKneel, alias_Dogmeat.getActorRef())
;;;;;;;;;;;game.playEventCamera(myEventCamera, akSpeaker)
;etOwningQuest().setObjectiveCompleted(50,true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property PairedDogmeatHumanGreetPetKneel Auto Const

ReferenceAlias Property Alias_Dogmeat Auto Const

CameraShot Property myEventCamera Auto Const

Scene Property DogmeatIntroScene Auto Const
