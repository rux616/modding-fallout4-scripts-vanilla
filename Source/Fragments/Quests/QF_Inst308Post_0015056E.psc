;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst308Post_0015056E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_X6.GetActorRef().SetValue(FollowerEndgameForceGreetOn, 1)
InstFatherMemorialRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_X6 Auto Const Mandatory

ActorValue Property FollowerEndgameForceGreetOn Auto Const Mandatory

ObjectReference Property InstFatherMemorialRef Auto Const Mandatory
