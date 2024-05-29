;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstituteTeleportEffects_001ED4FA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If X6 is the current companion, move him to the Institute

If Alias_X6.GetActorRef().IsInFaction(CurrentCompanionFaction)
     Alias_X6.GetActorRef().MoveTo(X6FastTravelMarker)
     Alias_X6.GetActorRef().AddSpell(TeleportPlayerInSpell) 
endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_X6 Auto Const Mandatory

ObjectReference Property X6FastTravelMarker Auto Const Mandatory

SPELL Property TeleportPlayerInSpell Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory
