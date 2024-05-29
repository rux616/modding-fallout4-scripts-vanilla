;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Inst308_000C32AD Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
shaun.GetActorReference().ChangeAnimFaceArchetype(AnimFaceArchetypeFatherDeath)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;shaun.GetActorReference().SetLookAt(Inst308FatherLookMarker)
Inst308.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property shaun Auto Const

Keyword Property AnimFaceArchetypeFatherDeath Auto Const Mandatory

Quest Property Inst308 Auto Const Mandatory

ObjectReference Property Inst308FatherLookMarker Auto Const Mandatory
