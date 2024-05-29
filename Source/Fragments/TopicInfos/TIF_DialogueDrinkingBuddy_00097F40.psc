;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueDrinkingBuddy_00097F40 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
DialogueDrinkingBuddyScript kmyQuest = GetOwningQuest() as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.WaitOutsideRexford = false
DialogueGoodneighborRufus.SetStage(515)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueGoodneighborRufus Auto Const
