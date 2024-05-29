;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0100E1F1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Typical Startup.
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Start one of the Treasure Hunt subquests.
RETriggerScript trig = (Alias_TRIGGER.GetReference() as RETriggerScript)
REEncounterTypeTreasureHunt.SendStoryEvent(None, trig, None, trig.MyLocationID, trig.EventNum)

;Note that this quest creates only a DefaultDummy marker. The subquests do everything else.
;When this quest's DefaultDummy unloads, it shuts down.
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
;Typical Shutdown.
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()

;Notify the Treasure Hunt subquest that the master quest has shut down.
;Stage 20 on all of the subquests serves this purpose.
((Self as Quest) as RESceneTreasureHuntMasterScript).TreasureHuntSubquest.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

Keyword Property RETreasureHunt Auto Const

Keyword Property REEncounterTypeTreasureHunt Auto Const
