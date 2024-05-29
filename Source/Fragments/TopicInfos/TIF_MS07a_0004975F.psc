;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS07a_0004975F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Caps001, 100)

Game.GetPlayer().AddItem(pDmndSurgeryKey, 1)
akspeaker.RemoveItem(pDmndSurgeryKey, 1)

if !MS07a.GetStageDone(40)
  MS07a.SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pDmndSurgeryKey Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MS07a Auto Const
