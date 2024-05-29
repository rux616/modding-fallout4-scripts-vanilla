;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06_01001B44 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Bypass intro to Nucleus
DLC03CoA_DialogueNucleusEntrance.SetStage(3)
DLC03AtomM01.SetStage(100)
DLC03AtomM01.SetStage(150)
DLC03CoA_DialogueNucleus.SetStage(60)
DLC03CoA_DialogueNucleusSermon.SetStage(100)

;Bypass intro to Far Harbor
DLC03MQ02.SetStage(700)

Utility.Wait(2.0)

;Game.GetPlayer().MoveTo(DebugMarker)
DLC03MQ06_NukeHandling.SetStage(5)
DLC03MQ06_WindFarmHandling.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Bypass intro to Nucleus
DLC03CoA_DialogueNucleusEntrance.SetStage(3)
DLC03AtomM01.SetStage(100)
DLC03AtomM01.SetStage(150)
DLC03CoA_DialogueNucleus.SetStage(60)
DLC03CoA_DialogueNucleusSermon.SetStage(100)

;Bypass intro to Far Harbor
DLC03MQ02.SetStage(700)

Utility.Wait(2.0)

;Game.GetPlayer().MoveTo(DebugMarker)
DLC03MQ06_WindFarmHandling.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Bypass intro to Nucleus
DLC03CoA_DialogueNucleusEntrance.SetStage(3)
DLC03AtomM01.SetStage(100)
DLC03AtomM01.SetStage(150)
DLC03CoA_DialogueNucleus.SetStage(60)
DLC03CoA_DialogueNucleusSermon.SetStage(100)

;Bypass intro to Far Harbor
DLC03MQ02.SetStage(700)

Utility.Wait(2.0)

;Game.GetPlayer().MoveTo(DebugMarker)
DLC03MQ06_NukeHandling.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;if Sermon hasn't finished, shut it down now
if !DLC03CoA_DialogueNucleusSermon.GetStageDone(100)
  DLC03CoA_DialogueNucleusSermon.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(450)

;If DiMA isn't dead and none of the quests that make him unavailable have gone critical, throw the obj
if !Alias_DiMA.GetActorRef().IsDead() && DLC03MQ06_DiMAUnavailable.GetValue() == 0
  SetObjectiveDisplayed(460)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if !GetStageDone(10)
  SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;If wind farm hasn't been brought down, update objectives
if !GetStageDone(500)
  Utility.WaitMenuMode(4.0)

  SetObjectiveCompleted(10)

  if !GetStageDone(130)
    SetObjectiveDisplayed(120)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(150)

;If DiMA isn't dead and none of the quests that make him unavailable have gone critical, throw the obj
if !Alias_DiMA.GetActorRef().IsDead() && DLC03MQ06_DiMAUnavailable.GetValue() == 0
  SetObjectiveDisplayed(160)
endif

;Send player to speak to High Confessor if he's alive, hasn't been replaced and
;the player hasn't gotten booted from CoA 
if DLC03CoA_PlayerKickedOutofCoA.GetValue() == 0 && !Alias_HighConfessor.GetActorRef().IsDead() && !DLC03MQ06a.GetStageDone(50)
  SetObjectiveDisplayed(151)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveFailed(150)
SetObjectiveCompleted(151)

Game.GetPlayer().RemoveItem(Alias_NucleusCodes.GetRef())

Utility.Wait(8.0)
SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_02
Function Fragment_Stage_0195_Item_02()
;BEGIN CODE
if GetStageDone(20)
  if IsObjectiveDisplayed(450)
    SetObjectiveDisplayed(450, true, true)
  endif
elseif !DLC03MQ06_WindFarmHandling.GetStageDone(2)
  SetObjectiveDisplayed(195)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0197_Item_00
Function Fragment_Stage_0197_Item_00()
;BEGIN CODE
;Close out "Find a way to eliminate Far Harbor" obj
SetObjectiveCompleted(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set global
DLC03MQ06_TektusConvincedofDivision.SetValue(1)

SetObjectiveCompleted(151)
SetObjectiveDisplayed(150, true, true)

Alias_HighConfessor.GetActorRef().EvaluatePackage()

if DLC03MQ06a.IsRunning()
  DLC03MQ06a.SetStage(785)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20, false, false)
SetObjectiveDisplayed(160, false, false)
SetObjectiveDisplayed(195, false, false)
SetObjectiveDisplayed(450, false, false)
SetObjectiveDisplayed(460, false, false)
SetObjectiveDisplayed(470, false, false)
SetObjectiveCompleted(150)

;Fail "Speak to High Confessor" obj if it hasn't been turned off
if !GetStageDone(200) && !GetStageDone(249)
  SetObjectiveFailed(151)
  SetObjectiveFailed(500)
endif

SetObjectiveDisplayed(210)

;Play Confessor's scene if he's been convinced
if GetStageDone(200) && !GetStageDone(249)
  DLC03MQ06_HC_ItIsTime.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0249_Item_00
Function Fragment_Stage_0249_Item_00()
;BEGIN CODE
;Fail "Speak to High Confessor" obj
SetObjectiveFailed(151)
SetObjectiveFailed(500)

;If player has already brought down the wind farm, shut the quest down now
if GetStageDone(500)
  SetStage(540)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ06Script
Quest __temp = self as Quest
DLC03:DLC03MQ06Script kmyQuest = __temp as DLC03:DLC03MQ06Script
;END AUTOCAST
;BEGIN CODE
;Kill the MQ06 objectives in MQ04 if they haven't already been killed
DLC03MQ04.SetStage(270)
DLC03MQ04.SetStage(370)

CompleteAllObjectives()

;Fire achievement
Game.AddAchievement(62)

kmyquest.StartNukeVictoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(DLC03_FarHarborSurvivalistPerk)
DLC03MQ06_FarHarborSurvivalistMsg.Show()

;Close out quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
SetObjectiveCompleted(460)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
if !DLC03MQ06_WindFarmBuildingQuest.GetStageDone(10)
  SetStage(470)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(470)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
SetObjectiveCompleted(470)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_02
Function Fragment_Stage_0500_Item_02()
;BEGIN CODE
if !GetStageDone(250)
  SetObjectiveCompleted(450)

  ;Turn off any remaining "Nuke" objectives
  SetObjectiveDisplayed(10, false)
  SetObjectiveDisplayed(120, false)
  SetObjectiveDisplayed(130, false)
  SetObjectiveDisplayed(150, false)
  SetObjectiveDisplayed(151, false)
  SetObjectiveDisplayed(160, false)
  SetObjectiveDisplayed(460, false)
  SetObjectiveDisplayed(210, false)

  ;Kill the MQ06 objectives in MQ04 if they haven't already been killed
  DLC03MQ04.SetStage(270)
  DLC03MQ04.SetStage(370)

  ;Direct player to speak to High Confessor if he's alive, hasn't been attacked
  ;and player hasn't been kicked from CoA
  if !Alias_HighConfessor.GetActorRef().IsDead() && DLC03CoA_PlayerKickedOutofCoA.GetValue() == 0 && !DLC03MQ06a.GetStageDone(95) && !DLC03MQ06a.GetStageDone(255)
     SetObjectiveDisplayed(500)
  else
    ;If any of those things have happened, complete the quest now
    SetStage(535)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
DLC03_CustomItemQuest.SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
;If player has completed FFNuc02 to the High Confessor's liking, grant the right title
;1 = Crusader, 2 = Inquisitor
if DLC03_FFNucleus02_InquistorTitleAvailable.GetValue() == 1
  DLC03CoA_PlayerTitle.SetValue(2)
else
  DLC03CoA_PlayerTitle.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
;Close out objectives
SetObjectiveCompleted(500)

CompleteAllObjectives()

;If player hasn't gotten reward, give it now
if !GetStageDone(520)
  SetStage(520)
endif

;If player hasn't gotten title, give it now
if  DLC03CoA_PlayerTitle.GetValue() == 0
  if DLC03_FFNucleus02_InquistorTitleAvailable.GetValue() == 1
    DLC03CoA_PlayerTitle.SetValue(2)
  else
    DLC03CoA_PlayerTitle.SetValue(1)
  endif
endif

;Start High Confessor's victory sermon
DLC03CoA_DialogueNucleusVictorySermon.Start()

;Figure out which perk the player should get
Actor PlayerAct = Game.GetPlayer()
if DLC03CoA_PlayerTitle.GetValue() == 1
  PlayerAct.AddPerk(DLC03MQ06_CrusaderOfAtomPerk)
  DLC03MQ06_CrusaderofAtomMsg.Show()
elseif DLC03CoA_PlayerTitle.GetValue() == 2
  PlayerAct.AddPerk(DLC03MQ06_InquisitorOfAtomPerk)
  DLC03MQ06_InquisitorofAtomMsg.Show()
endif

;Fire achievement
Game.AddAchievement(62)

;Shut down quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0535_Item_00
Function Fragment_Stage_0535_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Fire achievement
Game.AddAchievement(62)

;Shut down quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
;Adjust objectives
SetObjectiveDisplayed(210, false)

CompleteAllObjectives()

;Fire achievement
Game.AddAchievement(62)

;Close out quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Close out all other objectives
CompleteAllObjectives()

;Complete quest
SetStage(555)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN CODE
;Fire achievement
Game.AddAchievement(62)

;Shut down quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
;Turn off "Speak to High Confessor" objectives
SetObjectiveFailed(151)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0765_Item_00
Function Fragment_Stage_0765_Item_00()
;BEGIN CODE
;Stage triggered from:
;1. DiMA's OnDeath script on this quest
;2. Stage 100 - Acadia Defense Quest
;3. Stage 120 - MQ05
;4. Stage 800 - MQ05

SetObjectiveDisplayed(160, false)
SetObjectiveDisplayed(460, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DebugMarker Auto Const

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const

ReferenceAlias Property Alias_HighConfessor Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusEntrance Auto Const Mandatory

Scene Property DLC03CoA_DialogueNucleusEntrance_Scene Auto Const Mandatory

Quest Property DLC03AtomM01 Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusSermon Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory

ReferenceAlias Property Alias_NucleusCodes Auto Const Mandatory

Scene Property DLC03MQ06_HC_ItIsTime Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerTitle Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusVictorySermon Auto Const Mandatory

Quest Property DLC03MQ02 Auto Const Mandatory

Quest Property DLC03MQ06_WindFarmHandling Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

Perk Property DLC03MQ06_CrusaderOfAtomPerk Auto Const Mandatory

Perk Property DLC03MQ06_InquisitorOfAtomPerk Auto Const Mandatory

Message Property DLC03MQ06_CrusaderofAtomMsg Auto Const Mandatory

Message Property DLC03MQ06_InquisitorofAtomMsg Auto Const Mandatory

Quest Property DLC03MQ06_WindFarmBuildingQuest Auto Const Mandatory

ReferenceAlias Property Alias_DiMA Auto Const Mandatory

GlobalVariable Property DLC03MQ06_DiMAUnavailable Auto Const Mandatory

Quest Property DLC03MQ04 Auto Const Mandatory

GlobalVariable Property DLC03_FFNucleus02_InquistorTitleAvailable Auto Const Mandatory

Perk Property DLC03_FarHarborSurvivalistPerk Auto Const Mandatory

Message Property DLC03MQ06_FarHarborSurvivalistMsg Auto Const Mandatory

GlobalVariable Property DLC03MQ06_TektusConvincedofDivision Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_ConfessorUnavailable Auto Const Mandatory
