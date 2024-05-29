;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS11_00022A02 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Put one of the mercs in the guarding the chip package
Alias_MercOnChipWatch.ForceRefTo(Alias_GenericMerc.GetAt(0))
;pMS11IronsidesRobotsFaction.SetAlly(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Test on player
objectReference objSelf = Game.GetPlayer()
kmyQuest.nAuxPowerSoundID = pQSTMS11PowerOnLPM.Play(objSelf )
Sound.SetInstanceVolume(kmyQuest.nAuxPowerSoundID, 3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

; Fire the intercom
pMS11_0050_Ironsides_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
pMS11_0060_Constitution_Scene_1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
pMS11_0070_Constitution_Scene_2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;pMS11_0080_Constitution_Scene_3.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Met Ironsides
SetObjectiveCompleted(100)

; Enable Boat Elevator
(Alias_BoatElevatorControl.GetReference() as DN029ElevatorControl).AllowUse()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
; The Bad Guys attack
pDN029FirstWave.SetStage(0)

; Ironsides warns everyone about the scavengers incoming
pMS11_0170_Attack.Start()

; Optional Objective to use the cannons
SetObjectiveDisplayed(173)

; Make it so the combat music plays non-stop (sounds better than cutting in and out)
pMUSzCombat.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0173_Item_00
Function Fragment_Stage_0173_Item_00()
;BEGIN CODE
;Enable optional objective to use the cannons.
SetObjectiveDisplayed(173)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Ironsides reacts to the skirmishers being killed
pMS11_0170a_AttackDone.Start()
SetObjectiveCompleted(173)

SetObjectiveCompleted(205)
SetObjectiveDisplayed(200)

; Kill the combat music
pMUSzCombat.Remove()

; Failsafe to remove combat music on location change
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Show the objective
SetObjectiveCompleted(100)
SetObjectiveDisplayed(205, true)
SetObjectiveDisplayed(210, true)

; Radiantly choose the right location for the components
pMS11StartEvent.SendStoryEvent()

; TODO: The scavenger attack should feel organically timed
;Utility.Wait(3.0)
SetStage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Give the player a bonus if he negotiated for it
if ( GetStageDone(152) )
  Game.GivePlayerCaps(200)
elseif ( GetStageDone(151) )
  Game.GivePlayerCaps(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives updated
SetObjectiveCompleted(200)
if ( GetStageDone(310) )   ; Do you already have the Guidance Chip?
  SetObjectiveDisplayed(310, true)   ; If so, install it
else
  SetObjectiveDisplayed(300, true)   ; Otherwise find it
endif

; Refresh Mandy's package (so she greets the player)
pMandy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Show objective
if ( GetStageDone(300) )   ; Are you looking for it?
  SetObjectiveDisplayed(310, true)
  SetObjectiveCompleted(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; Set up objectives
SetObjectiveCompleted(310)
SetObjectiveDisplayed(320, true)

; Show a confirmation box
;pMS11GuidanceBoardConfirmationMessage.Show()
ObjectReference oGuidanceChip = Alias_RepairGuidanceChip.GetReference()
oGuidanceChip.PlayAnimation("Stage2")
oGuidanceChip.BlockActivation(TRUE, TRUE)

; Remove the Guidance Chip from the player's inventory
Game.GetPlayer().RemoveItem(Alias_QuestObject_GuidanceChip.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
; Give some XPs
;int nReward = (pXPMiscQuestSmall.GetValue())  as Int
;Game.RewardPlayerXP(nReward)

; And other loot
Game.GivePlayerCaps(250)

; Set up objectives
SetObjectiveCompleted(320)

; TODO: Remove this snippet if it feels good to get rewarded mid-conversation
; Get next goal
; SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(350)

; First Mandy conversation is over now
SetStage(395)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(350)

; Let the player loot things from the scavengers
Game.GetPlayer().AddToFaction(pMS11ScavengersOwnerFaction)

; Potentially down the line may add an objective here

; First Mandy conversation is over now
SetStage(395)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
; Now make the player hostile
pMS11ScavengersNPCFaction.SetEnemy(pPlayerFaction)

; First Mandy conversation is over now
SetStage(395)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
if ( GetStageDone(410) )   ; Do you already have the Radar Transmitter?
  SetObjectiveDisplayed(410, true)   ; If so, install it
else
  SetObjectiveDisplayed(400, true)   ; Otherwise find it
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Objectives
if ( GetStageDone(400) )   ; Do you know about the quest?
  SetObjectiveDisplayed(410, true)
  SetObjectiveCompleted(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Show the appropriate confirmation message
( Alias_RepairRadarTransmitter.GetReference()).GetLinkedRef().EnableNoWait()
pMS11GuidanceRadarJuryrigMessage.Show()

; Set the final stage
SetStage(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
; Set up objectives
SetObjectiveCompleted(400)
SetObjectiveCompleted(410)
SetObjectiveDisplayed(440, true)

; If the transmitter wasn't jury rigged, then show the replace confirmation box
; Also, remove the transmitter from the player's inventory
if ( !IsStageDone(420) )
  ( Alias_RepairRadarTransmitter.GetReference()).GetLinkedRef().EnableNoWait()
  pMS11GuidanceRadarReplacedMessage.Show()
  Game.GetPlayer().RemoveItem(Alias_QuestObject_RadarTransmitter.GetRef())
  
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
; Give some XPs
;int nReward = (pXPMiscQuestSmall.GetValue())  as Int
;Game.RewardPlayerXP(nReward)

; Give loot
Game.GivePlayerCaps(250)

; Set up objectives
SetObjectiveCompleted(440)

; If the Navigator's quests are done - go to Ironsides' quest
if ( GetStageDone(640) )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(210)
SetObjectiveDisplayed(510, true)

;if ( )
  SetObjectiveDisplayed(500)
;endif

; Make it so you can interact with the power cables now
keyword kKey
(Alias_RepairPowerCable1.GetReference()).GetLinkedRefChildren(kKey)[0].BlockActivation(FALSE)
(Alias_RepairPowerCable2.GetReference()).GetLinkedRefChildren(kKey)[0].BlockActivation(FALSE)
(Alias_RepairPowerCable3.GetReference()).GetLinkedRefChildren(kKey)[0].BlockActivation(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
; TODO: Remove this once we have a proper work bench
Game.GetPlayer().AddItem(pMS11NewCables, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(510, true)
SetObjectiveCompleted(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
; Show the appropriate confirmation message
pMS11PowerCableJuryrigMessage.Show()

; Set the final stage
SetStage(530)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0521_Item_00
Function Fragment_Stage_0521_Item_00()
;BEGIN CODE
; Show the appropriate confirmation message
( Alias_RepairPowerCable1.GetReference()).GetLinkedRef().EnableNoWait()
( Alias_RepairPowerCable1.GetReference()).GetLinkedRef().GetLinkedRef().BlockActivation(TRUE,TRUE)
pMS11PowerCableJuryrigMessage.Show()
( Alias_RepairPowerCable1.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)

SetStage(522)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0522_Item_00
Function Fragment_Stage_0522_Item_00()
;BEGIN CODE
; Increment the Power Cable
ModObjectiveGlobal(1.0, pMS11PowerCablesFixed)
UpdateCurrentInstanceGlobal(pMS11PowerCablesFixed)  ; Force the objective to update for the new value
SetObjectiveDisplayed(510, TRUE, TRUE) 

; If the cables weren't jury rigged, then show the replace confirmation box
; Also, remove the power cables from the player's inventory
if ( !IsStageDone(521) )
 ( Alias_RepairPowerCable1.GetReference()).GetLinkedRef().EnableNoWait()
 ( Alias_RepairPowerCable1.GetReference()).GetLinkedRef().GetLinkedRef().BlockActivation(TRUE,TRUE)
  pMS11PowerCableReplacedMessage.Show()
  utility.Wait(0.5)
 ( Alias_RepairPowerCable1.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)
  Game.GetPlayer().RemoveItem(pMS11NewCables)
endif

if ( pMS11PowerCablesFixed.GetValueInt() == 3 )
  SetStage(530)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0523_Item_00
Function Fragment_Stage_0523_Item_00()
;BEGIN CODE
; Show the appropriate confirmation message
( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().EnableNoWait()
( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().GetLinkedRef().BlockActivation(TRUE,TRUE)
pMS11PowerCableJuryrigMessage.Show()
utility.Wait(0.5)
( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)

SetStage(524)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0524_Item_00
Function Fragment_Stage_0524_Item_00()
;BEGIN CODE
; Increment the Power Cable
ModObjectiveGlobal(1.0, pMS11PowerCablesFixed)
UpdateCurrentInstanceGlobal(pMS11PowerCablesFixed)  ; Force the objective to update for the new value
SetObjectiveDisplayed(510, TRUE, TRUE) 

; If the cables weren't jury rigged, then show the replace confirmation box
; Also, remove the power cables from the player's inventory
if ( !IsStageDone(523) )
  ( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().EnableNoWait()
  ( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)
  ( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().GetLinkedRef().BlockActivation(TRUE,TRUE)
  pMS11PowerCableReplacedMessage.Show()
  utility.Wait(0.5)
  ( Alias_RepairPowerCable2.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)
  Game.GetPlayer().RemoveItem(pMS11NewCables)
endif

if ( pMS11PowerCablesFixed.GetValueInt() == 3 )
  SetStage(530)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
; Show the appropriate confirmation message
( Alias_RepairPowerCable3.GetReference()).GetLinkedRef().EnableNoWait()
( Alias_RepairPowerCable3.GetReference()).GetLinkedRef().GetLinkedRef().BlockActivation(TRUE,TRUE)
pMS11PowerCableJuryrigMessage.Show()
utility.Wait(0.5)
( Alias_RepairPowerCable3.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)

SetStage(526)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0526_Item_00
Function Fragment_Stage_0526_Item_00()
;BEGIN CODE
; Increment the Power Cable
ModObjectiveGlobal(1.0, pMS11PowerCablesFixed)
UpdateCurrentInstanceGlobal(pMS11PowerCablesFixed)  ; Force the objective to update for the new value
SetObjectiveDisplayed(510, TRUE, TRUE) 

; If the cables weren't jury rigged, then show the replace confirmation box
; Also, remove the power cables from the player's inventory
if ( !IsStageDone(525) )
  ( Alias_RepairPowerCable3.GetReference()).GetLinkedRef().EnableNoWait()
  ( Alias_RepairPowerCable3.GetReference()).GetLinkedRef().GetLinkedRef().BlockActivation(TRUE,TRUE)
  pMS11PowerCableReplacedMessage.Show()
  utility.Wait(0.5)
  ( Alias_RepairPowerCable3.GetReference()).GetLinkedRef().GetLinkedRef().SetOpen(FALSE)
  Game.GetPlayer().RemoveItem(pMS11NewCables)
endif

if ( pMS11PowerCablesFixed.GetValueInt() == 3 )
  SetStage(530)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)
SetObjectiveCompleted(510)
SetObjectiveDisplayed(540, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
; Give some XPs
;int nReward = (pXPMiscQuestSmall.GetValue())  as Int
;Game.RewardPlayerXP(nReward)

; Set up objectives
SetObjectiveCompleted(540)

; Set up the next part of the quest
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Show the find the component objectives
SetObjectiveDisplayed(600, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; Objectives
;SetObjectiveDisplayed(610, true)
;SetObjectiveCompleted(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
; Show the appropriate confirmation message
(Alias_RepairPowerRelay.GetReference()).GetLinkedRef().EnableNoWait()
pMS11PowerRelayRepairMessage.Show()

; Set the final stage
SetStage(630)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
; If the relay coil wasn't repaired, then show the replace confirmation box
; Also, remove the power cables from the player's inventory
if ( !IsStageDone(620) )
  (Alias_RepairPowerRelay.GetReference()).GetLinkedRef().EnableNoWait()
  pMS11PowerRelayReplacedMessage.Show()
  Game.GetPlayer().RemoveItem(pMS11PowerRelayCoil)
endif

; Objectives
SetObjectiveCompleted(600)
SetObjectiveCompleted(610)
SetObjectiveDisplayed(640, true)

; Transition sound
;pQSTMS11GeneratorPowerOn.Play(Alias_RepairPowerRelay.GetRef())

; Switch the power sound to the fixed state
pMS11PowerFixedEnableMarker.Disable()

; Turn on the lights on the ship
pUSSConstLightsOn.Enable()
pUSSConstLightsOff.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
; Give some XPs
;int nReward = (pXPMiscQuestSmall.GetValue())  as Int
;Game.RewardPlayerXP(nReward)

; Set up objectives
SetObjectiveCompleted(640)

; If the Bosun's quests are done - go to Ironsides' quest
if ( GetStageDone(440) )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(700, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(700)

if ( GetStageDone(720) )   ; Do you already have the Bearings?
  SetObjectiveDisplayed(720, true)   ; If so, install it
else
  SetObjectiveDisplayed(710, true)   ; Otherwise find it
endif

; Receive the key to the Captain's Quarters
Game.GetPlayer().AddItem(pMS11CaptainsQuartersKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
; Objectives
if ( GetStageDone(710) )  ; Do you know about the quest?
  SetObjectiveCompleted(710)
  SetObjectiveDisplayed(720, true)
endif

; If the player is working with the Scavengers, give them an additional objective
if ( GetStageDone(380) )
  SetObjectiveDisplayed(730, true)
  SetStage(721)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0724_Item_00
Function Fragment_Stage_0724_Item_00()
;BEGIN CODE
; Give the PC the extra reward
Game.GivePlayerCaps(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0728_Item_00
Function Fragment_Stage_0728_Item_00()
;BEGIN CODE
; Remove old quest objective
SetObjectiveCompleted(730, false)

; Kick the player out of the old faction
Game.GetPlayer().RemoveFromFaction(pMS11ScavengersOwnerFaction)

; Now make the player hostile
pMS11ScavengersNPCFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
; Remove the Turbopump Bearrings
Game.GetPlayer().RemoveItem(pMS11Turbopump,1,true)

; Add the sabotaged component (which was disabled on Davies)
ObjectReference oSabotagedBearing = Alias_QuestObject_SabotagedTurbopumpBearings.GetRef()
oSabotagedBearing.Enable()
Game.GetPlayer().AddItem(oSabotagedBearing)
;pDavies.GetActorRef().RemoveItem(oSabotagedBearing, 1, false, Game.GetPlayer())

; Toggle objectives
SetObjectiveCompleted(720)
SetObjectiveCompleted(730)
SetObjectiveDisplayed(735, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(720)
SetObjectiveCompleted(730)
SetObjectiveDisplayed(740, true)

; Show a confirmation box
if ( GetStageDone(730) )    ; Check to see if it has been sabotaged
  pMS11TurbopumpSabotageMessage.Show()
  ; And show this objective as completed
  SetObjectiveCompleted(735, true)
else
  pMS11TurbopumpReplacedMessage.Show()
  ;SetObjectiveDisplayed(338, true)
  ;SetObjectiveCompleted(338, true)
  pMS11IronsidesRobotsFaction.SetAlly(pPlayerFaction)  ; And now you're allies with the robots
endif

; Remove the Turbopump Bearings from the player's inventory
Game.GetPlayer().RemoveItem(Alias_QuestObject_TurbopumpBearings.GetRef())
Game.GetPlayer().RemoveItem(pMS11TurbopumpSabotaged)

; Show the turbopump in game
ObjectReference oTurbo = pMS11TurbopumpPlaced
oTurbo.Enable()
oTurbo.BlockActivation(TRUE, TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
; Give some XPs
;int nReward = (pXPMiscQuestSmall.GetValue())  as Int
;Game.RewardPlayerXP(nReward)

; Objectives
SetObjectiveCompleted(740)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
;Game.ShakeCamera(Game.GetPlayer(),1,0.5)
;int instanceID = FXExplosionCarNukeDistA.play(Game.GetPlayer())  
;Sound.SetInstanceVolume(instanceID, 1)
DN029SecondWaveA.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Show the objective
SetObjectiveDisplayed(800, true)

; Now make the Scavenger faction hostile to the player
pMS11ScavengersNPCFaction.SetEnemy(pPlayerFaction)

; Start second attack, with player working with Ironsides
;DN029SecondWaveA.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Ironsides comments on 
;pMS11_0810_WeHaveBoarders.Start()  ;Now calling from script on DN029SecondWaveA quest so it can be repeated.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
;Ironsides lets the player know that the scavengers have entered the ship.
pMS11_0820_BoardersAreInside.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN CODE
;Only set if the player successfully defends the ship while never entering the interior.
SetStage(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; TODO: Remove this once there's an actual fight
;pTempMessageCannon.Show()

pMS11_0170a_AttackDone.Start()

; Mark the objective complete
SetObjectiveCompleted(800, true)

; Show the objective
SetObjectiveDisplayed(850, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(800)
SetObjectiveCompleted(850)
SetObjectiveDisplayed(925)

; Rewards
Game.GivePlayerCaps(1500)
Game.GetPlayer().AddItem(pLL_Broadsider)

; Make it so that cannon ball ammo starts showing up in stores
pBroadsiderAmmoAvailable.SetValue(0.0)

; Set the stage queuing up the circuit breaker
SetStage(910)

; OBSOLETE - Remnant of when it needed to be powered up
; See if the power has already been hooked up - toggle the right objective
;if ( GetStageDone(925) )
;   SetObjectiveDisplayed(925, true)
;else
;   SetObjectiveDisplayed(900, true)
;endif

; ENGINE START SEQUENCE
Utility.Wait(3.0)

; Start up the sound
objectReference objSelf = pMS11EngineNoiseMarker01
kmyQuest.nEngineSoundID01 = pQSTMS11BoatEngineIdleExtLPM.Play(objSelf )

; TODO: Fire up the engine VFX
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; WHEN IT USED TO BE POWERED UP
; 927 controls whether the power can be flipped
;if ( GetStageDone(925) )
;   SetStage(927)
;endif

; Make it so the power conduit can be turned on
(Alias_CircuitBreaker.GetReference() as CircuitBreakerMasterScript).DenyOnPosition = FALSE

;Swap the ship to get ready for launch/engine-explosion
kmyquest.FirstShipSwap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
; Ironsides starts his countdown speech
pMS11_0700_IronsidesCountdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN CODE
; If the quest is in the right stage - then update objectives
if ( GetStageDone(900) )
  SetObjectiveCompleted(900)
  SetObjectiveDisplayed(925, true)

   ; 927 controls whether the power can be flipped
   SetStage(927)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0927_Item_00
Function Fragment_Stage_0927_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
(Alias_CircuitBreaker.GetReference() as CircuitBreakerMasterScript).DenyOnPosition = FALSE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Complete the objective
;SetObjectiveCompleted(900, true)
SetObjectiveCompleted(925)


if ( GetStageDone(730) )
   Alias_AnimatedShip.GetReference().DisableNoWait()
   SetObjectiveDisplayed(1090, true)  ; !!!! Remap to the proper stage
else
   ;Swap the ship to get ready for launch, since we are doing it for sure
   kmyquest.SecondShipSwapToLaunch()
endif

; Disable Boat Elevator
(Alias_BoatElevatorControl.GetReference() as DN029ElevatorControl).DisallowUse()

; And block the hatch below
if ( !GetStageDone(730) )   ; But only if you haven't sabotaged them
  pConstitutionEntranceDoor.BlockActivation()
endif

; Make the scene react
pMS11_0920_IronsidesCountdown.Stop()
Utility.Wait(0.1)
pMS11_0920_IronsidesCountdown.Start()

; Fully fire up the rockets
Utility.Wait(3.0)
; TODO: Make the engines go fully on

; Start the auxiliary power sound right
objectReference objSelf = Alias_FinalPower.GetRef()
kmyQuest.nAuxPowerSoundID = pQSTMS11PowerOnLPM.Play(objSelf )
;Sound.SetInstanceVolume(kmyQuest.nAuxPowerSoundID, 3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
;Update Global for Radio News
RadioDCMS11Ready.SetValue((GameDaysPassed.GetValue() + 1))

; Kill the engine sound
Sound.stopinstance(kmyQuest.nEngineSoundID01)
Sound.stopinstance(kmyQuest.nAuxPowerSoundID)

; Launch Ship
kmyquest.LaunchShip()

; Play the rocket sound
;int instanceID = pQSTMS11RocketFire.play(Game.GetPlayer())  
;Sound.SetInstanceVolume(instanceID, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
Utility.Wait(3.0)
debug.Trace("MS11 SetStage 975")

; Move the robots to their new locations
Alias_Ironsides.GetActorRef().MoveTo(pMS11IronsidesEndMarker)
Alias_MrNavigator.GetActorRef().MoveTo(pMS11NavigatorEndMarker)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(800)
if ( !GetStageDone(1275) )
  SetObjectiveDisplayed(1000)
else
  SetObjectiveDisplayed(925)
endif

; Rewards
Game.GivePlayerCaps(500)

; Set the stage queuing up the circuit breaker
SetStage(910)

; ENGINE START SEQUENCE
Utility.Wait(3.0)

; Start up the sound
int mySoundID
objectReference objSelf = pMS11EngineNoiseMarker01
kmyQuest.nEngineSoundID01 = pQSTMS11BoatEngineIdleExtLPM.Play(objSelf )

; TODO: Fire up the engine VFX
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
; Hide old objectives
SetObjectiveCompleted(1000)

; Show the objective (if the switch hasn't already been flipped)
if ( !GetStageDone(930) )
  SetObjectiveDisplayed(925, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
Game.ShakeCamera(Game.GetPlayer(), 0.5, 1.5)
Game.ShakeController(0.5, 0.5, 1.5)
Alias_MS11Engine.GetReference().DamageObject(100)
Alias_ShipPreLaunch.GetReference().PlayAnimation("Stage4")

; Objectives
SetObjectiveCompleted(925)
SetObjectiveDisplayed(1100)

; Hide the talk to Mandy objective if you skipped it
if ( !GetStageDone(1010) )
  SetObjectiveDisplayed(1000, FALSE)
endif

; Disable Boat Elevator
(Alias_BoatElevatorControl.GetReference() as DN029ElevatorControl).DisallowUse()

; Now the scavengers attack
SetStage(1100)

; Kill the engine sound
Sound.stopinstance(kmyQuest.nEngineSoundID01)
Sound.stopinstance(kmyQuest.nAuxPowerSoundID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Hide old objectives
SetObjectiveCompleted(900)

; Show the objective
SetObjectiveDisplayed(1100, true)

; TODO: All of the scavengers attack
pMandy.GetActorReference().EvaluatePackage()
pDavies.GetActorReference().EvaluatePackage()

; The player is hostile to the robots now
pMS11IronsidesRobotsFaction.SetEnemy(pPlayerFaction)

; Start attack with the player on the Scavengers side
if ( !GetStageDone(1275) )    ; Mandy's still alive, right?
  DN029SecondWaveA.SetStage(100)
endif

; Remove Ironsides' protected status - anyone can kill him now
Alias_Ironsides.GetActorRef().GetActorBase().SetProtected(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN CODE
; BIG IF STATEMENT - If you kill Ironsides during the right part of the quest, do a bunch of stuff
if ( GetStageDone(1050) && GetStageDone(1275) )    ; Did you blow up the rockets? And is Mandy or Davies dead?
  ; Objectives
  SetObjectiveCompleted(1100)
  SetStage(1300)   ; And end the quest
elseif ( GetStageDone(1050) )  ; Did you blow up the rockets? 
  ; Mark the objective complete
  SetObjectiveCompleted(1100, true)
  SetObjectiveDisplayed(1190)

  SetStage(1195)   ; show the proper log file

  ; TODO: If all the scavengers are dead, quest completes
  ; TODO: The surviving scavengers come up to talk with you
  pMS11_1190_Scene.Start()
else
  ; OR.... If you weren't on that part of the quest, fail the quest
  SetStage(9000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1190, true)
SetObjectiveDisplayed(1200, true)

; Stop both attack quests
DN029SecondWaveA.Stop()
DN029SecondWaveB.Stop()

; Now make the player hostile
Game.GetPlayer().RemoveFromFaction(pMS11ScavengersOwnerFaction)
pMS11ScavengersNPCFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
; Check to see if the player is at the right point of the quest
if ( GetStageDone(1200) )
   SetStage(1300)     ; If so end MS11
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1275_Item_00
Function Fragment_Stage_1275_Item_00()
;BEGIN CODE
; Flag that someone has died in the Scavenger group
SetStage(393)

; Stop both attack quests  (Commented out, caused both attacks to stop prematurely, borking everything.
;DN029SecondWaveA.Stop()
;DN029SecondWaveB.Stop()

; Now make the player hostile to the scavengers
Game.GetPlayer().RemoveFromFaction(pMS11ScavengersOwnerFaction)
pMS11ScavengersNPCFaction.SetEnemy(pPlayerFaction)

; Has the player sabotaged the turbopump? The player hasn't been betrayed, right?
if ( GetStageDone(730) && !GetStageDone(1200) )

  ; Ironsides is dead?
  if ( GetStageDone(1190) )  
    SetObjectiveDisplayed(1190, FALSE)   ; Hide the objective
    SetStage(1300)  ; End the quest

  ; Going to talk to Mandy?
  elseif ( GetStageDone(1000) )  
    SetStage(1010)  ; In which case complete "talking" with her
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Complete all objectives
CompleteAllObjectives()

;Show the objective
SetObjectiveDisplayed(1300, true)

;Update Global for Radio News
RadioDCMS11Ready.SetValue((GameDaysPassed.GetValue() + 1))

; Give some XPs
;int nReward = (pXPMiscQuestFinal.GetValue())  as Int
;Game.RewardPlayerXP(nReward)

; End quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1399_Item_00
Function Fragment_Stage_1399_Item_00()
;BEGIN AUTOCAST TYPE ms11script
Quest __temp = self as Quest
ms11script kmyQuest = __temp as ms11script
;END AUTOCAST
;BEGIN CODE
; Turn off all the radios
int i = 0
Debug.Trace("MS11 Ending")
while i < Alias_MS11Radios.GetCount()
    ObjectReference theRef = Alias_MS11Radios.GetAt(i)
    Debug.Trace("Radio: " + theRef)
    if theRef
      theRef.SetRadioOn(FALSE)
    endif
  i += 1		
endWhile

; Stop both attack quests
DN029SecondWaveA.Stop()
DN029SecondWaveB.Stop()

; Stop the engine sounds
Sound.StopInstance(kmyQuest.nEngineSoundID01)
Sound.StopInstance(kmyQuest.nEngineSoundID02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8990_Item_00
Function Fragment_Stage_8990_Item_00()
;BEGIN CODE
if ( !GetStageDone(1050) )    ; Are you supposed to be killing these guys?
  ; The player is hostile to the robots now
  pMS11IronsidesRobotsFaction.SetEnemy(pPlayerFaction)
  
  SetStage(9000)                    ; If not, fail quest
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Kill some scenes that may be running
pMS11_0700_IronsidesCountdown.Stop()

; Remove the sabotaged component
ObjectReference oSabotagedBearing = Alias_QuestObject_SabotagedTurbopumpBearings.GetRef()
Game.GetPlayer().RemoveItem(oSabotagedBearing, 1, TRUE)

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property pPlayerFaction Auto Const
Faction Property pMS11ScavengersOwnerFaction Auto Const
Faction Property pMS11ScavengersNPCFaction Auto Const
Faction Property pMS11IronsidesRobotsFaction Auto Const

Message Property pMS11GuidanceBoardMessage Auto Const
Message Property pMS11GuidanceRadarMessage Auto Const
Message Property pMS11PowerCableMessage Auto Const
Message Property pMS11PowerRelayMessage Auto Const
Message Property pMS11TurbopumpMessage Auto Const
Message Property pMS11GuidanceBoardConfirmationMessage Auto Const
Message Property pMS11GuidanceRadarJuryrigMessage Auto Const
Message Property pMS11GuidanceRadarReplacedMessage Auto Const
Message Property pMS11PowerCableJuryrigMessage Auto Const
Message Property pMS11PowerCableReplacedMessage Auto Const
Message Property pMS11PowerRelayRepairMessage Auto Const
Message Property pMS11PowerRelayReplacedMessage Auto Const
Message Property pMS11TurbopumpReplacedMessage Auto Const
Message Property pMS11TurbopumpSabotageMessage Auto Const

Scene Property pMS11_0050_Ironsides_Intro Auto Const
Scene Property pMS11_0060_Constitution_Scene_1 Auto Const
Scene Property pMS11_0070_Constitution_Scene_2 Auto Const
Scene Property pMS11_0080_Constitution_Scene_3 Auto Const
Scene Property pMS11_0700_IronsidesCountdown Auto Const
Scene Property pMS11_1190_Scene Auto Const

ReferenceAlias Property pMandy Auto Const
ReferenceAlias Property pDavies Auto Const
ReferenceAlias Property Alias_QuestObject_RadarTransmitter Auto Const
ReferenceAlias Property Alias_QuestObject_GuidanceChip Auto Const
ReferenceAlias Property Alias_QuestObject_TurbopumpBearings Auto Const

Keyword Property pMS11StartEvent Auto Const

MiscObject Property pMS11NewCables Auto Const
MiscObject Property pMS11PowerRelayCoil Auto Const

MiscObject Property pMS11TurbopumpSabotaged Auto Const

bool Function MS11RepairCheck()

	int bRepairCount

	; Check to see what systems have been repaired
	if ( GetStageDone(318) )
		bRepairCount += 1
	endif
	if ( GetStageDone(328) )
		bRepairCount += 1
	endif
	if ( GetStageDone(338) )
		bRepairCount += 1
	endif
	if ( GetStageDone(348) )
		bRepairCount += 1
	endif
	if ( GetStageDone(358) )
		bRepairCount += 1
	endif

	; Check to see if 5 systems have been repaired, if so return TRUE
	if ( bRepairCount == 5 )
		return true
	else
		return false
	endif

EndFunction



MiscObject Property pMS11Turbopump Auto Const

Scene Property pMS11_0170_Attack Auto Const

GlobalVariable Property pMS11PowerCablesFixed Auto Const

Quest Property pDN029FirstWave Auto Const

Scene Property pMS11_0170a_AttackDone Auto Const

Quest Property DN029SecondWaveA Auto Const

Quest Property DN029SecondWaveB Auto Const

ReferenceAlias Property Alias_BoatElevatorControl Auto Const

ReferenceAlias Property Alias_PostQuestSwapMarker Auto Const

ReferenceAlias Property Alias_AnimatedShip Auto Const

ReferenceAlias Property Alias_Lookout Auto Const

ReferenceAlias Property Alias_MrNavigator Auto Const

ObjectReference Property pMS11NavigatorEndMarker Auto Const

ObjectReference Property pMS11IronsidesEndMarker Auto Const

ReferenceAlias Property Alias_Ironsides Auto Const

Scene Property pMS11_0810_WeHaveBoarders Auto Const

Key Property pMS11CaptainsQuartersKey Auto Const

ReferenceAlias Property Alias_FinalPower Auto Const

Scene Property pMS11_0820_BoardersAreInside Auto Const

RefCollectionAlias Property Alias_GenericMerc Auto Const

ReferenceAlias Property Alias_MercOnChipWatch Auto Const

ReferenceAlias Property Alias_RepairGuidanceChip Auto Const

sound Property FXExplosionCarNukeDistA Auto Const

Scene Property pMS11_0920_IronsidesCountdown Auto Const

ReferenceAlias Property Alias_CircuitBreaker Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS11Ready Auto Const

ReferenceAlias Property Alias_QuestObject_SabotagedTurbopumpBearings Auto Const

ObjectReference Property pConstitutionEntranceDoor Auto Const

sound Property pQSTMS11RocketFire Auto Const

ReferenceAlias Property Alias_RepairPowerCable1 Auto Const

ReferenceAlias Property Alias_RepairPowerCable2 Auto Const

ReferenceAlias Property Alias_RepairPowerCable3 Auto Const

ReferenceAlias Property Alias_RepairPowerRelay Auto Const

ReferenceAlias Property Alias_RepairRadarTransmitter Auto Const

RefCollectionAlias Property Alias_MS11Radios Auto Const

sound Property pQSTMS11BoatEngineIdleExtLPM Auto Const

ObjectReference Property pMS11EngineNoiseMarker01 Auto Const

ObjectReference Property pMS11EngineNoiseMarker02 Auto Const


sound Property pQSTMS11PowerOn Auto Const

ObjectReference Property pMS11PowerFixedEnableMarker Auto Const

sound Property pQSTMS11GeneratorPowerOn Auto Const

ObjectReference Property pUSSConstLightsOn Auto Const

ObjectReference Property pUSSConstLightsOff Auto Const

sound Property pQSTMS11PowerOnLPM Auto Const

GlobalVariable Property pBroadsiderAmmoAvailable Auto Const

ReferenceAlias Property Alias_ShipPreLaunch Auto Const

ReferenceAlias Property Alias_MS11Engine Auto Const

ReferenceAlias Property Alias_ShipPreQuest Auto Const

ObjectReference Property pMS11TurbopumpPlaced Auto Const

MusicType Property pMUSzCombat Auto Const

LeveledItem Property pLL_Broadsider Auto Const Mandatory
