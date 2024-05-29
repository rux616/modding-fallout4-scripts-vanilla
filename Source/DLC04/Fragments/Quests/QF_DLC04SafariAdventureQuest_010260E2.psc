;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04SafariAdventureQuest_010260E2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(10)
Alias_CitoAlias.getReference().Enable()
Alias_CitoAlias.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(25)
PDLC04SafariPrimateHouseDoor.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_CitoAlias.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(25)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(55)

Alias_DrMcDermotHolotape.getReference().Enable()

game.getplayer().additem(Alias_DrMcDermotHolotape.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(50)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(55)

if Alias_CitoAlias.getActorReference().isDead() == 0
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(60)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(60)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(75)
Alias_CitoAlias.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
Alias_ChrisTheGorilla.getActorReference().setValue(PDLC04SafariGorillaFollow, 1)
Alias_ChrisTheGorilla.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(75)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(80)

PDLC04CitoTriangleHouseArrive.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(80)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(85)

PDLC04CitoCloningDoorLocked.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(85)
if Alias_CitoAlias.getActorReference().isDead() == 0
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(90)
endif

if Alias_CitoAlias.getActorReference().isDead() == 1
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(96)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0117_Item_00
Function Fragment_Stage_0117_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(90)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(95)

if Game.GetPlayer().getItemCount(PDLC04SafariDrHeinPasscode) > 0
       PDLC04SafariAdventureQuest.setstage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0119_Item_00
Function Fragment_Stage_0119_Item_00()
;BEGIN CODE
if Alias_CitoAlias.getActorReference().isDead() == 0
    PDLC04CitoBigMetalSnakeArrive.start()
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(95)
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(100)
endif

if Alias_CitoAlias.getActorReference().isDead() == 1
    if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(95)
         PDLC04SafariAdventureQuest.SetObjectiveCompleted(95)
    endif
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(96)
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(101)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(100)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(100)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(101)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(101)
endif

PDLC04SafariAdventureQuest.SetObjectiveDisplayed(110)

PDLC04CitoHeinKeyPickup.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.CompleteAllObjectives()
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(10)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(10)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(25)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(25)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(10)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(10)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(50)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(50)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(55)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(55)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(60)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(60)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(75)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(75)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(80)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(80)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(85)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(85)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(90)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(90)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(95)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(95)
endif
if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(96)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(96)
endif

PDLC04SafariAdventureQuest.SetObjectiveCompleted(110)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(125)


PDLC04CitoCloningFacilityScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0123_Item_00
Function Fragment_Stage_0123_Item_00()
;BEGIN CODE
PDLC04CitoCloningFacilityScene02.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(125)
PDLC04SafariAdventureQuest.SetObjectiveDisplayed(150)

;Enable Final Gatorclaw Encounter
PDLC04SafariAdventureFinalEncounterEnabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
PDLC04SafariCitoAngryAtPlayer.setValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(175)
PDLC04SafariAdventureQuest.setstage(1000)
DLC04_CustomItemQuest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0176_Item_00
Function Fragment_Stage_0176_Item_00()
;BEGIN CODE
PDLC04SafariAdventureQuest.SetObjectiveCompleted(175)
PDLC04SafariAdventureQuest.setstage(1000)
DLC04_CustomItemQuest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
PDLC04SafariCitoFollowing.setValue(0)
PDLC04SafariCitoFaction.SetEnemy(PPlayerFaction, True, True)
alias_CitoAlias.getActorRef().getActorBase().setEssential(false)
alias_CitoAlias.getActorRef().StartCombat(Game.GetPlayer())

if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(25)
    PDLC04SafariAdventureQuest.SetObjectiveFailed(25)
endif

if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(60)
    PDLC04SafariAdventureQuest.SetObjectiveFailed(60)
endif

if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(90)
    PDLC04SafariAdventureQuest.SetObjectiveFailed(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0196_Item_00
Function Fragment_Stage_0196_Item_00()
;BEGIN CODE
PDLC04SafariCitoFollowing.setValue(0)
alias_CitoAlias.getActorRef().getActorBase().setEssential(false)

if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(25)
    PDLC04SafariAdventureQuest.SetObjectiveFailed(25)
endif

if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(60)
    PDLC04SafariAdventureQuest.SetObjectiveFailed(60)
endif

if PDLC04SafariAdventureQuest.IsObjectiveDisplayed(90)
    PDLC04SafariAdventureQuest.SetObjectiveFailed(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(250)
      PDLC04SafariAdventureQuest.setstage(260)
endif

if PDLC04SafariAdventureQuest.getStageDone(60) ==  0
   Alias_CitoAlias.getActorReference().AddItem(Alias_DrMcDermotHolotape.getReference())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(200)
      PDLC04SafariAdventureQuest.setstage(260)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(300)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(175)
    PDLC04SafariAdventureQuest.setstage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_01
Function Fragment_Stage_0260_Item_01()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(300)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(175)
    PDLC04SafariAdventureQuest.setstage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(260) == 0
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(150)
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(175)
endif

if PDLC04SafariAdventureQuest.getstagedone(260)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(150)
    PDLC04SafariAdventureQuest.setstage(1000)
endif

PDLC04SafariPrimateHouseDoor.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_01
Function Fragment_Stage_0300_Item_01()
;BEGIN CODE
if PDLC04SafariAdventureQuest.getstagedone(260) == 0
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(150)
    PDLC04SafariAdventureQuest.SetObjectiveDisplayed(175)
endif

if PDLC04SafariAdventureQuest.getstagedone(260)
    PDLC04SafariAdventureQuest.SetObjectiveCompleted(150)
    PDLC04SafariAdventureQuest.setstage(1000)
endif

PDLC04SafariPrimateHouseDoor.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;If MQ03 was running, the zone is now secured. Allow the player to raise the flag.
if (pDLC04MQ03.IsRunning()) && PDLC04PlayerKickedOut.getValue() == 0
     pDLC04MQ03.SetStage(400)

	;Set my flag objective stage
	SetStage(1100)

Else 	;MQ not running so just complete the quest
	SetStage(2000)

EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
;If MQ03 was running, the zone is now secured. Allow the player to raise the flag.
if (pDLC04MQ03.IsRunning()) && PDLC04PlayerKickedOut.getValue() == 0
     pDLC04MQ03.SetStage(400)

	;Set my flag objective stage
	SetStage(1100)

Else 	;MQ not running so just complete the quest
	SetStage(2000)

EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_02
Function Fragment_Stage_1000_Item_02()
;BEGIN CODE
;If MQ03 was running, the zone is now secured. Allow the player to raise the flag.
if (pDLC04MQ03.IsRunning()) && PDLC04PlayerKickedOut.getValue() == 0
     pDLC04MQ03.SetStage(400)

	;Set my flag objective stage
	SetStage(1100)

Else 	;MQ not running so just complete the quest
	SetStage(2000)

EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04SafariAdventureQuestScript
Quest __temp = self as Quest
DLC04:DLC04SafariAdventureQuestScript kmyQuest = __temp as DLC04:DLC04SafariAdventureQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ListenForFlagRaise()
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetStage(2000)

if PDLC04SafariAdventureQuest.getstagedone(176)
      PDLC04SafariCitoAndFamilyEnableMarker.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_01
Function Fragment_Stage_1500_Item_01()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetStage(2000)

if PDLC04SafariAdventureQuest.getstagedone(176)
      PDLC04SafariCitoAndFamilyEnableMarker.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_02
Function Fragment_Stage_1500_Item_02()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetStage(2000)


if PDLC04SafariAdventureQuest.getstagedone(176)
      PDLC04SafariCitoAndFamilyEnableMarker.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveFailed(1000)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
PDLC04SafariAdventurePOST.setstage(0)

CompleteAllObjectives()
CompleteQuest()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PDLC04MQ03 Auto Const Mandatory

Quest Property PDLC04SafariAdventureQuest Auto Const Mandatory

ReferenceAlias Property Alias_CitoAlias Auto Const Mandatory

RefCollectionAlias Property Alias_SafariAdventureRadGorillas Auto Const Mandatory

Faction Property PDLC04SafariCitoFaction Auto Const Mandatory

Faction Property pPlayerFaction Auto Const Mandatory

Scene Property PDLC04CitoCloningFacilityScene01 Auto Const Mandatory

Scene Property PDLC04CitoCloningFacilityScene02 Auto Const Mandatory

Holotape Property PDLC04SafariDrMcDermotHolotape01 Auto Const Mandatory

GlobalVariable Property PDLC04PlayerKickedOut Auto Const Mandatory

Quest Property PDLC04SafariAdventurePOST Auto Const Mandatory

Scene Property PDLC04CitoTriangleHouseArrive Auto Const Mandatory

Scene Property PDLC04CitoCloningDoorLocked Auto Const Mandatory

Scene Property PDLC04CitoBigMetalSnakeArrive Auto Const Mandatory

Scene Property PDLC04CitoHeinKeyPickup Auto Const Mandatory

Key Property PDLC04SafariDrHeinPasscode Auto Const Mandatory

ObjectReference Property PDLC04SafariAdventureFinalEncounterEnabler Auto Const Mandatory

ReferenceAlias Property Alias_ChrisTheGorilla Auto Const Mandatory

ActorValue Property PDLC04SafariGorillaFollow Auto Const Mandatory

GlobalVariable Property PDLC04SafariCitoAngryAtPlayer Auto Const Mandatory

ReferenceAlias Property Alias_DrMcDermotHolotape Auto Const Mandatory

LeveledItem Property PDLC04_CustomItem_DoNotPlaceDirectly_CitosShiny Auto Const Mandatory

GlobalVariable Property PDLC04SafariCitoFollowing Auto Const Mandatory

Quest Property DLC04_CustomItemQuest Auto Const Mandatory

ObjectReference Property PDLC04SafariPrimateHouseDoor Auto Const Mandatory

ObjectReference Property PDLC04SafariCitoAndFamilyEnableMarker Auto Const Mandatory
