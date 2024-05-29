;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01COMRobotCompanionOth_0100F66C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_RobotCompanionOther.GetActorReference().AddToFaction(HasBeenCompanionFaction)
Alias_RobotCompanionOther.GetActorReference().SetValue(DLC01RobotDefaultOff,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property HasBeenCompanionFaction Auto Const Mandatory

ReferenceAlias Property Alias_RobotCompanionOther Auto Const Mandatory

ActorValue Property DLC01RobotDefaultOff Auto Const Mandatory
