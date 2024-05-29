;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01_000B1D79 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Debug quest start.
;Skip BoS100 (Fire Support) and 101 (Call to Arms)
BoS100Fight.SetStage(2)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(10)
BoS200.SetStage(20)
BoS200.SetStage(40)
BoS200.SetStage(50)
BoS200.SetStage(100)
BoS200.SetStage(200)
BoS200_01_ReturnScene.Stop()
BoS200_02_PromotionScene.Stop()
BoSM01Pointer.SetStage(10)
;Normal starting stage for BoSM01.
MQ102.SetStage(15)

;Player in BoS; Training missions, if any, done.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPlayerRank.SetValue(1)

;Enable Danse's quest dialogue.
kmyQuest.EnableBoSM01Act1()

;Warp to Danse
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Debug quest start.
;Skip BoS100 (Fire Support) and 101 (Call to Arms)
BoS100Fight.SetStage(2)
BoS100.SetStage(255)
BoS101.SetStage(555)
;Skip BoS200 (Semper Invicta), 201 (Shadow of Steel), 202 (Show No Mercy)
BoS200.SetStage(10)
BoS200.SetStage(20)
BoS200.SetStage(40)
BoS200.SetStage(100)
BoS200.SetStage(200)
BoS200.SetStage(255)
BoS201.SetStage(170)
BoS201.SetStage(255)
BoS202.SetStage(255)
;Normal starting stage for BoSM01.
MQ102.SetStage(15)
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

;Enable Kells' quest dialogue.
kmyQuest.EnableBoSM01Act2()

;Warp to Kells
Actor Kells = Alias_BoSCaptainKells.GetActorRef()
Kells.EvaluatePackage()
Kells.MoveToPackageLocation()
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Move the player and Danse to the Police Station.
Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpPoliceStation)
Game.GetPlayer().MoveTo(BoSM01_WarpPoliceStation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) to Varham.
Game.GetPlayer().MoveTo(BoSM01_WarpVarham)
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpVarham)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) to Astlin.
Game.GetPlayer().MoveTo(BoSM01_WarpAstlin)
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpAstlin)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) to Faris.
Game.GetPlayer().MoveTo(BoSM01_WarpFaris)
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpFaris)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) to Brandis.
Game.GetPlayer().MoveTo(BoSM01_WarpBrandis)
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpBrandis)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) back to the Police Station.
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpPoliceStation)
EndIf
Game.GetPlayer().MoveTo(BoSM01_WarpPoliceStation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) to Captain Kells.
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSMQuickstartMarker)
EndIf
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Move the player (and Danse, if a follower) to Postquest Brandis.
Game.GetPlayer().MoveTo(BoSM01_WarpPrydwen)
if (Alias_Companion.GetActorRef() == Alias_BoSPaladinDanse.GetActorRef())
     Alias_BoSPaladinDanse.GetActorRef().MoveTo(BoSM01_WarpPrydwen)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Startup events.
;[Note that this stage is now normally set by MQ102 Stage 15]

;Start the BoSM01 Distress Signals quest and radio scenes.
BoSM01DistressSignals.Start()

;Start the Danse Overrides quest, which holds the few packages that need a higher priority than
;Danse's Followers quest packages.
BoSM01DanseOverrides.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If this quest is running when the player is kicked out of the Brotherhood, try to clean it up.

;Fail objectives related to reporting to the Brotherhood.
if (IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20))
     SetObjectiveFailed(20, False)
EndIf
if (IsObjectiveDisplayed(65) && !IsObjectiveCompleted(65))
     SetObjectiveFailed(65, False)
EndIf
if (IsObjectiveDisplayed(148) && !IsObjectiveCompleted(148) && !BoS302.GetStageDone(160))
     SetObjectiveFailed(148, False)
EndIf
if (IsObjectiveDisplayed(150) && !IsObjectiveCompleted(150))
     SetObjectiveFailed(150, False)
EndIf
if (IsObjectiveDisplayed(151) && !IsObjectiveCompleted(151))
     SetObjectiveFailed(151, False)
EndIf
if (IsObjectiveDisplayed(152) && !IsObjectiveCompleted(152))
     SetObjectiveFailed(152, False)
EndIf

;If the Precomplete stage didn't run (that is, the player worked on this quest while in the BoS),
;and the encounter with Brandis has been resolved, we have to nominally fail the quest.
;Otherwise, it stays open and continues to run.
if (!GetStageDone(147) && (GetStageDone(116) || GetStageDone(145)))
     SetStage(12)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;The player worked on this quest while in the Brotherhood and resolved the situation with Brandis,
;but did not turn it in to Danse/Kells.
;
;On kickout, then, we have to nominally fail the quest because Completing it feels bizarre
;under the circumstances. The player will miss out on the quest reward XP.

;Block any further dialogue from the questgivers.
kMyQuest.DisableBoSM01Dialogue()

;Fail all objectives.
FailAllObjectives()

;Fail the quest.
;-Flag on this stage.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;If the player worked on this quest while in the Brotherhood and resolved the situation with Brandis,
;but did not turn it in to Danse/Kells, then proceeded to complete the entire game with the Minutemen
;without continuing the Brotherhood questline at all, this leaves the quest in a potentially broken state.
;
;In this case, fail the quest.
if (!GetStageDone(147) && !BoS202.GetStageDone(255) && (GetStageDone(116) || GetStageDone(145)))
     SetStage(12)
