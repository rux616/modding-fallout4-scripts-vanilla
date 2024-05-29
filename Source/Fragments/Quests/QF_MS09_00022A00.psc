;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS09_00022A00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; register quest script for remote events:
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerKnowsImmortality = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; to Edward at Cabot House
MS09Mission01.SetStage(10)
Alias_CabotHouseMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; to Jack at Cabot House
MS09Mission01.SetStage(15)
Alias_CabotHouseMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; move Edward into position
Alias_Edward.GetRef().MoveTo(MS09IntroEdwardMarker001)
; move Jack into position
if !GetStageDone(100) && !GetStageDone(150)
	; "uninvited" intro
	Alias_Jack.GetRef().MoveTo(MS09IntroJackUninvitedStartMarker)
else
	Alias_Jack.GetRef().MoveTo(MS09IntroJackWorkbenchMarker)
endif
; unlock load door
Alias_CabotHouseFrontDoor.GetRef().Unlock()
; stop MS09intro
MS09Intro.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; failsafe:
; clear crime on Parsons guard faction
ParsonsGuardFaction.SetPlayerEnemy(false)

if !GetStageDone(100) && !GetStageDone(150)
	; "uninvited" intro
	MS09CabotHouseIntroUninvited.Start()
else
	; friendly intro
	MS09CabotHouseIntroInvited.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; trigger Jack's experiment explosion
