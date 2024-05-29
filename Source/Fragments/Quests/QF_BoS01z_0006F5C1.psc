;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS01z_0006F5C1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
SetStage(10)
Alias_BoS01Danse.GetActorRef().MoveTo(BoS101DanseStartMarker)
Game.GetPlayer().MoveTo(BoS101PlayerStartMarker)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoS101Arcjet.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
DN017.SetStage(20)
SetStage(20)
BoS101SceneStage020_Escort.Stop()
SetStage(30)
Alias_BoS01Danse.GetActorRef().MoveTo(BoS01DanseDebugStart)
Game.GetPlayer().MoveTo(BoS01PlayerDebugStart)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoS101Arcjet.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
DN017.SetStage(20)
DN017.SetStage(45)
DN017.SetStage(64)
DN017.SetStage(65)
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)
BoS101Arcjet.SetStage(10)
;SetStage(80)
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(170)
SetStage(180)
SetStage(190)
SetStage(200)
SetStage(205)
Alias_BoS01Danse.GetActorRef().MoveTo(BoS101QSDanseMarker)
Game.GetPlayer().MoveTo(BoS101QSPlayerMarker)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
Alias_BoS01Danse.GetActorRef().AttachModToInventoryItem(ArmorPoweredFrame, PA_T60_Helmet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE bos101questscript
Quest __temp = self as Quest
bos101questscript kmyQuest = __temp as bos101questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE bos101questscript
Quest __temp = self as Quest
bos101questscript kmyQuest = __temp as bos101questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)

;Start-up Escort Scene
kmyquest.RegisterMe()
BoS101SceneStage020_Escort.Start()
BoS01ArcJet.Start()

;Enable BoS101 Walk to Arcjet POIs
BoS101POI.Start()

;Set up Arcjet for the quest.
DN017.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
if isObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()

if BoS101SceneStage020_Escort.IsPlaying() == 1
BoS101SceneStage020_Escort.Stop()
endif

;Disable BoS101 Walk to Arcjet POIs
BoS101POI.Stop()

;Kill Medical Banter Scene if it never completed
if BoSPoliceStation.GetStageDone(40) == 0
BoSPoliceStation.SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
BoS101SceneStage060.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
BoS101SceneStage100.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
if GetStageDone(140) == 0
BoS101SceneStage120.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(40) == 1
SetObjectiveCompleted(40,1)
endif
if IsObjectiveDisplayed(50) == 1
SetObjectiveCompleted(50,1)
endif
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;Call "Crime" on ArcJet just in case Player is in InstituteFaction
if Game.GetPlayer().IsInFaction(InstituteFaction) == 1
DN017_CrimeFactionArcjet.SetPlayerEnemy()
endif

