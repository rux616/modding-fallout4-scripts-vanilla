;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS304_00107A1C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSDialoguePrydwen.SetStage(30)
Alias_BoS302BKells.GetActorRef().MoveTo(BoS302BQuestGiverMarker)
Debug.Trace("MoveIngram")
Alias_BoS302BIngram.GetActorRef().MoveTo(BoS302BIngramMeetMarker)
Debug.Trace("MoveIngramDone")
BoSDoors.Enable()
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
BoSPoliceStation.Stop()
BoS200.Stop()
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
RR101.Stop()
OldNorthChurchGhoulEnabler.Disable()
Utility.Wait(2)

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS302BLibertyPrime.getActorReference().setrestrained(false)
Alias_BoS302BLibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
BoSLibertyPrimeStaticREF.enable()

Game.GetPlayer().MoveTo(BoS302BStartMarker)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)

;Move Kells to Start Position
Alias_BoS302BKells.GetActorRef().MoveTo(BoS302BQuestGiverMarker)
Alias_BoS302BKells.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE BoS302BQuestScript
Quest __temp = self as Quest
BoS302BQuestScript kmyQuest = __temp as BoS302BQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)

;Railroad is now enemy
RRKickout.SetStage(100)
RailroadHQMapMarkerRef.Disable()
Alias_BoS302BPAM.GetActorRef().RemoveFromFaction(RailroadFaction)
RRHQSecretEntranceDoor.Lock(true)
RRHQSecretEntranceDoor.SetLockLevel(254)
BoS302BPAMEnabler.Disable()

;Set secret door closed
RRSecretDoorBrickRef.setOpen(false)
RRSecretDoorNavCut.enable()

;Unlock HQ entrance
RRHQDoor.unlock()

;make companions not care about murder in the location
((self as quest) as CompanionMurderLocationToggleScript).OkayToMurderInRailroadHQ()

;DeathCheck (see if any RR member has already died)
kmyQuest.DeathCheck()

;Get rid of ghouls in the catacombs
OldNorthChurchGhoulEnabler.Disable()

;Move Railroad characters to their locations
kmyQuest.MoveCheck()

;Add Old North Church to Map
OldNorthMapMarkerRef.AddToMap()

;Enabling Railroad Agent Defense
pBoS302RailroadAgentTriggerEnabler.Enable()
pBoS302BAgentEnabler01.Enable()

;Open Secret Door in RRHQ
RRHQDoor.setOpen()
pRRSecretDoorBrickNavcut02.disable()

;Get Secret Door ready for detonation
pRR303DoorExplodeEnableMarker.Enable()

;Give Hacking Tape if BoS303 was running and Ingram was unable to attend briefing
if BoS303.IsRunning() == 1
Game.GetPlayer().AddItem(Alias_BoS302BTape.GetRef())
Game.GetPlayer().AddItem(BoS302BIngramBackupNote,1)
BoS302BTape.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
if BoS302BCarDead.GetValue() == 0
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
elseif BoS302BCarDead.GetValue() == 1
BoS302BDetonationPackRef.Enable()
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(40,1)
SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_BoS302BScribe.TryToEnable()
Alias_BoS302BScribe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
BoS302B_02_ScribeStage045.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
BoS302BDetonationPackRef.Enable()
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)
if BoS302BBossKills.GetValue() < 5
if BoS302BGloryDead.GetValue() == 0
SetObjectiveDisplayed(50,1)
endif
if BoS302BTomDead.GetValue() == 0
SetObjectiveDisplayed(60,1)
endif
if BoS302BDeaconDead.GetValue() == 0
SetObjectiveDisplayed(70,1)
endif
if BoS302BDesDead.GetValue() == 0
SetObjectiveDisplayed(80,1)
endif
if BoS302BPAMDead.GetValue() == 0
SetObjectiveDisplayed(90,1)
SetObjectiveDisplayed(100,1)
endif
elseif BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() +1)

if BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)
BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() +1)

if BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70,1)
BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() +1)

if BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80,1)
BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() +1)

if BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100,1)
BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() +1)

if BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100,0)
SetObjectiveCompleted(90,1)
Alias_BoS302BPAM.GetActorRef().StopCombat()
Alias_BoS302BPAM.GetActorRef().StopCombatAlarm()
BoS302BBossKills.SetValue(BoS302BBossKills.GetValue() +1)

if BoS302BBossKills.GetValue() >= 5
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(110,1)
RRHQSecretEntranceDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)

;If PAM was Reprogrammed
if GetStageDone(130) == 1
BoSPAMPostGame.SetStage(10)
endif

BoSAirport_Gate_EnableMarker.Disable()
BoS304GateOpen.Enable()
BoSAirport_GateVehicles_EnableMarker.Disable()
Stop()

;Quest Ending Logic
if BoS303.GetStageDone(255) == 1
BoS304.SetStage(20)
elseif BoS303.GetStageDone(10)== 0
BoS303.SetStage(10)
endif

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS302BRRDestroyedAV)

