;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS202_000537FF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
Game.GetPlayer().MoveTo(BoSPFD)
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
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(60)
SetStage(70)
SetStage(75)
Game.GetPlayer().MoveTo(BoS202IntStart)
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
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
SetStage(10)
SetStage(20)
Game.GetPlayer().MoveTo(BoS202PilotStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set the state in the dungeon to clear elevator path
;pDN046.setstage(50)
;Changed to now clearing path in stage 20
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Alias_BoS202Maxson.GetActorRef().MoveTo(BoS202MaxsonMarker)
Alias_BoS202VertibirdPilot.TryToEnable()
Alias_BoS202VertibirdPilot.GetActorRef().SetGhost()
Alias_BoS202Vertibird.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
BoS202VertibirdScene.Start()
FortStrongMapMarkerRef.AddToMap()
VertibirdTurretScript turret =Alias_BoS202Vertibird.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation(False, True)
endif

;Setup Fort Strong and Vertibird
Alias_BoS202Behemoth.GetActorRef().Enable()
Alias_BoS202VertibirdPilot.GetActorRef().SetGhost()
Alias_BoS202Vertibird.GetActorRef().SetGhost(false)

;Reset Cells
pDN046.setstage(50)
FortStrong01.Reset()
FortStrong02.Reset()
FortStrongZone.Reset()

;Weather Transition
CommonwealthClear.SetActive(false,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE BoS202Quest
Quest __temp = self as Quest
BoS202Quest kmyQuest = __temp as BoS202Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20,1)
kmyQuest.EnableLayer = InputEnableLayer.Create()
kmyQuest.EnableLayer.EnableFastTravel(false)
Game.GetPlayer().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30,1)
SetObjectiveDisplayed(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;This stage is triggered at Fort Strong
if IsObjectiveDisplayed(20) == 1
SetObjectiveDisplayed(20,0)
endif
if IsObjectiveDisplayed(30) == 0
SetObjectiveDisplayed(30,1)
endif
if IsObjectiveDisplayed(40) == 0
SetObjectiveDisplayed(40,1)
endif
if IsObjectiveDisplayed(50) == 0
SetObjectiveDisplayed(50,1)
endif

;Spawn wave of ground SM's
BoS202SMEnabler.Enable()
Game.GetPlayer().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)

;Completion Check
BoS202Objective.SetValue(BoS202Objective.GetValue() + 1)
if BoS202Objective.GetValue() >= 3
Setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)

;Completion Check
BoS202Objective.SetValue(BoS202Objective.GetValue() + 1)
if BoS202Objective.GetValue() >= 3
Setstage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)

;Completion Check
BoS202Objective.SetValue(BoS202Objective.GetValue() + 1)
if BoS202Objective.GetValue() >= 3
Setstage(100)
endif

;Disable vertibird
Alias_BoS202Vertibird.GetActorRef().Disable()
Alias_BoS202VertibirdPilot.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Spawn Danse - Or have him speak to Player if he's Companion
if Alias_BoS202Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 0
Alias_BoS202Danse.GetActorRef().MoveTo(BoS202DanseSpawnMarker)
Alias_BoS202Danse.GetActorRef().EvaluatePackage()
elseif Alias_BoS202Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 1 && Alias_BoS202Danse.GetActorRef().IsInLocation(FortStrongLocation) == 1
Alias_BoS202Danse.GetActorRef().DisallowCompanion(true)
WorkshopParent.UnassignActor((Alias_BoS202Danse.GetRef() as WorkshopNPCScript),true)
Alias_BoS202Danse.GetActorRef().EvaluatePackage()
elseif Alias_BoS202Danse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 1 && Alias_BoS202Danse.GetActorRef().IsInLocation(FortStrongLocation) == 0
Alias_BoS202Danse.GetActorRef().DisallowCompanion(true)
WorkshopParent.UnassignActor((Alias_BoS202Danse.GetRef() as WorkshopNPCScript),true)
Alias_BoS202Danse.GetActorRef().MoveTo(BoS202DanseSpawnMarker)
Alias_BoS202Danse.GetActorRef().EvaluatePackage()
endif
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_BoS202Danse.GetActorRef().AllowCompanion(false)
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(BoSVertibirdGrenade,8)
BoS202GGiven.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70,1)
if MQ206.GetStageDone(200) == 0
BoS202LinkMQ.Start()
elseif MQ206.GetStageDone(200) == 1 && MQ207.GetStageDone(1) == 0
;Don't Do Anything
elseif MQ206.GetStageDone(200) == 1 && MQ207.GetStageDone(1) == 1 && MQ206TeleporterFaction.GetValue() != 1
BoSMQPortAlreadyDone.SetValue(1)
BoS203.SetStage(10)
endif

