;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS02_001797E9 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
quest myquest = GetOwningQuest()
if !myquest.IsObjectiveDisplayed(250) && DN158_YangtzePumpingInProgress.GetValue() != 1
	myquest.SetObjectiveDisplayed(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN158_YangtzePumpingInProgress Auto Const
