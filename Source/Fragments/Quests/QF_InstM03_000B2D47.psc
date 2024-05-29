;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM03_000B2D47 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Add the player to the Institute Faction, which is necessary for some faction interactions
Game.GetPlayer().AddToFaction(InstituteFaction)

;Set stage 5, which places actors, make the rumor available, etc
SetStage(5)

;Set Stage 100, which replicates the player having heard the rumor.
SetStage(100)

;Add the Institute map marker
InstituteMapMarker.AddToMap(True)

;Move the player
Game.GetPlayer().MoveTo(InstM03Playtest1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE InstM03Script
Quest __temp = self as Quest
InstM03Script kmyQuest = __temp as InstM03Script
;END AUTOCAST
;BEGIN CODE
;Startup stage - runs when the quest is started from the completion stage of quest Inst302
;Start to monitor for ChangeLocation event
kmyquest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set from InstM03Script when player changes loc twice and neither is InstituteLocation
;Used as a condition on the rumor that sets stage 100 and gives first objectuve

;Shut down the "HiggsCourser" ambient dialogue scene quest
DialogueInstituteHiggsCourser1.Stop()

;Shut down the "LokenAyo" ambient dialogue scene quest
;DialogueInstituteLokenAyo1.Stop()

;Move actors into positions
Alias_Newton.GetActorRef().MoveTo(InstM03HydroDoor)
Alias_Max.GetActorRef().MoveTo(InstM03LokenStandMarker)
Alias_Lawrence.GetActorRef().MoveTo(InstM03HiggsStandMarker)
Alias_Clayton.GetActorRef().MoveTo(ClaytonHoldrenQuartersRef)
Alias_Brendan.GetActorRef().MoveTo(DeanVolkertQuartersRef)
Alias_Isaac.GetActorRef().MoveTo(IsaacKarlinQuartersRef)
Alias_GenericScientistMale.GetActorRef().MoveTo(InstituteAliasBioSci1)
Alias_GenericScientistFemale.GetActorRef().MoveTo(InstituteAliasBioSci2)

;Enable the re-programmed synth guard in BioScience
InstM03SynthGuardHallway1.Enable()
InstM03SynthGuardHallway2.Enable()
InstM03SynthGuard1Ref.Enable()
InstM03SynthGuard2Ref.Enable()

;Enable the Turrets
InstM03GuardEnableParent.Enable()

;Close the security door
ObjectReference lowerDoor = BioScienceLowerDoorTerminalRef.getLinkedRef()
lowerDoor.activate(BioScienceLowerDoorTerminalRef)

;Lock the BioScience Door Terminal and set it to require a key
;BioScienceLowerDoorTerminalRef.Lock()
;BioScienceLowerDoorTerminalRef.SetLockLevel(255)

;Lock the tunnel entrance door and set it require a key
InstM03TunnelDoorRef.SetOpen(False)
InstM03TunnelDoorRef.Lock()
InstM03TunnelDoorRef.SetLockLevel(255)

;Lock the observation room door and set it require a terminal
HydroponicsControlDoorRef.SetOpen(False)
HydroponicsControlDoorRef.Lock()
HydroponicsControlDoorRef.SetLockLevel(255)

;Close the laser grid door
BoS203LaserGateRef.SetOpen(False)
BoS203LaserGateRef02.SetOpen(False)

;Start the hydroponics door scene (but phase 1 starts on conditions of player being close)
;InstM03NewtonScene0Door.Start()

;Remove the rebellious doctors from the InstituteFaction and CrimeInstitute faction
Alias_Lawrence.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_Lawrence.GetActorRef().RemoveFromFaction(CrimeInstitute)
Alias_Max.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_Max.GetActorRef().RemoveFromFaction(CrimeInstitute)

;Remove Higgs from the Common Furniture faction
Alias_Lawrence.GetActorRef().RemoveFromFaction(InstituteCommonFurniture)

;Add the doctors to the InstM03RebelFaction
Alias_Lawrence.GetActorRef().AddToFaction(InstM03RebelFaction)
Alias_Max.GetActorRef().AddToFaction(InstM03RebelFaction)

;Remove Protected status from doctors
Alias_Lawrence.GetActorRef().SetProtected(False)
Alias_Max.GetActorRef().SetProtected(False)

;Remove the turrets from the Institute and Robot factions
Alias_UpperTurret01.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_UpperTurret02.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_LowerTurret01.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_LowerTurret02.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_UpperTurret01.GetActorRef().RemoveFromFaction(RobotFaction)
Alias_UpperTurret02.GetActorRef().RemoveFromFaction(RobotFaction)
Alias_LowerTurret01.GetActorRef().RemoveFromFaction(RobotFaction)
Alias_LowerTurret02.GetActorRef().RemoveFromFaction(RobotFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set when the player enters the Hydroponics control room for the first time

;Start Lawnrence Higgs' first scene upon seeing the player
InstM03LawrenceScene0SpotPlayer.Start()

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set when the player enters one of the two trigger boxes in the entrances to BioScience
;Used as a condition to send the doctors into their flee package

;Add the guards to a player enemy faction to make them hostile
Alias_SynthGuard1.GetActorRef().AddToFaction(InstM03EnemyFaction)
Alias_SynthGuard2.GetActorRef().AddToFaction(InstM03EnemyFaction)

;Turn on the second objective to speak to Lawrence Higgs if he is alive
if LawrenceHiggs.GetDeadCount() == 0
     SetObjectiveDisplayed(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
;Set by an OnCombatStateChange call on a script on the guard aliases.
;Used as a condition for the scientist's flee packages

;Start the "InstM03ReactGuardCombat" scene
InstM03ReactGuardCombat.Start()

;Set stage 60, which will cause the doctors to use their flee package
SetStage(60)
Alias_Lawrence.GetActorRef().EvaluatePackage()
Alias_Max.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
;Set when Newton's package to travel to the tunnel entrance completes

;Start the scene where Newton unlocks the door
InstM03NewtonUnlocksDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Add the holotape to the player's inventory
Game.GetPlayer().AddItem(Alias_Holotape.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set in the End Data tab of the scene where Newton unlocks the door to hydroponics
;Also used as a condition in Newton's package to stand near the tunnel entrance.

;Unlock the door to the maintenance tunnel
InstM03TunnelDoorRef.Unlock()
InstM03TunnelDoorRef.SetLockLevel(0)

;Set stage 400
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set when the player first enters the hydroponics control room

;Start Lawrence Scene
;Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set when Phase 6 Of Scene "InstM03OpenHydroDoor1" Completes OR
;Set when Phase 6 Of Scene "InstM03OpenHydroDoor2" Completes
;This is the scene where Max unlocks the door to Hydroponics

;Opens the lower security door
ObjectReference lowerDoor = BioScienceLowerDoorTerminalRef.getLinkedRef()
if (lowerDoor as Default2StateActivator).isOpen == False
     lowerDoor.activate(BioScienceLowerDoorTerminalRef)
endif

;Unlock the control room door
HydroponicsControlDoorRef.Unlock()

;Unlock the inner laser grid terminal and set lock level to 0
BoS203LGateTerm02Ref.Unlock()
BoS203LGateTerm02Ref.SetLockLevel(0)

;Strip hostile factions from synths and send them into patrol routes
Alias_SynthGuard1.GetActorRef().RemoveFromFaction(InstM03GuardFaction)
Alias_SynthGuard1.GetActorRef().AddToFaction(InstituteFaction)
Alias_SynthGuard2.GetActorRef().RemoveFromFaction(InstM03GuardFaction)
Alias_SynthGuard2.GetActorRef().AddToFaction(InstituteFaction)
Alias_SynthGuard03.GetActorRef().RemoveFromFaction(InstM03GuardFaction)
Alias_SynthGuard03.GetActorRef().AddToFaction(InstituteFaction)
Alias_SynthGuard04.GetActorRef().RemoveFromFaction(InstM03GuardFaction)
Alias_SynthGuard04.GetActorRef().AddToFaction(InstituteFaction)

;Add Higgs and Loken back to the Institute factions so the turrets won't attack them
Alias_Lawrence.GetActorRef().AddToFaction(InstituteFaction)
Alias_Lawrence.GetActorRef().SetCrimeFaction(CrimeInstitute)
Alias_Max.GetActorRef().AddToFaction(InstituteFaction)
Alias_Max.GetActorRef().SetCrimeFaction(CrimeInstitute)


;Remove the doctors from the InstM03RebelFaction
Alias_Lawrence.GetActorRef().RemoveFromFaction(InstM03RebelFaction)
Alias_Max.GetActorRef().RemoveFromFaction(InstM03RebelFaction)

;Returns the turrets to normal factions
SetStage(37)

;Complete the "resolve standoff" objective and gives the next one
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Set when the player hacks the control room terminal
;Used as a condition to prevent the hack screen from appearing again
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
;Set when the player chooses the "Disable Turrets" option from the BioScience control room terminal
;Also set from Stage 30, when the player has disabled the security override

;Wipe all factions from the turrets

Alias_UpperTurret01.GetActorRef().RemoveFromAllFactions()
Alias_UpperTurret02.GetActorRef().RemoveFromAllFactions()
Alias_LowerTurret01.GetActorRef().RemoveFromAllFactions()
Alias_LowerTurret02.GetActorRef().RemoveFromAllFactions()

;StopCombat on turrets

Alias_UpperTurret01.GetActorRef().StopCombat()
Alias_UpperTurret02.GetActorRef().StopCombat()
Alias_LowerTurret01.GetActorRef().StopCombat()
Alias_LowerTurret02.GetActorRef().StopCombat()

;Put the turrets back in their normal factions
Alias_UpperTurret01.GetActorRef().AddToFaction(InstituteFaction)
Alias_UpperTurret02.GetActorRef().AddToFaction(InstituteFaction)
Alias_LowerTurret01.GetActorRef().AddToFaction(InstituteFaction)
Alias_LowerTurret02.GetActorRef().AddToFaction(InstituteFaction)
Alias_UpperTurret01.GetActorRef().AddToFaction(RobotFaction)
Alias_UpperTurret02.GetActorRef().AddToFaction(RobotFaction)
Alias_LowerTurret01.GetActorRef().AddToFaction(RobotFaction)
Alias_LowerTurret02.GetActorRef().AddToFaction(RobotFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set when the player releases the gorillas

;Add the gorillas to a faction that's an enemy of the guards and doctors
Alias_Gorilla1.GetActorRef().AddToFaction(InstM03GorillaFaction)
Alias_Gorilla2.GetActorRef().AddToFaction(InstM03GorillaFaction)

;Remove the gorillas from the Institute faction
Alias_Gorilla1.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_Gorilla2.GetActorRef().RemoveFromFaction(InstituteFaction)

;Start reaction scene
InstM03ReactGorillas.Start()

;Set stage 60, which will cause the doctors to use their flee package
SetStage(60)

;Open the gorilla door
ObjectReference myDoor = BioScienceControlRoomTerminalRef.getLinkedRef()
myDoor.activate(BioScienceControlRoomTerminalRef)

;Start the Gorilla escape scene
InstM03GorillasEscape.Start()

;Play dread music
MUSDreadShort.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;Set when the player unlocks the control room door from the terminal in the control room
HydroponicsControlDoorRef.Unlock()

;Play the door react scene
InstM03ReactDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set if Max Loken dies while this quest is running
;If Lawrence is dead, this stage pops a new objective to get the hydroponics key from Max's corpse

;Fail the quest if the scientists have already stood down and the player kills Max
if GetStageDone(30) == True
     SetStage(2500)
elseif GetStageDone(55) == True
     Alias_Max.GetActorRef().AddItem(Alias_HydroponicsKey.GetReference(), 1)
     SetObjectiveDisplayed(40, False)
     SetObjectiveDisplayed(50, False)
     SetObjectiveCompleted(60)
     SetObjectiveDisplayed(80)
endif

;Add Lawrence to the custom player enemy faction
Alias_Lawrence.GetActorRef().AddToFaction(InstM03EnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(InstM03SecurityOverridePassword, 1)
Alias_HydroponicsKey.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Set by Lawrence's alias when he dies
;If Max is already dead, this stage pops a new objective to get the hydroponics key from Lawrence's corpse
;if the scientists have already stood down and the player kills Lawrence anyway, fail the quest

if GetStageDone(30) == True
     SetStage(2500)
elseif GetStageDone(50) == True
     Alias_Lawrence.GetActorRef().AddItem(Alias_HydroponicsKey.GetReference(), 1)
     SetObjectiveFailed(40)
     SetObjectiveFailed(50)
     SetObjectiveCompleted(60)
     SetObjectiveDisplayed(80)
endif

;Add Max to the player enemy faction
Alias_Max.GetActorRef().AddToFaction(InstM03EnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set by stage 16 and by stage 40
;Used as a condition on the flee package for Doctors Higgs & Loken
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Set when the player convinces the doctors to stand down
;This happens in phase 2 of the scene "InstM03LawrenceBranch1Convince" on the question reply

InstM03EnterHydropnicsTrigger1.Disable()
InstM03EnterHydropnicsTrigger2.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set if the player suggests executing Higgs and Loken
;Used as a condition to disable Higgs & Loken in the post quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
;Set in the last scene with Newton if the player chose probation as punishment for Higgs & Loken
;Gates dialogue and packages in the post quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0082_Item_00
Function Fragment_Stage_0082_Item_00()
;BEGIN CODE
;Set if the player chose to exile the doctors
;Used as a condition for a post-quest random encounter "RECampKMK_InstM03"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
;Removes the holotape if the player is carrying it
;Set in Phase 4 of Scene "Inst301NewtonBranchPunishment"

Game.GetPlayer().RemoveItem(Alias_Holotape.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set when the player greets Father
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when the player hears the rumor about what's going on in hydroponics
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set at the end of the quest's intro conversation with Newton Oberly

;Give the player Newton's holotape
SetStage(18)

;Used as a condition on Newton's dialogue to start the quest
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Start the door unlock scene
InstM03NewtonUnlocksDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set when stage 20 is set
;Acts as a condition on Newton's Oberly's packages to make him stand by hte tunnel door
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set by stage 10 (when the player enters the hydroponics control room)
;This scene plays when the player first enters the hydroponics control room
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set if the player was unable to convince Lawrence Higgs to stand down
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)

Alias_Lawrence.GetActorRef().EvaluatePackage()

;Start the HiggsReassure scene
InstM03HiggsReassure.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set when Max Loken opens the door to hydroponics OR
;Set when the player opens the door to hydroponics

;Direct the player to see Newton Oberly for a reward
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(80)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Set the lock level for the hydroponics door back to normal and unlock it
;InstituteHydroponicsDoorRef.SetLockLevel(0)
;InstituteHydroponicsDoorRef.Unlock()

;Give item rewards if the player did not suggest executing Higgs and Loken
if GetStageDone(80) == False
     Game.GetPlayer().AddItem(Mentats, 5)
     Game.GetPlayer().AddItem(Jet, 5)
     Game.GetPlayer().AddItem(Radaway, 5)
endif

;Remove the gorillas from their hostile faction
Alias_Gorilla1.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)
Alias_Gorilla2.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)

;Add the gorillas to the Institute faction
Alias_Gorilla1.GetActorRef().AddToFaction(InstituteFaction)
Alias_Gorilla2.GetActorRef().AddToFaction(InstituteFaction)

;Remove each gorilla corpse or put the gorilla back in the habitat if still alive

if Alias_Gorilla1.GetActorRef().IsDead() == True
     Alias_Gorilla1.GetActorRef().Disable() 
elseif Alias_Gorilla1.GetActorRef().IsDead() == False
     Alias_Gorilla1.GetActorRef().MoveTo(InstM03GorillaHabitat1)
endif

if Alias_Gorilla2.GetActorRef().IsDead() == True
     Alias_Gorilla2.GetActorRef().Disable() 
elseif Alias_Gorilla2.GetActorRef().IsDead() == False
     Alias_Gorilla2.GetActorRef().MoveTo(InstM03GorillaHabitat2)
endif

;Shut the gorilla habitat door
ObjectReference myDoor = BioScienceControlRoomTerminalRef.getLinkedRef()
myDoor.SetOpen(False)

;Remove the essential setting from Newton Oberly if stage 10 of Inst308 has been set
if Inst308.GetStageDone(10)
     NewtonOberly.SetEssential(False)
endif

InstM03Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_01
Function Fragment_Stage_2000_Item_01()
;BEGIN CODE
CompleteAllObjectives()

;Set the lock level for the hydroponics door back to normal and unlock it
;InstituteHydroponicsDoorRef.SetLockLevel(0)
;InstituteHydroponicsDoorRef.Unlock()

;Give item rewards if the player did not suggest executing Higgs and Loken
if GetStageDone(80) == False
     Game.GetPlayer().AddItem(Mentats, 5)
     Game.GetPlayer().AddItem(Jet, 5)
     Game.GetPlayer().AddItem(Radaway, 5)
endif

;Remove the gorillas from their hostile faction
Alias_Gorilla1.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)
Alias_Gorilla2.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)

;Add the gorillas to the Institute faction
Alias_Gorilla1.GetActorRef().AddToFaction(InstituteFaction)
Alias_Gorilla2.GetActorRef().AddToFaction(InstituteFaction)

;Remove each gorilla corpse or put the gorilla back in the habitat if still alive

if Alias_Gorilla1.GetActorRef().IsDead() == True
     Alias_Gorilla1.GetActorRef().Disable() 
elseif Alias_Gorilla1.GetActorRef().IsDead() == False
     Alias_Gorilla1.GetActorRef().MoveTo(InstM03GorillaHabitat1)
endif

if Alias_Gorilla2.GetActorRef().IsDead() == True
     Alias_Gorilla2.GetActorRef().Disable() 
elseif Alias_Gorilla2.GetActorRef().IsDead() == False
     Alias_Gorilla2.GetActorRef().MoveTo(InstM03GorillaHabitat2)
endif

;Shut the gorilla habitat door
ObjectReference myDoor = BioScienceControlRoomTerminalRef.getLinkedRef()
myDoor.SetOpen(False)

;Remove the essential setting from Newton Oberly if stage 10 of Inst308 has been set
if Inst308.GetStageDone(10)
     NewtonOberly.SetEssential(False)
endif

InstM03Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_02
Function Fragment_Stage_2000_Item_02()
;BEGIN CODE
CompleteAllObjectives()

;Set the lock level for the hydroponics door back to normal and unlock it
;InstituteHydroponicsDoorRef.SetLockLevel(0)
;InstituteHydroponicsDoorRef.Unlock()

;Give item rewards if the player did not suggest executing Higgs and Loken
if GetStageDone(80) == False
     Game.GetPlayer().AddItem(Mentats, 5)
     Game.GetPlayer().AddItem(Jet, 5)
     Game.GetPlayer().AddItem(Radaway, 5)
endif

;Remove the gorillas from their hostile faction
Alias_Gorilla1.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)
Alias_Gorilla2.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)

;Add the gorillas to the Institute faction
Alias_Gorilla1.GetActorRef().AddToFaction(InstituteFaction)
Alias_Gorilla2.GetActorRef().AddToFaction(InstituteFaction)

;Remove each gorilla corpse or put the gorilla back in the habitat if still alive

if Alias_Gorilla1.GetActorRef().IsDead() == True
     Alias_Gorilla1.GetActorRef().Disable() 
elseif Alias_Gorilla1.GetActorRef().IsDead() == False
     Alias_Gorilla1.GetActorRef().MoveTo(InstM03GorillaHabitat1)
endif

if Alias_Gorilla2.GetActorRef().IsDead() == True
     Alias_Gorilla2.GetActorRef().Disable() 
elseif Alias_Gorilla2.GetActorRef().IsDead() == False
     Alias_Gorilla2.GetActorRef().MoveTo(InstM03GorillaHabitat2)
endif

;Shut the gorilla habitat door
ObjectReference myDoor = BioScienceControlRoomTerminalRef.getLinkedRef()
myDoor.SetOpen(False)

;Remove the essential setting from Newton Oberly if stage 10 of Inst308 has been set
if Inst308.GetStageDone(10)
     NewtonOberly.SetEssential(False)
endif

;Add Higgs to the Institute Common Furniture faction
Alias_Lawrence.GetActorRef().AddToFaction(InstituteCommonFurniture)

InstM03Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_03
Function Fragment_Stage_2000_Item_03()
;BEGIN CODE
CompleteAllObjectives()

;Set the lock level for the hydroponics door back to normal and unlock it
;InstituteHydroponicsDoorRef.SetLockLevel(0)
;InstituteHydroponicsDoorRef.Unlock()

;Give item rewards if the player did not suggest executing Higgs and Loken
if GetStageDone(80) == False
     Game.GetPlayer().AddItem(Mentats, 5)
     Game.GetPlayer().AddItem(Jet, 5)
     Game.GetPlayer().AddItem(Radaway, 5)
endif

;Remove the gorillas from their hostile faction
Alias_Gorilla1.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)
Alias_Gorilla2.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)

