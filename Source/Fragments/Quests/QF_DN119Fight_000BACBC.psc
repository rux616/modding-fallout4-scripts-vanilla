;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN119Fight_000BACBC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Start off the fight.  Initially, the scavengers are invulnerable and the molerats respawn,
;preventing either side from winning until the player approaches.

;Mod damage for the attackers and defenders until the player approaches
Alias_Scavenger01.GetActorRef().AddPerk(DN119ModDamagePerk)
Alias_Scavenger02.GetActorRef().AddPerk(DN119ModDamagePerk)
Alias_Molerat01.GetActorRef().AddPerk(DN119ModDamagePerk)
Alias_Molerat02.GetActorRef().AddPerk(DN119ModDamagePerk)
Alias_Molerat03.GetActorRef().AddPerk(DN119ModDamagePerk)
Alias_Molerat04.GetActorRef().AddPerk(DN119ModDamagePerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DN119FightController
Quest __temp = self as Quest
DN119FightController kmyQuest = __temp as DN119FightController
;END AUTOCAST
;BEGIN CODE
;Player is potentially in viewing distance of the fight (~6000u). Start the fight
((self as Quest) as DN119FightController).StartAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Player is within range to engage and or hear dialogue, ~3000u.
;FLAG - determines whether to do Molerat Win cell detach actions

;Scavengers become vulnerable
Alias_Scavenger01.GetActorRef().RemovePerk(DN119ModDamagePerk)
Alias_Scavenger02.GetActorRef().RemovePerk(DN119ModDamagePerk)
Alias_Molerat01.GetActorRef().RemovePerk(DN119ModDamagePerk)
Alias_Molerat02.GetActorRef().RemovePerk(DN119ModDamagePerk)
Alias_Molerat03.GetActorRef().RemovePerk(DN119ModDamagePerk)
Alias_Molerat04.GetActorRef().RemovePerk(DN119ModDamagePerk)

;Molerat respawns should no longer be infinite.
((Self as Quest) as DN119FightController).StartFightMonitor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
;Set if the player shoots at least one molerat in the fight.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when all the molerats have been defeated.

;Handoff to the DN119 trade quest
;DN119Trade.SetStage(0)

;TODO Stop this quest once the trade stuff is set up
;SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Force kill the scavenger guys if they're not already dead
Alias_Scavenger01.GetActorRef().Kill()
Alias_Scavenger02.GetActorRef().Kill()

;Enable Molerats
Alias_MoleratWinEnableMarker.GetRef().Enable()

;Shutdown the quest
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Scavenger01 Auto Const

Perk Property InvulnerabilityPerk Auto Const

ReferenceAlias Property Alias_Scavenger02 Auto Const

Perk Property DN119ModDamagePerk Auto Const

ReferenceAlias Property Alias_Molerat01 Auto Const

ReferenceAlias Property Alias_Molerat02 Auto Const

ReferenceAlias Property Alias_Molerat03 Auto Const

ReferenceAlias Property Alias_Molerat04 Auto Const

ReferenceAlias Property Alias_MoleratWinDetachMarker Auto Const

ReferenceAlias Property Alias_MoleratWinEnableMarker Auto Const

MiscObject Property Caps001 Auto Const