if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveCompleted(20) == 0
SetObjectiveDisplayed(20,0)
endif
if IsObjectiveCompleted(30) == 0
SetObjectiveDisplayed(30,0)
endif
if IsObjectiveCompleted(40) == 0
SetObjectiveDisplayed(40,0)
endif
if IsObjectiveCompleted(50) == 0
SetObjectiveDisplayed(50,0)
endif
if IsObjectiveCompleted(60) == 0
SetObjectiveDisplayed(60,0)
endif
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)
;Utility.Wait(1)
if GetStageDone(120) == 0
Alias_BoS01Danse.GetActorRef().MoveTo(BoS01DanseStage135CatchUpMarker)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
endif
BoS101SceneStage140.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
if IsObjectiveDisplayed(70) == 1
SetObjectiveCompleted(70,1)
endif
BoS101SceneStage150.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
BoS101SceneStage160.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
BoS101SceneStage170.Start()
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
DN017.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
BoS101SceneStage190.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
BoS101SceneStage205.Start()
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveDisplayed(30) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveDisplayed(50) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveDisplayed(60) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveDisplayed(80) == 1
SetObjectiveCompleted(80,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Danse escorts to Cell02
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
if GetStageDone(260) == 0
BoS101SceneStage210.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
if GetStageDone(260) == 0
BoS101SceneStage220.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
if GetStageDone(260) == 0
BoS101SceneStage230.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90,1)
if GetStageDone(260) == 0
BoS101SceneStage240.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
if GetStageDone(260) == 0
SetObjectiveDisplayed(100,1)
endif
BoS101CallForHelp.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90,1)
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(120,1)
BoS101SceneStage210.Stop()
BoS101SceneStage220.Stop()
BoS101SceneStage230.Stop()
BoS101SceneStage240.Stop()
BoS101LoadDoorRef.Lock()
BoS101LoadDoorRef.SetLockLevel(254)
;Alias_BoS01Danse.GetActorRef().MoveTo(BoS101DanseHelpsAtWindowMarker)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
if !DN017.GetStageDone(90)
SetObjectiveDisplayed(125,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(125,1)
SetObjectiveDisplayed(130,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Allow Danse to get up
(DN017 as DN017QuestScript).AllowDanseToRecover()

SetObjectiveCompleted(130,1)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
BoS101CallForHelp.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(125) == 0
SetObjectiveDisplayed(125,0)
endif
if IsObjectiveCompleted(130) == 0
SetObjectiveDisplayed(130,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN CODE
;Warp Danse to the Control Room Catwalk
Actor Danse = Alias_BoS01Danse.GetActorRef()
if (Danse.GetPositionZ() < 850)
     Danse.MoveTo(BoS101ControlRoomTeleportMarker)
EndIf

;Allow Danse to get up
(DN017 as DN017QuestScript).AllowDanseToRecover()

;Danse heads to the control room.
SetStage(290)
Danse.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120,1)
if GetStageDone(305) == 0
BoS101SceneStage300.Start()
SetObjectiveDisplayed(140,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140,1)
if GetStageDone(320) == 0
BoS101SceneStage305.Start()
elseif GetStageDone(320) == 1
SetObjectiveDisplayed(160,1)
BoS101SceneStage320.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
if GetStageDone(320) == 0
SetObjectiveDisplayed(150,1)
elseif GetStageDone(320) == 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150,1)
if GetStageDone(305) == 1
SetObjectiveDisplayed(160,1)
BoS101SceneStage320.Start()
endif

;DN130 - Cambridge PD
;When the player retrieves the DRT, update the state of the Police Station.
DN130.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
if IsObjectiveDisplayed(150) == 1
SetObjectiveCompleted(150,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
;---TEMP: Warp Danse to the Bunker.
Actor Danse = Alias_BoS01Danse.GetActorRef()
Danse.MoveTo(BoS101BunkerTempTeleportMarker)
Danse.EvaluatePackage()

Alias_BoS01Danse.GetActorRef().EvaluatePackage()
if IsObjectiveDisplayed(150) == 1
SetObjectiveCompleted(150,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
BoS101SceneStage350.Start()
if IsObjectiveDisplayed(150) == 1
SetObjectiveCompleted(150,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160,1)
SetObjectiveDisplayed(170,1)
Alias_BoS01Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
if BoS101AwardsGiven.GetValue() == 0
Game.GetPlayer().RemoveItem(Alias_BoS101DRTAlias.GetRef())
CustomItemQuest.SetStage(40)
Game.GetPlayer().AddItem(AmmoFusionCell,50)
BoS101AwardsGiven.SetValue(1)
endif

if BoS100MercWin.GetValue() == 1
Game.GetPlayer().AddItem(Caps001,250)
BoS100MercWin.SetValue(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170,1)
DN017.SetStage(200)
;BoS101Arcjet.SetStage(255)
BoS200.SetStage(10)
CompleteAllObjectives()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS101ArcJetDoneAV)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170,1)

;Quest Clean-Up
DN017.SetStage(200)
;BoS101Arcjet.SetStage(255)
BoS200.SetStage(10)

;BoS Faction Maintenance
BoSJoined.SetValue(1)
BoSKickOut.SetStage(10)
BoSDialoguePrydwen.SetStage(10)

;Update Global for Radio News
RadioDCBoS101Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Kill Medical Banter Scene if it never completed

if BoSPoliceStation.GetStageDone(40) == 0
BoSPoliceStation.SetStage(40)
endif

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS101ArcJetDoneAV)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS01ArcJet Auto Const

