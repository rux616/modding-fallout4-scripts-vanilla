;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ105_000E871A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.StartDialogueCameraOrCenterOnTarget(dogmeat.getactorref())

if player.getActorRef().playIdleWithTarget(dogmeatPairedAnim, Dogmeat.getActorRef())
  debug.trace(self + "Dogmeat/Player anim SUCCESSFUL")
Else
  debug.trace(self + "Dogmeat/Player anim FAILED")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Player Auto Const

ReferenceAlias Property Dogmeat Auto Const

Idle Property dogmeatPairedAnim Auto Const