;Add the gorillas to the Institute faction
Alias_Gorilla1.GetActorRef().AddToFaction(InstituteFaction)
Alias_Gorilla2.GetActorRef().AddToFaction(InstituteFaction)

;Remove each gorilla corpse or put the gorilla back in the habitat if still alive

if Alias_Gorilla1.GetActorRef().IsDead() == True
     Alias_Gorilla1.GetActorRef().Disable() 
elseif Alias_Gorilla1.GetActorRef().IsDead() == False
     Alias_Gorilla1.GetActorRef().MoveTo(InstM03GorillaHabitat1)
endif

if Alias_Gorilla2.GetActorRef().IsDead() == True
     Alias_Gorilla2.GetActorRef().Disable() 
elseif Alias_Gorilla2.GetActorRef().IsDead() == False
     Alias_Gorilla2.GetActorRef().MoveTo(InstM03GorillaHabitat2)
endif

;Shut the gorilla habitat door
ObjectReference myDoor = BioScienceControlRoomTerminalRef.getLinkedRef()
myDoor.SetOpen(False)

;Remove the essential setting from Newton Oberly if stage 10 of Inst308 has been set
if Inst308.GetStageDone(10)
     NewtonOberly.SetEssential(False)
endif

;Add Higgs to the Institute Common Furniture faction
Alias_Lawrence.GetActorRef().AddToFaction(InstituteCommonFurniture)
Debug.Trace("InstM03 Lawrence added to common furniture faction")

InstM03Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_04
Function Fragment_Stage_2000_Item_04()
;BEGIN CODE
CompleteAllObjectives()

;Set the lock level for the hydroponics door back to normal and unlock it
;InstituteHydroponicsDoorRef.SetLockLevel(0)
;InstituteHydroponicsDoorRef.Unlock()

;Give item rewards if Higgs and Loken are alive and won't be executed
;if GetStageDone(80) == False
;     Game.GetPlayer().AddItem(Mentats, 5)
;     Game.GetPlayer().AddItem(Jet, 5)
;     Game.GetPlayer().AddItem(Radaway, 5)
;endif

;Remove the gorillas from their hostile faction
Alias_Gorilla1.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)
Alias_Gorilla2.GetActorRef().RemoveFromFaction(InstM03GorillaFaction)

;Add the gorillas to the Institute faction
Alias_Gorilla1.GetActorRef().AddToFaction(InstituteFaction)
Alias_Gorilla2.GetActorRef().AddToFaction(InstituteFaction)

;Remove each gorilla corpse or put the gorilla back in the habitat if still alive

if Alias_Gorilla1.GetActorRef().IsDead() == True
     Alias_Gorilla1.GetActorRef().Disable() 
elseif Alias_Gorilla1.GetActorRef().IsDead() == False
     Alias_Gorilla1.GetActorRef().MoveTo(InstM03GorillaHabitat1)
