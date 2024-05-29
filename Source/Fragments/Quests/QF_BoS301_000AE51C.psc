;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS301_000AE51C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
BoSLiSlain.SetValue(1)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramStarts)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
(Alias_BoS301AirportWorkshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
BoSIngramIntroDone.SetValue(1)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramWorkingStartMarker)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(BoS301Start)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramStarts)
Alias_BoS301Li.GetActorRef().MoveTo(BoSDoctorLiPrydwenMarker)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
(Alias_BoS301AirportWorkshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
BoSIngramIntroDone.SetValue(1)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramWorkingStartMarker)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(BoS301Start)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramStarts)
Alias_BoS301Li.GetActorRef().MoveTo(BoSDoctorLiPrydwenMarker)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
(Alias_BoS301AirportWorkshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
BoSIngramIntroDone.SetValue(1)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramWorkingStartMarker)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(BoS301Start)
SetStage(10)
SetStage(20)
BoS301IngramStage0020.Stop()
SetStage(30)
SetStage(70)
SetStage(75)
SetStage(86)
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE bos301script
Quest __temp = self as Quest
bos301script kmyQuest = __temp as bos301script
;END AUTOCAST
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramStarts)
Alias_BoS301Li.GetActorRef().MoveTo(BoSDoctorLiPrydwenMarker)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
(Alias_BoS301AirportWorkshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
BoSIngramIntroDone.SetValue(1)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramWorkingStartMarker)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(BoS301Start)
SetStage(10)
SetStage(20)
BoS301IngramStage0020.Stop()
SetStage(30)
SetStage(70)
SetStage(75)
SetStage(86)
SetStage(90)
SetStage(95)
SetStage(100)
kmyQuest.bAllObjectivesComplete = 1
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramStarts)
Alias_BoS301Li.GetActorRef().MoveTo(BoSDoctorLiPrydwenMarker)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
(Alias_BoS301AirportWorkshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
BoSIngramIntroDone.SetValue(1)
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramWorkingStartMarker)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(BoS301Start)
SetStage(10)
SetStage(20)
BoS301IngramStage0020.Stop()
SetStage(30)
SetStage(70)
SetStage(75)
SetStage(86)
SetStage(90)
SetStage(95)
SetStage(100)
SetStage(120)
SetStage(140)
SetStage(155)
SetStage(160)
SetStage(170)
SetStage(176)
SetStage(180)
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()

;Scara Maintenance if Li is dead
if BoSLiSlain.GetValue() == 1
if BoS301ScaraSetupDone.GetValue() == 0
Alias_BoS301Scara.GetActorRef().Disable()
Alias_BoS301Scara.GetActorRef().Moveto(BoS301ScaraGACMarker)
Alias_BoS301Scara.GetActorRef().RemoveFromFaction(SettlementDiamondCity)
Alias_BoS301Scara.GetActorRef().RemoveFromFaction(CrimeDiamondCity)
Alias_BoS301Scara.GetActorRef().AddToFaction(BrotherhoodofSteelFaction)
Alias_BoS301Scara.GetActorRef().SetCrimeFaction(BrotherhoodofSteelFaction)
Alias_BoS301Scara.GetActorRef().EvaluatePackage()
BoS301ScaraSetupDone.SetValue(1)
endif
endif

;Dr Li Maintenance if she's alive
if BoSLiSlain.GetValue() == 0
if BoS301LiSetupDone.GetValue() == 0
BoS301InstMadisonLi.Clear()
Alias_BoS301Li.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_BoS301Li.GetActorRef().RemoveFromFaction(CrimeInstitute)
Alias_BoS301Li.GetActorRef().AddToFaction(BrotherhoodofSteelFaction)
Alias_BoS301Li.GetActorRef().SetCrimeFaction(BrotherhoodofSteelFaction)
Alias_BoS301Li.GetActorRef().MoveTo(BoSDoctorLiPrydwenMarker)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
BoS301LiSetupDone.SetValue(1)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
BoSPScribeEnabler.Enable()
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
SetObjectiveDisplayed(20,1)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
BoS301IngramStage0020.Start()

;Scara Maintenance if Li is dead
if BoSLiSlain.GetValue() == 1
if BoS301ScaraSetupDone.GetValue() == 0
Alias_BoS301Scara.GetActorRef().Disable()
Alias_BoS301Scara.GetActorRef().Moveto(BoS301ScaraGACMarker)
Alias_BoS301Scara.GetActorRef().RemoveFromFaction(SettlementDiamondCity)
Alias_BoS301Scara.GetActorRef().RemoveFromFaction(CrimeDiamondCity)
Alias_BoS301Scara.GetActorRef().AddToFaction(BrotherhoodofSteelFaction)
Alias_BoS301Scara.GetActorRef().SetCrimeFaction(BrotherhoodofSteelFaction)
Alias_BoS301Scara.GetActorRef().EvaluatePackage()
BoS301ScaraSetupDone.SetValue(1)
endif
endif

