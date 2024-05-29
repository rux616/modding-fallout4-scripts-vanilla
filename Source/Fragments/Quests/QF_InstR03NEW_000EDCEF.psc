;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstR03NEW_000EDCEF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Add the player to the Institute Faction, which is necessary for some faction interactions
Game.GetPlayer().AddToFaction(InstituteFaction)

;Add the Institute map marker
InstituteMapMarker.AddToMap(True)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
; tell script about trigger since we're not starting from a story event
RETriggerScript myTrigger = Alias_Trigger.GetRef() as RETriggerScript
kmyQuest.SetTrigger(myTrigger)
; NOTE: this has to be called before Startup so myTrigger is set on REScript
kmyquest.Startup()
((self as Quest) as REAssaultQuestScript).InitAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set if the player passes the speech challenge with the synth scavenger
;Give the player 4 fusion cells

Game.GetPlayer().AddItem(AmmoFusionCell, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set during Questgiver's end scene when he takes the blueprints from the player.

;Add the report to Questgiver
Alias_Questgiver.GetActorReference().AddItem(Alias_Item.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set if the player refuses the quest
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

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;When the trigger loads, move the item to the RE's Container and update the quest target.

;Find the container.
ObjectReference[] links = Alias_TRIGGER.GetReference().GetRefsLinkedToMe(RELinkMarker)
int i = 0
While (i < links.Length)
     if (links[i].HasLocRefType(REContainer))
          Alias_Container.ForceRefTo(links[i])
          Alias_Container.GetReference().AddItem(Alias_Item.GetReference())
          i = links.Length
     EndIf
     i = i + 1
EndWhile
;If no container is found, warn.
if (Alias_Container.GetReference() == None)
     Debug.Trace("No container found for trigger: " + Alias_TRIGGER.GetReference(), 3)
EndIf

;While we're here, populate the Defender Patrol Points, which also don't persist.
Alias_Defender01PatrolPoint.ForceRefTo(Alias_Defender01Marker.GetReference().GetLinkedRef(RELinkPatrol))
Alias_Defender02PatrolPoint.ForceRefTo(Alias_Defender02Marker.GetReference().GetLinkedRef(RELinkPatrol))
Alias_Defender03PatrolPoint.ForceRefTo(Alias_Defender03Marker.GetReference().GetLinkedRef(RELinkPatrol))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as REAssaultQuestScript).StartAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Debug.Trace("Defending faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Debug.Trace("Attacking faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; TODO - shut down this quest when appropriate
; for template, shut down immediately - real quest would likely have additional objective to report back to questgiver etc.
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Give Reward NO LONGER USED
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

;Set the Global so the game knows the quest has been completed at least once (dialogue condition)
InstR03Global.SetValue(1)

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
;Remove the item from the questgiver
Alias_Questgiver.GetActorReference().RemoveItem(Alias_Item.GetReference())

debug.trace(self + " STOPPING")
((Self as Quest) as REAssaultQuestScript).CleanupAssault()
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnQuestInit()
                ; register for events
                ; RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
                ; watch for player to change location
                if akSender == Game.GetPlayer() && akOldLoc == InstituteLocation && InstR03New.GetStageDone(900)
                                ; CHECK FOR old/new location matching whatever you want, quest stage, etc.- then DO SOMETHING!!
                	InstR03New.Stop()
                	; if quest is on stage 900 (completion stage), stop the quest
                	; This allows the quest to restart when the player returns to the Institute later
                endif
EndEvent

Quest Property InstR03New Auto Const
Location Property InstituteLocation Auto Const
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
ReferenceAlias Property Alias_MapMarker Auto Const
Ammo Property AmmoFusionCell Auto Const
GlobalVariable Property XPRadiant Auto Const
GlobalVariable Property InstR03Global Auto Const
ReferenceAlias Property Alias_Item Auto Const
ReferenceAlias Property Alias_QuestGiver Auto Const

ObjectReference Property InstituteMapMarker Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property Alias_Container Auto Const Mandatory

LocationRefType Property REContainer Auto Const Mandatory

Keyword Property RELinkMarker Auto Const Mandatory

Keyword Property RELinkPatrol Auto Const Mandatory

ReferenceAlias Property Alias_Defender01PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender02PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender03PatrolPoint Auto Const Mandatory

ReferenceAlias Property Alias_Defender01Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender02Marker Auto Const Mandatory

ReferenceAlias Property Alias_Defender03Marker Auto Const Mandatory
