;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01COMRobotCompanion_010024DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().PlaceAtMe(PDLC01EncWorkbenchBot01)
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

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_DLC01RobotCompanion.ForceRefTo(DLC01AdaRef)

DLC01AdaRef.SetValue(DLC01RobotDefaultOff,1)
DLC01AdaRef.SetValue(DLC01PersonalityMode,1)
(DLC01AdaRef as Actor).AddToFaction(HasBeenCompanionFaction)
(DLC01AdaRef as Actor).RemoveFromFaction(DisallowedCompanionFaction)

SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
FollowersScript.GetScript().SetCompanion(Alias_DLC01RobotCompanion.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 90")
FollowersScript.GetScript().DismissCompanion(Alias_DLC01RobotCompanion.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DLC01RobotCompanion Auto Const Mandatory

ActorBase Property PDLC01EncWorkbenchBot01 Auto Const Mandatory

ReferenceAlias Property Alias_CommandTarget Auto Const Mandatory


ActorValue Property DLC01RobotDefaultOff Auto Const Mandatory

Faction Property HasBeenCompanionFaction Auto Const Mandatory

ActorValue Property DLC01PersonalityMode Auto Const Mandatory

ObjectReference Property DLC01AdaRef Auto Const Mandatory

Faction Property DisallowedCompanionFaction Auto Const Mandatory
