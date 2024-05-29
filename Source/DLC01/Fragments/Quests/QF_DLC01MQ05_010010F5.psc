;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ05_010010F5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Set Sanctuary workshop to be owned by player and give items.
(SanctuaryWorkshopRef as WorkshopScript).SetOwnedByPlayer(True)
SanctuaryWorkshopRef.AddItem(DLC01MQ02RoboticsWorkbenchItems)

;Complete PreReqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set DLC01MQ01 complete
DLC01MQ01.SetStage(2100)
DLC01MQ01.SetStage(2200)
DLC01MQ01.SetStage(2300)
DLC01MQ01.SetStage(2400)
DLC01MQ01.SetStage(2430)
DLC01MQ01.SetStage(3000)

;Set DLC01MQ02 complete
DLC01MQ02.SetStage(2100)
DLC01MQ02.SetStage(2200)
DLC01MQ02.SetStage(2300)
DLC01MQ02.SetStage(2400)
DLC01MQ02.SetStage(2500)
DLC01MQ02.SetStage(2600)
DLC01MQ02.SetStage(2800)
DLC01MQ02.SetStage(2900)
DLC01MQ02.SetStage(2950)
DLC01MQ02.SetStage(3000)

;Set DLC01MQ04 complete
DLC01MQ04.SetStage(100)
DLC01MQ04.SetStage(110)
DLC01MQ04.SetStage(120)
DLC01MQ04.SetStage(130)
DLC01MQ04.SetStage(140)
DLC01MQ04.SetStage(145)
DLC01MQ04.SetStage(150)
DLC01MQ04.SetStage(160)
DLC01MQ04.SetStage(180)
DLC01MQ04.SetStage(190)
DLC01MQ04.SetStage(200)
DLC01MQ04.SetStage(255)

;Set stage of the quest to officially start it and give first objective.
SetStage(10)

;Place a robot workbench in Sanctuary near the player.
Alias_WorkbenchRobotQuickstart.ForceRefTo(CarlaAtSanctuaryHillsMarker.PlaceAtMe(WorkbenchRobot))

;Give player enough materials to build a robot.
Game.GetPlayer().AddItem(DLC01MQ05RobotMaterialItems)

;Set Ada available as a companion
Alias_Ada.GetActorRef().SetAvailableToBeCompanion()
DLC01AdaRef.SetValue(DLC01RobotDefaultOff,1)
DLC01AdaRef.SetValue(DLC01PersonalityMode,1)
(DLC01AdaRef as Actor).AddToFaction(HasBeenCompanionFaction)
(DLC01AdaRef as Actor).RemoveFromFaction(DisallowedCompanionFaction)

;Move Ada to Sanctuary and make her a companion
DLC01AdaRef.MoveTo(CodsworthTalkMarker)
DLC01COMRobotCompanion.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Player lowered their weapon at the request of the Mechanist, so she can come out and talk.
; Rather than continue to talk, once the Mechanist is out and dialogue has begun, the player has
; immediately chosen the combat option, basically saying, "Never trust a stranger." before
; combat begins.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Player has chosen to continue down the dialgue route rather than a violence option.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Player has chosen two rude options in a row, basically accusing the Mechanist of being
; stupid and crazy.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
; Player chooses to let the Mechanist live after they've heard her story.
; They know she was trying to do good and she's not just some deluded crazy person.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
; Player chooses to kill the Mechanist after they've heard her story.
; They know she was trying to do good and she's not just some deluded crazy person.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Sets global that player knows Isabel's name.
DLC01PlayerKnowsIsabelsName.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

;Unlock M-SAT mod.
co_DLC01Bot_Misc_MQ05MSAT_Global.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetStage(700)
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

;Display RobCo Sales & Service map marker
Alias_DLC01LairMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Starts initial scene with the EyeBot when the player first enters the lair.

DLC01MQ05_650_EyebotScene01Entrance.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
;Triggers the second eyebot scene.
DLC01MQ05_660_EyebotScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
;Triggers the third and final eyebot scene
DLC01MQ05_670_EyebotScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
;This stage can be set after 685 is set if the player kills the Mechanist after sparing her life.
;Player killed the Mechanist. Set Global to 2.
DLC01MechanistFate.SetValue(2)

