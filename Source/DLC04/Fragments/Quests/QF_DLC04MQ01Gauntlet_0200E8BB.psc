;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ01Gauntlet_0200E8BB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(1250)
SetStage(1500)
Game.GetPlayer().EquipItem(DLC04_ThirstZapper)
Game.GetPlayer().MoveTo(DLC04MQ01Gauntlet_QuickstartOverbossBattle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Force the Raider Overboss' combat style back to Melee. (His Power Armor changes it at runtime.)
Alias_RaiderOverboss.GetActorRef().SetCombatStyle(DLC04RaiderOverboss_csMeleeFocus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC04_LL_Ammo_ThirstZapperWater, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01GauntletQuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ01GauntletQuestScript kmyQuest = __temp as DLC04:DLC04MQ01GauntletQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by DLC04MQ01 when the Overboss has finished his pre-battle monologue.

kMyQuest.InitializeOverbossBattle()

;Open the arena door.
DLC04ColaCars_ChallengerDoor.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
;Shut the Challenger's Door behind the player, locking them into the arena.
DLC04ColaCars_ChallengerDoorCollision.EnableNoWait()
DLC04ColaCars_ChallengerDoor.SetOpenNoWait(False)

;Warp the player's follower into the arena, if possible, since they tend to get stuck outside otherwise.
Actor player = Game.GetPlayer()
Actor companion = Alias_Companion.GetActorRef()
if ((companion != None) && (!player.HasDetectionLoS(companion)) && (player.GetPositionX() < companion.GetPositionX()))
     ObjectReference[] warpPoints = DLC04MQ01Gauntlet_OverbossFightCompanionWarpMarker.GetLinkedRefChain()
     warpPoints.Insert(DLC04MQ01Gauntlet_OverbossFightCompanionWarpMarker, 0)
     bool hasWarpedCompanion = False
     int i = 0
     While (!hasWarpedCompanion && i < warpPoints.Length)
          if (!player.HasDetectionLoS(warpPoints[i]))
               companion.MoveTo(warpPoints[i])
               hasWarpedCompanion = True
          EndIf
          i = i + 1
     EndWhile
EndIf

;Expand the Overboss' DMP Combat Hold Position to the full arena.
;(He has to be held back initally, since his entire theme breaks down if he gets into the Challenger's Box)
Alias_RaiderOverboss.GetActorRef().SetLinkedRef(DLC04ColaCars_HoldPosition_Full, DMP_Combat_HoldPosition_128)

;Allow the Overboss to attack.
SetStage(1520)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1520_Item_00
Function Fragment_Stage_1520_Item_00()
;BEGIN CODE
;Set when the player enters the arena (1510),
;OR if they shoot the Overboss before entering (any weapon).

;Start the Music Override.
DLC04MUSzCombatArena.Add()

;Make the Overboss aggressive and push him into combat.
Actor boss = Alias_RaiderOverboss.GetActorRef()
boss.SetValue(Aggression, 2)
boss.StartCombat(Game.GetPlayer())
boss.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Set when the Raider Overboss is killed.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Default2StateActivator Property DLC04ColaCars_ChallengerDoor Auto Const Mandatory

ObjectReference Property DLC04MQ01_OverbossFight_CompanionWarpMarker Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_OverbossFightCompanionWarpMarker Auto Const Mandatory

Keyword Property DMP_Combat_HoldPosition_128 Auto Const Mandatory

ObjectReference Property DLC04ColaCars_HoldPosition_Full Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ReferenceAlias Property Alias_RaiderOverboss Auto Const Mandatory

ObjectReference Property DLC04ColaCars_ChallengerDoorCollision Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

MusicType Property DLC04MUSzCombatArena Auto Const Mandatory

CombatStyle Property DLC04RaiderOverboss_csMeleeFocus Auto Const Mandatory

CombatStyle Property DLC04RaiderOverboss_csRangedFocus Auto Const Mandatory

Weapon Property DLC04_ThirstZapper Auto Const Mandatory

ObjectReference Property DLC04MQ01Gauntlet_QuickstartOverbossBattle Auto Const Mandatory

LeveledItem Property LL_Ammo_AlienBlaster Auto Const Mandatory

LeveledItem Property DLC04_LL_Ammo_ThirstZapperWater Auto Const Mandatory
