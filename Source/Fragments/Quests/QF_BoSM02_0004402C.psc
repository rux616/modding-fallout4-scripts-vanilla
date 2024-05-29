;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM02_0004402C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Move the player to Kells.
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Debug quest setup.
;Skip BoS100 (Fire Support) and 101 (Call to Arms)
BoS100Fight.SetStage(2)
BoS100.SetStage(255)
BoS101.SetStage(555)
;Skip BoS200 (Training) and BoS201 (Shadow of Steel)
BoS200.SetStage(10)
BoS200.SetStage(20)
BoS200.SetStage(40)
BoS200.SetStage(100)
BoS200.SetStage(200)
BoS200.SetStage(255)
BoS201.SetStage(170)
BoS201.SetStage(255)
BoS202.SetStage(255)
BoSM00.Start()

;Player in BoS; Training missions, if any, done.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPrydwenArrived.SetValue(1)
BoSKellsIntroDone.SetValue(1)
BoSPlayerRank.SetValue(2)
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)

;BoSM01 Complete
MQ102.SetStage(15)
BoSM01.SetStage(200)
BoSM01.SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)

;Move the player to Gavil.
Game.GetPlayer().MoveTo(BoSM02SupplyDepotQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)

;Move the player to Gavil.
Game.GetPlayer().MoveTo(BoSM02SupplyDepotQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)
SetStage(59)
SetStage(69)
SetStage(70)
SetStage(75)

;Move the player to Lucia's berth.
Game.GetPlayer().MoveTo(BoSM02PrydwenBerthsQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)
SetStage(59)
SetStage(69)
SetStage(70)
SetStage(75)
SetStage(90)

;Move the player to Lucia.
Game.GetPlayer().MoveTo(Alias_BoSLucia.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)
SetStage(59)
SetStage(69)
SetStage(70)
SetStage(75)
SetStage(90)
SetStage(150)

;Move the player to the supply depot.
Game.GetPlayer().MoveTo(BoSM02SupplyDepotQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)
SetStage(59)
SetStage(69)
SetStage(70)
SetStage(75)
SetStage(90)
SetStage(150)
SetStage(155)
SetStage(159)
SetStage(160)
BoSM02_ClarkeStage150_Follow0a.Stop()
BoSM02_ClarkeStage150_Follow0b.Stop()
BoSM02_ClarkeStage150_Follow0c.Stop()
BoSM02_ClarkeStage160_Follow1.Stop()
BoSM02_ClarkeStage190_Follow2.Stop()
SetStage(199)

;Move the player inside the Airport Ruins.
Game.GetPlayer().MoveTo(DN165_BostonAirportRuinsCOCMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)
SetStage(59)
SetStage(69)
SetStage(70)
SetStage(75)
SetStage(90)
SetStage(150)
SetStage(155)
SetStage(159)
SetStage(160)
BoSM02_ClarkeStage150_Follow0a.Stop()
BoSM02_ClarkeStage150_Follow0b.Stop()
BoSM02_ClarkeStage150_Follow0c.Stop()
BoSM02_ClarkeStage160_Follow1.Stop()
BoSM02_ClarkeStage190_Follow2.Stop()
SetStage(199)
SetStage(200)
SetStage(210)
SetStage(220)