;Disable Long Wharf Encounter
Waterfront_LongWharfSupermutantEnableMarker.Disable()

;Dr Li Maintenance if she's alive
if BoSLiSlain.GetValue() == 0
if BoS301LiSetupDone.GetValue() == 0
BoS301InstMadisonLi.Clear()
Alias_BoS301Li.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_BoS301Li.GetActorRef().RemoveFromFaction(CrimeInstitute)
Alias_BoS301Li.GetActorRef().AddToFaction(BrotherhoodofSteelFaction)
Alias_BoS301Li.GetActorRef().SetCrimeFaction(BrotherhoodofSteelFaction)
Alias_BoS301Li.GetActorRef().MoveTo(BoSDoctorLiPrydwenMarker)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
BoS301LiSetupDone.SetValue(1)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()

;Resume Forcegreet for Companions
CA_DisallowCompanionForcegreet.SetValue(0)

;Backup Scribe Enable
BoSPScribeEnabler.Enable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS301BuildPrimeBeginsAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Resume Forcegreet for Companions
CA_DisallowCompanionForcegreet.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
Game.GetPlayer().AddItem(Alias_BoS301FusionAdapter.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
Alias_BoS301Scara.GetActorRef().Enable()
Alias_BoS301Scara.GetActorRef().EvaluatePackage()

;General Atomics - Disable a robot that would otherwise be in Scara's room.
DN049_LvlMrHandy_Bowling_StrikeRef.Disable()
if ((DN049.IsRunning()) && (!DN049.GetStageDone(750)))
     DN049_BowlingAttendants.RemoveRef(DN049_LvlMrHandy_Bowling_StrikeRef)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0076_Item_00
Function Fragment_Stage_0076_Item_00()
;BEGIN CODE
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Alias_BoS301Scara.GetActorRef().MoveTo(BoS301ScaraGantryMarker)
Alias_BoS301Scara.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0086_Item_00
Function Fragment_Stage_0086_Item_00()
;BEGIN CODE
Alias_BoS301Li.GetActorRef().MoveTo(BoS301ScaraGantryMarker)
Alias_BoS301Li.GetActorRef().SetOutfit(BoSDoctorLiOutfit)
Alias_BoS301Li.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;If Player did the reprogramming
if IsObjectiveDisplayed(60) == 1
SetObjectiveCompleted(60,1)
endif
if IsObjectiveDisplayed(70) == 1
SetObjectiveCompleted(70,1)
endif
if IsObjectiveDisplayed(80) == 1
SetObjectiveCompleted(80,1)
endif
SetObjectiveDisplayed(90,1)



;BoSM04 - Allow BoSM04 to start if its conditions have been met.
if (BoSM02.IsCompleted())
     BoSM04.SetStage(10)
EndIf

;Airport Setup Stuff
Alias_BoS301Ingram.GetActorRef().MoveTo(BoS301IngramGantryMarker)
Alias_BoS301Ingram.GetActorRef().EvaluatePackage()
BoSEnable.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(95,1)

;Add stockpile to workshop at airport
Alias_BoS301AirportWorkshop.GetRef().AddItem(BoS301ActuatorItems)

;Check if Player already has a magnet
if Game.GetPlayer().GetItemCount(HighPoweredMagnet) >= 1
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE bos301script
Quest __temp = self as Quest
bos301script kmyQuest = __temp as bos301script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(95,1)
SetObjectiveDisplayed(100,1)
kmyQuest.RegisterForWorkshopEvents()

;Add more High-Powered Magnets to Workshop and Supply Depot
Alias_BoS301AirportWorkshop.GetRef().AddItem(HighPoweredMagnet,4)
BoS301MagnetEnabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE bos301script
Quest __temp = self as Quest
bos301script kmyQuest = __temp as bos301script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(120,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE bos301script
Quest __temp = self as Quest
bos301script kmyQuest = __temp as bos301script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(120,1)
SetObjectiveDisplayed(140,1)
BoS301RemotePostEnabler.Enable()
Alias_BoS301Haylen.GetActorRef().MoveTo(BoS301HaylenPackageMarker)
Alias_BoS301Haylen.GetActorRef().EvaluatePackage()
BoS301WaypointMMRef.AddToMap()

; disable/delete the actuators
kmyQuest.DisableActuators()

; don't care about workshop events anymore
kmyQuest.RegisterForWorkshopEvents(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_BoS301DistressPulser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140,1)
SetObjectiveDisplayed(150,1)
DN166QuestEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150,1)
SetObjectiveDisplayed(170,1)

;DN130 - Cambridge PD
;Clean up the police station following the interrogation.
DN130.SetStage(75)

BoSEnable.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0176_Item_00
Function Fragment_Stage_0176_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_BoS301Password.GetRef())
Alias_BoS301ChildofAtom.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0177_Item_00
Function Fragment_Stage_0177_Item_00()
;BEGIN CODE
;Hold until player makes a decision
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0178_Item_00
Function Fragment_Stage_0178_Item_00()
;BEGIN CODE
;Make Child of Atom Hostile
DN166AtomFaction.SetEnemy(PlayerFaction)
Alias_BoS301ChildofAtom.GetActorRef().StartCombat(Game.GetPlayer())
Alias_BoS301BossTurret.GetActorRef().StartCombat(Game.GetPlayer())
Alias_BoS301BossRobot.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0179_Item_00
Function Fragment_Stage_0179_Item_00()
;BEGIN CODE
;Child of Atom was killed on screen by the Player
if BoS301CleanupHenri.GetValue() == 0
Alias_BoS301ChildofAtom.GetActorRef().AddItem(Alias_BoS301Password.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170,1)
SetObjectiveDisplayed(180,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180,1)
Game.GetPlayer().RemoveItem(Alias_BoS301DistressPulser.GetRef())
BoSM01DistressSignals.Start()
pBoS301SPPlacedRef.Enable()
BoS301PulserTriggerRef.Disable()
BoS301TransmitterRef.Enable()

