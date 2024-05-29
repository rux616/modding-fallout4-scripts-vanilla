;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04POISC07Dialogue_01042ADF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Give the player a discount and the Dunmore safe key.
Alias_BrettDunmore.GetActorRef().AddPerk(DLC04POISC07_DunmoreFriendshipPerk)
Game.GetPlayer().AddItem(DLC04POISC07_DunmoreKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Add the player to the Dunmore's faction so taking their stuff is no longer theft.
Game.GetPlayer().AddToFaction(DLC04POISC07_DunmoreFaction)

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BrettDunmore Auto Const Mandatory

Perk Property DLC04POISC07_DunmoreFriendshipPerk Auto Const Mandatory

Key Property DLC04POISC07_DunmoreKey Auto Const Mandatory

Faction Property DLC04POISC07_DunmoreFaction Auto Const Mandatory
