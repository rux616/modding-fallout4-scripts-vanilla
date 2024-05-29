;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_holdupquest_00149B01 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.setcandocommand()
akspeaker.changeAnimFlavor()
akspeaker.setAnimArchetypeNervous()
akspeaker.SetValue(pHoldupCommandAV, 1 )
pholdupMessageCommandObeyed.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property pHoldupCommandAV Auto Const

Message Property pholdupMessageCommandObeyed Auto Const
