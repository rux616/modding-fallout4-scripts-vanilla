;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Tutorial_00160147 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Approached radroach in Vault 111, show Attack tutorial message (and pull up fists if player is unarmed)
; Stage set by trigger

;debug.trace("Attack tutorial triggered")

if !self.GetStageDone(110)
  self.setstage(110)

  objectreference Player = Game.GetPlayer()

  ;if the player hasn't picked up the baton yet, have them raise their fists
  if Player.GetItemCount(Baton) < 1
    Game.GetPlayer().DrawWeapon()    
  endif
  
  TutorialMsg100.ShowAsHelpMessage(asEvent100, 8, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Exited overseer's office, show VATS and iron sights tutorial messages
;Stage set from trigger outside Overseer's office in Vault 111 Cryo

;debug.trace("Iron sights tutorial triggered")

if !self.GetStageDone(210)
  self.SetStage(210)

  ;Enable VATS in MQ102
  (MQ102 as MQ03QuestScript).MQ102EnableVats()
 
  ;Change which tutorial displays based on player's equipped weapon  
  if Game.GetPlayer().GetEquippedWeapon() == Gun10mm
    TutorialMsg200A.ShowAsHelpMessage(asEvent200A, 6, 0, 1, ContextStringNoContext, StandardPriority)
  else
    TutorialMsg200ANoGun.ShowAsHelpMessage(asEvent200ANoGun, 6, 0, 1, ContextStringNoContext, StandardPriority)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
;Iron sights tutorial complete, start VATS
;Stage set from Tutorial event in tutorial script

if !self.GetStageDone(212)
  self.SetStage(212)
  TutorialMsg200A.UnshowAsHelpMessage()
  TutorialMsg200NoGun.UnshowAsHelpMessage()

  if Game.GetPlayer().GetEquippedWeapon() == Gun10mm
    
    ;Make sure player hasn't already entered the VATS tutorial before show enter VATS message
     if !self.GetStageDone(3400)
        TutorialMsg200.ShowAsHelpMessage(asEvent200, 8, 0, 1, ContextNoMenu, StandardPriority)
     endif
  else

     ;Make sure player hasn't already entered the VATS tutorial before show enter VATS message
     if !self.GetStageDone(3400)
       TutorialMsg200NoGun.ShowAsHelpMessage(asEvent200NoGun, 8, 0, 1, ContextNoMenu, StandardPriority)
     endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
;Pull stealth/bash tutorial messages if player picks up Pip-boy 
;Triggered from MQ102 stage 4

TutorialMsg850.UnShowAsHelpMessage()
TutorialMsg920.UnShowAsHelpMessage()
TutorialMsg950.UnShowAsHelpMessage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Player has picked up Pip-Boy in Vault 111 cryo
;Stage set from MQ102 stage 

if !self.GetStageDone(260)
  self.SetStage(260)

  ;Throw Pip-Boy Navigation tutorial
  Utility.WaitMenuMode(1.0)
  if !self.GetStageDone(255)
    if Game.UsingGamePad()
      TutorialPipboyNavigation.ShowAsHelpMessage(asEvent250_PipNav, 7, 0, 1, ContextStringPipboy, StandardPriority)
    else
      TutorialPipboyNavigation_MK.ShowAsHelpMessage(asEvent250_PipNav_MK, 7, 0, 1, ContextStringPipboy, StandardPriority)
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0252_Item_00
Function Fragment_Stage_0252_Item_00()
;BEGIN CODE
; Pip-boy navigation message 01 has finished. Show 02
; Stage set in Tutorial event in tutorial script

if Game.UsingGamePad()
  TutorialPipboyNavigation01.ShowAsHelpMessage(asEvent250_PipNav01, 7, 0, 1, ContextStringPipboy, StandardPriority)
else
  TutorialPipboyNavigation_MK01.ShowAsHelpMessage(asEvent250_PipNav_MK01, 7, 0, 1, ContextStringPipboy, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0253_Item_00
Function Fragment_Stage_0253_Item_00()
;BEGIN CODE
;Triggered from completion of initial pip-boy navigation tutorial
; Stage set in Tutorial event in tutorial script

if !self.GetStageDone(255) && !self.GetStageDone(310)
  self.SetStage(310)
  TutorialMsg250.ShowAsHelpMessage(asEvent250, 10, 0, 1, ContextStringPipboy, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Player has exited the Pipboy for the first time, unshow the "Exit Pipboy" message
if !self.GetStageDone(256)
  self.setstage(256)
  TutorialMsg250.UnShowAsHelpMessage()

  if Game.UsingGamePad()
    TutorialPipboyNavigation.UnShowAsHelpMessage()
    TutorialPipboyNavigation01.UnShowAsHelpMessage()
  else
    TutorialPipboyNavigation_MK.UnShowAsHelpMessage()
    TutorialPipboyNavigation_MK01.UnShowAsHelpMessage()
  endif
endif

;Unregister Pipboy open/close events
kmyquest.UnregisterMenuEvent(ContextStringPipboy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;Player has hit trigger on trail outside of Vault 111, trigger sprinting tutorial
;Stage set by one of three triggers spread around Vault 111 exit

if !self.GetStageDone(370)
  self.SetStage(370)

  Utility.Wait(2.0)
  TutorialSprinting.ShowAsHelpMessage(asEventSprinting, 7, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Kill the sprint tutorial timer

kmyquest.CancelSprintTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Enter lockpick menu, activate 1st help message
;Triggered by open close menu event in tutorial script

if !self.GetStageDone(420)
  self.SetStage(420)

  ;Unregister lockpicking event
  kmyquest.UnregisterMenuEvent(LockpickContextString)

  Utility.WaitMenuMode(1.0)
  if Game.UsingGamepad()
    TutorialLockpickTotal.Show()
  else
    TutorialLockpickTotal_MK.Show()
  endif  
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Lockpicking tutorial complete, unregister

;Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Player drank water, show water message
;Triggered from entry point on TutorialDrinkWater perk
;Or drinkFromFountainScript

if MQ102.GetStageDone(10) && !self.GetStageDone(510)
  self.SetStage(510)
  TutorialMsg500.ShowAsHelpMessage(asEvent500, 8, 0, 1,  ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; This should pop the first time the player receives a follower 
; Triggered from Followers script, SetCompanion function

if !self.GetStageDone(605)
  self.SetStage(605)
  Utility.WaitMenuMode(InitialWaitDuration)
  TutorialMsg600.ShowAsHelpMessage(asEvent600, 7, 0, 1,  ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0602_Item_00
Function Fragment_Stage_0602_Item_00()
;BEGIN CODE
; This should pop the first time the player receives a follower 
; Triggered from Followers script, SetDogmeatCompanion function

if !self.GetStageDone(605)
  self.SetStage(605)
  Utility.WaitMenuMode(InitialWaitDuration)
  TutorialCompanionsIntro_Dogmeat.ShowAsHelpMessage(asEvent600, 7, 0, 1,  ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0609_Item_00
Function Fragment_Stage_0609_Item_00()
;BEGIN CODE
; Command mode entered, play command tutorial
;Triggered from TutorialCompanionScript on companion aliases

if !self.GetStageDone(612)
  self.SetStage(612)
  Utility.WaitMenuMode(InitialWaitDuration)
  TutorialMsg600D.ShowAsHelpMessage(asEvent600D, 10, 0, 1,  ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0617_Item_00
Function Fragment_Stage_0617_Item_00()
;BEGIN CODE
;Command mode tutorial complete, fire ending command mode tutorial
;Triggered from tutorial event in tutorialscript

if !self.GetStageDone(618)
  self.SetStage(618)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg610A.ShowAsHelpMessage(asEvent610A, 7, 0, 1,  ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Companion has entered Bleed Out state, fire off 
;Triggered from TutorialCompanionScript on companion aliases

if kmyquest.CanDoBleedoutTutorial()
  TutorialMsg620.ShowAsHelpMessage(asEvent620, 6, 0, 1,  ContextNoMenu, 2)
  
  if Game.GetPlayer().GetItemCount(Stimpak) < 1
    TutorialMsg620B.ShowAsHelpMessage(asEvent620B, 8, 0, 1,  ContextNoMenu, 2)
  else
    TutorialMsg620A.ShowAsHelpMessage(asEvent620A, 8, 0, 1,  ContextNoMenu, 2)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Companion has entered Bleed Out state, fire off 
;Triggered from TutorialCompanionScript on companion aliases

if kmyquest.CanDoBleedoutTutorial()
  TutorialCompanionHealing01_Dogmeat.ShowAsHelpMessage(asEvent620, 6, 0, 1,  ContextNoMenu, 2)

  if Game.GetPlayer().GetItemCount(Stimpak) < 1
    TutorialCompanionHealing02A_Dogmeat.ShowAsHelpMessage(asEvent620B, 8, 0, 1,  ContextNoMenu, 2)
  else
    TutorialCompanionHealing02_Dogmeat.ShowAsHelpMessage(asEvent620B, 8, 0, 1,  ContextNoMenu, 2)  
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
;Companion's affinity has gone up or down
;Triggered from "TryToShowMessage" function in CompanionActorScript

if !self.GetStageDone(650)
  self.SetStage(650)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg640.ShowAsHelpMessage(asEvent640, 8, 0, 1, ContextNoMenu, 3)
  TutorialMsg642.ShowAsHelpMessage(asEvent642, 8, 0, 1, ContextNoMenu, 3)
  TutorialMsg645.ShowAsHelpMessage(asEvent645, 8, 0, 1, ContextNoMenu, 3)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Trigger romantic companion tutorial message timer (from CompanionActorScript.RomanceSuccess)

if kmyquest.CanDoRomanceTutorial()
  kmyquest.StartRomanceTimer()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0685_Item_00
Function Fragment_Stage_0685_Item_00()
;BEGIN CODE
; Romantic companion tutorial message timer complete (from Ontimer in Tutorial scripts)

if !self.GetStageDone(690)
  self.SetStage(690)
  TutorialCompanionsRomance.ShowAsHelpMessage(asEvent680, 7, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Entered generator room, show block tutorial message
; Stage set from trigger in Vault 111 cryo generator room

;debug.trace("Block tutorial triggered")

if !self.GetStageDone(710)
  self.setstage(710)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg700.ShowAsHelpMessage(asEvent700, 7, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Entered Overseer room, show power attack message
;Triggered by activating door leading into hall to Overseer's officein Vault 111 Cryo

if !self.GetStageDone(810)
  self.setstage(810)
  Utility.Wait(2.0)
  TutorialMsg800.ShowAsHelpMessage(asEvent800, 6, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Player passed through trigger, fire "Reload" tutorial
;Stage set by trigger in hallway after Overseer's office in Vault 111 Cryo

;debug.trace("Reload tutorial triggered")

if !self.GetStageDone(860)
  self.GetStageDone(860)

  if Game.GetPlayer().GetEquippedWeapon() == Gun10mm
    Utility.Wait(0.5)
    TutorialMsg850.ShowAsHelpMessage(asEvent850, 5, 0, 1, ContextNoMenu, StandardPriority)
  else
    ;Utility.Wait(0.5)
    ;TutorialMsg850NoGun.ShowAsHelpMessage(asEvent850NoGun, 5, 0, 1, ContextNoMenu, StandardPriority)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Entering vault foyer, show stealth message
;Triggered by opening door into Pip-Boy room in Vault 111 Cryo

if !self.GetStageDone(910)
  self.SetStage(910)

  ;If the reload message is still showing pull it
  TutorialMsg850.UnShowAsHelpMessage()
  TutorialMsg900.ShowAsHelpMessage(asEvent900, 5, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
; Show stealth message 02 if it hasn't been shown and player hasn't activated Pip-Boy
;Triggered from tutorial event in tutorialscript

if !self.GetStageDone(930) && !self.GetStageDone(240)
  self.SetStage(930)
  if Game.UsingGamepad()
    TutorialMsg920.ShowAsHelpMessage(asEvent920, 6, 0, 1, ContextNoMenu, StandardPriority)
  else
    TutorialMsg920_MK.ShowAsHelpMessage(asEvent920, 6, 0, 1, ContextNoMenu, StandardPriority)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Slealth message 02 complete, show weapon bash message (if player hasn't triggered Pip-Boy)
;Triggered from tutorial event in tutorialscript or onHitevent in tutorial script

if !self.GetStageDone(960) && !self.GetStageDone(240)
  self.SetStage(960)
  TutorialMsg950.ShowAsHelpMessage(asEvent950, 8, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0955_Item_00
Function Fragment_Stage_0955_Item_00()
;BEGIN CODE
;Player is out of ammo and under attack, show weapon bash tutorial. Handled in Tutorialscript

self.setstage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player acquired baton. If they they've already acquired pistol, show hotkey tutorial
;Fired from MQ102BatonTakeScript

kmyquest.BatonTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player acquired pistol. If they they've already acquired baton, show hotkey tutorial
;Fired from MQ102PistolTakeScript

kmyquest.PistolTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1015_Item_00
Function Fragment_Stage_1015_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player has acquired the stimpak in the Overseer's office, show hotkeys message
;Fired from DefaultRefOnContainerChangedTo on stimpak

kmyquest.StimpakTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1070_Item_00
Function Fragment_Stage_1070_Item_00()
;BEGIN CODE
;Triggered from entering favorites menu via tutorial event in tutorialscript

if !self.GetStageDone(1080)
  self.SetStage(1080)
  
  if Game.UsingGamePad()
    TutorialMsg1070.ShowAsHelpMessage(asEvent1070, 9, 0, 1, ContextStringPipboy, StandardPriority)
  else
    TutorialMsg1070_MK.ShowAsHelpMessage(asEvent1070_MK, 9, 0, 1, ContextStringPipboy, StandardPriority)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
;Pull any remainig tutorial messages

Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Enter terminal menu, activate 1st help message
;Triggered from tutorial event in tutorialscript

if !self.GetStageDone(1220)
  self.SetStage(1220)

  if Game.UsingGamepad()
    TutorialHackingTotal.Show()
  else
    TutorialHackingTotal_MK.Show()
  endif  
endif

;if !self.GetStageDone(1220)
;  Message.ClearHelpMessages()

  ;Used to know if we should shut down tutorial before final message is done
  ;in stage 1204
;  kmyquest.bInRepeatingScreen = true

  ;Select correct message if player is using gamepad
;  if Game.UsingGamepad()
;    TutorialMsg1200.ShowAsHelpMessage(asEvent1200, 8, 0, 1, HackingContextString)
;  else
;    TutorialMsg1200MK.ShowAsHelpMessage(asEvent1200MK, 8, 0, 1, HackingContextString)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Exited hacking menu

;Check to see if we should play the terminal lock tutorial
if !self.GetStageDone(1260) && self.GetStageDone(1250)
  self.SetStage(1260)
  
  Utility.Wait(1.0)
  TutorialMsg1250.ShowAsHelpMessage(asEvent1250, 8, 0, 1, ContextStringNoContext, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Hacking tutorial complete
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
;Player has been locked out of a terminal, ready to show message (actual message firing happens in 1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Entered cooking menu, activate help message 1
;Triggered from TutorialEvent in Tutorial script

if !self.GetStageDone(1303)
  self.SetStage(1303)

  ;Unregister Cooking menu open close event 
  kmyquest.UnregisterMenuEvent(ContextStringCooking)

  Utility.WaitMenuMode(1.0)
  if Game.UsingGamepad()
    TutorialCookingTotal.Show()
  else
    TutorialCookingTotal_MK.Show()
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Power armor entered, display reduced damage help message
;Triggered from OnEquip event in TutorialPlayerAliasScript

if !self.GetStageDone(1510)
  self.SetStage(1510)

  Actor Player = Game.GetPlayer()
  
  ;Set var to block immediate repeat of no core warning if this suit doesn't have one and start timer  
  if Player.GetValue(PowerArmorBattery) <= 0 && Player.IsInPowerArmor() 
    kmyquest.bNoCoreRepeat = 1
    kmyquest.RepeatNoCoreTimer()
  endif
  
  TutorialMsg1500.ShowAsHelpMessage(asEvent1500, 8, 0, 1,  ContextNoMenu, 4)

  ;If the player's not in Concord, or is in Concord and has completed the fight with the Deathclaw and Raiders, show next message
  if Player.GetCurrentLocation() != ConcordLocation || (Player.GetCurrentLocation() == ConcordLocation && MQ102.GetStageDone(122) && MQ102.GetStageDone(123))
    TutorialMsg1500B.ShowAsHelpMessage(asEvent1500C, 11, 0, 1,  ContextNoMenu, 4)
  else
    ;Otherwise, just fire "Exit Power Armor" tutorial
    SetStage(1502)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1502_Item_00
Function Fragment_Stage_1502_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Power armor reduced damage message complete, display exit help message. 
;If power armor bench exit message is playing, close this one off
;Triggered from tutorial event in tutorialscript or stage 1500 if player's in Concord

if !self.GetStageDone(1512)
  if !kmyquest.bPABenchExitMessageActive

    self.SetStage(1512)
    if Game.GetPlayer().IsInPowerArmor()
      TutorialMsg1502.ShowAsHelpMessage(asEvent1502, 9, 0, 1,  ContextNoMenu, StandardPriority)
    endif

  else
    self.setstage(1512)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1512_Item_00
Function Fragment_Stage_1512_Item_00()
;BEGIN CODE
; Unshow "Exit Power Armor" message
; ;Triggered from OnUnequip event in TutorialPlayerAliasScript

TutorialMsg1502.UnshowasHelpMessage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1540_Item_00
Function Fragment_Stage_1540_Item_00()
;BEGIN CODE
;Triggered from OnTimer event in tutorial script
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1545_Item_00
Function Fragment_Stage_1545_Item_00()
;BEGIN CODE
; Player has taken damage in power armor, activate help message
;Triggered either from OnTimer event in tutorial script (if not in combat)
;Or OnCombatStateChanged (player had been in combat)

objectreference Player = Game.GetPlayer()

if !self.GetStageDone(1550)
  self.SetStage(1550)
  Utility.Wait(2.5)
  TutorialMsg1545.ShowAsHelpMessage(asEvent1545, 6, 0, 1,  ContextNoMenu, 5)
  TutorialMsg1545A.ShowAsHelpMessage(asEvent1545A, 10, 0, 1,  ContextNoMenu, 5)
  ;If player still has charge left and a fusion core, play this message
  if Player.GetValue(PowerArmorBattery) > 0 
    TutorialMsg1545D.ShowAsHelpMessage(asEvent1545D, 8, 0, 1,  ContextNoMenu, 5)

  ;If the player's core is empty and they don't have another core, play this message
  elseif Player.GetItemCount(FusionCore) < 1
    TutorialMsg1545C.ShowAsHelpMessage(asEvent1545C, 8, 0, 1,  ContextNoMenu, 5)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1580_Item_00
Function Fragment_Stage_1580_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Power armor panel has taken damage in power armor, activate help message
;Triggered from OnHit event in tutorialscript
;Or from OnCombatStateChanged event in TutorialPlayerAliasScript

if !self.GetStageDone(1590); && kmyquest.bPanelDamageMessageAvailable == true
  self.SetStage(1590)
  Utility.Wait(1.5)
  TutorialMsg1580.ShowAsHelpMessage(asEvent1580, 11, 0, 1,  ContextNoMenu, 6)
  ;TutorialMsg1580A.ShowAsHelpMessage(asEvent1580A, 8, 0, 1,  ContextNoMenu, 6)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Enter power armor workbench, activate 1st help message
;Triggered from tutorial event in tutorialscript

if !self.GetStageDone(1707)
  self.SetStage(1707)

  Utility.WaitMenuMode(1.0)
  if Game.UsingGamepad()
    TutorialWorkbenchTotal.Show()
  else
    TutorialWorkbenchTotal_MK.Show()
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1760_Item_00
Function Fragment_Stage_1760_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Player attempted to activate power armor workbench without power armor
; Called from PowerArmorWorkbench.psc

if !kmyquest.bPABenchFindMessageActive
  kmyquest.bPABenchFindMessageActive = 1
  TutorialMsg1760.ShowAsHelpMessage(asEvent1760, 6, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1770_Item_00
Function Fragment_Stage_1770_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Player attempted to activate power armor workbench without power armor
; Called from PowerArmorWorkbench.psc

if !kmyquest.bPABenchExitMessageActive
  ;Message.ResetHelpMessage("PABenchExitArmor")
  kmyquest.bPABenchExitMessageActive = 1
  TutorialMsg1770.ShowAsHelpMessage(asEvent1770, 8, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1775_Item_00
Function Fragment_Stage_1775_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player exited power armor, turn off "Exit armor" message
;Triggered from TutorialPlayerAliasScript unequipped event

kmyquest.bPABenchExitMessageActive = 0
TutorialMsg1770.UnshowAsHelpMessage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player has left Vault 111, register for death spell, rad events (TOTALLY RAD!) and sprint timer

;Game.GetPlayer().AddSpell(abPlayerDeathMessage, false)

;kmyquest.StartSprintTimer()

;kmyquest.RegisterPostVaultTutorialEvents()

;if VATS main tutorial isn't shut down, close it off now
;if !self.GetStageDone(3999)
;  self.SetStage(3999)
;endif

;if VATS exit tutorial isn't shut down, close it off now
;if !self.GetStageDone(3480)
;  self.SetStage(3480)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1805_Item_00
Function Fragment_Stage_1805_Item_00()
;BEGIN CODE
; Player takes radiation damage outside of Vault 111, trigger help message
;Triggered from tutorial event in tutorialscript

if !self.GetStageDone(1810) && MQ102.GetStageDone(10) && Game.GetPlayer().GetCombatState() < 1
    self.SetStage(1810)

    Utility.Wait(2.0)
    TutorialMsg1800Total.ShowAsHelpMessage(asEvent1800, 8, 0, 1, ContextNoMenu, StandardPriority) 
endif

;OLD V 1.0
;Utility.Wait(1.0)
;if self.GetStageDone(510) && !self.GetStageDone(1802) && !self.GetStageDone(1810)
;  debug.messagebox("Waiting for drinking message")
;else
;  if !self.GetStageDone(1810) && MQ102.GetStageDone(10) && MessageBoxTutorialBlocked.GetValue() == 0
;    debug.messagebox("Rad message")
;    self.SetStage(1810)
;    MessageBoxTutorialBlocked.SetValue(1)
;
;    Utility.Wait(InitialWaitDuration)
;  
;    ;Make sure player isn't dead
;    if !Game.GetPlayer().IsDead()
;      TutorialMsg1800Total.Show() 
;    else
;      MessageBoxTutorialBlocked.SetValue(0)
;    endif
;
;    Utility.Wait(MessageBoxTutorialWait.GetValue())
;    MessageBoxTutorialBlocked.SetValue(0)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1810_Item_00
Function Fragment_Stage_1810_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
; Unregister for radiation events

kmyquest.UnRegisterPlayerRadiationEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
;Player has entered maps screen in Pip boy for first time. Fire fast travel tutorial
;Triggered from tutorial event in tutorialscript (can also be shutdown by VFT tutorial)

if !self.GetStageDone(1910)
   self.SetStage(1910)
  if Game.UsingGamepad()
    TutorialMsg1900.ShowAsHelpMessage(asEvent1900, 8, 0, 1, ContextStringPipboy, 7)
  else
    TutorialMsg1900_MK.ShowAsHelpMessage(asEvent1900_MK, 10, 0, 1, ContextStringPipboy, 7)
  endif

  if Game.UsingGamepad()
    TutorialMsg1900A.ShowAsHelpMessage(asEvent1900A, 8, 0, 1, ContextStringPipboy, 7)
  else
    TutorialMsg1900MK.ShowAsHelpMessage(asEvent1900MK, 8, 0, 1, ContextStringPipboy, 7)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1920_Item_00
Function Fragment_Stage_1920_Item_00()
;BEGIN CODE
;Fast travel to and from Institute enabled. Fire tutorial
;Triggered from MQ207 stage 200

if !self.GetStageDone(1930)
  self.SetStage(1930)

  Utility.Wait(1.0)

  if HC_Manager.IsGlobalTrue( HC_Manager.HC_Rule_NoFastTravel)
    HC_Manager.ShowInstituteFastTravelTutorial(asEvent1920, 7, 0, 1, ContextNoMenu, StandardPriority)
  else
     TutorialMsg1920.ShowAsHelpMessage(asEvent1920, 7, 0, 1, ContextNoMenu, StandardPriority)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1940_Item_00
Function Fragment_Stage_1940_Item_00()
;BEGIN CODE
;Fast travel to and from Institute enabled. Fire tutorial
;Triggered from RRM01 stage 1940

if !self.GetStageDone(1950)
  self.SetStage(1950)

  TutorialMsg1940.ShowAsHelpMessage(asEvent1940, 7, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Player has entered Facegen, show messages
;Triggered from tutorial event in tutorial script

Utility.Wait(0.5)
if !self.GetStageDone(2025)
  if Game.UsingGamePad()
    TutorialMsg2000.ShowAsHelpMessage(asEvent2000 , 8, 0, 1, ContextNoMenu, 14)
   else
    TutorialMsg2000MK.ShowAsHelpMessage(asEvent2000MK , 9, 0, 1, ContextNoMenu, 14)
  endif

  if Game.UsingGamePad()
      TutorialMsg2000A.ShowAsHelpMessage(asEvent2000A, 8, 0, 1, ContextNoMenu, 14)
   endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
;Second Facegen message complete, start message 3
;Triggered from MQ101_001_MirrorScene, phase 8

Utility.Wait(8.0)
if self.GetStageDone(2000)
  ;If the player has already entered the facial menu, wait until that's all done before calling this one again
else
  if !self.GetStageDone(2025) && !self.GetStageDone(2020)
    self.SetStage(2020)
    if Game.UsingGamePad()
      TutorialMsg2000B.ShowAsHelpMessage(asEvent2000B, 7, 0, 1, ContextNoMenu, StandardPriority)
     else
      TutorialMsg2010MK.ShowAsHelpMessage(asEvent2000B, 7, 0, 1, ContextNoMenu, StandardPriority)
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2015_Item_00
Function Fragment_Stage_2015_Item_00()
;BEGIN CODE
;Player entered face menu before Third message showed. Show it here now
;Second Facegen message complete, start message 3
;Triggered from tutorial event in tutorial script

Utility.Wait(1.0)
if !self.GetStageDone(2025) && !self.GetStageDone(2020)
  ;debug.messagebox("Setting 2020 from 2015")
  self.SetStage(2020)
  if Game.UsingGamePad()
    TutorialMsg2000B.ShowAsHelpMessage(asEvent2000B, 7, 0, 1, ContextNoMenu, StandardPriority)
   else
    TutorialMsg2010MK.ShowAsHelpMessage(asEvent2000B, 7, 0, 1, ContextNoMenu, StandardPriority)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2020_Item_00
Function Fragment_Stage_2020_Item_00()
;BEGIN CODE
; Face gen part three completed
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2025_Item_00
Function Fragment_Stage_2025_Item_00()
;BEGIN CODE
;Player exited Facegen, turn off any active tutorials and reset "Accept" messages
;Triggered from MQ101 Stage 20

Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
; Player encountered a speech challenge, show help message
; Triggered from Actor.OnSpeechChallengeAvailable in tutorialscript

if !self.GetStageDone(2110)
  self.SetStage(2110)
  TutorialMsg2100.ShowAsHelpMessage(asEvent2100, 9, 0, 1, ContextNoMenu, 8)
  TutorialMsg2100A.ShowAsHelpMessage(asEvent2100A, 9, 0, 1, ContextNoMenu, 8)
  TutorialMsg2100B.ShowAsHelpMessage(asEvent2100B, 9, 0, 1, ContextNoMenu, 8)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN CODE
;Player's head crippled, play crippled head tutorial
;Triggered from TutorialPlayerAliasScript

if !self.GetStageDone(2250) && MessageBoxTutorialBlocked.GetValue() == 0
  self.SetStage(2250)

  ;Block other message box tutorial from showing
  MessageBoxTutorialBlocked.SetValue(1)

  ;Make sure player isn't dead
  if !Game.GetPlayer().IsDead()
    TutorialMsg2200.Show() 
  else
    MessageBoxTutorialBlocked.SetValue(0)
  endif

  ;Wait after message box tutorial completed, then allow other message box tutorials
  Utility.Wait(MessageBoxTutorialWait.GetValue())
  MessageBoxTutorialBlocked.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2210_Item_00
Function Fragment_Stage_2210_Item_00()
;BEGIN CODE
;Player's arm crippled, play crippled arm tutorial
;Triggered from TutorialPlayerAliasScript

if !self.GetStageDone(2250) && MessageBoxTutorialBlocked.GetValue() == 0
  self.SetStage(2250)

  ;Block other message box tutorial from showing
  MessageBoxTutorialBlocked.SetValue(1)

  ;Make sure player isn't dead
  if !Game.GetPlayer().IsDead()
    TutorialMsg2210.Show() 
  else
    MessageBoxTutorialBlocked.SetValue(0)
  endif
 
  ;Wait after message box tutorial completed, then allow other message box tutorials
  Utility.Wait(MessageBoxTutorialWait.GetValue())
  MessageBoxTutorialBlocked.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2220_Item_00
Function Fragment_Stage_2220_Item_00()
;BEGIN CODE
;Player's leg crippled, play crippled leg tutorial
;Triggered from TutorialPlayerAliasScript

if !self.GetStageDone(2250) && MessageBoxTutorialBlocked.GetValue() == 0
  self.SetStage(2250)

  ;Block other message box tutorial from showing
  MessageBoxTutorialBlocked.SetValue(1)

  ;Make sure player isn't dead
  if !Game.GetPlayer().IsDead()
    TutorialMsg2220.Show() 
  else
    MessageBoxTutorialBlocked.SetValue(0)
  endif

  ;Wait after message box tutorial completed, then allow other message box tutorials
  Utility.Wait(MessageBoxTutorialWait.GetValue())
  MessageBoxTutorialBlocked.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2230_Item_00
Function Fragment_Stage_2230_Item_00()
;BEGIN CODE
;Player's torso crippled, play crippled torso tutorial
;Triggered from TutorialPlayerAliasScript

if !self.GetStageDone(2250) && MessageBoxTutorialBlocked.GetValue() == 0
  self.SetStage(2250)
  ;debug.messagebox("Setting MBBlock in Torso")

  ;Block other message box tutorial from showing
  MessageBoxTutorialBlocked.SetValue(1)

  ;Make sure player isn't dead
  if !Game.GetPlayer().IsDead()
    TutorialMsg2230.Show() 
  else
    MessageBoxTutorialBlocked.SetValue(0)
  endif
  
  ;Wait after message box tutorial completed, then allow other message box tutorials
  Utility.Wait(MessageBoxTutorialWait.GetValue())
  MessageBoxTutorialBlocked.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_00
Function Fragment_Stage_2300_Item_00()
;BEGIN CODE
;Player has entered a summoned vertibird, kick off tutorial
;Triggered from VFT quest, stage 30

if !self.GetStageDone(2310)
  self.SetStage(2310)

  ;If fast travel tutorial hasn't fired, shut it down now
  if !self.GetStageDone(1910)
    self.SetStage(1910)
  endif

  Utility.Wait(0.5)
  TutorialMsg2300.ShowAsHelpMessage(asEvent2300, 8, 0, 1, ContextStringNoContext, 16)

  if Game.UsingGamepad()
    TutorialMsg2300A.ShowAsHelpMessage(asEvent2300A, 10, 0, 1, ContextStringNoContext, 16)
  else  
    TutorialMsg2300A_MK.ShowAsHelpMessage(asEvent2300A_MK, 10, 0, 1, ContextStringNoContext, 16)
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN CODE
;Show "Jump from Vertibird" tutoral
;Don't think this is triggered anymore,

if !self.GetStageDone(2410)
  TutorialMsg2400.ShowAsHelpMessage(asEvent2400, 9, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2405_Item_00
Function Fragment_Stage_2405_Item_00()
;BEGIN CODE
;Unshow "Jump from Vertibird" message

if !self.GetStageDone(2410)
  TutorialMsg2400.UnshowAsHelpMessage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
;Fire off first Put 'em Up Perk (fired from OnMenuOpenClose event)

if !self.GetStageDone(2570)
  Actor Player = Game.GetPlayer()
  if !self.GetStageDone(2570) && (Player.HasPerk(Intimidation03) || Player.HasPerk(AnimalFriend03) || Player.HasPerk(WastelandWhisperer03))
    self.SetStage(2520)
  elseif !self.GetStageDone(2560) && (Player.HasPerk(Intimidation02) || Player.HasPerk(AnimalFriend02) || Player.HasPerk(WastelandWhisperer02))
    self.SetStage(2510)
  elseif !self.GetStageDone(2550) && (Player.HasPerk(Intimidation01) || Player.HasPerk(AnimalFriend01) || Player.HasPerk(WastelandWhisperer01))
    self.SetStage(2505)
  endif
else
  ;Currently perk is a crime against anyone. If it ends up only being a crime against humans,
  ;this functionality will be needed
  ;if !self.GetStageDone(2530)
  ;  self.SetStage(2525)
  ;endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2505_Item_00
Function Fragment_Stage_2505_Item_00()
;BEGIN CODE
; Player exited perk menu with a Pacify perk. Show messages
;Triggered by stage 2500

if !self.GetStageDone(2550)
  self.SetStage(2550)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg2500.ShowAsHelpMessage(asEvent2500, 12, 0, 1, ContextNoMenu, 9)
endif

;Tack on crime mention if this is first perk
if !self.GetStageDone(2530)
    self.SetStage(2530)
    TutorialMsg2530D.ShowAsHelpMessage(asEvent2530, 16, 0, 1, ContextNoMenu, 9)
endif

;Currently perk is a crime against anyone. If it ends up only being a crime against humans,
;functionality below will be needed
;Check to see if we should tack on intimidation follow-up message
;if !self.GetStageDone(2530)
;  Actor Player = Game.GetPlayer()
;  if Player.HasPerk(Intimidation03) || Player.HasPerk(Intimidation02) || Player.HasPerk(Intimidation01)
;    self.SetStage(2530)
;    Utility.Wait(InitialWaitDuration)
;    TutorialMsg2530C.ShowAsHelpMessage(asEvent2530, 10, 0, 1, ContextNoMenu, StandardPriority)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2510_Item_00
Function Fragment_Stage_2510_Item_00()
;BEGIN CODE
;Player has an incite perk. Trigger that message and shutdown pacify
;Triggered by stage 2500

if !self.GetStageDone(2560)
  ;Close out Pacify tutorial as well
  self.SetStage(2550)
  self.SetStage(2560)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg2500A.ShowAsHelpMessage(asEvent2500A, 12, 0, 1, ContextNoMenu, 10)
  TutorialMsg2500G.ShowAsHelpMessage(asEvent2500G, 8, 0, 1, ContextNoMenu, 10)
endif

;Tack on crime mention if this is first perk
if !self.GetStageDone(2530)
    self.SetStage(2530)
    TutorialMsg2530D.ShowAsHelpMessage(asEvent2530, 16, 0, 1, ContextNoMenu, 10)
endif

;Currently perk is a crime against anyone. If it ends up only being a crime against humans,
;functionality below will be needed
;Check to see if we should tack on intimidation follow-up message
;if !self.GetStageDone(2530)
;  Actor Player = Game.GetPlayer()
;  if Player.HasPerk(Intimidation03) || Player.HasPerk(Intimidation02) || Player.HasPerk(Intimidation01)
;    self.SetStage(2530)
;    Utility.Wait(InitialWaitDuration)
;    TutorialMsg2530C.ShowAsHelpMessage(asEvent2530, 10, 0, 1, ContextNoMenu, StandardPriority)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2520_Item_00
Function Fragment_Stage_2520_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player has command perk. Trigger that message and shutdown pacify and incite
;Triggered by stage 2500

if !self.GetStageDone(2570)
  ;Close out Pacify and Incite tutorials as well
  self.SetStage(2550)
  self.SetStage(2560)
  self.SetStage(2570)

  Utility.Wait(InitialWaitDuration)
  TutorialMsg2500B.ShowAsHelpMessage(asEvent2500B, 12, 0, 1, ContextNoMenu, 11)
  TutorialMsg2500F.ShowAsHelpMessage(asEvent2500F, 8, 0, 1, ContextNoMenu, 11)
endif

;Tack on crime mention if this is first perk
if !self.GetStageDone(2530)
    self.SetStage(2530)
    TutorialMsg2530D.ShowAsHelpMessage(asEvent2530, 16, 0, 1, ContextNoMenu, 11)
endif

;Unregister menu event
kmyquest.UnregisterMenuEvent(LevelUpMenuContext)

;Currently perk is a crime against anyone. If it ends up only being a crime against humans,
;functionality below will be needed
;Check to see if we should tack on intimidation follow-up message
;if !self.GetStageDone(2530)
;  Actor Player = Game.GetPlayer()
;  if Player.HasPerk(Intimidation03) || Player.HasPerk(Intimidation02) || Player.HasPerk(Intimidation01)
;    self.SetStage(2530)
;    Utility.Wait(InitialWaitDuration)
;    TutorialMsg2530C.ShowAsHelpMessage(asEvent2530, 10, 0, 1, ContextNoMenu, StandardPriority)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2525_Item_00
Function Fragment_Stage_2525_Item_00()
;BEGIN CODE
;Currently perk is a crime against anyone. If it ends up only being a crime against humans,
;functionality below will be needed
; Checked at the end of each Put 'em Up perk. Show crime warning

;if !self.GetStageDone(2530)
;  if Game.GetPlayer().HasPerk(Intimidation03)
;    self.SetStage(2530)
;    Utility.Wait(InitialWaitDuration)
;   TutorialMsg2530B.ShowAsHelpMessage(asEvent2530, 10, 0, 1, ContextNoMenu, StandardPriority)
;  elseif Game.GetPlayer().HasPerk(Intimidation02)
;    self.SetStage(2530)
;    Utility.Wait(InitialWaitDuration)
;   TutorialMsg2530A.ShowAsHelpMessage(asEvent2530, 10, 0, 1, ContextNoMenu, StandardPriority)
;  elseif Game.GetPlayer().HasPerk(Intimidation01)
;    self.SetStage(2530)
;    Utility.Wait(InitialWaitDuration)
;   TutorialMsg2530.ShowAsHelpMessage(asEvent2530, 10, 0, 1, ContextNoMenu, StandardPriority)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2530_Item_00
Function Fragment_Stage_2530_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Check to see if main tutorial complete. If so, pull the event
;Triggered from 2505, 2510, or 2520

;if self.GetStageDone(2570)
;  kmyquest.UnregisterMenuEvent(LevelUpMenuContext)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2570_Item_00
Function Fragment_Stage_2570_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Check to see if main tutorial complete. If so, pull the event

;if self.GetStageDone(2530)
;  kmyquest.UnregisterMenuEvent(LevelUpMenuContext)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2600_Item_00
Function Fragment_Stage_2600_Item_00()
;BEGIN CODE
; Show Laser Musket tutorial
;Triggered from inventory event in TutorialPlayerAliasScript

if !self.GetStageDone(2610)
  self.setstage(2610)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg2600.ShowAsHelpMessage(asEvent2600, 9, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2700_Item_00
Function Fragment_Stage_2700_Item_00()
;BEGIN CODE
; Show Gauss Rifle tutorial
;Triggered from inventory event in TutorialPlayerAliasScript

if !self.GetStageDone(2710)
  self.setstage(2710)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg2700.ShowAsHelpMessage(asEvent2700, 9, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2800_Item_00
Function Fragment_Stage_2800_Item_00()
;BEGIN CODE
; Show Syringer tutorial
;Triggered from inventory event in TutorialPlayerAliasScript

if !self.GetStageDone(2820)
  self.setstage(2820)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg2800.ShowAsHelpMessage(asEvent2800, 9, 0, 1, ContextNoMenu, 13)
  TutorialMsg2810.ShowAsHelpMessage(asEvent2810, 9, 0, 1, ContextNoMenu, 13)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2900_Item_00
Function Fragment_Stage_2900_Item_00()
;BEGIN CODE
; Show Grenades and mines tutorial
;Triggered from inventory event in TutorialPlayerAliasScript

if !self.GetStageDone(2910)
  self.setstage(2910)
  Utility.Wait(InitialWaitDuration)
  TutorialMsg2900.ShowAsHelpMessage(asEvent2900, 9, 0, 1, ContextStringNoContext, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2920_Item_00
Function Fragment_Stage_2920_Item_00()
;BEGIN CODE
;Player has equipped a grenade or mine after already seeing the initial grenade tutorial
;Triggered from TutorialPlayerAliasScript OnEquip event

if !self.GetStageDone(2930)
  self.SetStage(2930)

  TutorialGrenadesReminder.ShowAsHelpMessage(asEvent2920, 8, 0, 1, ContextStringNoContext, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN CODE
;Show Jetpack tutorial (triggered from abPowerArmorJetpack)

if !self.GetStageDone(3010) && Game.GetPlayer().IsInPowerArmor()
  self.SetStage(3010)
  Utility.Wait(2.0)
  TutorialMsg3000.ShowAsHelpMessage(asEvent3000, 7, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3130_Item_00
Function Fragment_Stage_3130_Item_00()
;BEGIN CODE
; Pickpocket tutorial message 02 (triggered from tutorial event in tutorialscript)

if !self.GetStageDone(3150)
  self.SetStage(3150)

  Utility.WaitMenuMode(InitialWaitDuration)
  TutorialMsg3110.ShowAsHelpMessage(asEvent3110, 10, 0, 1, ContextStringNoContext, 12)
  TutorialMsg3120.ShowAsHelpMessage(asEvent3120, 10, 0, 1, ContextStringNoContext, 12)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3400_Item_00
Function Fragment_Stage_3400_Item_00()
;BEGIN CODE
; VATS menu opened (handled in OpenCloseMenu event). Throw first message

if !self.GetStageDone(3999) && !MQ102.GetStageDone(10) && self.GetStageDone(200)

  ;Pull iron sights message if still showing
  ;if !self.GetStageDone(202)
  ;  TutorialMsg200A.UnshowAsHelpMessage()
  ;  TutorialMsg200NoGun.UnshowAsHelpMessage()
  ;endif

  self.SetStage(3999)
  if Game.UsingGamepad()
    TutorialVATS01.ShowAsHelpMessage(asEventVATS01, 12, 0, 1, ContextStringVATS, 15)
  else
    TutorialVATS01_MK.ShowAsHelpMessage(asEventVATS01_MK, 12, 0, 1, ContextStringVATS, 15)
  endif

  if Game.UsingGamepad()
    TutorialVATS02.ShowAsHelpMessage(asEventVATS02, 9, 0, 1, ContextStringVATS, 15)
  else
    TutorialVATS02_MK.ShowAsHelpMessage(asEventVATS02_MK, 9, 0, 1, ContextStringVATS, 15)
  endif

  TutorialVATS05.ShowAsHelpMessage(asEventVATS05, 7, 0, 1, ContextStringVATS, 15)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3410_Item_00
Function Fragment_Stage_3410_Item_00()
;BEGIN CODE
; VATS message 01 complete, fire message 02

;Close down VATS tutorial
;self.SetStage(3999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3470_Item_00
Function Fragment_Stage_3470_Item_00()
;BEGIN CODE
;Play fifth message (triggered from completion of message four)

if !self.GetStageDone(3480) && !MQ102.GetStageDone(10)
    self.SetStage(3480)
    TutorialVATS05.ShowAsHelpMessage(asEventVATS05, 7, 0, 1, ContextStringVATS)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3490_Item_00
Function Fragment_Stage_3490_Item_00()
;BEGIN AUTOCAST TYPE tutorialscript
Quest __temp = self as Quest
tutorialscript kmyQuest = __temp as tutorialscript
;END AUTOCAST
;BEGIN CODE
;Player has exited VATS. Pull messages
;Triggered from OpenCloseMenuEvent in TutorialScript

;Message.ClearHelpMessages()

;if self.GetStageDone(3420)
;  if Game.UsingGamepad()
;    TutorialVATS01.UnShowAsHelpMessage()
;    TutorialVATS02.UnShowAsHelpMessage()
;  else
;    TutorialVATS01_MK.UnShowAsHelpMessage()
;    TutorialVATS02_MK.UnShowAsHelpMessage()
;  endif
;endif

if self.GetStageDone(3480)
  TutorialVATS05.UnShowAsHelpMessage()
endif

;If final two messages have been displayed, pull VATS menu event
if self.GetStageDone(3999)
  kmyquest.UnregisterMenuEvent(ContextStringVATS)
endif

;If you haven't seen the Exit Vats tutorial, you don't need to
;if !self.GetStageDone(3480)
;  self.SetStage(3480)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN CODE
;Show shipment item tutorial (triggered from inventory event in player alias tutorial)

if !self.GetStageDone(4010)
  self.setstage(4010)
  Utility.Wait(InitialWaitDuration)
  TutorialShipmentItem.ShowAsHelpMessage(asEventShipmentItem, 10, 0, 1, ContextNoMenu, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4100_Item_00
Function Fragment_Stage_4100_Item_00()
;BEGIN CODE
;Player entered Inventory for first time outside Vault, show adding hotkeys tutorial
;Fired from tutorial event in tutorial script

if !self.GetStageDone(4110)
  self.SetStage(4110) 

    TutorialMsg1050A.ShowAsHelpMessage(asEvent1050A, 10, 0, 1, ContextStringPipboy, StandardPriority)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property TutorialMsg100 Auto Const
Message Property TutorialMsg200 Auto Const
Message Property TutorialMsg500 Auto Const

Float Property InitialWaitDuration = 0.5 Auto Const

String Property asEvent100 Auto Const
String Property asEvent200 Auto Const
String Property asEvent500 Auto Const

String Property asEvent600 = "Followers & Command Mode" Auto Const

Message Property TutorialMsg700 Auto Const

String Property asEvent700 Auto Const

Message Property TutorialMsg800 Auto Const

String Property asEvent800 Auto Const

Weapon Property Baton Auto Const

Message Property TutorialMsg900 Auto Const

String Property asEvent900 Auto Const

Potion Property Stimpak Auto Const

Message Property TutorialMsg600 Auto Const

Message Property TutorialMsg200A Auto Const

String Property asEvent200A Auto Const

Perk Property TutorialDrinkWater Auto Const

Quest Property MQ102 Auto Const

String Property LockpickContextString Auto Const

String Property ContextStringCooking Auto Const

Message Property TutorialMsg1050A Auto Const

String Property asEvent1050A Auto Const

Message Property TutorialMsg610A Auto Const

String Property asEvent610A Auto Const

Message Property TutorialMsg1500 Auto Const

String Property asEvent1500 Auto Const
Message Property TutorialMsg1545 Auto Const

Message Property TutorialMsg1545A Auto Const

Message Property TutorialMsg1545B Auto Const

String Property asEvent1545 Auto Const

String Property asEvent1545A Auto Const

String Property asEvent1545B Auto Const

Message Property TutorialMsg1580 Auto Const

Message Property TutorialMsg1580A Auto Const

String Property asEvent1580 Auto Const

String Property asEvent1580A Auto Const

Weapon Property Gun10mm Auto Const

GlobalVariable Property pPlayerKnowsDogmeatsName Auto Const

Message Property TutorialMsg620 Auto Const

Int Property StandardPriority Auto Const

String Property ContextNoMenu Auto Const

Message Property TutorialMsg2000 Auto Const

Message Property TutorialMsg2000A Auto Const

Message Property TutorialMsg2000B Auto Const

String Property asEvent2000 Auto Const

String Property asEvent2000A Auto Const

String Property asEvent2000B Auto Const

String Property ContextStringPipboy Auto Const

Message Property TutorialMsg1502 Auto Const

String Property asEvent1502 Auto Const

String Property asEvent950 Auto Const

Message Property TutorialMsg950 Auto Const

String Property asEvent2100 Auto Const

Message Property TutorialMsg2100 Auto Const

Ammo Property FusionCore Auto Const

Message Property TutorialMsg1545C Auto Const

Message Property TutorialMsg1545D Auto Const

String Property asEvent1545C Auto Const

String Property asEvent1545D Auto Const

String Property asEvent1800 Auto Const

String Property asEvent620 Auto Const

Message Property TutorialMsg620A Auto Const

Message Property TutorialMsg620B Auto Const

String Property asEvent620A Auto Const

String Property asEvent620B Auto Const

String Property asEvent1760 Auto Const

Message Property TutorialMsg1760 Auto Const

String Property asEvent1770 Auto Const

Message Property TutorialMsg1770 Auto Const

String Property asEvent250 Auto Const

Message Property TutorialMsg250 Auto Const

String Property ContextStringNoContext Auto Const

String Property asEvent2100A Auto Const

Message Property TutorialMsg2100A Auto Const

String Property asEvent1800Total Auto Const

Message Property TutorialMsg1800Total Auto Const

String Property asEvent2200 Auto Const

Message Property TutorialMsg2200 Auto Const

Message Property TutorialMsg2210 Auto Const

Message Property TutorialMsg2210A Auto Const

Message Property TutorialMsg2220 Auto Const

Message Property TutorialMsg2220A Auto Const

Message Property TutorialMsg2230 Auto Const

Message Property TutorialMsg2230A Auto Const

GlobalVariable Property MessageBoxTutorialBlocked Auto Const

GlobalVariable Property MessageBoxTutorialWait Auto Const

String Property asEvent850 Auto Const

Message Property TutorialMsg850 Auto Const

String Property asEvent2100B Auto Const

Message Property TutorialMsg2100B Auto Const

String Property asEvent1250 Auto Const

Message Property TutorialMsg1250 Auto Const

String Property asEvent2300 Auto Const

Message Property TutorialMsg2300 Auto Const

String Property asEvent2300A Auto Const

String Property asEvent2300A_MK Auto Const

Message Property TutorialMsg2300A Auto Const

Message Property TutorialMsg2300A_MK Auto Const

String Property asEvent1900 Auto Const

Message Property TutorialMsg1900 Auto Const

String Property asEvent1900A Auto Const

Message Property TutorialMsg1900A Auto Const

String Property asEvent1900MK Auto Const

Message Property TutorialMsg1900MK Auto Const

String Property asEvent1920 Auto Const

String Property asEvent1940 Auto Const

Message Property TutorialMsg1920 Auto Const

Message Property TutorialMsg1940 Auto Const

String Property asEvent920 Auto Const

Message Property TutorialMsg920 Auto Const

Message Property TutorialMsg2400 Auto Const

String Property asEvent2400 Auto Const

SPELL Property abPlayerDeathMessage Auto Const

String Property asEvent2500 Auto Const

String Property asEvent2500A Auto Const

String Property asEvent2500B Auto Const

Message Property TutorialMsg2500 Auto Const

Message Property TutorialMsg2500A Auto Const

Message Property TutorialMsg2500B Auto Const

String Property asEvent2600 Auto Const

Message Property TutorialMsg2600 Auto Const

String Property asEvent2700 Auto Const

Message Property TutorialMsg2700 Auto Const

String Property LevelUpMenuContext Auto Const

String Property asEvent2800 Auto Const

String Property asEvent2810 Auto Const

Message Property TutorialMsg2800 Auto Const

Message Property TutorialMsg2810 Auto Const

String Property asEvent1070 Auto Const

Message Property TutorialMsg1070 Auto Const

String Property asEvent2900 Auto Const

Message Property TutorialMsg2900 Auto Const

String Property asEvent3000 Auto Const

Message Property TutorialMsg3000 Auto Const

String Property asEvent3100 Auto Const

String Property asEvent3110 Auto Const

Message Property TutorialMsg3100 Auto Const

Message Property TutorialMsg3110 Auto Const

String Property asEvent3120 Auto Const

Message Property TutorialMsg3120 Auto Const

String Property asEvent640 Auto Const

String Property asEvent645 Auto Const

Message Property TutorialMsg640 Auto Const

Message Property TutorialMsg645 Auto Const

String Property asEvent642 Auto Const

Message Property TutorialMsg642 Auto Const

String Property asEvent1500A Auto Const

String Property asEvent1500B Auto Const

Message Property TutorialMsg1500A Auto Const

Message Property TutorialMsg1500B Auto Const

ActorValue Property PowerArmorBattery Auto Const

String Property asEvent1500C Auto Const

Message Property TutorialMsg1500C Auto Const

Message Property TutorialMsg2000MK Auto Const

Message Property TutorialMsg2010MK Auto Const

String Property asEvent2000MK Auto Const

String Property asEvent1520 Auto Const

Perk Property Intimidation01 Auto Const

Perk Property AnimalFriend01 Auto Const

Perk Property WastelandWhisperer01 Auto Const

Perk Property Intimidation02 Auto Const

Perk Property Intimidation03 Auto Const

Perk Property AnimalFriend02 Auto Const

Perk Property AnimalFriend03 Auto Const

Perk Property WastelandWhisperer02 Auto Const

Perk Property WastelandWhisperer03 Auto Const

String Property asEvent2500F Auto Const

Message Property TutorialMsg2500F Auto Const

String Property asEvent2500G Auto Const

Message Property TutorialMsg2500G Auto Const

String Property asEvent600D Auto Const

Message Property TutorialMsg600D Auto Const

String Property asEvent1070_MK Auto Const

Message Property TutorialMsg1070_MK Auto Const

String Property asEvent600A_MK Auto Const

Message Property TutorialMsg600A_MK Auto Const

String Property asEvent1900_MK Auto Const

Message Property TutorialMsg1900_MK Auto Const

String Property asEvent400MK Auto Const

String Property ContextStringVATS Auto Const

String Property asEventVATS01 Auto Const

String Property asEventVATS01_MK Auto Const

String Property asEventVATS02 Auto Const

String Property asEventVATS02_MK Auto Const

String Property asEventVATS05 Auto Const

Message Property TutorialVATS01 Auto Const

Message Property TutorialVATS01_MK Auto Const

Message Property TutorialVATS02 Auto Const

Message Property TutorialVATS02_MK Auto Const

Message Property TutorialVATS05 Auto Const

String Property asEvent200NoGun Auto Const

Message Property TutorialMsg200NoGun Auto Const

String Property asEvent850NoGun Auto Const

Message Property TutorialMsg850NoGun Auto Const

String Property asEvent200ANoGun Auto Const

Message Property TutorialMsg200ANoGun Auto Const

String Property asEvent2530 Auto Const

Message Property TutorialMsg2530 Auto Const

Message Property TutorialMsg2530A Auto Const

Message Property TutorialMsg2530B Auto Const

Message Property TutorialMsg2530C Auto Const

Message Property TutorialMsg2530D Auto Const

Message Property TutorialMsg1700B_MK Auto Const

Message Property TutorialMsg1700B_PA_MK Auto Const

String Property asEvent250_PipNav Auto Const

Message Property TutorialPipboyNavigation Auto Const

Message Property TutorialPipboyNavigation_MK Auto Const

String Property asEvent250_PipNav01 Auto Const

String Property asEvent250_PipNav_MK Auto Const

String Property asEvent250_PipNav_MK01 Auto Const

Message Property TutorialPipboyNavigation01 Auto Const

Message Property TutorialPipboyNavigation_MK01 Auto Const

String Property asEvent680 Auto Const

Message Property TutorialCompanionsRomance Auto Const

String Property asEventSprinting Auto Const

Message Property TutorialSprinting Auto Const

String Property asEventShipmentItem Auto Const

Message Property TutorialShipmentItem Auto Const

Message Property TutorialMsg920_MK Auto Const

Message Property TutorialWorkbenchTotal Auto Const

Message Property TutorialWorkbenchTotal_MK Auto Const

Message Property TutorialCookingTotal Auto Const

Message Property TutorialCookingTotal_MK Auto Const

Message Property TutorialHackingTotal Auto Const

Message Property TutorialHackingTotal_MK Auto Const

Message Property TutorialLockpickTotal Auto Const

Message Property TutorialLockpickTotal_MK Auto Const

String Property asEvent2920 Auto Const

Message Property TutorialGrenadesReminder Auto Const

Message Property TutorialCompanionsIntro_Dogmeat Auto Const

Message Property TutorialCompanionHealing01_Dogmeat Auto Const

Message Property TutorialCompanionHealing02_Dogmeat Auto Const

Message Property TutorialCompanionHealing02A_Dogmeat Auto Const

Location Property ConcordLocation Auto Const

hardcore:hc_managerscript Property HC_Manager Auto Const Mandatory
