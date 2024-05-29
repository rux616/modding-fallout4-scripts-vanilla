;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQPostQuestRadiantAs_01003E8A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;While we're here, populate the Defender Patrol Points, which also don't persist.
Alias_Defender01PatrolPoint.ForceRefTo(Alias_Defender01Marker.GetReference().GetLinkedRef(RELinkPatrol))
Alias_Defender02PatrolPoint.ForceRefTo(Alias_Defender02Marker.GetReference().GetLinkedRef(RELinkPatrol))
Alias_Defender03PatrolPoint.ForceRefTo(Alias_Defender03Marker.GetReference().GetLinkedRef(RELinkPatrol))
Alias_Defender04PatrolPoint.ForceRefTo(Alias_Defender04Marker.GetReference().GetLinkedRef(RELinkPatrol))
Alias_Defender05PatrolPoint.ForceRefTo(Alias_Defender05Marker.GetReference().GetLinkedRef(RELinkPatrol))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
; tell script about trigger since we're not starting from a story event
RETriggerScript myTrigger = Alias_Trigger.GetRef() as RETriggerScript
kmyQuest.SetTrigger(myTrigger)
kmyquest.Startup()
((self as Quest) as REAssaultQuestScript).InitAssault()
; turn off trigger
(Alias_Trigger.GetRef() as RETriggerScript).QuestStarted(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; first objective
SetObjectiveDisplayed(100)

DLC01PlayerOnRadiant.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as REAssaultQuestScript).StartAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
Debug.Trace("Defending faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
; also means attacking robot is dead
SetStage(200)
; if player helped, make defenders grateful
if GetStageDone(35)
	; if player helped, add farmers to rescued dialogue faction
	Alias_Defender01.GetActorRef().AddToFaction(REDialogueRescued)
	Alias_Defender02.GetActorRef().AddToFaction(REDialogueRescued)
	Alias_Defender03.GetActorRef().AddToFaction(REDialogueRescued)
	Alias_Defender04.GetActorRef().AddToFaction(REDialogueRescued)
	Alias_Defender05.GetActorRef().AddToFaction(REDialogueRescued)
	kmyQuest.RegisterForWorkshopAddActor()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Debug.Trace("Attacking faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01RadiantQuestScript
Quest __temp = self as Quest
DLC01:DLC01RadiantQuestScript kmyQuest = __temp as DLC01:DLC01RadiantQuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyQuest.CompleteQuest()
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
; now can shut down when everything unloads
kmyQuest.StopQuestWhenAliasesUnloaded = true

DLC01PlayerOnRadiant.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
((Self as Quest) as REAssaultQuestScript).CleanupAssault()
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Attacker01Links Auto Const
ReferenceAlias Property Alias_Attacker02Links Auto Const
ReferenceAlias Property Alias_Attacker03Links Auto Const
ReferenceAlias Property Alias_Attacker04Links Auto Const
ReferenceAlias Property Alias_Attacker05Links Auto Const
ReferenceAlias Property Alias_Defender01Links Auto Const
ReferenceAlias Property Alias_Defender02Links Auto Const
ReferenceAlias Property Alias_Defender03Links Auto Const
ReferenceAlias Property Alias_Defender04Links Auto Const
ReferenceAlias Property Alias_Defender05Links Auto Const

ReferenceAlias Property Alias_Defender01Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender02Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender03Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender01PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender02PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender04Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender05Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender03PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender04PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender05PatrolPoint Auto Const Mandatory

Keyword Property RELinkPatrol Auto Const Mandatory

ReferenceAlias Property Alias_Defender01 Auto Const Mandatory

ReferenceAlias Property Alias_Defender02 Auto Const Mandatory

ReferenceAlias Property Alias_Defender03 Auto Const Mandatory

ReferenceAlias Property Alias_Defender04 Auto Const Mandatory

ReferenceAlias Property Alias_Defender05 Auto Const Mandatory

Faction Property REDialogueRescued Auto Const Mandatory

GlobalVariable Property DLC01PlayerOnRadiant Auto Const Mandatory