endif

if Alias_Gorilla2.GetActorRef().IsDead() == True
     Alias_Gorilla2.GetActorRef().Disable() 
elseif Alias_Gorilla2.GetActorRef().IsDead() == False
     Alias_Gorilla2.GetActorRef().MoveTo(InstM03GorillaHabitat2)
endif

;Shut the gorilla habitat door
ObjectReference myDoor = BioScienceControlRoomTerminalRef.getLinkedRef()
myDoor.SetOpen(False)

;Remove the essential setting from Newton Oberly if stage 10 of Inst308 has been set
if Inst308.GetStageDone(10)
     NewtonOberly.SetEssential(False)
endif

InstM03Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Door Property InstM03TunnelDoor Auto Const

ObjectReference Property InstM03TunnelDoorRef Auto Const

Scene Property InstM03NewtonUnlocksDoor Auto Const

ObjectReference Property InstM03Playtest1 Auto Const

ObjectReference Property InstM03GuardEnableParent Auto Const

ObjectReference Property InstM03LokenStandMarker Auto Const

ObjectReference Property InstM03HiggsStandMarker Auto Const

ReferenceAlias Property Alias_Newton Auto Const

ReferenceAlias Property Alias_Lawrence Auto Const

ReferenceAlias Property Alias_Max Auto Const

