;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RadioDiamondCity_00144A58 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RadioDiamondCityQuestScript
RadioDiamondCityQuestScript kmyQuest = GetOwningQuest() as RadioDiamondCityQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.currentsong=18
kmyquest.UpdateRadio()
Debug.Trace(Self+"Radio Update, Song 18")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