;Companion Danse Handler

if Alias_BoS301Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 0
Alias_BoS301Danse.GetActorRef().Disable() ;Disable in Prep for BoS302
Alias_BoS301Danse.GetActorRef().DisallowCompanion(true)
WorkshopParent.UnassignActor((Alias_BoS301Danse.GetRef() as WorkshopNPCScript),true)
SetStage(195)
elseif Alias_BoS301Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 1 && Alias_BoS301Danse.GetActorRef().IsInLocation(SentinelSiteLocation) == 0
Alias_BoS301Danse.GetActorRef().Disable() ;Disable in Prep for BoS302
Alias_BoS301Danse.GetActorRef().DisallowCompanion(true)
WorkshopParent.UnassignActor((Alias_BoS301Danse.GetRef() as WorkshopNPCScript),true)
SetStage(195)
elseif Alias_BoS301Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 1 && Alias_BoS301Danse.GetActorRef().IsInLocation(SentinelSiteLocation) == 1
Alias_BoS301Danse.GetActorRef().DisallowCompanion(true)
WorkshopParent.UnassignActor((Alias_BoS301Danse.GetRef() as WorkshopNPCScript),true)
SetObjectiveDisplayed(190,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
;Player Talked to Active Companion Danse - Dismiss Him
if Alias_BoS301Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 1
Alias_BoS301Danse.GetActorRef().DisallowCompanion(true)
WorkshopParent.UnassignActor((Alias_BoS301Danse.GetRef() as WorkshopNPCScript),true)
endif

;Objective Maintenance
if IsObjectiveDisplayed(180) == 1
SetObjectiveCompleted(180,1)
endif
if IsObjectiveDisplayed(190) == 1
SetObjectiveCompleted(190,1)
endif
SetObjectiveDisplayed(195,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(195,1)
SetObjectiveDisplayed(200,1)

Alias_BoS301Ingram.GetActorRef().EvaluatePackage()

;Return Haylen
Alias_BoS301Haylen.GetActorRef().MoveTo(BoS301HaylenReturnsMarker)
Alias_BoS301Haylen.GetActorRef().EvaluatePackage()

;Cleanup the Bomb Base
if GetStageDone(179) == 0
BoS301CleanupHenri.SetValue(1)
DN166BOSKilledBecquerelEnableMarker.Enable()
Alias_BoS301ChildofAtom.GetActorRef().MoveTo(DN166BossCorpseMarkerRef)
Alias_BoS301ChildofAtom.GetActorRef().Kill()
Alias_BoS301BossTurret.GetActorRef().Kill()
Alias_BoS301BossRobot.GetActorRef().Kill()
endif

;Disable Danse in Prep for BoS302 if he isn't already disabled
if Alias_BoS301Danse.GetActorRef().IsDisabled() == 0
Alias_BoS301Danse.GetActorRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
;Startup Prime (Button on Tarmac)
BoS301_12_LibertyPrimeStage200.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200,1)
SetObjectiveDisplayed(210,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210,1)

;Update Global for Radio News
RadioDCBoS301Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Enable Long Wharf Encounter
Waterfront_LongWharfSupermutantEnableMarker.Enable()

BoS302.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS301Ingram Auto Const

ReferenceAlias Property Alias_BoS301Scara Auto Const

ReferenceAlias Property Alias_BoS301Li Auto Const

ObjectReference Property BoS301ScaraGACMarker Auto Const

ObjectReference Property BoS301IngramStarts Auto Const

ObjectReference Property BoS301ScaraTerminalRef Auto Const

GlobalVariable Property BoS301ActuatorsBuilt Auto Const

GlobalVariable Property BoS301ActuatorsTotal Auto Const

ObjectReference Property BoS301ChildofAtomRef Auto Const

ObjectReference Property BoS301ScaraGantryMarker Auto Const

ObjectReference Property BoS301LiGantryMarker Auto Const

ObjectReference Property BoSDoctorLiPrydwenMarker Auto Const

Scene Property BoS301IngramStage0020 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoS101 Auto Const

ObjectReference Property DN049_GeneralAtomicsOutletStoreInnerDoor Auto Const

Quest Property DN130 Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ReferenceAlias Property Alias_BoS301AirportWorkshop Auto Const

Quest Property BoS203 Auto Const

Quest Property BoS302 Auto Const

ObjectReference Property DN166QuestEnableMarker Auto Const

ReferenceAlias Property Alias_BoS301Password Auto Const

ReferenceAlias Property Alias_BoS301DistressPulser Auto Const

ReferenceAlias Property Alias_BoS301ChildofAtom Auto Const

ObjectReference Property DN166BOSKilledBecquerelEnableMarker Auto Const

ObjectReference Property DN166BossCorpseMarkerRef Auto Const

ReferenceAlias Property Alias_BoS301BossTurret Auto Const

ReferenceAlias Property Alias_BoS301BossRobot Auto Const

Faction Property DN166AtomFaction Auto Const

Faction Property PlayerFaction Auto Const

Quest Property BoSM02 Auto Const

Quest Property BoSM04 Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS301Ready Auto Const

Quest Property BoSEnable Auto Const

Scene Property BoS301_12_LibertyPrimeStage200 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoSPoliceStation Auto Const

ObjectReference Property BoS301RemotePostEnabler Auto Const

ObjectReference Property BoS301HaylenPackageMarker Auto Const

ReferenceAlias Property Alias_BoS301Haylen Auto Const

ObjectReference Property BoS301PulserTriggerRef Auto Const

ObjectReference Property pBoS301SPPlacedRef Auto Const

ObjectReference Property BoS301TransmitterRef Auto Const

Quest Property BoSM01DistressSignals Auto Const

Quest Property BoSDialoguePrydwen Auto Const

ReferenceAlias Property BoS301InstMadisonLi Auto Const

GlobalVariable Property BoSLiSlain Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property BoS301WaypointMMRef Auto Const

ObjectReference Property BoS301Start Auto Const

GlobalVariable Property BoSIngramIntroDone Auto Const

ObjectReference Property BoSDoors Auto Const

GlobalVariable Property BoS301LiSetupDone Auto Const

GlobalVariable Property BoS301ScaraSetupDone Auto Const

ObjectReference Property BoSPScribeEnabler Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ReferenceAlias Property Alias_BoS301Danse Auto Const

Faction Property CurrentCompanionFaction Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Quest Property COMDanse Auto Const

MiscObject Property BoS301FusionAdapter Auto Const

ObjectReference Property DN049_LvlMrHandy_Bowling_StrikeRef Auto Const

Quest Property DN049 Auto Const

RefCollectionAlias Property DN049_BowlingAttendants Auto Const

ObjectReference Property BoS301IngramWorkingStartMarker Auto Const

ObjectReference Property BoS301IngramGantryMarker Auto Const

MiscObject Property HighPoweredMagnet Auto Const

LeveledItem Property BoS301ActuatorItems Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS202LinkMQ Auto Const

ObjectReference Property BoSLibertyPrimeStaticRefLights Auto Const

Outfit Property BoSDoctorLiOutfit Auto Const

GlobalVariable Property BoS301CleanupHenri Auto Const

Location Property SentinelSiteLocation Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

ReferenceAlias Property Alias_BoS301FusionAdapter Auto Const Mandatory

Faction Property CrimeInstitute Auto Const

Faction Property CrimeDiamondCity Auto Const

Faction Property SettlementDiamondCity Auto Const

ActorValue Property COMQC_BoS301BuildPrimeBeginsAV Auto Const

GlobalVariable Property CA_DisallowCompanionForcegreet Auto Const

ObjectReference Property DNPrime_EnableMarkerEncounters01 Auto Const

ObjectReference Property Waterfront_LongWharfSupermutantEnableMarker Auto Const

ObjectReference Property BoS301HaylenReturnsMarker Auto Const

ObjectReference Property BoS301MagnetEnabler Auto Const