;VendorSetup
BoS302BRRAmmo.SetValue(0)

; Flag that the Railroad has been destroyed
pPlayerRailroad_Destroyed.SetValue(1)
RRHQSecretEntranceDoor.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()

;Resolve Secret Door Detonation and Detonation Pack if it hasn't been completed
Debug.Trace("BOSKICKOUT-RR FIXES")
if GetStageDone(30) == 1 && GetStageDone(60) == 0
pRR303DoorExplodeEnableMarker.Disable()
Debug.Trace("BOSKICKOUT-Restoring Door State")
endif
if GetStageDone(40) == 1 && GetStageDone(60) == 0
BoS302BDetonationPackRef.Disable()
Debug.Trace("BOSKICKOUT-Restoring Detonator")
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS302BMaxson Auto Const

ReferenceAlias Property Alias_BoS302BIngram Auto Const

ReferenceAlias Property Alias_BoS302BCarrington Auto Const

ReferenceAlias Property Alias_BoS302BGlory Auto Const

ReferenceAlias Property Alias_BoS302BDeacon Auto Const

ReferenceAlias Property Alias_BoS302BTom Auto Const

ReferenceAlias Property Alias_BoS302BDesdemona Auto Const

ReferenceAlias Property Alias_BoS302BPAM Auto Const

ObjectReference Property BoS302BDeaconMarker Auto Const

ObjectReference Property BoS302BDesdemonaMarker Auto Const

ObjectReference Property BoS302BGloryMarker Auto Const

ObjectReference Property BoS302BPAMMarker Auto Const

ObjectReference Property BoS302BTinkerTomMarker Auto Const

ObjectReference Property BoS302BCarringtonMarker Auto Const

ObjectReference Property BoS302BQuestGiverMarker Auto Const

Quest Property RR101 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

GlobalVariable Property BoS302BBossKills Auto Const

Faction Property RailroadFaction Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property BoS302BPAMEnabler Auto Const

ObjectReference Property BoS302BDetonationPackRef Auto Const

ObjectReference Property RRSecretDoorBrickRef Auto Const

Quest Property BoS303 Auto Const

ObjectReference Property BoS302BIngramMarker Auto Const

ObjectReference Property BoS302BStartMarker Auto Const

ObjectReference Property OldNorthChurchGhoulEnabler Auto Const

ReferenceAlias Property Alias_BoS302BKells Auto Const

ObjectReference Property BoS302BIngramMeetMarker Auto Const

ReferenceAlias Property Alias_BoS302BScribe Auto Const

Scene Property BoS302B_02_ScribeStage045 Auto Const

ObjectReference Property BoSAirport_GateVehicles_EnableMarker Auto Const

ObjectReference Property BoSAirport_Gate_EnableMarker Auto Const

ObjectReference Property pBoS302RailroadAgentTriggerEnabler Auto Const

ObjectReference Property pBoS302BAgentEnabler01 Auto Const

ObjectReference Property RRHQDoor Auto Const

ObjectReference Property RRSecretDoorNavCut Auto Const

Quest Property BoSEnable Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoSPoliceStation Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoS304 Auto Const

ObjectReference Property pRRSecretDoorBrickRef02 Auto Const

ObjectReference Property pRRSecretDoorBrickNavcut02 Auto Const

ObjectReference Property pRRSecretDoorBrickNavcut Auto Const

Quest Property BoSDialoguePrydwen Auto Const

ObjectReference Property BoSDoors Auto Const

Quest Property BoSPAMPostGame Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ObjectReference Property OldNorthMapMarkerRef Auto Const

GlobalVariable Property pPlayerRailroad_Destroyed Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS203 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS301 Auto Const

Quest Property BoS302 Auto Const

GlobalVariable Property PlayerRailroad_Destroyed Auto Const

ObjectReference Property BoS304GateOpen Auto Const

GlobalVariable Property BoS302BDesDead Auto Const

GlobalVariable Property BoS302BTomDead Auto Const

GlobalVariable Property BoS302BCarDead Auto Const

GlobalVariable Property BoS302BGloryDead Auto Const

GlobalVariable Property BoS302BDeaconDead Auto Const

Quest Property BoS202LinkMQ Auto Const

ObjectReference Property pRR303DoorExplodeEnableMarker Auto Const

GlobalVariable Property BoS302BRRAmmo Auto Const

ReferenceAlias Property Alias_BoS302BLibertyPrime Auto Const Mandatory

ObjectReference Property BoSLibertyPrimeStaticREF Auto Const

ObjectReference Property RailroadHQMapMarkerRef Auto Const

ObjectReference Property RRHQSecretEntranceDoor Auto Const

GlobalVariable Property BoS302BPAMDead Auto Const

ReferenceAlias Property Alias_BoS302BTape Auto Const Mandatory

GlobalVariable Property BoS302BTape Auto Const

Book Property BoS302BIngramBackupNote Auto Const

ActorValue Property COMQC_BoS302BRRDestroyedAV Auto Const

Quest Property RRKickOut Auto Const
