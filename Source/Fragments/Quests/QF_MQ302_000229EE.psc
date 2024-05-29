;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302_000229EE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ206.SetStage(0)
MQ206.SetStage(100)
MQ206.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
setStage(0)
MQ206BoS.SetStage(1000)
MQ206BoS.SetStage(1050)
MQ206BoS.SetStage(1100)
MQ302BoS.Start()
kmyQuest.MQ302Faction.SetValueInt(1)
setStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
setStage(0)
Min301.SetStage(0)
kmyQuest.MQ302Faction.SetValueInt(2)
SetStage(10)
MQ302Min.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
kmyQuest.initialized = false

; Close off quests that'll get in the way
pRR101.Stop()
pRR102.SetStage(800)
pRR102.Stop()

setStage(0)
MQ206RR.SetStage(1000)
MQ206RR.SetStage(1050)
MQ206RR.SetStage(1100)
kmyQuest.MQ302Faction.SetValueInt(3)
kmyquest.InitializeQuest()
MQ302RR.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
kmyquest.InitializeQuest()
InstituteDefaultLighting.DisableNoWait()
Alias_MagicDoorToMassFusion.getReference().EnableNoWait()
Alias_MagicDoorToMassFusion02.getReference().EnableNoWait()
SetStage(100)

InstOldRoboticsDoor01.EnableNoWait()
InstOldRoboticsDoor02.EnableNoWait()

If MQ302Faction.GetValue()==1
kmyquest.CombatUpdate()
BrotherhoodofSteelFaction.SetPlayerEnemy(false)
elseif MQ302Faction.GetValue()==2
kmyquest.CombatUpdate()
MinutemenFaction.SetPlayerEnemy(false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Put synth shaun in a package to follow the player
;Condition some happy/relieved hellos
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Put synth shaun in a package to leave the teleporter
;Condition some angry/disappointed hellos
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
MQ302RR.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
; set by faction quests, used by package conditions
;disable the water and correct pipe door in Institute
MMMarker.disableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(355)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1355)
else
MQ302RR.SetStage(355)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0357_Item_00
Function Fragment_Stage_0357_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(357)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1357)
else
MQ302RR.SetStage(357)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(360)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1360)
else
MQ302RR.SetStage(360)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
shaun.GetActorReference().SetValue(Health,1)
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(400)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1400)
else
;Handle kicking player out of Institute, since it hasn't happened
(MQ00 as MQ00Script).MQFactionKickoutPlayer(4)
Game.GetPlayer().RemoveFromFaction(InstituteFaction)
MQ302RR.SetStage(400)
endif
InstituteMapMarker.Disable()
Game.GetPlayer().AddItem(PulseCharge.GetReference())
ReactorActivator.GetReference().Enable()
;Need to open the Old Robotics Load Door
OldRoboticsDoorNoUse.disable()

;Set checkpoint faction global
float fMQ302Faction = MQ302Faction.GetValue()

if fMQ302Faction == 1
  RECheckpointMQWonBoS.SetValue(1)
elseif fMQ302Faction == 2
  RECheckpointMQWonMin.SetValue(1)
elseif fMQ302Faction == 3
  RECheckpointMQWonRR.SetValue(1)
endif

;Initial checkpoint defenders
RECheckpointsParent.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(425)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1425)
else
MQ302RR.SetStage(425)
endif

;enable the trigger that calls the elevator down to the concourse level
DN136_ElevatorTrigger.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(430)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1430)
else
MQ302RR.SetStage(430)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0435_Item_00
Function Fragment_Stage_0435_Item_00()
;BEGIN CODE
;Player has gone down elevator heading toward Father's quarters, move the quest target to other elevator
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Player has used Father's elevator and is now in his quarters, move quest target to terminal
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
MQ302Evacuate.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(460)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1460)
else
MQ302RR.SetStage(460)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(500)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1500)
else
MQ302RR.SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(PulseCharge.GetReference())
;Enable the inaccessible door in Old Robotics
OldRoboticsDoorNoUse.Enable()
DN136_Attack.SetStage(1300)
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(600)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1600)
else
MQ302RR.SetStage(600)
endif
; send cleanup event for REs:
REParent.SendCustomEvent("RECheckForCleanup")
; turn off REs until MQ302 is over
REEnabled.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_Detonator.GetReference().Enable()
ChildShaun.GetReference().MoveTo(ChildShaunMarker)
ChildShaun.GetActorReference().RemoveFromFaction(InstituteFaction)
ChildShaun.GetReference().Enable()
ChildShaun.GetActorReference().SetGhost(true)
ChildShaun.GetActorReference().EvaluatePackage()

