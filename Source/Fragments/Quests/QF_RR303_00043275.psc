;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR303_00043275 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
; Temporarily disable ambient conversations in HQ
pRRDisableHQConversations.SetValue(1)    ; TRUE - no more conversations

; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; TODO: Comment these out later - this stage will stop natural progression
pRR101.SetStage(600)
pRR101.SetStage(1100)
pRR101.Stop()
pRR102.SetStage(800)
pRR102.Stop()
;pDialogueRailroad.Stop()
SetStage(50)

; Queue up the right part of Underground Undercover
pRR201.SetStage(1050)

;getting rid of Church Ghouls
pOldNorthChurchGhoulEnabler.Disable()

;Setting up faction hostilities
Game.GetPlayer().AddToFaction(pRailroadFaction)
pRailroadFaction.SetEnemy(pBrotherhoodOfSteelFaction)
pBrotherhoodOfSteelFaction.SetEnemy(pPlayerFaction)

; DEBUG - TODO: Move Desdemona to the proper spot
Utility.Wait(0.1)
Alias_Desdemona.GetActorRef().EvaluatePackage()
Alias_Desdemona.GetActorRef().MoveToPackageLocation()

; Do KickOut on BoS - shoud've happened at Mass Fusion
pBoSKickOut.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; TODO: This is total temp to play the dialog as you fly away from the Prydwen
Alias_Deacon.GetActorRef().MoveTo(Game.GetPlayer())
Alias_TinkerTom.GetActorRef().MoveTo(Game.GetPlayer())

Utility.Wait(0.1)

SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Alias_Deacon.GetActorRef().IgnoreFriendlyHits()
Alias_TinkerTom.GetActorRef().IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
; Keep track of who your companion was for the Prydwen sequence
Alias_PrydwenCompanion.ForceRefTo(Alias_Companion.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Make it so you can't fast travel
pRailroadHQ01.EnableFastTravel(FALSE)

; Safety net - set up faction hostilities
pRailroadFaction.SetEnemy(pBoSAttackingRailroadFaction)
pBoSAttackingRailroadFaction.SetEnemy(pPlayerFaction)

; Enable the Gasbag mechanic
Alias_GasbagMechanic.GetActorRef().Enable()

; Enable Glory's death furniture
pRR303GloryDyingFurniture.Enable()

; End "Underground Undercover"
pRR201.SetStage(1100)

; Make this quest tracked
pRR302.SetActive()

; Play the invasion dialog
pRR303_0110a_ReactToAttack.Start()

; Disable both of the Secret Exit doors
ObjectReference oDoor = pRRHQSecretEntranceDoor
oDoor.SetLockLevel(254)  ; Make them inaccessible
oDoor.Lock()
;oDoor = pRRHQSecretExitDoor
;oDoor.SetLockLevel(254)  ; Make them inaccessible
;oDoor.Lock()

;Enable Escape Tunnel Destroyed Scene
pRR303EscapeTunnelBlownEnableMarker.Enable()

; Make it so all the Railroad people ignore friendly fire for this sequence
int i = 0
while i < Alias_RailroadGenericPeeps.GetCount()
ObjectReference theRef = Alias_RailroadGenericPeeps.GetAt(i)
  if theRef
    theRef.IgnoreFriendlyHits()
   endif
i += 1		
endWhile
Alias_TinkerTom.GetActorRef().IgnoreFriendlyHits()
Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(TRUE)
Alias_Carrington.GetActorRef().IgnoreFriendlyHits()
Alias_Carrington.GetActorRef().GetActorBase().SetEssential(TRUE)
Alias_PAM.GetActorRef().IgnoreFriendlyHits()
Alias_PAM.GetActorRef().GetActorBase().SetEssential(TRUE)

; Disable Glory
Alias_Glory.GetActorRef().Disable()

; Stop all the vertibird quests that could mess up the Prydwen
pREScene_VertibirdKMK01.Stop()
pREScene_VertibirdKMK02.Stop()
pREScene_VertibirdKMK03.Stop()
pRETravel_VertibirdKMK01.Stop()
pRETravel_VertibirdKMK02.Stop()
pREObject_VertibirdKMK01.Stop()
pREObject_VertibirdKMK02.Stop()
pREAssault_VertibirdKMK01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Disable Church Ghouls
pOldNorthChurchGhoulEnabler.Disable()

;Enable Brotherhood Soldiers in Railroad HQ and outside
pRR303OldNorthTriggerEnabler.Enable()
pRR303RRHQBrotherHoodAssaultEnabler.Enable()
pRR303OutsideChurchBrotherhoodEnabler.Enable()

;Use BoSMarshal Quest to bring named BoS guys into the fray
pBoSMarshal.setstage(30)
Alias_SOURCEBrotherhoodAssaultChurchSoldiers.AddRef(Alias_PaladinBrandis.getReference())
Alias_PaladinBrandis.getReference().moveto(pRR303BrandisMarker)
Alias_PaladinBrandis.getReference().disable()


; Wait just a second then make the quest targets appear on them
Utility.Wait(1.0)
pRR302.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Call RR404 - 300 (ready for Dez Debrief)
RR304.SetStage(300)

; If Curie's quest is running then make it so Glory isn't involved anymore
if ( pCOMCurieQuest.IsRunning() )
  pCOMCurieQuest.SetStage(310)
endif

; Move Glory to her spot
actor aGlory = Alias_Glory.GetActorRef()
aGlory.Enable()
aGlory.EvaluatePackage()
Utility.Wait(0.1)
aGlory.GetActorBase().SetProtected(FALSE)
aGlory.GetActorBase().SetEssential(FALSE)
aGlory.AddToFaction(pRR302TempBoSFriends)
pRR303GloryDeathEnabler.Enable()
aGlory.MoveToPackageLocation()

;Put secret door in a state to get ready to explode
pRR303DoorExplodeEnableMarker.Enable()
pRR303DoorTriggerEnableMarker.Enable()

; Make it so that Glory can be killed
pRRKickout.SetStage(75)

; Desdemona starts talking to people
pRR303_Ambient_PostInitialAssault.Start()

; Make it so all the Railroad people can get shot again
int i = 0
while i < Alias_RailroadGenericPeeps.GetCount()
ObjectReference theRef = Alias_RailroadGenericPeeps.GetAt(i)
  if theRef
    theRef.IgnoreFriendlyHits(FALSE)
   endif
i += 1		
endWhile
;Alias_TinkerTom.GetActorRef().IgnoreFriendlyHits(FALSE)
;Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Carrington.GetActorRef().IgnoreFriendlyHits(FALSE)
Alias_Carrington.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_PAM.GetActorRef().IgnoreFriendlyHits(FALSE)
Alias_PAM.GetActorRef().GetActorBase().SetEssential(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
; Glory says her final words
pRR303_0300b_GloryDeath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
; Kill Glory
Alias_Glory.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Call RR404 - 400 (Secure Tunnels)
RR304.SetStage(500)

; When both catacombs and Church are cleared, then advance quest
if ( GetStageDone(350) )
  SetStage(400)
endif

;Enable Paladin Brandis in the Church
Alias_PaladinBrandis.getReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Call RR404 - 500 (Secure Church)
RR304.SetStage(600)

; When both catacombs and Church are cleared, then advance quest
if ( GetStageDone(300) )
  SetStage(400)
endif

;Make it so you can fast travel again
pRailroadHQ01.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Teleport Deacon into his spot
Actor oDeacon = Alias_Deacon.GetActorRef()
if ( !oDeacon.IsInFaction(pCurrentCompanionFaction) )    ; Is Deacon a follower?
  oDeacon.Enable(TRUE)   ; If not, then enable him
  oDeacon.MoveTo(pRR303DeaconReportMarker)  ; And teleport him to the appropriate spot
endif

; Teleport Tink and Dez to be close to the spot, too
Alias_Desdemona.GetActorRef().MoveTo(pRR303DezAfterChurchClearMarker)
Alias_TinkerTom.GetActorRef().MoveTo(pRR303TinkAfterChurchClearMarker)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RR302RepelBoSAtHQAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
; Register for events - for timing of Tinker Tom and Deacon lines
kmyQuest.RegisterVertibirdAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
actor aDeacon = Alias_Deacon.GetActorRef()

; Check to see if Deacon is your current companion
if ( Alias_Companion.GetActorRef() == aDeacon )
  kmyQuest.bDeaconIsActiveCompanion = 1   ; Track that Deacon was your companion
  ;pCOMDeacon.SetStage(90)  ; If so kick him out temporarily
else
  ; Remove his base keyword for where he sits in the vertibird
  aDeacon.RemoveKeyword(p_AttachPassenger)
  aDeacon.AddKeyword(p_AttachCopilot)
  aDeacon.SetGhost(TRUE)   ; If he isn't your companion make him a ghost for a long time
endif

; Make it so you can board the vertibird
VertibirdTurretScript turret = Alias_Vertibird.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation(False, True)
endif

; Queue up conversation on the vertibird
pRR303_1100a_TakingOff.Start()

; Make it so Deacon immediately goes to board the vertibird
aDeacon.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
; Bring in companions
SetStage(803)

; Register for vertibird animation events
SetStage(725)

; Make Deacon no longer swap disguises
(pCOMDeacon as COMDeaconScript).bCanSwapDisguises = 0

; Choosing this time to clean up the Railroad's bodies
pRR303GloryDeathEnabler.Disable()
Alias_Glory.GetActorRef().Kill()
Alias_Glory.GetActorRef().Disable()

; Queue up conversation on the vertibird
pRR303_1100a_TakingOff.Start()

; This is a conversation listening to the vertibird's flight state (to enable shaky flight)
pRR303_VertibirdListenForFlight.Start()

; Enable the interactive places to place the explosives
Alias_Explosives1.GetReference().Enable()
Alias_Explosives2.GetReference().Enable()
Alias_Explosives3.GetReference().Enable()

; Make the player temporarily friends of the BoS
 pBrotherhoodOfSteelFaction.SetPlayerEnemy(FALSE)
Game.GetPlayer().AddToFaction(pRR302TempBoSFriends)

; For this sequence make Tinker Tom and Deacon essential. And also make them neutral to the Brotherhood.
; So you can't get kicked out of the Railroad in a weird state.
Actor aTemp
aTemp = Alias_Deacon.GetActorRef()
if ( !pInst306.GetStageDone(20) )   ; Is End of the Line active?
  aTemp.GetActorBase().SetEssential()   ; If it isn't then it's OK to make them essential
endif
aTemp.AddToFaction(pRR302TempBoSFriends)

aTemp = Alias_TinkerTom.GetActorRef()
if ( !pInst306.GetStageDone(20) )
  aTemp.GetActorBase().SetEssential()
endif
aTemp.AddToFaction(pRR302TempBoSFriends)

; Evaluate the vertibird's package for a quick take off
Alias_Vertibird.GetActorRef().EvaluatePackage()

; Deacon dons his disguise
Alias_Deacon.GetActorRef().SetOutfit(pDeaconDisguiseBoS)

; Enable Kells and move him to challenge disguised players
actor aKells = Alias_Kells.GetActorRef()
aKells.Enable()
aKells.MoveTo(pRR303KellsMarker)

; Depopulate the Prydwen to sane levels
Alias_EmptyPrydwenCollection.DisableAll()
Alias_ElderMaxson.GetActorRef().Disable()

; Make it so that you can't fast travel
kmyQuest.EnableLayer = InputEnableLayer.Create()
kmyQuest.EnableLayer.EnableFastTravel(false)

; Lower the perch for pick up
pBoSPrydwenVertibirdMainPerch.PlayAnimation("opened")

; Keep track of who your companion was for the Prydwen sequence
Alias_PrydwenCompanion.ForceRefTo(Alias_Companion.GetActorRef())

; Plan known
SetStage(750)

;make companions not care about murder in the location
((self as quest) as CompanionMurderLocationToggleScript).OkayToMurderInBrotherhoodHQ()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN CODE
; If Deacon gets unloaded then he teleports to the vertibird
Alias_Deacon.GetActorRef().MoveTo(Alias_Vertibird.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0803_Item_00
Function Fragment_Stage_0803_Item_00()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
Quest __temp = self as Quest
companionvertibirdquestscript kmyQuest = __temp as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
; Snap the companions inside
kmyquest.CompanionsShouldSnapIntoVertibird()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
; Get the vertibird doing its thing
Alias_Vertibird.GetActorRef().PlayIdle(pVertibirdUntrainedFlightIdleStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Deacon gives the player a BoS Knight  disguise
Game.GetPlayer().AddItem(pArmor_RR303BoSDisguise)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
; Control Tower conversation
;pRR303_0800a_DeaconTakesOff.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)

; Can't jump off Prydwen
SetStage(901)

actor aDeacon = Alias_Deacon.GetActorRef()

; Check to see if Deacon was your current companion
if ( kmyQuest.bDeaconIsActiveCompanion == 1 )
  pCOMDeacon.SetStage(80)  ; He rejoins you
endif

; Monitor the player's gear for being disguised
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnItemEquipped")
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnItemUnequipped")

; Enable Kells and move him to challenge disguised players
actor aKells = Alias_Kells.GetActorRef()
aKells.Enable()
aKells.MoveTo(pRR303KellsMarker)

; Tinker reacts
pRR303_Ambient_LandedOnPrydwen.Start()

; Depopulate the Prydwen to sane levels
Alias_EmptyPrydwenCollection.DisableAll()

; Make it so the player can get out of the vertibird
(Alias_Vertibird.GetReference() as VertibirdTurretScript).BlockPlayerActivation(FALSE)

Utility.Wait(10.0)

; Make it so there's a vertibird to the surface and back
SetStage(903)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0901_Item_00
Function Fragment_Stage_0901_Item_00()
;BEGIN CODE
; Don't let the player jump off the Prydwen any more - enable the enable marker for the blockers
pBoSPryCollision.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0902_Item_00
Function Fragment_Stage_0902_Item_00()
;BEGIN CODE
; Check to see if the player is currently in disguise
if Game.GetPlayer().WornHasKeyword(pRR302BoSDisguise)
  Debug.Trace("The player is already disguised.")
  pBrotherhoodOfSteelFaction.SetPlayerEnemy(FALSE)
  Game.GetPlayer().AddToFaction(pRR302TempBoSFriends)
else
  Game.GetPlayer().RemoveFromFaction(pRR302TempBoSFriends)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0903_Item_00
Function Fragment_Stage_0903_Item_00()
;BEGIN CODE
; Make it so you can vertibird to the surface and back
pBoSDoors.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
; Wait 10 seconds and now the Gasbag guard will alert everyone
Utility.Wait(10.0)
SetStage(920)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Check to see if the player is in disguise
if ( Game.GetPlayer().IsInFaction(pRR302TempBoSFriends) )
  pRR303DisguiseCompromisedMessage.Show()    ; Then show a warning message
endif

; Remove the player from a BoS friendly faction
Game.GetPlayer().RemoveFromFaction(pRR302TempBoSFriends)

; Make the BoS enemies of the player
pBrotherhoodofSteelFaction.SetEnemy(pPlayerFaction)

; Make Deacon an enemy of the BoS
Actor aTemp
aTemp = Alias_Deacon.GetActorRef()
if ( Alias_Companion.GetActorRef() == aTemp )  ; Is Deacon your companion?
  aTemp.RemoveFromFaction(pRR302TempBoSFriends)
endif
;aTemp = Alias_TinkerTom.GetActorRef()
;aTemp.RemoveFromFaction(pRR302TempBoSFriends)
;aTemp.SetGhost(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10100_Item_00
Function Fragment_Stage_10100_Item_00()
;BEGIN CODE
; CALLED FROM RR304

; Disable Deacon temporarily 
Actor oDeacon = Alias_Deacon.GetActorRef()
if ( !oDeacon.IsInFaction(pCurrentCompanionFaction) )    ; Is Deacon a follower?
  oDeacon.Disable()   ; If not, then disable him
endif

; Indicate the quest is ready to fire
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
; Used to be 610

; Remove one of the charges
Game.GetPlayer().RemoveItem(pRR303TinkExplosives)

; Increment the global counter
ModObjectiveGlobal(1, pRR303ExplosivePlanted, 1200, 3)

; Make the bomb noninteractive
Alias_Explosives1.GetReference().SetDestroyed()

; Make the explosives appear
pRR303PlacedExplosive1.Enable()
pOBJPlaceExplosive.Play(pRR303PlacedExplosive1)   ; Play a sound on the placed explosive

; Player says somethin'
pRR303_1010_BombPlaced.Start()

; Check to see if all bombs are planted
if ( GetStageDone(1020) && GetStageDone(1030) )
   SetStage(1050)
elseif ( GetStageDone(910) )   ; Have you only delayed them a little?
   SetStage(1000)     ; The airship is on alert and hostile
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10200_Item_00
Function Fragment_Stage_10200_Item_00()
;BEGIN CODE
; CALLED FROM RR304
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
; Used to be 620 

; Remove one of the charges
Game.GetPlayer().RemoveItem(pRR303TinkExplosives)

; Increment the global counter
ModObjectiveGlobal(1, pRR303ExplosivePlanted, 1200, 3)

; Make the bomb noninteractive
Alias_Explosives2.GetReference().SetDestroyed()

; Make the explosives appear
pRR303PlacedExplosive2.Enable()
pOBJPlaceExplosive.Play(pRR303PlacedExplosive2)   ; Play a sound on the placed explosive

; Player says somethin'
pRR303_1010_BombPlaced.Start()

; Check to see if all bombs are planted
if ( GetStageDone(1010) && GetStageDone(1030) )
   SetStage(1050)
elseif ( GetStageDone(910) )   ; Have you only delayed them a little?
   SetStage(1000)     ; The airship is on alert and hostile
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10300_Item_00
Function Fragment_Stage_10300_Item_00()
;BEGIN CODE
; CALLED FROM RR304
; Nothing needed here. Stage 200 of this quest calls RR304.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1030_Item_00
Function Fragment_Stage_1030_Item_00()
;BEGIN CODE
; Used to be 630 

; Remove one of the charges
Game.GetPlayer().RemoveItem(pRR303TinkExplosives)

; Increment the global counter
ModObjectiveGlobal(1, pRR303ExplosivePlanted, 1200, 3)

; Make the bomb noninteractive
Alias_Explosives3.GetReference().SetDestroyed()

; Make the explosives appear
pRR303PlacedExplosive03.Enable()
pOBJPlaceExplosive.Play(pRR303PlacedExplosive03)   ; Play a sound on the placed explosive

; Player says somethin'
pRR303_1010_BombPlaced.Start()

; Check to see if all bombs are planted
if ( GetStageDone(1020) && GetStageDone(1010) )
   SetStage(1050)
elseif ( GetStageDone(910) )   ; Have you only delayed them a little?
   SetStage(1000)     ; The airship is on alert and hostile
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10400_Item_00
Function Fragment_Stage_10400_Item_00()
;BEGIN CODE
; CALLED FROM RR304
; Nothing needed here. Stage 300 of this quest calls RR304.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10500_Item_00
Function Fragment_Stage_10500_Item_00()
;BEGIN CODE
; CALLED FROM RR304
; Nothing needed here. Stage 400 of this quest calls RR304.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)

; Don't let the player jump off the Prydwen any more - enable the enable marker for the blockers
pBoSPryCollision.Enable()

; Deacon uses disguises again
(pCOMDeacon as COMDeaconScript).bCanSwapDisguises = 1

; And if the base isn't hostile yet, go hostile
;SetStage(1000)

; End the scene (just in case it's running)
pRR303_0800a_DeaconTakesOff.Stop()

; Make it so the player CANNOT get out of the vertibird the next time they enter it.
(Alias_Vertibird.GetReference() as VertibirdTurretScript).BlockPlayerActivation(FALSE,TRUE)

; Queue up the vertibird to launch
pRR303_1100a_DeaconEscape.Start()

; Sync up with master quest
RR304.SetStage(1300)

; Make it so that your current companion is "Soft Dismissed" - so they can't be commanded to stay on the Prydwen
Alias_PrydwenCompanion.GetActorRef().DisallowCompanion(true)
;FollowersScript.GetScript().DismissCompanion(Alias_PrydwenCompanion.GetActorReference(), FALSE, TRUE)
(pWorkshopParent as WorkshopParentScript).UnassignActor((Alias_PrydwenCompanion.GetRef() as WorkshopNPCScript),true)

; Is the Prydwen hostile?
if ( GetStageDone(1000) )
  ; If it is then make Elder Maxson appear with backup on the command deck
  Alias_ElderMaxson.GetActorRef().Enable()
  Alias_ElderMaxson.GetActorRef().MoveTo(pBoSMaxsonCommandDeckMarker)
  Alias_FirstMaxsonBackup.GetActorRef().Enable()
  Alias_SecondMaxsonBackup.GetActorRef().Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1060_Item_00
Function Fragment_Stage_1060_Item_00()
;BEGIN CODE
; Have Tinker Tom shout to the player
pRR303_Ambient_NearlyEscaped.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1400)

; Add back your current companion 
Alias_PrydwenCompanion.GetActorRef().AllowCompanion(true)
;FollowersScript.GetScript().SetCompanion(Alias_PrydwenCompanion.GetActorReference())

; Make Deacon and Tinker Tom killable again
Alias_Deacon.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(FALSE)

; Make the vertibird move immediately
Alias_Vertibird.GetActorRef().EvaluatePackage()

; Sync up with master quest
RR304.SetStage(1400)

; Swap the Prydwen when it's (hopefully) off screen
Utility.Wait(3.0)
(pPrydwenDestructionRef as PrydwenDestructionScript).SwapPrydwen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_11100_Item_00
Function Fragment_Stage_11100_Item_00()
;BEGIN CODE
; CALLED FROM RR304
; Objectives
SetObjectiveDisplayed(1100)

; Make it so the player can get on the vertibird
(Alias_Vertibird.GetReference() as VertibirdTurretScript).BlockPlayerActivation(FALSE)

; Start the scene with Deacon & Tink bantering
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_11200_Item_00
Function Fragment_Stage_11200_Item_00()
;BEGIN CODE
; CALLED FROM RR304

; Call local stage
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1125_Item_00
Function Fragment_Stage_1125_Item_00()
;BEGIN CODE
; Swap out the destructible Prydwen
(pPrydwenDestructionRef as PrydwenDestructionScript).SwapPrydwen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
; Set "Nuclear Option" to know what faction is ending the game
;pMQ302Faction.SetValueInt(3)   ; 3 = Railroad
MQ302RR.SetStage(100)                 ; Queue up "Nuclear Option
;pMQ302.Start()                           ; Queue up "Nuclear Option

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_PrydwenDestroyedByRRAV)

; Remove the player from a BoS friendly faction
Game.GetPlayer().RemoveFromFaction(pRR302TempBoSFriends)
pBrotherhoodOfSteelFaction.SetPlayerEnemy()

; Set the BoS dead global
pPlayerBOS_Destroyed.SetValue(1)

; RR destroyed Prydwen
PlayerBOS_DestroyedFaction.SetValue(3)

; flag companion as witness
actor companion = Alias_Companion.GetActorRef()
if companion
	companion.SetValue(DestroyBOSCompanion, 1)
endif

;Disable the radios at Easy City Downs to prevent interference with the crash. 
pDN035_EasyCityRadioOverrides.Start() 

; Make the Prydwen explode
(pPrydwenDestructionRef as PrydwenDestructionScript).SwapPrydwen()
(pPrydwenDestructionRef as PrydwenDestructionScript).SwapArm()
(pPrydwenDestructionRef as PrydwenDestructionScript).StartCrash(FALSE)

; Move Proctor Ingram to a spot to die
Actor aIngram = Alias_Ingram.GetActorRef()
aIngram.MoveTo(pBoSPrydwenFire)
aIngram.GetActorBase().SetProtected(FALSE)
aIngram.GetActorBase().SetEssential(FALSE)
aIngram.Kill()

; Wait for a bit then land
Utility.Wait(10.0)
SetStage(1175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1175_Item_00
Function Fragment_Stage_1175_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1400)

; Signal the bird to move immediately
Alias_Vertibird.GetActorRef().EvaluatePackage()

; Detect to see if the player has dismounted the vertibird
pRR303_1200_DetectPlayerDismount.Start()

; Check to see if Deacon is your current companion
if ( Alias_Companion.GetActorRef() != Alias_Deacon.GetActorRef() )
  Alias_Deacon.GetActorRef().SetGhost(FALSE)   ; Now Deacon is no longer a ghost
endif

; Make it so the player can get out of the vertibird
(Alias_Vertibird.GetReference() as VertibirdTurretScript).BlockPlayerActivation(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1205_Item_00
Function Fragment_Stage_1205_Item_00()
;BEGIN AUTOCAST TYPE RR303Script
Quest __temp = self as Quest
RR303Script kmyQuest = __temp as RR303Script
;END AUTOCAST
;BEGIN CODE
; Disable activating the vertibird
VertibirdTurretScript turret = Alias_Vertibird.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation()
endif

;Alias_Vertibird.GetActorRef().BlockActivation(TRUE, TRUE)

; Now Tinker Tom can leave
SetStage(1200)

; Make it so that you can fast travel again
kmyQuest.EnableLayer.EnableFastTravel(TRUE)
kmyQuest.EnableLayer.Delete()

; Add Deacon's vertibird keyword back
Actor aDeacon = Alias_Deacon.GetActorRef()
aDeacon.AddKeyword(p_AttachPassenger)
aDeacon.RemoveKeyword(p_AttachCopilot)

; Make Deacon and Tinker enemies of the BoS
Actor aTemp
aTemp = Alias_Deacon.GetActorRef()
aTemp.RemoveFromFaction(pRR302TempBoSFriends)
aTemp = Alias_TinkerTom.GetActorRef()
aTemp.RemoveFromFaction(pRR302TempBoSFriends)
aTemp.SetGhost(FALSE)
aTemp.IgnoreFriendlyHits(FALSE)
aTemp.GetActorBase().SetEssential(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
Quest __temp = self as Quest
companionvertibirdquestscript kmyQuest = __temp as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CompanionsShouldExitVertibird()
kmyquest.GhostOff()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1275_Item_00
Function Fragment_Stage_1275_Item_00()
;BEGIN CODE
; Deactivate the vertibird
Alias_Vertibird.GetActorRef().Disable()

; Move Tinker Tom to the Railroad
Alias_TinkerTom.GetActorRef().MoveTo(pTinkerHomeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1400)

; NOTE: Deprecated all of this - because you could have END OF THE LINE here
;            Need to be able to betray the Railroad up to the last second
; Make everyone in the Railroad essential now
; We can't have anyone dying in the final assault
;Alias_Desdemona.GetActorRef().GetActorBase().SetEssential()
;Alias_Deacon.GetActorRef().GetActorBase().SetEssential()
;Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential()
;Alias_Carrington.GetActorRef().GetActorBase().SetEssential()
;Alias_PAM.GetActorRef().GetActorBase().SetEssential()

; Sync up with master quest
RR304.SetStage(1500)

; Give the player some caps 
Game.GivePlayerCaps(1000)
Game.GetPlayer().AddItem(pmiscmod_mod_RailwayRifle_Barrel_Long)  ; Get a Railway rifle mode

; Add an achievement
Game.AddAchievement(21)

;Update Global for Radio News
RadioDCRR303Ready.SetValue((GameDaysPassed.GetValue() + 1))

; End the quest
SetStage(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
; NOTE: This happens even on quest failure - so don't check this for seeing if it was done successfully

; Close off RR304
RR304.SetStage(1600)

; Re-enable ambient conversations in HQ
pRRDisableHQConversations.SetValue(0)    ; FALSE - conversations are a go

; Failsafe to remove the player from a BoS friendly faction
Game.GetPlayer().RemoveFromFaction(pRR302TempBoSFriends)

;DN130 - Cambridge PD
;Clean up the police station following the battle.
if ( GetStageDone(100) )  ; Are you actually running this quest? As opposed to just failing it
  DN130RR302.SetStage(1000)
  DN130.SetStage(90)

  ; Enable Deacon (just in case)
  Alias_Deacon.GetActorRef().Enable()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
; Clean up - make sure everyone is properly factioned to the BoS
Actor aTemp
aTemp = Alias_Deacon.GetActorRef()
aTemp.RemoveFromFaction(pRR302TempBoSFriends)
aTemp.IgnoreFriendlyHits(FALSE)  ; Now he'll register friendly hits
aTemp.SetGhost(FALSE)   ; And make sure Deacon isn't a ghost
aTemp = Alias_TinkerTom.GetActorRef()
aTemp.RemoveFromFaction(pRR302TempBoSFriends)
aTemp.IgnoreFriendlyHits(FALSE)  ; Now he'll register friendly hits
aTemp.SetGhost(FALSE)   ; And make sure Tinker Tom isn't a ghost


Game.GetPlayer().RemoveFromFaction(pRR302TempBoSFriends)

; Add Deacon's vertibird keyword back
Actor aDeacon = Alias_Deacon.GetActorRef()
aDeacon.AddKeyword(p_AttachPassenger)
aDeacon.RemoveKeyword(p_AttachCopilot)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_20000_Item_00
Function Fragment_Stage_20000_Item_00()
;BEGIN CODE
; Fail objectives & end quest
FailAllObjectives()

; Failsafe - Make it so you can fast travel again
pRailroadHQ01.EnableFastTravel(TRUE)

; Make it so all the Railroad people can get shot again
int i = 0
while i < Alias_RailroadGenericPeeps.GetCount()
ObjectReference theRef = Alias_RailroadGenericPeeps.GetAt(i)
  if theRef
    theRef.IgnoreFriendlyHits(FALSE)
   endif
i += 1		
endWhile
Alias_TinkerTom.GetActorRef().IgnoreFriendlyHits(FALSE)
Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Carrington.GetActorRef().IgnoreFriendlyHits(FALSE)
Alias_Carrington.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_PAM.GetActorRef().IgnoreFriendlyHits(FALSE)
Alias_PAM.GetActorRef().GetActorBase().SetEssential(FALSE)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Deacon Auto Const
ReferenceAlias Property Alias_DeckOfficer Auto Const
ReferenceAlias Property Alias_Glory Auto Const
ReferenceAlias Property Alias_TinkerTom Auto Const

ObjectReference Property pRR303DeaconToVertibirdMarker Auto Const
ObjectReference Property pRR303GloryToVertibirdMarker Auto Const
ObjectReference Property pRR303TinkerToVertibirdMarker Auto Const
ObjectReference Property pGloryHomeMarker Auto Const
ObjectReference Property pTinkerHomeMarker Auto Const
ObjectReference Property pDeaconHomeMarker Auto Const

Quest Property pRR101 Auto Const
Quest Property pRR102 Auto Const
Quest Property pRR201 Auto Const
Quest Property pDialogueRailroad Auto Const

ReferenceAlias Property Alias_Explosives1 Auto Const
ReferenceAlias Property Alias_Explosives2 Auto Const
ReferenceAlias Property Alias_Explosives3 Auto Const

GlobalVariable Property pRR303ExplosivePlanted Auto Const

Scene Property pRR303_0110a_ReactToAttack Auto Const
Scene Property pRR303_0110b_TinkerBlowsTunnel Auto Const
Scene Property pRR303_0430_CowardScene Auto Const
Scene Property pRR303_0700_QuestComplete Auto Const

FollowersScript Property Followers Auto Const

ObjectReference Property pRR303DeaconReportMarker Auto Const

Outfit Property pOutfit_BoSSoldier Auto Const

Outfit Property pDeaconDisguiseBoS Auto Const

ReferenceAlias Property Alias_Vertibird Auto Const

Scene Property pRR303_0800a_DeaconTakesOff Auto Const

Scene Property pRR303_1100a_DeaconEscape Auto Const

Faction Property pBrotherhoodofSteelFaction Auto Const

Faction Property pPlayerFaction Auto Const

GlobalVariable Property pMQ302Faction Auto Const

Quest Property pMQ302 Auto Const

ObjectReference Property pRR303RRHQBrotherHoodAssaultEnabler Auto Const

ObjectReference Property pRR303OldNorthTriggerEnabler Auto Const

ObjectReference Property pRR303OutsideChurchBrotherhoodEnabler Auto Const

ObjectReference Property pOldNorthChurchGhoulEnabler Auto Const

Faction Property pRailroadFaction Auto Const

ReferenceAlias Property Alias_Desdemona Auto Const

Quest Property RR304 Auto Const

GlobalVariable Property pRRDisableHQConversations Auto Const

MiscObject Property pRR303TinkExplosives Auto Const

Keyword Property pRR302BoSDisguise Auto Const

Faction Property pRR302TempBoSFriends Auto Const

Faction Property pCurrentCompanionFaction Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

ObjectReference Property pRR303DezAfterChurchClearMarker Auto Const

ObjectReference Property pRR303TinkAfterChurchClearMarker Auto Const

ReferenceAlias Property Alias_Carrington Auto Const

ReferenceAlias Property Alias_PAM Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCRR303Ready Auto Const

ObjectReference Property pPrydwenDestructionRef Auto Const

ObjectReference Property pRR303PlacedExplosive1 Auto Const

ObjectReference Property pRR303PlacedExplosive2 Auto Const

ObjectReference Property pRR303PlacedExplosive03 Auto Const

Scene Property pRR303_1100a_TakingOff Auto Const

Armor Property pArmor_RR303BoSDisguise Auto Const

Scene Property pRR303_1010_BombPlaced Auto Const

Quest Property pBoSKickOut Auto Const

Message Property pRR303DisguiseCompromisedMessage Auto Const

Scene Property pRR303_Ambient_NearlyEscaped Auto Const

Scene Property pRR303_Ambient_LandedOnPrydwen Auto Const

ReferenceAlias Property Alias_GasbagMechanic Auto Const

Faction Property pBoSAttackingRailroadFaction Auto Const

ObjectReference Property pRR303GloryDyingFurniture Auto Const

Quest Property pRR302 Auto Const

Scene Property pRR303_Ambient_PostInitialAssault Auto Const

Quest Property DN130 Auto Const

Quest Property DN130RR302 Auto Const

sound Property pQSTRR302RailroadExplosion2D Auto Const

Idle Property pVertibirdUntrainedFlightIdleStart Auto Const

Scene Property pRR303_VertibirdListenForFlight Auto Const

ObjectReference Property pRR303GloryDeathEnabler Auto Const

GlobalVariable Property pPlayerBOS_Destroyed Auto Const

RefCollectionAlias Property Alias_EmptyPrydwenCollection Auto Const

ReferenceAlias Property Alias_Kells Auto Const

ObjectReference Property pRR303KellsMarker Auto Const

Quest Property pRRKickOut Auto Const

Quest Property pCOMDeacon Auto Const

ReferenceAlias Property Alias_Companion Auto Const

ObjectReference Property pRRHQSecretEntranceDoor Auto Const

ObjectReference Property pRRHQSecretExitDoor Auto Const

Scene Property pRR303_0300b_GloryDeath Auto Const

Quest Property pBoSMarshal Auto Const

ReferenceAlias Property Alias_PaladinBrandis Auto Const

RefCollectionAlias Property Alias_SOURCEBrotherhoodAssaultChurchSoldiers Auto Const

ObjectReference Property pRR303BrandisMarker Auto Const

ObjectReference Property pRR303DoorExplodeEnableMarker Auto Const

Activator Property pRR303ExplodingDoorTrigger Auto Const

ObjectReference Property pRR303DoorTriggerEnableMarker Auto Const

ObjectReference Property pRR303EscapeTunnelBlownEnableMarker Auto Const

Quest Property pDN035_EasyCityRadioOverrides Auto Const

Scene Property pRR303_1200_DetectPlayerDismount Auto Const

Cell Property pRailroadHQ01 Auto Const

Keyword Property p_AttachPassenger Auto Const

Keyword Property p_AttachCopilot Auto Const

Sound Property pOBJPlaceExplosive Auto Const

Quest Property pInst306 Auto Const

ObjectReference Property pBoSDoors Auto Const

RefCollectionAlias Property Alias_RailroadGenericPeeps Auto Const Mandatory

ActorValue Property DestroyBOSCompanion Auto Const Mandatory

GlobalVariable Property PlayerBOS_DestroyedFaction Auto Const Mandatory

ObjectMod Property pmod_RailwayRifle_Barrel_Long Auto Const Mandatory

MiscObject Property pmiscmod_mod_RailwayRifle_Barrel_Long Auto Const Mandatory

Quest Property pREScene_VertibirdKMK01 Auto Const Mandatory

Quest Property pREScene_VertibirdKMK02 Auto Const Mandatory

Quest Property pREScene_VertibirdKMK03 Auto Const Mandatory

Quest Property pRETravel_VertibirdKMK01 Auto Const Mandatory

Quest Property pRETravel_VertibirdKMK02 Auto Const Mandatory

Quest Property pREObject_VertibirdKMK01 Auto Const Mandatory

Quest Property pREObject_VertibirdKMK02 Auto Const Mandatory

Quest Property pREAssault_VertibirdKMK01 Auto Const Mandatory

ReferenceAlias Property Alias_ElderMaxson Auto Const Mandatory

ObjectReference Property pBoSMaxsonCommandDeckMarker Auto Const Mandatory

ReferenceAlias Property Alias_FirstMaxsonBackup Auto Const Mandatory

ReferenceAlias Property Alias_SecondMaxsonBackup Auto Const Mandatory

ObjectReference Property pBoSPryCollision Auto Const Mandatory

Quest Property MQ302RR Auto Const

ObjectReference Property pBoSPrydwenVertibirdMainPerch Auto Const Mandatory

ReferenceAlias Property Alias_PrydwenCompanion Auto Const Mandatory

Quest Property pWorkshopParent Auto Const Mandatory

ActorValue Property COMQC_PrydwenDestroyedByRRAV Auto Const

ActorValue Property COMQC_RR302RepelBoSAtHQAV Auto Const

Quest Property pCOMCurieQuest Auto Const Mandatory

ReferenceAlias Property Alias_Ingram Auto Const Mandatory

ObjectReference Property pBoSPrydwenFire Auto Const Mandatory
