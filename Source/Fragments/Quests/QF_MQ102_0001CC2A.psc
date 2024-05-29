;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ102_0001CC2A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;we no longer need the preloader doors
MQ101Vault111PostWarMagicDoor.Disable()
MQ203Vault111MagicDoorToPostWar.Disable()

;time is now 9AM
GameHour.SetValueInt(9)

;allow time to advance briefly so the clock on the pipboy gets set
TimeScale.SetValueInt(20)

;wait for the fade-in
;debug.trace(self + "waiting for fade in to be complete")
Utility.Wait(3.0)
;debug.trace(self + "Finished waiting, start scene")
ExitCryoScene.Start()

;player is female, enable male spouse
If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1
  Alias_MQSpouseMale.GetActorRef().EnableNoWait()
Else
  Alias_MQSpouseFemale.GetActorRef().EnableNoWait()
EndIf

; advance the Vault 111 quest so it knows we're out of cryo
pDialogueVault111.SetStage(50)

;stop time again
TimeScale.SetValueInt(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_01
Function Fragment_Stage_0001_Item_01()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
;we block the cryopod activation in the PlayerAlias script

;disable the acoustic space
pVault111CryopodAcousticSpace.Disable()

;enable sound categories
CSMQ101Cryopod.Remove()

;disable visual effects
CameraAttachGroggyWake01FX.Stop(Game.GetPlayer())

;make sure the player can't activate the spouse body until after getting up
Alias_MQSpouseMale.GetActorRef().BlockActivation(true, true)
Alias_MQSpouseFemale.GetActorRef().BlockActivation(true, true)

;register for when the animation finishes, then enable controls, spouse activation, etc
kmyquest.RegisterForAnimationEvent(Game.GetPlayer(), "CameraOverrideStop")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;open the emergency exit
pVault111BlockedDoorEnableParent.Disable()

;open door to cryo
Alias_Vault111QT00.GetRef().Lock(False)
Alias_Vault111QT00.GetRef().SetOpen()

;precache face gen data
;Game.PrecacheCharGen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
;Clear any tutorial messages currently displaying
Message.ClearHelpMessages()

;disable the HDR mask for the pipboy so we don't see a visual pop when it is turned on
Game.EnablePipboyHDRMask(false)

;listen for when the pipboy boot sequence is done, then re-enable controls
kmyquest.RegisterForAnimationEvent(Game.GetPlayer(), "pipboyIdleRoot")

;imod for Pipboy
PipboyAnimInImod.Apply()

;player should not be able to activate the furniture again
Alias_Pipboy.GetRef().BlockActivation(True, True)
Alias_V111Skeleton.GetRef().BlockActivation(True, True)

;Disable all enemies so they can't aggro mid-anim and interrupt
;Vault111RoachEnableParent.Disable()

;Pull any active tutorial messages
Tutorial.SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
pControlPanelScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer = None ; delete the layer, which lets the controls all enable again

;Activate Pipboy navigation tutorial
if !Tutorial.GetStageDone(260)
  Tutorial.SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
;disable controls
kmyquest.VaultDoorConsoleLayer = InputEnableLayer.Create()
kmyquest.VaultDoorConsoleLayer.EnableVATS(False)

;swap dusty pipboy 
Game.GetPlayer().AddItem(pPipboy, abSilent=True)
Game.GetPlayer().EquipItem(pPipboy, abSilent=True)
Game.GetPlayer().RemoveItem(pPipboyDusty, abSilent=True)

Utility.Wait(0.25)

;Play control panel button animation
Actor PlayerREF = Game.GetPlayer()

Alias_Vault111DoorConsoleFurniture.GetRef().Activate(PlayerREF)

;wait for pipboy animation to finish
kmyquest.RegisterForAnimationEvent(PlayerREF, "On")

;wait for the glass to flip
kmyquest.RegisterForAnimationEvent(Alias_ControlPanel.GetRef(), "End")

;wait for the player button press anim
kmyquest.RegisterForAnimationEvent(PlayerREF, "Play01")

(Alias_ControlPanel as MQ03ControlPanelScript).RegisterForAnimationEvent(PlayerREF, "Off")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
;allow VATS and delete the layer
kmyquest.VaultDoorConsoleLayer.EnableVATS()
kmyquest.VaultDoorConsoleLayer = None

DialogueVault111.SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1, abforce=true)

