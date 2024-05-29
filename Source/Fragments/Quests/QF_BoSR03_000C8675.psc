;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSR03_000C8675 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Debug quest start.
;Skip BoS100 (Fire Support) and 101 (Call to Arms)
BoS000.SetStage(255)
BoS100Fight.SetStage(2)
BoS100.SetStage(255)
BoS101.SetStage(255)
;Skip BoS200 (Training) and BoS201 (Shadow of Steel)
BoS200.SetStage(10)
BoS200.SetStage(40)
BoS200.SetStage(70)
BoS200.SetStage(255)
BoS201.SetStage(0)
BoS201.SetStage(255)
;Skip the BoSM00 Intro
BoSM00.SetStage(20)
;Skip BoSM01 and BoSM02
BoSM01.SetStage(200)
BoSM02.SetStage(12)
BoSM02.SetStage(30)
BoSM02.SetStage(430)
BoSM02.SetStage(430)

;Player in BoS; Training missions, if any, done.
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPrydwenArrived.SetValue(1)
BoSPlayerRank.SetValue(2)
BoSKellsIntroDone.SetValue(1)
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSDoors.Enable()

;Turn on Virgil's Act III dialogue and packages.
MQ206.SetStage(1200)
MQ206.SetStage(2000)

;Move Kells into position
Actor Kells = Alias_BoSR03Kells.GetActorRef()
Kells.EvaluatePackage()
Kells.MoveToPackageLocation()

;Move Player into position
Game.GetPlayer().Moveto(BoSKellsPlayerMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE BoSR03Script
Quest __temp = self as Quest
BoSR03Script kmyQuest = __temp as BoSR03Script
;END AUTOCAST
;BEGIN CODE
;Register for dungeon cleared event
Debug.Trace( self + "Registering for OnLocationCleared" + Alias_Dungeon.GetLocation() )
kmyQuest.RegisterForRemoteEvent(Alias_Dungeon.GetLocation(),"OnLocationCleared")

;reset the dungeon location
Dungeon.GetLocation().Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Show objective for squire
SetObjectiveDisplayed(10,1)

;Enable the squire if the player hasn't already cleared the area
If GetStageDone(30) == 0
    Alias_BoSR03Squire.GetActorRef().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
;Show objective for squire
SetObjectiveDisplayed(10,1)

;Enable the squire if the player hasn't already cleared the area
If GetStageDone(30) == 0
    Alias_BoSR03Squire.GetActorRef().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Complete objective for squire
SetObjectiveCompleted(10,1)

;Show the objective for dungeon
SetObjectiveDisplayed(30,1)

;Set squire to follow
Alias_BoSr03Squire.GetActorRef().FollowerFollow()
Alias_BoSr03Squire.GetActorRef().EvaluatePackage()

;Show map marker
Alias_DungeonMapMarker.GetRef().AddToMap()

; show boss QTs if 3 or less
If Alias_DungeonBoss.GetCount() <= 3
  SetStage(3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_01
Function Fragment_Stage_0025_Item_01()
;BEGIN CODE
;Complete objective for squire
SetObjectiveCompleted(10,1)

;Show the objective for dungeon
SetObjectiveDisplayed(30,1)

;Set squire to follow
Alias_BoSr03Squire.GetActorRef().FollowerFollow()
Alias_BoSr03Squire.GetActorRef().EvaluatePackage()

;Show map marker
Alias_DungeonMapMarker.GetRef().AddToMap()

; show boss QTs if 3 or less
If Alias_DungeonBoss.GetCount() <= 3
  SetStage(3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Complete objective for dungeon and show objective for squire if player is on correct objective.
If GetStageDone(20) == 0
    SetStage(255)
EndIf

If IsObjectiveDisplayed(10) == 1 && GetStageDone(25) == 0
    SetObjectiveFailed(10)
    SetStage(355)
EndIf

If IsObjectiveDisplayed(30) == 1
    SetObjectiveCompleted(30,1)
    SetObjectiveDisplayed(40,1)
EndIf

Alias_BoSR03Squire.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
;Complete objective for dungeon and show objective for squire if player is on correct objective.
If GetStageDone(20) == 0
    SetStage(255)
EndIf

If IsObjectiveDisplayed(10) == 1 && GetStageDone(25) == 0
    SetObjectiveFailed(10)
    SetStage(355)
EndIf

If IsObjectiveDisplayed(30) == 1
    SetObjectiveCompleted(30,1)
    SetObjectiveDisplayed(40,1)
EndIf

Alias_BoSR03Squire.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Complete objective for squire part 2
SetObjectiveCompleted(40,1)

;Show the objective for 2nd Proctor talk
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_BoSR03Squire.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Give player reward
Game.GetPlayer().AddItem(BoSRadiantRewardCaps,1)
BoSR03_FirstCompletion.SetValueInt(1)

;Complete objectives and quest
CompleteAllObjectives()
CompleteQuest()

;Go to shutdown
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSR03Kells Auto Const

ObjectReference Property BoSKellsMarker Auto Const

ReferenceAlias Property Alias_BoSR03Squire Auto Const

followersscript Property Followers Auto Const

LocationAlias Property Alias_dungeon Auto Const

ObjectReference Property BoSKellsPlayerMarker Auto Const

Faction Property pBrotherhoodofSteelFaction Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS201 Auto Const

Quest Property BoSM00 Auto Const

Quest Property BoSM01 Auto Const

Quest Property BoSM02 Auto Const

GlobalVariable Property BoSTraining Auto Const

GlobalVariable Property BoSPrydwenArrived Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

GlobalVariable Property BoSKellsIntroDone Auto Const

Quest Property BoSEnable Auto Const

GlobalVariable Property BoSJoined Auto Const

Quest Property MQ206 Auto Const

LocationAlias Property Dungeon Auto Const

Door Property BoSVertibirdGroundDoor Auto Const

Door Property BoSVertibirdAirDoor Auto Const

ObjectReference Property BoSDoors Auto Const

Quest Property BoS000 Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

LeveledItem Property BoSRadiantRewardCaps Auto Const

RefCollectionAlias Property Alias_DungeonBoss Auto Const

GlobalVariable Property BoSR03_FirstCompletion Auto Const