; flag current companion as witness
ObjectReference myCompanion = Companion.GetRef()
if myCompanion
	myCompanion.SetValue(MQ302Companion, 1)
endif

Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=False)
Utility.Wait(2.0)


If MQ302Faction.GetValue() == 1
	MQ302BoS.SetStage(700)
elseif MQ302Faction.GetValue() == 2
	MQ302Min.SetStage(1700)
else
	MQ302RR.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(710)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1710)
else
MQ302RR.SetStage(710)
endif
;preload Mass Fusion
Alias_MagicDoorToMassFusion.getReference().PreloadTargetArea()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(720)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1720)
else
MQ302RR.SetStage(720)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(730)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1730)
else
MQ302RR.SetStage(730)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
MassFusionWeatherTrigger.enable()
(MassFusionCardReader01 as IDCardReaderScript).LockdownIDCardReader(TRUE)
(MassFusionCardReader02 as IDCardReaderScript).LockdownIDCardReader(TRUE)
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(740)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1740)
else
MQ302RR.SetStage(740)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
;Make sure Mass Fusion is set up to receive the player.
DN084.SetStage(15)

(FactionLeader as TeleportReferenceAlias).TeleportOut()


Utility.Wait(1.0)

kmyquest.TeleportFollowers(MQ302MassFusionDogmeatMarker, MQ302MassFusionFollowerMarker)
; flag follower as a witness
ObjectReference currentCompanion = Companion.GetRef()
if currentCompanion
	currentCompanion.SetValue(MQ302Companion, 1)
endif

;Enable collision on Mass Fusion also enables the Weather Trigger on Mass Fusion
EndGameCollisionMarker.enable()
;Disable anything on Mass Fusion we don't want on the roof
EndGameMassFusionMarker.disable()
(MassFusionCardReader01 as IDCardReaderScript).LockdownIDCardReader(TRUE)
(MassFusionCardReader02 as IDCardReaderScript).LockdownIDCardReader(TRUE)


kmyquest.ControlToggle(0)
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Alias_MagicDoorToMassFusion.getReference().Activate(Game.GetPlayer())
;SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
If MQ302Faction.GetValue() == 3
Z114.GetReference().Moveto(MassFusionLeaderMarker.GetReference(),100)
endif
Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=False)
FactionLeader.GetReference().Moveto(MassFusionLeaderMarker.GetReference())
FactionLeader.GetReference().Enable()
(FactionLeader as TeleportReferenceAlias).TeleportIn()
Utility.Wait(2.0)
kmyquest.ControlToggle(1)

;update stages
If MQ302Faction.GetValue() == 1
MQ302BoS.SetStage(800)
elseif MQ302Faction.GetValue() == 2
MQ302Min.SetStage(1800)
else
MQ302RR.SetStage(800)
endif
;stop DN136_Attack quest
DN136_Attack.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
Utility.Wait(0.5)
(FXInstNukeControlMarker as FXInstNukeFXControlScript).NukeBlast()

;Move CIT map marker link to new location
CITMapMarkerLink.MoveTo(CITMapMoveToMarker)
;turn off Institute radio broadcasts
RadioDCInstBroadcast.SetValueInt(0)
RadioInstituteQuest.Stop()
kmyQuest.SetPostInstituteExplosionState()
Utility.Wait(15)
FadeToBlackImod.Apply()
Utility.Wait(10)
SetStage(855)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_01
Function Fragment_Stage_0850_Item_01()
;BEGIN CODE
;followersScript.SendAffinityEvent(self, CA__CustomEvent_MQ302EvacuateInstitute)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_02
Function Fragment_Stage_0850_Item_02()
;BEGIN CODE
;followersScript.SendAffinityEvent(self, CA__CustomEvent_MQ302DoNotEvacuateInstitute)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0855_Item_00
Function Fragment_Stage_0855_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
Utility.Wait(0.1)


