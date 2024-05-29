;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206_000B1752 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
pMQ205.SetStage(100)
pMS04SetStage50Trigger.Disable()

;turn off memory den intro
FFGoodneighbor01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;shut down the previous quest
pMQ205.Stop()

;start all the faction branches
pMQ206Bos.Start()
pMQ206RR.Start()
pMQ206Min.Start()

;check to see if the player ever gets kicked out of any faction from here on
kmyquest.RegisterForFactionKickout()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ206HaveChipAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;start Road to Freedom
pRR101.SetStage(103)

;Doctor Amari is no longer essential
Alias_DoctorAmari.GetActorRef().GetActorBase().SetEssential(False)

;Irma is no longer essential
Alias_Irma.GetActorRef().GetActorBase().SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_02
Function Fragment_Stage_0020_Item_02()
;BEGIN CODE
SetObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_03
Function Fragment_Stage_0020_Item_03()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetStage(30)
Utility.Wait(1.0)
pMQ206_003_DesAndTom.Start()

Alias_Desdemona.GetActorRef().EvaluatePackage()
Alias_TinkerTom.GetActorRef().EvaluatePackage()

; Open the secret door to the HQ
pRRSecretDoorBrickRef02.SetOpen()
pRRSecretDoorBrickNavcut02.Disable()     ; Kill the nav mesh cutter by the secret door
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Desdemona.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
Alias_Desdemona.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
; Remove the Courser Chip
Game.GetPlayer().RemoveItem(pMQ205_CourserChip)

pMQ206_005_TinkerTomDecode.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(12)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, abDisplayed=False)
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)

;enable the activate trigger on the scanner
Alias_TinkerTomScannerPlayer.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;don't let the player use the scanner again
Alias_TinkerTomScannerPlayer.GetRef().BlockActivation(True, True)

;update quest
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(12, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30, 1)

;don't run scene if player has been kicked out of the Railroad
If GetStageDone(65) == 0
  pMQ206_006_FinishedDecode.Start()
EndIf

;give player the holotape
ObjectReference HolotapeREF = Alias_CourserChipHolotape.GetRef()
HolotapeREF.Enable()
Game.GetPlayer().AddItem(HolotapeREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30, 1)
SetObjectiveDisplayed(40, 1)

Alias_SignalInterceptorPlans.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_SignalInterceptorPlans.GetRef())

;optional objectives to factions, make sure the player hasn't been kicked out
;Brotherhood of Steel branch
If pPlayerBoS_KickedOut.GetValueInt() == 0
  SetObjectiveDisplayed(50, 1)
EndIf

;always display Minutemen objective
SetObjectiveDisplayed(60, 1)

;Railroad branch
If pPlayerRailroad_KickedOut.GetValueInt() == 0
  SetObjectiveDisplayed(70, 1)
EndIf

