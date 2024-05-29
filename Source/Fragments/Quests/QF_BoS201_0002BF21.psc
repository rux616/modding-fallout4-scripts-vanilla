;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS201_0002BF21 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Airport is enabled normally after MQ201 fires
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoSDialoguePoliceStation.SetStage(40)
BoS101.SetStage(555)
BoS200.SetStage(100)
BoS200.SetStage(200)
BoS200.SetStage(255)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseCalledPlayerMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
MQ201.SetStage(0)


;Handle the Stage 5 miscellaneous changes here to make sure the quest works correctly
;if you skip the Prydwen Flyover scene.
;---DN130 - Cambridge PD
DN130.SetStage(50)
;---DN165 - Boston Airport Ruins
DN165.SetStage(30)
;---BoSM01 - Lost Patrol
BoSM01.DisableBoSM01Act1()
;---BoSM01 - Lost Patrol
if (BoSM01.GetStageDone(130) && !BoSM01.GetStageDone(140) && !BoSM01.GetStageDone(145) && BoSM01.GetStageDone(200))
     BoSM01Postquest.SetStage(10)
     BoSM01.SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
SetStage(10)
SetStage(20)
SetStage(30)
Game.GetPlayer().MoveTo(BoS201DanseRoofMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(45)
SetStage(50)
SetStage(80)
SetStage(90)
BoS201FlightStage30.Stop()
Game.GetPlayer().MoveTo(BoS201QuickStartPostMarker)
Alias_BoS201Kells.GetActorRef().MoveTo(BoS201KellsLandedMarker)
Alias_BoS201Kells.GetActorRef().EvaluatePackage()
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseLandedMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(45)
SetStage(50)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(115)
SetStage(120)
BoS201FlightStage30.Stop()
Game.GetPlayer().MoveTo(BoSPlayerPrydwenMarker)
BoS201_03_DanseKellsStage100.Stop()
Alias_BoS201Kells.GetActorRef().MoveTo(BoS201KellsLandedMarker)
Alias_BoS201Kells.GetActorRef().EvaluatePackage()
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseMessHallMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(45)
SetStage(50)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(115)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
BoS201FlightStage30.Stop()
BoS201_06_MaxsonStage130.Stop()
Game.GetPlayer().MoveTo(BoSPlayerPrydwenMarker)
BoS201_03_DanseKellsStage100.Stop()
Alias_BoS201Kells.GetActorRef().MoveTo(BoS201KellsLandedMarker)
Alias_BoS201Kells.GetActorRef().EvaluatePackage()
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseMessHallMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Animation
;MQ201FXPrydFlyoverRef.Enable()
;CommonwealthClear.ForceActive(abOverride = true)

;Scene
BoS201_00_PrydwenAnnouncement.Start()

;DN130 - Cambridge PD
;Once the Prydwen arrives, update the state of the police station if appropriate.
if ((BoS200.GetStageDone(200)) || (PlayerBoS_KickedOut.GetValue() > 0))
     DN130.SetStage(50)
EndIf

;BoSM01 - Lost Patrol
;If BoSM01 is active, block its dialogue to prevent conflicts with BoS201.
if (BoSM01.IsRunning())
     BoSM01.DisableBoSM01Act1()
EndIf

;BoSM01 - Lost Patrol
;Hide any reporting objectives still open when the Prydwen arrives.
if (BoSM01Pointer.IsRunning())
    BoSM01Pointer.SetStage(255)
EndIf
if (!BoSM01.IsObjectiveCompleted(20))
     SetObjectiveDisplayed(20, 0)
EndIf
if (!BoSM01.IsObjectiveCompleted(25))
     SetObjectiveDisplayed(25, 0)
EndIf
if (!BoSM01.IsObjectiveCompleted(150))
     SetObjectiveDisplayed(150, 0)
EndIf

;BoSM01 - Lost Patrol
;Check to see if the BoSM01 Postquest can run.
if (BoSM01.GetStageDone(130) && !BoSM01.GetStageDone(140) && !BoSM01.GetStageDone(145) && BoSM01.GetStageDone(200))
     BoSM01Postquest.SetStage(10)
     BoSM01.SetStage(255)
EndIf

;BoSM02/DN165 - Boston Airport Ruins
;Once the Prydwen arrives, seal the airport ruins until BoSM02 reaches the right stage.
DN165.SetStage(30)

;Set the global.
BoSPrydwenArrived.SetValue(1)

;Disable MQ106_CommandCenterDoor
MQ106_CommandCenterDoor.disable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ201PrydwenArrivedAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
BoS201Radio.SetStage(10)
Utility.Wait(12)
SetObjectiveDisplayed(5,1)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
(DNMasterQuest as RadioFailsafeScript).AddScene(BoS201RadioScene)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(5) == 1
SetObjectiveDisplayed(5,0)
endif
if BoSJoined.GetValue() == 1
SetObjectiveDisplayed(10,1)
endif
if BoS000.IsRunning() == 1
BoS000.SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Radio Signal Done, or Speak to Danse Done
SetObjectiveCompleted(5,1)
SetObjectiveDisplayed(10,1)
(DNMasterQuest as RadioFailsafeScript).RemoveScene(BoS201RadioScene)

;Turn on scene at Police station
BoSPDSceneScribe.Enable()
BoSPDSceneSoldier.Enable()
BoSScene_PoliceStation.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE bos201questscript
Quest __temp = self as Quest
bos201questscript kmyQuest = __temp as bos201questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)

