;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECheckpointMinWon01_Init_000AC513 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
; tell script about trigger since we're not starting from a story event
;RETriggerScript myTrigger = Alias_Trigger.GetRef() as RETriggerScript
;kmyQuest.SetTrigger(myTrigger)

; NOTE: this has to be called before Startup so myTrigger is set on REScript
;kmyquest.Startup()

;Disable whatever was here
Alias_EnableMarker.GetRef().Disable()

;Initialize defenders only
((self as Quest) as RECheckpointQuestScript).InitDefenders()

;Defenders are your faction, assign defender loc ref
((self as Quest) as RECheckpointQuestScript).AssignDefenderLocRef()

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

;Rearm Trigger
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()

kmyquest.CleanupActorVars()

; only for init quests
kmyquest.InitializeDone()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_EnableMarker Auto Const
