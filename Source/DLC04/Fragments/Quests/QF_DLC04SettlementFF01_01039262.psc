;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04SettlementFF01_01039262 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Fires when the quest starts, which is when the player changes locations into the hub
; This is tracked from the DLC04HubFF01PlayerAliasScript in the DLC04DialogueSettlement quest

Utility.Wait(5)

; Play the alarm bell
ObjectReference[] ExteriorFireAlarms = DLC04ColaCarsExteriorAlarmSource.GetLinkedRefChain(LinkCustom01)
int i = 0
While (i < ExteriorFireAlarms.Length)
     (ExteriorFireAlarms[i] as DLC04:DLC04FireAlarmLightScript).PlayLights()
     i = i + 1
EndWhile

; If this is the first time the quest has run, pop the objective to ask the guards about the alarm
if DLC04FF01GlobalRepeater.GetValue() == 0
   DLC04FF01MiscObjectiveHolder.SetStage(10)
else
   SetObjectiveDisplayed(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(5)
   SetObjectiveCompleted(5)
endif

SetObjectiveDisplayed(10)

DLC04FF01MiscObjectiveHolder.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

; Shutting down DLC04_NUK001_ArenaManager

DLC04_NUK001_ArenaManager.Stop()
While DLC04_NUK001_ArenaManager.IsRunning()
   Debug.Trace("Waiting")
   Utility.Wait(0.5)
endWhile

While !DLC04_NUK001_ArenaManager.IsRunning()
   Debug.Trace("Restarting")
   DLC04_NUK001_ArenaManager.SetStage(10)
   Utility.Wait(0.5)
endWhile

Debug.Trace("Restarted")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
DLC04_NUK001_ArenaManager.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
DLC04_NUK001_ArenaManager.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set if the player tells Fitsch that he doens't want to do the arena battle

CompleteAllObjectives()
DLC04FF01Global.SetValue(0)
DLC04FF01GlobalRepeater.SetValue(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Set when the player defeats the challenger in the arena

CompleteAllObjectives()
DLC04FF01Global.SetValue(0)
DLC04FF01GlobalRepeater.SetValue(1)
Stop()
; xp award?
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04_NUK001_ArenaManager Auto Const Mandatory

GlobalVariable Property DLC04FF01Global Auto Const Mandatory

GlobalVariable Property DLC04FF01GlobalRepeater Auto Const Mandatory

Quest Property DLC04FF01MiscObjectiveHolder Auto Const Mandatory

ObjectReference Property DLC04FF01KlaxonMarket Auto Const Mandatory

ObjectReference Property DLC04ColaCarsExteriorAlarmSource Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory
