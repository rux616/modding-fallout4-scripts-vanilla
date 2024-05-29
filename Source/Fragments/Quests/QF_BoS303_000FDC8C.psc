;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS303_000FDC8C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(30)
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
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)
BoS304.Stop()
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
Alias_BoS303Ingram.GetActorRef().MoveTo(BoSIngramCounterMarker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS303LibertyPrime.getActorReference().setrestrained(false)
Alias_BoS303LibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
BoSLibertyPrimeStaticREF.enable()

Game.GetPlayer().MoveTo(BoS303QSMarker)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(30)
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
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS303LibertyPrime.getActorReference().setrestrained(false)
Alias_BoS303LibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
BoSLibertyPrimeStaticREF.enable()

BoS304.Stop()
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
DN084.SetStage(11)
BoS303IngramGoing.SetValue(1)
SetStage(15)
SetStage(20)
SetStage(30)
SetStage(35)
SetStage(40)
Game.GetPlayer().MoveTo(DN084_BoS303QuickstartMarker)
DN84_QuestCompanionAlias.ForceRefTo(Alias_BoS303Ingram.GetActorRef())
Alias_BoS303Ingram.GetActorRef().MoveTo(DN084_BoS303CompanionQuickstartMarker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
BoS100Fight.SetStage(1)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(30)
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
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS303LibertyPrime.getActorReference().setrestrained(false)
Alias_BoS303LibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
BoSLibertyPrimeStaticREF.enable()

BoS304.Stop()
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
DN084.SetStage(3)
BoS303IngramGoing.SetValue(1)
;Edit Steve - This was SetStage(160), but that didn't make sense here, so changing stages...
SetStage(15)
SetStage(20)
SetStage(30)
SetStage(35)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
Alias_BoS303Ingram.GetActorRef().MoveTo(BoS303TempNPC01Marker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
BoS100Fight.SetStage(1)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(30)
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
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS303LibertyPrime.getActorReference().setrestrained(false)
Alias_BoS303LibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
BoSLibertyPrimeStaticREF.enable()

BoS304.Stop()
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
DN084.SetStage(11)
BoS303IngramGoing.SetValue(1)
SetStage(15)
SetStage(20)
Alias_BoS303Ingram.GetActorRef().MoveTo(BoSPrydwenPilotMarker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(BoS303Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)

;Ghosting Everyone
Alias_BoS303Vertibird.GetActorRef().SetGhost()
Alias_BoS303VertibirdPilot.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set Global saying Ingram is going
BoS303IngramGoing.SetValue(1)
Alias_BoS303Ingram.GetActorRef().SetPlayerTeammate(true, false, true)
Alias_BoS303Ingram.GetActorRef().IgnoreFriendlyHits()
Ingram.SetEssential(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)

;If player is in Institute Faction but Inst303 isn't running, start it up and pop OR objective

if Game.GetPlayer().IsInFaction(InstituteFaction)==1
if InstMassFusion.IsRunning() == 0

InstMassFusion.Start()
SetObjectiveDisplayed(30,1)
endif
endif
;Get the NPC Moving
if BoS303IngramGoing.GetValue() == 1
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()
endif

;Start Vertibird Scene
Alias_BoS303Vertibird.GetActorRef().SetGhost()
Alias_BoS303VertibirdPilot.GetActorRef().SetGhost()
Alias_BoS303VertibirdPilot.TryToEnable()
BoS303VertibirdScene.Start()
Alias_BoS303Vertibird.GetReference().BlockActivation(true, false)

;If NPC isn't going - Set Stage 25 for Vbird Takeoff
if BoS303IngramGoing.GetValue() == 0
SetStage(25)
endif

;Weather Transition
CommonwealthClear.SetActive(false,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)

;If player is in Institute Faction but Inst303 isn't running, start it up and pop OR objective

if Game.GetPlayer().IsInFaction(InstituteFaction)==1
if InstMassFusion.IsRunning() == 0

InstMassFusion.Start()
SetObjectiveDisplayed(30,1)
endif
endif
;Get the NPC Moving
if BoS303IngramGoing.GetValue() == 1
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()
endif

;Start Vertibird Scene
Alias_BoS303VertibirdPilot.TryToEnable()
BoS303VertibirdScene.Start()
Alias_BoS303Vertibird.GetReference().BlockActivation(true, false)

;If NPC isn't going - Set Stage 25 for Vbird Takeoff
if BoS303IngramGoing.GetValue() == 0
SetStage(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Place NPC in Companion Alias and Set BoS Stage on DN084
DN084.SetStage(11)
if BoS303IngramGoing.GetValue() == 1
DN84_QuestCompanionAlias.ForceRefTo(Alias_BoS303Ingram.GetActorRef())
endif

;Check if Player went to Inst to turn in OR objective
if IsObjectiveDisplayed(30) == 1
SetObjectiveDisplayed(30,0)
endif

;Check if Speak to Ingram is still active
If IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif

;Ghosting Ingram
Alias_BoS303Vertibird.GetActorRef().SetGhost()
Alias_BoS303VertibirdPilot.GetActorRef().SetGhost()
Alias_BoS303Ingram.GetActorRef().SetGhost()

;Handle Inst Kickout
If InstMassfusion.IsObjectiveDisplayed(20)
InstMassFusion.SetObjectiveDisplayed(20,0)
endif
if InstMassFusion.IsObjectiveDisplayed(30)
InstMassFusion.SetObjectiveCompleted(30)
endif

if Game.GetPlayer().IsInFaction(InstituteFaction)==1
InstKickout.Start()
elseif Game.GetPlayer().IsInFaction(InstituteFaction)==0
InstituteFaction.SetPlayerEnemy()
InstituteFaction.SetEnemy(PlayerFaction)
endif

;Disable Long Wharf Encounter
DNPrime_EnableMarkerEncounters01.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Play Roof Touchdown Scene
setObjectiveCompleted(40,1)
setObjectiveDisplayed(50,1)
Utility.Wait(3)
BoS303_03_Roof.Start()
Alias_BoS303Ingram.GetActorRef().SetGhost(false)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS303GettingAgitatorAV)

;Re-enable Long Wharf Encounter
DNPrime_EnableMarkerEncounters01.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;NPC Flavor Comment or Player Comment
if BoS303IngramGoing.GetValue() == 1
BoS303_04_MissingAgitator.Start()
elseif BoS303IngramGoing.GetValue() == 0
BoS303_04_MissingAgitatorPlayer.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Terminal in Lab Points at KeyCard unless Player Has it Already
if DN084.GetStageDone(120) == 0
setObjectiveCompleted(50,1)
setObjectiveDisplayed(70,1)
elseif DN084.GetStageDone(120) == 1
setObjectiveCompleted(50,1)
setObjectiveDisplayed(80,1)
endif

;UnGhost Everyone
Alias_BoS303Vertibird.GetActorRef().SetGhost(false)
Alias_BoS303VertibirdPilot.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Player has KeyCard
BoS303_Z02_KeyCard.Start()
if IsObjectiveDisplayed(70) == 1
setObjectiveCompleted(70,1)
endif
if GetStageDone(60) == 1
setObjectiveDisplayed(80,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Synths attack from across atrium during Elevator Descent
BoS303_06_ElevatorCombat.Start()

;Disable Vertibird
Alias_BoS303Vertibird.GetActorRef().Disable()
Alias_BoS303VertibirdPilot.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Power Fails during Elevator Descent
BoS303_07_PowerLoss.Start()
SetObjectiveDisplayed(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
BoS303_08_PowerRestored.Start()
SetObjectiveCompleted(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Player elected to use Dropdown rather than fix power
if IsObjectiveDisplayed(90) == 1
SetObjectiveDisplayed(90,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Player is close enough to see reactor
BoS303_09_ViewReactor.Start()

if IsObjectiveCompleted(90) == 0
SetObjectiveDisplayed(90,0)
endif

If IsObjectiveCompleted(50) == 0
SetObjectiveCompleted(50)
endif

setObjectiveCompleted(80,1)
setObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
setObjectiveCompleted(100,1)
setObjectiveDisplayed(110,1)
BoS303_12_AfterEnteringChamber.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
;If the Player tries to take the Agitator before using the unlock
;SetObjectiveDisplayed(110,1)
if BoS303IngramGoing.GetValue() == 1
BoS303_Z04_Interlocks.Start()
elseif BoS303IngramGoing.GetValue() == 0
BoS303_Z04_InterlocksPlayer.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;Player has used the Interlock button
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Agitator is in Player's hands
setObjectiveCompleted(120,1)

;Resolution Handler for pre-hacking the security or not
;Alarm Trips
if DN084.GetStageDone(320) == 0
BoS303_13_ReactorAlarmTripped.Start()
setObjectiveDisplayed(130,1)
;Alarm Didn't Trip
elseif DN084.GetStageDone(320) == 1
BoS303_13_ReactorAlarmNotTripped.Start()
SetStage(160)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
;Player either defeated the security or had pre-hacked it
if IsObjectiveDisplayed(130) == 1
SetObjectiveCompleted(130,1)
endif
SetObjectiveDisplayed(140,1)

;enable Institute interrupt for radio
RadioDCInstBroadcast.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
;During the elevator ride to the lobby - explosion plays - optional Lobby objective assigned
BoS303_14_ElevatorToLobby.Start()
SetObjectiveDisplayed(150,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
;This is to switch the following NPC to their own packages
Alias_BoS303Ingram.GetActorRef().SetPlayerTeammate(false, false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;NPC Follower will stop following in Lobby
;Player has left Mass Fusion and is in the street
SetObjectiveCompleted(140,1)
SetObjectiveDisplayed(160,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;Optional Lobby fight was resolved
SetObjectiveCompleted(150,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Player has traveled to the Airport - Waiting for Change Loc Call here
;Note that Ingram should be down at the switch, so she can be in final scene

;NPC Movement Handler
Alias_BoS303Ingram.GetActorRef().MoveTo(BoS303IngramFinalMarker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()

;Shut Down Optional Lobby fight if it's still open
if IsObjectiveCompleted(150) == 0
SetObjectiveDisplayed(150,0)
endif

SetObjectiveCompleted(160,1)
SetObjectiveDisplayed(170,1)

;Shut down the dungeon quest.
DN084.SetStage(500)

;Ingram Restore
Alias_BoS303Ingram.GetActorRef().IgnoreFriendlyHits(false)
Ingram.SetEssential(false)
Ingram.SetProtected(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Player has traveled to the Airport - Waiting for Change Loc Call here
;Note that Ingram should be down at the switch, so she can be in final scene

;NPC Movement Handler
Alias_BoS303Ingram.GetActorRef().MoveTo(BoS303IngramFinalMarker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()

;Shut Down Optional Lobby fight if it's still open
if IsObjectiveCompleted(150) == 0
SetObjectiveDisplayed(150,0)
endif

SetObjectiveCompleted(160,1)
SetObjectiveDisplayed(170,1)

;Shut down the dungeon quest.
DN084.SetStage(500)

;Ingram Restore
Alias_BoS303Ingram.GetActorRef().IgnoreFriendlyHits(false)
Ingram.SetEssential(false)
Ingram.SetProtected(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Player has traveled to the Airport - Waiting for Change Loc Call here
;Note that Ingram should be down at the switch, so she can be in final scene

;NPC Movement Handler
Alias_BoS303Ingram.GetActorRef().MoveTo(BoS303IngramFinalMarker)
Alias_BoS303Ingram.GetActorRef().EvaluatePackage()

;Shut Down Optional Lobby fight if it's still open
if IsObjectiveCompleted(150) == 0
SetObjectiveDisplayed(150,0)
endif

SetObjectiveCompleted(160,1)
SetObjectiveDisplayed(170,1)

;Shut down the dungeon quest.
DN084.SetStage(500)

;Ingram Restore
Alias_BoS303Ingram.GetActorRef().IgnoreFriendlyHits(false)
Ingram.SetEssential(false)
Ingram.SetProtected(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;Ingram takes Agitator for questlines where we don't go right into MQ302 from here
Game.GetPlayer().RemoveItem(Alias_BoS303BerylliumAgitator.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Make sure to check for Minutemen MQ advance at end (since we don't do it while this quest is running)
MinutemenCentralQuest.CheckForMQAdvance()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;BoS302B is not done so Player should proceed to next logical quest in BoS Chain

;Update Global for Radio News
RadioDCBoS303Ready.SetValue((GameDaysPassed.GetValue() + 1))

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_01
Function Fragment_Stage_0255_Item_01()
;BEGIN CODE
CompleteAllObjectives()
BoS304.SetStage(10)

;Update Global for Radio News
RadioDCBoS303Ready.SetValue((GameDaysPassed.GetValue() + 1))

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Force Dismount Player if he's on board
Actor Player = Game.GetPlayer()
if Alias_BoS303Vertibird.GetActorRef().IsBeingRiddenBy(Player)
Player.Dismount()
endif

Alias_BoS303Vertibird.GetActorRef().SetGhost(false)
Alias_BoS303VertibirdPilot.GetActorRef().SetGhost(false)

;Clear Ingram's Teammate Status
Alias_BoS303Ingram.GetActorRef().SetPlayerTeammate(false)
Alias_BoS303Ingram.GetActorRef().IgnoreFriendlyHits(false)
Ingram.SetEssential(false)
Ingram.SetProtected(true)

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoS303QSMarker Auto Const

ReferenceAlias Property Alias_BoS303Ingram Auto Const

ReferenceAlias Property Alias_BoS303Filmore Auto Const

ObjectReference Property BoSIngramCounterMarker Auto Const

GlobalVariable Property BoS303BPath Auto Const

GlobalVariable Property BoS303IPath Auto Const

ObjectReference Property DN084_BoS303QuickstartMarker Auto Const

ObjectReference Property BoS303TempNPC01Marker Auto Const

Quest Property BoS302 Auto Const

ObjectReference Property BoS303TempNPC02Marker Auto Const

ObjectReference Property BoS303TempNPC03Marker Auto Const

Scene Property BoS303SceneStage240 Auto Const

ObjectReference Property BoS303TempNPC04Marker Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property DN084 Auto Const

ObjectReference Property BoS303TempFlightConsole Auto Const

ObjectReference Property BoS303TempLibertyPrime Auto Const

ObjectReference Property BoS303AllieFilmoreHoldAtInstituteMarker Auto Const

ObjectReference Property BoS303PlayerStartInstitute Auto Const

ObjectReference Property DN084_Inst303QuickstartMarker Auto Const

Quest Property Inst303 Auto Const

GlobalVariable Property BoS303IngramGoing Auto Const

ReferenceAlias Property DN84_QuestCompanionAlias Auto Const

ReferenceAlias Property Alias_BoS303VertibirdPilot Auto Const

Scene Property BoS303VertibirdScene Auto Const

Quest Property InstMassFusion Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoSPoliceStation Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS101 Auto Const

ObjectReference Property DN084_BoS303CompanionQuickstartMarker Auto Const

Scene Property BoS303_03_Roof Auto Const

Scene Property BoS303_04_MissingAgitator Auto Const

Scene Property BoS303_04_MissingAgitatorPlayer Auto Const

Scene Property BoS303_06_ElevatorCombat Auto Const

Scene Property BoS303_07_PowerLoss Auto Const

Scene Property BoS303_08_PowerRestored Auto Const

Scene Property BoS303_09_ViewReactor Auto Const

Scene Property BoS303_Z04_Interlocks Auto Const

Scene Property BoS303_13_ReactorAlarmTripped Auto Const

Scene Property BoS303_13_ReactorAlarmNotTripped Auto Const

Scene Property BoS303_Z04_InterlocksPlayer Auto Const

Scene Property BoS303_14_ElevatorToLobby Auto Const

Scene Property BoS303_Z02_KeyCard Auto Const

Scene Property BoS303_12_AfterEnteringChamber Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS304 Auto Const

Quest Property BoS201B Auto Const

ReferenceAlias Property Alias_BoS303Vertibird Auto Const

ReferenceAlias Property Alias_BoS303BerylliumAgitator Auto Const

ObjectReference Property BoS303IngramFinalMarker Auto Const

ObjectReference Property BoSPrydwenPilotMarker Auto Const

ObjectReference Property BoS303Start Auto Const

GlobalVariable Property BoS303Ending Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS303Ready Auto Const

Quest Property BoSEnable Auto Const

Faction Property InstituteFaction Auto Const

Quest Property InstKickOut Auto Const

Quest Property BoSDialoguePrydwen Auto Const

ObjectReference Property BoSDoors Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Quest Property BoS203 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS301 Auto Const

Quest Property BoS302B Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS202LinkMQ Auto Const

Weather Property CommonwealthClear Auto Const

minutemencentralscript Property MinutemenCentralQuest Auto Const

ObjectReference Property DNPrime_EnableMarkerEncounters01 Auto Const

GlobalVariable Property RadioDCInstBroadcast Auto Const Mandatory

ReferenceAlias Property Alias_BoS303LibertyPrime Auto Const Mandatory

ObjectReference Property BoSLibertyPrimeStaticREF Auto Const

Faction Property PlayerFaction Auto Const

ActorBase Property Ingram Auto Const

ActorValue Property COMQC_BoS303GettingAgitatorAV Auto Const