;Set stage on DLC01DialogueQuest and Radiant to clear Isabel and Sparks aliases so corpses clear
DLC01DialoguePostQuest.SetStage(50)
DLC01MQPostQuestRadiantParent.SetStage(50)

;Set global that checks to see if Ada is with the player to determine what scene she'll play.
If Alias_Ada.GetActorRef().IsInFaction(CurrentCompanionFaction)
   DLC01MQ05_PlayerKilledMechanistWithAda.SetValue(1)
EndIf

;Set quest to complete.
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0685_Item_00
Function Fragment_Stage_0685_Item_00()
;BEGIN CODE
;Player let Mechanist live. Set global to 1.
DLC01MechanistFate.SetValue(1)

;Set Mechanist to be Protected
Alias_Mechanist.GetActorRef().SetProtected(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
; turn off event handling on MQ00 - don't need to track workbenches any more
DLC01MQ00.RegisterForWorkshopEvents(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
SetObjectiveCompleted(725)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Mechanist comments if Sparks is dead. Triggered from DLC01Lair Stage 1498.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set by DLC01Lair when the player enters the spotlight trigger in the Facility Chamber.

;Force-start the MechanistInitialConfrontation scene. (She won't forcegreet through a window, so
;we have to do it this way).
DLC01MQ04_800_MechanistInitialConfrontation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN CODE
;Set by the MechanistInitialConfrontation scene, when the Mechanist says her name.
DLC01Lair.SetStage(1060)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN CODE
;Set by DLC01Lair, when the Blast Shield finishes coming down.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
;Set by the MechanistInitialConfrontation scene, when it ends.

;Make sure MechanistInitialConfrontation has stopped. (In case we need to abort it for some reason.)
DLC01MQ04_800_MechanistInitialConfrontation.Stop()

;Tells DLC01Lair to begin the boss battle.
DLC01Lair.SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN CODE
Alias_Mechanist.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Set by DLC01Lair after the first two phases of the battle have ended, and after the transition
;scene in which the Mechanist leaves the Control Center.
;
;EVP the Mechanist to trigger her forcegreet, which starts the MechanistMainConfrontation scene.
Alias_Mechanist.TryToEvaluatePackage()

;Once that scene has ended:
; - If the player decides to kill the Mechanist, or if they shoot her, or if they fail the dialogue in any
;other way that should trigger the fight, set DLC01Lair stage 1400. (See: DLC01MQ04 stage 885)
; - If the player decides to let the Mechanist live, set DLC01Lair stage 1501.  (See: DLC01MQ04
;stage 880)
;
;As part of Stage 1501, DLC01Lair swaps the Mechanist's name from 'The Mechanist' to 'Isabel Cruz'.
;If you want to do that earlier (as part of this scene, etc.), that's fine, set DLC01Lair stage 1510.
;
;Once DLC01Lair has finished the fight (if there is one) and run its cleanup, it sets
;stages 680 or 685 (whichever is appropriate), then stage 900.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0880_Item_00
Function Fragment_Stage_0880_Item_00()
;BEGIN CODE
;If the player decides to let the Mechanist live, notify DLC01Lair.
DLC01Lair.SetStage(1501)
; KMK - make Mechanist protected - seems like a good idea
Alias_Mechanist.GetActorRef().SetProtected(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0885_Item_00
Function Fragment_Stage_0885_Item_00()
;BEGIN CODE
;If the player decides to kill the Mechanist (or otherwise fails the dialogue), notify DLC01Lair and
;start the final fight against the Mechanist.
DLC01Lair.SetStage(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN CODE
;Abort and fail the MechanistMainConfrontation, forcing the Phase 3 combat.
; - DLC01Lair sets this stage if the player shoots the Mechanist or her eyebot.
; - Optionally, you can set this stage if you want.

;Stop the MechanistMainConfrontation scene, if it's running.
DLC01MQ04_850_MechanistMainConfrontation.Stop()

;The player has effectively decided to kill the Mechanist. Proceed to start the fight.
SetStage(885)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
;Only display this step if the player hasn't already used the password.
If GetStageDone(1000) == 0
   SetObjectiveDisplayed(900)
EndIf

;Don't set DLC01Lair stage 1501 here, since the Mechanist may not have lived.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

;Stop Mechanist Radio
DLC01MechanistRadio.SetStage(300)

; Set miscellaneous objective in DLC01DialogueQuest
DLC01DialoguePostQuest.SetStage(400)

; turn on Mechanist as radiant questgiver and set global for use in conditions.
If GetStageDone(680) == 0
   DLC01MQPostQuestRadiantsEnabledMechanist.SetValue(1)
   DLC01MQComplete.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; turn on Ada as radiant questgiver
DLC01MQPostQuestRadiantsEnabledAda.SetValue(1)

; Set Stage on DLC01DialoguePostQuest for Ada to offer radiants.
DLC01DialoguePostQuest.SetStage(20)

; set global for use in conditions etc.
DLC01MQComplete.SetValue(1)

;Unlock remaining robot mods.
co_DLC01Bot_Arm_Assaultron_Global.SetValue(1)
co_DLC01Bot_Arm_Protectron_Global.SetValue(1)
co_DLC01Bot_Arm_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Arm_Sentry_Global.SetValue(1)
co_DLC01Bot_Hand_LightningGun_Global.SetValue(1)
co_DLC01Bot_Head_Assaultron_Global.SetValue(1)
co_DLC01Bot_Head_Protectron_Global.SetValue(1)
co_DLC01Bot_Head_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Head_Sentry_Global.SetValue(1)
co_DLC01Bot_Legs_Assaultron_Global.SetValue(1)
co_DLC01Bot_Legs_Protectron_Global.SetValue(1)
co_DLC01Bot_Legs_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Legs_Sentry_Global.SetValue(1)
co_DLC01Bot_Torso_Assaultron_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Assaultron_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Assaultron_Global.SetValue(1)
co_DLC01Bot_Torso_MrHandy_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_MrHandy_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Protectron_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Protectron_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Protectron_Global.SetValue(1)
co_DLC01Bot_Torso_Robobrain_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Robobrain_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Torso_Sentry_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Sentry_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Sentry_Global.SetValue(1)

;Display message that all robot mods are unlocked.
DLC01BotModUnlockAllMessage.Show()

Game.AddAchievement(53)
Game.AddAchievement(54)

;Stop and complete quest
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_01
Function Fragment_Stage_1100_Item_01()
;BEGIN CODE
;Unlock remaining robot mods.
co_DLC01Bot_Arm_Assaultron_Global.SetValue(1)
co_DLC01Bot_Arm_Protectron_Global.SetValue(1)
co_DLC01Bot_Arm_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Arm_Sentry_Global.SetValue(1)
co_DLC01Bot_Hand_LightningGun_Global.SetValue(1)
co_DLC01Bot_Head_Assaultron_Global.SetValue(1)
co_DLC01Bot_Head_Protectron_Global.SetValue(1)
co_DLC01Bot_Head_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Head_Sentry_Global.SetValue(1)
co_DLC01Bot_Legs_Assaultron_Global.SetValue(1)
co_DLC01Bot_Legs_Protectron_Global.SetValue(1)
co_DLC01Bot_Legs_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Legs_Sentry_Global.SetValue(1)
co_DLC01Bot_Torso_Assaultron_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Assaultron_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Assaultron_Global.SetValue(1)
co_DLC01Bot_Torso_MrHandy_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_MrHandy_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Protectron_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Protectron_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Protectron_Global.SetValue(1)
co_DLC01Bot_Torso_Robobrain_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Robobrain_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_RoboBrain_Global.SetValue(1)
co_DLC01Bot_Torso_Sentry_Armor_Construction_Global.SetValue(1)
co_DLC01Bot_Torso_Sentry_Armor_Wasteland_Global.SetValue(1)
co_DLC01Bot_Torso_Sentry_Global.SetValue(1)

;Display message that all robot mods are unlocked.
DLC01BotModUnlockAllMessage.Show()

Game.AddAchievement(53)
Game.AddAchievement(54)

;Stop and complete quest
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC01Lair Auto Const Mandatory

ReferenceAlias Property Alias_Mechanist Auto Const Mandatory

ReferenceAlias Property Alias_Sparks Auto Const Mandatory

Scene Property DLC01MQ04_850_MechanistMainConfrontation Auto Const Mandatory

Scene Property DLC01MQ04_800_MechanistInitialConfrontation Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledAda Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledMechanist Auto Const Mandatory

GlobalVariable Property DLC01MQComplete Auto Const Mandatory

GlobalVariable Property DLC01MechanistFate Auto Const

Quest Property MQ102 Auto Const

Quest Property DialogueCodsworthPostWar Auto Const

ObjectReference Property CodsworthTalkMarker Auto Const

ReferenceAlias Property Alias_Ada Auto Const Mandatory

Quest Property Followers Auto Const

Quest Property COMCodsworth Auto Const

workshopscript Property SanctuaryWorkshopRef Auto Const Mandatory

LeveledItem Property DLC01MQ02RoboticsWorkbenchItems Auto Const

Quest Property DLC01MQ02 Auto Const

Quest Property DLC01MQ01 Auto Const

Scene Property DLC01MQ05_650_EyebotScene01Entrance Auto Const

Scene Property DLC01MQ05_660_EyebotScene02 Auto Const

Scene Property DLC01MQ05_670_EyebotScene03 Auto Const

ObjectReference Property CarlaAtSanctuaryHillsMarker Auto Const

Furniture Property WorkbenchRobot Auto Const

RefCollectionAlias Property Alias_WorkbenchRobots Auto Const

ReferenceAlias Property Alias_WorkbenchRobotQuickstart Auto Const Mandatory

Message Property DLC01MQ02RoboticsWorkbenchPH Auto Const

Quest Property DLC01MQ04 Auto Const

Quest Property DLC01DialoguePostQuest Auto Const

GlobalVariable Property co_DLC01Bot_Misc_MQ05MSAT_Global Auto Const

LeveledItem Property DLC01MQ05RobotMaterialItems Auto Const

GlobalVariable Property DLC01PlayerKnowsIsabelsName Auto Const

ActorValue Property DLC01RobotDefaultOff Auto Const Mandatory

ActorValue Property DLC01PersonalityMode Auto Const Mandatory

Faction Property HasBeenCompanionFaction Auto Const Mandatory

Faction Property DisallowedCompanionFaction Auto Const Mandatory

ObjectReference Property PDLC01AdaRef Auto Const Mandatory

ObjectReference Property DLC01AdaRef Auto Const Mandatory

Quest Property DLC01COMRobotCompanion Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Assaultron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Protectron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_RoboBrain_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Sentry_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Hand_LightningGun_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Head_Assaultron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Head_Protectron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Head_RoboBrain_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Head_Sentry_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Legs_Assaultron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Legs_Protectron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Legs_RoboBrain_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Legs_Sentry_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Assaultron_Armor_Construction_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Assaultron_Armor_Wasteland_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Assaultron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_MrHandy_Armor_Construction_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_MrHandy_Armor_Wasteland_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Protectron_Armor_Construction_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Protectron_Armor_Wasteland_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Protectron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Robobrain_Armor_Construction_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Robobrain_Armor_Wasteland_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_RoboBrain_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Sentry_Armor_Construction_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Sentry_Armor_Wasteland_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Torso_Sentry_Global Auto Const Mandatory

Message Property DLC01BotModUnlockAllMessage Auto Const Mandatory

Quest Property DLC01MechanistRadio Auto Const Mandatory

Quest Property DLC01MQPostQuestRadiantParent Auto Const Mandatory

ReferenceAlias Property Alias_DLC01LairMapMarker Auto Const Mandatory

DLC01:DLC01MQ00Script Property DLC01MQ00 Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory

GlobalVariable Property DLC01MQ05_PlayerKilledMechanistWithAda Auto Const Mandatory
