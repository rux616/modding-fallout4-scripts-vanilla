;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelCT06_0018B8A1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;move Merchant into position
Alias_Merchant01.GetRef().MoveTo(Alias_TravelMarkerA1.GetRef())
Alias_Guard01.GetRef().MoveTo(Alias_TravelMarkerA2.GetRef())
Alias_Guard02.GetRef().MoveTo(Alias_TravelMarkerA3.GetRef())
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
;Stops remaining chained Random Encounters from running.
kmyQuest.REParent.bREChokepointCT02PCHitOrStole = true
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
;Set variable on REParent quest so RECampCT05 will run.
kmyQuest.REParent.bRETraveLCT06SimonCutOff = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Set variable on REParent quest so RECampCT05 will run.
kmyQuest.REParent.bRETraveLCT06SimonIgnored = True
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

; move merchant back to holding cell
Alias_Merchant01.GetRef().MoveToMyEditorLocation()
Alias_Guard01.GetRef().MoveToMyEditorLocation()
Alias_Guard02.GetRef().MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

ReferenceAlias Property Alias_Merchant01 Auto Const

ReferenceAlias Property Alias_TravelMarkerA2 Auto Const

ReferenceAlias Property Alias_TravelMarkerA3 Auto Const

ReferenceAlias Property Alias_Guard01 Auto Const

ReferenceAlias Property Alias_Guard02 Auto Const
