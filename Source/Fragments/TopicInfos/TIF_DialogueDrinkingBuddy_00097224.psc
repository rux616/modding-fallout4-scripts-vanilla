;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueDrinkingBuddy_00097224 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
DialogueDrinkingBuddyScript kmyQuest = GetOwningQuest() as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.IsInDeliveryMode = true
kmyQuest.WaitOutsideRexford = true
WorkshopNPCScript buddy = DrinkingBuddy.GetActorRef() as workshopNPCScript
WorkshopParent.RemoveActorFromWorkshopPUBLIC(buddy)
buddy.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DrinkingBuddy Auto Const

workshopparentscript Property WorkshopParent Auto Const Mandatory
