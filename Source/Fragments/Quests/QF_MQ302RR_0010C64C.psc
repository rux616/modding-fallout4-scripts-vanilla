;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302RR_0010C64C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
(MQ302 as MQ302Script).MQ302Faction.SetValueInt(3)
MQ302.SetStage(10)
Desdemona.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
TinkerTom.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)

Desdemona.GetReference().IgnoreFriendlyHits(true)
TinkerTom.GetReference().IgnoreFriendlyHits(true)
Z1.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier01.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier01.GetActorReference().GetActorBase().SetInvulnerable(true)
RooftopSoldier02.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier02.GetActorReference().GetActorBase().SetInvulnerable(true)

Z1.GetActorRef().EnableNoWait()

;Soft Kill of BoS Questline if getting this far with MinuteMen
if BoS101.GetStageDone(10) == 1
BoSSoftKickOut.SetStage(10)
endif
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Just in case enable Z1
Z1.GetActorRef().Enable()
Z1.GetActorRef().IgnoreFriendlyHits()   ; Make Z1 ignore getting hit, too

SetObjectiveDisplayed(100)
Desdemona.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
TinkerTom.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RRMQ302BoSDeadAttackInstituteAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(320)
;enable encounters in the Relay Room
Alias_RelayRoomEncounterCollection.enableAll()
Z1.GetReference().Moveto(Z1StartMarker)
RelayRoomDoorRef.SetOpen()

; Set Desdemona as busy - don't unset - she has no post game team meetings
pRRDesdemonaBusy.SetValue(1)

;enable encounters in the Relay Room
Alias_RelayRoomEncounterCollection.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
;DN136_Attack.SetStage(5)

;enable encounters in the Relay Room
Alias_RelayRoomEncounterCollection.enableAll()

(MQ302 as MQ302Script).MQ302Faction.SetValueInt(3) ; Tell MQ302 you're beating the game with the Railroad
MQ302.SetStage(10)

CrimeRailroadHQ.SetPlayerEnemy(False)
(MQ302 as MQ302Script).CombatUpdate()
SetObjectiveCompleted(320)
SetObjectiveDisplayed(325)
Deacon.GetActorReference().SetEssential(true)
Carrington.GetActorReference().SetEssential(true)
Desdemona.GetActorReference().SetEssential(true)
TinkerTom.GetActorReference().SetEssential(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0326_Item_00
Function Fragment_Stage_0326_Item_00()
;BEGIN CODE
;Player has hit one of the scientists
;remove Z from institute faction and add him to railroad faction
;remove player from institute faction as a safety measure
;pop objective to clear the room if not already an objective

;start MQ302 if it wasn't already running
(MQ302 as MQ302Script).MQ302Faction.SetValueInt(3) ; Tell MQ302 you're beating the game with the Railroad
if MQ302.IsRunning()==False
MQ302.SetStage(10)
endif


DN136_Attack.SetStage(5)
Actor Z = Z1.GetActorRef()
Z.AddToFaction(RailroadFaction)
Z.RemoveFromFaction(InstituteFaction)
Alias_Player.GetActorRef().RemoveFromFaction(InstituteFaction)

if(getStageDone(325) == 0)
    SetStage(325)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0327_Item_00
Function Fragment_Stage_0327_Item_00()
;BEGIN CODE
SetObjectiveCompleted(325)
MQ302RR_Z1_UseTerminal.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN AUTOCAST TYPE mq302rrquestscript
Quest __temp = self as Quest
mq302rrquestscript kmyQuest = __temp as mq302rrquestscript
;END AUTOCAST
;BEGIN CODE
Desdemona.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
TinkerTom.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
ObjTeleporterInstitutePre.Play(InstituteStartRef)
Utility.Wait(2.5)
Desdemona.GetReference().Disable()
TinkerTom.GetReference().Disable()
Desdemona.GetReference().MoveTo(TeleportLeaderStartRef)
Desdemona.GetReference().Enable()
Utility.Wait(0.7)
TinkerTom.GetReference().MoveTo(TeleportScientistStartRef)
TinkerTom.GetReference().Enable()
kmyquest.TeleportFollowers(MQ302DogmeatInstituteTeleportRef, MQ302FollowerInstituteTeleportRef)
ObjTeleporterInstitutePost.Play(InstituteStartRef)
SetStage(340)
DN136_Attack.SetStage(10)
SetObjectiveDisplayed(350)
MQ302RR_Desdemona_InstituteArrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(320)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
MQ302RR_Desdemona_OldRobotics.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0357_Item_00
Function Fragment_Stage_0357_Item_00()
;BEGIN CODE
MQ302RR_Tom_PAHacked.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
MQ302RR_Desdemona_BioScience.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400) ; reach reactor
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
MQ302RR_Tom_ConcourseFight01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400,0)
SetObjectiveDisplayed(430)

