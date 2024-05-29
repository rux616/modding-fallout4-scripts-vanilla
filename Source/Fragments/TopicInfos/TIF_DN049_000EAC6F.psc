;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DN049_000EAC6F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Transfer the money to the bowling manager.
Debug.Trace("Now paying")
Game.GetPlayer().RemoveItem(PrewarMoney, 5000, Bowling_Manager.GetActorRef())
GetOwningQuest().SetStage(710)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property PrewarMoney Auto Const

ReferenceAlias Property Bowling_Manager Auto Const
