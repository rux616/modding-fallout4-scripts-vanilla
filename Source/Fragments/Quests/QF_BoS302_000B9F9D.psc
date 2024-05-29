;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS302_000B9F9D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(20)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
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
Alias_BoS302Maxson.GetActorRef().MoveTo(BoS302MaxsonMarker)
Alias_BoS302Maxson.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
Game.GetPlayer().MoveTo(BoS302PlayerMarker)
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
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
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
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
Game.GetPlayer().MoveTo(BoS302PlayerBunkerGo)
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
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
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
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
SetStage(10)
Alias_BoS302Danse.GetActorRef().SwitchToPowerArmor(None)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(120)
Game.GetPlayer().MoveTo(BoS302PlayerBunkerExitGo)
Alias_BoS302Danse.GetActorRef().MoveTo(BoS302DanseOutsideMarker)
Alias_BoS302Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
BoS302Disabler.Disable()
Alias_BoS302Danse.GetActorRef().Enable()
Alias_BoS302Danse.GetActorRef().MoveTo(BoS302DanseHoldingCellMarker)
;Alias_BoS302Danse.GetActorRef().SwitchToPowerArmor(none)
Alias_BoS302Danse.GetActorRef().RemoveFromFaction(BrotherhoodofSteelFaction)
Alias_BoS302Danse.GetActorRef().AddToFaction(BoS302DanseFaction)
Alias_BoS302Danse.GetActorRef().SetValue(pAssistance, 0)
BoSPaladinDanseAB.SetEssential(False)
BoSPaladinDanseAB.SetProtected(True)
Alias_BoS302Vertibird.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
BoSEnable.SetStage(40)

;Pull Danse out of his Power Armor as per 84304
Alias_BoS302Danse.GetActorRef().SwitchToPowerArmor(none)

;Danse Armor Handler (Remove From World)
ObjectReference DanseOldArmorRef = Alias_BoS302Danse.GetActorRef().GetLinkedRef(LinkPowerArmor)
Alias_BoS302Danse.GetActorRef().SetLinkedRef(None, LinkPowerArmor)
DanseOldArmorRef.Disable()
DanseOldArmorRef = None

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS302DanseIsSynthAV)

;Prime SwitchToStatic
Alias_BoS302LibertyPrime.GetActorRef().SetRestrained(False)
Alias_BoS302LibertyPrime.GetActorRef().Disable()
BoSLibertyPrimeStaticREF.Enable()
BoSLibertyPrimeStaticREFlights.Enable()

