;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ02Fight_01043822 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Run the Standard Quickstart.
SetStage(1)

;Warp the player to the docks.
Game.GetPlayer().MoveTo(DLC03MQ02Fight_PlayerQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Standard Quickstart behavior.

;Get DLC03MQ02 into roughly the right state.
DLC03MQ02.SetStage(1)
DLC03MQ02.SetStage(50)
DLC03MQ02.SetStage(100)
DLC03MQ02.SetStage(200)

;Move the NPCs to their package locations.
Alias_CaptainAvery.GetActorRef().MoveToPackageLocation()
Alias_AllenLee.GetActorRef().MoveToPackageLocation()
Alias_Mariner.GetActorRef().MoveToPackageLocation()

;Stop Avery's MQ02 dialogue.
DLC03MQ02_0100_AmbientBoatApproach.Stop()
DLC03MQ02_0200_AveryGreeting.Stop()
DLC03MQ02_0200c_AveryToWall.Stop()

;Get ready to start the fight.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Run the Standard Quickstart.
SetStage(1)

;Start the All Clear scene.
SetStage(90)

;Warp the player to the Hull.
Game.GetPlayer().MoveTo(DLC03MQ02Fight_PlayerQuickstartMarker2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If the player falls or jumps down from the Hull during the fight, play a reaction scene.
DLC03MQ02_Fight_HullWarning.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_MultiCounterQuest
Quest __temp = self as Quest
DLC03:DLC03_MultiCounterQuest kmyQuest = __temp as DLC03:DLC03_MultiCounterQuest
;END AUTOCAST
;BEGIN CODE
;All Survivors are dead. We need melee combatants, so have the two generics jump down.
;If they're already dead, increment the counter that tracks melee combatants' deaths.

Actor a = Alias_ResidentF04.GetActorRef()
if (a.IsDead())
     kMyQuest.Increment(6)
Else
     Alias_MeleeCombatants.AddRef(a)
EndIf

a = Alias_ResidentM07.GetActorRef()
if (a.IsDead())
     kMyQuest.Increment(6)
Else
     Alias_MeleeCombatants.AddRef(a)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Enable the perimeter mines, markers, and triggers related to the fight.
DLC01MQ02FightEnableMarker.EnableNoWait()

;Close and lock the gates.
HullGateREF.SetOpen(False)
HullGateREF.SetLockLevel(255) ;Requires Key
HullGateREF.Lock()
HullGateCollisionRef.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Make sure all prior stages have been set.
SetStage(20)

;Start the Pre-Fight Scene on DLC03MQ02.
;Do this only if no higher stage has been set, to support quickstarts to later in the fight.
if (GetStage() == 30)
     DLC03MQ02_0200c_AveryToWall.Stop()
     DLC03MQ02_Fight_PreFightScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Called by DLC03MQ02's PreFight scene.
;Enable Jared and his band of Survivors.
;- Select Spawn Points
ObjectReference[] survivorSpawnStart = kMyQuest.SelectSpawnPoint(1, DLC03MQ02Fight_SurvivorSpawnWest, DLC03MQ02Fight_SurvivorSpawnSouth)
ObjectReference[] survivorSpawnPoints = survivorSpawnStart[0].GetLinkedRefChain(LinkCustom01)
survivorSpawnPoints.Insert(survivorSpawnStart[0], 0)

; - Move them into position and enable them.
kMyQuest.SetupSurvivor(Alias_Jared, survivorSpawnPoints, 0)
kMyQuest.SetupSurvivor(Alias_Survivor1, survivorSpawnPoints, 1)
kMyQuest.SetupSurvivor(Alias_Survivor2, survivorSpawnPoints, 2)
kMyQuest.SetupSurvivor(Alias_Survivor3, survivorSpawnPoints, 3)

; - Wound the Survivors.
Actor s1 = Alias_Survivor1.GetActorRef()
s1.DamageValue(RightAttackCondition, 1000)
s1.DamageValue(Health, 85)
s1.EvaluatePackage()

Actor s2 = Alias_Survivor2.GetActorRef()
s2.DamageValue(Health, 100)
s2.EvaluatePackage()

Actor s3 = Alias_Survivor3.GetActorRef()
s3.DamageValue(LeftAttackCondition, 1000)
s3.DamageValue(Health, 125)
s3.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Set at the end of DLC03MQ02's PreFight scene. Start's Jared's Pre-Fight scene.
DLC03MQ02Fight_35_PreFight.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Make sure all prior stages have been set.
SetStage(30)

;EVP the Survivors, switching them from a Jog to a Run.
Alias_Jared.TryToEvaluatePackage()
Alias_Survivor1.TryToEvaluatePackage()
Alias_Survivor2.TryToEvaluatePackage()
Alias_Survivor3.TryToEvaluatePackage()

;Start the Wave 1 scene.
DLC03MQ02Fight_40_Wave1Start.Start()

;Start the Fight Monitor timer.
kMyQuest.StartFightMonitor()

;Spawn Wave 1. (5 Gulpers)
ObjectReference[] spawnPoints = kMyQuest.SelectSpawnPoint(5, DLC03MQ02Fight_SpawnStartWest, DLC03MQ02Fight_SpawnStartSouth)
kMyQuest.SetupEnemy(None, spawnPoints[0],DLC03_LvlGulper, 0, Alias_Enemies_Wave1, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[1], DLC03_LvlGulper, 1, Alias_Enemies_Wave1, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[2], DLC03_LvlGulper, 2, Alias_Enemies_Wave1, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[3], DLC03_LvlGulper, 1, Alias_Enemies_Wave1, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[4], DLC03_LvlGulper, 0, Alias_Enemies_Wave1, Alias_Enemies_All)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;Set by the Wave 1 scene. Update DLC03MQ02's objective.
DLC03MQ02.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the Wave 2 scene.
DLC03MQ02Fight_50_Wave2Start.Start()

;Enable and activate the Mirelurk Hunter ambushes in Wave 2.
int i = 0
While (i < Alias_Enemies_Wave2.GetCount())
     Actor current = Alias_Enemies_Wave2.GetAt(i) as Actor
     if (current != None)
          kMyQuest.SetupEnemy(current, col1=Alias_Enemies_All)
          current.Enable()
          current.Activate(current)
          Utility.Wait(Utility.RandomFloat(0.5, 0.75))
     EndIf
     i = i + 1
EndWhile

;Spawn the Gulpers that are part of Wave 2.
ObjectReference[] spawnPoints = kMyQuest.SelectSpawnPoint(2, DLC03MQ02Fight_SpawnStartSouth, DLC03MQ02Fight_SpawnStartWest)
kMyQuest.SetupEnemy(None, spawnPoints[0], DLC03_LvlGulper, 0, Alias_Enemies_Wave2, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[1], DLC03_LvlGulper, 0, Alias_Enemies_Wave2, Alias_Enemies_All)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Start the Wave 3 scene.
DLC03MQ02Fight_60_Wave3Start.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Spawn Wave 3. (2 Anglers, 2 Gulpers).
ObjectReference[] spawnPoints = kMyQuest.SelectSpawnPoint(4, DLC03MQ02Fight_SpawnStartWest, DLC03MQ02Fight_SpawnStartSouth)
kMyQuest.SetupEnemy(None, spawnPoints[0], DLC03_LvlAngler, 1, Alias_Enemies_Wave3, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[1], DLC03_LvlGulper, 0, Alias_Enemies_Wave2, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[2], DLC03_LvlAngler, 1, Alias_Enemies_Wave3, Alias_Enemies_All)
kMyQuest.SetupEnemy(None, spawnPoints[3], DLC03_LvlGulper, 0, Alias_Enemies_Wave2, Alias_Enemies_All)

;We're down to the last few enemies, so hae DLC03MQ02 mark them with quest targets.
DLC03MQ02.SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Stop the Fight Monitor timer.
kMyQuest.StopFightMonitor()

;Change Jared's Archetype to something more relaxed, now that the fight has ended.
Actor Jared = Alias_Jared.GetActorRef()
if ((Jared != None) && (!Jared.IsDead()))
     Jared.ChangeAnimArchetype(AnimArchetypeFriendly)
     Jared.ChangeAnimFaceArchetype(AnimFaceArchetypeRelieved)
EndIf

;Play the All Clear scene.
DLC03MQ02Fight_90_AllClear.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Let DLC03MQ02 know the fight has ended.
DLC03MQ02.SetStage(300)

;Open the gate.
HullGateREF.SetOpen(True)
HullGateREF.SetLockLevel(0)
HullGateREF.Unlock()
HullGateCollisionRef.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Jared, if he lived, offers the player a reward: 35 Caps for each Survivor.
Game.GetPlayer().AddItem(Caps001, (35 * kMyQuest.SurvivorCount))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ02FightQuestScript
Quest __temp = self as Quest
DLC03:DLC03MQ02FightQuestScript kmyQuest = __temp as DLC03:DLC03MQ02FightQuestScript
;END AUTOCAST
;BEGIN CODE
;Open the gate.
HullGateREF.SetOpen(True)
HullGateREF.SetLockLevel(0)
HullGateREF.Unlock()
HullGateCollisionRef.DisableNoWait()

;Clean up Jared, his survivors, and the quest markers.
kMyQuest.CleanupFight()

;Clean up the enemy ref collections.
kMyQuest.CleanupRefCollection(Alias_Enemies_Wave1)
kMyQuest.CleanupRefCollection(Alias_Enemies_Wave2)
kMyQuest.CleanupRefCollection(Alias_Enemies_Wave3)

;Shut down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ02 Auto Const Mandatory

ReferenceAlias Property Alias_CaptainAvery Auto Const Mandatory
ReferenceAlias Property Alias_AllenLee Auto Const Mandatory
ReferenceAlias Property Alias_Mariner Auto Const Mandatory
ReferenceAlias Property Alias_Jared Auto Const Mandatory
ReferenceAlias Property Alias_Survivor1 Auto Const Mandatory
ReferenceAlias Property Alias_Survivor2 Auto Const Mandatory
ReferenceAlias Property Alias_Survivor3 Auto Const Mandatory
ReferenceAlias Property Alias_ResidentF04 Auto Const Mandatory
ReferenceAlias Property Alias_ResidentM07 Auto Const Mandatory

RefCollectionAlias Property Alias_MeleeCombatants Auto Const Mandatory
RefCollectionAlias Property Alias_Enemies_Wave1 Auto Const Mandatory
RefCollectionAlias Property Alias_Enemies_Wave2 Auto Const Mandatory
RefCollectionAlias Property Alias_Enemies_Wave3 Auto Const Mandatory
RefCollectionAlias Property Alias_Enemies_All Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

ActorBase Property DLC03_LvlAngler Auto Const Mandatory
ActorBase Property DLC03_LvlGulper Auto Const Mandatory

ObjectReference Property DLC03MQ02Fight_SpawnStartWest Auto Const Mandatory
ObjectReference Property DLC03MQ02Fight_SpawnStartSouth Auto Const Mandatory
ObjectReference Property DLC03MQ02Fight_SurvivorSpawnWest Auto Const Mandatory
ObjectReference Property DLC03MQ02Fight_SurvivorSpawnSouth Auto Const Mandatory
ObjectReference Property DLC01MQ02FightEnableMarker Auto Const Mandatory
ObjectReference Property DLC03MQ02Fight_PlayerQuickstartMarker Auto Const Mandatory
ObjectReference Property DLC03MQ02Fight_PlayerQuickstartMarker2 Auto Const Mandatory
ObjectReference Property HullGateREF Auto Const Mandatory
ObjectReference Property HullGateCollisionRef Auto Const Mandatory

EncounterZone Property DLC03FarHarborZone Auto Const Mandatory

Scene Property DLC03MQ02_0100_AmbientBoatApproach Auto Const Mandatory
Scene Property DLC03MQ02_0200_AveryGreeting Auto Const Mandatory
Scene Property DLC03MQ02_0200c_AveryToWall Auto Const Mandatory
Scene Property DLC03MQ02_Fight_PreFightScene Auto Const Mandatory
Scene Property DLC03MQ02_Fight_HullWarning Auto Const Mandatory
Scene Property DLC03MQ02Fight_35_PreFight Auto Const Mandatory
Scene Property DLC03MQ02Fight_40_Wave1Start Auto Const Mandatory
Scene Property DLC03MQ02Fight_50_Wave2Start Auto Const Mandatory
Scene Property DLC03MQ02Fight_60_Wave3Start Auto Const Mandatory
Scene Property DLC03MQ02Fight_70_FightEnd Auto Const Mandatory
Scene Property DLC03MQ02Fight_90_AllClear Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory
Keyword Property AnimArchetypeFriendly Auto Const Mandatory
Keyword Property AnimFaceArchetypeRelieved Auto Const Mandatory

ActorValue Property LeftAttackCondition Auto Const Mandatory
ActorValue Property RightAttackCondition Auto Const Mandatory
ActorValue Property PerceptionCondition Auto Const Mandatory
ActorValue Property EnduranceCondition Auto Const Mandatory
ActorValue Property Health Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
Faction Property DLC03MQ02FightMineFaction Auto Const Mandatory
Faction Property DLC03SettlementFarHarborFaction Auto Const Mandatory
