;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01COMRobotCompanionBle_0100B190 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().PlaceAtMe(DLC01EncWorkbenchBot01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_CommandTarget.GetReference().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
FollowersScript.GetScript().SetCompanion(Alias_RobotCompanionBleep.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 90")
FollowersScript.GetScript().DismissCompanion(Alias_RobotCompanionBleep.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property DLC01EncWorkbenchBot01 Auto Const Mandatory

ReferenceAlias Property Alias_CommandTarget Auto Const Mandatory

ReferenceAlias Property Alias_RobotCompanionBleep Auto Const Mandatory