ElseIf (!BoS202.GetStageDone(255))
     ;Just hide any objectives related to reporting this quest to the Brotherhood.
     if (IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20))
          SetObjectiveDisplayed(20, False)
     EndIf
     if (IsObjectiveDisplayed(65) && !IsObjectiveCompleted(65))
          SetObjectiveDisplayed(65, False)
     EndIf
     if (IsObjectiveDisplayed(148) && !IsObjectiveCompleted(148))
          SetObjectiveDisplayed(148, False)
     EndIf
     if (IsObjectiveDisplayed(150) && !IsObjectiveCompleted(150))
          SetObjectiveDisplayed(150, False)
     EndIf
     if (IsObjectiveDisplayed(151) && !IsObjectiveCompleted(151))
          SetObjectiveDisplayed(151, False)
     EndIf
     if (IsObjectiveDisplayed(152) && !IsObjectiveCompleted(152))
          SetObjectiveDisplayed(152, False)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;When the player is ordered to kill Paladin Danse in BoS302, clean up the state of BoSM01.

;Block Danse's handoff.
kMyQuest.DisableDanseHandoff()

;Hide '(Optional) Report back to Paladin Danse'
if (IsObjectiveDisplayed(65) && !IsObjectiveCompleted(65))
     SetObjectiveDisplayed(65, False)
EndIf
;Hide 'Speak to Paladin Danse' and 'Report back to Paladin Danse'; direct the player to Kells instead.
if ((IsObjectiveDisplayed(148) && !IsObjectiveCompleted(148)) || (IsObjectiveDisplayed(150) && !IsObjectiveCompleted(150)) || (IsObjectiveDisplayed(151) && !IsObjectiveCompleted(151)))
     if (IsObjectiveDisplayed(148) && !IsObjectiveCompleted(148))
          SetObjectiveDisplayed(148, False)
     EndIf
     SetObjectiveDisplayed(150, False)
     SetObjectiveDisplayed(151, False)
     SetObjectiveDisplayed(152)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Allow Danse (as a Follower) to forcegreet the player when they first pick up a distress signal.
BoSM01_CMPDanseWaitMarker.MoveTo(Game.GetPlayer())
Alias_BoSPaladinDanse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Danse should no longer forcegreet the player about the quest.
SetStage(19)

;If the player has completed the quest at the time this stage is set, set stage 24
;to allow them to reenter the dialogue if they back out.
if (Self.IsCompleted())
     SetStage(24)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
;If the player had an objective to report to Danse, pass them to Kells.
if (IsObjectiveDisplayed(65))
     SetObjectiveCompleted(65)
EndIf
if (IsObjectiveDisplayed(150))
     SetObjectiveCompleted(150)
     SetObjectiveDisplayed(152)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;The player has been given the quest.
;Display the quest and its objectives going forward.
kMyQuest.isQuestTrackingEnabled = True

;If BoSR01/R02 sent the player to Danse, this is now done.
;Complete BoSM01Pointer's 'Report to Paladin Danse' objective.
if (BoSM01Pointer.IsRunning())
     BoSM01Pointer.SetStage(20)
EndIf

;If the player had previously found a Distress Signal, they may have been told to report it.
;If so, this is now done. Complete 'Report your discovery to the Brotherhood.'
SetObjectiveCompleted(20)

;Hide the fallback objective, if it was active.
SetObjectiveDisplayed(29, False)

;If the player has not found Varham's body, point them to it.
;Start 'Search for the Recon Team'
if (!GetStageDone(62))
     SetObjectiveDisplayed(30)
EndIf

;Player has been told how Distress Pulsers work.
PlayerKnowsBoSDistressPulsers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;The first time Danse (as a Follower) encounters one of the distress signals, trigger his intro dialogue.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     BoSM01DanseStage050CMPCommentary1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;On radio event, player is within range of Varham's distress signal.
;Stage is set by BoSM01Radio.

