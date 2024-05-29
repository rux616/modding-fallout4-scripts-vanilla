;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS00Fight_00068D7B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move the player to the fight.
Game.GetPlayer().MoveTo(CambridgePDMapMarkerHeadingRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Set this stage to safely bypass BoS100Fight (in console, Stage 0s for other BoS quests, etc.)

;Set stages.
;SetStage(10)
;SetStage(20)
;SetStage(30)
SetStage(90)
SetStage(99)
;SetStage(255)

;Store off refs.
Actor Ghoul01 = Alias_Ghoul01.GetActorRef()
Actor Ghoul02 = Alias_Ghoul02.GetActorRef()
Actor Ghoul03 = Alias_Ghoul03.GetActorRef()
Actor Ghoul04 = Alias_Ghoul04.GetActorRef()
Actor GhoulGlowingOne = Alias_GhoulGlowingOne.GetActorRef()

;Kill and disable all Ghouls.
Ghoul01.DisableNoWait()
Ghoul02.DisableNoWait()
Ghoul03.DisableNoWait()
Ghoul04.DisableNoWait()
GhoulGlowingOne.DisableNoWait()

;Flag the fight as complete.
SetStage(100)

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;A variant of Stage 1. Skips the fight without updating BoS100.
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;When BoS100Fight_StartFightOnLoad (the dummy outside Cambridge PD) loads, start the fight.
;Initially, Danse, Rhys, and Haylen are invulnerable and the Ghouls are endless, preventing either
;side from winning until the player gets close enough to see what's going on.

;Make the player a friend of the BoS100 Ghoul faction so the ghouls will ignore them for now.
;Without this, the player can kite an infinite stream of ghouls, which is really bad.
BoS100FeralGhoulFaction.SetAlly(PlayerFaction, True, True)
;BoS100FeralGhoulFaction.SetAlly(CurrentCompanionFaction, True, True)

;Store off refs.
Actor Danse = Alias_Danse.GetActorRef()
Actor Haylen = Alias_Haylen.GetActorRef()
Actor Rhys = Alias_Rhys.GetActorRef()

;Make Danse, Haylen, and Rhys invulnerable to the Ghouls (temporarily).
Danse.AddPerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Haylen.AddPerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Rhys.AddPerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)

;Make Ghoul01 and Ghoul02 temporarily invulnerable to the BoS.
Alias_Ghoul01.GetActorRef().AddPerk(BoS100Fight_GhoulBoSInvulnerabilityPerk)
Alias_Ghoul02.GetActorRef().AddPerk(BoS100Fight_GhoulBoSInvulnerabilityPerk)

;Make Hayen and Rhys Essential (temporarily).
Haylen.GetActorBase().SetEssential(True)
Rhys.GetActorBase().SetEssential(True)

;Add the player to the temporary BoS100FightFaction.
Game.GetPlayer().AddToFaction(BoS100FightFaction)

;Make Danse, Haylen, and Rhys ignore friendly hits (from the player).
Danse.IgnoreFriendlyHits(True)
Haylen.IgnoreFriendlyHits(True)
Rhys.IgnoreFriendlyHits(True)

;Move Danse and Haylen into position. (BoS100 handles Rhys)
Danse.MoveTo(BoS100Fight_DanseStartMarker)
Haylen.MoveTo(BoS100Fight_HaylenCombatMarker)

;Add Rhys to Captive Faction to protect him from the ghouls.
Rhys.AddToFaction(CaptiveFaction)

;Evaluate Packages
Danse.EvaluatePackage()
Haylen.EvaluatePackage()
Rhys.SetRestrained()
Rhys.EvaluatePackage()

;Start Ghoul Assault - Automatic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set when the player attacks any of the ghouls, or when they hit the courtyard trigger.

;Store off local refs.
Actor Danse = Alias_Danse.GetActorRef()
Actor Rhys = Alias_Rhys.GetActorRef()
Actor Haylen = Alias_Haylen.GetActorRef()

;Remove invulnerability from Danse, Rhys, and Haylen.
Danse.RemovePerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Rhys.RemovePerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Haylen.RemovePerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)

;Add the vulnerability perk to Danse and Haylen.
Alias_Danse.GetActorRef().AddPerk(BoS100Fight_BoSGhoulVulnerabilityPerk)
Alias_Haylen.GetActorRef().AddPerk(BoS100Fight_BoSGhoulVulnerabilityPerk)

;Restore some health to Danse and Haylen.
Danse.RestoreValue(Health, 250)
Haylen.RestoreValue(Health, 250)

;Ghouls are now hostile to the player.
BoS100FeralGhoulFaction.SetEnemy(PlayerFaction)

;Remove invulnerability from the ghouls.
Alias_Ghoul01.GetActorRef().RemovePerk(BoS100Fight_GhoulBoSInvulnerabilityPerk)
Alias_Ghoul02.GetActorRef().RemovePerk(BoS100Fight_GhoulBoSInvulnerabilityPerk)

;Ghoul respawns should no longer be infinite. Start tracking them.
((Self as Quest) as BoS100FightMonitor).StartFightMonitor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set when the player hits the courtyard trigger.

;Player is now engaged.
SetStage(20)

