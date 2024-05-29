;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_holdupquest_001C502B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.setcandocommand()
akspeaker.changeAnimFlavor()
akspeaker.setAnimArchetypeNervous()
akspeaker.SetValue(pHoldupCommandAV, 1 )
akspeaker.RemoveFromAllFactions()
akspeaker.AddtoFaction(pholdupFaction)
;akspeaker.SetValue(pAssistance, 0 )
akspeaker.SetValue(pAggression, 1 )
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property pHoldupCommandAV Auto Const

ActorValue Property pAssistance Auto Const

ActorValue Property pAggression Auto Const

Faction Property pHoldupFaction Auto Const