ReferenceAlias Property Alias_BoS01Danse Auto Const
ObjectReference Property BoS01PlayerDebugStart Auto Const

ObjectReference Property BoS01DanseDebugStart Auto Const

Quest Property BoS200 Auto Const

Quest Property DN130 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

ObjectReference Property BoSPaladinDanseArmorRef Auto Const

ObjectReference Property BoS101QSDanseMarker Auto Const

ObjectReference Property BoS101QSPlayerMarker Auto Const

Quest Property BoSPoliceStation Auto Const

Quest Property DN017 Auto Const

LeveledItem Property LL_LaserGun_Rifle Auto Const

Ammo Property AmmoFusionCell Auto Const

Armor Property ArmorPoweredFrame Auto Const

ObjectMod Property PA_T60_Helmet Auto Const

GlobalVariable Property BoS101CallForHelp Auto Const

GlobalVariable Property BoS101CellOverride Auto Const

LeveledItem Property Container_Loot_AmmoBox Auto Const

Scene Property BoS101SceneStage060 Auto Const

Scene Property BoS101SceneStage100 Auto Const

Scene Property BoS101SceneStage120 Auto Const

Scene Property BoS101SceneStage140 Auto Const

Scene Property BoS101SceneStage150 Auto Const

Scene Property BoS101SceneStage160 Auto Const

Scene Property BoS101SceneStage170 Auto Const

Scene Property BoS101SceneStage190 Auto Const

Scene Property BoS101SceneStage210 Auto Const

Scene Property BoS101SceneStage220 Auto Const

Scene Property BoS101SceneStage230 Auto Const

Scene Property BoS101SceneStage240 Auto Const

Scene Property BoS101SceneStage305 Auto Const

Scene Property BoS101SceneStage320 Auto Const

Scene Property BoS101SceneStage350 Auto Const

Scene Property BoS101SceneStage360 Auto Const

ObjectReference Property BoS101BunkerTempTeleportMarker Auto Const

ObjectReference Property BoS101ControlRoomTempTeleportMarker Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoS101ArcJet Auto Const

Scene Property BoS101SceneStage300 Auto Const

Scene Property BoS101SceneStage205 Auto Const

GlobalVariable Property BoSJoined Auto Const

Quest Property BoSKickOut Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS101Ready Auto Const

Quest Property BoSDialoguePrydwen Auto Const

Scene Property BoS101SceneStage020_Escort Auto Const

ObjectReference Property BoS101DanseStartMarker Auto Const

ObjectReference Property BoS101PlayerStartMarker Auto Const

ReferenceAlias Property Alias_BoS101DRTAlias Auto Const

ObjectReference Property BoS101DanseHelpsAtWindowMarker Auto Const

Quest Property BoS101POI Auto Const

ObjectReference Property BoS101HelmetEquip Auto Const

GlobalVariable Property XPFactionFinal Auto Const

GlobalVariable Property BoS100MercWin Auto Const

MiscObject Property Caps001 Auto Const

ObjectReference Property BoS101ControlRoomTeleportMarker Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

ObjectReference Property BoS00Transmitter Auto Const

ObjectReference Property BoS01DanseStage135CatchUpMarker Auto Const

ObjectReference Property BoS101LoadDoorRef Auto Const

Faction Property CrimeInstitute Auto Const

Faction Property InstituteFaction Auto Const

ActorValue Property COMQC_BoS101ArcJetDoneAV Auto Const

Faction Property DN017_CrimeFactionArcjet Auto Const

GlobalVariable Property BoS101AwardsGiven Auto Const
