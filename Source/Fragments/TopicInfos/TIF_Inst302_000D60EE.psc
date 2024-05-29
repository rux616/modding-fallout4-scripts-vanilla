;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Inst302_000D60EE Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Inst302QuestScript
Inst302QuestScript kmyQuest = GetOwningQuest() as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Y9State=1
Y915.GetActorReference().EvaluatePackage()
Y915.GetReference().BlockActivation()
Y915.GetActorReference().SetGhost()
kmyQuest.SynthsReturned +=1
kmyquest.UpdateSynthStatus()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Y915 Auto Const
