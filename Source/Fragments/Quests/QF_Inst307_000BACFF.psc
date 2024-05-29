;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst307_000BACFF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;quick start
Game.GetPlayer().AddToFaction(InstituteFaction)
InstituteMapMarker.AddToMap(True)
Game.GetPlayer().Moveto(Shaun.GetReference())
Inst307StartScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_MadisonLi.GetReference().Moveto(AdvSysMarker)
Alias_MadisonLi.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(15)
Alias_Evan.GetReference().MoveTo(AdvSysMarker)
Alias_Evan.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
If GetStageDone(10)
SetObjectiveCompleted(10)
else
SetObjectiveCompleted(15)
endif
SetObjectiveDisplayed(30)

;set Shaun essential just to prevent player from breaking the end of the quest line
Shaun.GetActorReference().SetEssential(true)
Alias_AllieFilmore.GetActorReference().SetEssential(true)
Alias_DeanVolkert.GetActorReference().SetEssential(true)
Alias_ClaytonHoldren.GetActorReference().SetEssential(true)

Inst307Fight.SetStage(10)
(PrydwenDestructionRef as PrydwenDestructionScript).SwapPrydwen()
;Hand over the beacons
Game.GetPlayer().AddItem(InstituteBeaconGrenade, 3)

;In the event player has previously hit the emergency relay button, reset it

if (InstEmergencyRelayTriggerRef as InstituteEmergencyRelayTriggerScript ).ReadyToGo==1
(InstEmergencyRelayTriggerRef as InstituteEmergencyRelayTriggerScript ).ReadyToGo=0
endif

;make companions not care about murder in the location
((self as quest) as CompanionMurderLocationToggleScript).OkayToMurderInBrotherhoodHQ()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE Inst307QuestScript
Quest __temp = self as Quest
Inst307QuestScript kmyQuest = __temp as Inst307QuestScript
;END AUTOCAST
;BEGIN CODE
;If player is in Institute location when we hit this stage, means he walked into Relay trigger
;so move him to airport start marker
if Game.GetPlayer().GetCurrentLocation() == InstituteLocation || InstituteLocation.IsChild(Game.GetPlayer().GetCurrentLocation()) 
Debug.Trace("Inst307 stage 30 script fired")
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
kmyquest.PlayerRelayedtoAirport=1
Utility.Wait(4.0)
Game.GetPlayer().MoveTo(AirportRelayMarker.GetReference())
endif

SetObjectiveCompleted(30)
SetObjectiveDisplayed(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0036_Item_00
Function Fragment_Stage_0036_Item_00()
;BEGIN CODE
SetObjectiveCompleted(33)
SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
;Player has destroyed the first Teleport Jammer (Helipad)
ModObjectiveGlobal(1, Inst307GeneratorCurrent, 35)
if Inst307GeneratorCurrent.GetValue() == 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0038_Item_00
Function Fragment_Stage_0038_Item_00()
;BEGIN CODE
;Player has destroyed the second Teleport Jammer (Control Tower)
ModObjectiveGlobal(1, Inst307GeneratorCurrent, 35)
if Inst307GeneratorCurrent.GetValue() == 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0039_Item_00
Function Fragment_Stage_0039_Item_00()
;BEGIN CODE
;Player has destroyed the third Teleport Jammer (Ruined Terminal)
ModObjectiveGlobal(1, Inst307GeneratorCurrent, 35)
if Inst307GeneratorCurrent.GetValue() == 3
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE Inst307QuestScript
Quest __temp = self as Quest
Inst307QuestScript kmyQuest = __temp as Inst307QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.PlayerRelayedToAirport==1
Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=False)
Utility.Wait(2.0)
endif
SetObjectiveCompleted(30)
SetObjectiveDisplayed(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
;SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
If Game.GetPlayer().GetItemCount(InstituteBeaconGrenade) >= 1
SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(40) == 0
SetObjectiveDisplayed(40,0)
endif
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Prime.PlayAnimation("PrimeScan")
BoSLibertyPrimeStaticRefLights.PlayAnimation("PrimeScan")
Inst307PrimeRefHackingLightRef.PlayAnimation("PrimeScan")
Inst307LibertyPrimeOnlineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
;Force the remaining Inst307Fight enemies to flee.
Inst307Fight.SetStage(395)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_PrydwenDestroyedByInstituteAV)

;Disable the radios at Easy City Downs to prevent interference with the crash.
DN035_EasyCityRadioOverrides.Start()

; flag companion as witness
actor companion = Alias_Companion.GetActorRef()
if companion
	companion.SetValue(DestroyBOSCompanion, 1)
endif

(PrydwenDestructionRef as PrydwenDestructionScript).SwapArm()
(PrydwenDestructionRef as PrydwenDestructionScript).StartCrash(True)
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
CourserTeleport.GetReference().Moveto(Game.GetPlayer())
Utility.Wait(0.3)
CourserTeleport.GetReference().Enable()
CourserTeleportScene.Start()
Debug.Trace("Continuance")
Utility.Wait(5.5)
SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN AUTOCAST TYPE Inst307QuestScript
Quest __temp = self as Quest
Inst307QuestScript kmyQuest = __temp as Inst307QuestScript
;END AUTOCAST
;BEGIN CODE
;disable fast travel and player controls
kmyquest.ControlToggle(0)
(CourserTeleport  as TeleportReferenceAlias).TeleportOut()
if CourserTeleport.GetReference().IsEnabled() == False
CourserTeleport.GetReference().Moveto(VantagePointMarkerCourser.GetReference())
endif
;;Utility.Wait(0.1)
(Inst307Fight as Inst307FightQuestScript).RemoveMusicOverride()
CourserTeleport.GetReference().Moveto(VantagePointMarkerCourser.GetReference())
Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
Utility.Wait(4.0)
Game.GetPlayer().RemoveItem(InstituteBeaconGrenade, 3,true)
Game.GetPlayer().Moveto(VantagePointMarker.GetReference())
;Game.GetPlayer().AddSpell(TeleportSpel)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=False)
Inst307Fight.SetStage(1000) ;Shut down and clean up the fight once the player is away.

