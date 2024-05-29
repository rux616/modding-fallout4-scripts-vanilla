;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03Acadia_Institute_01013F3A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AcadiaInstituteQuestScript
Quest __temp = self as Quest
DLC03:DLC03AcadiaInstituteQuestScript kmyQuest = __temp as DLC03:DLC03AcadiaInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
;register for faction kick out event
kmyquest.RegisterforCustomEvent(MQ00,"MQFactionKickOut")

;move moseley to his Institute Location
InstMoseley.GetReference().MoveTo(MoseleyInstituteMarker.GetReference())
InstMoseley.GetReference().Enable()

InstMoseley.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
InstSupport01.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
InstSupport02.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Aster.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Chase.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Cog.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Dejen.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Dima.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Faraday.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Kasumi.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Jule.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Miranda.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Naveen.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
if DLC03Acadia_Institute_Misc.IsObjectiveDisplayed(10)
DLC03Acadia_Institute_Misc.SetObjectiveCompleted(10,1)
endif
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
;BEGIN AUTOCAST TYPE DLC03:DLC03AcadiaInstituteQuestScript
Quest __temp = self as Quest
DLC03:DLC03AcadiaInstituteQuestScript kmyQuest = __temp as DLC03:DLC03AcadiaInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
;update misc quest
if DLC03Acadia_Institute_Misc.IsObjectiveDisplayed(10)
DLC03Acadia_Institute_Misc.SetObjectiveCompleted(10,1)
endif
if DLC03Acadia_Institute_Misc.IsObjectiveDisplayed(20)
DLC03Acadia_Institute_Misc.SetObjectiveCompleted(20,1)
endif

;if MQ05 isn't ready, run the timer for enabling actors on island
;but if it is, just set the stage now
if DLC03MQ05.GetStage() < 50
kmyquest.StartAcadiaInstTimer()
else
if InstMoseley.GetReference().Is3DLoaded()==true
SetStage(47)
else
SetStage(50)
endif
endif

;we're hitting this before BoS, so shut down other faction quests
;start by updating global
DLC03CommonwealthFactionOnIsland.SetValue(1)

if DLC03Acadia_Bos.IsRunning()
DLC03Acadia_BoS.SetStage(1000)
endif
if DLC03Acadia_BoS_Misc.IsRunning()
DLC03Acadia_BoS_Misc.SetStage(300)
endif
if DLC03Acadia_RR.IsRunning()
DLC03Acadia_RR.SetStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Disable the Feral Ghoul encounter in this location.
DLC03_POI07EnableMarker.Disable()

InstMoseley.GetReference().MoveTo(InstCampEnableMarker)
InstMoseley.GetActorReference().EvaluatePackage()
InstCampEnableMarker.Enable()
DLC03CommonwealthFactionOnIsland.SetValue(2)

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
;Update objectives
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

;Update defense quest to set faction reactions
DLC03AcadiaDefense.SetStage(100)

;shut down DLC03MQ05 if it's running
if DLC03MQ05.IsRunning()
DLC03MQ05.SetStage(8990)
endif


;Set All Acadia actors to not recover from bleedout

Aster.GetActorRef().SetNoBleedoutRecovery(true)
Chase.GetActorRef().SetNoBleedoutRecovery(true)
Cog.GetActorRef().SetNoBleedoutRecovery(true)
Dejen.GetActorRef().SetNoBleedoutRecovery(true)
DiMA.GetActorRef().SetNoBleedoutRecovery(true)
Faraday.GetActorRef().SetNoBleedoutRecovery(true)
Jule.GetActorRef().SetNoBleedoutRecovery(true)
Kasumi.GetActorRef().SetNoBleedoutRecovery(true)
Miranda.GetActorRef().SetNoBleedoutRecovery(true)
Naveen.GetActorRef().SetNoBleedoutRecovery(true)

;set vars and run exterior scene
InstSupport01.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
InstSupport02.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
DLC03Acadia_Institute_ExteriorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
if DLC03Acadia_Institute_ExteriorScene.IsPlaying()
InstMoseley.GetReference().Disable()
InstSupport01.GetReference().Disable()
InstSupport02.GetReference().Disable()
DLC03Acadia_Institute_ExteriorScene.Stop()
endif
InstMoseley.GetReference().MoveTo(AcadiaExteriorLeaderMarker)

