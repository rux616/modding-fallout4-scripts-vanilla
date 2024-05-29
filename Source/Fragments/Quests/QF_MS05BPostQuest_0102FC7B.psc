;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS05BPostQuest_0102FC7B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
(Alias_PoppaDeathclaw.GetActorRef()).RemoveFromFaction(pPoppaDeathclawFaction)
(Alias_PoppaDeathclaw.GetActorRef()).SetValue(Game.GetAggressionAV(), 2)
(Alias_PoppaDeathclaw.GetActorRef()).StartCombat(Game.GetPlayer())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PoppaDeathclaw Auto Const

Faction Property pPoppaDeathclawFaction Auto Const
