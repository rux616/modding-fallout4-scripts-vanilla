;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01121E54 Extends Quest Hidden Const

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

;Set RECheckpointMostRecentGlobal to prevent this one from appearing again i
RECheckpointMostRecentGlobal.SetValue(14)

;Test defender faction to fire off cool stuff
if Alias_Defender01.GetActorRef().IsInFaction(MinutemenFaction) && (Alias_ArtilleryWorkshop01 != None)
  
;  if Utility.RandomInt(0, 100) < 50
;    Alias_Attacker01Marker.GetRef().PlaceAtMe(ArtillerySmokeFlareExplosion)
    ;debug.messagebox("Spawned Smoke Flare")
;  endif
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

ReferenceAlias Property Alias_ArtilleryWorkshop01 Auto Const

ReferenceAlias Property Alias_Attacker01Marker Auto Const

Explosion Property ArtillerySmokeFlareExplosion Auto Const

GlobalVariable Property RECheckpointMostRecentGlobal Auto Const
