;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinVsInst_00055BE4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(InstituteFaction)
(MinutemenCentralQuest as MinutemenCentralScript).MinutemenProgress = 3

SetStage(10)

;Game.GetPlayer().MoveTo(Shaun.GetReference())
InstituteMapMarker.AddToMap(true)

;Start running scenes
MVIFatherStage10PreSceneLoop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(InstituteFaction)
SetStage(10)
;Game.GetPlayer().MoveTo(Shaun.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinVsInstQuestScript
Quest __temp = self as Quest
MinVsInstQuestScript kmyQuest = __temp as MinVsInstQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

;start up initial scene, but only if player isn't around
If Game.GetPlayer().IsInLocation(InstituteConcourseLocation) == 0
Dean.GetReference().Moveto(Shaun.GetReference(), 100, 100, 0)
MVIFatherStage10PreSceneLoop.Start()
kmyquest.PreSceneRunning=1
endif

Enrico.GetReference().Disable()


;Set internal variable based on State of MinutemenCentralQuest
; 1 for Minutemen, 2 for Gunners

if (MinutemenCentralQuest as MinutemenCentralScript).MinutemenProgress >= 3
kmyquest.Opposition= 1

else
kmyquest.Opposition=2

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinVsInstQuestScript
Quest __temp = self as Quest
MinVsInstQuestScript kmyQuest = __temp as MinVsInstQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

ExteriorSynth01.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
ExteriorSynth02.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
InteriorSynth01.GetActorReference().SetCrimeFaction(CrimeInstitute)
InteriorSynth01.GetActorReference().AddToFaction(InstituteFaction)
InteriorSynth02.GetActorReference().AddtoFaction(InstituteFaction)
InteriorSynth02.GetActorReference().SetCrimeFaction(CrimeInstitute)
ExteriorSynth01.GetActorReference().SetCrimeFaction(CrimeInstitute)
ExteriorSynth01.GetActorReference().AddToFaction(InstituteFaction)
ExteriorSynth02.GetActorReference().SetCrimeFaction(CrimeInstitute)
ExteriorSynth02.GetActorReference().AddToFaction(InstituteFaction)

DoorTalkingActivator.GetReference().Enable()

;Move Enrico to the house
Enrico.GetReference().MoveTo(EnricoMarker.GetReference())
Enrico.GetActorReference().EvaluatePackage()
Enrico.GetActorReference().SetOutfit(InstituteJumpsuitHelmetOutfit)
;Enable Wallace in the house
Wallace.GetReference().Enable()

;Enable Opponents
if kmyquest.Opposition== 1
MinutemanContact.GetReference().Enable()
Minuteman2.GetReference().Enable()
Minuteman3.GetReference().Enable()
Minuteman4.GetReference().Enable()
Minuteman5.GetReference().Enable()
elseif kmyquest.Opposition == 2
Gunner1.GetReference().Enable()
Gunner2.GetReference().Enable()
Gunner3.GetReference().Enable()
Gunner4.GetReference().Enable()
Gunner5.GetReference().Enable()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;If Minutemen Active

if (MinutemenCentralQuest as MinutemenCentralScript).MinutemenProgress >= 3
SetObjectiveDisplayed(30)
else
SetObjectiveDisplayed(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
if (MinutemenCentralQuest as MinutemenCentralScript).MinutemenProgress>= 3
If IsObjectiveCompleted(20)==0
SetObjectiveCompleted(20)
endif
SetObjectiveCompleted(30)
else
SetObjectiveCompleted(20)
endif
SetObjectiveDisplayed(40)
MinVsInstSynthEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(40)==1
SetObjectiveCompleted(40)
endif
If IsObjectiveDisplayed(30)==1
SetObjectiveCompleted(30)
endif
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
MinVsInstDoorActivatorRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(80,1)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_InstVsMinRecruitedCivilianAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Inst305.Start()
;Update Global for Radio News
RadioDCInstMinVInstReady.SetValue((GameDaysPassed.GetValue() + 1))
DoorTalkingActivator.GetReference().Disable()


;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
DoorTalkingActivator.GetReference().Disable()
If Wallace.GetActorReference().IsDead()==False
(Wallace as TeleportREferenceAlias).TeleportOut()
Utility.Wait(1.0)
Wallace.GetReference().Disable()
BathroomDoor.Unlock()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Alias Property ObservatoryMapMarker Auto Const

Quest Property MinutemenCentralQuest Auto Const

ReferenceAlias Property Enrico Auto Const

ReferenceAlias Property EnricoMarker Auto Const

ReferenceAlias Property MinutemanContact Auto Const

ReferenceAlias Property Minuteman2 Auto Const

ReferenceAlias Property Minuteman3 Auto Const

ReferenceAlias Property Minuteman4 Auto Const

ReferenceAlias Property Minuteman5 Auto Const

ReferenceAlias Property Gunner1 Auto Const

ReferenceAlias Property Gunner2 Auto Const

ReferenceAlias Property Gunner3 Auto Const

ReferenceAlias Property Gunner4 Auto Const

ReferenceAlias Property Gunner5 Auto Const

ReferenceAlias Property Wallace Auto Const

ObjectReference Property BathroomDoor Auto Const

Faction Property InstituteFaction Auto Const

Faction Property MinutemenFaction Auto Const

Faction Property PlayerFaction Auto Const

ReferenceAlias Property Shaun Auto Const

ObjectReference Property InstituteMapMarker Auto Const

GlobalVariable Property RadioDCInstMinVInstReady Auto Const

GlobalVariable Property GameDaysPassed Auto Const

Scene Property MVIFatherStage10PreSceneLoop Auto Const

ObjectReference Property MinVsInstDoorActivatorRef Auto Const

ObjectReference Property MinVsInstSynthEnableMarker Auto Const

ReferenceAlias Property Dean Auto Const

Quest Property Inst305 Auto Const

Outfit Property InstituteJumpsuitHelmetOutfit Auto Const

ReferenceAlias Property DoorTalkingActivator Auto Const

ReferenceAlias Property ExteriorSynth01 Auto Const

ReferenceAlias Property ExteriorSynth02 Auto Const

ActorValue Property TeleportRefCollOptionalRequired Auto Const

Cell Property InstituteConcourse Auto Const Mandatory

Location Property InstituteConcourseLocation Auto Const Mandatory

ActorValue Property COMQC_InstVsMinRecruitedCivilianAV Auto Const

ReferenceAlias Property InteriorSynth01 Auto Const

ReferenceAlias Property InteriorSynth02 Auto Const

Faction Property CrimeInstitute Auto Const Mandatory
