;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_KiddieKingdomMain_0103684F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;;;;; PA Scene List ;;;;;
;/
Exterior
10 =
20 = Radiation Spray 1st time
21 = Spray after turning sprayer off 1st time
22 = Spray after turning sprayer off repeat
30 = 

Funhouse
100 = Lobby
110 = Hall of glass
120 = Spinning Bottles
130 = Mezmo
140 = Fell from large tube
150 = Hall of doors

/;


;;;;;;;;;;;;;;;;;;
;/Alternate title
Trick or treat?
The sweetest illusion
Candy Crazed
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Spawn Oswald's Legendary Items
DLC04_CustomItemQuest.SetStage(90)

;Equip them to him
Actor Oswald = Alias_Oswald.GetActorReference()
Oswald.EquipItem(Alias_OswaldsSword.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(130)
SetStage(400)
SetStage(600)
utility.Wait(3.0)
Game.GetPlayer().MoveTo(Alias_RoofMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Search the three locations
;Theater
SetObjectiveDisplayed(20)
;Fun House
SetObjectiveDisplayed(25)
;Tunnels
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;
;if IsObjectiveDisplayed(20)
;	SetObjectiveDisplayed(20, false)
;endif
;SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Debug.Trace(self + ": Stage 100 was set")

;Turn on mister objective
;SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Find Key for employee tunnels
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0113_Item_00
Function Fragment_Stage_0113_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(110) && !GetStageDone(115)
SetObjectiveDisplayed(110, false)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
SetObjectiveCompleted(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Stop the Mister Objective
;SetObjectiveCompleted(100)
;SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0128_Item_00
Function Fragment_Stage_0128_Item_00()
;BEGIN CODE
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetMySceneDone(2)
kMyQuest.TeleportOswaldToHolding()
Alias_TunnelGhoul.GetActorRef().SetValue(Aggression, 2)
kmyQuest.CheckForOswaldEvent()

;Tunnels
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Mister Turned off complete objective
;Oswald may still be out in the zone
;SetObjectiveCompleted(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetMySceneDone(0)
kmyQuest.SetMySceneDone(1)
kmyQuest.TeleportOswaldToHolding()
kmyQuest.CheckForOswaldEvent()
;Fun House
SetObjectiveCompleted(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LockTheaterDoors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(590)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DoGhoulBlast(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(580)
	kmyQuest.DoGhoulBlast()
endif
kmyQuest.MakeCrowdGhoulsHostile()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
Debug.Trace(self + "Stage 600")
kmyQuest.UnlockTheaterDoors()

SetObjectiveCompleted(20)

kmyQuest.TheaterFightEnd()
kmyQuest.CheckMagicShowEnd()
kmyQuest.MakeCrowdGhoulsHostile()
kmyQuest.SetMySceneDone(3)
kmyQuest.CheckForOswaldEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the PA scene when we have that


kmyQuest.AddToPAQueue(90, playOnlyOnce = false, cutOffTime = -1.0)
;Remove this when the scene is hooked up
;SetStage(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(50) && !IsObjectiveCompleted(50)
	SetObjectiveCompleted(50)
Endif
SetObjectiveDisplayed(200)
kmyQuest.SetRoofElevatorActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0711_Item_00
Function Fragment_Stage_0711_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetPADoneForever()
kmyQuest.TeleportOswaldToRoof()

DLC04_KiddieKingdomRoof.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(210)
kmyQuest.StartFight()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0791_Item_00
Function Fragment_Stage_0791_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
;Give the player rewards here
Actor ThePlayer = Game.GetPlayer()
ThePlayer.AddItem(Alias_OswaldsKey.GetReference())
ThePlayer.AddItem(Alias_OswaldsPassword.GetReference())

;Give other rewards, whatever those are
ThePlayer.AddItem(Alias_OswaldsSword.GetReference())
utility.wait(0.5)
Alias_Oswald.GetActorRef().RemoveItem(DLC04_Unique_OswaldTuxedoHat, 1, false, akOtherContainer = ThePlayer)

;Clear out Ghouls
kmyQuest.SetGhoulsForRemoval()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0795_Item_00
Function Fragment_Stage_0795_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TeleportOswaldToHolding()
kmyQuest.SetGhoulsForRemoval()
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
kmyQuest.SetRoofElevatorActive()

;If Oswald is dead, you have to shut off the radiation
if alias_Oswald.GetActorRef().IsDead()
	SetStage(810)

else
;If oswald is alive, you talked your way through and he takes care of the radiation
	kmyQuest.SetRadMisterState(false)
	SetStage(1000)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(300) && !isObjectiveCompleted(300)
	SetObjectiveCompleted(300)
endif

;Add Check for Ghouls cleared later
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
;If MQ03 was running, the zone is now secured. Allow the player to raise the flag.
if (pDLC04MQ03.IsRunning()) && PDLC04PlayerKickedOut.getValue() == 0
     pDLC04MQ03.SetStage(300)

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
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
Quest __temp = self as Quest
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = __temp as DLC04:DLC04KiddieKingdomMainQuestScript
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
CompleteAllObjectives()
CompleteQuest()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PDLC04MQ03 Auto Const Mandatory

ReferenceAlias Property Alias_Oswald Auto Const Mandatory

Scene Property DLC04_KiddieKingdomRoof Auto Const Mandatory

ReferenceAlias Property Alias_TunnelGhoul Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property PDLC04PlayerKickedOut Auto Const Mandatory

ReferenceAlias Property Alias_TheaterIntMarker Auto Const Mandatory

ReferenceAlias Property Alias_RoofMarker Auto Const Mandatory

Key Property DLC04_KK_RoofKey Auto Const Mandatory

Key Property DLC04_KK_OswaldPassword Auto Const Mandatory

ReferenceAlias Property Alias_OswaldsKey Auto Const Mandatory

ReferenceAlias Property Alias_OswaldsPassword Auto Const Mandatory

Quest Property DLC04_CustomItemQuest Auto Const Mandatory

ReferenceAlias Property Alias_OswaldsHat Auto Const Mandatory

ReferenceAlias Property Alias_OswaldsTux Auto Const Mandatory

ReferenceAlias Property Alias_OswaldsSword Auto Const Mandatory

Armor Property DLC04_Unique_OswaldTuxedoHat Auto Const Mandatory