;check to see if the player ever gets kicked out of any faction from here on
kmyquest.RegisterForFactionKickout()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ206TeleporterBuildAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddPlatformItems()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddTeleporterItems()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
MUSSpecialHijackerPowerUp.Add()
OBJHijackerPowerUp.Play(Alias_SI_BeamEmitter.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Update Global for Radio News
RadioDCMQ206Ready.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
; create enable layer
kmyQuest.EnableLayer = InputEnableLayer.Create()
; lock controls, don't allow camera switching
kmyQuest.EnableLayer.DisablePlayerControls(abCamSwitch=True)
;force first
;Game.ForceFirstPerson()

;ghost the Faction people so they can't be hit be something like grenades
Alias_FactionLeader.GetActorRef().SetGhost()
Alias_FactionScientist.GetActorRef().SetGhost()

;move the magic door so the Institute preloads
Alias_TeleporterMagicDoor.getRef().Moveto(Game.GetPlayer(), afZOffset=1000)

Utility.Wait(0.1)

;force preloader if needed
Alias_TeleporterMagicDoor.getRef().PreloadTargetArea()

;turn on the institute radio signal
Alias_SI_BeamEmitter.GetRef().MakeRadioReceiver(91.0, 1.0, aOverrideModel=SOMMonoWorldRadio_05000_6dBboost, abNoStatic=True)

;Set stage 0 on MQ207
MQ207.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
ObjectReference myHolotape = Alias_Holotape.GetRef()
; put this in MQ00 alias to keep it a quest object after MQ206 shuts down
MQ206HolotapeAlias.ForceRefTo(myHolotape)
Game.GetPlayer().AddItem(myHolotape)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
(Alias_SI_BeamEmitter as MQ206BeamEmitterAliasScript).PlayerOnPlatform()
Alias_SI_ReflectorPlatform.GetRef().RampRumble(0.5, 0.25, 1600.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;play the sound and animation, wait for it to get to the right state, then trigger the explosion
OBJHijackerTeleportOut2DA.Play(Alias_SI_BeamEmitter.GetRef())

;last animation on Beam Emitter
(Alias_SI_BeamEmitter as MQ206BeamEmitterAliasScript).FireTeleporter()

PlayerREF.AddSpell(TeleportPlayerOutSpell, abVerbose=False)

Utility.Wait(4.0)

;move player
Alias_TeleporterMagicDoor.getRef().Activate(Game.GetPlayer(), abDefaultProcessingOnly=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.AddSpell(TeleportPlayerInSpell, abVerbose=False)
Utility.Wait(2.0)
SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

Game.AddAchievement(7)

; failsafe: make sure player has holotape
; WJS - this is now handled in the individual faction quests when we trigger teleportation
;setStage(600)

; reenable controls
kmyQuest.EnableLayer.EnablePlayerControls()
kmyQuest.EnableLayer.Delete()

;Virgil is no longer essential
Alias_Virgil.GetActorRef().GetActorBase().SetEssential(False)

; reassign faction scientist to home workshop
kmyQuest.AssignFactionScientistToTeleporterWorkshop(false)

;DN053 - Enable Virgil's Act III dialogue.
DN053.SetStage(20)

;DN130 - Cambridge PD
;When the player enters the Institute, update the state of the police station.
if ((BoS201.GetStageDone(100)) || (PlayerBoS_KickedOut.GetValue() > 0))
     DN130.SetStage(60)
EndIf

;move anyone back that we warped previously in case we warped them on a navmesh island
kmyquest.MoveFactionActorsBackHome()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE MQ206Script
Quest __temp = self as Quest
MQ206Script kmyQuest = __temp as MQ206Script
;END AUTOCAST
;BEGIN CODE
;anything we need on shutdown

ObjectReference BeamEmitterREF = Alias_SI_BeamEmitter.GetRef()
ObjectReference ReflectorPlatformREF = Alias_SI_ReflectorPlatform.GetRef()
ObjectReference RelayDishREF = Alias_SI_RelayDish.GetRef()
ObjectReference TerminalREF = Alias_SI_Terminal.GetRef()

Actor FactionLeaderREF = Alias_FactionLeader.GetActorRef()
Actor FactionScientistREF = Alias_FactionScientist.GetActorRef()

; mark all teleporter pieces with "no repair" keyword
BeamEmitterREF.AddKeyword(WorkshopNoRepairKeyword)
ReflectorPlatformREF.AddKeyword(WorkshopNoRepairKeyword)
RelayDishREF.AddKeyword(WorkshopNoRepairKeyword)
TerminalREF.AddKeyword(WorkshopNoRepairKeyword)

; now scrappable
BeamEmitterREF.RemoveKeyword(UnscrappableObject)
ReflectorPlatformREF.RemoveKeyword(UnscrappableObject)
RelayDishREF.RemoveKeyword(UnscrappableObject)
TerminalREF.RemoveKeyword(UnscrappableObject)

;swap out all the Signal Interceptor FX and objects
TerminalREF.PlayAnimation("Destroy")
ReflectorPlatformREF.PlayAnimation("Destroy")
RelayDishREF.PlayAnimation("Destroy")
BeamEmitterREF.PlayAnimation("Destroy")

TerminalREF.SetDestroyed()
ReflectorPlatformREF.SetDestroyed()
RelayDishREF.SetDestroyed()
BeamEmitterREF.SetDestroyed()

;disable the preloader doors
Alias_TeleporterMagicDoor.getRef().Disable()
MQ206InstituteMagicDoorInside.Disable()

;unghost people
FactionLeaderREF.SetGhost(False)
FactionScientistREF.SetGhost(False)

;shut down the faction quests
MQ206BoS.Stop()
MQ206Min.Stop()
MQ206RR.Stop()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ206BackFromInstituteAV)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ205 Auto Const

GlobalVariable Property pPlayerRailroad_JoinedFaction Auto Const

Quest Property pRR101 Auto Const

Scene Property pMQ206_003_DesAndTom Auto Const

Scene Property pMQ206_005_TinkerTomDecode Auto Const

Scene Property pMQ206_006_FinishedDecode Auto Const

Quest Property pMQ206BoS Auto Const

Quest Property pMQ206RR Auto Const

Quest Property pMQ206Min Auto Const

ObjectReference Property pMS04SetStage50Trigger Auto Const

ReferenceAlias Property Alias_Desdemona Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

GlobalVariable Property pPlayerBoS_KickedOut Auto Const

GlobalVariable Property pPlayerInstitute_KickedOut Auto Const

GlobalVariable Property pPlayerRailroad_KickedOut Auto Const

ObjectReference Property InstituteStartRef Auto Const

ReferenceAlias Property Alias_DoctorAmari Auto Const

ReferenceAlias Property Alias_Irma Auto Const

ReferenceAlias Property Alias_Sturges Auto Const

ReferenceAlias Property Alias_Virgil Auto Const

Quest Property DN130 Auto Const

GlobalVariable Property XPActTwoSmall Auto Const

GlobalVariable Property XPActTwoFinal Auto Const

ReferenceAlias Property Alias_Holotape Auto Const

Quest Property MQ207 Auto Const

Quest Property DN053 Auto Const

ReferenceAlias Property Alias_SI_BeamEmitter Auto Const

Idle Property IdleSynthTeleportOut Auto Const

Explosion Property TeleportOutFXExplosion Auto Const

Light Property TeleportInFXLight Auto Const

Explosion Property TeleportFXExplosion Auto Const

Idle Property IdleTeleport Auto Const

EffectShader Property TeleportOut1stFXS Auto Const

VisualEffect Property CameraAttachTeleportFXE Auto Const

EffectShader Property TeleportInFXS Auto Const

ReferenceAlias Property Alias_TeleporterMagicDoor Auto Const

sound Property OBJHijackerTeleportOut2DA Auto Const

SoundCategorySnapshot Property CSHijackerTeleportPlayer Auto Const

ObjectReference Property MQ206InstituteMagicDoorInside Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const

Quest Property BoS201 Auto Const

Quest Property FFGoodneighbor01 Auto Const

ReferenceAlias Property MQ206HolotapeAlias Auto Const
{alias on MQ00 to keep the holotape a quest object after MQ206 shuts down}

ObjectReference Property pRRSecretDoorBrickRef02 Auto Const

ObjectReference Property pRRSecretDoorBrickNavcut02 Auto Const

Quest Property MQ206BoS Auto Const

Quest Property MQ206Min Auto Const

Quest Property MQ206RR Auto Const

ReferenceAlias Property Alias_SignalInterceptorPlans Auto Const

ReferenceAlias Property Alias_TinkerTomScannerPlayer Auto Const

ReferenceAlias Property Alias_TinkerTomScanner Auto Const

ReferenceAlias Property Alias_CourserChipHolotape Auto Const

MiscObject Property pMQ205_CourserChip Auto Const

ReferenceAlias Property Alias_SI_ReflectorPlatform Auto Const

ReferenceAlias Property Alias_SI_RelayDish Auto Const

ReferenceAlias Property Alias_SI_Terminal Auto Const

GlobalVariable Property RadioDCMQ206Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

Keyword Property WorkshopNoRepairKeyword Auto Const

LocationAlias Property Alias_RailroadHQLocation Auto Const

SPELL Property TeleportPlayerInSpell Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const

Keyword Property UnscrappableObject Auto Const

ReferenceAlias Property Alias_FactionLeader Auto Const Mandatory

ReferenceAlias Property Alias_FactionScientist Auto Const Mandatory

MusicType Property MUSSpecialHijackerPowerUp Auto Const Mandatory

Sound Property OBJHijackerPowerUp Auto Const Mandatory

OutputModel Property SOMMonoWorldRadio_05000_6dBboost Auto Const Mandatory

ActorValue Property COMQC_MQ206HaveChipAV Auto Const

ActorValue Property COMQC_MQ206BackFromInstituteAV Auto Const

ActorValue Property COMQC_MQ206TeleporterBuildAV Auto Const
