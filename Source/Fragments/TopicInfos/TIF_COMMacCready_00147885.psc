;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_COMMacCready_00147885 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if COMMacToy.GetValue() == 0
Game.GetPlayer().AddItem(COMMacCreadyToySolider,1)
COMMacToy.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property COMMacToy Auto Const

MiscObject Property COMMacCreadyToySolider Auto Const
