;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03Acadia_BoS_01013F39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_BOSQuestScript
Quest __temp = self as Quest
DLC03:DLC03Acadia_BOSQuestScript kmyQuest = __temp as DLC03:DLC03Acadia_BOSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForCustomEvent(MQ00, "MQFactionKickOut")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_BOSQuestScript
Quest __temp = self as Quest
DLC03:DLC03Acadia_BOSQuestScript kmyQuest = __temp as DLC03:DLC03Acadia_BOSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForCustomEvent(MQ00, "MQFactionKickOut")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
if GetStageDone(22) && GetStageDone(23)
SetStage(30)
elseif GetStageDone(23) && GetStageDone(24)
SetStage(30)
elseif GetStageDone(22) && GetStageDone(24)
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
if GetStageDone(21) && GetStageDone(23)
SetStage(30)
elseif GetStageDone(23) && GetStageDone(24)
SetStage(30)
elseif GetStageDone(21) && GetStageDone(24)
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
if GetStageDone(22) && GetStageDone(21)
SetStage(30)
elseif GetStageDone(21) && GetStageDone(24)
SetStage(30)
elseif GetStageDone(22) && GetStageDone(24)
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
if GetStageDone(22) && GetStageDone(23)
SetStage(30)
elseif GetStageDone(23) && GetStageDone(21)
SetStage(30)
elseif GetStageDone(22) && GetStageDone(21)
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_BOSQuestScript
Quest __temp = self as Quest
DLC03:DLC03Acadia_BOSQuestScript kmyQuest = __temp as DLC03:DLC03Acadia_BOSQuestScript
;END AUTOCAST
;BEGIN CODE
if DLC03MQ05.GetStage() < 50
kmyquest.StartAcadiaBoSTimer()
else
SetStage(50)
endif

;complete misc objective
if DLC03Acadia_BoS_Misc.IsObjectiveDisplayed(10)
DLC03Acadia_BoS_Misc.SetObjectiveCompleted(10,1)
endif
if DLC03Acadia_BoS_Misc.IsObjectiveDisplayed(20)
DLC03Acadia_BoS_Misc.SetObjectiveCompleted(20,1)
endif

;we're the first one hitting that point, so shut down everything else
;start by setting global to 1
DLC03CommonwealthFactionOnIsland.SetValue(1)

if DLC03Acadia_RR.IsRunning()
DLC03Acadia_RR.SetStage(600)
endif
if DLC03Acadia_Institute.IsRunning()
DLC03Acadia_Institute.SetStage(1000)
endif
if DLC03Acadia_Institute_Misc.IsRunning()
DLC03Acadia_Institute_Misc.SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Disable the Feral Ghoul encounter in this location.
DLC03_POI07EnableMarker.Disable()

;enable actors and camp
Larsen.GetReference().Enable()
CampEnableMarker.Enable()

DLC03CommonwealthFactionOnIsland.SetValue(2)

;if MQ is ready, go ahead and update to stage 100
if DLC03MQ05.GetStage() >= 250
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

;shut down DLC03MQ05 if it's running
if DLC03MQ05.IsRunning()
DLC03MQ05.SetStage(8990)
endif

; start vertibird quest
DLC03Acadia_BoSVertibird.Start()

;update defense quest to set Acadia hostile
DLC03AcadiaDefense.SetStage(100)
DLC03AcadiaMapMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;move actors to spots outside Acadia in lieu of vertibird flight
;Utility.Wait(1)
;Larsen.GetRef().Moveto(DLC03AcadiaAttackLeaderMarker)
;Larsen.GetActorRef().EvaluatePackage()
;BosSupport01.GetRef().MoveTo(DLC03AcadiaAttackSupportMarker01)
;BoSSupport01.GetActorRef().EvaluatePackage()
;BoSSupport02.GetRef().Moveto(DLC03AcadiaAttackSupportMarker02)
;BoSSupport02.GetActorRef().EvaluatePackage()
;Utility.Wait(1)
;ExteriorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Larsen.GetActorRef().EvaluatePackage()
BoSSupport01.GetActorReference().EvaluatePackage()
BoSSupport02.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
if GetStageDone(260) == 0
SetStage(260)
;Larsen.GetReference().Moveto(Game.GetPlayer())
;Larsen.GetActorReference().EvaluatePackage()
;BosSupport01.GetReference().MoveTo(Game.GetPlayer())
;BoSSupport01.GetActorReference().EvaluatePackage()
;BoSSupport02.GetReference().MoveTo(Game.GetPlayer())
;BoSSupport02.GetActorReference().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)

;vertibird scene has to stop so we can talk to Larsen
DLC03Acadia_BoSVertibirdScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
DLC03AcadiaMapMarker.Enable()
DLC03VertibirdReady.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Larsen.GetReference().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Kill any active objectives
FailAllObjectives()

;also stop misc quest if it's running

if DLC03Acadia_Bos_Misc.IsRunning() ==1
if DLC03Acadia_BoS_Misc.IsObjectiveDisplayed(10)
DLC03Acadia_BoS_Misc.SetObjectiveDisplayed(10, abdisplayed=false)
endif
if DLC03Acadia_Bos_Misc.IsObjectiveDisplayed(20)
DLC03Acadia_BoS_Misc.SetObjectiveDisplayed(20,abdisplayed=false)
endif
DLC03Acadia_Bos_Misc.SetStage(300)
endif

;Disable all Far Harbor refs
if Larsen.GetReference().Is3dloaded()==False
Larsen.GetReference().Disable()


endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Larsen Auto Const

Quest Property DLC03MQ05 Auto Const Mandatory

Quest Property DLC03AcadiaDefense Auto Const Mandatory


ObjectReference Property DLC03AcadiaAttackLeaderMarker Auto Const Mandatory

Scene Property ExteriorScene Auto Const

ObjectReference Property CampEnableMarker Auto Const

ObjectReference Property DLC03AcadiaAttackSupportMarker01 Auto Const Mandatory

ObjectReference Property DLC03AcadiaAttackSupportMarker02 Auto Const Mandatory

ReferenceAlias Property BoSSupport01 Auto Const

ReferenceAlias Property BosSupport02 Auto Const

ObjectReference Property DLC03_POI07EnableMarker Auto Const Mandatory

MQ00Script Property MQ00 Auto Const Mandatory

Quest Property DLC03Acadia_BoS_Misc Auto Const Mandatory

GlobalVariable Property DLC03VertibirdReady Auto Const Mandatory

Quest Property DLC03Acadia_BoSVertibird Auto Const Mandatory

Quest Property DLC03Acadia_Institute Auto Const Mandatory

Quest Property DLC03Acadia_Institute_Misc Auto Const Mandatory

Quest Property DLC03Acadia_RR Auto Const Mandatory

GlobalVariable Property DLC03CommonwealthFactionOnIsland Auto Const Mandatory

Scene Property DLC03Acadia_BoSVertibirdScene Auto Const Mandatory

ObjectReference Property DLC03AcadiaMapMarker Auto Const Mandatory
