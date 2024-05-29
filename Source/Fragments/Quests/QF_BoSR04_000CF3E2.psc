;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSR04_000CF3E2 Extends Quest Hidden Const

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
BoS201B.SetStage(255)
BoSDialoguePrydwen.SetStage(20)
BoSQuinlanIntroDone.SetValue(1)

;Player in BoS; Training missions, if any, done.
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPrydwenArrived.SetValue(1)
BoSPlayerRank.SetValue(2)
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSDoors.Enable()

;Move Quinlan into position
Actor Quinlan = Alias_BoSR04Quinlan.GetActorRef()
Quinlan.EvaluatePackage()
Quinlan.MoveToPackageLocation()

;Move Player into position
Game.GetPlayer().Moveto(pBoSQuinlanCounterPlayerMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;reset the dungeon location
Dungeon.GetLocation().Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Show the objective for the scribe
SetObjectiveDisplayed(10,1)

;Enable the scribe
Alias_BoSR04Scribe.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
;Show the objective for the scribe
SetObjectiveDisplayed(10,1)

;Enable the scribe
Alias_BoSR04Scribe.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Complete objective for scribe
SetObjectiveCompleted(10,1)

;Show the objective for dungeon
SetObjectiveDisplayed(25,1)

;Set squire to follow
Alias_BoSR04Scribe.GetActorRef().FollowerFollow()
Alias_BoSR04Scribe.GetActorRef().EvaluatePackage()

;Show map marker
Alias_DungeonMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
;Complete objective for scribe
SetObjectiveCompleted(10,1)

;Show the objective for dungeon
SetObjectiveDisplayed(25,1)

;Set squire to follow
Alias_BoSR04Scribe.GetActorRef().FollowerFollow()
Alias_BoSR04Scribe.GetActorRef().EvaluatePackage()

;Show map marker
Alias_DungeonMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Complete objective for data
SetObjectiveCompleted(25,1)

;Show the objective for scribe
SetObjectiveDisplayed(30,1)

;Send the scribe to collect data
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
;Complete objective for data
SetObjectiveCompleted(25,1)

;Show the objective for scribe
SetObjectiveDisplayed(30,1)

;Send the scribe to collect data
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Complete objective for data
SetObjectiveCompleted(30,1)

;Show the objective for proctor
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_01
Function Fragment_Stage_0060_Item_01()
;BEGIN CODE
;Complete objective for data
SetObjectiveCompleted(30,1)

;Show the objective for proctor
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
debug.trace(self + " Despawn scribe")
Alias_BoSR04Scribe.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Give player reward
Game.GetPlayer().AddItem(BoSRadiantRewardCaps,1)

;Complete objectives and quest
CompleteAllObjectives()
CompleteQuest()

;Go to shutdown
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveFailed(25)
SetObjectiveFailed(30)
SetObjectiveDisplayed(40)
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

ObjectReference Property pBoSQuinlanCounterMarker Auto Const

ReferenceAlias Property Alias_BoSR04Quinlan Auto Const

ObjectReference Property pBoSQuinlanCounterPlayerMarker Auto Const

ReferenceAlias Property Alias_BoSR04Scribe Auto Const

Faction Property pBrotherhoodofSteelFaction Auto Const

ReferenceAlias Property Alias_Data01 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

GlobalVariable Property BoSTraining Auto Const

GlobalVariable Property BoSJoined Auto Const

GlobalVariable Property BoSPrydwenArrived Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

Quest Property BoSEnable Auto Const

Quest Property BoS101 Auto Const

Quest Property BoSDialoguePrydwen Auto Const

GlobalVariable Property BoSQuinlanIntroDone Auto Const

LocationAlias Property Dungeon Auto Const

ObjectReference Property BoSDoors Auto Const

Quest Property BoS000 Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

LeveledItem Property BoSRadiantRewardCaps Auto Const
