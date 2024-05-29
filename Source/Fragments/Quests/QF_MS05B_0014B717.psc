;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS05B_0014B717 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Alias_PoppaDeathclawTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
pMS05Misc.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_01
Function Fragment_Stage_0025_Item_01()
;BEGIN CODE
;Shut down Misc quest
self.SetStage(7)

if !self.GetStageDone(125) && !self.GetStageDone(250)
  SetObjectiveDisplayed(25, 1)

  ;Play music hit
  Utility.Wait(0.5)
  MUSDreadShort05.Add()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
SetObjectiveCompleted(25, 1)
if !self.GetStageDone(125)
  SetObjectiveDisplayed(50, 1)
endif

;Shutdown intro quest if you haven't already
self.setstage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;if !self.GetStageDone(50)
;  SetObjectiveDisplayed(50, 1)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Utility.Wait(2.5)
  if !pHolotape03Scene.IsPlaying()
    SetObjectiveDisplayed(157, 1)
    SetObjectiveCompleted(25, 1)
    SetObjectiveCompleted(50, 1)
    SetObjectiveCompleted(100, 1)
endif

;Shutdown intro quest if you haven't already
self.setstage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_03
Function Fragment_Stage_0150_Item_03()
;BEGIN CODE
;If the player has not yet acquired the egg, inform him to do so. Otherwise, tell him to find the holotape
if !self.GetStageDone(250) 
  SetObjectiveCompleted(25, 1) 
  SetObjectiveCompleted(50, 1)
  SetObjectiveCompleted(100, 1)
  SetObjectiveCompleted(157, 1)
  SetObjectiveDisplayed(150, 1)
else
  SetObjectiveCompleted(25, 1)
  SetObjectiveCompleted(50, 1)
  SetObjectiveCompleted(100, 1)
  SetObjectiveCompleted(155, 1)
  SetObjectiveCompleted(157, 1)

  ;If the player hasn't previously killed Papa, activate the reward corpse
  if !Alias_PoppaDeathclaw.GetActorRef().IsDead()  
    Alias_RewardCorpse.GetRef().Enable()
    Alias_DeathclawGauntlet.GetRef().Enable()
  endif

;If Wellingham is dead, make returning the egg to the nest the only objective 
  if !Alias_Wellingham.GetActorRef().IsDead()
    SetObjectiveDisplayed(250, 1)
    SetObjectiveDisplayed(251, 1)
  else
    SetObjectiveDisplayed(252, 1)
  endif

endif

;Shutdown intro quest if you haven't already
self.setstage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0157_Item_00
Function Fragment_Stage_0157_Item_00()
;BEGIN CODE
if !self.GetStageDone(50) && !self.GetStageDone(125)
  Utility.Wait(1.0)
  SetObjectiveDisplayed(157, 1)
  self.setstage(7)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;If the player has not yet acquired the egg, inform him to do so. Otherwise, tell him to find the holotape
if !self.GetStageDone(250) 
  SetObjectiveCompleted(25, 1) 
  SetObjectiveCompleted(50, 1)
  SetObjectiveCompleted(100, 1)
  SetObjectiveDisplayed(150, 1)
else
  SetObjectiveCompleted(25, 1)
  SetObjectiveCompleted(50, 1)
  SetObjectiveCompleted(100, 1)
  SetObjectiveCompleted(155, 1)
  SetObjectiveCompleted(157, 1)

;If Wellingham is dead, make returning the egg to the nest the only objective 
  if !Alias_Wellingham.GetActorRef().IsDead()
    SetObjectiveDisplayed(250, 1)
    SetObjectiveDisplayed(251, 1)
  else
    SetObjectiveDisplayed(252, 1)
  endif

endif

;Shutdown intro quest if you haven't already
self.setstage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_02
Function Fragment_Stage_0250_Item_02()
;BEGIN CODE
;Activate return egg trigger
Alias_ReturnEggTrigger.GetRef().Enable()
Alias_PoppaDeathclawTrigger.GetRef().Enable()
Alias_Nest.GetRef().BlockActivation(true, true)

;Activate rewards 
if !Alias_PoppaDeathclaw.GetActorRef().IsDead()  
  MS05BGreetPoppa.SetStage(10)
  Alias_RewardCorpse.GetRef().Enable()
  Alias_DeathclawGauntlet.GetRef().Enable()
  MS05BGuantletRewardEnableMarker.Enable()
  self.SetStage(254)
endif

;If player has already listened to holotape 3, point him towards branches. Otherwise, point him towards tape
if self.GetStageDone(150)

  SetObjectiveCompleted(150, 1)

  if !Alias_Wellingham.GetActorRef().IsDead()
    SetObjectiveDisplayed(250, 1)
    SetObjectiveDisplayed(251, 1)
  else
    SetObjectiveDisplayed(252, 1)
  endif
