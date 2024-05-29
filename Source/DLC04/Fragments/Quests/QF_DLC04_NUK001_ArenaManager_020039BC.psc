;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_NUK001_ArenaManager_020039BC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;MATT: When your quest first starts up, call Stop on this quest, wait for it to stop,
;then call Start again. That should set this stage.

;Construct the crowd for the Arena. No one moves yet; this just gets them into their aliases.
DLC04_NUK001_CrowdManager.SetStage(10)

;Set up the arena doors for the fight.
DLC04_NUK001_ArenaChampionDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(False)
DLC04_NUK001_ApproachDoor.SetOpenNoWait(False)

;Select and Spawn the Enemy Combatant.
Debug.Trace("My Global: " + DLC04ArenaCombatantsCount + ", " +  DLC04ArenaCombatantsCount.GetValueInt())
int combatCount = DLC04ArenaCombatantsCount.GetValueInt()
ActorBase enemyBase
if (combatCount < DLC04ArenaCombatantsPrimary.GetSize())
     Debug.Trace("In first loop. " + DLC04ArenaCombatantsPrimary.GetSize())
     enemyBase = DLC04ArenaCombatantsPrimary.GetAt(combatCount) as ActorBase
     DLC04ArenaCombatantsCount.SetValueInt(combatCount + 1)
Else
     int randomIndex = Utility.RandomInt(0, DLC04ArenaCombatantsSecondary.GetSize() - 1)
    Debug.Trace(randomIndex + ", " + DLC04ArenaCombatantsSecondary.GetAt(randomIndex) as ActorBase)
     enemyBase= DLC04ArenaCombatantsSecondary.GetAt(randomIndex) as ActorBase
EndIf
Actor enemy = DLC04ArenaManager_EnemyCombatantSpawnMarker.PlaceActorAtMe(enemyBase, 2, DLC04ColaCarsZone)
enemy.SetGhost(True)
Alias_EnemyCombatant.ForceRefTo(enemy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;MATT: Set this stage when you want the NPCs who will form the crowd to begin moving into
;Cola-Cars. When the player 'accepts' the quest.

;The crowd begins to trickle in.
DLC04_NUK001_CrowdManager.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;MATT: Set this stage when the player enters Cola-Cars after accepting the quest.

;The crowd assembles more quickly.
DLC04_NUK001_CrowdManager.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;MATT: I set this stage when the player enters the arena while the quest is running.
;At this point, they're locked in, and the door for the enemy combatant opens to start the fight.
;
;You should update your objective to point to this quest's EnemyCombatant at this point.

;Enable the door collision on the player's side of the arena.
DLC04_NUK001_ArenaChampionDoorCollision.EnableNoWait()

;The remainder of the crowd warps in when possible.
DLC04_NUK001_CrowdManager.SetStage(120)

;Ghost them to protect them from stray explosions.
DLC04_NUK001_CrowdManager.SetStage(200)

;Close the door on the player's side of the arena.
DLC04_NUK001_ArenaChampionDoor.SetOpen(False)

;Open the door on the challenger's side of the arena.
Actor enemyAct = Alias_EnemyCombatant.GetActorRef()
enemyAct.SetGhost(False)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpen(True)
enemyAct.StartCombat(Game.GetPlayer())
enemyAct.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;MATT: I set this stage when the enemy combatant enters the arena.
;There's (probably) nothing you need to do here.

;Close the door on the challenger's side of the arena.
DLC04_NUK001_ArenaChallengerDoorCollision.EnableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(False)
Alias_EnemyCombatant.TryToEvaluatePackage()

;TODO - Add handling if the player somehow slips behind the enemy combatant?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;MATT: I set this stage when the player kills the EnemyCombatant. Update you objective here?

;Reopen the doors on both ends of the arena.
DLC04_NUK001_ArenaChampionDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChampionDoor.SetOpenNoWait(True)
DLC04_NUK001_ArenaChallengerDoorCollision.DisableNoWait()
DLC04_NUK001_ArenaChallengerDoor.SetOpenNoWait(True)
DLC04_NUK001_ApproachDoor.SetOpenNoWait(True)

;The crowd begins to disperse.
DLC04_NUK001_CrowdManager.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;MATT: Remember to call Stop on this quest when your quest starts up for the *next* time.

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
