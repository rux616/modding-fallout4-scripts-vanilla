;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS16PostQuest_00188700 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if FFGoodneighbor07.IsRunning() && !FFGoodneighbor07.GetStageDone(5) && akSpeaker.GetCurrentLocation() == BobbisNewPlace && !FFGoodneighbor07.GetStageDone(20)
  FFGoodneighbor07.SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFGoodneighbor07 Auto Const

Location Property BobbisNewPlace Auto Const
