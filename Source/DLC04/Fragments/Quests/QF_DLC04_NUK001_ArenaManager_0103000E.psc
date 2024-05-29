;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_NUK001_ArenaManager_0103000E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC04MQ01Gauntlet.SetStage(2499)
DLC04MQ01Gauntlet.SetStage(2500)
DLC04MQ01Gauntlet.Stop()
DLC04MQ01.Stop()
SetStage(20)
SetStage(30)
Game.GetPlayer().MoveTo(DLC04ColaCarsArenaQuickstart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Construct the crowd for the Arena. No one moves yet; this just gets them into their aliases.
DLC04_NUK001_CrowdManager.SetStage(10)

;Set up the arena doors for the fight.
DLC04_NUK001_ArenaChampionDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(False)
DLC04_NUK001_ApproachDoor.SetOpenNoWait(False)

;Select and Spawn the Enemy Combatant.
int combatCount = DLC04ArenaCombatantsCount.GetValueInt()
ActorBase enemyBase
if (combatCount < DLC04ArenaCombatantsPrimary.GetSize())
     enemyBase = DLC04ArenaCombatantsPrimary.GetAt(combatCount) as ActorBase
     DLC04ArenaCombatantsCount.SetValueInt(combatCount + 1)
Else
     int randomIndex = Utility.RandomInt(0, DLC04ArenaCombatantsSecondary.GetSize() - 1)
     enemyBase= DLC04ArenaCombatantsSecondary.GetAt(randomIndex) as ActorBase
EndIf
Actor enemy = DLC04ArenaManager_EnemyCombatantSpawnMarker.PlaceActorAtMe(enemyBase, 3, DLC04ColaCarsZone)
enemy.SetGhost(True)
Alias_EnemyCombatant.ForceRefTo(enemy)

if (enemyBase == DLC04_LvlBoSSoldier_PowerArmor_Rogue)
     DLC04_CustomItemQuest.SetStage(30)
     enemy.EquipItem(ColaCarsArenaReward.GetReference(), True, True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;The crowd begins to trickle in.
DLC04_NUK001_CrowdManager.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;The crowd assembles more quickly.
DLC04_NUK001_CrowdManager.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Update stage and objective in framing quest
if (DLC04SettlementFF01.IsRunning())
     DLC04SettlementFF01.SetStage(300)
EndIf

;Enable the door collision on the player's side of the arena.
DLC04_NUK001_ArenaChampionDoorCollision.EnableNoWait()

;The remainder of the crowd warps in when possible.
DLC04_NUK001_CrowdManager.SetStage(120)

;Ghost them to protect them from stray explosions.
DLC04_NUK001_CrowdManager.SetStage(180)

;Start the fight audio.
DLC04_NUK001_CrowdManager.SetStage(200)
DLC04_NUK001_CrowdManager.EnableCrowdReactions(Game.GetPlayer(), Alias_EnemyCombatant.GetActorRef(), DLC04_NUK001_ArenaManager, 60)

;Close the door on the player's side of the arena.
DLC04_NUK001_ArenaChampionDoor.SetOpen(False)

;Open the door on the challenger's side of the arena.
Actor enemyAct = Alias_EnemyCombatant.GetActorRef()
enemyAct.SetGhost(False)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpen(True)
SetStage(51)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Send the challenger in.
Actor enemyAct = Alias_EnemyCombatant.GetActorRef()
enemyAct.StartCombat(Game.GetPlayer())
enemyAct.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
if (!GetStageDone(61))
     ;Close the door on the challenger's side of the arena.
     DLC04_NUK001_ArenaChallengerDoorCollision.EnableNoWait()
     DLC04_NUK001_ArenaChallengerDoor.SetOpen(False)
     Alias_EnemyCombatant.TryToEvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Update stage and objective in framing quest (completes the framing quest)
if (DLC04SettlementFF01.IsRunning())
     DLC04SettlementFF01.SetStage(500)
EndIf

;Give the crowd reaction a few seconds to play.
if (DLC04_NUK001_CrowdManager.GetStage() < 400)
     Utility.Wait(6)
EndIf

;Disperse the crowd.
DLC04_NUK001_CrowdManager.SetStage(300)
DLC04_NUK001_CrowdManager.SetStage(400)

;Reopen the doors on both ends of the arena.
DLC04_NUK001_ArenaChampionDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(True)
DLC04_NUK001_ApproachDoor.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Disable and delete the previous enemy combatant.
Actor enemyAct = Alias_EnemyCombatant.GetActorRef()
enemyAct.DisableNoWait()
enemyAct.Delete()

;Make sure the crowd quest has stopped. By this point, it should have.
if (DLC04_NUK001_CrowdManager.IsRunning())
     DLC04_NUK001_CrowdManager.ForceStop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Disable and delete the enemy combatant.
Actor enemyAct = Alias_EnemyCombatant.GetActorRef()
enemyAct.DisableNoWait()
enemyAct.Delete()

;Reopen the doors on both ends of the arena.
DLC04_NUK001_ArenaChampionDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(True)
DLC04_NUK001_ApproachDoor.SetOpenNoWait(True)

;Make sure the crowd quest has stopped. By this point, it should have.
if (DLC04_NUK001_CrowdManager.IsRunning())
     DLC04_NUK001_CrowdManager.ForceStop()
EndIf

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC04:DLC04_NUK001_CrowdManagerQuestScript Property DLC04_NUK001_CrowdManager Auto Const Mandatory

FormList Property DLC04ArenaCombatantsSecondary Auto Const Mandatory

FormList Property DLC04ArenaCombatantsPrimary Auto Const Mandatory

GlobalVariable Property DLC04ArenaCombatantsCount Auto Const Mandatory

ObjectReference Property DLC04ArenaManager_EnemyCombatantSpawnMarker Auto Const Mandatory

EncounterZone Property DLC04ColaCarsZone Auto Const Mandatory

ReferenceAlias Property Alias_EnemyCombatant Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_ArenaChampionDoor Auto Const Mandatory

ObjectReference Property DLC04_NUK001_ArenaChallengerDoorCollision Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_ArenaChallengerDoor Auto Const Mandatory

ObjectReference Property DLC04_NUK001_ArenaChampionDoorCollision Auto Const Mandatory

Default2StateActivator Property DLC04_NUK001_ApproachDoor Auto Const Mandatory

Quest Property DLC04SettlementFF01 Auto Const Mandatory

ObjectReference Property DLC04ColaCarsArenaQuickstart Auto Const Mandatory

Quest Property DLC04_NUK001_ArenaManager Auto Const Mandatory

Quest Property DLC04MQ01Gauntlet Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

ActorBase Property DLC04_LvlBoSSoldier_PowerArmor_Rogue Auto Const Mandatory

ReferenceAlias Property ColaCarsArenaReward Auto Const

Quest Property DLC04_CustomItemQuest Auto Const Mandatory
