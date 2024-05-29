;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MS01SierraAttacks_01035790 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Adjust Sierra's confidence
Alias_Sierra.GetActorRef().SetValue(Confidence,4)

; Add Sierra to the player enemy faction
Alias_Sierra.GetActorRef().AddToFaction(PlayerEnemyFaction)

; Start combat with the player
Alias_Sierra.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sierra Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Confidence Auto Const Mandatory

Scene Property DLC04MS01Post_SierraAttackPlayer Auto Const Mandatory
