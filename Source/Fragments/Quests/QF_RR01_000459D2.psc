;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR01_000459D2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RR101Script
Quest __temp = self as Quest
RR101Script kmyQuest = __temp as RR101Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()

; register quest script for remote events:
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

; Teleport actors to where they belong
Utility.Wait(0.1)
Alias_Desdemona.GetActorRef().MoveTo(pRR101DesdemonaStartMarker)
Alias_Deacon.GetActorRef().MoveTo(pRR101DeaconStartMarker)
Alias_Glory.GetActorRef().MoveTo(pRRGloryInitialMarker)
Alias_DrummerBoy.GetActorRef().MoveTo(pRRDrummerBoyMarker)

; Make all the player activators non-activatable
Alias_Mark01.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark02.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark03.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark04.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark05.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark06.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark07.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark08.GetReference().BlockActivation(TRUE, TRUE)
Alias_TrailClue.GetReference().BlockActivation(TRUE, TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; TODO: Remove this debug script!
Alias_Piper.GetRef().MoveTo(Game.GetPlayer())
Followers.SetCompanion(Alias_Piper.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
; TODO: Remove this debug stage - it can break things
pDialogueDiamondCityEntrance.Start()
pDialogueDiamondCityEntrance.Stop()
SetStage(50)
;Debug.Trace(pDialogueDiamondCityEntrance.IsStopped())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Move Piper towards Nat, ready for her to have her scene
;Alias_Piper.GetRef().MoveTo(pDmndRR01PiperStartMarker)
;Alias_Piper.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
; PC knows about "Follow the Freedom Trail"
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
; PC knows about "Follow the Freedom Trail"
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0107_Item_00
Function Fragment_Stage_0107_Item_00()
;BEGIN CODE
; PC knows about "Follow the Freedom Trail"
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0108_Item_00
Function Fragment_Stage_0108_Item_00()
;BEGIN CODE
; PC knows about "Follow the Freedom Trail"
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0109_Item_00
Function Fragment_Stage_0109_Item_00()
;BEGIN CODE
; PC knows about "Follow the Freedom Trail"
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Show the objective
SetObjectiveDisplayed(100, true)

; Make all the player activators activatable
Alias_Mark01.GetReference().BlockActivation(FALSE)
Alias_Mark02.GetReference().BlockActivation(FALSE)
Alias_Mark03.GetReference().BlockActivation(FALSE)
Alias_Mark04.GetReference().BlockActivation(FALSE)
Alias_Mark05.GetReference().BlockActivation(FALSE)
Alias_Mark06.GetReference().BlockActivation(FALSE)
Alias_Mark07.GetReference().BlockActivation(FALSE)
Alias_Mark08.GetReference().BlockActivation(FALSE)
;Alias_TrailClue.GetReference().BlockActivation(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveFailed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; FYI - This stage is called from RR101StartOfTrailTrigger

; Objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

;if ( !GetStageDone(120) )   ; If you haven't already talked to Tour Bot, get an optional objective
;  SetObjectiveDisplayed(120)
;endif

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RR101StartTrailAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_01
Function Fragment_Stage_0300_Item_01()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(100, true)
SetObjectiveCompleted(200, true)

; Make all the puzzle elements non-interactive now
Alias_Mark01.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark02.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark03.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark04.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark05.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark06.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark07.GetReference().BlockActivation(TRUE, TRUE)
Alias_Mark08.GetReference().BlockActivation(TRUE, TRUE)
Alias_TrailClue.GetReference().BlockActivation(TRUE, TRUE)

; Once the puzzle is solved disabled the foreshadowing Deacons
pDeaconAtBunkerHillREF.Disable()
pDeaconAtDiamondCityREF.Disable()
pDeaconMemoryDenEnableMarker.Disable()
pDeaconGoodneighborEnableMarker.Disable()

;Disable Door Navcut
pRRSecretDoorBrickNavcut.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Music!
pMUSStingerShort05x.Add()

; Just in case - teleport Dez and Deacon to their spots
Alias_Desdemona.GetActorRef().MoveTo(pRR101DesdemonaStartMarker)
Alias_Deacon.GetActorRef().MoveTo(pRR101DeaconStartMarker)

; Check to see if the player is a big deal
int nPlayerLevel = Game.GetPlayer().GetLevel()
bool bMinutemenGeneral = pMin02.GetStageDone(1000)   ; PC is general of Minutemen
bool bSilverShroud = pMS04.GetStageDone(1300)             ; PC is the Silver Shroud
if ( nPlayerLevel <= 8 && !bMinutemenGeneral && !bSilverShroud )
  SetStage(615)
endif

; Play a sound for the lights
int instanceID = pOBJLightsPowerOn.play(Game.GetPlayer())
Sound.SetInstanceVolume(instanceID, 1.0)

; Lock the player's controls
InputEnableLayer EnableLayer = InputEnableLayer.Create()
EnableLayer.DisablePlayerControls(abMovement = true, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = true, \
		abMenu = true, abActivate = false, abJournalTabs = false, abVATS = false, abFavorites = false)

; Start the scene
pRR101FirstMeetingLightEnabler.enable()
pRR101_0600_01_Railroad_Intro.Start()
Alias_Desdemona.GetActorRef().EvaluatePackage()
Alias_Glory.GetActorRef().EvaluatePackage()
Alias_DrummerBoy.GetActorRef().EvaluatePackage()

; Wait for just a bit then unlock
Utility.Wait(4.0)
EnableLayer.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0606_Item_00
Function Fragment_Stage_0606_Item_00()
;BEGIN CODE
; If Glory hasn't stood down - then she'll warn the player about getting too close to Dez
if ( !GetStageDone(710) )
  pRR101_GloryWarnsClosingIn.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0607_Item_00
Function Fragment_Stage_0607_Item_00()
;BEGIN CODE
; If Glory hasn't stood down - then she'll warn the player about leaving the meeting
if ( !GetStageDone(710) )
  pRR101_GloryWarnsBackingUp.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0608_Item_00
Function Fragment_Stage_0608_Item_00()
;BEGIN CODE
; If Glory hasn't stood down - then she opens fire
if ( !GetStageDone(710) )
  pRR101_GloryBarksOnAttack.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0609_Item_00
Function Fragment_Stage_0609_Item_00()
;BEGIN CODE
; Railroad is now the enemy
pPlayerFaction.SetEnemy(pRailroadFaction)

; Stop Desdemona scenes
pRR101_0600_01_Railroad_Intro.Stop()
pRR101_0600_01a_MQ206CourserChip.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; Make them switch packages
Alias_Glory.GetActorRef().EvaluatePackage()
Utility.Wait(0.3)
Alias_DrummerBoy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Show the objective
SetObjectiveCompleted(100, true)
SetObjectiveCompleted(200, true)
SetObjectiveCompleted(400, true)

; Desdemona makes an announcement
;pRR101_XXX_04_Desdemona_Announcement.Start()

; Close the quest
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Show the objective
SetObjectiveCompleted(100, true)
SetObjectiveCompleted(200, true)
SetObjectiveCompleted(400, true)

; Show the objective
SetObjectiveDisplayed(1000, true)

; Open the secret door to the HQ
pRRSecretDoorBrickRef02.SetOpen()
pRRSecretDoorBrickNavcut02.Disable()     ; Kill the nav mesh cutter by the secret door

; TODO: Remove safety net - flag 610 is redundant
SetStage(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1013_Item_00
Function Fragment_Stage_1013_Item_00()
;BEGIN CODE
; Now the Railroad is hostile to the PC
pRailroadFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; And close down the quest
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Set the stage of the next Railroad quest
pRR102.SetStage(50)

; Flag that the player knows about the Institute and Synths
pPlayerKnowsInstitute.SetValue(1)
pPlayerKnowsSynths.SetValue(1)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_RR101MetDesdemonaNoJoinAV)

; Close off the quest
SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
; All open objectives fulfilled
CompleteAllObjectives()

; Resolve the Talk to Tour Bot objective
SetObjectiveFailed(120)

;Update Global for Radio News
RadioDCRR101Ready.SetValue((GameDaysPassed.GetValue() + 1))

; End quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Complete all the objectives that make sense
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(400)

; Fail everything and end
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Piper Auto Const

ObjectReference Property pDmndRR01PiperStartMarker Auto Const

Quest Property pDialogueDiamondCityEntrance Auto Const

Message Property pRR101_TempFirstMarker Auto Const

FollowersScript Property Followers Auto Const

GlobalVariable Property pPlayerKnowsSuperMutants Auto Const

Quest Property pRR102 Auto Const

Faction Property pRailroadFaction Auto Const

Faction Property pPlayerFaction Auto Const

ReferenceAlias Property Alias_Desdemona Auto Const

ObjectReference Property pRR101DesdemonaStartMarker Auto Const

Scene Property pRR101_0600_01_Railroad_Intro Auto Const

ReferenceAlias Property Alias_Deacon Auto Const

ObjectReference Property pRR101DeaconStartMarker Auto Const

ObjectReference Property pRRGloryInitialMarker Auto Const

ReferenceAlias Property Alias_Glory Auto Const

ObjectReference Property pRRDrummerBoyMarker Auto Const

ReferenceAlias Property Alias_DrummerBoy Auto Const

Quest Property pMQ00 Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCRR101Ready Auto Const

ObjectReference Property pRRSecretDoorBrickRef02 Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

ReferenceAlias Property Alias_Mark01 Auto Const
ReferenceAlias Property Alias_Mark02 Auto Const
ReferenceAlias Property Alias_Mark03 Auto Const
ReferenceAlias Property Alias_Mark04 Auto Const
ReferenceAlias Property Alias_Mark05 Auto Const
ReferenceAlias Property Alias_Mark06 Auto Const
ReferenceAlias Property Alias_Mark07 Auto Const
ReferenceAlias Property Alias_Mark08 Auto Const

ReferenceAlias Property Alias_TrailClue Auto Const

ActorBase Property PDeaconAtBunkerHill Auto Const

ObjectReference Property pDeaconAtBunkerHillREF Auto Const

ObjectReference Property pDeaconAtDiamondCityREF Auto Const

ObjectReference Property pDeaconMemoryDenEnableMarker Auto Const

ObjectReference Property pDeaconGoodneighborEnableMarker Auto Const

ObjectReference Property pRR101FirstMeetingLightEnabler Auto Const

ObjectReference Property pRRSecretDoorBrickNavcut02 Auto Const

sound Property pOBJLightsPowerOn Auto Const

Scene Property pRR101_GloryWarnsClosingIn Auto Const

Scene Property pRR101_GloryWarnsBackingUp Auto Const

Scene Property pRR101_GloryBarksOnAttack Auto Const

Scene Property pRR101_0600_01a_MQ206CourserChip Auto Const

Quest Property pMS04 Auto Const

Quest Property pMin02 Auto Const



MusicType Property pMUSStingerShort05x Auto Const

GlobalVariable Property pPlayerKnowsInstitute Auto Const Mandatory

GlobalVariable Property pPlayerKnowsSynths Auto Const Mandatory

ObjectReference Property pRRSecretDoorBrickNavcut Auto Const Mandatory

ActorValue Property COMQC_RR101StartTrailAV Auto Const

ActorValue Property COMQC_RR101MetDesdemonaNoJoinAV Auto Const
