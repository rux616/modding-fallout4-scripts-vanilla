;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_WorkshopParent_0005E1E1 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE workshopparentscript
workshopparentscript kmyQuest = GetOwningQuest() as workshopparentscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddPermanentActorToWorkshopPlayerChoice(WorkshopRecruitSheffield.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property WorkshopRecruitSheffield Auto Const
