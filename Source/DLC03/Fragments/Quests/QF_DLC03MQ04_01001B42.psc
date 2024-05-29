;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ04_01001B42 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
; move to return marker
Game.GetPlayer().MoveTo(kmyQuest.DLC03MQ04PlayerReturnMarker)
DLC03MQ03.SetStage(300)
DLC03MQ03.SetStage(400)
DLC03MQ03.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; start other memory quests
DLC03MQ04_01.Start()
DLC03MQ04_02.Start()
DLC03MQ04_03.Start()
DLC03MQ04_04.Start()
DLC03MQ04_05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
DLC03MQ03.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
Alias_NucleusMapMarker.Getref().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

;shut down DLC03MQ03
DLC03MQ03.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
;turn off the main memory objective temporarily until the tutorials are done
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102, abDisplayed=False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102, abDisplayed=False)
SetObjectiveDisplayed(104)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102, abDisplayed=False)
SetObjectiveDisplayed(104, abDisplayed=False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102, abDisplayed=False)
SetObjectiveDisplayed(104, abDisplayed=False)
SetObjectiveDisplayed(106)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0107_Item_00
Function Fragment_Stage_0107_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102, abDisplayed=False)
SetObjectiveDisplayed(104, abDisplayed=False)
SetObjectiveDisplayed(106, abDisplayed=False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0108_Item_00
Function Fragment_Stage_0108_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100, abDisplayed=False)
SetObjectiveDisplayed(102, abDisplayed=False)
SetObjectiveDisplayed(104, abDisplayed=False)
SetObjectiveDisplayed(106, abDisplayed=False)
SetObjectiveDisplayed(108)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0109_Item_00
Function Fragment_Stage_0109_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(102, abDisplayed=False)
SetObjectiveDisplayed(104, abDisplayed=False)
SetObjectiveDisplayed(106, abDisplayed=False)
SetObjectiveDisplayed(108, abDisplayed=False)

;turn the main memory objective back on
If GetStageDone(150) == 0
  SetObjectiveDisplayed(100, abDisplayed=True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(100, false)
DLC03MQ04_01.SetStage(200)
kmyQuest.CheckForCompletion()

;safety turn off all tutorial objectives
SetStage(109)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(160)
DLC03VimPopHQMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
; Was this set from destroying Far Harbor?
if ( DLC03MQ06_WindFarmHandling.GetStageDone(50) )
  SetObjectiveDisplayed(160, FALSE)  ; If not hide it
else
  SetObjectiveCompleted(160)
endif

kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(200, false)
DLC03MQ04_02.SetStage(200)
kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
;If the player hasn't hit either of the appropriate stages to activate this objective, pull it
if !DLC03MQ06_NukeHandling.GetStageDone(7) && !DLC03MQ06_NukeHandling.GetStageDone(10)
    SetObjectiveDisplayed(260, false)
else
 ;Otherwise, complete the objective
  SetObjectiveCompleted(260)
endif

kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(300, false)
DLC03MQ04_03.SetStage(200)
kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
;If the player hasn't hit either of the appropriate stages to activate this objective, pull it
if !DLC03MQ06_WindFarmHandling.GetStageDone(10) && !DLC03MQ06_WindFarmHandling.GetStageDone(50)
    SetObjectiveDisplayed(360, false)
else
 ;Otherwise, complete the objective
  SetObjectiveCompleted(360)
endif

kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(400, false)
DLC03MQ04_04.SetStage(200)
kmyQuest.CheckForCompletion()
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
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(500, false)
DLC03MQ04_05.SetStage(200)
kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE dlc03:mq04masterscript
Quest __temp = self as Quest
dlc03:mq04masterscript kmyQuest = __temp as dlc03:mq04masterscript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(100) && IsObjectiveCompleted(100) == false
	SetObjectiveFailed(100)
	SetStage(150)
endif
if IsObjectiveDisplayed(200) && IsObjectiveCompleted(200) == false
	SetObjectiveFailed(200)
	SetStage(250)
endif
if IsObjectiveDisplayed(300) && IsObjectiveCompleted(300) == false
	SetObjectiveFailed(300)
	SetStage(350)
endif
if IsObjectiveDisplayed(400) && IsObjectiveCompleted(400) == false
	SetObjectiveFailed(400)
	SetStage(450)
endif
if IsObjectiveDisplayed(500) && IsObjectiveCompleted(500) == false
	SetObjectiveFailed(500)
	SetStage(550)
endif

if IsObjectiveDisplayed(50) && IsObjectiveCompleted(50) == false
	SetObjectiveFailed(50)
endif

if IsObjectiveDisplayed(60) && IsObjectiveCompleted(60) == false
	SetObjectiveFailed(60)
endif

;WJS - we can no longer retrieve memories, so make sure the memory stages are set for future CheckForCompletion() calls
SetStage(150)
SetStage(250)
SetStage(350)
SetStage(450)
SetStage(550)

; if none of the additional objectives have been started, OK to complete (player won't be able to get those objectives now)
if GetStageDone(160) == false && GetStageDone(260) == false && GetStageDone(360) == false
	SetStage(2000)
; WJS - if all of the additional objectives have been completed, OK to complete
elseIf GetStageDone(165) == true && GetStageDone(270) == True && GetStageDone(370) == True
	SetStage(2000)
Else
	kmyQuest.CheckForCompletion()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC03:MQ04Script Property DLC03MQ04_02 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_01 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_03 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_04 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_05 Auto Const Mandatory

Quest Property DLC03MQ03 Auto Const Mandatory

ReferenceAlias Property Alias_NucleusMapMarker Auto Const Mandatory

ObjectReference Property DLC03VimPopHQMapMarker Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory

Quest Property DLC03MQ06_WindFarmHandling Auto Const Mandatory