;Release weather override
Weather.ReleaseOverride()

(MQ00 as MQ00Script).EndGameBinks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; set forcegreet actor value on appropriate companions
int i = 0
while i < EndingSceneCompanions.Length
	ObjectReference theCompanion = EndingSceneCompanions[i].GetRef()
	theCompanion.SetValue(FollowerEndgameForceGreetOn, 1)
	i += 1
endWhile

If MQ302Faction.GetValue() == 1
	MQ302BoS.SetStage(900)
elseif MQ302Faction.GetValue() == 2
	MQ302Min.SetStage(1900)
else
	MQ302RR.SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
;followersScript.SendAffinityEvent(self, CA__CustomEvent_MQ302EvacuateInstitute)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_02
Function Fragment_Stage_0900_Item_02()
;BEGIN CODE
;followersScript.SendAffinityEvent(self, CA__CustomEvent_MQ302DoNotEvacuateInstitute)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq302script
Quest __temp = self as Quest
mq302script kmyQuest = __temp as mq302script
;END AUTOCAST
;BEGIN CODE
kmyquest.FastTravelToggle(1)
;disable Mass Fusion Collision
EndGameCollisionMarker.disable()
(MassFusionCardReader01 as IDCardReaderScript).LockdownIDCardReader(FALSE)
(MassFusionCardReader02 as IDCardReaderScript).LockdownIDCardReader(FALSE)

; set Globals for MQ Completion

MQComplete.SetValue(1)
PlayerInstitute_Destroyed.SetValue(1)

;set global so Coursers can't use teleport grenades anymore
LL_ChanceNone_SynthCourserTeleport.SetValue(100)

;set appropriate faction global and shut down corresponding quest
if MQ302Faction.GetValue() == 1
MQWonBoS.SetValue(1)

elseif MQ302Faction.GetValue() == 2
MQWonMin.SetValue(1)

elseif MQ302Faction.GetValue() == 3
MQWonRR.SetValue(1)

endif

; see if Minutemen questline needs to advance
MinutemenCentralQuest.CheckForMQAdvance()

;Update stage for kid synth conversations
DialogueInstituteShaunKid.SetStage(40)

;Update Global for Radio News
pRadioDCMQ302Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Flag Railroad quests for clean up
pRRKickOut.SetStage(300)

; If "Human Error" is still running at this point it needs to be shut down
if ( pMS17.GetStage() < 700 )
  pMS17.SetStage(765)
endif

; If player somehow never completed InstKickOut, complete it now
if InstKickOut.GetStage() < 200 && InstKickOut.GetStage() >=10
InstKickOut.SetStage(200)
endif

; set timer for Minutemen post-quest hellos
MQ302MinPostQuestTimer.SetValue(Utility.GetCurrentGameTime() + 14.0); hellos last 2 weeks

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ302InstituteDestroyedAV)

; add achievements

Game.AddAchievement(8)
Game.AddAchievement(50)

