;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DN083_01007F5A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(DN083_TempMacGuffin01,1)
Game.GetPlayer().RemoveItem(DN083_TempMacGuffin02,1)
Game.GetPlayer().RemoveItem(DN083_TempMacGuffin03,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DN083_TempMacGuffin01 Auto Const

MiscObject Property DN083_TempMacGuffin02 Auto Const

MiscObject Property DN083_TempMacGuffin03 Auto Const
