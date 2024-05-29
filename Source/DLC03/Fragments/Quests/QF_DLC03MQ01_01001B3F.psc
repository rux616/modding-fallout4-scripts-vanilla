;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ01_01001B3F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;condition out if player has skipped ahead
If GetStageDone(50) == 0
  SetObjectiveDisplayed(5)
EndIf

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)

If GetStageDone(50) == 0
  SetObjectiveDisplayed(10)
EndIf

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;make sure Nick and Ellie's scenes for MS07 are blocked
Alias_MS07bPostQuestTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;turn off the radio
(DLC03MQ00 as DLC03:DCL03MQ00Script).DLC03EndRadioBroadcast()

SetObjectiveCompleted(5)

If GetStageDone(50) == 0
  SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ObjectReference CaseNotesREF = Alias_CaseNotes.GetRef()

SetObjectiveDisplayed(15)

CaseNotesREF.Enable()
Game.GetPlayer().AddItem(CaseNotesREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
SetObjectiveCompleted(15)

If GetStageDone(50) == 0
  SetObjectiveDisplayed(17)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
Alias_BoatControls.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC03MQ01_002_NakanoIntroScene.Start()
DLC03NakanoResidenceFakeMapMarker.enable()

SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
SetObjectiveCompleted(15)
SetObjectiveCompleted(17)
SetObjectiveDisplayed(20)

;turn off the radio
(DLC03MQ00 as DLC03:DCL03MQ00Script).DLC03EndRadioBroadcast()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ01Script
Quest __temp = self as Quest
DLC03:DLC03MQ01Script kmyQuest = __temp as DLC03:DLC03MQ01Script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor NickREF = Alias_Nick.GetActorRef()
Bool IsNickCompanion = NickREF.IsInFaction(CurrentCompanionFaction)

;shut down previous scene
DLC03MQ01_002_NakanoIntroScene.Stop()

;if Nick is your companion 
If (IsNickCompanion == True)
  ;Nick can't be a companion again until we're done
  ;NickREF.DisallowCompanion(SuppressDismissMessage=True)
  ;NickREF.EvaluatePackage()
  kmyquest.var_NickAtNakano=1
EndIf

;if Nick is with you at the Nakano Residence
If kmyquest.var_NickAtNakano == 1
  ;failsafe warp Nick if the player can't see him or he's far away
  If (PlayerREF.HasDetectionLOS(NickREF)== False) || (NickREF.GetDistance(PlayerREF) > 1000)
    ;check LOS, move Nick to the first marker if the player cannot see it, otherwise move him to the alternate marker which should be out of LOS
    If PlayerREF.HasDetectionLOS(DLC03MQ01NickLOSMarker01) == False
      NickREF.Moveto(DLC03MQ01NickLOSMarker01)
    Else
      NickREF.Moveto(DLC03MQ01NickLOSMarker02)
    EndIf
  EndIf
  ;start Nick's scene
  DLC03MQ01_003_NickIntro.Start()
Else
  DLC03MQ01_004_PlayerNakano02.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ01Script
Quest __temp = self as Quest
DLC03:DLC03MQ01Script kmyQuest = __temp as DLC03:DLC03MQ01Script
;END AUTOCAST
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()
;make Nick a companion again, make him the current companion if the player has none
If kmyquest.var_NickAtNakano == 1
  ;NickREF.AllowCompanion(True, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ01Script
Quest __temp = self as Quest
DLC03:DLC03MQ01Script kmyQuest = __temp as DLC03:DLC03MQ01Script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
ObjectReference HolotapeREF = Alias_KasumiHolotape.GetRef()
ObjectReference JournalREF = Alias_KasumiJournal.GetRef()
Actor NickREF = Alias_Nick.GetActorRef()
Bool IsNickCompanion = NickREF.IsInFaction(CurrentCompanionFaction)

SetObjectiveCompleted(20)

;display the right objective depending on what clues the player might already have
If GetStageDone(250) == 1
  SetObjectiveDisplayed(34)
Else
  SetObjectiveDisplayed(30)
  SetObjectiveDisplayed(32)
EndIf

;when the player gets close enough to the second clue, put a QT on it
kmyquest.RegisterForDistanceLessThanEvent(PlayerREF, JournalREF, 100.0)

;when the player gets close enough to the second clue, put a QT on it
kmyquest.RegisterForDistanceLessThanEvent(PlayerREF, HolotapeREF, 100.0)

;if we made Nick a companion again because the player refused to help, then dismiss him again
If (IsNickCompanion == True)
  ;Nick can't be a companion again until we're done
  ;NickREF.DisallowCompanion(SuppressDismissMessage=True)
  ;NickREF.EvaluatePackage()
  kmyquest.var_NickAtNakano=1
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ01Script
Quest __temp = self as Quest
DLC03:DLC03MQ01Script kmyQuest = __temp as DLC03:DLC03MQ01Script
;END AUTOCAST
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()

;If player picked up the holotape but didn't listen to it, pop objectives
If GetStageDone(310) == 0
  SetObjectiveCompleted(20)
  SetObjectiveDisplayed(35)
EndIf

;make Nick a companion again, make him the current companion if the player has none
If kmyquest.var_NickAtNakano == 1
  ;NickREF.AllowCompanion(True, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
DLC03MQ01_005_NickInvestigates01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
DLC03MQ01_005_NickInvestigates02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
;also pop the QT
SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;if we've also talked to the other parent, advance quest
If GetStageDone(235)
  SetStage(240)
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
;if we've also talked to the other parent, advance quest
If GetStageDone(230)
  SetStage(240)
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
SetObjectiveCompleted(32)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(34)

DLC03MQ01_005_NickInvestigates03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32, False)
SetObjectiveDisplayed(34)

DLC03MQ01_005_NickInvestigates03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
DLC03MQ01_005_NickInvestigates04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(34)
If IsObjectiveCompleted(32) == False
  SetObjectiveDisplayed(32, abDisplayed=False)
EndIf
SetObjectiveDisplayed(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
DLC03MQ01_006_NickAfterHolotape.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(34)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ01Script
Quest __temp = self as Quest
DLC03:DLC03MQ01Script kmyQuest = __temp as DLC03:DLC03MQ01Script
;END AUTOCAST
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()
;make Nick a companion again, make him the current companion if the player has none
If kmyquest.var_NickAtNakano == 1
  ;NickREF.AllowCompanion(True, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ01Script
Quest __temp = self as Quest
DLC03:DLC03MQ01Script kmyQuest = __temp as DLC03:DLC03MQ01Script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;make sure player can activate the boat
Alias_BoatControls.GetRef().BlockActivation(False, False)

SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(32)
SetObjectiveCompleted(34)
SetObjectiveCompleted(35)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

Actor NickREF = Alias_Nick.GetActorRef()
If kmyquest.var_NickAtNakano == 1
  ;make Nick a companion again, make him the current companion if the player has none
  ;NickREF.AllowCompanion(True, False)
EndIf

;give rewards
If kmyquest.var_NakanoReward == 3
  PlayerREF.AddItem(Caps001, 500)
ElseIf kmyquest.var_NakanoReward == 2
  PlayerREF.AddItem(Caps001, 400)
ElseIf kmyquest.var_NakanoReward == 1
  PlayerREF.AddItem(Caps001, 350)
Else
    PlayerREF.AddItem(Caps001, 300)
EndIF

;start Commonwealth faction quests
if (BoSJoined.GetValue() ==1) && (PlayerBoS_KickedOut.GetValue()== 0)
DLC03Acadia_BOS.SetStage(5)
DLC03Acadia_BoS_Misc.Start()
endif
if (PlayerInstitute_Joined.GetValue()==1) && (PlayerInstitute_KickedOut.GetValue() == 0)
DLC03Acadia_Institute.Start()
DLC03Acadia_Institute_Misc.Start()
endif
if (PlayerRailroad_JoinedFaction.GetValue()==1) && (PlayerRailroad_KickedOut.GetValue() == 0)
DLC03Acadia_RR.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;you can now fast travel to and from Far Harbor
DLC03ToFarHarborMapMarker.Enable()
Utility.Wait(1.0)
CompleteAllObjectives()
DLC03MQ02.SetStage(50)
Game.AddAchievement(59)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;turn off the radio
(DLC03MQ00 as DLC03:DCL03MQ00Script).DLC03EndRadioBroadcast()

;turn off the nick investigate markers
DLC03MQ01NickInvestigateEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC03MQ01_001_CaseIntroScene Auto Const Mandatory

Scene Property DLC03MQ01_002_NakanoIntroScene Auto Const Mandatory

ReferenceAlias Property Alias_Nick Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory

Scene Property DLC03MQ01_003_NickIntro Auto Const Mandatory

ObjectReference Property DLC03MQ01NickLOSMarker02 Auto Const Mandatory

ObjectReference Property DLC03MQ01NickLOSMarker01 Auto Const Mandatory

Scene Property DLC03MQ01_005a_NickKasumiRoom Auto Const Mandatory

ReferenceAlias Property Alias_KasumiHolotape Auto Const Mandatory

Scene Property DLC03MQ01_006_NickAfterHolotape Auto Const Mandatory

Scene Property DLC03MQ01_005_NickInvestigates Auto Const Mandatory

Scene Property DLC03MQ01_004_PlayerNakano01 Auto Const Mandatory

ReferenceAlias Property Alias_CaseNotes Auto Const Mandatory

Scene Property DLC03MQ01_005_NickInvestigates01 Auto Const Mandatory

Scene Property DLC03MQ01_005_NickInvestigates02 Auto Const Mandatory

Scene Property DLC03MQ01_004_PlayerNakano02 Auto Const Mandatory

ReferenceAlias Property Alias_KasumiJournal Auto Const Mandatory

Scene Property DLC03MQ01_005_NickInvestigates03 Auto Const Mandatory

ReferenceAlias Property Alias_MS07bPostQuestTrigger Auto Const Mandatory

Quest Property MS07bPostQuest Auto Const Mandatory

Scene Property DLC03MQ01_005_NickInvestigates04 Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

Quest Property DLC03MQ02 Auto Const Mandatory

GlobalVariable Property BoSJoined Auto Const Mandatory

GlobalVariable Property PlayerBoS_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_BoS Auto Const Mandatory

Quest Property DLC03Acadia_Institute Auto Const Mandatory

GlobalVariable Property PlayerInstitute_Joined Auto Const Mandatory

GlobalVariable Property PlayerInstitute_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_Institute_Misc Auto Const Mandatory

Quest Property DLC03Acadia_BoS_Misc Auto Const Mandatory

Quest Property DLC03MQ00 Auto Const Mandatory

ObjectReference Property DLC03NakanoResidenceMapMarkerREF Auto Const Mandatory

ObjectReference Property DLC03NakanoResidenceFakeMapMarker Auto Const Mandatory

ObjectReference Property DLC03ToFarHarborMapMarker Auto Const Mandatory

GlobalVariable Property PlayerRailroad_JoinedFaction Auto Const Mandatory

GlobalVariable Property PlayerRailroad_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_RR Auto Const Mandatory

ReferenceAlias Property Alias_BoatControls Auto Const Mandatory

ObjectReference Property DLC03MQ01NickInvestigateEnableMarker Auto Const Mandatory
