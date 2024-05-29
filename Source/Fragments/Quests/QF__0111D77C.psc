;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0111D77C Extends Quest Hidden Const

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

;Set RECheckpointMostRecentGlobal to prevent this one from appearing again
RECheckpointMostRecentGlobal.SetValue(6)

;Test for defender factions to see if we should do cool stuff
if Alias_Defender01.GetActorRef().IsInFaction(MinutemenFaction) && (Alias_ArtilleryWorkshop01 != None)
;  
;  if Utility.RandomInt(0, 100) < 50
;    Alias_Attacker01Marker.GetRef().PlaceAtMe(ArtillerySmokeFlareExplosion)
    ;debug.messagebox("Spawned Smoke Flare")
;  endif

elseif Alias_Defender01.GetActorRef().IsInFaction(InstituteFaction)

  ((self as Quest) as RECheckpointQuestScript).RegisterDefendersForDeathEvents()

elseif Alias_Defender01.GetActorRef().IsInFaction(BoSFaction)

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;ObjectReference mapMarker = Alias_MapMarker.GetRef()
;if mapMarker
;	mapMarker.AddToMap()
;endif
;SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as RECheckpointQuestScript).StartAssault()
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

   ;Add appropriate LocRefTypes, actor values to reinforcements
    kmyquest.SetUpDefenderReinforcements()

    ;Add reinforcements to defender ref collection and REScript deadcount group
    Alias_DefenderCollection.AddRef(Alias_DefenderReinforcement01.GetRef())
    Alias_DefenderCollection.AddRef(Alias_DefenderReinforcement02.GetRef())
    ((self as Quest) as REScript).AdjustDeadCounts(0, 2)

    ;Let line play
    Utility.Wait(3.0)
    
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
;SetObjectiveCompleted(100)
Stop()
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

kmyquest.CleanupActorVars()

if !kmyquest.bReinforcementsSpawned
  Alias_DefenderReinforcement01.GetRef().Delete()
  Alias_DefenderReinforcement02.GetRef().Delete()
endif

(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_MapMarker Auto Const

RefCollectionAlias Property Alias_DefenderCollection Auto Const

ReferenceAlias Property Alias_Defender01 Auto Const

Faction Property MinutemenFaction Auto Const

Faction Property InstituteFaction Auto Const

Faction Property BoSFaction Auto Const

Explosion Property ArtillerySmokeFlareExplosion Auto Const

ReferenceAlias Property Alias_Attacker01Marker Auto Const

ReferenceAlias Property Alias_ArtilleryWorkshop01 Auto Const

ObjectReference Property REHoldingCellMarker Auto Const

ReferenceAlias Property Alias_DefenderReinforcement01 Auto Const

ReferenceAlias Property Alias_DefenderReinforcement02 Auto Const

ReferenceAlias Property Alias_Defender03Marker Auto Const

ReferenceAlias Property Alias_Defender04Marker Auto Const

Keyword Property RECheckpointReinforcementTopic Auto Const

GlobalVariable Property RECheckpointMostRecentGlobal Auto Const
