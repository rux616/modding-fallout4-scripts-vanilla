;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ00_01000800 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ00QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ00QuestScript kmyQuest = __temp as DLC04:DLC04MQ00QuestScript
;END AUTOCAST
;BEGIN CODE
;Stage 10 set when quest starts ("Run on Start?" is checked).

;Have quest script register for OnLocationChange to officially start quest.
kmyQuest.Startup()

;Set Harvey as restrained so he stays in furniture.
Alias_Harvey.GetActorRef().SetRestrained()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ00QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ00QuestScript kmyQuest = __temp as DLC04:DLC04MQ00QuestScript
;END AUTOCAST
;BEGIN CODE
;Stage 15 set by DLC04MQ00QuestScript, currently when player hits level 30.

;Turn on Radio quest and set stage to pop first objective.
DLC04MQ00Radio.SetStage(10)
SetStage(100)
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

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
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

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;Companion Affinity.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Stage 100 set by Stage 15.

SetObjectiveDisplayed(100) ;Listen to the Nuka-Cola Family Radio
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Stage 200 set by Scene DLC04MQ00RadioScene in Quest DLC04MQ00Radio.

SetObjectiveCompleted(100) ;Listen to the Nuka-Cola Family Radio

;Odd chance that player may have tuned in late and already spoken to Harvey.
If GetStageDone(300) == 0
   SetObjectiveDisplayed(200) ;Travel to the Nuka-World Transit Station
EndIf

;Display map marker.
Alias_NukaExpressStationMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Stage 300 set by player entering trigger volume DLC04MQ00SetStage300Ref 
;placed in DLC04TransitCenter01.

SetObjectiveDisplayed(300) ;Speak to Harvey

;Check what stages are done to properly handle objectives.
If GetStageDone(200) == 0
   SetObjectiveDisplayed(100, False) ;Listen to the Nuka-Cola Family Radio
Else
   SetObjectiveCompleted(200) ;Travel to the Nuka-Express Transit Station
EndIf

;Start Harvey's attention getting scene.
DLC04MQ00_300_HarveyCallOut.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
;Stage 305 set by Scene DLC04MQ00_300_HarveyIntro, Phase 1.

;Stop Harvey's looping scene.
DLC04MQ00_300_HarveyCallOut.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 8 (WalkAway).
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 3.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 6.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyHeal, Phase 2.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyHeal, Phase 1.
;Stops dialogue camera while Harvey gets up because it looks awkward otherwise.
Game.StopDialogueCamera()

;Remove restrained on Harvey
Alias_Harvey.GetActorRef().SetRestrained(False)

;Stop Harvey's looping scene
SetStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 3.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 6.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0347_Item_00
Function Fragment_Stage_0347_Item_00()
;BEGIN CODE
; Stop Harvey's looping scene.
DLC04MQ00_300_HarveyCallOut.Stop()

; Make Harvey an enemy and start combat.
Alias_Harvey.GetActorRef().RemoveFromFaction(CaptiveFaction)
DLC04HarveyHostileFaction.SetEnemy(PlayerFaction)
Alias_Harvey.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 7.
;Give player the control terminal password. Password is intentionally not on Harvey up until now.
Game.GetPlayer().AddItem(DLC04MQ00ControlTerminalPassword, 1)

;Turn off looping scene
SetStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 6.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;Set by Stage 810 if player kills Harvey.

