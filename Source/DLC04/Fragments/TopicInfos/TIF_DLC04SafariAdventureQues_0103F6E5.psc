;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04SafariAdventureQues_0103F6E5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC04SafariCitoFollowing.setValue(1)
DLC04SafariAdventureQuest.setstage(90)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04SafariCitoFollowing Auto Const Mandatory

Quest Property DLC04SafariAdventureQuest Auto Const Mandatory