ObjectReference Property InstM03HydroDoor Auto Const

;ObjectReference Property InstituteHydroponicsDoorRef Auto Const

Scene Property InstM03NewtonScene0Door Auto Const

Scene Property InstM03LawrenceScene1Window Auto Const

Faction Property InstM03EnemyFaction Auto Const

ReferenceAlias Property Alias_SynthGuard1 Auto Const

ReferenceAlias Property Alias_SynthGuard2 Auto Const

;ObjectReference Property InstM03GorillaDoorRef Auto Const

ReferenceAlias Property Alias_Gorilla1 Auto Const

ReferenceAlias Property Alias_Gorilla2 Auto Const

Faction Property InstM03GorillaFaction Auto Const

Scene Property InstM03ReactGorillas Auto Const

Scene Property InstM03LawrenceScene0SpotPlayer Auto Const

Scene Property InstM03ReactGuardCombat Auto Const

Faction Property InstM03RebelFaction Auto Const

ObjectReference Property HydroponicsControlDoorRef Auto Const

Scene Property InstM03ReactDoor Auto Const

ObjectReference Property InstM03EnterHydropnicsTrigger1 Auto Const

ObjectReference Property InstM03EnterHydropnicsTrigger2 Auto Const

ObjectReference Property ClaytonHoldrenQuartersRef Auto Const

