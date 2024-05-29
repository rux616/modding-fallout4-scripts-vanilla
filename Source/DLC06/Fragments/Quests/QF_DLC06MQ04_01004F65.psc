;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06MQ04_01004F65 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; failsafe
setStage(50)
; control board objective
if GetStageDone(150) == false && GetStageDone(120) == false
  SetObjectiveDisplayed(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06MQ04Script
Quest __temp = self as Quest
DLC06:DLC06MQ04Script kmyQuest = __temp as DLC06:DLC06MQ04Script
;END AUTOCAST
;BEGIN CODE
; failsafe
setStage(50)

SetObjectiveCompleted(100)
kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; failsafe
setStage(50)

; control board objective
if GetStageDone(250) == false && GetStageDone(220) == false
  SetObjectiveDisplayed(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06MQ04Script
Quest __temp = self as Quest
DLC06:DLC06MQ04Script kmyQuest = __temp as DLC06:DLC06MQ04Script
;END AUTOCAST
;BEGIN CODE
; failsafe
setStage(50)

SetObjectiveCompleted(200)
kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; failsafe
setStage(50)

; control board objective
if GetStageDone(350) == false && GetStageDone(320) == false
  SetObjectiveDisplayed(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE DLC06:DLC06MQ04Script
Quest __temp = self as Quest
DLC06:DLC06MQ04Script kmyQuest = __temp as DLC06:DLC06MQ04Script
;END AUTOCAST
;BEGIN CODE
; failsafe
setStage(50)

SetObjectiveCompleted(300)
kmyQuest.CheckForCompletion()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BuildArea02Activator Auto Const Mandatory

ReferenceAlias Property Alias_BuildArea04Activator Auto Const Mandatory

ReferenceAlias Property Alias_BuildArea03Activator Auto Const Mandatory

ReferenceAlias Property Alias_BuildArea02ControlBoard Auto Const Mandatory

ReferenceAlias Property Alias_BuildArea03ControlBoard Auto Const Mandatory

ReferenceAlias Property Alias_BuildArea04ControlBoard Auto Const Mandatory