MS09IntroExplosionMarker.PlaceAtMe(MS09IntroExplosion)
Alias_Jack.GetActorRef().PlayAnimation(JackReactToExplosion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
MS09CabotHouseIntroEdwardServeDrinks.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
ObjectReference bourbon = MS09IntroPlaceDrinksMarker.PlaceAtMe(IntroDrinksPotion)
bourbon.SetActorRefOwner(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
; jack objective
MS09Mission01.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
; talk to Edward
MS09Mission01.setstage(20)
; allies of Parsons guard faction
PlayerFaction.SetAlly(ParsonsGuardFaction)
; relock load door
Alias_CabotHouseFrontDoor.GetRef().Lock()
; give player a key
Game.GetPlayer().AddItem(CabotHouseExteriorKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; objective to Parsons
MS09Mission01.setStage(30)
; enable raiders
MS09RaiderEnableMarker.Enable()
; failsafe to make sure in guard faction
setstage(360)
; enable guard captain
Alias_ParsonsGuardCaptain.TryToEnable()
; clear crime on Parsons guard faction
ParsonsGuardFaction.SetPlayerEnemy(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
CommonwealthRain.SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
MS09Mission01.setStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; if player hasn't gotten package, give objective
if GetStageDone(480) == false
	MS09Mission01.SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
MS09Mission01.SetStage(50)
setStage(500) ; next objective
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
MS09Mission01.SetStage(50)
Alias_Wilhelmina.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; failsafe
; clear crime on Parsons guard faction
ParsonsGuardFaction.SetPlayerEnemy(false)

; start looping scene to introduce Emogene mission
MS09CabotHouseMission2Looping.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN CODE
MS09Mission01.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
if GetStageDone(557) == false
	; player only gets paid if not caught lying
	Game.GetPlayer().AddItem(Mission1Reward)
endif
if GetStageDone(555)
	; get bonus if you gave back the serum
	Game.GetPlayer().AddItem(Mission1RewardBonus)
endif

MS09Mission01.SetStage(100) ; complete quest
; objective to Edward
MS09Mission02.SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
MS09CabotHouseMission2Looping.Stop()
; just in case, start Jack scene
MS09CabotHouseMission2Jack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
MS09Mission01.SetStage(100) ; failsafe
; set up amphitheater
DN019.SetStage(100)
; move Emogene to rescue marker
actor emogene = Alias_Emogene.GetActorRef()
emogene.MoveTo(MS09EmogeneRescueMarker)
emogene.Enable()
; objective to Third Rail/Emogene
MS09Mission02.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
; turn off Magnolia singing temporarily
DialogueGoodneighborMagnoliaSongs.SetAllowSinging(false)
DialogueGoodneighborMagnoliaSongs.StopAllSongs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
; give player Church of Atom flier
Game.GetPlayer().AddItem(MS09ChurchoftheAtomFlier)
; update quest objective
setStage(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; complete optional objective at Third Rail
MS09Mission02.SetStage(65)
; put Magnolia back to being protected
Actor magnolia = Alias_Magnolia.Getactorref()
magnolia.GetActorBase().SetEssential(false)
magnolia.GetActorBase().SetProtected(true)
; Magnolia can sing again
DialogueGoodneighborMagnoliaSongs.SetAllowSinging(true)
; Ham now protected instead of essential
Alias_Ham.GetActorRef().SetProtected(true)
Alias_Ham.GetActorRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerKnowsEmogeneOld = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(MS09LorenzoSerum, 1)
; this counts as multiple compliments
kmyQuest.PlayerInsultsOrComplimentsEmogene(false)
kmyQuest.PlayerInsultsOrComplimentsEmogene(false)
kmyQuest.PlayerInsultsOrComplimentsEmogene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; new objective - return to Cabot House
MS09Mission02.SetStage(70)
; set up Edward at Parsons:
actor edward= alias_Edward.GetActorRef()
edward.moveTo(Alias_ParsonsOfficeTarget.GetRef())
; restrain:
edward.SetRestrained(true)
; player now in Cabot faction
Game.GetPlayer().AddToFaction(CrimeCabotHouse)
; tell DN019 mission02 is done
DN019.SetStage(200)
kmyQuest.UnlockInteriorDoors()
; open dining room door
Alias_CabotHouseDiningRoomDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; failsafe:
; clear crime on Parsons guard faction
ParsonsGuardFaction.SetPlayerEnemy(false)

MS09Mission3IntroLooping.Start()
; finish Emogene objective
MS09Mission02.SetStage(80)
; set up Parsons
DN031.SetStage(500)
; shut down parsons rumor quest
MS09MiscParsons.Stop()
; set assistance to 0 for Lorenzo room raiders
Alias_LorenzoRoomRaiders.SetValue(Assistance, 0)
Alias_LorenzoRoomRaiderBoss.GetActorRef().SetValue(Assistance, 0)
; disable old Emogene, move back to Cabot House
Alias_EmogeneOld.TryToDisable()
Alias_EmogeneOld.GetRef().MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
debug.trace(self + " stage 810")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
debug.trace(self + " stage 820")
SetStage(810)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Mission2Reward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
debug.trace(self + " stage 850")
; complete mission 2
MS09Mission02.SetStage(100)
; objective to Parsons
; first MS09 objective
SetActive()
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0855_Item_00
Function Fragment_Stage_0855_Item_00()
;BEGIN CODE
MS09Mission3IntroLeaveCabotHouse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
MS09Mission3CabotHouseToParsons.Start()
Alias_Jack.GetActorRef().SetNotShowOnStealthMeter(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; music stinger
MUSDread06x.Add()
; stop travel scene
MS09Mission3CabotHouseToParsons.Stop()
; start Parsons scene
MS09Mission3ParsonsExterior01.Start()
; failsafe - kill looping intro scene
MS09Mission3IntroLooping.Stop()
; disable old Emogene
Alias_Emogene.TryToDisable()
; enable young Emogene
Alias_EmogeneYoung.TryToEnable()
; put her into Emogene alias
Alias_Emogene.ForceRefTo(Alias_EmogeneYoung.GetRef())
; if Jack isn't nearby, move him to marker
actor jack = alias_Jack.GetActorRef()
if jack.Is3dLoaded() == false
	jack.MoveTo(MS09Mission3JackMoveToParsonsMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
; for now, unlock door here (Jack should unlock it in scene)
ParsonsMainDoorExterior.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
MS09ParsonsRaiderIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0940_Item_00
Function Fragment_Stage_0940_Item_00()
;BEGIN CODE
; set flag for player knowing about Lorenzo
setStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0945_Item_00
Function Fragment_Stage_0945_Item_00()
;BEGIN CODE
Alias_ParsonsJackOfficeTerminal.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_02
Function Fragment_Stage_0950_Item_02()
;BEGIN CODE
; objective to basement - may need interim objectives
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
ParsonsAsylumWingDoor.Unlock()
; start raider conv in cell 2
MS09Mission3ParsonsRaiderScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
ParsonsOfficeWingDoorChain.Activate(Alias_Jack.GetRef())
; also unlock asylum wing door
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
; failsafe - advance scene so Jack gets into Parsons02 cell
if MS09Mission3ParsonsInterior02.IsPlaying()
	MS09Mission3ParsonsInterior02.Stop()
	MS09Mission3ParsonsInterior03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
if MS09Mission3ParsonsInterior03.IsPlaying()
	MS09Mission3ParsonsInterior03.Stop()
	MS09Mission3ParsonsInterior04.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
MS09ParsonsBasementSecretDoor.Unlock()
; start raider intro scene
MS09ParsonsBossRoomRaiders.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; start looping raider scene
MS09ParsonsBossRoomRaidersLooping.Start()
; objective to Lorenzo
SetObjectiveCompleted(130)
SetObjectiveDisplayed(140)
; open door
MS09BossCorridorDoor01.SetOpen()
; failsafe:
MS09Mission3IntroLooping.Stop()
; unlock terminal
Alias_ParsonsControlRoomTerminal.GetRef().Unlock()
; music stinger
MUSStinger03x.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
MS09BossCorridorDoor01.SetOpen(false)
MS09BossCorridorDoor02.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1040_Item_00
Function Fragment_Stage_1040_Item_00()
;BEGIN CODE
MS09BossCorridorDoor01.SetOpen(false)
MS09BossCorridorDoor02.SetOpen(false)
MS09BossCorridorDoor03.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
MS09BossCorridorDoor01.SetOpen(false)
MS09BossCorridorDoor02.SetOpen(false)
MS09BossCorridorDoor03.SetOpen(false)

; move Edward back to Cabot House if still alive
if Alias_Edward.GetActorRef().IsDead() == false
	Alias_Edward.TryToMoveTo(MS09Mission3CabotHouseEdwardMarker001)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1060_Item_00
Function Fragment_Stage_1060_Item_00()
;BEGIN CODE
MS09BossCorridorDoorFinal.SetOpen()
MS09ParsonsBossRoomRaiderEnd.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; Abremalin field turns off
Alias_LorenzoCellForceField.GetRef().PlayAnimation("LoopB")
MS09GeneratorFX01.PlayAnimation("Reset")
MS09GeneratorFX02.PlayAnimation("Reset")
MS09GeneratorFX03.PlayAnimation("Reset")
MS09GeneratorFX04.PlayAnimation("Reset")

KlaxonLight01.Activate(KlaxonLight01)
KlaxonLight02.Activate(KlaxonLight02)
KlaxonLight03.Activate(KlaxonLight03)

; put Lorenzo room raiders back in RaiderFaction
Alias_LorenzoRoomRaiders.AddToFaction(RaiderFaction)
Alias_LorenzoRoomRaiderBoss.GetActorRef().AddToFaction(RaiderFaction)
; start combat with player
actor player = game.GetPlayer()
Alias_LorenzoRoomRaiders.StartCombatAll(player)
Alias_LorenzoRoomRaiderBoss.GetActorRef().StartCombat(player)
; make raiders hostile/aggressive
Alias_LorenzoRoomRaiders.SetValue(Game.GetAggressionAV(), 2.0)
Alias_LorenzoRoomRaiderBoss.GetActorRef().SetValue(Game.GetAggressionAV(), 2.0)
Alias_LorenzoRoomRaiders.SetValue(Assistance, 1)
Alias_LorenzoRoomRaiderBoss.GetActorRef().SetValue(Assistance, 1)
; stop looping raider scene
MS09ParsonsBossRoomRaiders.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
KlaxonSound.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
;SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN CODE
; move Edward home if he isn't already
actor edward = alias_Edward.GetActorRef()
; unrestrain:
edward.SetRestrained(false)
if edward.Is3DLoaded() == false
	edward.MoveTo(MS09Mission3CabotHouseEdwardMarker001)
endif
; move other NPCs into place
if Alias_Emogene.GetRef().Is3DLoaded() == false
	Alias_Emogene.GetRef().MoveTo(MS09Mission3CabotHouseEdwardMarker001)
endif
if Alias_Wilhelmina.GetRef().Is3DLoaded() == false
	Alias_Wilhelmina.GetRef().MoveTo(MS09Mission3CabotHouseEdwardMarker001)
endif
; close lab door (so Lorenzo can appear behind it)
Alias_CabotHouseLabDoor.GetRef().SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; free Lorenzo
SetObjectiveDisplayed(150)
; start timer
kmyQuest.StartTimerGameTime(1, kmyQuest.LorenzoEscapeTimerID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; put lorenzo in ignore combat package
Alias_Lorenzo.GetActorRef().EvaluatePackage()

Alias_LorenzoCellForceField.GetRef().PlayAnimation("LoopA")

; in case you do this first:
setStage(1200)
SetObjectiveCompleted(150)

; failsafe/testing
MS09ParsonsBossRoomKillLorenzo.Start()

KlaxonLight01.Activate(KlaxonLight01)
KlaxonLight02.Activate(KlaxonLight02)
KlaxonLight03.Activate(KlaxonLight03)

kmyQuest.LorenzoDeathSpell()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
Alias_Lorenzo.GetActorRef().KillEssential(Game.GetPlayer())
SetObjectiveDisplayed(160)
; enable elevator
MS09ElevatorLoad.Enable()
MS09ElevatorPanel.MakeElevatorFunctional()
MS09ElevatorPanelB.MakeElevatorFunctional()
MS09JacksOfficeElevatorButtonWorking.MakeElevatorFunctional()
MS09BasementElevatorButtonWorking.MakeElevatorFunctional()
SetStage(1190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1232_Item_00
Function Fragment_Stage_1232_Item_00()
;BEGIN CODE
Alias_LorenzoCellForceField.GetRef().PlayAnimation("LoopC")

MS09GeneratorFX01.PlayAnimation("Reset")
MS09GeneratorFX02.PlayAnimation("Reset")
MS09GeneratorFX03.PlayAnimation("Reset")
MS09GeneratorFX04.PlayAnimation("Reset")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Mission3Reward)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1245_Item_00
Function Fragment_Stage_1245_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartTimerGameTime(168, kmyQuest.RewardTimerID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 1250 - Lorenzo free")
; in case do this first:
setStage(1200)
; fail raider objective
if IsObjectiveDisplayed(140)
	SetObjectiveFailed(140)
endif
; complete objective
SetObjectiveCompleted(150)

SetObjectiveDisplayed(155)

; player no longer ally of Cabots
Game.GetPlayer().RemoveFromFaction(CrimeCabotHouse)
PlayerFaction.SetEnemy(ParsonsGuardFaction, true, true)

; remove raiders from friends faction
;Alias_LorenzoRoomRaiders.RemoveFromFaction(MS09LorenzoRoomFriendsFaction)
;Alias_LorenzoRoomRaiderBoss.GetActorRef().RemoveFromFaction(MS09LorenzoRoomFriendsFaction)

; make player ally of Lorenzo (so he doesn't aggro so easily)
PlayerFaction.SetAlly(LorenzoCabotFaction)

; set flag
kmyQuest.Mission3LorenzoFreed = true
; enable elevator
MS09ElevatorLoad.Enable()
MS09ElevatorPanel.MakeElevatorFunctional()
MS09ElevatorPanelB.MakeElevatorFunctional()
MS09JacksOfficeElevatorButtonWorking.MakeElevatorFunctional()
MS09BasementElevatorButtonWorking.MakeElevatorFunctional()
SetStage(1190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1260_Item_00
Function Fragment_Stage_1260_Item_00()
;BEGIN CODE
; don't open door if Lorenzo is about to free himself
if GetStageDone(1274) == false
	Alias_LorenzoCellDoor.GetRef().SetOpen()
	; do nothing else if death sequence already started
	if GetStageDone(1210) == false
		KlaxonLight01.Activate(KlaxonLight01)
		KlaxonLight02.Activate(KlaxonLight02)
		KlaxonLight03.Activate(KlaxonLight03)
		SetStage(1250)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1274_Item_00
Function Fragment_Stage_1274_Item_00()
;BEGIN CODE
if GetStageDone(1210) == false
	ObjectReference animatingDoor = Alias_LorenzoCellDoorAnimating.GetRef()
	animatingDoor.Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1275_Item_00
Function Fragment_Stage_1275_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
ObjectReference realDoor = Alias_LorenzoCellDoor.GetRef()
ObjectReference animatingDoor = Alias_LorenzoCellDoorAnimating.GetRef()
if GetStageDone(1210) == false
	; Lorenzo blows the door across the room
	animatingDoor.PlayAnimation("PlayAnimationLoop")
	realDoor.Disable()
	utility.wait(0.5)
	kmyQuest.LorenzoCast(animatingDoor)

	SetStage(1250)
else
	; disable animation door so real door still works
	animatingDoor.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1290_Item_00
Function Fragment_Stage_1290_Item_00()
;BEGIN CODE
; if talk to Lorenzo is active, fail it (means Lorenzo is dead or in combat with player)
if Alias_Lorenzo.GetActorRef().IsDead() == true
  if IsObjectiveDisplayed(155)
    SetObjectiveFailed(155)
  endif
endif

; if Lorenzo free, make sure 1300 gets set as a failsafe
if GetStageDone(1250)
	SetStage(1300)
endif

MS09BossCorridorDoor03.SetOpen()
utility.wait(1.0)
MS09BossCorridorDoor02.SetOpen()
utility.wait(1.0)
MS09BossCorridorDoor01.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1295_Item_00
Function Fragment_Stage_1295_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
kmyQuest.LorenzoCast(NONE)
SetStage(1290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; objective to return to Cabot House
SetObjectiveCompleted(155)
SetObjectiveDisplayed(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
Alias_Lorenzo.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_Jack.GetActorRef().SetNotShowOnStealthMeter(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
SetStage(1280)
SetStage(1290)
SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1340_Item_00
Function Fragment_Stage_1340_Item_00()
;BEGIN CODE
SetStage(1330)
; make player friends with Cabots again
SetStage(1380)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1345_Item_00
Function Fragment_Stage_1345_Item_00()
;BEGIN CODE
actor jack = Alias_Jack.GetActorRef()
actor emogene = Alias_Emogene.GetActorRef()

; move Jack to interior if he isn't already
if jack.Is3DLoaded() == false
	jack.MoveTo(MS09Mission3CabotHouseEndingJackMarker01)
endif

; move Emogene to interior if she isn't already
if emogene.Is3DLoaded() == false
	emogene.MoveTo(MS09Mission3CabotHouseEndingEmogeneMarker01)
endif

; enable gun etc.
MS09CabotHouseEndingEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
actor jack = Alias_Jack.GetActorRef()
actor emogene = Alias_Emogene.GetActorRef()
actor emogeneYoung = Alias_EmogeneYoung.GetActorRef()
actor wilhelmina = alias_Wilhelmina.GetActorRef()
actor edward = alias_Edward.GetActorRef()
actor lorenzo = alias_Lorenzo.GetActorRef()

; move Jack here if he isn't already
if jack.Is3DLoaded() == false
	jack.MoveTo(MS09Mission3CabotHouseEndingJackMarker01)
endif

; move Emogene here if he isn't already
if emogene.Is3DLoaded() == false
	emogene.MoveTo(MS09Mission3CabotHouseEndingEmogeneMarker01)
endif


; make everyone except Jack non-essential
;jack.GetActorBase().SetEssential(false)
emogene.GetActorBase().SetEssential(false)
emogeneyoung.GetActorBase().SetEssential(false)
wilhelmina.GetActorBase().SetEssential(false)
edward.GetActorBase().SetEssential(false)

; remove Jack and Lorenzo from friends faction
jack.RemoveFromFaction(MS09LorenzoRoomFriendsFaction)
lorenzo.RemoveFromFaction(MS09LorenzoRoomFriendsFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_01
Function Fragment_Stage_1350_Item_01()
;BEGIN CODE
debug.trace(self + "Stage 1350:  Lorenzo is dead")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_02
Function Fragment_Stage_1350_Item_02()
;BEGIN CODE
debug.trace(self + "Stage 1350:  Lorenzo is alive")
; start Lorenzo confrontation scene
MS09Mission3EndingScene01.Start()
; disable and move Lorenzo
Actor lorenzo = Alias_Lorenzo.GetActorRef()
; if lorenzo is actually still alive, move him into position
if lorenzo.IsDead() == false
	; failsafe
	lorenzo.RemoveFromFaction(CaptiveFaction)	
	debug.trace(self + " disabling lorenzo " + lorenzo)
	lorenzo.Disable()
	debug.trace(self + " " + lorenzo + ".IsDisabled()= " + lorenzo.IsDisabled())
	lorenzo.MoveTo(MS09Mission3CabotHouseLorenzoMarker001)
	; add weapon 
	lorenzo.AddItem(MS09LorenzoCabotWeapon)
	debug.trace(self + " enabling lorenzo " + lorenzo)
	lorenzo.Enable()
	debug.trace(self + " " + lorenzo + ".IsDisabled()= " + lorenzo.IsDisabled())
	MS09SetStage1400.Enable()
endif
Alias_Lorenzo.GetActorRef().GetActorBase().SetEssential(false) ; now killable
setObjectiveCompleted(170)
setObjectiveDisplayed(175)
; make player neutral to Lorenzo so he reacts immediately if you shoot him
PlayerFaction.SetEnemy(LorenzoCabotFaction, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1370_Item_00
Function Fragment_Stage_1370_Item_00()
;BEGIN CODE
actor edward = Alias_Edward.GetActorRef()
edward.RemoveFromFaction(CrimeCabotHouse)
edward.RemoveFromFaction(ParsonsGuardFaction)

EdwardDeeganFaction.SetAlly(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1380_Item_00
Function Fragment_Stage_1380_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; player back in Cabot faction
Game.GetPlayer().AddToFaction(CrimeCabotHouse)
kmyQuest.Mission3PlayerSidesWithCabots = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1390_Item_00
Function Fragment_Stage_1390_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndingTriggerLorenzo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
; open lab door
Alias_CabotHouseLabDoor.GetRef().SetOpen(true)

; give Jack the gun
kmyQuest.GiveRadiationGun(Alias_Jack.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(175)
; make Lorenzo enemies of Cabots
LorenzoCabotFaction.SetEnemy(CrimeCabotHouse)
; if player hasn't convinced Jack, make him enemy of Cabots
if GetStageDone(1380) == false
	PlayerFaction.SetEnemy(CrimeCabotHouse)
	; make player ally of Lorenzo
	PlayerFaction.SetAlly(LorenzoCabotFaction)
	; make Edward ally of Lorenzo
	EdwardDeeganFaction.SetAlly(LorenzoCabotFaction)

	; make Jack non-essential
	Alias_Jack.GetActorRef().GetActorBase().SetEssential(false)

	; kill the Cabots
	setObjectiveDisplayed(180)
else
	; make player enemy of Lorenzo
	PlayerFaction.SetEnemy(LorenzoCabotFaction)
	; kill Lorenzo
	setObjectiveDisplayed(190)
endif
; start battle scene
MS09Mission3EndingLorenzoFight.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
setstage(1600)
; start timer for Cabots getting old
kmyQuest.StartTimerGameTime(320, kmyQuest.RunOutOfSerumTimerID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
; TODO - if this happens prior to ending - do something with quest

; if final battle AND player on Lorenzo's side, Lorenzo wins
setstage(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveCompleted(190)

; clear enemy status on faction
CrimeCabotHouse.SetPlayerEnemy(false)

if kmyQuest.Mission3PlayerSidesWithCabots == true 
	if Alias_Jack.GetActorRef().IsDead() == false
		; don't display new objective if Lorenzo died prior to Cabot House
		if GetStageDone(1340) == false
			setObjectiveDisplayed(210)
		endif
	else
		setStage(1750)
	endif
else
	Actor lorenzo = Alias_Lorenzo.GetActorRef()
	if lorenzo.IsDead() == false
		lorenzo.AddToFaction(CrimeCabotHouse)
		setObjectiveDisplayed(200)
	else
		setStage(1850)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1650_Item_00
Function Fragment_Stage_1650_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
actor jack = Alias_Jack.GetActorRef()
actor emogene = Alias_Emogene.GetActorRef()
actor wilhelmina = alias_Wilhelmina.GetActorRef()
actor edward = alias_Edward.GetActorRef()
actor lorenzo = alias_Lorenzo.GetActorRef()

if lorenzo.IsDead()
	lorenzo.Disable()
endif
if jack.IsDead()
	jack.Disable()
endif
if emogene.IsDead()
	emogene.Disable()
endif
if wilhelmina.IsDead()
	wilhelmina.Disable()
endif
if edward.IsDead()
	edward.Disable()
endif

; let Edward leave
SetStage(1900)

; if Edward is unloaded, disable him
if edward.Is3DLoaded() == false
	edward.disable()
endif

; reset interior location
kmyQuest.CabotHouseInteriorLocation.Reset()

; set reset timer on "ending" hellos so those aren't all you ever hear
MS09EndingCabotHouseHelloResetTime.SetValue(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1660_Item_00
Function Fragment_Stage_1660_Item_00()
;BEGIN CODE
actor jackOld = Alias_JackOld.GetActorRef()
actor emogeneOld = Alias_EmogeneOld.GetActorRef()
actor wilhelmina = alias_Wilhelmina.GetActorRef()

; put old versions into the "real" alias
Alias_Jack.ForceRefTo(jackOld)
Alias_Emogene.ForceRefTo(EmogeneOld)

; make sure old versions are enabled
Alias_Emogene.TryToEnable()
Alias_Jack.TryToEnable()

; disable young versions
Alias_JackYoung.TryToDisable()
Alias_EmogeneYoung.TryToDisable()

; kill and disable Wilhelmina
Alias_Wilhelmina.TryToKill()
Alias_Wilhelmina.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1750_Item_00
Function Fragment_Stage_1750_Item_00()
;BEGIN CODE
setStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1820_Item_00
Function Fragment_Stage_1820_Item_00()
;BEGIN AUTOCAST TYPE ms09script
Quest __temp = self as Quest
ms09script kmyQuest = __temp as ms09script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GiveLorenzoSerum()
; put player back in Cabot House faction so they can use stuff in house
Game.GetPlayer().AddToFaction(CrimeCabotHouse)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1850_Item_00
Function Fragment_Stage_1850_Item_00()
;BEGIN CODE
setStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1950_Item_00
Function Fragment_Stage_1950_Item_00()
;BEGIN CODE
Alias_Edward.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Update Global for Radio News
RadioDCMS09Ready.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CabotHouseFrontDoor Auto Const

ObjectReference Property MS09IntroEdwardMarker001 Auto Const

ReferenceAlias Property Alias_Edward Auto Const

ReferenceAlias Property Alias_Jack Auto Const

Scene Property MS09CabotHouseIntroUninvited Auto Const

ObjectReference Property MS09IntroJackMarker001 Auto Const

Explosion Property MS09IntroExplosion Auto Const

ObjectReference Property MS09IntroExplosionMarker Auto Const

Scene Property MS09CabotHouseIntroInvited Auto Const

Quest Property MS09Intro Auto Const

ReferenceAlias Property Alias_PowerStationActivator Auto Const

ReferenceAlias Property Alias_Package Auto Const

Scene Property MS09CabotHouseMission2Looping Auto Const

LeveledItem Property Mission1Reward Auto Const

Scene Property MS09CabotHouseMission2Jack Auto Const

Quest Property MS09Mission01 Auto Const

Quest Property MS09Mission02 Auto Const

ReferenceAlias Property Alias_Emogene Auto Const

ObjectReference Property MS09EmogeneRescueMarker Auto Const

Book Property MS09ChurchoftheAtomFlier Auto Const

Scene Property MS09Mission3Intro Auto Const

Scene Property MS09Mission3IntroEdward Auto Const

Scene Property MS09Mission3ParsonsScene01 Auto Const

ObjectReference Property MS09BossCorridorDoor01 Auto Const

ObjectReference Property MS09BossCorridorDoorFinal Auto Const

ObjectReference Property ParsonsMainDoorExterior Auto Const

ObjectReference Property ParsonsAsylumWingDoor Auto Const

ObjectReference Property ParsonsOfficeWingDoor Auto Const

ReferenceAlias Property Alias_Lorenzo Auto Const

ObjectReference Property MS09BossRoomWindowTEMP Auto Const

ReferenceAlias Property Alias_Wilhelmina Auto Const

ObjectReference Property MS09ParsonsBasementSecretDoor Auto Const

ObjectReference Property MS09Mission3CabotHouseEdwardMarker001 Auto Const

ImageSpaceModifier Property FadetoBlackImod Auto Const

ObjectReference Property MS09Mission3CabotHouseEntityMarker001 Auto Const

Scene Property MS09Mission3CabotHouseFreezeScene Auto Const

Scene Property MS09Mission3EntityScene01 Auto Const

RefCollectionAlias Property Alias_ParsonsExteriorGuards Auto Const

ReferenceAlias Property Alias_ParsonsGuardCaptain Auto Const

Faction Property PlayerFaction Auto Const

Faction Property ParsonsGuardFaction Auto Const

ObjectReference Property MS09RaiderEnableMarker Auto Const

Scene Property MS09Mission3IntroLooping Auto Const

ReferenceAlias Property Alias_ParsonsOfficeTarget Auto Const

ReferenceAlias Property Alias_LorenzoCellDoor Auto Const

Scene Property MS09ParsonsBossRoomKillLorenzo Auto Const

Scene Property MS09ParsonsBossRoomFreeLorenzo Auto Const

Faction Property LorenzoCabotFaction Auto Const

Faction Property CrimeCabotHouse Auto Const

ObjectReference Property MS09Mission3CabotHouseLorenzoMarker001 Auto Const

Scene Property MS09Mission3EndingScene01 Auto Const

Faction Property EdwardDeeganFaction Auto Const

Key Property CabotHouseExteriorKey Auto Const

Scene Property MS09Mission3ParsonsExterior01 Auto Const

ObjectReference Property ParsonsOfficeWingDoorChain Auto Const

RefCollectionAlias Property Alias_LorenzoRoomRaiders Auto Const

ObjectReference Property MS09Mission3CabotHouseEndingJackMarker01 Auto Const

LeveledItem Property MS09LorenzoCabotWeapon Auto Const

ObjectReference Property MS09ParsonsLorenzoLightsOutMarker Auto Const

Scene Property MS09ParsonsRaiderIntroScene Auto Const

DN019Script Property DN019 Auto Const

LeveledItem Property Mission2Reward Auto Const

Quest Property DN031 Auto Const

ObjectReference Property MS09IntroJackUninvitedStartMarker Auto Const

ObjectReference Property MS09IntroJackWorkbenchMarker Auto Const

RefCollectionAlias Property Alias_CabotHouseLockedInteriorDoors Auto Const

Scene Property MS09CabotHouseIntroEdwardServeDrinks Auto Const

ObjectReference Property MS09IntroPlaceDrinksMarker Auto Const

Potion Property IntroDrinksPotion Auto Const
{base object for drink served in intro}

Quest Property MS09MiscParsons Auto Const

ReferenceAlias Property Alias_CabotHouseLabDoor Auto Const

LeveledItem Property Mission1RewardBonus Auto Const
{extra if the player returns the serum}

Potion Property MS09LorenzoSerum Auto Const

Scene Property MS09Mission3CabotHouseToParsons Auto Const

ReferenceAlias Property Alias_CabotHouseDiningRoomDoor Auto Const

Scene Property MS09Mission3IntroLeaveCabotHouse Auto Const

ReferenceAlias Property Alias_LorenzoRoomRaiderBoss Auto Const

Scene Property MS09ParsonsBossRoomRaiders Auto Const

Faction Property RaiderFaction Auto Const

Faction Property CaptiveFaction Auto Const

ActorValue Property Assistance Auto Const

ObjectReference Property MS09BossCorridorDoor02 Auto Const

ObjectReference Property MS09BossCorridorDoor03 Auto Const

ObjectReference Property MS09SetStage1400 Auto Const

Weapon Property MS09JackRadiationGun Auto Const

Scene Property MS09Mission3EndingLorenzoFight Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS09Ready Auto Const

ReferenceAlias Property Alias_CabotHouseMapMarker Auto Const

ReferenceAlias Property Alias_Magnolia Auto Const

MagnoliaSongsScript Property DialogueGoodneighborMagnoliaSongs Auto Const

ReferenceAlias Property Alias_EmogeneYoung Auto Const

Faction Property MS09LorenzoRoomFriendsFaction Auto Const

Scene Property MS09Mission3ParsonsRaiderScene02 Auto Const

Scene Property MS09ParsonsBossRoomRaiderEnd Auto Const

Scene Property MS09ParsonsBossRoomRaidersLooping Auto Const

ReferenceAlias Property Alias_JackOld Auto Const

ReferenceAlias Property Alias_EmogeneOld Auto Const

ReferenceAlias Property Alias_JackYoung Auto Const

GlobalVariable Property MS09EndingCabotHouseHelloResetTime Auto Const

ObjectReference Property MS09Mission3CabotHouseEndingEmogeneMarker01 Auto Const

ObjectReference Property MS09Mission3JackMoveToParsonsMarker Auto Const

ReferenceAlias Property Alias_Ham Auto Const

ReferenceAlias Property Alias_ParsonsJackOfficeTerminal Auto Const

ReferenceAlias Property Alias_ParsonsControlRoomTerminal Auto Const

Scene Property MS09Mission3ParsonsInterior02 Auto Const

Scene Property MS09Mission3ParsonsInterior03 Auto Const

ReferenceAlias Property Alias_LorenzoCellForceField Auto Const

ReferenceAlias Property Alias_LorenzoCellDoorAnimating Auto Const

ObjectReference Property MS09GeneratorFX01 Auto Const

ObjectReference Property MS09GeneratorFX02 Auto Const

ObjectReference Property MS09GeneratorFX03 Auto Const

ObjectReference Property MS09GeneratorFX04 Auto Const

ObjectReference Property MS09CabotHouseEndingEnableMarker Auto Const

ObjectReference Property KlaxonLight01 Auto Const

ObjectReference Property KlaxonLight02 Auto Const

ObjectReference Property KlaxonLight03 Auto Const

ObjectReference Property KlaxonSound Auto Const

Weather Property CommonwealthRain Auto Const

MusicType Property MUSDread06x Auto Const

MusicType Property MUSStinger03x Auto Const

Idle Property JackReactToExplosion Auto Const

LeveledItem Property Mission3Reward Auto Const

Scene Property MS09Mission3ParsonsInterior04 Auto Const Mandatory

loadelevatorpanelscript Property MS09ElevatorPanel Auto Const

loadelevatorpanelscript Property MS09ElevatorPanelB Auto Const

loadelevatorpanelscript Property MS09BasementElevatorButtonWorking Auto Const

loadelevatorpanelscript Property MS09JacksOfficeElevatorButtonWorking Auto Const

ObjectReference Property MS09ElevatorLoad Auto Const