;If Danse is present, trigger his scene.
if (Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;When the player picks up Varham's pulser, stop the radio signal.

;Complete 'Follow the radio distress signal', if it was active.
SetObjectiveCompleted(60)

;Player now has a BoS Pulser, so they know how they work.
PlayerKnowsBoSDistressPulsers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;On trigger, the player is in sight of the body. Display the quest and its objectives going forward.
kMyQuest.isQuestTrackingEnabled = True

;Complete 'Follow the radio distress signal', if it was active.
SetObjectiveCompleted(60)

;Hide the fallback objective, if it was active.
SetObjectiveDisplayed(29, False)

;'Search for the Recon Team' updates if it was active.
;Otherwise, start 'Investigate the battle site'
if (!IsObjectiveDisplayed(30))
     SetObjectiveDisplayed(62)
Else
     SetObjectiveDisplayed(30, True, True)
EndIf

;Start the Companion scene for this location. Danse has a unique scene with more interaction.
if (!GetStageDone(64) && \
     Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage050CMPCommentary1.Stop()
     BoSM01DanseStage060CMPCommentary1.Start()
ElseIf (!GetStageDone(64) && \
     Alias_Companion.GetActorRef() != None)
     BoSM01_CompanionStage060_Commentary1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0064_Item_00
Function Fragment_Stage_0064_Item_00()
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;When player picks up the holotape, prompt them to listen.

;Complete 'Search for the Recon Team'
SetObjectiveCompleted(30)

;Complete 'Investigate the battle site'
SetObjectiveCompleted(62)

;Start 'Listen to the Battlefield Holotape'
SetObjectiveDisplayed(64)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;When player starts listening to the Holotape, set this stage to abort the Companion scenes.
BoSM01DanseStage060CMPCommentary1.Stop()
BoSM01_CompanionStage060_Commentary1.Stop()

;If Danse is present, have him wait for the holotape to play out instead of sandboxing.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     BoSM01DanseStage060CMPCommentary1b.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;When the holotape mentions the next quest site, add an objective to it and check for bunker access.

;If the player has not found Astlin yet, point them to the National Guard Training Yard.
if (!GetStageDone(72))
     ;Add Map Marker to the  National Guard Training Yard
     NationalGuardTrainingYardMapMarkerRef.AddToMap()

     ;Start 'Investigate the National Guard Training Yard'
     SetObjectiveDisplayed(66)
EndIf

;If all three Holotapes have been listened to, the Bunker is now accessible.
if (GetStageDone(66) && GetStageDone(76) && GetStageDone(86))
     SetStage(90)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0067_Item_00
Function Fragment_Stage_0067_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #1 - Knight Varham
;When the holotape ends, update objectives.

;Complete 'Listen to the Battlefield Holotape'
SetObjectiveCompleted(64)

;If Danse is present, play his scene.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     ;Debug.Trace("Attempting to start BoSM01DanseStage060CMPCommentary2")
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage060CMPCommentary1.Stop()
     BoSM01DanseStage060CMPCommentary1b.Stop()
     BoSM01DanseStage060CMPCommentary2.Start()
EndIf

;Handle midquest reporting, directing the player to report back if necessary.
if (isDansePresent && (kMyQuest.isKellsDialogueEnabled == False))
     ;Danse is the questgiver, and he was here, so we won't need to report this later.
     kmyQuest.ClearMidquestEventReporting()
ElseIf ((BoSKickout.GetStage() == 10) && GetStageDone(30) && kMyQuest.isDanseDialogueEnabled)
     ;Give the player 'Optional: Report back to Paladin Danse'
     ;but ONLY if the player is on the formal quest, during Act I.
     SetObjectiveDisplayed(65)
     ;Note that we can report this event.
     kmyQuest.CheckMidquestEventReporting()
Else
     ;If the player is in the Brotherhood but has not received the formal quest,
     ;point them to Danse or Kells so they can provide the background.
     if (BoSPlayerRank.GetValue() > 0 && !GetStageDone(30))
          ;Allow the player to report their discovery to the appropriate questgiver.
          SetStage(24)
          ;Display 'Report your discovery to the Brotherhood' if the reporting is currently possible.
          if ((BoSKickout.GetStage() == 10) && !BoS201.IsRunning() && !BoS202.IsRunning())
               SetObjectiveDisplayed(20)
          EndIf
     EndIf
     ;Note that we can report this event.
     kmyQuest.CheckMidquestEventReporting()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0068_Item_00
Function Fragment_Stage_0068_Item_00()
;BEGIN CODE
;Complete: 'Optional: Report back to Paladin Danse' if it was active.
SetObjectiveCompleted(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;On radio event, player is within range of Astlin's distress signal.
;Stage is set by BoSM01Radio.

;If Danse is present, trigger his scene.
if (Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;When the player picks up Astlin's pulser, stop the radio signal.

;Complete 'Follow the radio distress signal', if it was active.
SetObjectiveCompleted(70)

;Player now has a BoS Pulser, so they know how they work.
PlayerKnowsBoSDistressPulsers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;On trigger, the player is in sight of the body. Display the quest and its objectives going forward.
kMyQuest.isQuestTrackingEnabled = True

;Complete 'Follow the radio distress signal', if it was active.
SetObjectiveCompleted(70)

;Hide the fallback objective, if it was active.
SetObjectiveDisplayed(29, False)

;'Investigate the National Guard Training Yard' updates if it was active.
;Otherwise, start 'Investigate the battle site'
if (!IsObjectiveDisplayed(66))
     SetObjectiveDisplayed(72)
Else
     SetObjectiveDisplayed(66, True, True)
EndIf

;Start the Companion scene for this location. Danse has a unique scene with more interaction.
if (!GetStageDone(74) && \
     Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage050CMPCommentary1.Stop()
     BoSM01DanseStage070CMPCommentary1.Start()
ElseIf (!GetStageDone(74) && \
     Alias_Companion.GetActorRef() != None)
     BoSM01_CompanionStage070_Commentary1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0074_Item_00
Function Fragment_Stage_0074_Item_00()
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;When player picks up the holotape, prompt them to listen.

;Complete 'Investigate the National Guard Training Yard'
SetObjectiveCompleted(66)

;Complete 'Investigate the Battle Site'
SetObjectiveCompleted(72)

;Start 'Listen to Astlin's Holotape'
SetObjectiveDisplayed(74)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;When player starts listening to the Holotape, set this stage to abort the Companion scenes.
BoSM01DanseStage070CMPCommentary1.Stop()
BoSM01_CompanionStage070_Commentary1.Stop()

;If Danse is present, have him wait for the holotape to play out instead of sandboxing.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage070CMPCommentary1b.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0076_Item_00
Function Fragment_Stage_0076_Item_00()
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;When the holotape mentions the next quest site, add an objective to it and check for bunker access.

;If the player has not found Faris yet, point them to the Satellite Array.
if (!GetStageDone(82))
     ;Add Map Marker to the Array
     RevereSatelliteArrayMapMarkerRef.AddToMap()

     ;Start 'Investigate the Satellite Array'
     SetObjectiveDisplayed(76)
EndIf

;If all three Holotapes have been listened to, the Bunker is now accessible.
if (GetStageDone(66) && GetStageDone(76) && GetStageDone(86))
     SetStage(90)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0077_Item_00
Function Fragment_Stage_0077_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #2 - Knight Astlin
;When the holotape ends, update objectives.

;Complete 'Listen to Astlin's Holotape'
SetObjectiveCompleted(74)

;If the player has run out of open objectives, give them the fallback.
if (GetStageDone(30) || GetStageDone(62) || GetStageDone(90) || IsObjectiveDisplayed(76) || (GetStageDone(82) && !GetStageDone(87)))
     ;Player has some other open objective, so don't do anything.
Else
     SetObjectiveDisplayed(29, True)
EndIf

;If Danse is present, play his scene.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage070CMPCommentary1.Stop()
     BoSM01DanseStage070CMPCommentary1b.Stop()
     BoSM01DanseStage070CMPCommentary2.Start()
EndIf

;Handle midquest reporting, directing the player to report back if necessary.
if (isDansePresent && (kMyQuest.isKellsDialogueEnabled == False))
     ;Danse is the questgiver, and he was here, so we won't need to report this later.
     kmyQuest.ClearMidquestEventReporting()
ElseIf ((BoSKickout.GetStage() == 10) && GetStageDone(30) && kMyQuest.isDanseDialogueEnabled)
     ;Give the player 'Optional: Report back to Paladin Danse'
     ;but ONLY if the player is on the formal quest, during Act I.
     SetObjectiveDisplayed(65)
     ;Note that we can report this event.
     kmyQuest.CheckMidquestEventReporting()
Else
     ;If the player is in the Brotherhood but has not received the formal quest,
     ;point them to Danse or Kells so they can provide the background.
     if (BoSPlayerRank.GetValue() > 0 && !GetStageDone(30))
          ;Allow the player to report their discovery to the appropriate questgiver.
          SetStage(24)
          ;Display 'Report your discovery to the Brotherhood' if the reporting is currently possible.
          if ((BoSKickout.GetStage() == 10) && !BoS201.IsRunning() && !BoS202.IsRunning())
               SetObjectiveDisplayed(20)
          EndIf
     EndIf
     ;Note that we can report this event.
     kmyQuest.CheckMidquestEventReporting()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0078_Item_00
Function Fragment_Stage_0078_Item_00()
;BEGIN CODE
;Complete: 'Optional: Report back to Paladin Danse' if it was active.
SetObjectiveCompleted(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;On radio event, player is within range of Faris' distress signal.
;Stage is set by BoSM01Radio.

;If Danse is present, trigger his scene.
if (Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;When the player picks up Faris' pulser, stop the radio signal.

;Complete 'Follow the radio distress signal', if it was active.
SetObjectiveCompleted(80)

;Player now has a BoS Pulser, so they know how they work.
PlayerKnowsBoSDistressPulsers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0082_Item_00
Function Fragment_Stage_0082_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;On trigger, the player is in sight of the body. Display the quest and its objectives going forward.
kMyQuest.isQuestTrackingEnabled = True

;Complete 'Follow the radio distress signal', if it was active.
SetObjectiveCompleted(80)

;Hide the fallback objective, if it was active.
SetObjectiveDisplayed(29, False)

;'Investigate the Satellite Array' updates if it was active.
;Otherwise, start 'Investigate the battle site'
if (!IsObjectiveDisplayed(76))
     SetObjectiveDisplayed(82)
Else
     SetObjectiveDisplayed(76, True, True)
EndIf

;Start the Companion scene for this location. Danse has a unique scene with more interaction.
if (!GetStageDone(84) && \
     Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage050CMPCommentary1.Stop()
     BoSM01DanseStage080CMPCommentary1.Start()
ElseIf (!GetStageDone(84) && \
     Alias_Companion.GetActorRef() != None)
     BoSM01_CompanionStage080_Commentary1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0084_Item_00
Function Fragment_Stage_0084_Item_00()
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;When player picks up the holotape, prompt them to listen.

;Complete 'Investigate the Satellite Array'
SetObjectiveCompleted(76)

;Complete 'Investigate the Battle Site'
SetObjectiveCompleted(82)

;Start 'Listen to Faris' Holotape'
SetObjectiveDisplayed(84)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;When player starts listening to the Holotape, set this stage to abort the Companion scenes.
BoSM01DanseStage080CMPCommentary1.Stop()
BoSM01_CompanionStage080_Commentary1.Stop()

;If Danse is present, have him wait for the holotape to play out instead of sandboxing.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage080CMPCommentary1b.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0086_Item_00
Function Fragment_Stage_0086_Item_00()
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;When the holotape mentions the next quest site, add an objective to it and check for bunker access.

;If all three Holotapes have been listened to, the Bunker is now accessible.
if (GetStageDone(66) && GetStageDone(76) && GetStageDone(86))
     SetStage(90)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0087_Item_00
Function Fragment_Stage_0087_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Patrol Team Member #3 - Scribe Faris
;When the holotape ends, update objectives.

;Complete 'Listen to Faris' Holotape'
SetObjectiveCompleted(84)

;If the player has run out of open objectives, give them the fallback.
if (GetStageDone(30) || GetStageDone(62) || GetStageDone(90) || (GetStageDone(72) && !GetStageDone(77)))
     ;Player has some other open objective, so don't do anything.
Else
     SetObjectiveDisplayed(29, True)
EndIf

;If Danse is present, play his scene.
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
bool isDansePresent = ((Danse == Alias_Companion.GetActorRef()) && (Danse.GetDistance(Game.GetPlayer()) < 1500))
if (isDansePresent)
     BoSM01_DanseStage018CMP_Commentary.Stop()
     BoSM01DanseStage080CMPCommentary1.Stop()
     BoSM01DanseStage080CMPCommentary1b.Stop()
     BoSM01DanseStage080CMPCommentary2.Start()
EndIf

;Handle midquest reporting, directing the player to report back if necessary.
if (isDansePresent && (kMyQuest.isKellsDialogueEnabled == False))
     ;Danse is the questgiver, and he was here, so we won't need to report this later.
     kmyQuest.ClearMidquestEventReporting()
ElseIf ((BoSKickout.GetStage() == 10) && GetStageDone(30) && kMyQuest.isDanseDialogueEnabled)
     ;Give the player 'Optional: Report back to Paladin Danse'
     ;but ONLY if the player is on the formal quest, during Act I.
     SetObjectiveDisplayed(65)
     ;Note that we can report this event.
     kmyQuest.CheckMidquestEventReporting()
Else
     ;If the player is in the Brotherhood but has not received the formal quest,
     ;point them to Danse or Kells so they can provide the background.
     if (BoSPlayerRank.GetValue() > 0 && !GetStageDone(30))
          ;Allow the player to report their discovery to the appropriate questgiver.
          SetStage(24)
          ;Display 'Report your discovery to the Brotherhood' if the reporting is currently possible.
          if ((BoSKickout.GetStage() == 10) && !BoS201.IsRunning() && !BoS202.IsRunning())
               SetObjectiveDisplayed(20)
          EndIf
     EndIf
     ;Note that we can report this event.
     kmyQuest.CheckMidquestEventReporting()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0088_Item_00
Function Fragment_Stage_0088_Item_00()
;BEGIN CODE
;Complete: 'Optional: Report back to Paladin Danse' if it was active.
SetObjectiveCompleted(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Set when Stages 66, 76, and 86 are all complete-- the player has listened to all Holotapes.

;Swap the bunker access terminals. (Avoids revealing the name of the key early.)
BoSM01TerminalRef.Enable()
BoSM01TerminalRef_NoKey.DisableNoWait()

;Spawn Brandis' gun and give it to him.
CustomItemQuest.SetStage(90)
Alias_BoSPaladinBrandis.GetReference().AddItem(Alias_BoSPaladinBrandisGun.GetReference())

;Enable Brandis, who is disabled until this point.
Alias_BoSPaladinBrandis.TryToEnable()

;Give the player the password to the bunker access terminal.
Game.GetPlayer().AddItem(BoSM01_ReconBunkerThetaPassword)

;Add Map Marker to the Bunker
ReconBunkerThetaMapMarkerRef.AddToMap()

;Start 'Investigate the Bunker'
SetObjectiveDisplayed(90)

;Hide the fallback objective, if it was active.
SetObjectiveDisplayed(29, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;Complete: 'Optional: Report back to Paladin Danse' if it was active.
SetObjectiveCompleted(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;On trigger, the player is in range of the bunker.

;If Danse is present, play his scene.
if (!GetStageDone(100) && \
     Alias_BoSPaladinDanse.GetActorRef() == Alias_Companion.GetActorRef())
     BoSM01DanseStage090CMPCommentary1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Player uses the terminal to unlock the bunker.

;Un-ghost Brandis, who is ghosted until this point to prevent him from being
;hit prematurely by explosions, etc.
Actor Brandis = Alias_BoSPaladinBrandis.GetActorRef()
Brandis.SetGhost(False)

;Update the objective marker to point at Brandis (automatic).

;Stop Danse's scene, if it was running, to prevent conflict with Brandis' dialogue.
BoSM01_DanseStage018CMP_Commentary.Stop()
BoSM01DanseStage090CMPCommentary1.Stop()
BoSM01DanseStage090CMPCommentary1b.Stop()

;Force Brandis to reeval his packages, putting him into Forcegreet.
Brandis.MoveTo(BoSM01_Bunker_BrandisMarker)
Brandis.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;EVP Brandis when the player enters the bunker, in case his forcegreet is late.
Alias_BoSPaladinBrandis.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Brandis' forcegreet begins.

;Complete 'Investigate the Bunker'
SetObjectiveCompleted(90)

;Display 'Speak to Paladin Brandis'
SetObjectiveDisplayed(103)

;Disable Companion events for the duration.
FollowersScript.SetAutonomy(Self, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Transfer the Holotags from the player to Brandis.
Actor Brandis = Alias_BoSPaladinBrandis.GetActorRef()
Actor Player = Game.GetPlayer()
ObjectReference item = Alias_BoSKnightVarhamHolotag.GetReference()
if (Player.GetItemCount(item) > 0)
     Brandis.AddItem(item)
EndIf
item = Alias_BoSKnightAstlinHolotag.GetReference()
if (Player.GetItemCount(item) > 0)
     Brandis.AddItem(item)
EndIf
item = Alias_BoSScribeFarisHolotag.GetReference()
if (Player.GetItemCount(item) > 0)
     Brandis.AddItem(item)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Brandis stands down, will no longer attack the player as readily.
Alias_BoSPaladinBrandis.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0116_Item_00
Function Fragment_Stage_0116_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Set when the player finishes out the 110 dialogue with Brandis.

;Complete 'Speak to Paladin Brandis.'
SetObjectiveCompleted(103)

;Add the player to Brandis' faction, allowing them to loot Recon Bunker Theta.
Game.GetPlayer().AddToFaction(BoSM01_BrandisFaction)

;Reenable Companion events.
FollowersScript.SetAutonomy(Self, True)

;If the player is in the Brotherhood, or if Danse is their companion, we have more to do here.
if ((BoSPlayerRank.GetValue() > 0) || GetStageDone(105))
     SetStage(150)
Else
     ;Otherwise, the quest is over (at least for now). Try to clean up.
     SetStage(147)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0119_Item_00
Function Fragment_Stage_0119_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;If Brandis agrees to rejoin before the Prydwen arrives, note it for later reference.

;Then set the usual Agree to Rejoin stage.
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Brandis agrees to rejoin the Brotherhood.

;If this happens before the Prydwen arrives, note it for later reference.
if (BoSPrydwenArrived.GetValue() > 0)
     SetStage(119)
EndIf

;Dialogue ends. Player can now report to Danse/Kells.
SetStage(116)

;Add Brandis to Brotherhood faction; this overrides Brandis' previous attack-detection.
Alias_BoSPaladinBrandis.GetActorRef().AddToFaction(BrotherhoodofSteelFaction)

;Everything else happens after Brandis unloads.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;When Brandis unloads after being recruited, disable him. The postquest uses a different actor.

;Disable Brandis.
if (!GetStageDone(140) && !GetStageDone(145))
     Alias_BoSPaladinBrandis.TryToDisable()
     BoSM01_BrandisEnableMarker.Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0139_Item_00
Function Fragment_Stage_0139_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Player hits Brandis' attack trigger.

;Stop Brandis' dialogue scenes.
BoSM01_Brandis_100A1.Stop()
BoSM01_Brandis_100B1.Stop()
BoSM01_Brandis_100C.Stop()
BoSM01_Brandis_100D.Stop()
BoSM01_Brandis_100E.Stop()

;Play his attack scene.
BoSM01_Brandis_100F.Start()

;Make Brandis hostile.
SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Set when the player attacks or otherwise damages Brandis, or through dialogue. Turns him hostile.
;This stage is turned off by 120 (Recruiting him), since he becomes part of the Brotherhood faction
;and thereafter crime against him is managed by the faction.

;Make him hostile.
BoSM01_BrandisFaction.SetEnemy(PlayerFaction)
Alias_BoSPaladinBrandis.GetActorRef().StartCombat(Game.GetPlayer())

;Complete 'Investigate the Bunker'
SetObjectiveCompleted(90)

;Hide 'Speak to Paladin Brandis'
SetObjectiveDisplayed(103, False)

;Display 'Kill Paladin Brandis'
SetObjectiveDisplayed(140)

;Reenable Companion events.
FollowersScript.SetAutonomy(Self, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
;Patrol Team Member #4 - Paladin Brandis
;Set when the player kills Brandis.

;Hide 'Speak to Paladin Brandis'
if (!IsObjectiveCompleted(103))
     SetObjectiveDisplayed(103, False)
EndIf

;Complete 'Kill Paladin Brandis'
SetObjectiveCompleted(140)

;Add the player to Brandis' faction, allowing them to loot Recon Bunker Theta.
Game.GetPlayer().AddToFaction(BoSM01_BrandisFaction)

;Reenable Companion events.
FollowersScript.SetAutonomy(Self, True)

;If in the Brotherhood, the player needs to report back to Danse/Kells.
if (BoSPlayerRank.GetValue() > 0)
     SetStage(150)
Else
     ;If not in the Brotherhood, the quest is over (at least for now). Try to clean up.
     SetStage(147)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0147_Item_00
Function Fragment_Stage_0147_Item_00()
;BEGIN CODE
;The player has completed the entire quest without joining the Brotherhood.
;Do what we can to clean this up. Leave the quest running in the background so they
;can report it to Danse or Kells if they get around to joining, or come back to persuade Brandis
;to rejoin later on.

if (!IsObjectiveCompleted(60))
     ;Follow Distress Signal Varham
     SetObjectiveDisplayed(60, False)
EndIf
if (!IsObjectiveCompleted(70))
     ;Follow Distress Signal Astlin
     SetObjectiveDisplayed(70, False)
EndIf
if (!IsObjectiveCompleted(80))
     ;Follow Distress Signal Faris
     SetObjectiveDisplayed(80, False)
EndIf

;Complete the quest.
CompleteAllObjectives()
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0148_Item_00
Function Fragment_Stage_0148_Item_00()
;BEGIN CODE
;Once the player heads outside the bunker, if Danse is their companion,
;they need to speak with him to recap the situation with Brandis.
if (IsObjectiveDisplayed(148))
     SetObjectiveCompleted(148)
     SetObjectiveDisplayed(151)
     Alias_BoSPaladinDanse.TryToEvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0149_Item_00
Function Fragment_Stage_0149_Item_00()
;BEGIN CODE
;After speaking with Danse, the player needs to report back to Kells.

;Complete 'Speak to Paladin Danse'
SetObjectiveCompleted(151)

;If the player has been kicked out of the Brotherhood, that completes the quest.
if ((BoSKickout.GetStage() > 10) || ((BoSKickoutSoft.GetStage() > 0) && (BoS202.GetStageDone(255) == 0)))
     SetStage(200)
Else
     ;Start 'Report to Captain Kells'
     SetObjectiveDisplayed(152)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Set when the player kills Brandis or leaves the 110 dialogue with him,
;and is still a member of the Brotherhood.

if ((BoSKickoutSoft.GetStage() > 0) && (BoS202.GetStageDone(255) == 0))
     ;If the player has been soft-kicked from the Brotherhood and can't turn in the quest
     ;because they never completed BoS202, cut off the quest here.
     SetStage(200)
ElseIf (BoSKickout.GetStage() > 10)
     ;If the player has been kicked from the Brotherhood, cut off the quest here.
     SetStage(200)
ElseIf (GetStageDone(105))
     ;If Danse is your companion, give the player an objective to head outside and speak to him.
     SetObjectiveDisplayed(148)
     BoSM01DanseStage150CMPCommentaryExit.Start()
     SetStage(146)
ElseIf (kMyQuest.IsDanseDialogueEnabled)
     ;If Danse is the active questgiver, give the player an objective to report to him.
     SetObjectiveDisplayed(150)
ElseIf (kMyQuest.IsKellsDialogueEnabled)
     ;If Kells is the active questgiver, give the player an objective to report to him.
     SetObjectiveDisplayed(152)
Else
     ;If no questgiver is active, we're in the BoS201-202 stalling period. Direct the player to Danse,
     ;who will eventually refer them to Kells. Best we can do.
     SetStage(24)
     SetObjectiveDisplayed(150)
EndIf

;Reenable Companion events.
FollowersScript.SetAutonomy(Self, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0154_Item_00
Function Fragment_Stage_0154_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Identify the questgiver.
Actor questgiver = None
if (kMyQuest.IsDanseDialogueEnabled)
     questgiver = Alias_BoSPaladinDanse.GetActorRef()
Else
     questgiver = Alias_BoSCaptainKells.GetActorRef()
EndIf
Actor player = Game.GetPlayer()

;Transfer the holotapes from the player to the questgiver.
player.RemoveItem(Alias_BoSKnightAstlinHolotag.GetReference(), 1, questgiver)     
player.RemoveItem(Alias_BoSPaladinBrandisHolotag.GetReference(), 1, questgiver)  
player.RemoveItem(Alias_BoSScribeFarisHolotag.GetReference(), 1, questgiver)  
player.RemoveItem(Alias_BoSKnightVarhamHolotag.GetReference(), 1, questgiver)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Identify the questgiver.
Actor questgiver = None
if (kMyQuest.IsDanseDialogueEnabled)
     questgiver = Alias_BoSPaladinDanse.GetActorRef()
Else
     questgiver = Alias_BoSCaptainKells.GetActorRef()
EndIf
Actor player = Game.GetPlayer()

;Transfer the holotapes from the player to the questgiver.
player.RemoveItem(Alias_BoSKnightAstlinHolotape.GetReference(), 1, questgiver)     
player.RemoveItem(Alias_BoSPaladinBrandisHolotape.GetReference(), 1, questgiver)  
player.RemoveItem(Alias_BoSScribeFarisHolotape.GetReference(), 1, questgiver)  
player.RemoveItem(Alias_BoSKnightVarhamHolotape.GetReference(), 1, questgiver)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN AUTOCAST TYPE bosm01questscript
Quest __temp = self as Quest
bosm01questscript kmyQuest = __temp as bosm01questscript
;END AUTOCAST
;BEGIN CODE
;Give the player the questgiver's reward.
if (kMyQuest.IsKellsDialogueEnabled)
     ;Kells gives combat armor.
     CustomItemQuest.SetStage(260)
Else
     ;Danse gives caps.
     Game.GetPlayer().AddItem(LL_Caps_Reward_Large)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Complete the objective to report in.
SetObjectiveCompleted(150)
SetObjectiveCompleted(152)

;Clean up any incomplete objectives.
if (!GetStageDone(30))
     ;Receive the quest.
     SetStage(30)
EndIf
if (!IsObjectiveCompleted(20))
     ;Report your discovery to the Brotherhood
     SetObjectiveDisplayed(20, False)
EndIf
if (!IsObjectiveCompleted(65))
     ;Optional: Report back to Paladin Danse
     SetObjectiveDisplayed(65, False)
EndIf
if (!IsObjectiveCompleted(60))
     ;Follow Distress Signal Varham
     SetObjectiveDisplayed(60, False)
EndIf
if (!IsObjectiveCompleted(70))
     ;Follow Distress Signal Astlin
     SetObjectiveDisplayed(70, False)
EndIf
if (!IsObjectiveCompleted(80))
     ;Follow Distress Signal Faris
     SetObjectiveDisplayed(80, False)
EndIf
if (!IsObjectiveCompleted(151))
     ;Speak to Paladin Danse
     SetObjectiveDisplayed(151, False)
EndIf

;Stop the Danse Overrides quest.
BoSM01DanseOverrides.Stop()

;Complete all remaining objectives and the quest.
CompleteAllObjectives()
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Move Brandis' gun back to the alias locker.
BoSAliasLocker.GetReference().AddItem(BoSPaladinBrandisGun.GetReference())

;Remove Brandis from BoSReservations so he can be cleaned up (if dead).
Alias_BoSRPaladinBrandis.Clear()

;Stop the Danse Overrides quest.
BoSM01DanseOverrides.Stop()

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property MQ102 Auto Const
Quest Property BoSEnable Auto Const
Quest property BoSKickout Auto Const 
Quest Property BoS100 Auto Const
Quest Property BoS100Fight Auto Const
Quest Property BoS101 Auto Const
Quest Property BoS200 Auto Const
Quest Property BoS201 Auto Const
Quest Property BoS202 Auto Const
Quest Property BoS302 Auto Const
Quest Property BoSM01Pointer Auto Const
Quest Property BoSM01DistressSignals Auto Const
Quest Property BoSM01Postquest Auto Const
Quest Property BoSM01DanseOverrides Auto Const

ReferenceAlias Property Alias_Companion Auto Const
ReferenceAlias Property Alias_BoSPaladinDanse Auto Const
ReferenceAlias Property Alias_BoSCaptainKells Auto Const
ReferenceAlias Property Alias_BoSKnightVarham Auto Const
ReferenceAlias Property Alias_BoSKnightAstlin Auto Const
ReferenceAlias Property Alias_BoSScribeFaris Auto Const
ReferenceAlias Property Alias_BoSPaladinBrandis Auto Const
ReferenceAlias Property Alias_BoSRPaladinBrandis Auto Const

ReferenceAlias Property Alias_BoSKnightVarhamHolotag Auto Const
ReferenceAlias Property Alias_BoSKnightAstlinHolotag Auto Const
ReferenceAlias Property Alias_BoSScribeFarisHolotag Auto Const
ReferenceAlias Property Alias_BoSPaladinBrandisHolotag Auto Const

ReferenceAlias Property Alias_BoSKnightVarhamHolotape Auto Const
ReferenceAlias Property Alias_BoSKnightAstlinHolotape Auto Const
ReferenceAlias Property Alias_BoSScribeFarisHolotape Auto Const
ReferenceAlias Property Alias_BoSPaladinBrandisHolotape Auto Const

GlobalVariable Property BoSTraining Auto Const
GlobalVariable Property BoSJoined Auto Const
GlobalVariable Property BoSPlayerRank Auto Const
GlobalVariable Property BoSPrydwenArrived Auto Const
GlobalVariable Property BoSKellsIntroDone Auto Const
GlobalVariable Property PlayerKnowsBoSDistressPulsers Auto Const

Faction Property PlayerFaction Auto Const
Faction Property BrotherhoodofSteelFaction Auto Const
Faction Property BoSM01_BrandisFaction Auto Const

Scene Property BoSM01DanseStage050CMPCommentary1 Auto Const
Scene Property BoSM01DanseStage050CMPCommentary2 Auto Const
Scene Property BoSM01DanseStage060CMPCommentary1 Auto Const
Scene Property BoSM01DanseStage060CMPCommentary2 Auto Const
Scene Property BoSM01DanseStage070CMPCommentary1 Auto Const
Scene Property BoSM01DanseStage070CMPCommentary2 Auto Const
Scene Property BoSM01DanseStage080CMPCommentary1 Auto Const
Scene Property BoSM01DanseStage080CMPCommentary2 Auto Const
Scene Property BoSM01DanseStage090CMPCommentary1 Auto Const
Scene Property BoSM01DanseStage100CMPCommentary1 Auto Const
Scene Property BoSM01DanseStage150CMPFinalReport0 Auto Const
Scene Property BoSM01DanseStage060CMPCommentary1b Auto Const
Scene Property BoSM01DanseStage070CMPCommentary1b Auto Const
Scene Property BoSM01DanseStage080CMPCommentary1b Auto Const
Scene Property BoSM01DanseStage090CMPCommentary1b Auto Const
Scene Property BoSM01DanseStage150CMPCommentaryExit Auto Const

Scene Property BoSM01_CompanionStage060_Commentary1 Auto Const
Scene Property BoSM01_CompanionStage070_Commentary1 Auto Const
Scene Property BoSM01_CompanionStage080_Commentary1 Auto Const

Scene Property BoSM01_Brandis_100A1 Auto Const
Scene Property BoSM01_Brandis_100B1 Auto Const
Scene Property BoSM01_Brandis_100C Auto Const
Scene Property BoSM01_Brandis_100D Auto Const
Scene Property BoSM01_Brandis_100E Auto Const
Scene Property BoSM01_Brandis_100F Auto Const

ObjectReference Property BoSMQuickstartMarker Auto Const
ObjectReference Property BoSM01_WarpVarham Auto Const
ObjectReference Property BoSM01_WarpAstlin Auto Const
ObjectReference Property BoSM01_WarpFaris Auto Const
ObjectReference Property BoSM01_WarpBrandis Auto Const
ObjectReference Property BoSM01_WarpPrydwen Auto Const
ObjectReference Property BoSM01_WarpPoliceStation Auto Const

ObjectReference Property NationalGuardTrainingYardMapMarkerRef Auto Const
ObjectReference Property RevereSatelliteArrayMapMarkerRef Auto Const
ObjectReference Property ReconBunkerThetaMapMarkerRef Auto Const

ObjectReference Property BoSM01_CMPDanseWaitMarker Auto Const
ObjectReference Property BoSM01_BrandisEnableMarker Auto Const


LeveledItem Property LL_Caps_Reward_Large Auto Const
LeveledItem Property BoSM01_KellsRewardArmorKnight Auto Const
LeveledItem Property BoSM01_KellsRewardArmorPaladin Auto Const
LeveledItem Property BoSM01_KellsRewardArmorSentinel Auto Const

ObjectReference Property BoSM01TerminalRef Auto Const
ObjectReference Property BoSM01TerminalRef_NoKey Auto Const
Key Property BoSM01_ReconBunkerThetaPassword Auto Const

Scene Property BoS200_01_ReturnScene Auto Const

Scene Property BoS200_02_PromotionScene Auto Const

Quest Property BoSM00 Auto Const

ReferenceAlias Property BoSPaladinBrandisGun Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

ReferenceAlias Property Alias_BoSPaladinBrandisGun Auto Const

ReferenceAlias Property BoSAliasLocker Auto Const

ObjectReference Property BoSM01_Bunker_BrandisMarker Auto Const Mandatory

Scene Property BoSM01_DanseStage018CMP_Commentary Auto Const Mandatory

Quest Property BoSKickOutSoft Auto Const Mandatory
