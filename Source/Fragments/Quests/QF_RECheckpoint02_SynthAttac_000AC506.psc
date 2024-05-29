;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECheckpoint02_SynthAttac_000AC506 Extends Quest Hidden Const

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

; NOTE: this has to be called before Startup so myTrigger is set on REScript
kmyquest.Startup()

;Initialize attackers
((self as Quest) as RECheckpointQuestScript).InitAttackers()

;Register defenders for death in REScript (as we can't set them manually)
kmyquest.SetDeadCounts(0, Alias_DefenderCollection.GetCount())

;Register attackers for distance events with player
((self as Quest) as RECheckpointQuestScript).RegisterAttackerDistanceEvent()

;Register center marker for distance events with player
((self as Quest) as RECheckpointPlayerDistanceScript).RegisterPlayerObjectiveDistanceEvent()

;Set RECheckpointMostRecentGlobal to prevent this one from appearing again
RECheckpointMostRecentGlobal.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE RECheckpointQuestScript
Quest __temp = self as Quest
RECheckpointQuestScript kmyQuest = __temp as RECheckpointQuestScript
;END AUTOCAST
;BEGIN CODE
;When the player moves in range, begin the assault.
kmyquest.StartAssault()

;No longer need attacker distance events
kmyquest.UnregisterForAttackDistanceEvents()

;Make sure attackers and defenders are in combat. If so, throw objective
Utility.Wait(3.0)

if !GetStageDone(210)
  kmyquest.CheckCombatTargetsForObjective()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set objective if player hasn't been kicked from faction
if !GetStageDone(600) && !GetStageDone(205) && !GetStageDone(300) && !GetStageDone(400)
  Actor Defender01 = Alias_Defender01.GetActorRef()
  Actor Player = Game.GetPlayer() 

  ;If defenders are currently enemies of player, don't throw objective
  if Defender01.GetFactionReaction(Player) != 1
      SetObjectiveDisplayed(200)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN AUTOCAST TYPE RECheckpointQuestScript
Quest __temp = self as Quest
RECheckpointQuestScript kmyQuest = __temp as RECheckpointQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RemoveDamageSpell()

;Player has attacked a character. If assault hasn't started, start it now
if !GetStageDone(200)
  debug.trace(self + "Starting assault from stage 225 - Player attack")
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Debug.Trace("Attackers faction won!")
((self as Quest) as RECheckpointQuestScript).AssignDefenderRole()

SetObjectiveDisplayed(200, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Debug.Trace("Defenders faction won!")
((self as Quest) as RECheckpointQuestScript).DefenderVictory()

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE RECheckpointQuestScript
Quest __temp = self as Quest
RECheckpointQuestScript kmyQuest = __temp as RECheckpointQuestScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")

SetObjectiveDisplayed(200, false)

kmyquest.CleanupActorVars()

(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_MapMarker Auto Const

RefCollectionAlias Property Alias_DefenderCollection Auto Const

ReferenceAlias Property Alias_Defender01 Auto Const

GlobalVariable Property RECheckpointMostRecentGlobal Auto Const
