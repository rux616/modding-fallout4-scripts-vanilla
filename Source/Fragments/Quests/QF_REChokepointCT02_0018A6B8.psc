;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepointCT02_0018A6B8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move Stash from HoldingCell
Alias_Merchant01.GetRef().MoveTo(Alias_ChokepointMarkerA1.GetRef())
Alias_Guard01.GetRef().MoveTo(Alias_ChokepointMarkerA2.GetRef())
Alias_Guard02.GetRef().MoveTo(Alias_ChokepointMarkerA3.GetRef())

;Set REParent variable to show player has met Stash. Enable RETravelCT06 to run.
kmyQuest.REParent.bREChokepointCT02MetStash = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set when the player enters the trigger volume, representing
;the guarded/checkpoint area.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Set variable so this quest will no longer run.
;Allows for the next random encounter to run: RETravelCT06.
kmyQuest.REParent.bREChokepointCT02MetStash = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
Alias_Guard01.GetActorRef().EvaluatePackage()
Alias_Guard02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Stops remaining chained Random Encounters from running.
kmyQuest.REParent.bREChokepointCT02PCHitOrStole = true
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
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;This quest only runs once.

;Move Stash, Lexa, and Simon back to HoldingCell
Alias_Merchant01.GetRef().MoveTo(REHoldingCellMarker)
Alias_Guard01.GetRef().MoveTo(REHoldingCellMarker)
Alias_Guard02.GetRef().MoveTo(REHoldingCellMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Merchant01 Auto Const

ReferenceAlias Property Alias_Guard01 Auto Const

ReferenceAlias Property Alias_Guard02 Auto Const

ReferenceAlias Property Alias_ChokepointMarkerA1 Auto Const

ObjectReference Property REHoldingCellMarker Auto Const

ReferenceAlias Property Alias_ChokepointMarkerA2 Auto Const

ReferenceAlias Property Alias_ChokepointMarkerA3 Auto Const