;Danse Keyword Swap
kmyQuest.DanseKeyOn()

;Disable Long Wharf Encounter
Waterfront_LongWharfSupermutantEnableMarker.Disable()

;Vertibird Enables
if BoS201VSpawn.GetValue() == 0
Alias_BoS201Vertibird.GetActorRef().Enable()
Alias_BoS201Vertibird.GetActorRef().SetGhost()
Alias_BoS201Vertibird.GetActorRef().EvaluatePackage()
Alias_BoS201VertibirdPilot.GetActorRef().Enable()
Alias_BoS201VertibirdPilot.GetActorRef().SetGhost()
Alias_BoS201VertibirdPilot.GetActorRef().EvaluatePackage()
BoS201VSpawn.SetValue(1)
endif

BoS201FlightStage30.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetStage(40)
SetStage(50)
SetStage(90)
BoS201FlightStage30.Stop()
Game.GetPlayer().MoveTo(BoS201QuickStartPostMarker)
Alias_BoS201Kells.GetActorRef().MoveTo(BoS201KellsLandedMarker)
Alias_BoS201Kells.GetActorRef().EvaluatePackage()
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseLandedMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE bos201questscript
Quest __temp = self as Quest
bos201questscript kmyQuest = __temp as bos201questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20,1)
kmyQuest.EnableLayer = InputEnableLayer.Create()
kmyQuest.EnableLayer.EnableFastTravel(false)

;Weather Transition
CommonwealthClear.SetActive(false,true)

;Setup Prydwen
Alias_BoS201Kells.GetActorRef().MoveTo(BoS201KellsLandedMarker)
Alias_BoS201Kells.GetActorRef().EvaluatePackage()

;Enable Safety Wall on Prydwen's Flight Deck
BoS201SafetyWallRef.Enable()

;Connector Doors Enable
BoSDoors.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
Quest __temp = self as Quest
companionvertibirdquestscript kmyQuest = __temp as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CompanionsShouldExitVertibird()
kmyquest.GhostOff()
SetObjectiveDisplayed(40,1)

;Disable Radio Transmitter
BoS201RadioTransmitterRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE bos201questscript
Quest __temp = self as Quest
bos201questscript kmyQuest = __temp as bos201questscript
;END AUTOCAST
;BEGIN CODE
;Distance Check for Danse
if Alias_BoS201Danse.GetActorRef().GetDistance(BoS201DanseLandedMarker) > 1000
debug.trace("BoS201 has been moved Danse to Flight Deck")
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseAppearsMarker)
endif

BoS201_03_DanseKellsStage100.Start()
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)

;Danse Keyword Swap
kmyQuest.DanseKeyOff()

;DN130 - Cambridge PD
;Once the player arrives on the Prydwen, set up the Police Station for Act II if we didn't earlier.
DN130.SetStage(50)
;Additionally, if we're in Act III, set up the Police Station for Act III.
if (MQ206.GetStageDone(1200))
     DN130.SetStage(60)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
Alias_BoS201Maxson.GetActorRef().MoveTo(BoS201MaxsonAddressMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
Alias_BoS201Maxson.GetActorRef().ChangeAnimFlavor(AnimFlavorMilitary)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Triggered by a trigger in Maxson's Quarters
BoS201MaxsonStage50.Start()
DogmeatCanPlayFlavorIdles.SetValue(0)
Alias_BoS201Kells.GetActorRef().Moveto(BoSKellsBridgeMarker)
Alias_BoS201Kells.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
Alias_BoS201Speech01.GetActorRef().EvaluatePackage()
Alias_BoS201Speech02.GetActorRef().EvaluatePackage()
Alias_BoS201Speech03.GetActorRef().EvaluatePackage()
Alias_BoS201Speech04.GetActorRef().EvaluatePackage()
Alias_BoS201Speech05.GetActorRef().EvaluatePackage()
Alias_BoS201Speech06.GetActorRef().EvaluatePackage()
utility.wait(1)
DogmeatCanPlayFlavorIdles.SetValue(1)

;Move deck scribes into position for scene
Alias_DeckScribe03.GetRef().MoveTo(DeckScribe03SceneMarker)
Alias_DeckScribe04.GetRef().MoveTo(DeckScribe04SceneMarker)

;Move range officer into place for scene
Alias_BoSAirportRangeOfficer.GetRef().MoveTo(BosAirportRangeOfficerMarker)

;Enable Knight Sgt. Gavil in the Supply Depot.
Alias_BoS201Gavil.TryToEnableNoWait()

;Update Maxson's flavor anims.
Alias_BoS201Maxson.GetActorRef().ChangeAnimFlavor()

;Turn on firing range scene at Airport
BoSAirportScene_Range.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)

;Knight Rank
BoSDialoguePrydwen.SetStage(20)
BoSKnightSuitPlayerRef.Enable()

;Workshop Ownership Activated
(Alias_BoS201WorkshopAlias.GetRef() as WorkshopScript).SetOwnedByPlayer(true)

;Enable Storage
BoSPlayerStorageSwapperRef.Enable()
BoSStorage.SetStage(10)

;Safety Override for Danse - Move Him to Mess Hall
Alias_BoS201Danse.GetActorRef().MoveTo(BoS201DanseMessHallMarker)
Alias_BoS201Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
COMDanse.SetStage(80)
Alias_BoS201Danse.GetActorReference().SetAvailableToBeCompanion()

;Disable vertibird
Alias_BoS201Vertibird.GetActorRef().Disable()
Alias_BoS201VertibirdPilot.GetActorRef().Disable()

;Enable bridge scribes
BoSBridgeScribesEnableMarker.Enable()

SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
Alias_BoS201Danse.GetActorReference().SetAvailableToBeCompanion()

;Disable vertibird
Alias_BoS201Vertibird.GetActorRef().Disable()
Alias_BoS201VertibirdPilot.GetActorRef().Disable()

;Enable bridge scribes
BoSBridgeScribesEnableMarker.Enable()

SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Quest Done
BoSDanseIsCompanion.SetValue(1)
SetObjectiveCompleted(80,1)
BoS201B.SetStage(10)

;Update Global for Radio News
RadioDCBoS201Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Check if BoS000 is still running, and shut it down if it is
if BoS000.IsRunning() == 1
BoS000.SetStage(255)
endif

;Enable Long Wharf Encounter
Waterfront_LongWharfSupermutantEnableMarker.Enable()

;Enable guard outside Maxson's room
Alias_MaxsonGuard.GetRef().Enable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Force Dismount Player if he's on board
Actor Player = Game.GetPlayer()
if Alias_BoS201Vertibird.GetActorRef().IsBeingRiddenBy(Player)
Player.Dismount()
endif

Alias_BoS201Vertibird.GetActorRef().SetGhost(false)
Alias_BoS201VertibirdPilot.GetActorRef().SetGhost(false)

;Disable Safety Wall on Prydwen
BoS201SafetyWallRef.Disable()

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoS201PlayerAppearsMarker Auto Const

ReferenceAlias Property Alias_BoS201Danse Auto Const

ReferenceAlias Property Alias_BoS201Enoch Auto Const

ReferenceAlias Property Alias_BoS201Maxson Auto Const

ReferenceAlias Property Alias_BoS201Ingram Auto Const

ReferenceAlias Property Alias_BoS201Teagan Auto Const

ReferenceAlias Property Alias_BoS201Quinlan Auto Const

ReferenceAlias Property Alias_BoS201Kells Auto Const

ObjectReference Property BoS201MaxsonAddressMarker Auto Const

ObjectReference Property BoS201IngramAddressMarker Auto Const

ObjectReference Property BoS201KellsAddressMarker Auto Const

ObjectReference Property BoS201QuinlanAddressMarker Auto Const

ObjectReference Property BoS201TeaganAddressMarker Auto Const

ObjectReference Property BoS201DanseAddressMarker Auto Const

Scene Property BoS201MaxsonStage50 Auto Const

Quest Property BoS201Radio Auto Const

ObjectReference Property BoS201DanseAppearsMarker Auto Const

Quest Property DN130 Auto Const

Quest Property DN165 Auto Const

Quest Property BoS201B Auto Const

Scene Property BoS201FlightStage30 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoS101 Auto Const

Quest Property BoSPoliceStation Auto Const