;else
;  
;  SetObjectiveCompleted(25, 1)
;
;  if !self.GetStageDone(125)
;    SetObjectiveDisplayed(50, 1)
;  endif
;  if !pMS05BTapes.GetStageDone(10)  
;    if !self.GetStageDone(100)
;        SetObjectiveDisplayed(155, 1)
;        SetObjectiveCompleted(25, 1)
;        SetObjectiveCompleted(50, 1)
;        SetObjectiveCompleted(100, 1)
;    endif
;  else
;    if !pHolotape03Scene.IsPlaying()
;      SetObjectiveDisplayed(157, 1)
;      SetObjectiveCompleted(25, 1)
;      SetObjectiveCompleted(50, 1)
;      SetObjectiveCompleted(100, 1)
;    endif
;  endif
endif


self.setstage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0252_Item_00
Function Fragment_Stage_0252_Item_00()
;BEGIN CODE
if !self.GetStageDone(150)
  self.setstage (150)
endif

if !self.GetStageDone(250)
  self.setstage(250)
  Game.GetPlayer().AddItem(Alias_DeathclawEgg.GetRef())
endif

Game.GetPlayer().Moveto(pDeliveryBranchTestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0253_Item_00
Function Fragment_Stage_0253_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_DeathclawEgg.GetRef())

if !self.GetStageDone(150)
  self.setstage (150)
endif

if !self.GetStageDone(250)
  self.setstage(250)
  Game.GetPlayer().AddItem(Alias_DeathclawEgg.GetRef())
endif

Game.GetPlayer().Moveto(pReturnBranchTestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
;End combat with Poppa Deathclaw
(Alias_PoppaDeathclaw.GetActorRef()).AddToFaction(pPoppaDeathclawFaction)
(Alias_PoppaDeathclaw.GetActorRef()).SetValue(Game.GetAggressionAV(), 0)
(Alias_PoppaDeathclaw.GetActorRef()).StopCombat()
(Alias_PoppaDeathclaw.GetActorRef()).AddKeyword(pDisableDeathclawIdles)
Utility.Wait(0.5)
pPoppaScene.Start()
Alias_PoppaDeathclaw.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Start combat with Poppa Deathclaw
(Alias_PoppaDeathclaw.GetActorRef()).RemoveFromFaction(pPoppaDeathclawFaction)
(Alias_PoppaDeathclaw.GetActorRef()).SetValue(Game.GetAggressionAV(), 2)
(Alias_PoppaDeathclaw.GetActorRef()).StartCombat(Game.GetPlayer())
(Alias_PoppaDeathclaw.GetActorRef()).RemoveKeyword(pDisableDeathclawIdles)

;Kill Poppa's Scene
pPoppaScene.Stop()

;Turn off Poppa greeting quest
MS05BGreetPoppa.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_DeathclawEgg.GetRef())
;Alias_Wellingham.GetRef().AddItem(Alias_DeathclawEgg.GetRef())
if !self.GetStageDone(450)
    Alias_DeathclawGauntlet.GetRef().Disable()
endif
CompleteAllObjectives()

;Turn off return trigger, reenable nest activation, and close out Poppa greeting quest
Alias_ReturnEggTrigger.GetRef().Disable()
Alias_Nest.GetRef().BlockActivation(false)
MS05BGreetPoppa.SetStage(100)

;If Momma Deathclaw is still alive, disable her and her enable trigger
if !Alias_MommaDeathclaw.GetActorRef().IsDead()
  Alias_MommaDeathclaw.GetRef().Disable()
  Alias_MommaEnableTrigger.GetRef().Disable()
endif

