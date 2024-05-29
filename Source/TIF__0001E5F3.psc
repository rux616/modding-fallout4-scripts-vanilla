;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0001E5F3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DiamondCityQuest01.SetStage(10)
(DiamondCityQuest01 as DiamondCityQuest01Script).AbbotQuestTalk = 3
Game.GetPlayer().Additem(CapsRewardSmall)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DiamondCityQuest01  Auto Const  

MiscObject Property Caps001  Auto Const  

LeveledItem Property CapsRewardSmall  Auto Const  