CourserTeleport.GetReference().Moveto(VantagePointMarkerCourser.GetReference())
CourserTeleport.GetReference().Enable()
CourserTeleport.GetActorReference().GetLeveledActorBase().SetInvulnerable(false)
Utility.Wait(15)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE Inst307QuestScript
Quest __temp = self as Quest
Inst307QuestScript kmyQuest = __temp as Inst307QuestScript
;END AUTOCAST
;BEGIN CODE
;Re-enable controls and fast travel
kmyquest.ControlToggle(1)

CompleteAllObjectives()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Inst307InstituteWinsAV)

MQComplete.SetValue(1)
MQWonInst.SetValue(1)
PlayerBOS_Destroyed.SetValue(1)
PlayerBOS_DestroyedFaction.SetValue(4)

;Check RECheckpoint global
RECheckpointMQWonInst.SetValue(1)

;remove essential status from Shaun
Shaun.GetActorReference().SetEssential(false)

Inst308.SetStage(10)

; set forcegreet actor value on appropriate companions
int i = 0
while i < EndingSceneCompanions.Length
	ObjectReference theCompanion = EndingSceneCompanions[i].GetRef()
	theCompanion.SetValue(FollowerEndgameForceGreetOn, 1)
	i += 1
endWhile

; set timer for Minutemen post-quest hellos
Inst307MinPostQuestTimer.SetValue(Utility.GetCurrentGameTime() + 14.0); hellos last 2 weeks

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Inst308 Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property Shaun Auto Const

Scene Property Inst307StartScene Auto Const

ReferenceAlias Property AirportRelayMarker Auto Const

ObjectReference Property InstituteMapMarker Auto Const

Weapon Property InstituteBeaconGrenade Auto Const

ReferenceAlias Property Alias_Generator1 Auto Const

ReferenceAlias Property Alias_Generator2 Auto Const

ReferenceAlias Property Alias_Generator3 Auto Const

ObjectReference Property PrydwenDestructionRef Auto Const

ReferenceAlias Property CourserTeleport Auto Const

Scene Property CourserTeleportScene Auto Const

ReferenceAlias Property VantagePointMarker Auto Const

ReferenceAlias Property VantagePointMarkerCourser Auto Const

GlobalVariable Property Inst307GeneratorCurrent Auto Const

GlobalVariable Property MQComplete Auto Const

GlobalVariable Property MQWonInst Auto Const

Quest Property Inst307Fight Auto Const

ObjectReference Property BoSLibertyPrimeStaticREF Auto Const

Scene Property Inst307LibertyPrimeOnlineScene Auto Const


;;TEMP
EffectShader Property pTeleportOutFXS Auto Const
Light Property pTeleportOutFieldLight Auto Const
sound Property teleportOutSound Auto Const
EffectShader Property TeleportInFXS Auto Const
EffectShader Property TeleportOutFXS Auto Const
light Property TeleportInFXLight Auto Const
Explosion Property TeleportFXExplosion Auto Const
Explosion Property TeleportOutFXExplosion Auto Const
Idle Property IdleSynthTeleportLandB Auto Const
Idle Property IdleSynthTeleportOut Auto Const

Location Property InstituteLocation Auto Const

Quest Property RECheckpointParent Auto Const

GlobalVariable Property PlayerBOS_Destroyed Auto Const

SPELL Property TeleportSpel Auto Const

Quest Property DN035_EasyCityRadioOverrides Auto Const

ObjectReference Property Prime Auto Const

ObjectReference Property BoSLibertyPrimeStaticREFlights Auto Const

ObjectReference Property inst307PrimeRefHackingLightRef Auto Const

ObjectReference Property InstEmergencyRelayTriggerRef Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const

SPELL Property TeleportPlayerInSpell Auto Const

ReferenceAlias[] Property EndingSceneCompanions Auto Const

ActorValue Property FollowerEndgameForceGreetOn Auto Const

ReferenceAlias Property Alias_Companion Auto Const

ActorValue Property DestroyBOSCompanion Auto Const Mandatory

GlobalVariable Property PlayerBOS_DestroyedFaction Auto Const Mandatory

GlobalVariable Property Inst307MinPostQuestTimer Auto Const Mandatory

ReferenceAlias Property Alias_MadisonLi Auto Const Mandatory

ReferenceAlias Property Alias_Evan Auto Const Mandatory

ObjectReference Property AdvSysMarker Auto Const

GlobalVariable Property RECheckpointMQWonInst Auto Const

ActorValue Property COMQC_PrydwenDestroyedByInstituteAV Auto Const

ActorValue Property COMQC_Inst307InstituteWinsAV Auto Const

ReferenceAlias Property Alias_AllieFilmore Auto Const Mandatory

ReferenceAlias Property Alias_DeanVolkert Auto Const Mandatory

ReferenceAlias Property Alias_ClaytonHoldren Auto Const Mandatory
