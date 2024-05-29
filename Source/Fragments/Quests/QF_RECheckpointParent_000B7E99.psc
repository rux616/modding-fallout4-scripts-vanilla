;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECheckpointParent_000B7E99 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE RECheckpointParentScript
Quest __temp = self as Quest
RECheckpointParentScript kmyQuest = __temp as RECheckpointParentScript
;END AUTOCAST
;BEGIN CODE
;Turn off checkpoint triggers
RECheckpointTriggerEnableMarker.Enable()
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RECheckpointTriggerEnableMarker Auto Const
