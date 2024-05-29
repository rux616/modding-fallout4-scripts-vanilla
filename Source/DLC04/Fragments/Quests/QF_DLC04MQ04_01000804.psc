;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04_01000804 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

SetStage(10)

PlayerRef.Moveto(PlayerDebugMarker)
Alias_Shank.GetRef().Moveto(ShankDebugMarker)

;Get the player set up to be kicked from Raiders
DLC04RaiderKickout.SetStage(10)

;Get player set up in proper factions
DLC04MQ01.SetStage(1000)

;Add player to the gang factions
PlayerRef.AddtoFaction(DLC04GangDisciplesFaction)
PlayerRef.AddtoFaction(DLC04GangOperatorsFaction)
PlayerRef.AddtoFaction(DLC04GangPackFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(10)
SetStage(15)
SetStage(20)
SetStage(90)

Utility.Wait(2.0)

SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;PLAYER MUST TRAVEL TO LOCATION FIRST AND KILL EVERYONE
Location tempLoc = Game.GetPlayer().GetCurrentLocation()
WorkshopScript currentWorkshop = (WorkshopParent as WorkshopParentScript).GetWorkshopFromLocation(tempLoc)
debug.trace("DLC04MQ04: Chosen workshop: " + currentWorkshop)

;Give location to player
currentWorkshop.SetOwnedByPlayer(true)

;Set the location to be controlled by the Operators and spawn in a couple
DLC04:DLC04WorkshopParentScript DLC04WPS = DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript

DLC04WPS.SetRaiderSettlement(currentWorkshop, 2)
debug.trace("DLC04MQ04: Workshop keyword assigned to workshop obj: " + currentWorkshop.HasKeyword(WorkshopType02))
debug.trace("DLC04MQ04: Workshop has gang value: " + DLC04WPS.GetRaiderGangValue(currentWorkshop))

DLC04WPS.CreateRaider(currentWorkshop)
DLC04WPS.CreateRaider(currentWorkshop)
DLC04WPS.CreateRaider(currentWorkshop)

Utility.Wait(8.0)

;Now move to the player back to Shank
Game.GetPlayer().Moveto(PlayerDebugMarker)
Alias_Shank.GetRef().Moveto(ShankDebugMarker)

;Set the appropriate stages
SetStage(10)
SetStage(15)
SetStage(20)
SetStage(90)
SetStage(110)
SetStage(150)

;Start the Raider attack quest
DLC04MQ04RaiderAttack.SetStage(10)

;Get the player set up to be kicked from Raiders
DLC04RaiderKickout.SetSTage(10)

;Get player set up in proper factions
DLC04MQ01.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Set the appropriate stages
SetStage(10)
SetStage(15)
SetStage(20)
SetStage(90)
SetStage(110)
SetStage(150)
SetStage(250)

Game.GetPlayer().Moveto(PlayerDebugMarker)
Alias_Shank.GetRef().Moveto(ShankDebugMarker)

;Get the player set up to be kicked from Raiders
DLC04RaiderKickout.SetSTage(10)

;Get player set up in proper factions
DLC04MQ01.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Start up the Chase Off and Subdue handler quest
DLC04RaidChaseOffDisable.Start()
DLC04RaidSubdueDisable.Start()

;Start up the keyword assignment quest
DLC04MQ04KeywordAssignment.Start()

;Start up Shank's teleport quest
DLC04ShankTeleportToWorkshopQuest.Start()

;Add raid help screens to list
DLC04MQ04TutorialQuest.SetStage(30)

;Throw objectives
SetObjectiveDisplayed(10)

;Give player the "Raids" faction
Game.GetPlayer().AddToFaction(DLC04RaidPlayerFaction)

; Start monitoring for DLC04SettlementFF01 (arena fight)
DLC04DialogueSettlement.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Update objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Turn on the scene quests for Dixie and Mason
DLC04MQ04MasonSceneQuest.SetStage(10)
DLC04MQ04DixieSceneQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Give player the "Wasteland Warlord" perk
Game.GetPlayer().AddPerk(DLC04WastelandWarlord01)

; if Preston current companion, set flag
if Preston.GetRef() == Alias_Companion.GetRef()
	DLC04PrestonCompanionDuringRaid.SetValue(1)
endif
; if Preston is available as a companion, set to permanent Hatred
CompanionActorScript prestonRef = (Preston.GetActorRef() as CompanionActorScript)
if PrestonRef.IsInFaction(HasBeenCompanionFaction)
	prestonRef.SetAffinity(-5000)

	; Dismiss him and make it so his travel to info doesn't show up and factions are stripped
	FollowersScript.GetScript().DismissCompanion(prestonRef, FALSE)
	prestonRef.RemoveFromFaction(HasBeenCompanionFaction)
	prestonRef.SetHasLeftPlayerPermanently()

	; show hatred message
	CA_Preston_Hates.Show()

	DLC04COMPreston.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set objective
SetActive()
SetObjectiveCompleted(20)

if !Alias_MQ04RaiderSpokesperson.GetActorRef().IsDead()
  SetObjectiveDisplayed(80)
endif

;Mark appropriate stage
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
;Set objective
SetObjectiveCompleted(80)
if IsObjectiveCompleted(90) == false
  SetObjectiveDisplayed(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set objective
SetActive()
SetObjectiveCompleted(20)
SetObjectiveDisplayed(90)

;Mark appropriate stage
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Set objective
SetObjectiveFailed(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Register player for Raider map tutorial
DLC04MQ04TutorialQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(110)

if !IsObjectiveCompleted(80) &&  IsObjectiveDisplayed(80)
  SetObjectiveDisplayed(80, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(110, false, false)
SetObjectiveDisplayed(90, false, false)
SetObjectiveDisplayed(140)

;Start up the Raider attack quest
DLC04MQ04RaiderAttack.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(150)

;Start up the Raider attack quest
DLC04MQ04RaiderAttack.SetStage(10)

;Turn on trigger for scene
Alias_StartSceneTrigger.GetRef().Enable()

Actor ShankAct = Alias_Shank.GetActorRef()

;Get Shank moving to new location
ShankAct.EvaluatePackage()

Actor PlayerRef = Game.GetPlayer()

;If player doesn't have los, move Shank to his marker
if !PlayerRef.HasDirectLos(ShankAttackSceneMarker) && !PlayerRef.HasDetectionLos(ShankAttackSceneMarker)
   ShankAct.Moveto(ShankAttackSceneMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
if !GetStageDone(180)
  DLC04MQ04_004_PreRaiderAttack.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
Alias_MQ04AttackRaiderSpokesperson.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetStage(170)

;Get everyone set up for attack
DLc04MQ04RaiderAttack.SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
SetObjectiveCompleted(150)

if !GetStageDone(210)
  SetObjectiveDisplayed(190)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;If they haven't gotten set in Shank's scene, complete them now
SetObjectiveCompleted(140)
SetObjectiveCompleted(150)

;If the player's spoken to the spokesperson, complete the objective. Otherwise, remove it
if DLC04MQ04RaiderAttack.GetStageDone(17)
  SetObjectiveCompleted(190)
else
  SetObjectiveDisplayed(190, false, false)
endif

if !GetStageDone(250)
  SetObjectiveDisplayed(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

;If the check in with NPC obj isn't completed, remove it now
if !IsObjectiveCompleted(190)
  SetObjectiveDisplayed(190, false, false)
endif

SetObjectiveDisplayed(250)

;Start up Raid select quest
DLC04RaidSelectQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;If raid select quest somehow wasn't started, do so now
if !DLC04RaidSelectQuest.IsRunning()
  DLC04RaidSelectQuest.Start()
endif

;Shut down Raider attack quest
DLC04MQ04RaiderAttack.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;Register for the "Outposts Share" tutorial
if !DLC04MQ04TutorialQuest.GetStageDone(40)
  DLC04MQ04TutorialQuest.SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(305)

;Start up Shank final scene offering
DLC04MQ04ShankFinalSceneOfferQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
Quest __temp = self as Quest
dlc04:dlc04mq04questscript kmyQuest = __temp as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(305)
ModObjectiveGlobal(1, DLC04MQ04FinalOutpostsCount, 330)

;Shut down Shank's final scene offering quest
DLC04MQ04ShankFinalSceneOfferQuest.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
Quest __temp = self as Quest
dlc04:dlc04mq04questscript kmyQuest = __temp as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

; turn on raider recruitment
kmyQuest.DLC04WorkshopParent.bAllowRaiderRecruitment = true

;Wait a couple of seconds, then...
Utility.Wait(5.0)

;Get the Outpost track up and running
debug.trace(self + "Calling stage 10 on debug tracker")
DLC04MQ04_RaiderOutpostTracker.SetStage(10)

;Throw the achievment
Game.AddAchievement(83)

DLC04MQ05.SetStage(5)
DLC04MQ05.SetActive()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Make sure to pull Shank out of his book reading anim
Alias_Shank.GetActorRef().ChangeAnimFlavor()

FailAllObjectives()
SetStage(1000)
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

ObjectReference Property PlayerDebugMarker Auto Const Mandatory

ObjectReference Property ShankDebugMarker Auto Const Mandatory

ReferenceAlias Property Alias_Shank Auto Const Mandatory

Quest Property DLC04RaidChaseOffDisable Auto Const Mandatory

Quest Property DLC04WorkshopParent Auto Const Mandatory

WorkshopParentScript Property WorkshopParent Auto Const Mandatory

Quest Property DLC04MQ04RaiderAttack Auto Const Mandatory

Keyword Property WorkshopType02 Auto Const Mandatory

ReferenceAlias Property Alias_StartSceneTrigger Auto Const Mandatory

Scene Property DLC04MQ04_004_PreRaiderAttack Auto Const Mandatory

Quest Property DLC04RaidSelectQuest Auto Const Mandatory

Quest Property DLC04MQ05 Auto Const Mandatory

Quest Property DLC04MQ04MasonSceneQuest Auto Const Mandatory

Quest Property DLC04MQ04DixieSceneQuest Auto Const Mandatory

LocationAlias Property Alias_InitialRaiderSettlementLocation Auto Const Mandatory

ReferenceAlias Property Alias_MQ04AttackRaiderSpokesperson Auto Const Mandatory

Quest Property DLC04RaiderKickout Auto Const Mandatory

Faction Property DLC04RaidPlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_MQ04RaiderSpokesperson Auto Const Mandatory

ObjectReference Property ShankAttackSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_InitialRaiderSettlement Auto Const Mandatory

Faction Property DLC04GangOperatorsFaction Auto Const Mandatory

Faction Property DLC04GangDisciplesFaction Auto Const Mandatory

Faction Property DLC04GangPackFaction Auto Const Mandatory

ReferenceAlias Property preston Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

GlobalVariable Property DLC04PrestonCompanionDuringRaid Auto Const Mandatory

Faction Property HasBeenCompanionFaction Auto Const Mandatory

Message Property CA_Preston_Hates Auto Const Mandatory

Quest Property DLC04COMPreston Auto Const Mandatory

Quest Property DLC04MQ04_RaiderOutpostTracker Auto Const Mandatory

Quest Property DLC04DialogueSettlement Auto Const Mandatory

Quest Property DLC04MQ04KeywordAssignment Auto Const Mandatory

Quest Property DLC04MQ04ShankFinalSceneOfferQuest Auto Const Mandatory

Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory

Quest Property DLC04MQ01 Auto Const Mandatory

Quest Property DLC04RaidSubdueDisable Auto Const Mandatory

Perk Property DLC04WastelandWarlord01 Auto Const Mandatory

GlobalVariable Property DLC04MQ04FinalOutpostsCount Auto Const Mandatory

Quest Property DLC04ShankTeleportToWorkshopQuest Auto Const Mandatory
