;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueDrinkingBuddy_001761E9 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
DialogueDrinkingBuddyScript kmyQuest = GetOwningQuest() as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.IsInDeliveryMode = true
GetOwningQuest().SetStage(30)
if DialogueGoodneighborRufus.GetStageDone(110) || DialogueGoodneighborRufus.GetStageDone(100)
	kmyQuest.WaitOutsideRexford = false
endif
DrinkingBuddy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN134 Auto Const

Quest Property DialogueGoodneighborRufus Auto Const

ReferenceAlias Property DrinkingBuddy Auto Const