;depress the button
Alias_ControlPanel.GetRef().PlayAnimation("Stage3")
;wait for button to finish depressing
kmyquest.RegisterForAnimationEvent(Alias_ControlPanel.GetRef(), "stage4")

;Force close doors for performance
Vault111ExitDoorREF01.SetOpen(False)
Vault111ExitDoorREF02.SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer = None ; delete the layer, which lets the controls all enable again
(RespecTriggerREF as vaultExitElevatorSCRIPT).DeleteMyInputLayer()

;Fire off tutorial registration events
Tutorial.SetStage(1800)

;Player shocked sigh
pDialogueVault111.SetStage(110)

;achievement
Game.AddAchievement(1)

;Increment the Location Discovered Stat since Vault111 starts visible
Game.IncrementStat("Locations Discovered")

SetObjectiveCompleted(1)
SetObjectiveDisplayed(10, 1)
;Game.RewardPlayerXP(XPActOneSmall.GetValue() as int)

;Update Global for Radio News Story
RadioDCMQ102Ready.SetValue((GameDaysPassed.GetValue() + 1))

;turn on Diamond City Radio
SetStage(15)

;Reenable Pipboy tutorial trigger
;Tutorial.SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Turn on Diamond City Radio
RadioDiamondCity.Start()

;Turn on Classical Radio 
RadioInstituteQuest.Start()

;Also turn on BoSM01 and its Distress Signal radio stations at this point.
BoSM01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pCodsworthHolotape01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_Codsworth.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
Alias_Codsworth.GetActorRef().AddtoFaction(MQ102CodsworthBugFaction)
Alias_ViciousDog01.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
Alias_ViciousDog02.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
Alias_ViciousDog03.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
;Player has talked to Codsworth

;tell player to investigate neighborhood if he hasn't already
If GetStageDone(40) == 0
  SetObjectiveCompleted(10, 1)
  SetObjectiveCompleted(20, 1)
  SetObjectiveDisplayed(30, 1)
EndIf

SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
If GetStageDone(30) == 1
  SetObjectiveDisplayed(30, false)
  SetObjectiveDisplayed(32)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
If GetStageDone(30) == 1
  SetObjectiveCompleted(32)
  SetObjectiveDisplayed(30, abforce = True)
EndIf

;has entire neighborhood been searched?
If GetStageDone(38) == 1
  SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0036_Item_00
Function Fragment_Stage_0036_Item_00()
;BEGIN CODE
If GetStageDone(30) == 1
  SetObjectiveDisplayed(30, false)
  SetObjectiveDisplayed(34)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0038_Item_00
Function Fragment_Stage_0038_Item_00()
;BEGIN CODE
If GetStageDone(30) == 1
  SetObjectiveCompleted(34)
  SetObjectiveDisplayed(30, abforce = True)
EndIf

;has entire neighborhood been searched?
If GetStageDone(34) == 1
  SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
DialogueCodsworthPostWar.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(32)
SetObjectiveCompleted(34)

If GetStage() < 65
  SetObjectiveDisplayed(55)
EndIf