;Reduce the respawning radius, allowing ghouls to start closer to the player and Danse.
((Self as Quest) as BoS100FightMonitor).ReduceRespawnRadius()

;Update objectives on BoS100.
BoS100.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set by the fight monitor script once the first wave of ghouls have been killed.
;Spawn the Glowing One
((Self as Quest) as BoS100FightMonitor).SpawnBoss()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
;Set if the player shoots at least one Ghoul during the fight.
;Optionally, this could affect the BoS100 dialogue.

;The player has engaged the ghouls.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when the fight is over and the Recon Team (Danse/Rhys/Halen) have all dropped out of combat.
;(so the player's not fighting them, they're not fighting ambient enemies, etc., etc.).
;It should be safe to move on to the BoS100 Intro Scene at this point.

;Store off refs.
Actor Danse = Alias_Danse.GetActorRef()
Actor Haylen = Alias_Haylen.GetActorRef()
Actor Rhys = Alias_Rhys.GetActorRef()

;Make Haylen and Rhys Protected.
Haylen.GetActorBase().SetProtected(True)
Rhys.GetActorBase().SetProtected(True)

;Remove Danse, Haylen, Rhys, and the player from the temporary BoS100FightFaction.
Danse.RemoveFromFaction(BoS100FightFaction)
Haylen.RemoveFromFaction(BoS100FightFaction)
Rhys.RemoveFromFaction(BoS100FightFaction)
Game.GetPlayer().RemoveFromFaction(BoS100FightFaction)

;Danse, Haylen, and Rhys should respond to friendly hits appropriately from this point forward.
Danse.IgnoreFriendlyHits(False)
Haylen.IgnoreFriendlyHits(False)
Rhys.IgnoreFriendlyHits(False)

;Remove the BoS100Fight perks from Danse, Rhys, and Haylen.
Danse.RemovePerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Rhys.RemovePerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Haylen.RemovePerk(BoS100Fight_BoSGhoulInvulnerabilityPerk)
Danse.RemovePerk(BoS100Fight_BoSGhoulVulnerabilityPerk)
Rhys.RemovePerk(BoS100Fight_BoSGhoulVulnerabilityPerk)
Haylen.RemovePerk(BoS100Fight_BoSGhoulVulnerabilityPerk)

;Remove Rhys from the Captive Faction.
Rhys.RemoveFromFaction(CaptiveFaction)

;Handoff to the BoS100 Intro Scene unless Debug Stage 2 is set.
if (!GetStageDone(2) && BoS100.GetStageDone(30))
     BoS100.SetStage(40)
EndIf

;We no longer stop the quest at this point. Instead, keep it open in case the player
;kills Danse before the Police Station unlocks, and to clean up the ghouls later.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;If Danse is killed before the Police Station unlocks normally,
;add a key to the station to his corpse so the player can get in.
Alias_Danse.GetActorRef().AddItem(DN130CambridgePDKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Set by DN130, as a part of the Post-Arcjet cleanup process.

;Disable and delete all of the ghouls.
((Self as Quest) as BoS100FightMonitor).CleanupGhouls()

;Remove Danse, Haylen, Rhys, and the player from the temporary BoS100FightFaction.
Alias_Danse.GetActorRef().RemoveFromFaction(BoS100FightFaction)
Alias_Haylen.GetActorRef().RemoveFromFaction(BoS100FightFaction)
Alias_Rhys.GetActorRef().RemoveFromFaction(BoS100FightFaction)
Game.GetPlayer().RemoveFromFaction(BoS100FightFaction)

;Make sure Rhys is removed from CaptiveFaction and the restraints.
Alias_Rhys.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_Rhys.GetActorRef().SetRestrained(False)

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoS100Fight_DanseStartMarker Auto Const

ReferenceAlias Property Alias_Danse Auto Const

ReferenceAlias Property Alias_Haylen Auto Const

ReferenceAlias Property Alias_Rhys Auto Const

Perk Property BoS100Fight_BoSGhoulInvulnerabilityPerk Auto Const

ReferenceAlias Property Alias_Ghoul01 Auto Const

ReferenceAlias Property Alias_Ghoul02 Auto Const

ReferenceAlias Property Alias_Ghoul03 Auto Const

ReferenceAlias Property Alias_Ghoul04 Auto Const

Quest Property BoS100 Auto Const

Quest Property DN130 Auto Const

Faction Property BoS100FeralGhoulFaction Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property BoS100Fight_HaylenCombatMarker Auto Const

ReferenceAlias Property Alias_GhoulGlowingOne Auto Const

Key Property DN130CambridgePDKey Auto Const

ObjectReference Property CambridgePDMapMarkerHeadingRef Auto Const

Perk Property BoS100Fight_BoSGhoulVulnerabilityPerk Auto Const

Faction Property CaptiveFaction Auto Const

ObjectReference Property BoS101HelmetEquip Auto Const

Faction Property CurrentCompanionFaction Auto Const

RefCollectionAlias Property Alias_CollegeSquareExteriorGhouls Auto Const

Faction Property BoS100FightFaction Auto Const

Perk Property BoS100Fight_GhoulBoSInvulnerabilityPerk Auto Const

ActorValue Property Health Auto Const
