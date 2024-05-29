;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ01_01000801 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Complete stages for DLC04MQ00
DLC04MQ00.SetStage(100)
DLC04MQ00.SetStage(200)
DLC04MQ00.SetStage(300)
DLC04MQ00.SetStage(400)
DLC04MQ00.SetStage(500)
DLC04MQ00.SetStage(1000)

;Move player to Nuka-World
Game.GetPlayer().MoveTo(DLC04MQ01StartRef)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Complete stages for DLC04MQ00
DLC04MQ00.SetStage(100)
DLC04MQ00.SetStage(200)
DLC04MQ00.SetStage(300)
DLC04MQ00.SetStage(350)
DLC04MQ00.SetStage(400)
DLC04MQ00.SetStage(500)
DLC04MQ00.SetStage(1000)

;Uses DLC04MQ01Gauntlet's Quickstart.
DLC04MQ01Gauntlet.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Complete stages for DLC04MQ00
DLC04MQ00.SetStage(100)
DLC04MQ00.SetStage(200)
DLC04MQ00.SetStage(300)
DLC04MQ00.SetStage(350)
DLC04MQ00.SetStage(400)
DLC04MQ00.SetStage(500)
DLC04MQ00.SetStage(1000)

;Uses DLC04MQ01Gauntlet's Quickstart.
DLC04MQ01Gauntlet.SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Complete stages for DLC04MQ00
DLC04MQ00.SetStage(100)
DLC04MQ00.SetStage(200)
DLC04MQ00.SetStage(300)
DLC04MQ00.SetStage(350)
DLC04MQ00.SetStage(400)
DLC04MQ00.SetStage(500)
DLC04MQ00.SetStage(1000)

;Uses DLC04MQ01Gauntlet's Quickstart.
DLC04MQ01Gauntlet.SetStage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Stage is set by DLC04MQ00 stage 520. 

;Start the Gauntlet level quest.
DLC04MQ01Gauntlet.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Player moved through activator DLC04MQ01SetStage100Ref in Wilderness cell (5, -3).

;Start Gage's interrupt scene and stop generic Monorail scene on DLC04MasterQuest

DLC04Monorail_EnteringNukaStation.Stop()
DLC04MQ01_010_PANukaExpressIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set in DLC04MQ00 Stage 1000.
SetObjectiveDisplayed(200)

DLC04MQ01_010_PAIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0206_Item_00
Function Fragment_Stage_0206_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0207_Item_00
Function Fragment_Stage_0207_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0209_Item_00
Function Fragment_Stage_0209_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Play scene based on stages 208 or 209.
DLC04MQ01_PAGauntletInterior.Start()

;Disable first run monorail clouds now that player is in an interior.
DLC04MQ00EnableDisableCloudsRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0217_Item_00
Function Fragment_Stage_0217_Item_00()
;BEGIN CODE
;Play scene based on 216 being set.
DLC04MQ01_PAGauntletInterior.Stop()
Utility.Wait(2)
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0218_Item_00
Function Fragment_Stage_0218_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletExterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0219_Item_00
Function Fragment_Stage_0219_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletExterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
;Play Scene.
DLC04MQ01_PAColaCars.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0222_Item_00
Function Fragment_Stage_0222_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0223_Item_00
Function Fragment_Stage_0223_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0224_Item_00
Function Fragment_Stage_0224_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletNukaStation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0226_Item_00
Function Fragment_Stage_0226_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0227_Item_00
Function Fragment_Stage_0227_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0228_Item_00
Function Fragment_Stage_0228_Item_00()
;BEGIN CODE
;Play scene.
DLC04MQ01_PAGauntletInterior.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 1110, when the player hits the Overlook trigger.

;Start the Overboss/Gage scene.
DLC04MQ01_OverbossInitialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0289_Item_00
Function Fragment_Stage_0289_Item_00()
;BEGIN CODE
;Set when DLC04MQ01_OverbossInitialScene, the Overboss/Gage scene, ends.

;Gage is sent off to disable the fire alarm. Start the scene for that.
DLC04MQ01_GageDisableFireAlarm.Start()