SetObjectiveDisplayed(360) ;Retrieve Control Terminal Password
If IsObjectiveDisplayed(200) ;Travel to the Nuka-Express Transit Station
   SetObjectiveCompleted(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 7.

SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_01
Function Fragment_Stage_0400_Item_01()
;BEGIN CODE
;Set in scene DLC04MQ00_300_HarveyIntro, Phase 7.

SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_02
Function Fragment_Stage_0400_Item_02()
;BEGIN CODE
;Set by script on DLC04MQ00ControlTerminalPassword.

If IsObjectiveDisplayed(360) == 1 ;Retrieve the Control Terminal Password
   SetObjectiveCompleted(200) ;Travel to the Nuka-Express Transit Station
   SetObjectiveCompleted(360) ;Retrieve the Control Terminal Password
   SetObjectiveDisplayed(400) ; Restore Power to the Nuka-Express
Else
   SetObjectiveDisplayed(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set by script fragment on the terminal DLC04MQ00ControlTerminal.

;Restore power to the Monorail.
Debug.Trace("Calling PowerUpMonorail on " + DLC04_MonorailTransitCenter)
DLC04_MonorailTransitCenter.PowerUpMonorailNoWait()

;Update objectives.
If IsObjectiveDisplayed(400) && IsObjectiveCompleted(400) == 0
   SetObjectiveCompleted(400)
   SetObjectiveDisplayed(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
;Restore power to the Monorail.
Debug.Trace("Calling PowerUpMonorail on " + DLC04_MonorailTransitCenter)
DLC04_MonorailTransitCenter.PowerUpMonorailNoWait()

If IsObjectiveDisplayed(400) == 1 && IsObjectiveCompleted(400) == 0 ; Restore Power To Nuka-Express
   SetObjectiveCompleted(400)
   SetObjectiveDisplayed(500)
EndIf

Alias_NukaExpressConsole.GetRef().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
;Set by scene DLC04MQ00_500_HarveyFollowUp, Phase 2.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Set by script DLC04MQ00QuestScript on Scripts tab of the quest.

;Turn of the radio.
DLC04MQ00Radio.SetStage(100)

;Set stage in DLC04MQ01 to start PA.
DLC04MQ01.SetStage(10)

;Enable clouds just for this first ride.
DLC04MQ00EnableDisableCloudsRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set by default script on Harvey alias.
;Player killed Harvey (or some outside force). Start intercom scene.
DLC04MQ00_800_Gage.Start()

;Add password to Harvey's corpse if he hasn't given it to the player
If GetStageDone(350) == 0
   Alias_Harvey.GetRef().AddItem(DLC04MQ00ControlTerminalPassword, 1)
EndIf

;Set proper companion affinity stage and shut down DLC04DialogueHarvey.
If GetStageDone(335) == 0
   SetStage(40)
Else
   SetStage(41)
EndIf

DLC04DialogueHarvey.SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
;Set by scene DLC04MQ00_800_Gage, Phase 4.

;Player killed Harvey. Set appropriate stages.
If IsObjectiveDisplayed(100) == 1 && IsObjectiveCompleted(100) == 0 ;Listen to the Nuka-Cola Family Radio
   SetObjectiveDisplayed(100, False)
EndIf

If IsObjectiveDisplayed(200) == 1 ;Travel to the Nuka-Express Transit Station
   SetObjectiveCompleted(200) 
EndIf

If IsObjectiveDisplayed(300) == 1 ;Speak to Harvey
   SetObjectiveFailed(300)
EndIf

If (Game.GetPlayer().GetItemCount(DLC04MQ00ControlTerminalPassword) == 0)
   SetStage(360)
ElseIf GetStageDone(500) == 0
   SetStage(400)
Else
   SetObjectiveDisplayed(500)
EndIf

;If player has turned on auxillary power, start up announcements.
If DLC04MQ00TransitCenter.GetStageDone(30) == True
   DLC04TransitCenterAnnouncements.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
;Harvey was attacked, so instantly kill him. This is because he's restrained and we don't
;want him being shot and not being able to react to it.


Alias_Harvey.GetActorRef().Kill(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set by trigger box in DLC04NukaStationExt, DLC04MQ00SetStage1000Ref.

If IsObjectiveDisplayed(500) == 1
   SetObjectiveCompleted(500) 
EndIf

If IsObjectiveDisplayed(100) && IsObjectiveCompleted(100) == 0
   SetObjectiveDisplayed(100, False)
EndIf

If IsObjectiveDisplayed(300) && IsObjectiveCompleted(300) == 0
   SetObjectiveDisplayed(300, False)
EndIf

;Set stage 200 in the next quest to "officially" start quest from player perspective.
DLC04MQ01.SetStage(200)

;Remove restrained on Harvey if it hasn't already been done.
Alias_Harvey.GetActorRef().SetRestrained(False)

;Stop DLC04MQ00Gunners so the Gunners' corpses can be cleaned up normally.
DLC04MQ00Gunners.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;This is set up as a precautionary stage. 
;Player has killed a named Raider in Nuka-World and is now an enemy of the Raiders there.

;Stop DLC04MQ00Gunners so the Gunners' corpses can be cleaned up normally.
DLC04MQ00Gunners.Stop()

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ00Radio Auto Const Mandatory

Scene Property DLC04MQ00_300_HarveyCallOut Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

ReferenceAlias Property Alias_NukaExpressConsole Auto Const Mandatory

ReferenceAlias Property Alias_PowerGeneratorPH Auto Const Mandatory

ReferenceAlias Property Alias_NukaExpressStationMapMarker Auto Const Mandatory

Key Property DLC04MQ00ControlTerminalPassword Auto Const Mandatory

ObjectReference Property DLC04MQ00MoveToMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_Harvey Auto Const Mandatory

Scene Property DLC04MQ00_800_Gage Auto Const Mandatory

Quest Property DLC04MQ00Gunners Auto Const Mandatory

Location Property DLC04TransitCenterLocation Auto Const Mandatory

ObjectReference Property DLC04MQ00HarveyHighlightingEnableMarker Auto Const Mandatory

DLC04:DLC04_MonorailScript Property DLC04_MonorailTransitCenter Auto Const Mandatory

ReferenceAlias Property Alias_ControlTerminalPassword Auto Const Mandatory

Quest Property DLC04DialogueHarvey Auto Const Mandatory

Quest Property DLC04MQ00TransitCenter Auto Const Mandatory

Quest Property DLC04TransitCenterAnnouncements Auto Const Mandatory

Faction Property DLC04HarveyHostileFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ObjectReference Property DLC04MQ00EnableDisableCloudsRef Auto Const Mandatory

MusicType Property MUSRevealShort Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory
