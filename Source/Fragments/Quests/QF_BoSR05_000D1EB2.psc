;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSR05_000D1EB2 Extends Quest Hidden Const

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
BoSTeaganIntroDone.SetValue(1)

;Player in BoS; Training missions, if any, done.
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPrydwenArrived.SetValue(1)
BoSPlayerRank.SetValue(2)
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSDoors.Enable()

;Move Teagan into position
Actor Teagan = Alias_BoSR05Teagan.GetActorRef()
Teagan.EvaluatePackage()
Teagan.MoveToPackageLocation()

;Move Player into position
Game.GetPlayer().Moveto(BoSTeaganCounterPlayerMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Show the objective for the settlement leader
SetObjectiveDisplayed(10,1)

;Show map marker
Alias_SettlementMapMarker.GetRef().AddToMap()

;Set global that tracks if the player is knowingly on the quest.
BoSRadiantOnMission_Teagan.SetValue(1)

;Check to see if leader has already been killed. If so, set stage to 40 to turn in.
If GetStageDone(35) == 1
     SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Check to see if the player is knowingly on the quest.
If GetStageDone(30) == 1
     SetStage(40)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE BOSR05Script
Quest __temp = self as Quest
BOSR05Script kmyQuest = __temp as BOSR05Script
;END AUTOCAST
;BEGIN CODE
;Show control message for the Settlement
BoSR05ControlMessage.Show()

;Complete objective for settlement leader
SetObjectiveCompleted(10,1)

;Show the objective for proctor
SetObjectiveDisplayed(20,1)

;Set the workshop ownership to the player
; KMK - don't do this, or you're adding it to the player's Minutemen network
;(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)

; lower happiness level, for owned/future settlement
kmyQuest.ModifyWorkshopHappiness(-50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Give player reward
Game.GetPlayer().AddItem(BoSRadiantRewardCaps,1)

;Complete objectives and quest
CompleteQuest()
CompleteAllObjectives()

;Go to shutdown
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
CompleteAllObjectives()
BoSRadiantOnMission_Teagan.SetValue(0)

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

ReferenceAlias Property Alias_BoSR05Teagan Auto Const

ObjectReference Property BoSTeaganCounterMarker Auto Const

ObjectReference Property BoSTeaganCounterPlayerMarker Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS100Fight Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS201B Auto Const

Quest Property BoSDialoguePrydwen Auto Const

Quest Property BoSEnable Auto Const

GlobalVariable Property BoSTeaganIntroDone Auto Const

GlobalVariable Property BoSTraining Auto Const

GlobalVariable Property BoSJoined Auto Const

GlobalVariable Property BoSPrydwenArrived Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

ObjectReference Property BoSDoors Auto Const

Quest Property BoS000 Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

LeveledItem Property BoSRadiantRewardCaps Auto Const

Message Property BoSR05ControlMessage Auto Const

GlobalVariable Property BoSRadiantOnMission_Teagan Auto Const

LocationAlias Property Alias_Settlement Auto Const Mandatory

ReferenceAlias Property Alias_SettlementSpokesman Auto Const Mandatory
