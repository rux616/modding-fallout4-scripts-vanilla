;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoS302B_0016B82E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if BoS302BOrders.GetValue() == 0
Game.GetPlayer().AddItem(BoS302BKillList,1)
BoS302BOrders.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property BoS302BKillList Auto Const

GlobalVariable Property BoS302BOrders Auto Const
