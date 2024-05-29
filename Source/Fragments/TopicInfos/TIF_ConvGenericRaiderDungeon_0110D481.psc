;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_ConvGenericRaiderDungeon_0110D481 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if akspeaker.GetCurrentLocation().HasKeyword(RaiderConvo_RegionCoastal)
  RaiderConvoLocationRival.SetValue(0)
else
  RaiderConvoLocationRival.SetValue(1)
endif

ClearedDungeon.GetLocation().SetKeyWordData(RaiderConvo_LocationCleared, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property ClearedDungeon Auto Const

Keyword Property RaiderConvo_LocationCleared Auto Const

Keyword Property RaiderConvo_RegionCoastal Auto Const

GlobalVariable Property RaiderConvoLocationRival Auto Const
