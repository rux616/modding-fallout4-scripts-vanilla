;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoS301_000B2EC5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if BoS301AdapterGive.GetValue() == 0
Game.GetPlayer().RemoveItem(BoS301FusionAdapter,1)
BoS301AdapterGive.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property BoS301FusionAdapter Auto Const

GlobalVariable Property BoS301AdapterGive Auto Const