ReferenceAlias Property Alias_Clayton Auto Const

ObjectReference Property DeanVolkertQuartersRef Auto Const

ReferenceAlias Property Alias_Dean Auto Const

ObjectReference Property IsaacKarlinQuartersRef Auto Const

ReferenceAlias Property Alias_Isaac Auto Const

GlobalVariable Property XPMiscQuestFinal Auto Const

Potion Property Mentats Auto Const

Potion Property Jet Auto Const

Potion Property RadAway Auto Const

Key Property InstM03HydroponicsKey Auto Const

ReferenceAlias Property Alias_HydroponicsKey Auto Const

ActorBase Property LawrenceHiggs Auto Const

ObjectReference Property Inst301Playtest1 Auto Const

ObjectReference Property InsGorillaPenDoor Auto Const

ObjectReference Property BioScienceControlRoomTerminalRef Auto Const

ObjectReference Property BioScienceUpperDoorTerminalRef Auto Const

ObjectReference Property BioScienceLowerDoorTerminalRef Auto Const

ReferenceAlias Property Alias_SynthGuard03 Auto Const

ReferenceAlias Property Alias_SynthGuard04 Auto Const

Faction Property InstM03GuardFaction Auto Const

Key Property InstM03SecurityOverridePassword Auto Const

ReferenceAlias Property Alias_UpperTurret01 Auto Const