;make sure codsworth doesn't auto-aggro on bugs
Alias_Codsworth.GetActorRef().RemoveFromFaction(MQ102CodsworthBugFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Player reaches Concord around the museum
SetObjectiveCompleted(50, 1)
SetObjectiveDisplayed(55, 1)
; disable triggers
MQ03SetStage55Trigger01REF.Disable()
MQ03SetStage55Trigger02REF.Disable()
MQ03SetStage55Trigger03REF.Disable()
MQ03SetStage55Trigger04REF.Disable()

DN092.setStage(1)
Min00.Start()

;did the player skip over Codsworth?
If GetStageDone(50) == 0
  MQ102SkippedCodsworth.SetValue(1.0)
EndIf

;make sure codsworth doesn't auto-aggro on bugs
Alias_Codsworth.GetActorRef().RemoveFromFaction(MQ102CodsworthBugFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Player is within range of the museum

;cue Garvey scene
PrestonBalconyScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
PrestonBalconyScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
; Player has taken the Musket
Min00.SetObjectiveCompleted(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;update Min00
Min00.SetStage(20)

;Game.RewardPlayerXP(XPActOneFinal.GetValue() as int)

;Preston moves inside
Alias_PrestonGarvey.GetActorRef().EvaluatePackage()

;Dogmeat follows the player
Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
; Player has entered the museum
;failsafe setstage 65 if we haven't already
SetStage(65)

Min00.SetStage(25)

;shut down balcony scene if it's running
PrestonBalconyScene.Stop()

;make sure the dungeon quest runs
;DN092.SetStage(10)

;make sure Preston's inside the museum
Actor rGarvey = Alias_PrestonGarvey.GetActorRef()
rGarvey.Moveto(pMQ03PrestonMarker1)
rGarvey.EvaluatePackage()

;make sure Sturges Terminal is not available until after player talks to Garvey
Alias_MuseumTerminal.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Preston tells player to take the musket
Min00.SetStage(27)

Alias_PrestonGarvey.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0077_Item_00
Function Fragment_Stage_0077_Item_00()
;BEGIN CODE
;Have Dogmeat run to the door
;Alias_Dogmeat.GetActorRef().EvaluatePackage()

;kill test trigger
;pTestTriggerMQ102SetStage70.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0078_Item_00
Function Fragment_Stage_0078_Item_00()
;BEGIN CODE
;make sure all Raiders are enabled

Actor RaiderA1REF = Alias_RaiderA1.GetActorRef()
Actor RaiderA2REF = Alias_RaiderA2.GetActorRef()
Actor RaiderB1REF = Alias_RaiderB1.GetActorRef()
Actor RaiderB2REF = Alias_RaiderB2.GetActorRef()
Actor RaiderC1REF = Alias_RaiderC1.GetActorRef()
Actor RaiderC2REF = Alias_RaiderC2.GetActorRef()
Actor RaiderMannequinREF = Alias_RaiderMannequin.GetActorRef()

If RaiderA1REF.IsDisabled()
  RaiderA1REF.Enable()
EndIf

If RaiderA2REF.IsDisabled()
  RaiderA2REF.Enable()
EndIf

If RaiderB1REF.IsDisabled()
  RaiderB1REF.Enable()
EndIf

If RaiderB2REF.IsDisabled()
  RaiderB2REF.Enable()
EndIf

If RaiderC1REF.IsDisabled()
  RaiderC1REF.Enable()
EndIf

If RaiderC2REF.IsDisabled()
  RaiderC2REF.Enable()
EndIf

If RaiderMannequinREF.IsDisabled()
  RaiderMannequinREF.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
; Player tries to open the door
Min00.SetStage(30)

;If the Raiders aren't in the Concord Museum, kill him for safety
(Alias_RaiderA1 as MQ03RaiderAliasScript).RaiderFailSafe()
(Alias_RaiderA2 as MQ03RaiderAliasScript).RaiderFailSafe()
(Alias_RaiderB1 as MQ03RaiderAliasScript).RaiderFailSafe()
(Alias_RaiderB2 as MQ03RaiderAliasScript).RaiderFailSafe()
(Alias_RaiderC1 as MQ03RaiderAliasScript).RaiderFailSafe()
(Alias_RaiderC2 as MQ03RaiderAliasScript).RaiderFailSafe()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Min00.SetStage(35)

;Have Dogmeat run to Murphy
Alias_Dogmeat.GetActorRef().EvaluatePackage()

Actor MarcyREF = Alias_Marcy.GetActorRef()
Actor PrestonREF = Alias_PrestonGarvey.GetActorRef()
Actor SturgesREF = Alias_Sturges.GetActorRef()
Actor MurphyREF = Alias_GrandmaMonk.GetActorRef()
Actor JunREF = Alias_Jun.GetActorRef()

;Have Marcy start pacing
MarcyREF.EvaluatePackage()

;Preston beckons the player inside
PrestonBeckonScene.Start()
Alias_PrestonShutter.GetRef().SetOpen(False)

PrestonREF.MoveTo(pMQ102PrestonForcegreetMarker)

; ally everyone with the player, unghost them
PrestonREF.AddtoFaction(pMQ03SurvivorFaction)
SturgesREF.AddtoFaction(pMQ03SurvivorFaction)
MurphyREF.AddtoFaction(pMQ03SurvivorFaction)
MarcyREF.AddtoFaction(pMQ03SurvivorFaction)
JunREF.AddtoFaction(pMQ03SurvivorFaction)

PrestonREF.SetGhost(False)
SturgesREF.SetGhost(False)
MurphyREF.SetGhost(false)
MarcyREF.SetGhost(false)
JunREF.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0087_Item_00
Function Fragment_Stage_0087_Item_00()
;BEGIN CODE
PrestonBeckonScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0088_Item_00
Function Fragment_Stage_0088_Item_00()
;BEGIN CODE
PrestonStartScene.Start()

;unlock the exit door and the balcony door
Alias_PrestonExitDoor.GetRef().Unlock()
Alias_MuseumBalconyDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0089_Item_00
Function Fragment_Stage_0089_Item_00()
;BEGIN CODE
Min00.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Min00.SetStage(45)
;Game.RewardPlayerXP(XPActOneSmall.GetValue() as int)

Alias_PrestonGarvey.GetActorRef().EvaluatePackage()
Alias_Dogmeat.GetActorRef().EvaluatePackage()

;check if you've already unlocked the door
If Alias_SecurityGate.GetRef().IsLocked() == False
 SetStage(100)
EndIf

;check if you already have the Core
If Game.GetPlayer().GetItemCount(pAmmoFusionCore) >= 1
   SetStage(100)
EndIf

;add preston to player faction temporarily
Alias_PrestonGarvey.GetActorRef().AddtoFaction(pPlayerFaction)

; set a stage in DN092 so its triggers have something to look for
DN092.setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_01
Function Fragment_Stage_0090_Item_01()
;BEGIN CODE
;Game.RewardPlayerXP(XPActOneSmall.GetValue() as int)

Min00.SetStage(47)

Alias_PrestonGarvey.GetActorRef().EvaluatePackage()
Alias_Dogmeat.GetActorRef().EvaluatePackage()

;add preston to player faction temporarily
Alias_PrestonGarvey.GetActorRef().AddtoFaction(pPlayerFaction)

; set a stage in DN092 so its triggers have something to look for
DN092.setStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_02
Function Fragment_Stage_0090_Item_02()
;BEGIN CODE
;make sure Sturges Terminal is not available until after player talks to Garvey
Alias_MuseumTerminal.GetRef().BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Min00.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Player has activated the Power Armor
Min00.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
Min00.SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE mq03questscript
Quest __temp = self as Quest
mq03questscript kmyQuest = __temp as mq03questscript
;END AUTOCAST
;BEGIN CODE
; Deathclaw is spawned in DN092
Alias_DeathclawFenceEnabler.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
Min00.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0123_Item_00
Function Fragment_Stage_0123_Item_00()
;BEGIN CODE
Min00.SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;kill the balcony scene if it's somehow running
PrestonBalconyScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0127_Item_00
Function Fragment_Stage_0127_Item_00()
;BEGIN CODE
Alias_PrestonGarvey.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Min00.SetStage(80)

;optimize script
Actor DogmeatREF = Alias_Dogmeat.GetActorRef()
Actor PrestonREF = Alias_PrestonGarvey.GetActorRef()
Actor GrandmaMonkREF = Alias_GrandmaMonk.GetActorRef()
Actor MarcyREF = Alias_Marcy.GetActorRef()
Actor JunREF = Alias_Jun.GetActorRef()
Actor SturgesREF = Alias_Sturges.GetActorRef()

;remove Preston from Player faction
PrestonREF.RemoveFromFaction(pPlayerFaction)

;move everybody to lobby
PrestonREF.EvaluatePackage()
GrandmaMonkREF.EvaluatePackage()
SturgesREF.EvaluatePackage()
MarcyREF.EvaluatePackage()
JunREF.EvaluatePackage()

;PrestonREF.Disable()
;GrandmaMonkREF.Disable()
;SturgesREF.Disable()
;MarcyREF.Disable()
;JunREF.Disable()

PrestonREF.moveto(MQ103PrestonTravelMarker4)
GrandmaMonkREF.moveto(MQ103GrandmaMonkTravelMarker4)
SturgesREF.moveto(MQ103PrestonTravelMarker4)
MarcyREF.moveto(MQ103PrestonTravelMarker4)
JunREF.moveto(MQ103PrestonTravelMarker4)

;marcy no longer crosses arms
MarcyREF.RemoveKeyword(AnimsCrossedArms)
MarcyREF.ChangeAnimArchetype(AnimArchetypeIrritated)

;PrestonREF.Enable()
;GrandmaMonkREF.Enable()
;SturgesREF.Enable()
;MarcyREF.Enable()
;JunREF.Enable()

;music stinger
MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_01
Function Fragment_Stage_0130_Item_01()
;BEGIN CODE
;VS DEMO ONLY - cue Prydwen
pDemoPrydwenFlyoverRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
;make sure Garvey shows up
Alias_PrestonGarvey.GetActorRef().moveto(MQ103PrestonTravelMarker4)

;make sure Dogmeat follows the player again
Alias_Dogmeat.GetActorRef().EvaluatePackage()

pSurvivorLobbyScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Min00.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; objective quest shutdown
;Min00.Stop() ; not any more - KMK
;CompleteAllObjectives()
;Game.RewardPlayerXP(XPActOneSmall.GetValue() as int)

pMQ103.SetStage(10)
pDiamondCityMapMarkerREF.AddtoMap()
;Enable an Enable Parent Marker indicating MQ103 is complete.
MQ03PostquestEnableMarker.Enable()
;DialogueConcordArea should get ready to shut down when the player leaves
pDialogueConcordArea.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;make sure codsworth doesn't auto-aggro on bugs
Alias_Codsworth.GetActorRef().RemoveFromFaction(MQ102CodsworthBugFaction)

;make sure neighborhood beasts can aggro on Codsworth
Alias_Codsworth.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
Alias_ViciousDog01.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
Alias_ViciousDog02.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)
Alias_ViciousDog03.GetActorRef().RemoveFromFaction(pMQ03CodsworthDogFaction)

;make sure Sturges Terminal is useable
Alias_MuseumTerminal.GetRef().BlockActivation(False, False)

; ensure DN092 shuts down, too.
DN092.setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Vault111Marker  Auto Const

Faction Property PlayerFaction  Auto Const  

ObjectReference Property MQ03DogmeatMovetoMarkerREF  Auto Const  

ObjectReference Property MQ03SetStage55Trigger01REF  Auto Const  

ObjectReference Property MQ03SetStage55Trigger02REF  Auto Const  

ObjectReference Property MQ03SetStage55Trigger04REF  Auto Const  

ObjectReference Property MQ03SetStage55Trigger03REF  Auto Const

MiscObject Property Caps001  Auto Const  

Scene Property PrestonBalconyScene  Auto Const  

Faction Property MQ03PrestonFaction  Auto Const  

ObjectReference Property CharGenPlayerMarker1  Auto Const  

Scene Property ExitCryoScene  Auto Const  

Quest Property DN092  Auto Const  

Quest Property MQ104  Auto Const  

Scene Property DogmeatGasStationScene  Auto Const  

ObjectReference Property MQ103SetStage45TriggerREF  Auto Const  

ObjectReference Property MQ103PrestonTravelMarker4  Auto Const  

ObjectReference Property MQ103GrandmaMonkTravelMarker4  Auto Const  

ObjectReference Property MQ103MoleratEnableParentMarker  Auto Const  

Scene Property SurvivorIntroScene  Auto Const  

Scene Property PrestonBeckonScene  Auto Const  

ReferenceAlias Property Alias_Codsworth Auto Const ; Legacy alias property
ReferenceAlias Property Alias_PrestonDoor Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderC1 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderB1 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderA1 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderB2 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_GrandmaMonk Auto Const ; Legacy alias property
ReferenceAlias Property Alias_PrestonExitDoor Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Dogmeat Auto Const ; Legacy alias property
ReferenceAlias Property Alias_ControlPanel Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderA2 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderC2 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Pipboy Auto Const ; Legacy alias property
ReferenceAlias Property Alias_PrestonGarvey Auto Const ; Legacy alias property

ReferenceAlias Property Alias_Marcy Auto Const

ObjectReference Property pMQ03PrestonMarker1 Auto Const

Scene Property pSurvivorLobbyScene Auto Const

ObjectReference Property pDiamondCityMapMarkerRef Auto Const

Scene Property pControlPanelScene Auto Const

ReferenceAlias Property Alias_ViciousDog01 Auto Const

ReferenceAlias Property Alias_ViciousDog02 Auto Const

ReferenceAlias Property Alias_ViciousDog03 Auto Const

Faction Property pMQ03CodsworthDogFaction Auto Const

ReferenceAlias Property Alias_CodsworthHolotape Auto Const

ReferenceAlias Property Alias_RaiderBoss Auto Const

ReferenceAlias Property Alias_RaiderLookout Auto Const

ReferenceAlias Property Alias_WaveRaider01 Auto Const

ReferenceAlias Property Alias_WaveRaider02 Auto Const

ReferenceAlias Property Alias_WaveRaider03 Auto Const

ReferenceAlias Property Alias_VaultGearDoor Auto Const

ObjectReference Property MQ03PostquestEnableMarker Auto Const

ObjectReference Property pMQ03DogmeatLobbyMarker Auto Const

Quest Property pDialogueConcordArea Auto Const

Faction Property pPlayerFaction Auto Const

ReferenceAlias Property Alias_SecurityGate Auto Const

Armor Property pPipboyDusty Auto Const

Armor Property pPipboy Auto Const

ReferenceAlias Property Alias_Sturges Auto Const

ReferenceAlias Property Alias_Jun Auto Const

Faction Property pMQ03SurvivorFaction Auto Const

ObjectReference Property pMQ03SpouseCorpseEnableMarkerREF Auto Const

Quest Property pDialogueVault111 Auto Const

Scene Property pDogmeatIntroScene Auto Const

ObjectReference Property pVault111CryopodAcousticSpace Auto Const

Quest Property pMQ103 Auto Const

Ammo Property pAmmoFusionCore Auto Const

ObjectReference Property pDemoPrydwenFlyoverRef Auto Const

ReferenceAlias Property Alias_MQSpouseMale Auto Const

ReferenceAlias Property Alias_MQSpouseFemale Auto Const

ReferenceAlias Property Alias_Vault111DoorConsoleFurniture Auto Const

Quest Property pDogmeatQuest Auto Const

ObjectReference Property pVault111BlockedDoorEnableParent Auto Const

ReferenceAlias Property Alias_PrestonShutter Auto Const

ObjectReference Property pMQ102PrestonForcegreetMarker Auto Const

Holotape Property pCodsworthHolotape01 Auto Const

ObjectReference Property pTestTriggerMQ102SetStage70 Auto Const

ReferenceAlias Property Alias_DeathclawFenceEnabler Auto Const

ReferenceAlias Property Alias_V111Skeleton Auto Const

Weapon Property pMinigun Auto Const

ReferenceAlias Property Alias_Vault111QT01 Auto Const

ReferenceAlias Property Alias_Vault111QT00 Auto Const

Scene Property DogmeatIntroScene Auto Const

Quest Property DogmeatQuest Auto Const

Location Property ConcordLocation Auto Const

Keyword Property UseInstantEnter Auto Const

VisualEffect Property CameraAttachGroggyWake01FX Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMQ102Ready Auto Const

GlobalVariable Property TimeScale Auto Const

Quest Property DialogueVault111 Auto Const

SoundCategorySnapshot Property CSMQ101Cryopod Auto Const

GlobalVariable Property GameHour Auto Const

Quest Property RadioDiamondCity Auto Const

ObjectReference Property MQ101Vault111PostWarMagicDoor Auto Const

ObjectReference Property MQ203Vault111MagicDoorToPostWar Auto Const

ObjectReference Property MQ203Vault111MagicDoorToPreWar Auto Const

ObjectReference Property PrewarVault111MagicDoor Auto Const

Quest Property Min00 Auto Const

Quest Property Tutorial Auto Const

GlobalVariable Property MQ102SkippedCodsworth Auto Const

ObjectReference Property Vault111RoachEnableParent Auto Const

ObjectReference Property RespecTriggerREF Auto Const

Scene Property PrestonStartScene Auto Const

Quest Property BoSM01 Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Quest Property RadioInstituteQuest Auto Const

Faction Property MQ102CodsworthBugFaction Auto Const

ReferenceAlias Property Alias_MuseumTerminal Auto Const

Quest Property DialogueCodsworthPostWar Auto Const

ReferenceAlias Property Alias_MuseumBalconyDoor Auto Const

MusicType Property MUSReward Auto Const

ReferenceAlias Property Alias_RoofDoor Auto Const

ImageSpaceModifier Property PipboyAnimInImod Auto Const

Keyword Property AnimsCrossedArms Auto Const

Keyword Property AnimArchetypeIrritated Auto Const

ReferenceAlias Property Alias_RaiderMannequin Auto Const Mandatory

ReferenceAlias Property Alias_MuseumCenterMarker Auto Const Mandatory

ObjectReference Property Vault111ExitDoorREF01 Auto Const Mandatory

ObjectReference Property Vault111ExitDoorREF02 Auto Const Mandatory
