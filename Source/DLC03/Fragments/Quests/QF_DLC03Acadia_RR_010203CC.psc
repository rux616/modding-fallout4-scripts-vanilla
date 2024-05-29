;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03Acadia_RR_010203CC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_RRQuestScript
Quest __temp = self as Quest
DLC03:DLC03Acadia_RRQuestScript kmyQuest = __temp as DLC03:DLC03Acadia_RRQuestScript
;END AUTOCAST
;BEGIN CODE
;register for faction kick out event
kmyquest.RegisterforCustomEvent(MQ00,"MQFactionKickOut")

SetObjectiveDisplayed(10)
Alias_RRContact.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
SetObjectiveCompleted(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
SetObjectiveCompleted(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_RRQuestScript
Quest __temp = self as Quest
DLC03:DLC03Acadia_RRQuestScript kmyQuest = __temp as DLC03:DLC03Acadia_RRQuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;if we're hitting this after MQ05 stage 250, run timer to move actor up to Acadia

if DLC03MQ05.GetStageDone(250)
kmyquest.StartAcadiaRRTimer()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_RRContact.GetReference().MoveTo(DLC03FactionAcadiaMarker)
Alias_RRContact.GetActorRef().AddtoFaction(DLC03AcadiaFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
SetObjectiveDisplayed(10,abdisplayed=false)
endif
if Alias_RRContact.GetReference().Is3dLoaded()==False
Alias_RRContact.GetReference().Disable()
Stop()
else
SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_RRContact.GetReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RRContact Auto Const Mandatory

ObjectReference Property DLC03FactionAcadiaMarker Auto Const Mandatory

Quest Property DLC03MQ05 Auto Const Mandatory

MQ00Script Property MQ00 Auto Const Mandatory

Faction Property DLC03AcadiaFaction Auto Const Mandatory
