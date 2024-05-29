;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR02_0006FA37 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Finish up the previous quest
pRR101.SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE RR102Script
Quest __temp = self as Quest
RR102Script kmyQuest = __temp as RR102Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; Make the quest active
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; And close the bookcase
pRR102HiddenBookcaseDoor.SetOpen(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Show the objective
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; NOTE: This is not set 100% of the time
;             The "Said No To Dez" path doesn't go through this.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
RegisterForRemoteEvent(Alias_Deacon,"OnUnload")

; Show the objective
SetObjectiveCompleted(50)
SetObjectiveDisplayed(150)

; Enable Ricky Dalton
Alias_RickyDalton.GetActorRef().Enable()

; Enable the bad guys in Facility X
pRR102EncounterEnableMarker.Enable()

; Deacon is now essential and an ally
actor aTarg = Alias_Deacon.GetActorRef()
aTarg.GetActorBase().SetEssential(TRUE)
aTarg.AddToFaction(pPlayerFaction)

; Power down the elevator in Switchboard
(pRR102ElevatorMaster as ElevatorMasterScript).MakeElevatorNonFunctional()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Make Deacon run his new package
Alias_Deacon.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0206_Item_00
Function Fragment_Stage_0206_Item_00()
;BEGIN CODE
pRR102_Ambient_106_Watchers.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
pRR102_Ambient_202_DangerRailsign.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
pRR102_Ambient_203_CacheRailsign.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN CODE
pRR102_Ambient_204_FirstTraps.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
pRR102_Ambient_205_SecondTraps.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0216_Item_00
Function Fragment_Stage_0216_Item_00()
;BEGIN CODE
; TODO: Fire this scene if we have a special moment with Deacon - pending a pass by Justin

;pRR102_Ambient_206_SpecialMoves.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0217_Item_00
Function Fragment_Stage_0217_Item_00()
;BEGIN CODE
pRR102_Ambient_207_SpecialMovesReaction.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0218_Item_00
Function Fragment_Stage_0218_Item_00()
;BEGIN CODE
pRR102_Ambient_208_OutsideVault.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0219_Item_00
Function Fragment_Stage_0219_Item_00()
;BEGIN CODE
pRR102_Ambient_209_Elevator.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
pRR102_Ambient_301_ClearMines.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0222_Item_00
Function Fragment_Stage_0222_Item_00()
;BEGIN CODE
if ( !GetStageDone(725)  && !GetStageDone(550) )   ; If you're not on the "Leaving the Switchboard" part of the quest
   ; Close off the Front Entrance quest
   SetObjectiveFailed(410)

   pRR102_Ambient_303_FrontEntranceBookcase.Stop()   ; Stop previous scene
   Utility.Wait(0.1)
   pRR102_Ambient_302_FrontEntranceClosed.Start()       ; Then Deacon complains... loudly
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0223_Item_00
Function Fragment_Stage_0223_Item_00()
;BEGIN CODE
if ( !GetStageDone(725) && !GetStageDone(550) )   ; If you're not on the "Leaving the Switchboard" part of the quest
   pRR102_Ambient_303_FrontEntranceBookcase.Start()   ; Deacon mentions book case
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0224_Item_00
Function Fragment_Stage_0224_Item_00()
;BEGIN CODE
; Start an ambient scene
pRR102_Ambient_224_Fire.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Show objective
SetObjectiveDisplayed(250)

; Complete the previous objective
SetObjectiveCompleted(150)

; Delay just a little bit the ambient scene
Utility.Wait(1.0)
;pRR102_Ambient_101_PostIntro.Start()

;Start Highway Escort Scene
pRR102_Ambient_102_Highway.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Start Highway Escort Scene
pRR102_Ambient_102_Highway.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
; Called from an unload script on Deacon's alias

; End the conversation
pRR102_Ambient_102_Highway.Stop()

; Teleport Deacon to where he is supposed to be
Alias_Deacon.GetActorRef().MoveTo(pRR102DeaconEscortRicky)
Alias_Deacon.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
; TODO: Remove this once Deacon properly follows the player
Alias_Deacon.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Show objective
SetObjectiveDisplayed(300)

; Complete the previous objective
SetObjectiveCompleted(250)

; Give some interum XP
;Game.RewardPlayerXP(pXPFactionSmall.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Ricky gives the player some gifts
Game.GetPlayer().AddItem(pSuperStimpak)
Game.GetPlayer().AddItem(pStimpak, 2)
Game.GetPlayer().AddItem(pMedX)
Game.GetPlayer().AddItem(pPorknBeans, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; NOTE: Ricky has packages set up to get near the Synths and once they're attacked he'll move to help

; Set up Ricky Dalton
actor aTarg = Alias_RickyDalton.GetActorRef()
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.AddToFaction(pPlayerFaction)
aTarg.AddToFaction(pInstituteFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
; Set up Ricky Dalton
actor aTarg = Alias_RickyDalton.GetActorRef()
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.AddToFaction(pPlayerFaction)
aTarg.AddToFaction(pInstituteFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Set up Ricky Dalton
actor aTarg = Alias_RickyDalton.GetActorRef()
aTarg.RemoveFromFaction(pInstituteFaction)
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(400)
SetObjectiveCompleted(300)

; Evaluating Deacon's package since he now is a follower
Followers.FollowerFollow(Alias_Deacon.GetActorRef())
Alias_Deacon.GetActorRef().EvaluatePackage()

; Power down the elevator
(pRR102ElevatorMaster as ElevatorMasterScript).MakeElevatorNonFunctional()

; And close the bookcase
pRR102HiddenBookcaseDoor.SetOpen(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveFailed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Kill the optional objective to go through the Front Entrance if you haven't done it yet
if ( !GetStageDone(420) )
  SetObjectiveDisplayed(410, FALSE);
endif

; Start a conversation with Deacon
pRR102_500_DeaconEntersX.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Open the front door
pRR102FrontSwitchboardGate.SetOpen(TRUE)

; Turn off the failsafe dialog trigger
pRR102FailsafeSceneTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(600)
SetObjectiveCompleted(400)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RR102AtSwitchboardAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
; Is Deacon inside Switchboard?
if ( Alias_Deacon.GetActorRef().IsInLocation(Alias_SwitchboardLocation.GetLocation()) )
  SetStage(600)   ; If so, then make Deacon start talking
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Deacon speaks
pRR02_600_Deacon_In_Base.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; Deacon speaks
pRR02_600_Deacon_In_Base.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; Open the big door
pRR102MegaSecurityDoor.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Wait a second or two then fire the scene
Utility.Wait(5.0)

; Deacon enters the vault and talks
pRR102_700_PrototypeRecovered.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; The player gets the Railroad's unique pistol
ObjectReference oItem = Alias_Carrington.GetActorRef().PlaceAtMe(pLL_Deliverer)
oItem.AttachMod(pmod_Legendary_Weapon_VATSGun)
Game.GetPlayer().AddItem(oItem)
Game.GetPlayer().AddItem(pAmmo10mm, 32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(700)
SetObjectiveCompleted(600)

; Set up Ricky's state
actor aTarg = Alias_RickyDalton.GetActorRef()

int i = 0

if ( GetStageDone(330) && !GetStageDone(360) )  ; Deacon does a suicide run if the outside Synths are alive
  ; Kill some Synths, badly damage another
  while i < 3
     ObjectReference theRef = Alias_SlocumBadGuys.GetAt(i)
     Debug.Trace("RR102/725: " + theRef)
     if theRef
           Debug.Trace("RR102/725: Inside loop.")
           (theRef as Actor).Kill()
     endif
      i += 1		
  endWhile

  aTarg.MoveTo(pRR102RickyTeleportMarker)
  aTarg.GetActorBase().SetEssential(FALSE)
  Utility.Wait(1.0)
  aTarg.Kill() 
else
  aTarg.Disable()    ; Or Ricky just leaves
endif

; Play Deacon's reaction line
pRR102_725_PCGrabbedPrototype.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(700)
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(750)
SetObjectiveCompleted(810)

; And end the quest
SetStage(900)

; Set the global variables
pGlobalRailroad_IsInFaction.SetValue(1)
pGlobalRailroad_JoinedFaction.SetValue(1)
pPA_Global_Material_Railroad.SetValue(1)   ; Player can repaint their power armor now

; Change Carrington to be a full member of the Doctor's faction
Alias_Carrington.GetActorRef().SetFactionRank(pDialogueDoctorsFaction, 0)

; Deacon is now eligible to be a full time companion
Alias_Deacon.GetActorRef().SetAvailableToBeCompanion()

; The player is now a member of the Railroad faction
Game.GetPlayer().SetFactionRank(pRailroadFaction, 0)

; The player can now be kicked out of the Railroad
pRRKickOut.SetStage(50)

; Queue up "Boston After Dark"
pRRM01.SetStage(50)
CarringtonPrototype.ForceRefTo(Alias_CarringtonPrototype.GetRef())

; Open the secret door to the HQ
pRRSecretDoorBrickRef02.SetOpen()
pRRSecretDoorBrickNavcut02.Disable()     ; Kill the nav mesh cutter by the secret door

; Add an achievement
Game.AddAchievement(19)

; Dez walks to the HQ proper
if ( Alias_Desdemona.GetActorRef().GetParentCell() != pRailroadHQ01 )   ; Is the Desdemona already inside the Railroad HQ?
  pRR102_800a_DezToHQ.Start()   ; If not, she goes in and plays a conversation
else

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RR102JoinedRRAV)
  
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(750)
SetObjectiveDisplayed(810)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
; Dez walks to the center and gives a speech
pRR02_800a_Final_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Give final XP
;Game.RewardPlayerXP(pXPFactionFinal.GetValue() as int)

; Make the PC an ally of the Railroad
pPlayerFaction.SetAlly(pRailroadFaction)

;Reveal Railroad HQ Map Marker
pRailroadHQMapMarkerRef.enable()
pRailroadHQMapMarkerRef.addtoMap(true)

; Make the Railroad HQ a fast travel location
pRailroadHQ01.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Disable Ricky Dalton
Alias_RickyDalton.GetActorRef().Disable()

; Deacon is no longer essential and an ally
actor aTarg = Alias_Deacon.GetActorRef()
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.RemoveFromFaction(pPlayerFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; If RR101 is running, fail that
pRR101.SetStage(1300)

; Fail the Act 3 Pick up, too
pRRAct3Pickup.SetStage(9000)

; Fail the quest
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; If Ricky Dalton isn't loaded, then disable him
if ( !Alias_RickyDalton.GetActorRef().Is3DLoaded() )
  Alias_RickyDalton.GetActorRef().Disable()
endif

; Deacon is no longer essential and an ally
actor aTarg = Alias_Deacon.GetActorRef()
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.RemoveFromFaction(pPlayerFaction)

; Fail everything and end
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Deacon Auto Const

FollowersScript Property Followers Auto Const

Scene Property pRR02_600_Deacon_In_Base Auto Const

Scene Property pRR02_700_Deacon_Package_Retreived Auto Const

ObjectReference Property pDeaconHomeMarker Auto Const

Scene Property pRR02_800a_Final_Intro Auto Const

GlobalVariable Property pGlobalRailroad_IsInFaction Auto Const

GlobalVariable Property pGlobalRailroad_JoinedFaction Auto Const

Faction Property pDialogueDoctorsFaction Auto Const

ReferenceAlias Property Alias_Carrington Auto Const

Faction Property pRailroadFaction Auto Const

Scene Property pRR102_600_Deacon_In_Base Auto Const

Scene Property pRR102_500_DeaconEntersX Auto Const

ObjectReference Property pRR102EncounterEnableMarker Auto Const

ObjectReference Property pRR102MegaSecurityDoor Auto Const

Scene Property pRR102_Ambient_101_PostIntro Auto Const

Scene Property pRR102_Ambient_102_FirstRailsign Auto Const

Scene Property pRR102_Ambient_202_DangerRailsign Auto Const

Scene Property pRR102_Ambient_203_CacheRailsign Auto Const

Scene Property pRR102_Ambient_204_FirstTraps Auto Const

Scene Property pRR102_Ambient_205_SecondTraps Auto Const

Scene Property pRR102_Ambient_206_SpecialMoves Auto Const

Scene Property pRR102_Ambient_207_SpecialMovesReaction Auto Const

Scene Property pRR102_Ambient_208_OutsideVault Auto Const

Scene Property pRR102_Ambient_209_Elevator Auto Const

Scene Property pRR102_Ambient_301_ClearMines Auto Const

Scene Property pRR102_Ambient_302_FrontEntranceClosed Auto Const

Potion Property pSuperStimpak Auto Const

Potion Property pStimpak Auto Const

Potion Property pMedX Auto Const

Potion Property pPorknBeans Auto Const

GlobalVariable Property pXPFactionSmall Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

Scene Property pRR102_700_PrototypeRecovered Auto Const

Weapon Property pDeliverer Auto Const

Armor Property pClothesResident3 Auto Const

Outfit Property pResident3WithHat Auto Const

Scene Property pRR102_Ambient_106_Watchers Auto Const

Scene Property pRR102_Ambient_102_Highway Auto Const

Scene Property pRR102_800a_DezToHQ Auto Const

Quest Property pRR101 Auto Const

Ammo Property pAmmo10mm Auto Const

Faction Property pHasBeenCompanionFaction Auto Const

Faction Property pPlayerFaction Auto Const

ReferenceAlias Property Alias_RickyDalton Auto Const

ObjectReference Property pRailroadHQMapMarkerRef Auto Const

Quest Property pRRKickOut Auto Const

Quest Property pRRM01 Auto Const

Quest Property pRRR05 Auto Const

ObjectReference Property pDoorToRailroad Auto Const

Key Property pRRHQKey Auto Const

Cell Property pRailroadHQ01 Auto Const

ObjectReference Property pRRSecretDoorBrickRef02 Auto Const

Scene Property pRR102_Ambient_303_FrontEntranceBookcase Auto Const

ObjectReference Property pRR102RickyTeleportMarker Auto Const

RefCollectionAlias Property Alias_FacilityEntranceBadGuys Auto Const

ActorValue Property pHealth Auto Const

RefCollectionAlias Property Alias_SlocumBadGuys Auto Const

ObjectReference Property pRRSecretDoorBrickNavcut02 Auto Const

Scene Property pRR102_Ambient_224_Fire Auto Const

Faction Property pInstituteFaction Auto Const

ObjectReference Property pRR102FrontSwitchboardGate Auto Const

Scene Property pRR102_725_PCGrabbedPrototype Auto Const

ObjectReference Property pRR102ElevatorMaster Auto Const

LeveledItem Property pLL_Deliverer Auto Const

ObjectReference Property pRR102FailsafeSceneTrigger Auto Const

ObjectReference Property pRR102HiddenBookcaseDoor Auto Const

Quest Property pRRAct3Pickup Auto Const

ReferenceAlias Property CarringtonPrototype Auto Const

ReferenceAlias Property Alias_CarringtonPrototype Auto Const

ObjectMod Property pmod_Legendary_Weapon_VATSGun Auto Const Mandatory

Quest Property pMQ206 Auto Const Mandatory

ReferenceAlias Property Alias_Desdemona Auto Const Mandatory

GlobalVariable Property pPA_Global_Material_Railroad Auto Const Mandatory

LocationAlias Property Alias_SwitchboardLocation Auto Const Mandatory

ActorValue Property COMQC_RR102AtSwitchboardAV Auto Const

ActorValue Property COMQC_RR102JoinedRRAV Auto Const

ObjectReference Property pRR102DeaconEscortRicky Auto Const Mandatory
