;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueVault117_00091C7E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.GetPlayer().RemoveItem(Jet, 1)
game.GetPlayer().AddItem(Caps001, 50)
BobbyDeLucaRef.AddItem(Jet, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

Potion Property Jet Auto Const

ObjectReference Property BobbyDeLucaRef Auto Const
