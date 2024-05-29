;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_ParlorRoomScene_01016168 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
GetOwningQuest().SetStage(110)
Alias_Lucy.GetActorRef().MoveTo(DLC04MS03_Lucy01Marker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Lucy Auto Const

ObjectReference Property DLC04MS03_Lucy01Marker Auto Const Mandatory