ObjectReference Property BoS201KellsLandedMarker Auto Const

ObjectReference Property BoSKellsBridgeMarker Auto Const

Quest Property BoS200 Auto Const

Scene Property BoS201_03_DanseKellsStage100 Auto Const

GlobalVariable Property BoS201Follow Auto Const

BoSM01QuestScript Property BoSM01 Auto Const

Quest Property BoSM01Postquest Auto Const

Quest Property BoSM00 Auto Const

ObjectReference Property BoS201DanseRoofMarker Auto Const

ObjectReference Property BoS201QuickStartPostMarker Auto Const

ObjectReference Property BoS201DanseLandedMarker Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS201Ready Auto Const

Quest Property BoSDialoguePrydwen Auto Const

Quest Property BoSEnable Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const

Quest Property MQ206 Auto Const

ReferenceAlias Property Alias_BoS201VertibirdPilot Auto Const

ReferenceAlias Property Alias_BoS201Vertibird Auto Const

ObjectReference Property MQ201FXPrydFlyoverRef Auto Const

Scene Property BoS201_00_PrydwenArrives Auto Const

ReferenceAlias Property Alias_BoS201Speech01 Auto Const

ReferenceAlias Property Alias_BoS201Speech02 Auto Const

ReferenceAlias Property Alias_BoS201Speech03 Auto Const

ReferenceAlias Property Alias_BoS201Speech04 Auto Const

ReferenceAlias Property Alias_BoS201Speech05 Auto Const

ReferenceAlias Property Alias_BoS201Speech06 Auto Const

ObjectReference Property BoSNeriahRef Auto Const

GlobalVariable Property BoS201VSpawn Auto Const

ReferenceAlias Property Alias_BoS201WorkshopAlias Auto Const

ObjectReference Property BoSDoors Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Armor Property Armor_Power_T60_Helm Auto Const

Quest Property MQ201 Auto Const

GlobalVariable Property XPFactionFinal Auto Const
Scene Property BoS201_00_PrydwenAnnouncement Auto Const

Quest Property BoS000 Auto Const

Quest Property BoSM01Pointer Auto Const

ObjectReference Property MQ106_CommandCenterDoor Auto Const

ObjectReference Property BoSBridgeScribesEnableMarker Auto Const

ReferenceAlias Property Alias_DeckScribe03 Auto Const

ReferenceAlias Property Alias_DeckScribe04 Auto Const

ObjectReference Property DeckScribe03SceneMarker Auto Const

ObjectReference Property DeckScribe04SceneMarker Auto Const

ObjectReference Property BoSAirportFiringRangeTrigger Auto Const

Quest Property BoSAirportScene_Range Auto Const

ReferenceAlias Property Alias_BoSAirportRangeOfficer Auto Const

ObjectReference Property BosAirportRangeOfficerMarker Auto Const

Quest Property BoSScene_PoliceStation Auto Const

ObjectReference Property BoSPDSceneScribe Auto Const

ObjectReference Property BoSPDSceneSoldier Auto Const

Keyword Property AnimFlavorMilitary Auto Const

ObjectReference Property BoS201DanseMessHallMarker Auto Const

ObjectReference Property BoSPlayerPrydwenMarker Auto Const

Quest Property COMDanse Auto Const

ObjectReference Property DNPrime_EnableMarkerEncounters01 Auto Const

Scene Property BoS201_06_MaxsonStage130 Auto Const

GlobalVariable Property BoSPrydwenArrived Auto Const

ObjectReference Property BoS201DanseCalledPlayerMarker Auto Const

Quest Property BoSDialoguePoliceStation Auto Const

Weather Property CommonwealthClear Auto Const

ObjectReference Property BoSKnightSuitPlayerRef Auto Const

GlobalVariable Property DogmeatCanPlayFlavorIdles Auto Const

ReferenceAlias Property Alias_BoS201Gavil Auto Const

GlobalVariable Property BoSDanseIsCompanion Auto Const

ObjectReference Property BoSPlayerStorageSwapperRef Auto Const

Quest Property BoSStorage Auto Const

ReferenceAlias Property Alias_MaxsonGuard Auto Const Mandatory

ObjectReference Property BoS201RadioTransmitterRef Auto Const

ActorValue Property COMQC_MQ201PrydwenArrivedAV Auto Const

ObjectReference Property Waterfront_LongWharfSupermutantEnableMarker Auto Const

GlobalVariable Property BoSJoined Auto Const

Quest Property DNMasterQuest Auto Const Mandatory

Scene Property BoS201RadioScene Auto Const Mandatory

ObjectReference Property BoS201SafetyWallRef Auto Const
