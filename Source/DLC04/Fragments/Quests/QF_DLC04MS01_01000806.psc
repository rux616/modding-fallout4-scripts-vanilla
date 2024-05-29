;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MS01_01000806 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move the player to Sierra
;Game.GetPlayer().MoveTo(DLC04MS01PT1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Sierra equips the Cappy glasses
;Alias_Sierra.GetActorRef().EquipItem(Alias_Glasses.GetReference())

; Block activation on Bradberton's head
Alias_BradbertonsHead.GetReference().BlockActivation(True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; Enable all Cappy code decals
DLC04MS01CappyEnableMarker.Enable()

; Complete the objective that tells the player to put on the glasses
SetObjectiveCompleted(9)

; Display objectives to the Hidden Cappys

if !IsObjectiveCompleted(10)
   SetObjectiveDisplayed(10)
endif

if !IsObjectiveCompleted(20)
   SetObjectiveDisplayed(20)
endif

if !IsObjectiveCompleted(30)
   SetObjectiveDisplayed(30)
endif

if !IsObjectiveCompleted(40)
   SetObjectiveDisplayed(40)
endif

if !IsObjectiveCompleted(50)
   SetObjectiveDisplayed(50)
endif

if !IsObjectiveCompleted(60)
   SetObjectiveDisplayed(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; Disable all Cappy code decals
DLC04MS01CappyEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; Set in the end data of the opening scene with Sierra and the raider

; Conditions the base travel packags that place the actors in the scene locations

; Pop a misc objective for the player to talk to Sierra
if GetStageDone(100) == False && DLC04MQ05.GetStageDone(120) == False
   DLC04MS01MiscObjectiveHolder.SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Set in Sierra's first dialogue scene if the player dismisses her and leaves

; Conditions a greeting where Sierra acknowledges having spoken to the player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
; Set when the player agrees to Sierra's offer of a tour

; Objective to follow Sierra
SetObjectiveDisplayed(5)

; Complete the misc objective to talk to Sierra
DLC04MS01MiscObjectiveHolder.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(8)

SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
; Set when the player agrees to get the Nuka-Cola Quartz for Sierra

DLC04MS01MiscObjectiveHolder.SetStage(40)
DLC04MS01MiscObjectiveHolder.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Set when the player gives Sierra the Nuka-Cola Quartz

; Call stage 20 on misc objective quest if it's running, which will stop the quest
if DLC04MS01MiscObjectiveHolder.IsRunning()
   DLC04MS01MiscObjectiveHolder.SetStage(20)
endif

Game.GetPlayer().RemoveItem(DLC04_NukaCola_Quartz, 1)
Alias_Sierra.GetActorRef().AddItem(DLC04_NukaCola_Quartz, 1)

SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Transfer glasses and flyer from Sierra to the player
Game.GetPlayer().AddItem(Alias_Glasses.GetReference(),1)
Game.GetPlayer().AddItem(Alias_Flyer.GetReference(),1)
Alias_Sierra.GetActorRef().SetOutfit(DLC04SierraOUtfitGlassesOff)

; Complete the misc objective to talk to Sierra
DLC04MS01MiscObjectiveHolder.SetStage(40)

; Display objectives to put the glasses on
SetObjectiveCompleted(8)
SetObjectiveDisplayed(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_NTU, DLC04MS01CappyActivator_NT_01Ref)

; Update objective if necessary
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_BP,DLC04MS01CappyActivator_BP_01Ref)

; Update objective if necessary
SetObjectiveCompleted(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_DG01,DLC04MS01CappyActivator_DG01_Ref)

; Update objective if necessary
if GetStageDone(125) == True
     SetObjectiveCompleted(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_DG02,DLC04MS01CappyActivator_DG02_Ref)

; Update objective if necessary
if GetStageDone(120) == True
     SetObjectiveCompleted(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_GZ01,DLC04MS01CappyActivator_GZ01_Ref)

; Update objective if necessary
if GetStageDone(135) == True
     SetObjectiveCompleted(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_GZ02,DLC04MS01CappyActivator_GZ02_Ref)

; Update objective if necessary
if GetStageDone(130) == True
     SetObjectiveCompleted(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_KK01,DLC04MS01CappyActivator_KK01_Ref)

; Update objective if necessary
if GetStageDone(145) == True
     SetObjectiveCompleted(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_KK02,DLC04MS01CappyActivator_KK02_Ref)

; Update objective if necessary
if GetStageDone(140) == True
     SetObjectiveCompleted(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_SA01,DLC04MS01CappyActivator_SA01_Ref)

; Update objective if necessary
if GetStageDone(155) == True
     SetObjectiveCompleted(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS01QuestScript
Quest __temp = self as Quest
DLC04:DLC04MS01QuestScript kmyQuest = __temp as DLC04:DLC04MS01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateClues(Alias_Clue_SA02,DLC04MS01CappyActivator_SA02_Ref)

; Update objective if necessary
if GetStageDone(150) == True
     SetObjectiveCompleted(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Remove Cappy glasses and 10 hidden Cappy clues

Actor Player = Game.GetPlayer()

Player.RemoveItem(Alias_Clue_BP.GetReference(),1)
Player.RemoveItem(Alias_Clue_DG01.GetReference(),1)
Player.RemoveItem(Alias_Clue_DG02.GetReference(),1)
Player.RemoveItem(Alias_Clue_GZ01.GetReference(),1)
Player.RemoveItem(Alias_Clue_GZ02.GetReference(),1)
Player.RemoveItem(Alias_Clue_KK01.GetReference(),1)
Player.RemoveItem(Alias_Clue_KK02.GetReference(),1)
Player.RemoveItem(Alias_Clue_NTU.GetReference(),1)
Player.RemoveItem(Alias_Clue_SA01.GetReference(),1)
Player.RemoveItem(Alias_Clue_SA02.GetReference(),1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Wait a few seconds fo rthe player to enter the code
Utility.Wait(5)

; Set the office door lock level to "unlocked"
DLC04MS01BradbertonsOfficeDoorRef.Unlock()
DLC04MS01BradbertonsOfficeDoorRef.SetLockLevel(0)

;Start Sierra's reaction scene to teh door being unlocked
DLC04MS01_SierraDoorUnlockScene.Start()

SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Sierra reacts to the button press
Utility.Wait(2)
DLC04MS01_SierraReactSecretElevator.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
; Move Sierra to the bottom of the elevator
Alias_Sierra.GetActorRef().MoveTo(DLC04MS01SierraMoveMarker)
Utility.Wait(1)
DLC04MS01_SierraRunToVaultDoor.Start()

;Update objectives
SetObjectiveCompleted(90)
SetObjectiveDisplayed(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Start Sierra's scene to approach the frozen head
Utility.Wait(1)
DLC04MS01_SierraEnterHeadRoom.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
; Start the head scene - talking activator will forcegreet
DLC04MS01_BradbertonPlayerScene.Start()

Alias_BradbertonsHead.GetReference().BlockActivation(False)

SetObjectiveCompleted(95)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; Move the player and Sierra
Game.GetPlayer().MoveTo(DLC04MS01PT3)
Alias_Sierra.GetActorRef().MoveTo(DLC04MS01PT3Sierra)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Give caps if the player killed Bradberton but retrieved the Nuka-Cola formula
Game.GetPlayer().AddItem(Caps001, 500)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
;Set if the player agreed to Sierra's offer

SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

; Companion affinity bump for killing Bradberton
SetStage(1018)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
DLC04MS01_SierraEnterHeadRoom.Stop()

;Open door
DLC04MS01RewardDoor.SetLockLevel(0)
DLC04MS01RewardDoor.SetOpen()

;Trigger Bradberton death scene
DLC04MS01BradbertonDies.Start()

; Block activation on Bradberton's frozen head
Alias_BradbertonsHead.GetReference().BlockActivation(True,True)

; Play power shutdown sound effect
DLC04OBJBradBertonPowerDown2D.Play(Alias_BradbertonsHead.GetReference())

; Disable the powered versions of the machines
DLC04MS01PowerShutdownMarker.Enable()

SetStage(760)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
; Give a few sceonds for Bradberton's death lines
Utility.Wait(3)

;Start the Sierra attack quest
DLC04MS01SierraAttacks.Start()

FailAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
;Manage objectives
SetObjectiveFailed(100)
SetObjectiveCompleted(110)
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; remove the Nuka-Cola formula
Game.GetPlayer().RemoveItem(Alias_Formula.GetReference(), 1)

; Give items
Game.GetPlayer().AddItem(DLC04_MS01_ClothesNukaWorldJumpsuit, 1)

; Now complete the quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

DLC04MS01Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
CompleteAllObjectives()

DLC04MS01Post.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04StartDebug Auto Const Mandatory

ReferenceAlias Property Alias_Sierra Auto Const Mandatory

ReferenceAlias Property Alias_Glasses Auto Const Mandatory

ReferenceAlias Property Alias_Flyer Auto Const Mandatory

ObjectReference Property DLC04MS01PT1 Auto Const Mandatory

ObjectReference Property DLC04MS01CappyEnableMarker Auto Const Mandatory

GlobalVariable Property DLC04MS01CappysFound Auto Const Mandatory

ReferenceAlias Property Alias_Clue_NTU Auto Const Mandatory

ReferenceAlias Property Alias_Clue_BP Auto Const Mandatory

ReferenceAlias Property Alias_Clue_DG01 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_DG02 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_GZ01 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_GZ02 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_KK01 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_KK02 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_SA01 Auto Const Mandatory

ReferenceAlias Property Alias_Clue_SA02 Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_NT_01Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_BP_01Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_DG01_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_DG02_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_GZ01_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_KK01_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_KK02_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_SA01_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_SA02_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01CappyActivator_GZ02_Ref Auto Const Mandatory

ObjectReference Property DLC04MS01RewardDoor Auto Const Mandatory

Scene Property DLC04MS01_BradbertonDeathScene Auto Const Mandatory

ObjectReference Property DLC04MS01BradbertonsOfficeDoorRef Auto Const Mandatory

ObjectReference Property DLC04MS01PT3 Auto Const Mandatory

ObjectReference Property DLC04MS01PT3Sierra Auto Const Mandatory

Scene Property DLC04MS01_BradbertonPlayerScene Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

Scene Property DLC04MS01_SierraPleadingScene Auto Const Mandatory

ReferenceAlias Property Alias_Formula Auto Const Mandatory

ReferenceAlias Property Alias_Raider Auto Const Mandatory

LocationAlias Property Alias_NukaTownLocation Auto Const Mandatory

Quest Property DLC04MS01MiscObjectiveHolder Auto Const Mandatory

Scene Property DLC04MS01_SierraTourScene Auto Const Mandatory

Scene Property DLC04MS01_SierraDoorUnlockScene Auto Const Mandatory

ReferenceAlias Property Alias_QT_Switch Auto Const Mandatory

Scene Property DLC04MS01_SierraReactSecretElevator Auto Const Mandatory

ObjectReference Property DLC04MS01SierraMoveMarker Auto Const Mandatory

Scene Property DLC04MS01_SierraRunToVaultDoor Auto Const Mandatory

Scene Property DLC04MS01_SierraEnterHeadRoom Auto Const Mandatory

Quest Property DLC04MS01Post Auto Const Mandatory

Outfit Property DLC04SierraOutfitNoGlasses Auto Const Mandatory

Quest Property DLC04MS01SierraAttacks Auto Const Mandatory

Potion Property DLC04_NukaCola_Quartz Auto Const Mandatory

ReferenceAlias Property Alias_PowerSwitch Auto Const Mandatory

Quest Property DLC04MS01BradbertonDies Auto Const Mandatory

Armor Property DLC04_MS01_ClothesNukaWorldJumpsuit Auto Const Mandatory

Outfit Property DLC04SierraOutfitGlassesOff Auto Const Mandatory

ReferenceAlias Property Alias_BradbertonsHead Auto Const Mandatory

ObjectReference Property DLC04MS01PowerShutdownMarker Auto Const Mandatory

Sound Property DLC04OBJBradBertonPowerDown2D Auto Const Mandatory

Quest Property DLC04MQ05 Auto Const Mandatory