;Start Z's scene
MQ302RR_Z1_Concourse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
MQ302RR_Tom_PathCleared.Start()
SetObjectiveCompleted(430)
SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(475)
SetObjectiveDisplayed(500)
MQ302RR_Desdemona_PlantCharge.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
Desdemona.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
MQ302RR_Desdemona_ChargePlanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Desdemona.GetReference().Moveto(LeaderRelayMarker)
Desdemona.GetReference().Enable()
(Desdemona as TeleportReferenceAlias).TeleportIn()
Utility.Wait(1.0)
MQ302RR_Desdemona_Tom_Kid.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
SetObjectiveDisplayed(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(710) == 0
SetObjectiveDisplayed(710,0)
endif
SetObjectiveCompleted(700)
SetObjectiveDisplayed(740)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
MQ302RR_Desdemona_DetonateCharge.Start()
SetObjectiveCompleted(740)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; Called from the end game, to queue up Railroad's ending
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;MQ302RR_Desdemona_Final.Start()
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;move tom back to HQ
TinkerTom.GetReference().Moveto(TinkerHomeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
ChildShaun.GetReference().MoveTo(MQ302ShaunRRMarker)
ChildShaun.GetActorReference().SetOutfit(KidOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Queue Desdemona up to fast travel to Railroad HQ
pDialogueRailroad.SetStage(479)

CompleteAllObjectives()
MQ302RR_Desdemona_Z1_Roof.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MQ302.SetStage(1000)

Desdemona.GetReference().IgnoreFriendlyHits(false)
TinkerTom.GetReference().IgnoreFriendlyHits(false)
Z1.GetReference().IgnoreFriendlyHits(false)


;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ302RR_Desdemona_PlantCharge Auto Const

Scene Property MQ302RR_Desdemona_ChargePlanted Auto Const

Scene Property MQ302RR_Desdemona_DetonateCharge Auto Const

Scene Property MQ302RR_Desdemona_Final Auto Const

ObjectReference Property Z1StartMarker Auto Const

ReferenceAlias Property Z1 Auto Const

ObjectReference Property RelayRoomDoorRef Auto Const

ReferenceAlias Property Desdemona Auto Const

ReferenceAlias Property TinkerTom Auto Const

ActorValue Property TeleportRefCollOptionalRequired Auto Const

ObjectReference Property TeleportLeaderStartRef Auto Const

ObjectReference Property TeleportScientistStartRef Auto Const

Quest Property DN136_Attack Auto Const

Quest Property MQ302 Auto Const

GlobalVariable Property MQ302Faction Auto Const

Quest Property BoS101 Auto Const

Quest Property BoSSoftKickOut Auto Const

Scene Property MQ302RR_Tom_ConcourseFight01 Auto Const

Scene Property MQ302RR_Tom_PathCleared Auto Const

Scene Property MQ302RR_Tom_PAHacked Auto Const

Scene Property MQ302RR_Desdemona_OldRobotics Auto Const

Scene Property MQ302RR_Desdemona_BioScience Auto Const

Scene Property MQ302RR_Z1_UseTerminal Auto Const

ObjectReference Property MQ302DogmeatInstituteTeleportRef Auto Const

ObjectReference Property MQ302FollowerInstituteTeleportRef Auto Const

Quest Property Followers Auto Const

RefCollectionAlias Property Alias_RelayRoomEncounterCollection Auto Const

ObjectReference Property TinkerHomeMarker Auto Const

Faction Property RailroadFaction Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property Alias_Player Auto Const

Scene Property MQ302RR_Z1_Concourse Auto Const

Scene Property MQ302RR_Desdemona_InstituteArrival Auto Const

Scene Property MQ302RR_Desdemona_Z1_Roof Auto Const

ReferenceAlias Property Carrington Auto Const

ReferenceAlias Property Deacon Auto Const

Scene Property MQ302RR_Desdemona_Tom_Kid Auto Const Mandatory

ObjectReference Property LeaderRelayMarker Auto Const

ObjectReference Property MQ302ShaunRRMarker Auto Const

ReferenceAlias Property ChildShaun Auto Const

Outfit Property KidOutfit Auto Const

Quest Property pDialogueRailroad Auto Const Mandatory

Sound Property OBJTeleporterInstitutePre Auto Const Mandatory

Sound Property OBJTeleporterInstitutePost Auto Const Mandatory

ObjectReference Property InstituteStartRef Auto Const Mandatory

GlobalVariable Property pRRDesdemonaBusy Auto Const Mandatory

ReferenceAlias Property RooftopSoldier01 Auto Const

ReferenceAlias Property RooftopSoldier02 Auto Const

Faction Property CrimeRailroadHQ Auto Const Mandatory

ActorValue Property COMQC_RRMQ302BoSDeadAttackInstituteAV Auto Const
