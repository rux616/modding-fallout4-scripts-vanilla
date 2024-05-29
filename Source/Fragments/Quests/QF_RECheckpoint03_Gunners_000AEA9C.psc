;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECheckpoint03_Gunners_000AEA9C Extends Quest Hidden Const

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
RECheckpointMostRecentGlobal.SetValue(3)

;Test for defender factions to see if we should do cool stuff
if Alias_Defender01.GetActorRef().IsInFaction(InstituteFaction)

  ((self as Quest) as RECheckpointQuestScript).RegisterDefendersForDeathEvents()

endif
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

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE RECheckpointQuestScript
Quest __temp = self as Quest
RECheckpointQuestScript kmyQuest = __temp as RECheckpointQuestScript
;END AUTOCAST
;BEGIN CODE
;Spawn reinforcements (currently hooked up only for Institute. Could be expanded for Brotherhood)

if !kmyquest.bReinforcementsBlocked
  kmyquest.bReinforcementsBlocked = true

  ;Make sure there's a living defender left
  ObjectReference Defender = kmyquest.GetLivingDefender()
    
  if Defender != None

    ;Have defender say reinforcements line
    (Defender as Actor).SayCustom(RECheckpointReinforcementTopic)

    ;Let line play
    Utility.Wait(2.0)

   ;Add appropriate LocRefTypes, actor values to reinforcements
    kmyquest.SetUpDefenderReinforcements()

    ;Add reinforcements to defender ref collection and REScript deadcount group
    Alias_DefenderCollection.AddRef(Alias_DefenderReinforcement01.GetRef())
    Alias_DefenderCollection.AddRef(Alias_DefenderReinforcement02.GetRef())
    ((self as Quest) as REScript).AdjustDeadCounts(0, 2)
    
    ;Turn on reinforcements
    Alias_DefenderReinforcement01.GetRef().Enable()
    Alias_DefenderReinforcement02.GetRef().Enable()
    kmyquest.bReinforcementsSpawned = true

    ;Trigger teleport spell
    (Alias_DefenderReinforcement01.GetRef() as TeleportActorScript).teleportin()
    (Alias_DefenderReinforcement02.GetRef() as TeleportActorScript).teleportin()
  endif
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

Actor DefRein01 = Alias_DefenderReinforcement01.GetActorRef()
Actor DefRein02 = Alias_DefenderReinforcement02.GetActorRef()

;If the reinforcements are still disabled, kill 'em. Otherwise, make sure they have the right stats
if DefRein01.IsDisabled()
  debug.trace(self+ "Deleting reinforcement 01")
  DefRein01.Delete()
elseif !DefRein01.IsDead()
  if !DefRein01.HasLocRefType(RECheckpointDefender)
    debug.trace(self + "Givng reinforcement 01 ref type")
    DefRein01.SetLocRefType(Alias_CheckpointLocation.GetLocation(), RECheckpointDefender)
  endif

  if !DefRein01.IsInFaction(RECheckpointOwnerFaction)
    debug.trace(self + "Givng reinforcement 01 owner faction")
    DefRein01.AddToFaction(RECheckpointOwnerFaction)
  endif

  if DefRein01.GetValue(RECheckpointRole) != 0
    debug.trace(self + "Givng reinforcement 01 checkpoint role")
    DefRein01.SetValue(RECheckpointRole, 0)
  endif
endif 

if DefRein02.IsDisabled()
  debug.trace(self + "Deleting reinforcement 02")
  DefRein02.Delete()
elseif !DefRein02.IsDead()
  if !DefRein02.HasLocRefType(RECheckpointDefender)
    debug.trace(self + "Givng reinforcement 02 loc ref")
    DefRein02.SetLocRefType(Alias_CheckpointLocation.GetLocation(), RECheckpointDefender)
  endif

  if !DefRein02.IsInFaction(RECheckpointOwnerFaction)
    debug.trace(self + "Givng reinforcement 02 owner faction")
    DefRein02.AddToFaction(RECheckpointOwnerFaction)
  endif

  if DefRein02.GetValue(RECheckpointRole) != 0
    debug.trace(self + "Givng reinforcement 02 checkpoint role")
    DefRein02.SetValue(RECheckpointRole, 0)
  endif
endif

(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

RefCollectionAlias Property Alias_DefenderCollection Auto Const

ReferenceAlias Property Alias_Defender01 Auto Const

Faction Property InstituteFaction Auto Const

ReferenceAlias Property Alias_DefenderReinforcement01 Auto Const

ReferenceAlias Property Alias_DefenderReinforcement02 Auto Const

ReferenceAlias Property Alias_Defender03Marker Auto Const

ReferenceAlias Property Alias_Defender04Marker Auto Const

Keyword Property RECheckpointReinforcementTopic Auto Const

GlobalVariable Property RECheckpointMostRecentGlobal Auto Const

ActorValue Property RECheckpointRole Auto Const

LocationRefType Property RECheckpointDefender Auto Const

Faction Property RECheckpointOwnerFaction Auto Const

LocationAlias Property Alias_CheckpointLocation Auto Const Mandatory