;Clean up BoSM01 Objectives
BoSM01.SetStage(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE BoS302QuestScript
Quest __temp = self as Quest
BoS302QuestScript kmyQuest = __temp as BoS302QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.HaylenSpawn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_BoS302Haylen.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
ListeningPostBravoMapMarker.AddToMap()
Alias_BoS302Danse.GetActorRef().MoveTo(BoS302DanseMarker)
Alias_BoS302Danse.GetActorRef().EvaluatePackage()
Alias_BoS302Danse.GetActorRef().GetActorBase().SetProtected(false)

;Enable Robots and Turrets Outside of Listening Post Bravo, Unlock Elevator and Release Protectons
ListeningPostBravoQuestEnabler.Enable()
listeningPostBravoElevatorTerminal.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(55,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55,1)
SetObjectiveDisplayed(60,1)
Alias_BoS302Ingram.GetActorRef().MoveTo(BoS302BIngramMeetMarker)
Alias_BoS302Ingram.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
Alias_BoS302Ingram.GetActorRef().EvaluatePackage()
Alias_BoS302Danse.GetActorRef().SetValue(Health,5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Alias_BoS302Danse.GetActorRef().KillEssential()
BoS302DanseSolved.SetValue(1)
BoS302DanseExecuted.SetValue(1)
BoS302SuicideHoloRef.Enable()
if GetStageDone(120) == 0
Alias_BoS302Danse.GetActorRef().AddItem(Alias_BoS302Holotag.GetRef())
endif
if IsObjectiveCompleted(60) == 0
SetObjectiveDisplayed(60,0)
endif
if BoSKickOutSoft.GetStageDone(10) == 0
SetStage(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
if GetStageDone(120) == 0
Alias_BoS302Danse.GetActorRef().AddItem(Alias_BoS302Holotag.GetRef())
endif
BoS302ExitBunkerTrigger.Disable()
BoS302MaxsonSetupTrigger.Disable()
BOS302_13_CompanionReactsExecute.Start()
BoS302DanseSolved.SetValue(1)
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)

if IsObjectiveCompleted(60) == 0
SetObjectiveDisplayed(60,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
BoS302EarlyExitTriggerRef.Disable()
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(100,1)
if IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
endif

;Kill Outside Refs
BoS302Turret01.Kill()
BoS302Turret02.Kill()
BoS302Robot01.Kill()

;Add Holotags
Game.GetPlayer().AddItem(Alias_BoS302Holotag.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;Elder Maxson Moves Setup and Maintenance
if GetStageDone(90) == 0 || GetStageDone(170) == 0
BoS302EarlyExitTriggerRef.Disable()
Alias_BoS302Maxson.GetActorRef().RemoveKeyword(AnimFlavorMilitary)
Alias_BoS302Pilot.GetActorRef().Enable()
Alias_BoS302Vertibird.GetActorRef().Enable()
Alias_BoS302Maxson.GetActorRef().MoveTo(BoS302MaxsonOutsideMarker)
Alias_BoS302Maxson.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,0)
BoS302_06_MaxsonStage130.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
Alias_BoS302Danse.GetActorRef().SetValue(Health,5)
BoS302OutsideKill.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)
if IsObjectiveDisplayed(120) == 1
SetObjectiveDisplayed(120,0)
endif
SetObjectiveDisplayed(130,1)
BoS302OutsideKill.SetValue(1)
Alias_BoS302Danse.GetActorRef().SetValue(Health,5)
Alias_BoS302AliasLocker.GetRef().AddItem(BoSRMaxsonWeapon.GetRef())
BoS302MaxsonStage150ExecutesDanse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
Alias_BoS302Maxson.GetActorRef().PlayIdleWithTarget(PairedKillMQ302DanseDeath,Alias_BoS302Danse.GetActorRef())
Alias_BoS302Danse.GetActorRef().KillEssential(Alias_BoS302Maxson.GetActorRef())
BoS302DanseExecuted.SetValue(1)
utility.wait(10)
BOS302_13_CompanionReactsExecute.Start()
Setstage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(140,1)
BoSPaladinDanseAB.SetEssential(true)
BoS302VertibirdScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
;Do Objectives Handling
if IsObjectiveDisplayed(100) == 1
SetObjectiveDisplayed(100,0)
endif
if IsObjectiveDisplayed(120) == 1
SetObjectiveCompleted(120,1)
endif
if IsObjectiveDisplayed(130) == 1
SetObjectiveCompleted(130,1)
endif
SetObjectiveDisplayed(150,1)
if GetStageDone(120) == 0
Alias_BoS302Danse.GetActorRef().AddItem(Alias_BoS302Holotag.GetRef())
endif
Alias_BoS302Maxson.GetActorRef().AddItem(BoSRMaxsonWeapon.GetRef())
BoS302DanseSolved.SetValue(1)
BOS302_13_CompanionReactsExecute.Start()
BoS302ExitBunkerTrigger.Disable()
BoS302MaxsonSetupTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140,1)
SetObjectiveDisplayed(150,1)
BoS302DanseSolved.SetValue(1)

;Launch Postgame for Danse
BoSDansePostGame.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_01
Function Fragment_Stage_0180_Item_01()
;BEGIN CODE
SetObjectiveCompleted(150,1)
SetObjectiveDisplayed(160,1)
BoS302VertibirdScene.Start()
BoS302DanseSolved.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
;Do Vertibird Cleanup If Necessary
BoS302VertibirdScene.Stop()
Alias_BoS302Maxson.GetActorRef().Dismount()
Alias_BoS302Vertibird.GetActorRef().Disable()
Alias_BoS302Maxson.GetActorRef().MoveTo(BoS302MaxsonMarker)
Alias_BoS302Maxson.GetActorRef().EvaluatePackage()
if IsObjectiveDisplayed(160) == 1
SetObjectiveCompleted(160,1)
SetObjectiveDisplayed(170,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.AddAchievement(17)

;Update Global for Radio News
RadioDCBoS302Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Unlock Player Quarters
PrydwenPlayerQuartersDoorRef.Unlock()

;Danse is Follower Again
if GetStageDone(50) == 1
if Alias_BoS302Danse.GetActorRef().IsDead() == 0
BoSPaladinDanse.SwitchToPowerArmor(BoSDanseX01Ref)
Alias_BoS302Danse.GetActorRef().AllowCompanion(false)
Danse_AffinityCondition_PlayerCompletedQuest.SetValue(1)
BoS302DanseExiled.SetValue(1)
BoSDansePostGame.SetStage(20)
endif
endif

;PaladinRank
BoSDialoguePrydwen.SetStage(30)
BoSPaladinSuitPlayerRef.Enable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS302DanseDiedAV)
FollowersScript.FlagCompanionChatEvent(COMQC_BoS302DanseLivedAV)

;Disable the Fast Travel Trigger
BoS302DFTTRef.Disable()

BoS302B.SetStage(10)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoS302Disabler Auto Const

ObjectReference Property BoS302DanseMarker Auto Const

ReferenceAlias Property Alias_BoS302Danse Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

ReferenceAlias Property Alias_BoS302Haylen Auto Const

ObjectReference Property BoS302HaylenSpawnMarker Auto Const

ObjectReference Property ListeningPostBravoMapMarker Auto Const

ReferenceAlias Property Alias_BoS302Holotag Auto Const

Scene Property BoS302DanseStage140 Auto Const

ObjectReference Property BoS302MaxonFlightDeckMarker Auto Const

ReferenceAlias Property Alias_BoS302Maxson Auto Const

Quest Property BoS302B Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoS101 Auto Const

ObjectReference Property BoS302PlayerMarker Auto Const

Quest Property BoSPoliceStation Auto Const

Quest Property BoS200 Auto Const

ActorValue Property Health Auto Const

ObjectReference Property BoS302MaxsonOutsideMarker Auto Const

ReferenceAlias Property Alias_BoS302Vertibird Auto Const

Scene Property BoS302VertibirdScene Auto Const

ObjectReference Property BoS302MaxsonMarker Auto Const

Scene Property BoS302MaxsonStage150ExecutesDanse Auto Const

ObjectReference Property ListeningPostBravoQuestEnabler Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS302Ready Auto Const

Quest Property BoSDialoguePrydwen Auto Const

Quest Property BoSEnable Auto Const

ObjectReference Property ListeningPostBravoElevatorTerminal Auto Const

ObjectReference Property BoSDoors Auto Const

Quest Property BoSDansePostGame Auto Const

GlobalVariable Property BoS302OutsideKill Auto Const

Faction Property BoS302DanseFaction Auto Const

Actor Property BoS302Turret01 Auto Const

Actor Property BoS302Turret02 Auto Const

Actor Property BoS302Robot01 Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Quest Property COMDanse Auto Const

ReferenceAlias Property Alias_BoS302Ingram Auto Const

ObjectReference Property BoS302BIngramMeetMarker Auto Const

GlobalVariable Property BoS302DanseExecuted Auto Const

Quest Property RRKickOut Auto Const

Quest Property BoS303 Auto Const

Quest Property BoS304 Auto Const

GlobalVariable Property BoS302DanseSolved Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS203 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS301 Auto Const

MiscObject Property BoS302DanseHoloTag Auto Const

Quest Property BoS202LinkMQ Auto Const

ObjectReference Property BoS302PlayerBunkerGo Auto Const

ObjectReference Property BoS302PlayerBunkerExitGo Auto Const

ObjectReference Property BoS302DanseOutsideMarker Auto Const

Idle Property PairedKillMQ302DanseDeath Auto Const

ObjectReference Property BoS302SuicideHoloRef Auto Const

ObjectReference Property BoS302EarlyExitTriggerRef Auto Const

ReferenceAlias Property Alias_BoS302AliasLocker Auto Const

ReferenceAlias Property BoSRMaxsonWeapon Auto Const

ObjectReference Property BoSPaladinSuitPlayerRef Auto Const

Scene Property BOS302_13_CompanionReactsExecute Auto Const

ObjectReference Property PrydwenPlayerQuartersDoorRef Auto Const

Quest Property BoSKickOutSoft Auto Const

ReferenceAlias Property Alias_BoS302LibertyPrime Auto Const Mandatory

ObjectReference Property BoSLibertyPrimeStaticREF Auto Const

Keyword Property LinkPowerArmor Auto Const

ObjectReference Property BoS302DanseHoldingCellMarker Auto Const

Furniture Property BoS_Danse_X01 Auto Const

Actor Property BoSPaladinDanse Auto Const

ObjectReference Property BoSDanseX01Ref Auto Const

ObjectReference Property BoS302ExitBunkerTrigger Auto Const

ObjectReference Property BoS302MaxsonSetupTrigger Auto Const

Scene Property BoS302_06_MaxsonStage130 Auto Const

GlobalVariable Property Danse_AffinityCondition_PlayerCompletedQuest Auto Const

ObjectReference Property BoSLibertyPrimeStaticREFlights Auto Const

ActorBase Property BoSPaladinDanseAB Auto Const

ActorValue Property pAssistance Auto Const Mandatory

ObjectReference Property BoS302DFTTRef Auto Const

ReferenceAlias Property Alias_BoS302Pilot Auto Const Mandatory

ActorValue Property COMQC_BoS302DanseIsSynthAV Auto Const

ActorValue Property COMQC_BoS302DanseDiedAV Auto Const

ActorValue Property COMQC_BoS302DanseLivedAV Auto Const

Keyword Property AnimFlavorMilitary Auto Const

Quest Property BoSM01 Auto Const Mandatory

GlobalVariable Property BoS302DanseExiled Auto Const