;DLC04MQ01Gauntlet: Enable a trigger on the Overlook. If the player goes up there (or is still
;up there), the Overboss will address them.
DLC04MQ01Gauntlet.SetStage(1119)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 1130, when the player enters a trigger
;on the Overlook (or if they're still standing there).

;FOR CORRIE:
;Should this be a Forcegreet? A full player dialogue? With or without responses? Is the player
;addressing the Raider Overboss or the intercom? Is the audio coming from the Raider Overboss
;or from the intercom?
DLC04MQ01_OverbossInitialGreet.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN CODE
;Set by the DLC04MQ01_GageDisableFireAlarm scene, when Gage uses the terminal.
;Also set automatically by Stage 300, just to make sure it gets set.

;DLC04MQ01Gauntlet: Turn off the Fire Alarm lights and sfx.
DLC04MQ01Gauntlet.SetStage(1130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set at the end of DLC04MQ01_OverbossInitialGreet.

;Update Objective
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

;Make sure the Fire Alarm got turned off.
SetStage(295)

;DLC04MQ01Gauntlet: Open the door to the Locker Room area.
DLC04MQ01Gauntlet.SetStage(1190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 1200, when the player approaches the Locker Room.

;Start the Locker Room PA scene (which Gage later interrupts).
DLC04MQ01_LockerRoomPAInitial.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 1210, when the player hits a trigger in the locker room.

;Interrupt the Locker Room PA scene, wherever it was, with Gage's dialogue.
DLC04MQ01_LockerRoomPAGage_PreGun.Start()

;Just calling Stop() on the old scene won't cut off the audio; you actually have to disable it.
Alias_DLC04RedEyeGauntletLockerRoom_XMarker.GetReference().Disable()
DLC04MQ01_LockerRoomPAInitial.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set by DLC04MQ01_LockerRoomPAGage_PreGun, Gage's Pre-Gun Scene, once he starts speaking.

;FOR CORRIE: I wasn't sure where to put this. Thoughts?

;Update Objective
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Stops Gage's looping scene to get the player's attention.
DLC04MQ01_LockerRoomPAGage_PreGun.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set by DLC04MQ01_LockerRoomPAGage_PreGun, at the end of Gage's Pre-Gun Scene.

;Update Objective
If DLC04MQ01Gauntlet.GetStageDone(1250) == 0
   SetObjectiveCompleted(400)
   SetObjectiveDisplayed(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet when the player takes the Thirst Zapper.

;Update Objective
;Player is on the step to take the gun
If IsObjectiveDisplayed(500) == 1
   SetObjectiveCompleted(500)
   SetObjectiveDisplayed(550)
EndIf

;Play Gage's response scene.
;
;FOR CORRIE: I really don't think we should do it this way; this feels really gamey.
;Suggest having the player go back to the intercom and tell Gage they got it. Funny reaction moment?
;DLC04MQ01_LockerRoomPAGage_PreGun.Stop()
;DLC04MQ01_LockerRoomPAGage_Generator.Stop()
;DLC04MQ01_LockerRoomPAGage_PostGun.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 1261 when the player returns to the Locker Room after
;disabling the Generator. Gage comments on the disable, if he isn't playing a higher-priority scene.

if (!DLC04MQ01_LockerRoomPAGage_PreGun.IsPlaying() && !DLC04MQ01_LockerRoomPAGage_PostGun.IsPlaying())
     DLC04MQ01_LockerRoomPAGage_Generator.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set by DLC04MQ01_LockerRoomPAGage_PostGun, Gage's Post-Gun Scene, once he
;finishes speaking.

;Update Objective
SetObjectiveCompleted(400)
SetObjectiveCompleted(550)
SetObjectiveDisplayed(600)

;DLC04MQ01Gauntlet: Open the doors out to the Arena entrance.
DLC04MQ01Gauntlet.SetStage(1290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 1400, when the player steps out into the Arena entrance area.

;Stop any other scenes that might still be running, then start the Overboss' Pre-Fight Scene.
DLC04MQ01_GageLockerRoomPreGun.Stop()
DLC04MQ01_GageLockerRoomGeneratorPowerdown.Stop()
DLC04MQ01_GageLockerRoomPostGun.Stop()
DLC04MQ01_OverbossPreFightSpeech.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Set near the end of DLC04MQ01_OverbossPreFightSpeech, the Overboss' Pre-Fight Speech.

;Set Gage essential so player can't accidentally kill him during the fight.
Alias_DLC04Gage.GetActorRef().SetGhost(True)

;Update Objective
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

;DLC04MQ01Gauntlet: Open the door. The combat begins when the player steps out.
DLC04MQ01Gauntlet.SetStage(1500)

;Toggle Kickout
DLC04RaiderKickout.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;Redeye announces the start of the fight.
if (!GetStageDone(690))
     DLC04MQ01_700_PAFightBegin.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0749_Item_00
Function Fragment_Stage_0749_Item_00()
;BEGIN CODE
;DLC04MQ01Gauntlet: Dismiss the Crowd
DLC04MQ01Gauntlet.SetStage(2010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set by DLC04MQ01Gauntlet stage 2000, when the Overboss has been killed.

;Update Objective
SetObjectiveCompleted(200)
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

;Start Gage's Post-Fight Address to the Raiders.
DLC04MQ01_GagePostFightAddress.Start()
Alias_DLC04Gage.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
;Set when DLC04MQ01_GagePostFightAddress, Gage's post-fight address, ends.

SetStage(749)
Alias_DLC04Gage.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN CODE
;Stops the dialogue camera when Gage walks away to open the door.
Game.StopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
;Set when Gage unlocks the arena exit door in DLC04MQ01_GagePostFightDialogue.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

;DLC04MQ01Gauntlet: Open the doors.
DLC04MQ01Gauntlet.SetStage(2020)

;Shut down the Gauntlet quest and unlock fast-travel.
DLC04MQ01Gauntlet.SetStage(2500)


;Remove ghosting on Gage.
Alias_DLC04Gage.GetActorRef().SetGhost(False)

;Complete Objectives
CompleteAllObjectives()

;Grant Achievement
Game.AddAchievement(81)

DLC04DialogueHarvey.SetStage(10)
DLC04MQ02.SetStage(1)

;Add player to Gang factions and vice versa.
Game.GetPlayer().AddToFaction(DLC04GangDisciplesFaction)
Game.GetPlayer().AddToFaction(DLC04GangOperatorsFaction)
Game.GetPlayer().AddToFaction(DLC04GangPackFaction)
Game.GetPlayer().AddToFaction(DLC04GangOperatorsLizziePlayerOwnershipFaction)

DLC04GangDisciplesFaction.SetAlly(PlayerFaction, True, True)
DLC04GangOperatorsFaction.SetAlly(PlayerFaction, True, True)
DLC04GangPackFaction.SetAlly(PlayerFaction, True, True)

;Now make the Commonwealth Raider gang enemies of the Minutemen and Brotherhood and vice versa.
MinutemenFaction.SetEnemy(DLC04CommonwealthRaiderFaction)
BrotherhoodofSteelFaction.SetEnemy(DLC04CommonwealthRaiderFaction)
DLC04CommonwealthRaiderFaction.SetEnemy(MinutemenFaction)
DLC04CommonwealthRaiderFaction.SetEnemy(BrotherhoodofSteelFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;This is set up as a precautionary stage. 
;Player has killed a named Raider in Nuka-World and is now an enemy of the Raiders there.

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04MQ01_010_PANukaExpressIntro Auto Const Mandatory

Scene Property DLC04MQ01_010_PAIntro Auto Const Mandatory

Scene Property DLC04MQ01_PAGauntletNukaStation Auto Const Mandatory

Scene Property DLC04MQ01_PAGauntletInterior Auto Const Mandatory

Scene Property DLC04MQ01_PAGauntletExterior Auto Const Mandatory

Scene Property DLC04MQ01_PAColaCars Auto Const Mandatory

Scene Property DLC04MQ01_OverbossPreFightSpeech Auto Const Mandatory

Scene Property DLC04MQ01_GageLockerRoomGeneratorPowerdown Auto Const Mandatory

Scene Property DLC04MQ01_OverbossInitialScene Auto Const Mandatory

Scene Property DLC04MQ01_OverbossInitialGreet Auto Const Mandatory

Scene Property DLC04MQ01_LockerRoomRadioInitial Auto Const Mandatory

Scene Property DLC04MQ01_GageLockerRoomPreGun Auto Const Mandatory

Scene Property DLC04MQ01_GageLockerRoomPostGun Auto Const Mandatory

Scene Property DLC04MQ01_GagePostFightSpeech Auto Const Mandatory

Scene Property DLC04MQ01_GagePostFightAddress Auto Const Mandatory

Scene Property DLC04MQ01_GagePostFightDialogue Auto Const Mandatory

Scene Property DLC04MQ01_LockerRoomPAInitial Auto Const Mandatory

Scene Property DLC04MQ01_LockerRoomPAGage_PreGun Auto Const Mandatory

Scene Property DLC04MQ01_LockerRoomPAGage_PostGun Auto Const Mandatory

Scene Property DLC04MQ01_LockerRoomPAGage_Generator Auto Const Mandatory

Scene Property DLC04MQ01_GageDisableFireAlarm Auto Const Mandatory

ReferenceAlias Property Alias_DLC04RedEyeGauntletLockerRoom_XMarker Auto Const Mandatory

ReferenceAlias Property Alias_DLC04Gage Auto Const Mandatory

Quest Property DLC04MQ00 Auto Const Mandatory

Quest Property DLC04MQ01Gauntlet Auto Const Mandatory

Quest Property DLC04RaiderKickout Auto Const Mandatory

Quest Property DLC04MQ02 Auto Const Mandatory

Quest Property DLC04DialogueHarvey Auto Const Mandatory

Faction Property DLC04GangDisciplesFaction Auto Const Mandatory

Faction Property DLC04GangOperatorsFaction Auto Const Mandatory

Faction Property DLC04GangPackFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property MinutemenFaction Auto Const Mandatory

Faction Property DLC04GangMinutemenEnemyFaction Auto Const Mandatory

Faction Property BrotherhoodofSteelFaction Auto Const Mandatory

ObjectReference Property DLC04MQ01StartRef Auto Const Mandatory

Scene Property DLC04MQ01_700_PAFightBegin Auto Const Mandatory

Scene Property DLC04MQ01_700_PAPlayerDied Auto Const Mandatory

Scene Property DLC04Monorail_EnteringNukaStation Auto Const Mandatory

Faction Property DLC04GangOperatorsLizziePlayerOwnershipFaction Auto Const Mandatory

ObjectReference Property DLC04MQ00EnableDisableCloudsRef Auto Const Mandatory

Faction Property DLC04CommonwealthRaiderFaction Auto Const Mandatory
