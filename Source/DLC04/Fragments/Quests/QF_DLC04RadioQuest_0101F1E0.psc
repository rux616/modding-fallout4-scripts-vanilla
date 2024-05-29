;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RadioQuest_0101F1E0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RadioQuestScript
Quest __temp = self as Quest
DLC04:DLC04RadioQuestScript kmyQuest = __temp as DLC04:DLC04RadioQuestScript
;END AUTOCAST
;BEGIN CODE
;start up the radio at Station Identification - normal progression should take it from there
StationIdentScene.Start()
;also start timer so we can re-start radio if something goes wrong
kmyquest.StartRadioTimer()
;since DLC04MQ02 will be running, move Gage to the overlook
DLC04GageRef.Moveto(DLC04MQ02GageMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property StationIdentScene Auto Const

ObjectReference Property DLC04MQ02GageMarker Auto Const Mandatory

ObjectReference Property DLC04GageRef Auto Const Mandatory
