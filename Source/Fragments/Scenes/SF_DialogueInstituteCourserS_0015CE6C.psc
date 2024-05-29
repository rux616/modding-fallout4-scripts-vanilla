;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueInstituteCourserS_0015CE6C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
InstituteCourser.getreference().moveto(CourserMarker.getreference())
Gen3Synth.getreference().moveto(SynthMarker.getreference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property InstituteCourser Auto Const

ReferenceAlias Property Gen3Synth Auto Const

ReferenceAlias Property CourserMarker Auto Const

ReferenceAlias Property SynthMarker Auto Const
