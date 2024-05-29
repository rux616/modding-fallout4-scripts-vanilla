;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR303_001475C7 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Do some camera shake
game.ShakeCamera(None, 1.0, 2.0)
game.ShakeController(1.0, 1.0, 1.5)
pRR303DustFallFX.playAnimation("charFXburstA")
pRR303DustFallFX.getLinkedRef().playAnimation("charFXburstA")
pRR303DustFallFX.getLinkedRef().getLinkedRef().playAnimation("charFXburstA")
; Play the sound
int instanceID = pQSTRR302RailroadExplosion2D.play(pRRHQSecretExitDoor)  
Sound.SetInstanceVolume(instanceID, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sound Property pQSTRR302RailroadExplosion2D Auto Const

ObjectReference Property pRRHQSecretExitDoor Auto Const

ObjectReference Property pRR303DustFallFX Auto Const
