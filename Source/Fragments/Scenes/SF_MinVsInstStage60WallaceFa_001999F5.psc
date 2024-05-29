;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MinVsInstStage60WallaceFa_001999F5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
Synth_SpeechFailure.GetReference().Moveto(SynthFailureMarker)
Synth_SpeechFailure.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
Wallace.GetReference().Disable()
WallaceDead.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
DoorTalkingActivator.GetReference().Disable()
InstWallaceZapped.SetValue(1)
MVIRealDoor.Lock(false, true)
MVIRealDoor.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Synth_SpeechFailure Auto Const

ObjectReference Property SynthFailureMarker Auto Const

ReferenceAlias Property Wallace Auto Const

ObjectReference Property WallaceFailMarker Auto Const

ReferenceAlias Property DoorTalkingActivator Auto Const

ObjectReference Property MVIRealDoor Auto Const

GlobalVariable Property InstWallaceZapped Auto Const

ReferenceAlias Property WallaceDead Auto Const