;Move the player to the approach hallway.
Game.GetPlayer().MoveTo(BoSM02ConfrontationQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Advance the quest.
SetStage(30)
SetStage(50)
SetStage(59)
SetStage(69)
SetStage(70)
SetStage(75)
SetStage(90)
SetStage(150)
SetStage(155)
SetStage(159)
SetStage(160)
BoSM02_ClarkeStage150_Follow0a.Stop()
BoSM02_ClarkeStage150_Follow0b.Stop()
BoSM02_ClarkeStage150_Follow0c.Stop()
BoSM02_ClarkeStage160_Follow1.Stop()
BoSM02_ClarkeStage190_Follow2.Stop()
SetStage(199)
SetStage(200)
SetStage(210)
SetStage(220)
SetStage(350)
SetStage(351) ;351-4 or 485

;Move the player to Kells.
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Make sure the Airport Ruins are locked and set up for BoSM02. This should have been handled
;by the Prydwen's arrival, but set the stage again here, just to be safe.
DN165.SetStage(30)

;Enable Gavil. This should have been handled by BoS201 Stage 140, but do it again here for safety.
Alias_BoSGavil.TryToEnableNoWait()

;Enable the soldiers actors in the supply depot. This should have been handled by BoSEnable,
;but do it again here, just to be safe.
BoSAirportSupplyDepotSoldiers.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If this quest is running when the player is kicked out of the Brotherhood, it largely just fails.

;Fail all objectives.
FailAllObjectives()

;Fail the quest (but only if it was visible to the player).
if (Self.GetStage() >= 15)
     SetStage(499)
EndIf

;Restore Clarke to the Brotherhood faction, so he'll be hostile if the player encounters him.
Actor Clarke = Alias_BoSClarke.GetActorRef()
Clarke.AddToFaction(BrotherhoodOfSteelFaction)
BoSKickout_BoSInitiateClarke.ForceRefTo(Clarke)
Clarke.EvaluatePackage()

;Gavil, Lucia, and Clarke will generally drop to their base actor packages
;and sandbox around the depot.

;Unlock the dungeon, so it doesn't remain permanently closed.
DN165AirportRuinsDoor.Unlock()

;Quest shuts down.
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Display 'Speak to Captain Kells'
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Complete 'Speak to Captain Kells', if displayed.
SetObjectiveCompleted(15)

;Start 'Speak to Knight-Sergeant Gavil'
SetObjectiveDisplayed(30)

;Enable Gavil, Lucia, and Clarke.
;Alias_BoSGavil.TryToEnable()  ;Gavil now enabled by BoSEnable.
Alias_BoSLucia.TryToEnable()
Alias_BoSClarke.TryToEnable()

;Move Gavil into position.
Alias_BoSGavil.GetActorRef().MoveToPackageLocation()

;Enable the Supply Log note in the depot.
BoSM02_SupplyLog.Enable()

;Stop the firing range scene, if it was running, since the range will be shut down during the quest.
BoSPrydwenScene_Range.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Complete 'Speak to Knight-Sergeant Gavil'
SetObjectiveCompleted(30)

;Start 'Question Knight Lucia'
SetObjectiveDisplayed(50)

;Start 'Question Initiate Clarke'
SetObjectiveDisplayed(51)

;Plant the evidence.
ObjectReference LuciaTrunk = Alias_BoSLuciaTrunk.GetReference()
ObjectReference ClarkeTrunk = Alias_BoSClarkeTrunk.GetReference()
LuciaTrunk.Lock()
ClarkeTrunk.Lock()
Alias_BoSLuciaTrunkName.ForceRefTo(LuciaTrunk)
Alias_BoSClarkeTrunkName.ForceRefTo(ClarkeTrunk)
Alias_BoSAliasLocker.GetReference().RemoveItem(Alias_BoSLuciaTrunkKey1.GetReference(), 1, True, Alias_BoSLucia.GetReference())
Alias_BoSAliasLocker.GetReference().RemoveItem(Alias_BoSLuciaHolotape.GetReference(), 1, True, LuciaTrunk)
Alias_BoSAliasLocker.GetReference().RemoveItem(Alias_BoSLuciaTrunkKey2.GetReference(), 1, True, ClarkeTrunk)
Alias_BoSAliasLocker.GetReference().RemoveItem(Alias_BoSClarkeNote.GetReference(), 1, True, ClarkeTrunk)
Alias_BoSAliasLocker.GetReference().RemoveItem(Alias_BoSClarkeTrunkKey1.GetReference(), 1, True, Alias_BoSClarke.GetReference())
Alias_BoSClarkeTrunkKey2.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0059_Item_00
Function Fragment_Stage_0059_Item_00()
;BEGIN CODE
;Player has spoken to Lucia and hit a dead end.
SetObjectiveDisplayed(50, False)

;If the player has exhausted their dialogue options with Lucia and Clarke, refer back to Gavil.
if (GetStageDone(59) && GetStageDone(69))
     SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0069_Item_00
Function Fragment_Stage_0069_Item_00()
;BEGIN CODE
;Player has spoken to Clarke and hit a dead end.
SetObjectiveDisplayed(51, False)

;If the player has exhausted their dialogue options with both Lucia and Clarke,
;send them back to Gavil.
if (GetStageDone(59) && GetStageDone(69) && !GetStageDone(80))
     SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Display 'Speak to Sergeant Gavil'
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;Complete 'Speak to Sergeant Gavil'
SetObjectiveCompleted(70)

;Has the player found Lucia's Journal yet?
if (!GetStageDone(80))
     ;Display 'Search for Evidence'
     SetObjectiveDisplayed(75)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Complete 'Search for Evidence'
SetObjectiveCompleted(75)

;Display 'Read Knight Lucia's Journal'
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Complete 'Search for Evidence' if active.
SetObjectiveCompleted(75)

;Complete 'Read Knight Lucia's Journal'
SetObjectiveCompleted(80)

;Hide 'Question Knight Lucia' if active.
if (IsObjectiveDisplayed(50))
     SetObjectiveDisplayed(50, False)
EndIf

;Start 'Confront Knight Lucia'
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Complete 'Question Knight Lucia' and 'Confront Knight Lucia'
SetObjectiveCompleted(50)
SetObjectiveCompleted(90)

;Hide 'Question Initiate Clarke', 'Speak to Sergeant Gavil', and 'Search for Evidence'
;and 'Read Lucia's Journal' if not completed by this point.
if (!IsObjectiveCompleted(51))
     SetObjectiveDisplayed(51, False)
EndIf
if (!IsObjectiveCompleted(70))
     SetObjectiveDisplayed(70, False)
EndIf
if (!IsObjectiveCompleted(75))
     SetObjectiveDisplayed(75, False)
EndIf
if (!IsObjectiveCompleted(80))
     SetObjectiveDisplayed(80, False)
EndIf

;Start 'Shadow Knight Clarke'
SetObjectiveDisplayed(150)

;Start Danse's follow-on scene if he's present.
if (Alias_Companion.GetActorRef() == Alias_BoSM02PaladinDanse.GetActorRef())
     Utility.Wait(1)
     BoSM02_Lucia_Stage50_PostDanse.Start()
     Utility.Wait(5)
EndIf

;Start Clarke's initial scene.
BoSM02_ClarkeStage150_Follow0a.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Shadow sequence: start monitoring Clarke.
kMyQuest.StartClarkeMonitor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0176_Item_00
Function Fragment_Stage_0176_Item_00()
;BEGIN CODE
;Also set Stage 175, to make sure it got flagged.
SetStage(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;Redisplay 'Shadow Knight Clarke'
SetObjectiveDisplayed(150, True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0191_Item_00
Function Fragment_Stage_0191_Item_00()
;BEGIN CODE
;Play Clarke curse scene.
BoSM02_ClarkeStage190_Follow2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
;Move Clarke into position for the confrontation scene.
Actor Clarke = Alias_BoSClarke.GetActorRef()
if (!Clarke.IsDead())
     Clarke.EvaluatePackage()
     Clarke.ChangeAnimArchetype()
     Clarke.ChangeAnimArchetype(AnimArchetypeNervous)
     Clarke.ChangeAnimFaceArchetype()
     Clarke.ChangeAnimFaceArchetype(AnimFaceArchetypeNervous)
     Clarke.MoveTo(BoSM02ClarkeConfrontationWaitPoint)
EndIf

;Make it acceptable to kill Clarke from this point forward.
Alias_BoSClarke.GetActorRef().RemoveFromFaction(BrotherhoodOfSteelFaction)
BoSKickout_BoSInitiateClarke.Clear()

;Remove Protected from him so he can be killed by Companions, etc.
Clarke.GetActorBase().SetProtected(False)

;Set Clarke friendly with the Ghouls.
BoSInitiateClarkeFaction.SetAlly(FeralGhoulFaction, True, True)

;Give Clarke an Airport ID Card so the player can later take it from his body.
Clarke.AddItem(DN165_AirportEmployeeIDCard)

;Enable the Map Marker for the Airport Ruins.
BostonAirportRuinsMapMarkerRef.Enable()

;Unlock the door so the player can get in.
DN165AirportRuinsDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Make sure Clarke is in position.
SetStage(199)

;Set the elevator door open so Stage 210 can close it again.
DN165_FacilitiesElevatorOuterDoor.SetOpen(True)

;Complete 'Shadow Initiate Clarke'
SetObjectiveCompleted(150)

;Display 'Find Initiate Clarke'
SetObjectiveDisplayed(200)

;Reward Radiant XP if the player wasn't detected by Clarke.
if (!GetStageDone(175))
     Game.RewardPlayerXP(XPRadiant.GetValue() as int)
EndIf

;If Danse is present, play his scene.
BoSM02_DanseStage200_EnterRuins.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Send the elevator down by activating the lower call button.
DN165_FacilitiesElevatorLowerCallButton.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Display 'Optional: Exterminate the Ghouls'
SetObjectiveDisplayed(220)

;If Danse is present, play his scene.
BoSM02_DanseStage220_SeeGhoulsInRuins.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
;Displays the 'Optional: Exterminate the Ghouls' quest target on the boss.
;Currently triggered as a side effect of the Clarke: Approach scene, as you enter lower baggage claim.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;Complete 'Optional: Exterminate the Ghouls'
SetObjectiveCompleted(220)

;Reward Bonus XP for completing the objective.
Game.RewardPlayerXP(XPRadiant.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;Player enters the lower facilities area.

;Show the quest target to the ghoul boss.
SetStage(221)

;Start Clarke's feeding scene on approach.
BoSM02_ClarkeStage230_Approach.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
;Start Danse's forcegreet scene if he's present.
BoSM02DanseOverrides_DanseStage235_ApproachCallout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0236_Item_00
Function Fragment_Stage_0236_Item_00()
;BEGIN CODE
;Danse moves to his waiting point when the forcegreet ends (or if the player rushes in).
Alias_BoSM02PaladinDanse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
;When the player gets within detection range:
;- Stop the feeding scene, if it's still running.
BoSM02_ClarkeStage230_Approach.Stop()
;- Start Clarke's detection scene.
BoSM02_ClarkeStage240_Detection.Start()
;- EVP Danse to make sure he stays outside.
Alias_BoSM02PaladinDanse.GetActorRef().EvaluatePackage()

;Complete 'Find Initiate Clarke'
SetObjectiveCompleted(200)

;Display 'Confront Initiate Clarke'
SetObjectiveDisplayed(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;If the player is detected by Clarke, but leaves without speaking to him:
;- Stop Clarke's other scenes.
BoSM02_ClarkeStage230_Approach.Stop()
BoSM02_ClarkeStage240_Detection.Stop()
;- Start Clarke's leaving scene.
BoSM02_ClarkeStage250_Leaving.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;If the player really leaves without speaking to Clarke:
;- Stop Clarke's other scenes.
BoSM02_ClarkeStage230_Approach.Stop()
BoSM02_ClarkeStage240_Detection.Stop()
BoSM02_ClarkeStage250_Leaving.Stop()

;- Start Clarke's bypass scene.
BoSM02_ClarkeStage255_Bypass.Start()

;Set Clarke hostile. The player must now kill him.
SetStage(380)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0256_Item_00
Function Fragment_Stage_0256_Item_00()
;BEGIN CODE
;If the player forces Paladin Danse into Clarke's room:
;- Stop Clarke's other scenes.
BoSM02_ClarkeStage230_Approach.Stop()
BoSM02_ClarkeStage240_Detection.Stop()
BoSM02_ClarkeStage250_Leaving.Stop()

;- Start Clarke's Danse detection scene.
BoSM02_ClarkeStage256_DetectionDanse.Start()

;Set Clarke hostile. The player must now kill him.
SetStage(380)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;If Clarke hasn't agreed to let the player kill the ghouls, he turns hostile.
if (!GetStageDone(360))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;The confrontation with Clarke has been resolved in some manner.

;End Danse's special override.
kMyQuest.StopDanseOverride()

;Complete 'Find Initiate Clarke' and 'Confront Initiate Clarke'
SetObjectiveCompleted(200)
SetObjectiveCompleted(240)

;Display 'Report to Captain Kells'
if ((!GetStageDone(379) && !GetStageDone(380)) || GetStageDone(385))
     SetObjectiveDisplayed(350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;Complete 'Find Initiate Clarke' and 'Confront Initiate Clarke'
SetObjectiveCompleted(200)
SetObjectiveCompleted(240)

;Display 'Kill Initiate Clarke'
SetObjectiveDisplayed(380)

;Suppress 'Report to Captain Kells' if previously displayed.
if (IsObjectiveDisplayed(350))
     SetObjectiveDisplayed(350, False)
EndIf

;Make Clarke hostile.
Actor Clarke = Alias_BoSClarke.GetActorRef()
Clarke.RemoveFromFaction(BrotherhoodOfSteelFaction)
BoSInitiateClarkeFaction.SetEnemy(PlayerFaction)
Clarke.StartCombat(Game.GetPlayer())
Clarke.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
if (GetStageDone(200))
     ;Complete 'Kill Initiate Clarke'
     SetObjectiveCompleted(380)

     ;Set 'Resolution - Any'
     SetStage(350)

     ;Make sure 'Report to Captain Kells' is displayed or re-displayed.
     SetObjectiveDisplayed(350)
EndIf

;If Clarke is killed before entering the ruins, BoSKickout will trigger. This ultimately fails the quest.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory or Give Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

;+0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

kmyQuest.RewardLevel = kmyQuest.RewardLevel + 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

kmyQuest.RewardLevel = kmyQuest.RewardLevel + 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0404_Item_00
Function Fragment_Stage_0404_Item_00()
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory or Give Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

;+0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory or Gave Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

kmyQuest.RewardLevel = kmyQuest.RewardLevel + 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0412_Item_00
Function Fragment_Stage_0412_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory or Gave Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

kmyQuest.RewardLevel = kmyQuest.RewardLevel + 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0413_Item_00
Function Fragment_Stage_0413_Item_00()
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory or Gave Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

;+0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0414_Item_00
Function Fragment_Stage_0414_Item_00()
;BEGIN CODE
;Update Reward Level:
;Supplies: 0 for Inventory or Gave Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In

;+0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
;Transfer Clarke's holotag to Kells.
Game.GetPlayer().RemoveItem(BoSM02_HolotagClarke, 1, Alias_BoSCaptainKells.GetActorRef())
Game.GetPlayer().RemoveItem(Alias_BoSRylanHolotag.GetReference(), 1, Alias_BoSCaptainKells.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Kill any surviving Ghouls if the player mentioned them to Kells.
if (GetStageDone(405))
     int i = 0
     While (i < Alias_DN165RuinsGhouls.GetCount())
          (Alias_DN165RuinsGhouls.GetAt(i) as Actor).Kill()
          i = i + 1
     EndWhile
EndIf


;Calculate the player's reward.
;Supplies: 0 for Inventory or Gave Up, 1 for Ghouls, 2 for Clarke
;Clarke: 0 for AWOL/Killed, 1 for On Base, 2 for Turn In
if (kmyQuest.RewardLevel == 0)
     ;No item reward, just the XP.
ElseIf (kmyQuest.RewardLevel == 1)
     Game.GetPlayer().AddItem(LL_Caps_Reward_Small)
ElseIf (kmyQuest.RewardLevel == 2)
     Game.GetPlayer().AddItem(LL_Caps_Reward_Medium)
ElseIf (kmyQuest.RewardLevel == 3)
     Game.GetPlayer().AddItem(LL_Caps_Reward_Large)
Else ;4
     Game.GetPlayer().AddItem(LL_Caps_Reward_Large)

     ;Kells gives a Power Armor piece.
     if (BoSPlayerRank.GetValue() == 2)
          CustomItemQuest.SetStage(170)
     ElseIf (BoSPlayerRank.GetValue() == 3)
          CustomItemQuest.SetStage(180)
     Else
          CustomItemQuest.SetStage(190)
     EndIf
EndIf

;Update Global for Radio News
RadioDCBoSM02Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Start Postquest
if (GetStageDone(411) || GetStageDone(412))
     BoSM02Postquest.SetStage(20)
ElseIf (GetStageDone(353))
     BoSM02Postquest.SetStage(30)
Else
     BoSM02Postquest.SetStage(10)
EndIf

;Complete the quest.
CompleteAllObjectives()
CompleteQuest()

;Wait for the dialogue handoff to stop the quest.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE BoSM02QuestScript
Quest __temp = self as Quest
BoSM02QuestScript kmyQuest = __temp as BoSM02QuestScript
;END AUTOCAST
;BEGIN CODE
;Make absolutely sure Danse's special override has ended.
kMyQuest.StopDanseOverride()

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ102 Auto Const
Quest Property BoSEnable Auto Const
Quest Property BoSDialogue Auto Const
Quest Property BoS100 Auto Const
Quest Property BoS100Fight Auto Const
Quest Property BoS101 Auto Const
Quest Property BoS200 Auto Const
Quest Property BoS201 Auto Const
Quest Property BoS202 Auto Const
Quest Property BoSM01 Auto Const
Quest Property BoSM02Postquest Auto Const
Quest Property BoSM02DanseOverrides Auto Const
Quest Property DN165 Auto Const

GlobalVariable Property BoSKellsIntroDone Auto Const
GlobalVariable Property BoSTraining Auto Const
GlobalVariable Property BoSPrydwenArrived Auto Const
GlobalVariable Property BoSJoined Auto Const
GlobalVariable Property BoSPlayerRank Auto Const
GlobalVariable Property GameDaysPassed Auto Const
GlobalVariable Property RadioDCBoSM02Ready Auto Const

ReferenceAlias Property Alias_Companion Auto Const
ReferenceAlias Property Alias_BoSM02PaladinDanse Auto Const
ReferenceAlias Property Alias_BoSCaptainKells Auto Const
ReferenceAlias Property Alias_BoSGavil Auto Const
ReferenceAlias Property Alias_BoSLucia Auto Const
ReferenceAlias Property Alias_BoSClarke Auto Const
ReferenceAlias Property BoSKickout_BoSInitiateClarke Auto Const

ReferenceAlias Property Alias_BoSAliasLocker Auto Const
ReferenceAlias Property Alias_BoSLuciaTrunk Auto Const
ReferenceAlias Property Alias_BoSLuciaTrunkName Auto Const
ReferenceAlias Property Alias_BoSLuciaTrunkKey1 Auto Const
ReferenceAlias Property Alias_BoSLuciaTrunkKey2 Auto Const
ReferenceAlias Property Alias_BoSLuciaHolotape Auto Const
ReferenceAlias Property Alias_BoSClarkeTrunk Auto Const
ReferenceAlias Property Alias_BoSClarkeTrunkName Auto Const
ReferenceAlias Property Alias_BoSClarkeTrunkKey1 Auto Const
ReferenceAlias Property Alias_BoSClarkeTrunkKey2 Auto Const
ReferenceAlias Property Alias_BoSClarkeNote Auto Const
ReferenceAlias Property Alias_BoSRylanHolotag Auto Const

RefCollectionAlias Property Alias_DN165RuinsGhouls Auto Const

ObjectReference Property BoSMQuickstartMarker Auto Const
ObjectReference Property BoSM02SupplyDepotQuickstartMarker Auto Const
ObjectReference Property BoSM02PrydwenBerthsQuickstartMarker Auto Const
ObjectReference Property DN165_BostonAirportRuinsCOCMarker Auto Const
ObjectReference Property BoSM02ConfrontationQuickstartMarker Auto Const
ObjectReference Property BoSAirportSupplyDepotSoldiers Auto Const
ObjectReference Property BoSM02_SupplyLog Auto Const
ObjectReference Property DN165AirportRuinsDoor Auto Const
ObjectReference Property BostonAirportRuinsMapMarkerRef Auto Const
ObjectReference Property DN165_FacilitiesElevator Auto Const
ObjectReference Property DN165_FacilitiesElevatorOuterDoor Auto Const
ObjectReference Property DN165_FacilitiesElevatorLowerCallButton Auto Const
ObjectReference Property BoSM02ClarkeConfrontationWaitPoint Auto Const

Faction Property PlayerFaction Auto Const
Faction Property BrotherhoodofSteelFaction Auto Const
Faction Property BoSInitiateClarkeFaction Auto Const
Faction Property FeralGhoulFaction Auto Const

LeveledItem Property LL_Caps_Reward_Small Auto Const
LeveledItem Property LL_Caps_Reward_Medium Auto Const
LeveledItem Property LL_Caps_Reward_Large Auto Const
LeveledItem Property BoSM02_KellsRewardArmorKnight Auto Const
LeveledItem Property BoSM02_KellsRewardArmorPaladin Auto Const
LeveledItem Property BoSM02_KellsRewardArmorSentinel Auto Const

MiscObject Property BoSM02_HolotagClarke Auto Const
MiscObject Property DN165_AirportEmployeeIDCard Auto Const

Scene Property BoSM02_Lucia_Stage50_PostDanse Auto Const
Scene Property BoSM02_ClarkeStage150_Follow0a Auto Const
Scene Property BoSM02_ClarkeStage150_Follow0b Auto Const
Scene Property BoSM02_ClarkeStage150_Follow0c Auto Const
Scene Property BoSM02_ClarkeStage160_Follow1 Auto Const
Scene Property BoSM02_ClarkeStage190_Follow2 Auto Const
Scene Property BoSM02_ClarkeStage230_Approach Auto Const
Scene Property BoSM02_ClarkeStage240_Detection Auto Const
Scene Property BoSM02_ClarkeStage250_Leaving Auto Const
Scene Property BoSM02_ClarkeStage255_Bypass Auto Const
Scene Property BoSM02_ClarkeStage256_DetectionDanse Auto Const
Scene Property BoSM02_DanseStage200_EnterRuins Auto Const
Scene Property BoSM02_DanseStage220_SeeGhoulsInRuins Auto Const
Scene Property BoSM02DanseOverrides_DanseStage235_ApproachCallout Auto Const

Quest Property BoSM00 Auto Const
GlobalVariable Property XPRadiant Auto Const

Keyword Property AnimArchetypeNervous Auto Const

Keyword Property AnimFaceArchetypeNervous Auto Const

Quest Property BoSPrydwenScene_Range Auto Const

Quest Property CustomItemQuest Auto Const Mandatory
