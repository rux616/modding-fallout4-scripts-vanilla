;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoSDialoguePrydwen_0017BDD9 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if BoSCoolantRecipeGiven.GetValue() == 0
Game.GetPlayer().AddItem(BoSPostCoolantNote,1)
BoSCoolantRecipeGiven.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property BoSPostCoolantNote Auto Const

GlobalVariable Property BoSCoolantRecipeGiven Auto Const
