;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueVault81_00192DDC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().SellItem(Hammer01, 15)
Game.GetPlayer().SellItem(Hammer01_PreWar, 15)
Game.GetPlayer().SellItem(ScrewDriver01, 15)
Game.GetPlayer().SellItem(Wrench01, 15)
Game.GetPlayer().SellItem(Wrench02, 15)
Game.GetPlayer().SellItem(Wrench03, 15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Hammer01 Auto Const

MiscObject Property Hammer01_PreWar Auto Const

MiscObject Property ScrewDriver01 Auto Const

MiscObject Property Wrench01 Auto Const

MiscObject Property Wrench02 Auto Const

MiscObject Property Wrench03 Auto Const
