;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DN060_00182E01 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor myActor = (DN060_RobotMiddle as Actor)
myActor.Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN060_RobotBaby Auto Const

ObjectReference Property DN060_RobotLaundry Auto Const

ObjectReference Property DN060_RobotMiddle Auto Const
