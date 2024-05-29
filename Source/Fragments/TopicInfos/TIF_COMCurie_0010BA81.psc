;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_COMCurie_0010BA81 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE COMCurieScript
COMCurieScript kmyQuest = GetOwningQuest() as COMCurieScript
;END AUTOCAST
;BEGIN CODE
; Curie could now be a companion
Alias_Curie.GetActorRef().SetAvailableToBeCompanion()

; But she's currently rejected
kmyQuest.bRejectCompanion = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Curie Auto Const
