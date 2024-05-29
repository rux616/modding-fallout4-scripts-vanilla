;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_holdupquest_00149B00 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akspeaker.changeanimflavor()
akspeaker.SetValue(Game.GetConfidenceAV(), 4 )
akspeaker.SetValue(pHoldupFleeAV, 1)
akspeaker.evaluatePackage()
pholdupMessageCommandObeyed.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property pHoldupFleeAV Auto Const

Message Property pholdupMessageCommandObeyed Auto Const
