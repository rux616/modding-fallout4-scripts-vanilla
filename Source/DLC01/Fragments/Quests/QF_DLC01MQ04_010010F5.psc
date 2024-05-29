;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ04_010010F5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Complete Codsworth's initial post war dialogue
DialogueCodsworthPostWar.SetStage(10)
DialogueCodsworthPostWar.SetStage(35)
DialogueCodsworthPostWar.SetStage(40)
DialogueCodsworthPostWar.SetStage(200)
DialogueCodsworthPostWar.SetStage(250)

;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set Codsworth available as a companion.
Alias_Codsworth.GetActorRef().SetAvailableToBeCompanion()

;Set Sanctuary workshop to be owned by player and give items.
(SanctuaryWorkshopRef as WorkshopScript).SetOwnedByPlayer(True)
SanctuaryWorkshopRef.AddItem(DLC01MQ02RoboticsWorkbenchItems)

;Set stage of the quest to officially start it and give first objective.
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Complete Codsworth's initial post war dialogue
DialogueCodsworthPostWar.SetStage(10)
DialogueCodsworthPostWar.SetStage(35)
DialogueCodsworthPostWar.SetStage(40)
DialogueCodsworthPostWar.SetStage(200)
DialogueCodsworthPostWar.SetStage(250)

;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set Codsworth available as a companion
Alias_Codsworth.GetActorRef().SetAvailableToBeCompanion()

;Sets Codsworth as a follower
Followers.SetStage(50)

;Set stage of the quest to officially start it and give first objective.
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Complete Codsworth's initial post war dialogue
DialogueCodsworthPostWar.SetStage(10)
DialogueCodsworthPostWar.SetStage(35)
DialogueCodsworthPostWar.SetStage(40)
DialogueCodsworthPostWar.SetStage(200)
DialogueCodsworthPostWar.SetStage(250)

;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set Codsworth to Hatred
COMCodsworth.SetStage(120)

;Set stage of the quest to officially start it and give first objective.
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(500)
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

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Starts initial scene with the EyeBot when the player first enters the lair.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
;Triggers second scene with Eyebot when they reach the center room?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
;Triggers a third scene with robot when first wing is compeleted.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0665_Item_00
Function Fragment_Stage_0665_Item_00()
;BEGIN CODE
; Triggers a fourth scene with the Eyebot when the second wing is completed.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
;Triggers a fifth scene with an EyeBot when the third wing is completed.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
;Player killed the Mechanist. Set Global to 2.
DLC01MechanistFate.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0685_Item_00
Function Fragment_Stage_0685_Item_00()
;BEGIN CODE
;Player let Mechanist live. Set global to 1.
DLC01MechanistFate.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
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

;Tells the dungeon quest to put a spotlight on her for dramatic effect.
DLC01Lair.SetStage(1060)
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

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

; set global for use in conditions etc.
DLC01MQComplete.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
; turn on Codsworth as radiant questgiver
DLC01MQPostQuestRadiantsEnabledCodsworth.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_02
Function Fragment_Stage_1000_Item_02()
;BEGIN CODE
; turn on Codsworth as radiant questgiver
DLC01MQPostQuestRadiantsEnabledMechanist.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC01Lair Auto Const Mandatory

ReferenceAlias Property Alias_Mechanist Auto Const Mandatory

ReferenceAlias Property Alias_Sparks Auto Const Mandatory

Scene Property DLC01MQ04_850_MechanistMainConfrontation Auto Const Mandatory

Scene Property DLC01MQ04_800_MechanistInitialConfrontation Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledCodsworth Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledMechanist Auto Const Mandatory

GlobalVariable Property DLC01MQComplete Auto Const Mandatory

GlobalVariable Property DLC01MechanistFate Auto Const

Quest Property MQ102 Auto Const

Quest Property DialogueCodsworthPostWar Auto Const

ObjectReference Property CodsworthTalkMarker Auto Const

ReferenceAlias Property Alias_Codsworth Auto Const Mandatory

Quest Property Followers Auto Const

Quest Property COMCodsworth Auto Const

workshopscript Property SanctuaryWorkshopRef Auto Const Mandatory

LeveledItem Property DLC01MQ02RoboticsWorkbenchItems Auto Const