;BoSM00 - BoS Misc Quests now available from Captain Kells.
BoSM00.Start()

;Update Global for Radio News
RadioDCBoS202Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Start Global for VFT
BoSFastTravelCanUse.SetValue(1)
pBoSFlaresNotAvailable.SetValue(0)   ; Teagan now sells flares

;Enable Bombs on Prydwen and Disable Bombs at Fort Strong
BoSBombs.Enable()
BoSBombsCleanup.Disable()
BoSBombsBase.Enable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS202FortStrongClearedAV)

;Shut down BoSScene_PoliceStation
BoSScene_PoliceStation.SetStage(50)

;Disable Safety Wall on Prydwen
BoS201SafetyWallRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Force Dismount Player if he's on board
Actor Player = Game.GetPlayer()
if Alias_BoS202Vertibird.GetActorRef().IsBeingRiddenBy(Player)
Player.Dismount()
endif

Alias_BoS202VertibirdPilot.GetActorRef().SetGhost(false)
Alias_BoS202Vertibird.GetActorRef().SetGhost(false)

;Disable Safety Wall on Prydwen
BoS201SafetyWallRef.Disable()

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS202Behemoth Auto Const

ObjectReference Property BoS202MaxsonMarker Auto Const

ReferenceAlias Property Alias_BoS202Maxson Auto Const

ObjectReference Property BoS202DanseSpawnMarker Auto Const

ReferenceAlias Property Alias_BoS202Danse Auto Const

ObjectReference Property BoS202VertibirdFortStrongRef Auto Const

ObjectReference Property BoS202SMEnabler Auto Const

ObjectReference Property BoS202WarptoVertibirdMarker Auto Const

ObjectReference Property BoS202TempVertibirdGunshipRef Auto Const

ObjectReference Property BoSPFD Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ObjectReference Property BoS202IntStart Auto Const

Quest Property pDN046 Auto Const

ObjectReference Property BoS202PilotStartMarker Auto Const

Quest Property BoS202LinkMQ Auto Const

Quest Property MQ206 Auto Const

ReferenceAlias Property Alias_BoS202VertibirdPilot Auto Const

Quest Property BoSM00 Auto Const

ReferenceAlias Property Alias_BoS202Vertibird Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS202Ready Auto Const

Quest Property BoSEnable Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoSPoliceStation Auto Const

Quest Property BoSDialoguePrydwen Auto Const

ObjectReference Property BoSDoors Auto Const

Faction Property CurrentCompanionFaction Auto Const

GlobalVariable Property BoS202GGiven Auto Const

Weapon Property BoSVertibirdGrenade Auto Const

GlobalVariable Property BoSFastTravelCanUse Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

GlobalVariable Property BoS202Objective Auto Const

Weather Property CommonwealthClear Auto Const

ObjectReference Property FortStrongMapMarkerRef Auto Const

ObjectReference Property BoSBombs Auto Const

ObjectReference Property BoSBombsCleanup Auto Const

ObjectReference Property BoSBombsBase Auto Const

Scene Property BoS202VertibirdScene Auto Const

Quest Property MQ207 Auto Const

GlobalVariable Property MQ206TeleporterFaction Auto Const

Quest Property BoS203 Auto Const

GlobalVariable Property BoSMQPortAlreadyDone Auto Const

Quest Property BoSScene_PoliceStation Auto Const

EncounterZone Property FortStrongZone Auto Const

Cell Property FortStrong01 Auto Const

Cell Property FortStrong02 Auto Const

GlobalVariable Property pBoSFlaresNotAvailable Auto Const Mandatory

WorkshopParentScript Property WorkshopParent Auto Const

Location Property FortStrongLocation Auto Const

ActorValue Property COMQC_BoS202FortStrongClearedAV Auto Const

ObjectReference Property BoS201SafetyWallRef Auto Const