(InstMoseley as TeleportReferenceAlias).TeleportIn()
InstMoseley.GetReference().Enable()
Utility.Wait(0.3)
InstSupport01.GetReference().MoveTo(AcadiaExteriorSupport01Marker)
(InstSupport01 as TeleportReferenceAlias).TeleportIn()
InstSupport01.GetReference().Enable()
Utility.Wait(0.3)
InstSupport02.GetReference().MoveTo(AcadiaExteriorSupport02Marker)
(InstSupport02 as TeleportReferenceAlias).TeleportIn()
InstSupport02.GetReference().Enable()
SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Update Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)

;update Acadia destroyed global
DLC03PlayerAcadiaDestroyed.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
DLC03Acadia_Institute_MoseleyTeleportOutScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
InstMoseley.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
InstSupport01.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
InstSupport02.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Aster.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Chase.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Cog.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Dejen.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Dima.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Faraday.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Kasumi.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Jule.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Miranda.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Naveen.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)

Utility.Wait(0.2)

(InstMoseley as TeleportReferenceAlias).teleportOut()
(Miranda as TeleportReferenceAlias).teleportOut()
(Aster as TeleportReferenceAlias).teleportOut()
(Dima as TeleportReferenceAlias).teleportOut()

Utility.Wait(1.0)
(InstSupport01 as TeleportReferenceAlias).teleportOut()
(Chase as TeleportReferenceAlias).teleportOut()
(Faraday as TeleportReferenceAlias).teleportOut()
(Naveen as TeleportReferenceAlias).teleportOut()
(Jule as TeleportReferenceAlias).teleportOut()

Utility.Wait(1.0)
(InstSupport02 as TeleportReferenceAlias).teleportOut()
(Cog as TeleportReferenceAlias).teleportOut()
(Dejen as TeleportReferenceAlias).teleportOut()

Utility.Wait(1.0)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Kill any active objectives
FailAllObjectives()


;stop misc quest if it's running
if DLC03Acadia_Institute_Misc.IsRunning()==1
if DLC03Acadia_Institute_Misc.IsObjectiveDisplayed(10)
DLC03Acadia_Institute_Misc.SetObjectiveDisplayed(10,abdisplayed=false)
endif
if DLC03Acadia_Institute_Misc.IsObjectiveDisplayed(20)
DLC03Acadia_Institute_Misc.SetObjectiveDisplayed(20,abdisplayed=false)
endif


DLC03Acadia_Institute_Misc.SetStage(300)
endif

;Disable all Far Harbor refs
if InstMoseley.GetReference().Is3dloaded()==False
InstMoseley.GetReference().Disable()
InstCampEnableMarker.Disable()

Stop()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
InstMoseley.GetReference().Disable()
InstCampEnableMarker.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property InstMoseley Auto Const

ObjectReference Property InstCampEnableMarker Auto Const

Quest Property DLC03AcadiaDefense Auto Const Mandatory

ReferenceAlias Property Aster Auto Const

ReferenceAlias Property Chase Auto Const

ReferenceAlias Property Cog Auto Const

ReferenceAlias Property Dejen Auto Const

ReferenceAlias Property DiMA Auto Const

ReferenceAlias Property Faraday Auto Const

ReferenceAlias Property Kasumi Auto Const

ReferenceAlias Property Jule Auto Const

ReferenceAlias Property Miranda Auto Const

ReferenceAlias Property Naveen Auto Const

ReferenceAlias Property InstSupport01 Auto Const

ReferenceAlias Property InstSupport02 Auto Const

ReferenceAlias Property CourserSupport01 Auto Const

GlobalVariable Property DLC03PlayerAcadiaDestroyed Auto Const Mandatory

ObjectReference Property DLC03_POI07EnableMarker Auto Const Mandatory

Quest Property DLC03MQ05 Auto Const Mandatory

Quest Property DLC03Acadia_Institute_Misc Auto Const Mandatory

MQ00Script Property MQ00 Auto Const Mandatory


ReferenceAlias Property MoseleyInstituteMarker Auto Const

Quest Property DLC03Acadia_BoS Auto Const Mandatory

Quest Property DLC03Acadia_BoS_Misc Auto Const Mandatory

Quest Property DLC03Acadia_RR Auto Const Mandatory

GlobalVariable Property DLC03CommonwealthFactionOnIsland Auto Const Mandatory

ActorValue Property TeleportRefCollOptionalRequired Auto Const Mandatory

Scene Property DLC03Acadia_Institute_ExteriorScene Auto Const Mandatory

ObjectReference Property AcadiaExteriorLeaderMarker Auto Const

ObjectReference Property AcadiaExteriorSupport01Marker Auto Const

ObjectReference Property AcadiaExteriorSupport02Marker Auto Const

Scene Property DLC03Acadia_Institute_MoseleyTeleportOutScene Auto Const Mandatory