;If Codman is still alive, set up coda scene
if !Alias_ClarenceCodman.GetActorRef().IsDead()
  pConvDiamondCityCoda.SetStage(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE MS05BScript
Quest __temp = self as Quest
MS05BScript kmyQuest = __temp as MS05BScript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.iWellinghamSpeechSuccesses == 0
  Game.GetPlayer().AddItem(pCaps001, 200)
elseif kmyQuest.iWellinghamSpeechSuccesses == 1
  Game.GetPlayer().AddItem(pCaps001, 300)
elseif kmyQuest.iWellinghamSpeechSuccesses == 2
  Game.GetPlayer().AddItem(pCaps001, 400)
elseif kmyQuest.iWellinghamSpeechSuccesses == 3
  Game.GetPlayer().AddItem(pCaps001, 500)
elseif kmyQuest.iWellinghamSpeechSuccesses == 4
  Game.GetPlayer().AddItem(pCaps001, 600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;Player gets Deathclaw omellet recipe
Game.GetPlayer().AddItem(pDeathclawRecipe)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
;Give player quest XP

;If player hasn't gotten their caps, hand them over now
if !self.GetStageDone(410)
  self.SetStage(410)
endif

;If player hasn't gotten their recipe, hand it over now
if !self.GetStageDone(420)
  self.SetStage(420)
endif

;If Codman is alive, start wrap up scene
if !Alias_ClarenceCodman.GetActorRef().IsDead()
  pTurnInWrapUp.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;If Codman is still alive, set up coda scene
;if !Alias_ClarenceCodman.GetActorRef().IsDead()
;  pConvDiamondCityCoda.SetStage(2)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
self.SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
;Have Poppa attack
SetStage(280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_02
Function Fragment_Stage_0500_Item_02()
;BEGIN CODE
;Close out remaining objectives
CompleteAllObjectives()

ObjectReference Nest = Alias_Nest.GetRef()

;Move deathclaw egg to nest
Game.GetPlayer().RemoveItem(Alias_DeathclawEgg.GetRef())
Nest.AddItem(Alias_DeathclawEgg.GetRef())

;Turn off return trigger and reenable nest activation
Alias_ReturnEggTrigger.GetRef().Disable()
Nest.BlockActivation(false)

;If Momma Deathclaw is still alive, disable her and her enable trigger
if !Alias_MommaDeathclaw.GetActorRef().IsDead()
  Alias_MommaDeathclaw.GetRef().Disable()
  Alias_MommaEnableTrigger.GetRef().Disable()
endif

;Permit Poppa deathclaw to use idles again
(Alias_PoppaDeathclaw.GetActorRef()).AddKeyword(pDisableDeathclawIdles)

;Start up post-quest if Wellingham or Poppa Deathclaw are alive
if !Alias_PoppaDeathclaw.GetActorRef().IsDead() || !Alias_Wellingham.GetActorRef().IsDead()
  pMS05BPostQuest.SetStage(2)
endif

;If your companion is nearby and not in combat, play their scene (which may end the quest) 
if Alias_Companion.GetRef().GetDistance(Nest) < 700 && !Alias_Companion.GetActorRef().IsInCombat()
  pReturnEggtoNest.Start()
endif

Utility.Wait(1.0)
;If both Poppa's scene and the companion scene aren't playing, wrap things up
if !pPoppaScene.IsPlaying() && !pReturnEggtoNest.IsPlaying()
  SetStage(1100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
(Alias_PoppaDeathclaw.GetActorRef()).RemoveKeyword(pDisableDeathclawIdles)
if !pReturnEggtoNest.IsPlaying()
  self.SetStage(1100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
if self.IsObjectiveDisplayed(250)
  SetObjectiveDisplayed(250, false, false)
  SetObjectiveDisplayed(251, false, false)
  SetObjectiveDisplayed(252)
endif

if self.GetStageDone(400)
  self.SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Shutdown quest
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Kill MS05B tapes quest and this one
pMS05BTapes.SetStage(100)

;In case it didn't get pulled eariler, remove FX from Poppa Deathclaw
if GetStageDone(500)
  DeathclawDiggingDirtFXE.Stop(Alias_PoppaDeathclaw.GetActorRef())
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pTurnInWrapUp Auto Const

ReferenceAlias Property Alias_DeathclawEgg Auto Const

ReferenceAlias Property Alias_RewardCorpse Auto Const

ReferenceAlias Property Alias_PoppaDeathclaw Auto Const

Faction Property pPoppaDeathclawFaction Auto Const

Scene Property pPoppaScene Auto Const

Quest Property pMS05BPostQuest Auto Const

Scene Property pReturnEggToNest Auto Const

Quest Property pConvDiamondCityCoda Auto Const

Quest Property pMS05BTapes Auto Const

Scene Property pHolotape03Scene Auto Const

ReferenceAlias Property Alias_ClarenceCodman Auto Const

ReferenceAlias Property Alias_Wellingham Auto Const

Keyword Property pDisableDeathclawIdles Auto Const

ObjectReference Property pDeliveryBranchTestMarker Auto Const

ObjectReference Property pReturnBranchTestMarker Auto Const

ReferenceAlias Property Alias_DeathclawGauntlet Auto Const

Quest Property pMS05Misc Auto Const

MiscObject Property pCaps001 Auto Const

ReferenceAlias Property Alias_Nest Auto Const

Book Property pDeathclawRecipe Auto Const

Keyword Property CA__CustomEvent_Nice Auto Const

ObjectReference Property MS05BGuantletRewardEnableMarker Auto Const

ReferenceAlias Property Alias_ReturnEggTrigger Auto Const

ReferenceAlias Property Alias_PoppaDeathclawTrigger Auto Const

MusicType Property MUSDreadShort05 Auto Const

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Quest Property MS05BGreetPoppa Auto Const

VisualEffect Property DeathclawDiggingDirtFXE Auto Const

ReferenceAlias Property Alias_MommaDeathclaw Auto Const Mandatory

ReferenceAlias Property Alias_MommaEnableTrigger Auto Const Mandatory
