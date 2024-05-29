;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueDrinkingBuddy_001761E1 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueDrinkingBuddyScript
DialogueDrinkingBuddyScript kmyQuest = GetOwningQuest() as DialogueDrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.WaitingForHome = true
kmyQuest.IsInDeliveryMode = false
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
