;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01023397 Extends Quest Hidden Const

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

;Disable whatever was here
Alias_EnableMarker.GetRef().Disable()

;Initialize defenders only
((self as Quest) as RECheckpointQuestScript).InitDefenders()

;Defenders are your faction, assign defender loc ref
((self as Quest) as RECheckpointQuestScript).AssignDefenderLocRef()

;Fire off accompanying checkpoint story event
RECheckpointKeyword.SendStoryEvent(akLoc = Alias_CheckpointLocation.GetLocation(), akRef1 = Alias_Trigger.GetRef())

;And we're done here...
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
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_MapMarker Auto Const

Keyword Property RECheckpointKeyword Auto Const

LocationAlias Property Alias_CheckpointLocation Auto Const

ReferenceAlias Property Alias_EnableMarker Auto Const