; turn REs back on
REEnabled.SetValue(1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

Quest Property MQ206 Auto Const

Quest Property MQ206BoS Auto Const

Quest Property MQ206RR Auto Const

Quest Property MQ206Min Auto Const

mq301script Property MQ301 Auto Const

ObjectReference Property InstituteStartRef Auto Const

ReferenceAlias Property Shaun Auto Const

Quest Property MQ302BoS Auto Const

Scene Property MQ302BoS_Maxson_InsideInstitute Auto Const

ObjectReference Property InstituteDefaultLighting Auto Const

GlobalVariable Property MQ302Faction Auto Const

Quest Property MQ302_Min Auto Const

Quest Property MQ302Min Auto Const

Quest Property MQ302RR Auto Const

GlobalVariable Property pRadioDCMQ302Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

Quest Property MQ00 Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property Alias_Detonator Auto Const

GlobalVariable Property MQWonBoS Auto Const

GlobalVariable Property MQWonMin Auto Const

GlobalVariable Property MQWonRR Auto Const

GlobalVariable Property MQComplete Auto Const

Quest Property MQ207 Auto Const

Quest Property Min301 Auto Const

Quest Property pRRKickOut Auto Const

ObjectReference Property FXInstNukeMarker Auto Const

Explosion Property InstNuke Auto Const

ReferenceAlias Property MassFusionPlayerMarker Auto Const

ReferenceAlias Property MassFusionLeaderMarker Auto Const

ReferenceAlias Property FactionLeader Auto Const

GlobalVariable Property MQ302Evacuate Auto Const

ReferenceAlias Property ChildShaun Auto Const

ObjectReference Property ChildShaunMarker Auto Const

ImageSpaceModifier Property FadetoBlackImod Auto Const

ObjectReference Property FXInstNukeControlMarker Auto Const

ReferenceAlias Property FathersQuartersDoor01 Auto Const

ReferenceAlias Property FathersQuartersDoor02 Auto Const

Quest Property DN084 Auto Const

Quest Property RECheckpointsParent Auto Const

ObjectReference Property InstOldRoboticsDoor01 Auto Const

ObjectReference Property InstOldRoboticsDoor02 Auto Const

ObjectReference Property DN136_ElevatorTrigger Auto Const

Quest Property pMS17 Auto Const

GlobalVariable Property PlayerInstitute_Destroyed Auto Const

ObjectReference Property EndGameCollisionMarker Auto Const

GlobalVariable Property MQ302MinPostQuestTimer Auto Const

GlobalVariable Property LL_ChanceNone_SynthCourserTeleport Auto Const

Keyword Property CA__CustomEvent_MQ302EvacuateInstitute Auto Const

Keyword Property CA__CustomEvent_MQ302DoNotEvacuateInstitute Auto Const

Quest Property DN136_Attack Auto Const

Quest Property DialogueInstituteShaunKid Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

Quest Property MQ302Radio Auto Const

ObjectReference Property MQ302MassFusionDogmeatMarker Auto Const

ObjectReference Property MQ302MassFusionFollowerMarker Auto Const

ActorValue Property Health Auto Const

ReferenceAlias Property Alias_MagicDoorToMassFusion Auto Const

ReferenceAlias Property Alias_MagicDoorToMassFusion02 Auto Const

ObjectReference Property EndGameMassFusionMarker Auto Const

ObjectReference Property CITMapMoveToMarker Auto Const

ObjectReference Property CITMapMarkerLink Auto Const

ObjectReference Property OldRoboticsDoorNoUse Auto Const

ReferenceAlias Property PulseCharge Auto Const

ReferenceAlias Property Z114 Auto Const

ObjectReference Property Inst305ReactorTerminalRef Auto Const

ObjectReference Property MassFusionWeatherTrigger Auto Const

ReferenceAlias Property ReactorActivator Auto Const

ObjectReference Property InstituteMapMarker Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const

SPELL Property TeleportPlayerInSpell Auto Const

ObjectReference Property OldRoboticsNOUSEDoor Auto Const
ReferenceAlias Property Companion Auto Const

ActorValue Property MQ302Companion Auto Const

ReferenceAlias[] Property EndingSceneCompanions Auto Const

ActorValue Property FollowerEndgameForceGreetOn Auto Const

Quest Property RadioInstituteQuest Auto Const



GlobalVariable Property RadioDCInstBroadcast Auto Const Mandatory

Quest Property InstKickOut Auto Const Mandatory

ObjectReference Property Inst305ReactorTriggerRef Auto Const Mandatory

ObjectReference Property ReactorRef Auto Const

ObjectReference Property MassFusionCardReader01 Auto Const

ObjectReference Property MassFusionCardReader02 Auto Const

GlobalVariable Property RECheckpointMQWonBoS Auto Const

GlobalVariable Property RECheckpointMQWonMin Auto Const

GlobalVariable Property RECheckpointMQWonRR Auto Const

ObjectReference Property MMMarker Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const Mandatory

Faction Property MinutemenFaction Auto Const Mandatory

ActorValue Property COMQC_MQ302InstituteDestroyedAV Auto Const

reparentscript Property REParent Auto Const Mandatory

GlobalVariable Property REEnabled Auto Const Mandatory