ReferenceAlias Property Alias_UpperTurret02 Auto Const

ReferenceAlias Property Alias_LowerTurret01 Auto Const

ReferenceAlias Property Alias_LowerTurret02 Auto Const

Faction Property InstituteFaction Auto Const

Faction Property RobotFaction Auto Const

Scene Property InstM03GorillasEscape Auto Const

Scene Property InstM03HiggsReassure Auto Const

ObjectReference Property InstituteMapMarker Auto Const

ActorBase Property MaxLoken Auto Const

ReferenceAlias Property Alias_Brendan Auto Const

ReferenceAlias Property Alias_Holotape Auto Const

Quest Property InstM03Post Auto Const

ObjectReference Property InstM03GorillaHabitat2 Auto Const

ObjectReference Property InstM03GorillaHabitat1 Auto Const

ObjectReference Property InstituteScientistMaleBioSciRef Auto Const

ObjectReference Property InstituteScientistFemaleBioSciRef Auto Const

ObjectReference Property InstituteAliasBioSci1 Auto Const

ObjectReference Property InstituteAliasBioSci2 Auto Const

ReferenceAlias Property Alias_GenericScientistMale Auto Const

ReferenceAlias Property Alias_GenericScientistFemale Auto Const

Quest Property DialogueInstituteHiggsCourser1 Auto Const

Faction Property InstituteCommonFurniture Auto Const

MusicType Property MUSDreadShort Auto Const

ObjectReference Property BoS203LaserGateRef02 Auto Const Mandatory

ObjectReference Property BoS203LaserGateRef Auto Const Mandatory

ObjectReference Property BoS203LGateTermRef Auto Const Mandatory

ObjectReference Property BoS203LGateTerm02Ref Auto Const Mandatory

Quest Property DialogueInstituteLokenAyo1 Auto Const Mandatory

Faction Property CrimeInstitute Auto Const Mandatory

ObjectReference Property InstM03SynthGuardHallway1 Auto Const Mandatory

ObjectReference Property InstM03SynthGuardHallway2 Auto Const Mandatory

ObjectReference Property InstM03SynthGuard1Ref Auto Const Mandatory

ObjectReference Property InstM03SynthGuard2Ref Auto Const Mandatory

Quest Property Inst308 Auto Const Mandatory

ActorBase Property NewtonOberly Auto Const Mandatory
