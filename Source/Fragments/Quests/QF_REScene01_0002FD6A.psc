;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REScene01_0002FD6A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
kmyQuest.REParent.KillWithForce(Alias_DeadGuy.GetActorRef())
Alias_DeadGuy.GetReference().AddItem(Alias_Note.GetReference())
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
; mark quest as triggered so it won't run again
kmyQuest.REParent.bREScene01Triggered = true
; move item from holding cell to real container
Alias_Container.GetRef().AddItem(Alias_Item.GetRef())
; don't shut down on unload
kmyQuest.StopQuestWhenAliasesUnloaded = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; in case didn't pick up yet (reading from inventory)
setstage(50)
; give objective
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; player gets item
SetObjectiveCompleted(10)
Stop()
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
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()

; delete the item if player never found note
if GetStage() < 50
	Alias_Item.GetRef().Delete()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_DeadGuy Auto Const

ReferenceAlias Property Alias_Note Auto Const

LocationAlias Property Alias_Dungeon Auto Const

ReferenceAlias Property Alias_Item Auto Const

ReferenceAlias Property Alias_HoldingCellMarker Auto Const

ReferenceAlias Property Alias_Container Auto Const
